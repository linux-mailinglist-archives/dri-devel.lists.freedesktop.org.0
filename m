Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPNSCIo1p2k9fwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81C1F5F18
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332110E8A5;
	Tue,  3 Mar 2026 19:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pIYz/Lok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F387710E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 19:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772565890;
 bh=TdL3qi1XZoRUkEhlDje197eYBeAeHdWh7ZI+GBhVUlI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pIYz/LokXh1S3ZtvsPvgGYKTW8Csdzq50vixmiJNWvRlRzsrEMXf47JB7/xsEEcML
 XV8pxEhTowhRzH3YfNL95py29/8BpkmWqYaZDGhLATYnPADG585Dn/jzkO+MdIvGek
 +Zr7/UuBZJguJpApNwHsQ2JV2eYgdvifOHgC9zWjmPOI9c5t2tBaNGeSNWx7qLULTv
 njOxn3inFXByLU7jYmmwuZKWC3EATpC8xRsJru8nV5E9waxdNP3qY93rt/ry3iKD3X
 Yts6BmyC+7vbK0gpTYyFuczots2c/bSnbCphvTEAa4ZW+j247BBHSS40kflB13Q3jY
 B+2v3FRONN4lg==
Received: from localhost (unknown [86.123.23.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9440A17E0E30;
 Tue,  3 Mar 2026 20:24:50 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 03 Mar 2026 21:24:18 +0200
Subject: [PATCH v8 2/4] drm: Add CRTC background color property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-rk3588-bgcolor-v8-2-fee377037ad1@collabora.com>
References: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
In-Reply-To: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
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
X-Rspamd-Queue-Id: 9E81C1F5F18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:jani.nikula@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:matthew.d.roper@intel.com,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,intel.com:email,cknow-tech.com:email]
X-Rspamd-Action: no action

Some display controllers can be hardware programmed to show non-black
colors for pixels that are either not covered by any plane or are
exposed through transparent regions of higher planes.  This feature can
help reduce memory bandwidth usage, e.g. in compositors managing a UI
with a solid background color while using smaller planes to render the
remaining content.

To support this capability, introduce the BACKGROUND_COLOR standard DRM
mode property, which can be attached to a CRTC through the
drm_crtc_attach_background_color_property() helper function.

Additionally, define a 64-bit ARGB format value to be built with the
help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
color components can be extracted with desired precision using the
corresponding DRM_ARGB64_GET*() macros.

Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c              |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 39 +++++++++++++--
 drivers/gpu/drm/drm_mode_config.c         |  6 +++
 include/drm/drm_blend.h                   |  4 +-
 include/drm/drm_crtc.h                    | 12 +++++
 include/drm/drm_mode_config.h             |  5 ++
 include/uapi/drm/drm_mode.h               | 80 +++++++++++++++++++++++++++++++
 9 files changed, 147 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 04925166df98..4a1e77773f80 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -475,6 +475,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
 	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
 	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
+	drm_printf(p, "\tbackground_color=%llx\n", state->background_color);
 
 	if (crtc->funcs->atomic_print_state)
 		crtc->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bd6faa09f83b..76746ad4a1bb 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -75,6 +75,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
 				     struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
+	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 87de41fb4459..5bd5bf6661df 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -454,6 +454,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == config->background_color_property) {
+		state->background_color = val;
 	} else if (property == config->prop_out_fence_ptr) {
 		s32 __user *fence_ptr = u64_to_user_ptr(val);
 
@@ -501,6 +503,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
+	else if (property == config->background_color_property)
+		*val = state->background_color;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 3b1f5f72885e..1f3af27d2418 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -191,10 +191,6 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
- * Note that all the property extensions described here apply either to the
- * plane or the CRTC (e.g. for the background color, which currently is not
- * exposed and assumed to be black).
- *
  * SCALING_FILTER:
  *     Indicates scaling filter to be used for plane scaler
  *
@@ -207,6 +203,25 @@
  *
  * Drivers can set up this property for a plane by calling
  * drm_plane_create_scaling_filter_property
+ *
+ * The property extensions described above all apply to the plane.  Drivers
+ * may also expose the following crtc property extension:
+ *
+ * BACKGROUND_COLOR:
+ *	Background color is set up with drm_crtc_attach_background_color_property(),
+ *	and expects a 64-bit ARGB value following DRM_FORMAT_ARGB16161616, as
+ *	generated by the DRM_ARGB64_PREP*() helpers. It controls the color of a
+ *	full-screen layer that exists below all planes. This color will be used
+ *	for pixels not covered by any plane and may also be blended with plane
+ *	contents as allowed by a plane's alpha values.
+ *	The background color defaults to black, and is assumed to be black for
+ *	drivers that do not expose this property. Although background color
+ *	isn't a plane, it is assumed that the color provided here undergoes the
+ *	CRTC degamma/CSC/gamma transformations applied after the planes blending.
+ *	Note that the color value includes an alpha channel, hence non-opaque
+ *	background color values are allowed, but since physically transparent
+ *	monitors do not (yet) exists, the final alpha value may not reach the
+ *	video sink or it may simply ignore it.
  */
 
 /**
@@ -621,3 +636,19 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_crtc_attach_background_color_property - attach background color property
+ * @crtc: drm crtc
+ *
+ * Attaches the background color property to @crtc.  The property defaults to
+ * solid black and will accept 64-bit ARGB values in the format generated by
+ * DRM_ARGB64_PREP*() helpers.
+ */
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc)
+{
+	drm_object_attach_property(&crtc->base,
+				   crtc->dev->mode_config.background_color_property,
+				   DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+}
+EXPORT_SYMBOL(drm_crtc_attach_background_color_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 84ae8a23a367..66f7dc37b597 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -380,6 +380,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.gamma_lut_size_property = prop;
 
+	prop = drm_property_create_range(dev, 0,
+					 "BACKGROUND_COLOR", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.background_color_property = prop;
+
 	prop = drm_property_create(dev,
 				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
 				   "IN_FORMATS", 0);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..c7e888767c81 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -31,8 +31,9 @@
 #define DRM_MODE_BLEND_COVERAGE		1
 #define DRM_MODE_BLEND_PIXEL_NONE	2
 
-struct drm_device;
 struct drm_atomic_state;
+struct drm_crtc;
+struct drm_device;
 struct drm_plane;
 
 static inline bool drm_rotation_90_or_270(unsigned int rotation)
@@ -58,4 +59,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc);
 #endif
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd6..312fc1e745d2 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,18 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @background_color:
+	 *
+	 * RGB value representing the CRTC's background color.  The background
+	 * color (aka "canvas color") of a CRTC is the color that will be used
+	 * for pixels not covered by a plane, or covered by transparent pixels
+	 * of a plane.  The value here should be built using DRM_ARGB64_PREP*()
+	 * helpers, while the individual color components can be extracted with
+	 * desired precision via the DRM_ARGB64_GET*() macros.
+	 */
+	u64 background_color;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 5e1dd0cfccde..687c0ee163d2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -836,6 +836,11 @@ struct drm_mode_config {
 	 * gamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *gamma_lut_size_property;
+	/**
+	 * @background_color_property: Optional CRTC property to set the
+	 * background color.
+	 */
+	struct drm_property *background_color_property;
 
 	/**
 	 * @suggested_x_property: Optional connector property with a hint for
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3693d82b5279..a4bdc4bd11bc 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -27,6 +27,9 @@
 #ifndef _DRM_MODE_H
 #define _DRM_MODE_H
 
+#include <linux/bits.h>
+#include <linux/const.h>
+
 #include "drm.h"
 
 #if defined(__cplusplus)
@@ -1549,6 +1552,83 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Put 16-bit ARGB values into a standard 64-bit representation that can be
+ * used for ioctl parameters, inter-driver communication, etc.
+ *
+ * If the component values being provided contain less than 16 bits of
+ * precision, use a conversion ratio to get a better color approximation.
+ * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
+ * the input and output precision, respectively.
+ * Also note bpc must be greater than 0.
+ */
+#define __DRM_ARGB64_PREP(c, shift)					\
+	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
+
+#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)				\
+({									\
+	__u16 mask = __GENMASK((bpc) - 1, 0);				\
+	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
+						__GENMASK(15, 0), mask);\
+	__DRM_ARGB64_PREP(conv, shift);					\
+})
+
+#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
+(									\
+	__DRM_ARGB64_PREP(alpha, 48) |					\
+	__DRM_ARGB64_PREP(red,   32) |					\
+	__DRM_ARGB64_PREP(green, 16) |					\
+	__DRM_ARGB64_PREP(blue,   0)					\
+)
+
+#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)		\
+({									\
+	__typeof__(bpc) __bpc = bpc;					\
+	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
+})
+
+/*
+ * Extract the specified color component from a standard 64-bit ARGB value.
+ *
+ * If the requested precision is less than 16 bits, make use of a conversion
+ * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
+ * output and input precision, respectively.
+ *
+ * If speed is more important than accuracy, use DRM_ARGB64_GET*_BPCS()
+ * instead of DRM_ARGB64_GET*_BPC() in order to replace the expensive
+ * division with a simple bit right-shift operation.
+ */
+#define __DRM_ARGB64_GET(c, shift)					\
+	((__u16)(((__u64)(c) >> (shift)) & __GENMASK(15, 0)))
+
+#define __DRM_ARGB64_GET_BPC(c, shift, bpc)				\
+({									\
+	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
+	__KERNEL_DIV_ROUND_CLOSEST(comp * __GENMASK((bpc) - 1, 0),	\
+				   __GENMASK(15, 0));			\
+})
+
+#define __DRM_ARGB64_GET_BPCS(c, shift, bpc)				\
+	(__DRM_ARGB64_GET(c, shift) >> (16 - (bpc)))
+
+#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
+#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
+#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
+#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
+
+#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
+
+#define DRM_ARGB64_GETA_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 0, bpc)
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.52.0

