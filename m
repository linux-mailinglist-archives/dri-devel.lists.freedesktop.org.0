Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100913BE4AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0E36E84C;
	Wed,  7 Jul 2021 08:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473CB6E856
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:49:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1678fZUn029506; Wed, 7 Jul 2021 10:48:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=eKU02lLY0IdlfNuBs4AUcL0xc5nbjziRkKjN9rzKsyc=;
 b=AqoF6xfkWkXmmWVurHnYVfBYkqlYJVj1/D314fUYSbG3NrL9hNrUHp4LUiUvfscE7yJM
 vt+q0vSF5BkS4ZoppINGfzSTk+z1aNRUOROI5qzkKXeLdQM4ZGnqYE1uP8lVOzf7cK7S
 Ea7cpaf4EV1cPw+T440TVJi8XUXiuRAQMENYUhoU9A70ALmWCZSGALYC4qz3Sc0fYOyY
 oHfW4au1ktMqjXcQlE/GXreWFVRVzGo/Sb7LWhJ2RBOFeE/e48RbCjdHmW1tCN/pVcnY
 T4ZuIfnWwjxMxuOcKTMkEijarX2adjCGR1ifxrNb/4BsPUk8rCoy+PPRQ5YgmSBKckfg Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39n8ysr1ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 10:48:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3E3E10002A;
 Wed,  7 Jul 2021 10:48:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B83FF2171D3;
 Wed,  7 Jul 2021 10:48:47 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 10:48:47 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Wed, 7 Jul 2021 10:48:47 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Yannick FERTRE - foss
 <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] drm: add crtc background color property
Thread-Topic: [PATCH 1/2] drm: add crtc background color property
Thread-Index: AQHXcwzmIWr2Mk6FgEuDfOXYcahi7g==
Date: Wed, 7 Jul 2021 08:48:47 +0000
Message-ID: <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_05:2021-07-06,
 2021-07-07 signatures=0
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some display controllers can be programmed to present non-black colors
for pixels not covered by any plane (or pixels covered by the
transparent regions of higher planes).  Compositors that want a UI with
a solid color background can potentially save memory bandwidth by
setting the CRTC background property and using smaller planes to display
the rest of the content.

To avoid confusion between different ways of encoding RGB data, we
define a standard 64-bit format that should be used for this property's
value.  Helper functions and macros are provided to generate and dissect
values in this standard format with varying component precision values.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
 drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
 drivers/gpu/drm/drm_mode_config.c         |  6 ++++
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_crtc.h                    | 12 ++++++++
 include/drm/drm_mode_config.h             |  5 ++++
 include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
 8 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/dr=
