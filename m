Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC288C20B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239E10E303;
	Fri, 10 May 2024 09:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuKTDiIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3982310E303
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715332722; x=1746868722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ge6WU1X9gAWStn5js2JeTP0P9zmHBUJkDp1flMKmIaY=;
 b=YuKTDiIYPrOuHts8LtAT9AOsjyBAmwiFsYjMhaMETnsO0PzSKGQRaCOQ
 buh3kSC2Wcf6sEadMxrqb+khrBOGgT/y/aeMLdKS0L8kn1L6CjMrKNI4W
 ynxD0nloasXgpLbr5jggbUkSgQpVRtinsHvjHYOuwblR4Qe8CD7Ms7Ssm
 yWpqPtFFgjuOSCmqVvrN0FHiH+6jldvKMFhHwrpsA2OGNidnwU7tU98oy
 U28JdPAp5IihFdleJFDUEdJnF8S+1XIm5gJYLVqEf6JamV/VpC3tOvMCB
 IfrAUMNOaMSCJHGPqHMsfG9OTYVZMYR3Zcx8TyebFSwA5xbCJOWlRvopK A==;
X-CSE-ConnectionGUID: nQyVbTk0RTWKZsiXt2nwFA==
X-CSE-MsgGUID: htR4qhGGS+OtcdChiJtHVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33815799"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="33815799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:18:41 -0700
X-CSE-ConnectionGUID: H0LkcShbQCG/u/92DwD36A==
X-CSE-MsgGUID: Aqr/DSvMTFyQPhR8SYR+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="34089833"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:18:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/edid: rename drm_do_probe_ddc_edid() to ddc_read_block()
Date: Fri, 10 May 2024 12:18:35 +0300
Message-Id: <20240510091835.3401585-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The "do probe" naming is confusing when it's really about reading a
block via DDC. Rename accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4f54c91b31b2..2e106876255f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2124,7 +2124,7 @@ static struct edid *edid_filter_invalid_blocks(struct edid *edid,
 
 #define DDC_SEGMENT_ADDR 0x30
 /**
- * drm_do_probe_ddc_edid() - get EDID information via I2C
+ * ddc_read_block() - get EDID information via I2C
  * @data: I2C device adapter
  * @buf: EDID data buffer to be filled
  * @block: 128 byte EDID block to start fetching from
@@ -2135,7 +2135,7 @@ static struct edid *edid_filter_invalid_blocks(struct edid *edid,
  * Return: 0 on success or -1 on failure.
  */
 static int
-drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
+ddc_read_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
 	struct i2c_adapter *adapter = data;
 	unsigned char start = block * EDID_LENGTH;
@@ -2610,7 +2610,7 @@ drm_probe_ddc(struct i2c_adapter *adapter)
 {
 	unsigned char out;
 
-	return (drm_do_probe_ddc_edid(adapter, &out, 0, 1) == 0);
+	return ddc_read_block(adapter, &out, 0, 1) == 0;
 }
 EXPORT_SYMBOL(drm_probe_ddc);
 
@@ -2635,7 +2635,7 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
 		return NULL;
 
-	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
+	edid = _drm_do_get_edid(connector, ddc_read_block, adapter, NULL);
 	drm_connector_update_edid_property(connector, edid);
 	return edid;
 }
@@ -2716,7 +2716,7 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
 		return NULL;
 
-	drm_edid = drm_edid_read_custom(connector, drm_do_probe_ddc_edid, adapter);
+	drm_edid = drm_edid_read_custom(connector, ddc_read_block, adapter);
 
 	/* Note: Do *not* call connector updates here. */
 
@@ -2877,7 +2877,7 @@ const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter)
 	if (!base_block)
 		return NULL;
 
-	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
+	status = edid_block_read(base_block, 0, ddc_read_block, adapter);
 
 	edid_block_status_print(status, base_block, 0);
 
-- 
2.39.2

