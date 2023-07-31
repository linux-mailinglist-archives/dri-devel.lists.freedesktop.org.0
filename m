Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE462769C00
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84B10E2C3;
	Mon, 31 Jul 2023 16:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216A810E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819995; x=1722355995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bvE6jIOtQ1PnMUTZQdBghwlPlJZrQmWa24uBRQGpj0=;
 b=GwyjXlwaVU/OTaJ1nI1saEO+Vnph4+jY+0v/jOlHmzUZ/YdFJCzt/545
 pVgv8NmlkNtSSDHwI4vh8uo7aSg6V7A/HtGWcwgGAu36JgpTywRLvFRIv
 v89Pvkqf0RZvR5AdD2KAuhz548zlzgJyM6Dp/tTanGpBlgkuVzqA6Ysx+
 Es+flqcu6btSUCGSN8sdviOp7d4mD1Bv7dWlv8LEz2UE4R2vUXT5o/tTq
 8YxykgTWipy1TpFTNzqTr83DXsXP4VM6qg4f6k9yH8D8qbryLclpQZzmS
 ARklSQEwHaKpi4AS5PUwRo2fuEdOI3YFtslJergNzk0duc9Y8FJkGiGq5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400007884"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400007884"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818396384"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="818396384"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:13 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Date: Mon, 31 Jul 2023 18:12:56 +0200
Message-Id: <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DRM_IVPU_PARAM_CAPABILITIES ioctl to query driver capabilities.
For now use it for identify metric streamer and new dma memory range
features. Currently upstream version of intel_vpu does not have those,
they will be added it the future.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 19 +++++++++++++++++++
 include/uapi/drm/ivpu_accel.h |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index fad607dbb2c6..d33eb17007bf 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -115,6 +115,22 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link)
 	kref_put(&file_priv->ref, file_priv_release);
 }
 
+static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param *args)
+{
+	switch (args->index) {
+	case DRM_IVPU_CAP_METRIC_STREAMER:
+		args->value = 0;
+		break;
+	case DRM_IVPU_CAP_DMA_MEMORY_RANGE:
+		args->value = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
@@ -174,6 +190,9 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_SKU:
 		args->value = vdev->hw->sku;
 		break;
+	case DRM_IVPU_PARAM_CAPABILITIES:
+		ret = ivpu_get_capabilities(vdev, args);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 839820aed87e..3e99b74eef04 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -60,6 +60,7 @@ extern "C" {
 #define DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID  10
 #define DRM_IVPU_PARAM_TILE_CONFIG	    11
 #define DRM_IVPU_PARAM_SKU		    12
+#define DRM_IVPU_PARAM_CAPABILITIES	    13
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
@@ -68,6 +69,9 @@ extern "C" {
 #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
 #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
 
+#define DRM_IVPU_CAP_METRIC_STREAMER	    1
+#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
+
 /**
  * struct drm_ivpu_param - Get/Set VPU parameters
  */
-- 
2.25.1