m_atomic_state_helper.c
index ddcf5c2c8e6a..1b95a4ecdb2b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -72,6 +72,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_stat=
e *crtc_state,
 				     struct drm_crtc *crtc)
 {
 	crtc_state->crtc =3D crtc;
+	crtc_state->bgcolor =3D drm_argb(16, 0xffff, 0, 0, 0);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
=20
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 438e9585b225..fea68f8f17f8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -483,6 +483,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc=
 *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property =3D=3D crtc->scaling_filter_property) {
 		state->scaling_filter =3D val;
+	} else if (property =3D=3D config->bgcolor_property) {
+		state->bgcolor =3D val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -520,6 +522,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val =3D 0;
 	else if (property =3D=3D crtc->scaling_filter_property)
 		*val =3D state->scaling_filter;
+	else if (property =3D=3D config->bgcolor_property)
+		*val =3D state->bgcolor;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..6692d6a6db22 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -186,8 +186,7 @@
  *		 assumed to be 1.0
  *
  * Note that all the property extensions described here apply either to th=
e
- * plane or the CRTC (e.g. for the background color, which currently is no=
t
- * exposed and assumed to be black).
+ * plane or the CRTC.
  *
  * SCALING_FILTER:
  *     Indicates scaling filter to be used for plane scaler
@@ -201,6 +200,21 @@
  *
  * Drivers can set up this property for a plane by calling
  * drm_plane_create_scaling_filter_property
+ *
+ * BACKGROUND_COLOR:
+ *	Defines the ARGB color of a full-screen layer that exists below all
+ *	planes.  This color will be used for pixels not covered by any plane
+ *	and may also be blended with plane contents as allowed by a plane's
+ *	alpha values.  The background color defaults to black, and is assumed
+ *	to be black for drivers that do not expose this property.  Although
+ *	background color isn't a plane, it is assumed that the color provided
+ *	here undergoes the same pipe-level degamma/CSC/gamma transformations
+ *	that planes undergo.  Note that the color value provided here includes
+ *	an alpha channel...non-opaque background color values are allowed,
+ *	but are generally only honored in special cases (e.g., when a memory
+ *	writeback connector is in use).
+ *
+ *	This property is setup with drm_crtc_add_bgcolor_property().
  */
=20
 /**
@@ -616,3 +630,19 @@ int drm_plane_create_blend_mode_property(struct drm_pl=
ane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_crtc_add_bgcolor_property - add background color property
+ * @crtc: drm crtc
+ *
+ * Adds the background color property to @crtc.  The property defaults to
+ * solid black and will accept 64-bit ARGB values in the format generated =
by
+ * drm_argb().
+ */
+void drm_crtc_add_bgcolor_property(struct drm_crtc *crtc)
+{
+	drm_object_attach_property(&crtc->base,
+				   crtc->dev->mode_config.bgcolor_property,
+				   drm_argb(16, 0xffff, 0, 0, 0));
+}
+EXPORT_SYMBOL(drm_crtc_add_bgcolor_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 37b4b9f0e468..d62d6585399b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -371,6 +371,12 @@ static int drm_mode_create_standard_properties(struct =
drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.modifiers_property =3D prop;
=20
+	prop =3D drm_property_create_range(dev, 0, "BACKGROUND_COLOR",
+					 0, GENMASK_ULL(63, 0));
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.bgcolor_property =3D prop;
+
 	return 0;
 }
=20
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..9e2538dd7b9a 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+void drm_crtc_add_bgcolor_property(struct drm_crtc *crtc);
 #endif
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750a..12601eb63c45 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -288,6 +288,18 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
=20
+	/**
+	 * @bgcolor:
+	 *
+	 * RGB value representing the pipe's background color.  The background
+	 * color (aka "canvas color") of a pipe is the color that will be used
+	 * for pixels not covered by a plane, or covered by transparent pixels
+	 * of a plane.  The value here should be built via drm_argb();
+	 * individual color components can be extracted with desired precision
+	 * via the DRM_ARGB_*() macros.
+	 */
+	u64 bgcolor;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 1ddf7783fdf7..76c491d10d8d 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -867,6 +867,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *hdcp_content_type_property;
=20
+	/**
+	 * @bgcolor_property: RGB background color for CRTC.
+	 */
+	struct drm_property *bgcolor_property;
+
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
=20
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 98bf130feda5..035f06c6750e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1154,6 +1154,34 @@ struct drm_mode_rect {
 	__s32 y2;
 };
=20
+/*
+ * Put ARGB values into a standard 64-bit representation that can be used
+ * for ioctl parameters, inter-driver commmunication, etc.  If the compone=
nt
+ * values being provided contain less than 16 bits of precision, they'll
+ * be shifted into the most significant bits.
+ */
+static inline __u64
+drm_argb(__u8 bpc, __u16 alpha, __u16 red, __u16 green, __u16 blue)
+{
+	int msb_shift =3D 16 - bpc;
+
+	return (__u64)alpha << msb_shift << 48 |
+	       (__u64)red   << msb_shift << 32 |
+	       (__u64)green << msb_shift << 16 |
+	       (__u64)blue  << msb_shift;
+}
+
+/*
+ * Extract the specified number of bits of a specific color component from=
 a
+ * standard 64-bit ARGB value.
+ */
+#define DRM_ARGB_COMP(c, shift, numbits) \
+	((__u16)(((c) & 0xFFFFull << (shift)) >> ((shift) + 16 - (numbits))))
+#define DRM_ARGB_BLUE(c, numbits)  DRM_ARGB_COMP(c, 0, numbits)
+#define DRM_ARGB_GREEN(c, numbits) DRM_ARGB_COMP(c, 16, numbits)
+#define DRM_ARGB_RED(c, numbits)   DRM_ARGB_COMP(c, 32, numbits)
+#define DRM_ARGB_ALPHA(c, numbits) DRM_ARGB_COMP(c, 48, numbits)
+
 #if defined(__cplusplus)
 }
 #endif
--=20
2.17.1
