Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E6CC9A463
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02010E549;
	Tue,  2 Dec 2025 06:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyuSt0kK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CA810E534;
 Tue,  2 Dec 2025 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656842; x=1796192842;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yN5gM/aDkLoBgLfP8gXXGjGMY/vN0fPRoCNy5jzA+wA=;
 b=ZyuSt0kKbQW8ab5KYzX3kZOAYLcHVbyR9sP+sORljP6TMATwriBjMlCJ
 Efy5WOlem2ITCrudhJL++X8wPBxvfn6dkWELRdgWHGozVE9+m0MzMh9Yp
 TLFc88CAjhBmQe63668BNWlvfzFSxWp401CjfLyiD6QMCpWmSBpqbIA+R
 FSfGZrSkwoFBCWmo8+hWC2BItLo1LnYy6NsmhguOCpg5jCEteEfnJoGXG
 TmEeQEBKtvHQP7voduw2wCJFNDLhClYHOdZXUSYg61dic40VKdOlv/Ad/
 BiAG83by36oW8B+OmgKtzEUHkYoaREbAEov+xFTMYgTtlmE39o3WpHtkp A==;
X-CSE-ConnectionGUID: XdLdM9sRRBSnQfL1AFguAw==
X-CSE-MsgGUID: e+4YjApYSaKp8tiYlTf6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499880"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:21 -0800
X-CSE-ConnectionGUID: MGNtZ10cRsOvt38gVl317g==
X-CSE-MsgGUID: PjXB7q+ZQcycHFfxG3iDfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961247"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:15 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:01 +0530
Subject: [PATCH [RESEND] v9 07/20] drm/colorop: Export function to create
 pipeline element iet lut
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-7-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

The generated histogram can be used the user algorithm to generate a
LUT, which is referred as image enhanced LUT. This is fed back to the
hardware to get an enhanced image.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++----
 drivers/gpu/drm/drm_colorop.c     | 62 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 17 +++++++++++
 3 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3505c00dfc5168de3476fb94bced123f9c886cb2..579210be8288d6788a6cfc357394c3794b13a417 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -719,6 +719,7 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	ssize_t elem_size = -1;
 	ssize_t size = -1;
 	bool replaced = false;
+	u32 ret;
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_LUT:
@@ -731,17 +732,25 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		size = colorop->size * colorop->size * colorop->size *
 		       sizeof(struct drm_color_lut32);
 		break;
+	case DRM_COLOROP_IET:
+		elem_size = state->data->length;
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
 	}
 
-	return drm_property_replace_blob_from_id(colorop->dev,
-						 &state->data,
-						 val,
-						 size,
-						 elem_size,
-						 &replaced);
+	ret = drm_property_replace_blob_from_id(colorop->dev,
+						&state->data,
+						val,
+						size,
+						elem_size,
+						&replaced);
+
+	if (colorop->type == DRM_COLOROP_IET && !ret)
+		state->iet_lut_updated |= replaced;
+
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e3e22db3b911e79979488b1493e72cd9a11ed418..797a6f5ef79c7cc04109e87c44566f2461aee965 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -545,6 +545,68 @@ int drm_crtc_colorop_histogram_init(struct drm_colorop *colorop,
 }
 EXPORT_SYMBOL(drm_crtc_colorop_histogram_init);
 
+/**
+ * drm_crtc_colorop_iet_lut_init
+ *
+ * @crtc: pointer to the struct drm_crtc.
+ * @caps: pointer to the struct drm_iet_caps, holds the
+ *	  image enhancement LUT hardware capabilities.
+ *
+ * This 1DLUT is used by the hardware to enahance the image. Hardware
+ * interpolates this LUT value to generate the enhanced output image.
+ *
+ * The blob property IET_LUT_CAPS points to the struct drm_iet_lut_caps
+ * The blob property DATA points to the struct drm_iet_1dlut_sample
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_colorop_iet_lut_init(struct drm_colorop *colorop,
+				  struct drm_crtc *crtc,
+				  struct drm_iet_caps *caps,
+				  uint32_t flags)
+{
+	struct drm_property *prop;
+	struct drm_iet_caps *blob_data;
+	struct drm_property_blob *blob;
+	int ret = 0;
+
+	ret = drm_crtc_colorop_init(crtc->dev, colorop, crtc,
+				    DRM_COLOROP_IET, flags);
+	if (ret)
+		return ret;
+
+	blob = drm_property_create_blob(crtc->dev,
+					sizeof(struct drm_iet_caps),
+					NULL);
+	if (IS_ERR(blob))
+		return -1;
+	blob_data = blob->data;
+	blob_data->iet_mode = caps->iet_mode;
+	blob_data->nr_iet_sample_formats = caps->nr_iet_sample_formats;
+	blob_data->nr_iet_lut_entries = caps->nr_iet_lut_entries;
+	blob_data->iet_sample_format = caps->iet_sample_format;
+
+	/* IET LUT Capabilities */
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IET_LUT_CAPS", blob->base.id);
+	if (!prop)
+		return -ENOMEM;
+	colorop->iet_lut_caps_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->iet_lut_caps_property,
+				   0);
+
+	/* IET LUT data */
+	ret = drm_colorop_create_data_prop(crtc->dev, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_colorop_iet_lut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 4d905c13274c13d8d50e1c9e45a87feec72f82ae..fa37277232dbec3c7c58781d27cfaf62163b6922 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -215,6 +215,12 @@ struct drm_colorop_state {
 	 * Flag to say that the histogram data is updated by the KMD.
 	 */
 	bool histogram_updated;
+	/**
+	 * @iet_lut_updated:
+	 *
+	 * Boolean flag to say that there are some updates on iet_lut property
+	 */
+	bool iet_lut_updated;
 
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
@@ -399,6 +405,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *histogram_data_property;
 
+	/**
+	 * @iet_lut_caps_proeprty
+	 * Optional colorpipeline property for writing the
+	 * image enhanced LUT
+	 */
+	struct drm_property *iet_lut_caps_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -463,6 +476,10 @@ int drm_crtc_colorop_histogram_init(struct drm_colorop *colorop,
 				    struct drm_crtc *crtc,
 				    struct drm_histogram_caps *caps,
 				    uint32_t flags);
+int drm_crtc_colorop_iet_lut_init(struct drm_colorop *colorop,
+				  struct drm_crtc *crtc,
+				  struct drm_iet_caps *caps,
+				  uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);

-- 
2.25.1

