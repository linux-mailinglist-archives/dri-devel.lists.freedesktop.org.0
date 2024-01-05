Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78871825CF9
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A2E10E6B2;
	Fri,  5 Jan 2024 23:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A0410E62E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:02:13 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5f2d4aaa2fdso19270327b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 10:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704477733; x=1705082533; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o3K4ahJuaPL16GwJvTdmoV6hUJvJMmXeF8vcCYKDzV0=;
 b=XWw8hb5n/c7aTPFx2R/iZu97GJVGIFLkAFHBmBFtl9e4YbutwXzxrMtcms/lWjFVeR
 2PcvRw70OqoW6vM0VkNGykn4MMahHtTWgbazngQMAmzIbht+noNpSBJZJHse6USwP/IL
 +h7Xt6I0nzkEBGPe+Oq/kNMJ98yQJOoec8t3GyWAuV/fuEbL1/APi+baezjDXnlnylzP
 4UB1sc2DF8QFjNUVhILhVz2csoqbt6vSvbrcMlBTgcZ7uYS7nAj0i719K9om4JPJcCqM
 0SsdiJ+L8mYHaim/pCKh3r52NpJK9Z8294c/5xKODUa8qXdI03XAgFp0N13EfguoKXzg
 yksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477733; x=1705082533;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o3K4ahJuaPL16GwJvTdmoV6hUJvJMmXeF8vcCYKDzV0=;
 b=d9jo72r6eI0luKEj9vzwSj624Ldeo3KuMS4NalDcsPJnUYYNPtGdKvQX70wFzIUB3o
 Rq4noBAKeB/TKduQzgY56rB3XKq+BgxvAtDU/EdbFEY6amC9+cWn58MmTmNnCgQCv5uV
 X/9G5ZOFAiL1IFflSbsL+pRU6/caDt6izKQobdvwdQ0EPNMkYYcZUqv0nCwsktZJN7wS
 wKrNFnF6KVVcRxeCKYud9uSjeru2acPY369wS/5bAziTEa0UCxf/18yJiFPsv4DjCeMa
 ewiXyFo+RFLz4LKw4xxfVorQZKCWreqww812v8tGikC7LOPwRQJT7NEzov9Ud3Hh8B5u
 0mJw==
X-Gm-Message-State: AOJu0Yz8/+TGnSTskaUOSwP6DQCyPeEXM1RkLo9Oj20NU34qqebDAIdr
 bTo11T48+AlABMD/v0pG/p/ugy50hra29WahTOMRKFACEIg=
X-Google-Smtp-Source: AGHT+IG9pSRzz++b0DIzLtW3iVc7f+8841IYAThTybn5Q5bcy2n6BB1aQm72+Ohm43aO9jj7kRbQb+lBft2yg9Rntio=
X-Received: by 2002:a81:9a97:0:b0:5f6:589c:8c53 with SMTP id
 r145-20020a819a97000000b005f6589c8c53mr630768ywg.37.1704477732721; Fri, 05
 Jan 2024 10:02:12 -0800 (PST)
MIME-Version: 1.0
From: Jackson McNeill <jacksonmcneill01@gmail.com>
Date: Fri, 5 Jan 2024 12:02:02 -0600
Message-ID: <CAKBhmCgP-VZw6TF0kAdDvYKCt8vxWKT6M9gEMJuyNwjUVQutTA@mail.gmail.com>
Subject: Expose min_vfreq and max_vfreq in DRM without using DebugFS.
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 05 Jan 2024 23:02:31 +0000
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

Hello,

I'm currently trying to patch the DRM system to expose min_vfreq and max_vfreq.
This is useful information for game engines. I am trying to expose it
to SDL3: https://github.com/libsdl-org/SDL/issues/8772

I am aware of the DebugFS implementation however this requires debugFS and root.
From my naive position, it seems like the properties system is the
appropriate place(?), however I'm not sure where to go from here.

This would be my first kernel patch. I'm not exactly sure how to test
it either, especially since it would need to be a bare-metal test.

