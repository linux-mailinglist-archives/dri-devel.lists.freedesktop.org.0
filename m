Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A798AD7D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B9510E591;
	Mon, 30 Sep 2024 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9IOu15e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF3E10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726043; x=1759262043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nElHSdrcg62KOmMHeYPBwkLwMTMmDRqM82VWYAo0cNQ=;
 b=c9IOu15e76nkIqkSwqqYkUNtHFJsSYsqf5KsUXFqurwQr6/Ig0lXqgBs
 K4s4rtacPFisVe7RePauPyjfwBVGZWbQqzCHV8pckIgo5Z/9nYgVpqxVU
 wnhavgqTfM48LG2okh4mGwExX0As55LO6E06ZfMvv3PbvlOHORhaFdjQ5
 iv+HEJzzZzcMWUvsIcK1EZ78l+D4V9zF5GKlhPxZ0l5ESo6YKuHlrvH7g
 9g6cenvkhh++O1fP/LvKbtGlEY6ImBdhuFWg+9Shkd4Nu6sb0H2Pwa5qz
 VKUQrfZ/0v2yaZO6U/KW0tO36s7whxUgUBYaPHDlNfraPzifDIfXtMB5h w==;
X-CSE-ConnectionGUID: bjgsku3wSoCwNrwiEivHeQ==
X-CSE-MsgGUID: 06IuNQUlSwqfoEQsIozJqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962367"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:03 -0700
X-CSE-ConnectionGUID: wyDTWF/uTWy/6MHPeaSQrg==
X-CSE-MsgGUID: mAE91qhPRFm/lQJfXwmurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370220"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:01 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 24/31] accel/ivpu: Remove invalid warnings
Date: Mon, 30 Sep 2024 21:53:15 +0200
Message-ID: <20240930195322.461209-25-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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

