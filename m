Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDCC65E56
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D70810E3F6;
	Mon, 17 Nov 2025 19:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MdKRq+YO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BBF10E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406780; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bKhjf1LPoDUsYRI/XVlndhGzahdCB7LFWKu+VFWUoE+saIvCo3tE2jWWmjQ6ZuFZFSz1Lfv4Icl+RdRkMw+MS/ib3EWDS/ol246AiPcdDtLJbrCqcnOI8la8nsQ/MC9q5L07RBsB1hsyIzjJEGFg0wRVTrx8NgP/1SdWrBs50FU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406780;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6vst0GacCoZY4XRI9Hn+td4UBzH0QM1v36mSY8yM3so=; 
 b=QUYN0P90ZnLmVWs+Rxc5AWsPSBTO5UEucQaWSeWuS6jKJGQ2OhCjygvb73ArbLCvoFGjk8cB1PRaETC1N2cmg3KYOiHXwAoIXB/hH/PBW3BZSvYvKozG6R4Ha7s2mcGLupAb7oM7+uFQkHUMkEdca2Xm2hpawLyDLUNzfG28POU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406780; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=6vst0GacCoZY4XRI9Hn+td4UBzH0QM1v36mSY8yM3so=;
 b=MdKRq+YOFGv6KUnGYMs0HcVtN7dHgwnm1U8CpFYF0Aa3SirZKSbgGQXvLO+ZdiA4
 kGV9fzcTfPeBSsCcmMrCeXPYmHLPLDeCCc1ZUDua7TXTII+FUzz7EaqIV5rtRDs0MYi
 nO3hBVagxYt1oOo1+z8ouk1cZ7Zf3aJAQrDEAGeE=
Received: by mx.zohomail.com with SMTPS id 1763406778281162.77930182909824;
 Mon, 17 Nov 2025 11:12:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:50 +0100
Subject: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

With the introduction of the supported_formats member in the
dw-hdmi-qp platform data struct, drivers that have access to this
information should now set it.

Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
supported color formats already exists. It just needs to be converted to
the appropriate HDMI_COLORSPACE_ mask.

This allows this information to be passed down to the dw-hdmi-qp core,
which sets it in the bridge it creates, and consequently will allow the
common HDMI bridge code to act on it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c9fe6aa3e3e3..7c294751de19 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
 
+static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
+					  DRM_COLOR_FORMAT_RGB444 |
+					  DRM_COLOR_FORMAT_YCBCR444;
+
+static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
+{
+	unsigned int res = 0;
+
+	if (fmt & DRM_COLOR_FORMAT_AUTO)
+		res |= BIT(HDMI_COLORSPACE_RGB);
+	if (fmt & DRM_COLOR_FORMAT_RGB444)
+		res |= BIT(HDMI_COLORSPACE_RGB);
+	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
+		res |= BIT(HDMI_COLORSPACE_YUV444);
+	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
+		res |= BIT(HDMI_COLORSPACE_YUV422);
+	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
+		res |= BIT(HDMI_COLORSPACE_YUV420);
+
+	return res;
+}
+
 static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
@@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	plat_data.phy_data = hdmi;
 	plat_data.max_bpc = 10;
 
+	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);
+
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 

-- 
2.51.2

