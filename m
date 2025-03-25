Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBEA6F714
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B66B10E537;
	Tue, 25 Mar 2025 11:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YokEgEfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC44510E562
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742903195; x=1774439195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1x79yEYreSGkC6yiWobsNWC0aoxRJJN2bDrRks2sCYs=;
 b=YokEgEfAsSmLU4Csi4JOf7k066gSa+aanTILb7+7L+eGoUQU2DrFEQ1/
 mm8gLDOALan3XwXR+CDwxqTIA7ic7MKMgqcYqIO4wFQG5CqyyOHu7oWMu
 0x5CVcv0k2re8sWwGfqxrOosOKMSyq4wAcWmK62Yn62/02NJLWSq0TYOQ
 gHsMm85Ojyr+IsPOTab/PfB2KlUXrMq3q2eke4Erx/Y4BaD5qIgApKeif
 ChLPFvvGcGQi6PwbXkwWbxtrxqhdMySrsgC5WaqN7mNzssnQcy7JZbAhw
 ItUBQvVIECZm8OKTzCBk04NtJguauNjwHdWlJ6ZvE+65PRihFn4r+M8zB A==;
X-CSE-ConnectionGUID: aUl52hjjQHiXJAXAsRaDgA==
X-CSE-MsgGUID: QjwSf6gESgKKuTOdyl1S6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44032638"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44032638"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:46:33 -0700
X-CSE-ConnectionGUID: RhJWMDMJSdGyIUGNHYtE8A==
X-CSE-MsgGUID: RaxQvUIDTTK+1v9j7sYoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124529977"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:46:21 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 stable@vger.kernel.org, Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix warning in ivpu_ipc_send_receive_internal()
Date: Tue, 25 Mar 2025 12:42:19 +0100
Message-ID: <20250325114219.3739951-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Warn if device is suspended only when runtime PM is enabled.
Runtime PM is disabled during reset/recovery and it is not an error
to use ivpu_ipc_send_receive_internal() in such cases.

Fixes: 5eaa49741119 ("accel/ivpu: Prevent recovery invocation during probe and resume")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 0e096fd9b95d..39f83225c181 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -302,7 +302,8 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 	struct ivpu_ipc_consumer cons;
 	int ret;
 
-	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
+	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev) &&
+		    pm_runtime_enabled(vdev->drm.dev));
 
 	ivpu_ipc_consumer_add(vdev, &cons, channel, NULL);
 
-- 
2.43.0

