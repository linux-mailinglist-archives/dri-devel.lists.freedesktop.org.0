Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEMhOJCEnWmVQQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:59:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731C185C8C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19B10E550;
	Tue, 24 Feb 2026 10:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VbrKe0yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6A10E557;
 Tue, 24 Feb 2026 10:59:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F3996445AD;
 Tue, 24 Feb 2026 10:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E739C19422;
 Tue, 24 Feb 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771930762;
 bh=xHuO9dZUg3u47qLBK3D2MlOJCC3kPvJ/38LpT6sPkj0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VbrKe0yp9y+WJEGVLzVGs2Y2nuxk0ioWYpUD3HviFBYQe8y63wtxFZxUnKh9F3Szz
 ToPwfIMpJNEsMijsq55rbB2XnmLQ5bdsKJg8ETBa24HUMkPZQE1xwbLm5kQe3UEIDQ
 EzpJJuluFpwMKHmreJ4Nizc1Ak4R71Jo2OnFowe9ORxFwdKmtXjSXWQJySh4yZ0NSs
 qG8hRzspTEBBDsG07249NznfLXx7xZGB1PkmEnbXjsD0J4tl9DM99TQXOLEPMruney
 P4w8KnSu66hDn+LjDbhRckY3g/9FSskAYc91M6srPp3QovFcDi3c3l83ysJP6S8M54
 7E3zsbUuDo5Tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:49 +0100
Subject: [PATCH 10/14] drm/arm: komeda: Convert to drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-10-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5472; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xHuO9dZUg3u47qLBK3D2MlOJCC3kPvJ/38LpT6sPkj0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW9JeMiinCG2M6jhhd/DNpxXNdxjvli8/P9eq8oj93
 uyLPF57O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEakoZG2Zo+btPtlzfv8jv
 yNF76UmX0y2u/j7800/2v7BftN3+S+YfVHVZbBSWteRtnvhJ1JPRlrGa/cub6Me6WYr280/svWH
 JkMs7f9pG12v8/2+96ntZ8tJJN6tY0pX3jc0KOcWatXzeeysB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8731C185C8C
X-Rspamd-Action: no action

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main different is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_component.c     | 14 +++++++-------
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c           |  2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h       |  5 +++--
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c |  2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 67e5d3b4190f62549bc8da700deb4b15e138b515..27ca2930cdac6e76a058102ea2c1d8306d85e751 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -1078,15 +1078,15 @@ static void d71_improc_update(struct komeda_component *c,
 	}
 
 	mask |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
 
 	/* config color format */
-	if (st->color_format == DRM_COLOR_FORMAT_YCBCR420)
+	if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422 | IPS_CTRL_CHD420;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR422)
+	else if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
 		ctrl |= IPS_CTRL_YUV | IPS_CTRL_CHD422;
-	else if (st->color_format == DRM_COLOR_FORMAT_YCBCR444)
+	else if (st->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
 		ctrl |= IPS_CTRL_YUV;
 
 	malidp_write32_mask(reg, BLK_CONTROL, mask, ctrl);
 }
 
@@ -1143,16 +1143,16 @@ static int d71_improc_init(struct d71_dev *d71,
 		return PTR_ERR(c);
 	}
 
 	improc = to_improc(c);
 	improc->supported_color_depths = BIT(8) | BIT(10);
-	improc->supported_color_formats = DRM_COLOR_FORMAT_RGB444 |
-					  DRM_COLOR_FORMAT_YCBCR444 |
-					  DRM_COLOR_FORMAT_YCBCR422;
+	improc->supported_color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+					  BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 	value = malidp_read32(reg, BLK_INFO);
 	if (value & IPS_INFO_CHD420)
-		improc->supported_color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		improc->supported_color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	improc->supports_csc = true;
 	improc->supports_gamma = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 5a66948ffd24343cfc144e9b500679fd0c6bf43b..e78604469ef74800a4cac1e854821578b7e7bce8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -38,11 +38,11 @@ void komeda_crtc_get_color_config(struct drm_crtc_state *crtc_st,
 			min_bpc = conn_bpc;
 	}
 
 	/* connector doesn't config any color_format, use RGB444 as default */
 	if (!conn_color_formats)
-		conn_color_formats = DRM_COLOR_FORMAT_RGB444;
+		conn_color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 
 	*color_depths = GENMASK(min_bpc, 0);
 	*color_formats = conn_color_formats;
 }
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
index ac8725e248537e5737d16cd36860401c42073500..dbe93894b2f6a193e24963d497ebb7b717ce3ebb 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
@@ -315,20 +315,21 @@ struct komeda_splitter_state {
 	u16 overlap;
 };
 
 struct komeda_improc {
 	struct komeda_component base;
-	u32 supported_color_formats;  /* DRM_RGB/YUV444/YUV420*/
+	u32 supported_color_formats;  /* BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444/YUV444/YUV420) */
 	u32 supported_color_depths; /* BIT(8) | BIT(10)*/
 	u8 supports_degamma : 1;
 	u8 supports_csc : 1;
 	u8 supports_gamma : 1;
 };
 
 struct komeda_improc_state {
 	struct komeda_component_state base;
-	u8 color_format, color_depth;
+	enum drm_output_color_format color_format;
+	u8 color_depth;
 	u16 hsize, vsize;
 	u32 fgamma_coeffs[KOMEDA_N_GAMMA_COEFFS];
 	u32 ctm_coeffs[KOMEDA_N_CTM_COEFFS];
 };
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index f4e76b46ca327a1c5db9bdbdd9550b45190b30d8..6f9b10cc831ff748296b9ed30b6de398c90c4786 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -797,11 +797,11 @@ komeda_improc_validate(struct komeda_improc *improc,
 					 improc->supported_color_formats);
 			return -EINVAL;
 		}
 
 		st->color_depth = __fls(avail_depths);
-		st->color_format = BIT(__ffs(avail_formats));
+		st->color_format = __ffs(avail_formats);
 	}
 
 	if (kcrtc_st->base.color_mgmt_changed) {
 		drm_lut_to_fgamma_coeffs(kcrtc_st->base.gamma_lut,
 					 st->fgamma_coeffs);

-- 
2.52.0