Current patch:

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 133af994a..0fce6fb60 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -177,6 +177,8 @@ TRACE_EVENT(amdgpu_dm_crtc_atomic_check,
                  __field(bool, no_vblank)
                  __field(bool, async_flip)
                  __field(bool, vrr_enabled)
+                 __field(u32, vrr_min_vfreq)
+                 __field(u32, vrr_max_vfreq)
                  __field(bool, self_refresh_active)
                  __field(u32, plane_mask)
                  __field(u32, connector_mask)
@@ -199,6 +201,8 @@ TRACE_EVENT(amdgpu_dm_crtc_atomic_check,
                __entry->no_vblank = state->no_vblank;
                __entry->async_flip = state->async_flip;
                __entry->vrr_enabled = state->vrr_enabled;
+               __entry->vrr_min_vfreq = state->vrr_min_vfreq;
+               __entry->vrr_max_vfreq = state->vrr_max_vfreq;
                __entry->self_refresh_active = state->self_refresh_active;
                __entry->plane_mask = state->plane_mask;
                __entry->connector_mask = state->connector_mask;
@@ -207,7 +211,7 @@ TRACE_EVENT(amdgpu_dm_crtc_atomic_check,

         TP_printk("crtc_id=%u crtc_state=%p state=%p commit=%p changed("
               "planes=%d mode=%d active=%d conn=%d zpos=%d color_mgmt=%d) "
-              "state(enable=%d active=%d async_flip=%d vrr_enabled=%d "
+              "state(enable=%d active=%d async_flip=%d vrr_enabled=%d
vrr_min_vfreq=%d vrr_max_vfreq=%d "
               "self_refresh_active=%d no_vblank=%d) mask(plane=%x conn=%x "
               "enc=%x)",
               __entry->crtc_id, __entry->crtc_state, __entry->state,
@@ -215,7 +219,7 @@ TRACE_EVENT(amdgpu_dm_crtc_atomic_check,
               __entry->mode_changed, __entry->active_changed,
               __entry->connectors_changed, __entry->zpos_changed,
               __entry->color_mgmt_changed, __entry->enable, __entry->active,
-              __entry->async_flip, __entry->vrr_enabled,
+              __entry->async_flip, __entry->vrr_enabled,
__entry->vrr_min_vfreq, __entry->vrr_max_vfreq,
               __entry->self_refresh_active, __entry->no_vblank,
               __entry->plane_mask, __entry->connector_mask,
               __entry->encoder_mask)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c0..28ebd8d02 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -423,6 +423,10 @@ static int drm_atomic_crtc_set_property(struct
drm_crtc *crtc,
         return ret;
     } else if (property == config->prop_vrr_enabled) {
         state->vrr_enabled = val;
+    } else if (property == config->prop_vrr_min_vfreq) {
+        state->vrr_min_vfreq = val;
+    } else if (property == config->prop_vrr_max_vfreq) {
+        state->vrr_max_vfreq = val;
     } else if (property == config->degamma_lut_property) {
         ret = drm_atomic_replace_property_blob_from_id(dev,
                     &state->degamma_lut,
@@ -486,6 +490,10 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
         *val = (state->mode_blob) ? state->mode_blob->base.id : 0;
     else if (property == config->prop_vrr_enabled)
         *val = state->vrr_enabled;
+    else if (property == config->prop_vrr_min_vfreq)
+        *val = state->vrr_min_vfreq;
+    else if (property == config->prop_vrr_max_vfreq)
+        *val = state->vrr_max_vfreq;
     else if (property == config->degamma_lut_property)
         *val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
     else if (property == config->ctm_property)
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index cb90e70d8..4b5751ccf 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -316,6 +316,10 @@ static int __drm_crtc_init_with_planes(struct
drm_device *dev, struct drm_crtc *
                        config->prop_out_fence_ptr, 0);
         drm_object_attach_property(&crtc->base,
                        config->prop_vrr_enabled, 0);
+        drm_object_attach_property(&crtc->base,
+                       config->prop_vrr_min_vfreq, 0);
+        drm_object_attach_property(&crtc->base,
+                       config->prop_vrr_max_vfreq, 0);
     }

     return 0;
diff --git a/drivers/gpu/drm/drm_mode_config.c
b/drivers/gpu/drm/drm_mode_config.c
index 8525ef851..9659177e5 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -330,6 +330,18 @@ static int
drm_mode_create_standard_properties(struct drm_device *dev)
         return -ENOMEM;
     dev->mode_config.prop_vrr_enabled = prop;

+    prop = drm_property_create_bool(dev, 0,
+            "VRR_MIN_VFREQ");
+    if (!prop)
+        return -ENOMEM;
+    dev->mode_config.prop_vrr_min_vfreq = prop;
+
+    prop = drm_property_create_bool(dev, 0,
+            "VRR_MAX_VFREQ");
+    if (!prop)
+        return -ENOMEM;
+    dev->mode_config.prop_vrr_max_vfreq = prop;
+
     prop = drm_property_create(dev,
             DRM_MODE_PROP_BLOB,
             "DEGAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974..290ff4e04 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -298,6 +298,20 @@ struct drm_crtc_state {
      * hardware capabiltiy - lacking support is not treated as failure.
      */
     bool vrr_enabled;
+
+    /**
+     * @vrr_min_vfreq:
+     *
+     * STUB COMMENT
+     */
+    u32 min_vrfreq;
+
+    /**
+     * @vrr_max_vfreq:
+     *
+     * STUB COMMENT
+     */
+    u32 max_vrfreq;

     /**
      * @self_refresh_active:
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a91..09bf7d622 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -685,6 +685,16 @@ struct drm_mode_config {
      */
     struct drm_property *prop_vrr_enabled;

+    /**
+     * @prop_vrr_min_vfreq: STUB COMMENT
+     */
+    struct drm_property *prop_vrr_min_vfreq;
+
+    /**
+     * @prop_vrr_max_vfreq: STUB COMMENT
+     */
+    struct drm_property *prop_vrr_max_vfreq;
+
     /**
      * @dvi_i_subconnector_property: Optional DVI-I property to
      * differentiate between analog or digital mode.
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 912f1e415..5e75b5193 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
     void (*free_cb)(struct kref *kref);
 };

-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 26
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
