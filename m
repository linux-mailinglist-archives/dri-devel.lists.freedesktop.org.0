Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B898403C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94A710E678;
	Tue, 24 Sep 2024 08:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvgRDKA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9110E668
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165927; x=1758701927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Gw7br5qQa3d+gUsZRv3A/3XPdb5pZWwadaT51uw4sM=;
 b=hvgRDKA/Fe9xSRrFJPzj9zBdcT0AoJ2kOKBlszkcWqijeblp3tUwq1ox
 M4AExU0+FaoSobAd3ViqWY66Iq0LxRBEBOTHdh20+9JXlbEYShnhlj+4r
 nW04Qx+6jBOYLh0qGDLm8GU7G3NnJnGNNY4L2/tA/4XcJYk4ExPFVgGlG
 UqBp73vDfdumZQCCRHs9wYbOgJjOTprD/5W9/7yD9Z1ultWsi02o3euku
 gWJ4+EKIWSq3Xh1qb923s1z/zPeWWK8cAhZsTk+SGd69N1TA/Yd8pWbSf
 Vdk6LnfNZFFDIYTh7yC5WQNSGiSVQCdHq5d30Lo4QIUuPocuiVe9wbQU7 g==;
X-CSE-ConnectionGUID: PaablCBuRhyGj7METPqsKw==
X-CSE-MsgGUID: V+JjwXneT3uMytZSZTXzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507001"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:47 -0700
X-CSE-ConnectionGUID: YOkEna/lTom0/0y3nNdJQQ==
X-CSE-MsgGUID: lMMmqSjkTH+E2GK8vwgEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170751"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:46 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 22/29] accel/ivpu: Remove invalid warnings
Date: Tue, 24 Sep 2024 10:17:47 +0200
Message-ID: <20240924081754.209728-23-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Warn in ivpu_file_priv_put() checks a pointer that is previously
accessed. Warn in ivpu_ipc_fini() can be triggered even in valid cases
where IPC is disabled upon closing the device.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 --
 drivers/accel/ivpu/ivpu_ipc.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 14c2412c6f8e6..dc983140128b4 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -117,8 +117,6 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link)
 	struct ivpu_file_priv *file_priv = *link;
 	struct ivpu_device *vdev = file_priv->vdev;
 
-	drm_WARN_ON(&vdev->drm, !file_priv);
-
 	ivpu_dbg(vdev, KREF, "file_priv put: ctx %u refcount %u\n",
 		 file_priv->ctx.id, kref_read(&file_priv->ref));
 
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index a4ebb761354c3..c8ae69a529c0d 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -533,7 +533,6 @@ void ivpu_ipc_fini(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 
-	drm_WARN_ON(&vdev->drm, ipc->on);
 	drm_WARN_ON(&vdev->drm, !list_empty(&ipc->cons_list));
 	drm_WARN_ON(&vdev->drm, !list_empty(&ipc->cb_msg_list));
 	drm_WARN_ON(&vdev->drm, atomic_read(&ipc->rx_msg_count) > 0);
-- 
2.45.1

