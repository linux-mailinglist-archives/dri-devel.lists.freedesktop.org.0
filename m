Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A089E8C406C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A66810E728;
	Mon, 13 May 2024 12:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQXX7D6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96F410E720
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601892; x=1747137892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJxF92oKezHNKvZn7wqcWpcmzqJ2Fd907A5+VkL4okc=;
 b=OQXX7D6h1vyx4c/3WnwTnjDfm5RTKT3rYolI3mPfqac+p9LXel/F1I3Z
 w26QSPklu6ldMaj70ML83z7/BACYkSJcrNef9fnw3Qs3871ydD06uy7bg
 qnr/pplzU+ULBHUDNi/GaP2WhUmRCddJqE7vJ8fKsGJko8a39ot0PnqkM
 mmbcUh4jmJC3DH5fkTZKtzZWsV5WCih335eBCT/aLB10R4siaBwhMCPe8
 XBSgoYKv3RwAwDsRBSi5U1AVtE1Pn4sj+Fr1h8Zt1Eb2W8uieI7HJZoFA
 0pHBWHnsw0IrVJak/mQeHtKwTXHtmhITmJJ+CZeQ0WXpdSeVcTT8I3wUX w==;
X-CSE-ConnectionGUID: aDxW+Qw1T5+yEvFPDURvaw==
X-CSE-MsgGUID: FGMy7QdRT+iVwANZgg9ebQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131765"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:52 -0700
X-CSE-ConnectionGUID: unhkwd5IRBWhK2GiJygCKA==
X-CSE-MsgGUID: Nofrj2gVTM+oEnIpLxK6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341103"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:50 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 11/12] accel/ivpu: Increase reset counter when warm boot
 fails
Date: Mon, 13 May 2024 14:04:30 +0200
Message-ID: <20240513120431.3187212-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

Failed warm boot causes a cold boot that looses FW state and is
equivalent to a recovery or reset, so reset_counter should be
incremented in order for this failure to be detected by tests.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 7b2aa205fdec..02b4eac13f8b 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -264,6 +264,7 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 
 	if (!hw_is_idle) {
 		ivpu_err(vdev, "NPU failed to enter idle, force suspended.\n");
+		atomic_inc(&vdev->pm->reset_counter);
 		ivpu_fw_log_dump(vdev);
 		ivpu_pm_prepare_cold_boot(vdev);
 	} else {
-- 
2.43.2

