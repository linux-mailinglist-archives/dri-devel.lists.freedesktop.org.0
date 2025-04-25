Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8AA9C56F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D105110E96E;
	Fri, 25 Apr 2025 10:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H9yDFzh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369C710E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576903;
 bh=hQYEKr2zXDxP9bu34k8zWrcza/c11kUeCIqH5XVu/y4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=H9yDFzh5asVWhzjinXRaId1sFKkA1jIJldFHV34fEGDJIQj6w8MbOoaNw69Hbjn8B
 Q33QUa3IufkXd8+diK+u+gV09GeiRFTYKgpPq4kMDL9cjekF511sAzKg5enmU69cR0
 qgHxsfCayhrYQy89/ec+xKfr9pANUzRjGhUJFPcKcp9IVxWNdXycYisAKw3AunJwhK
 yK3vbjTLwJEeWoP3w0ZkOcCc4M1bFi7Qcwl2mTBECCBGMKZUHee9WYY3v1mCFIX1WU
 2D4rG7wpzXST86YraDYd2B1hHphqO2nRxt7srY6msLiMtquDT5P46X46tj3p5hDUaU
 2LOH7+xY93ozA==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id F184D17E36C2;
 Fri, 25 Apr 2025 12:28:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:56 +0300
Subject: [PATCH v4 05/23] drm/connector: hdmi: Factor out bpc and format
 computation logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-5-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

In preparation to support fallback to an alternative output format, e.g.
YUV420, when RGB cannot be used for any of the available color depths,
move the bpc try loop out of hdmi_compute_config() and, instead, make it
part of hdmi_compute_format(), while adding a new parameter to the
latter holding the output format to be checked and eventually set.

Since this helper now also changes hdmi.output_bpc in addition to
hdmi.output_format, highlight the extended functionality by renaming it
to hdmi_compute_format_bpc().

This improves code reusability and further extensibility, without
introducing any functional changes.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 60 ++++++++++++-------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index f54eb5c594cddbd67dfacb5e06d54e9ce7851013..9e0a468073acbb2477eff1abef1c09d63620afaa 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -605,45 +605,22 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 }
 
 static int
-hdmi_compute_format(const struct drm_connector *connector,
-		    struct drm_connector_state *conn_state,
-		    const struct drm_display_mode *mode,
-		    unsigned int bpc)
-{
-	struct drm_device *dev = connector->dev;
-
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
-	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
-		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
-		return 0;
-	}
-
-	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
-
-	return -EINVAL;
-}
-
-static int
-hdmi_compute_config(const struct drm_connector *connector,
-		    struct drm_connector_state *conn_state,
-		    const struct drm_display_mode *mode)
+hdmi_compute_format_bpc(const struct drm_connector *connector,
+			struct drm_connector_state *conn_state,
+			const struct drm_display_mode *mode,
+			unsigned int max_bpc, enum hdmi_colorspace fmt)
 {
 	struct drm_device *dev = connector->dev;
-	unsigned int max_bpc = clamp_t(unsigned int,
-				       conn_state->max_bpc,
-				       8, connector->max_bpc);
 	unsigned int bpc;
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
-		if (ret)
+		ret = hdmi_try_format_bpc(connector, conn_state, mode, bpc, fmt);
+		if (!ret)
 			continue;
 
 		conn_state->hdmi.output_bpc = bpc;
+		conn_state->hdmi.output_format = fmt;
 
 		drm_dbg_kms(dev,
 			    "Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
@@ -655,9 +632,32 @@ hdmi_compute_config(const struct drm_connector *connector,
 		return 0;
 	}
 
+	drm_dbg_kms(dev, "Failed. %s output format not supported for any bpc count.\n",
+		    drm_hdmi_connector_get_output_format_name(fmt));
+
 	return -EINVAL;
 }
 
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode)
+{
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       conn_state->max_bpc,
+				       8, connector->max_bpc);
+	int ret;
+
+	/*
+	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
+	 * devices, for modes that only support YCbCr420.
+	 */
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
+				      HDMI_COLORSPACE_RGB);
+
+	return ret;
+}
+
 static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
 				       struct drm_connector_state *conn_state)
 {

-- 
2.49.0

