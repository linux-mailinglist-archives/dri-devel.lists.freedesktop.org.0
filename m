Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657B9DEDB8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 01:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701810E377;
	Sat, 30 Nov 2024 00:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ai6A+FCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A910E36E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732924832;
 bh=puJiKU+qLxiAvpxZBNmrz9798z4jRJgq+rbdWEWlURU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ai6A+FCHL8CfariIHFrOaOu1ecbTsrjMIEhhYn/PlnUXJrGiJoGV3e/6KePfTRcPu
 /gkV31HceLDNURxqbaMnKXjkmn94UtaefP/IEsC+4pNwLz9R+ik3TL2dlQVUhfugVX
 9CaDEUIg1bG7iuj8Ff/ieRQ+mT55QHfYvEgf6qs7TAJ5weOiaM7tpLa6DyTKpTGDDH
 fZUhiiRWOQtj+sK24tDxvgt5RZNRBQLlqZMD66msRo1cEvMfCCeD2WJVH6UkZ+5esg
 WSon9HOhYxok7Ej7KbUjIXOh3s7J/HFxs5agnEqT4+XQqiA/90j8w4gFgy8PkzxNgS
 fIVDXA4qEF+bw==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1749A17E0E88;
 Sat, 30 Nov 2024 01:00:32 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 30 Nov 2024 01:56:34 +0200
Subject: [PATCH 3/3] drm/connector: hdmi: Use YUV420 output format as an
 RGB fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-conn-yuv-v1-3-254279a08671@collabora.com>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
In-Reply-To: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Introduce the switch to YUV420 when computing the best output format and
RGB cannot be supported for a given color depth.

While at it, add a minor improvement to the debug message indicating the
supported format.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 3a55881a544a519bb1254968db891c814f831a0f..b4e865e0680f35fd2d849536789f6c1f98a48258 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -304,7 +304,7 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
-	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+	drm_dbg_kms(dev, "%s output format supported with %u bpc (TMDS char rate: %llu Hz)\n",
 		    drm_hdmi_connector_get_output_format_name(fmt),
 		    bpc, conn_state->hdmi.tmds_char_rate);
 
@@ -319,15 +319,16 @@ hdmi_compute_format(const struct drm_connector *connector,
 {
 	struct drm_device *dev = connector->dev;
 
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
 	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
 		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
 		return 0;
 	}
 
+	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_YUV420)) {
+		conn_state->hdmi.output_format = HDMI_COLORSPACE_YUV420;
+		return 0;
+	}
+
 	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
 
 	return -EINVAL;

-- 
2.47.0

