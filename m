Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA949EB1AB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 14:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4722310E8CF;
	Tue, 10 Dec 2024 13:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEc4BZvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048410E8CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733836188; x=1765372188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gs3pQyhAtuTtqsflnavxroyRBi2uR2QXMjWyUdGPln4=;
 b=HEc4BZvHwHLcQLQ+7qRUme5banzzMvVCss70Ncx+vUm7c/+Yvw4o2CKq
 20JK7YdvBTbKu4HB2AVSQMc7QSmud21+foJu7x4YZXnW9s9aiD0nLFdic
 BHAf+FiQoHvLiYq6CzVK1OT2gTJZW0GHlxZiCVgPv9IBXuIVUYDcrz+rk
 3aKeB3aVRk1E87EbKPGajRXf36DvG7MZ9LKnhoCSMaT4eeoNjf8Va3R9n
 kxn6FFvNhtCJdqboWs7AihxMLAwljWMTIU4V9BvxY5lxKcPC8MtYdRGSL
 S49mqvTrM3YVXZuP2bhJXzYIzapwDKg/1G7Enkz1fBIS/CYaOmrMH3knW w==;
X-CSE-ConnectionGUID: /KVv7vVXTX+VYBwtZEs5qg==
X-CSE-MsgGUID: /5u3ayurSpuyOek6bk3eUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34080125"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34080125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:48 -0800
X-CSE-ConnectionGUID: 5X3wo6H4SfqBm5AMrmYskw==
X-CSE-MsgGUID: 4NWQVyBYTqiXVgqKb+j15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95242050"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:46 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org, Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 3/3] accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()
Date: Tue, 10 Dec 2024 14:09:39 +0100
Message-ID: <20241210130939.1575610-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move pm_runtime_set_active() to ivpu_pm_inti() so when
ivpu_ipc_send_receive_internal() is executed before ivpu_pm_enable()
it already has correct runtime state, even if last resume was
not successful.

Fixes: 8ed520ff4682 ("accel/ivpu: Move set autosuspend delay to HW specific code")
Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index dbc0711e28d13..949f4233946c6 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -378,6 +378,7 @@ void ivpu_pm_init(struct ivpu_device *vdev)
 
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, delay);
+	pm_runtime_set_active(dev);
 
 	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
 }
@@ -392,7 +393,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
 {
 	struct device *dev = vdev->drm.dev;
 
-	pm_runtime_set_active(dev);
 	pm_runtime_allow(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
-- 
2.45.1

