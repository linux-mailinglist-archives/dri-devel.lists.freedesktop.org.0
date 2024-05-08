Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B858BFEBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF710FE9D;
	Wed,  8 May 2024 13:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7is4kDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5B810FE9D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174965; x=1746710965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QnvZit/jTxt69n640qqRkdorb0dKDTV8lrDJ3k3eMaA=;
 b=Q7is4kDnYKrA3Ke0m/+GNONOZgqnEPYsfMwVjOfvOD2C7K+z1j7c2gHB
 2AJqSBo+B93FCUDN3jxx7MKZDuZvL5zCcT2fZPRS5M67k6zegHqktpOZH
 Wza3fTEkWHGsy65elVU3tJSKMMLFTPln3CIx3u+gsq84BTGnvujv0FLiv
 JYb20CAiR6E9ImKm5ddwuHZNA5JGx5bYPo9S4ZEgOq+cN6JdQUIq+9LfI
 th/Ej+ky+g4TVJSngBYbciJ0IqDIxWrNR9VW0xH3HjrbKzhU6J4IuUVUo
 n/FCBtVHBkQDduuDxthTAjGaAodIF9Y+9s1b4DNMtoeDvc7Fpc5bnKD33 Q==;
X-CSE-ConnectionGUID: 3V9n4gptSBKED9v5bBaIyA==
X-CSE-MsgGUID: RaSIlqcySieOCWf4EuFZeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21634305"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21634305"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:29:24 -0700
X-CSE-ConnectionGUID: hplDGA5MQFOEC41MeW5Y8g==
X-CSE-MsgGUID: /6Eti19GR/mJUghSzZmxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29470036"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:29:22 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 11/12] accel/ivpu: Increase reset counter when warm boot fails
Date: Wed,  8 May 2024 15:29:20 +0200
Message-ID: <20240508132920.2388942-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

