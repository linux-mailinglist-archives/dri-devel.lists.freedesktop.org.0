Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291EC611DDC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 01:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C987010E8F4;
	Fri, 28 Oct 2022 23:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A220710E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1666998012; x=1698534012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRt83h2It2p1I2P7BSYWVWdKe81tBx3PejaegH+3SaA=;
 b=l8sn46loqxxyJRYZfi7sSFrSinbitcOA3ozcN20nztLiwxpTdOPlHOF5
 nPDFh6Yqj6xNB4veaAFT2jAlEe2aCSdqTPrzOxeTERyw2UnAK19jVx/vY
 HJ88kKNeLDlyh10trSkeZKgHPcLijRvVvynbWACWrgoBVv4BiFeXebwV3 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2022 16:00:12 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 16:00:12 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 16:00:12 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Date: Fri, 28 Oct 2022 15:59:50 -0700
Message-ID: <20221028225952.160-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028225952.160-1-quic_jesszhan@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
drm_plane. In addition, add support for setting and getting the values
of these properties.

COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
represents the format of the color fill. Userspace can set enable solid
fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
framebuffer to NULL.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++
 drivers/gpu/drm/drm_blend.c       | 38 +++++++++++++++++++++++++++++++
 include/drm/drm_blend.h           |  2 ++
 include/drm/drm_plane.h           | 28 +++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..e1664463fca4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -544,6 +544,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
+	} else if (property == plane->color_fill_format_property) {
+		state->color_fill_format = val;
+	} else if (property == plane->color_fill_property) {
+		state->color_fill = val;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -616,6 +620,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
+	} else if (property == plane->color_fill_format_property) {
+		*val = state->color_fill_format;
+	} else if (property == plane->color_fill_property) {
+		*val = state->color_fill;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index b4c8cab7158c..b8c2b263fa51 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -616,3 +616,41 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+int drm_plane_create_color_fill_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "color_fill",
+					 0, 0xffffffff);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_fill_property = prop;
+
+	if (plane->state)
+		plane->state->color_fill = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_fill_property);
+
+int drm_plane_create_color_fill_format_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "color_fill_format",
+					 0, 0xffffffff);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_fill_format_property = prop;
+
+	if (plane->state)
+		plane->state->color_fill_format = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_fill_format_property);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..3e96f5e83cce 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+int drm_plane_create_color_fill_property(struct drm_plane *plane);
+int drm_plane_create_color_fill_format_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 89ea54652e87..dcbfdb0e1f71 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -116,6 +116,20 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/**
+	 * @color_fill_format:
+	 * Format of the color fill value.
+	 */
+	uint32_t color_fill_format;
+
+	/**
+	 * @color_fill:
+	 * Fill color of the plane with 0 as black and 0xffffffff as white.
+	 * Can be set by user by setting the COLOR_FILL property. See
+	 * drm_plane_create_color_fill_property() for more details.
+	 */
+	uint32_t color_fill;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -699,6 +713,20 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
+	/*
+	 * @color_fill_format_property:
+	 * Optional color fill format property for this plane. See
+	 * drm_plane_create_color_fill_format_property().
+	 */
+	struct drm_property *color_fill_format_property;
+
+	/*
+	 * @color_fill_property:
+	 * Optional color fill property for this plane. See
+	 * drm_plane_create_color_fill_property().
+	 */
+	struct drm_property *color_fill_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
-- 
2.38.0

