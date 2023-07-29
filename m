Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C81767A1A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67310E7BC;
	Sat, 29 Jul 2023 00:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCDE10E7B3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 00:49:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so4649820e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690591755; x=1691196555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMSy/K1CIsccW2sw1PgTe2FDAawI36xm/3iEipD6VMg=;
 b=oy3nXUj7xNj7CjIZly7ArdxVtmlQ1TkziV/9V//vqNUR5M1WSFNFgzlosb86fW13jm
 vp9kbDQgqW9KxX/VNfpSqZpTqhz9J9JGbQkn/htKPrfozoXhWUTrwOSS9YcmZg2AngQ1
 Exe02UvHl+zKB1Eq+M1UxA30G7bg83R6pl8wjLqRw/i6yaxgkZf6oxtWSSiJIc1L4xnU
 Ndih1C5ATiTqC8b+Hrev//VhzaoOVlcEX/EC6SY6cMFK2mscNaimcAyI8T0VHKq3gokw
 tMvHaw9A5mvr2AuDyEeWvKpYC8CJsBdiIJ3EnICAx17dacWnesx7ewmXANr4tNd9jrrH
 FnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690591755; x=1691196555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMSy/K1CIsccW2sw1PgTe2FDAawI36xm/3iEipD6VMg=;
 b=i+6duGBTCa3TyaqsnobOdi+5ImXib2fpRSTan+ytgvXGak/7NgteQaVKs8DLw0TTN7
 ARHYu+xo1r8wZ24mGVX2F+LwDpuVRK85c2PLuuzoqBxutmU7EhZEbBq0c+ShxbTPYRCH
 tyU5R17SrQU0HCaB6WQa4cH2UllIaYer8ybbDzwm85R275yuv4HFBzaFfh4BfeQ+Igma
 mK659bQu92ZtORIHLEsM0ImbQRqFhuYD4xVKCtkv/n2zoSm5LR4quC+rvl62C/KMQlVc
 K3ffBKetBDgJckZOX5sHx1f/rfsNFvci/cUCynZK+SFuHdyoGd3+5iASX5pPPFC+WsNQ
 6vJg==
X-Gm-Message-State: ABy/qLbQYsWCqLWgyBI3mr71VtN7FddqdRuxmozQeoeUgJxusVfts013
 HWFaO45RyuP6jedOEOJeBv5GMA==
X-Google-Smtp-Source: APBJJlEYW7RGCnj6FnPzMFWCvTODp5wo9062x4YixzDNvi5vN5iPyz2zoy8vdIFOOdnjfwmwCyDREQ==
X-Received: by 2002:a05:6512:465:b0:4fb:9129:705b with SMTP id
 x5-20020a056512046500b004fb9129705bmr2550632lfd.6.1690591755108; 
 Fri, 28 Jul 2023 17:49:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a19f818000000b004fe20d1b288sm500702lff.159.2023.07.28.17.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 17:49:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Simon Ser <contact@emersion.fr>,
 Janne Grunau <j@jannau.net>
Subject: [PATCH 1/4] drm: allow specifying default subtype for the DP
 subconnector property
Date: Sat, 29 Jul 2023 03:49:10 +0300
Message-Id: <20230729004913.215872-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the embedded usecases the default subtype depends on the bridge
chain, so it is easier to specify the subtype at the proprety attachment
type rather than specifying it later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c              | 3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ++-
 drivers/gpu/drm/drm_connector.c                             | 6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c                     | 3 ++-
 include/drm/drm_connector.h                                 | 3 ++-
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index d34037b85cf8..c18459ecd4be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -2022,7 +2022,8 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 
 	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
-		drm_connector_attach_dp_subconnector_property(&amdgpu_connector->base);
+		drm_connector_attach_dp_subconnector_property(&amdgpu_connector->base,
+							      DRM_MODE_SUBCONNECTOR_Unknown);
 	}
 
 	return;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 943959012d04..297321f0199e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -759,7 +759,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->adev),
 				     &aconnector->dm_dp_aux.aux, 16, 4, aconnector->connector_id);
 
-	drm_connector_attach_dp_subconnector_property(&aconnector->base);
+	drm_connector_attach_dp_subconnector_property(&aconnector->base,
+						      DRM_MODE_SUBCONNECTOR_Unknown);
 }
 
 int dm_mst_get_pbn_divider(struct dc_link *link)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a3d3e7dc08b2..a6066e4a5e9a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1577,10 +1577,12 @@ EXPORT_SYMBOL(drm_mode_create_dvi_i_properties);
 /**
  * drm_connector_attach_dp_subconnector_property - create subconnector property for DP
  * @connector: drm_connector to attach property
+ * @subtype: initial value for the subconnector type
  *
  * Called by a driver when DP connector is created.
  */
-void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector)
+void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector,
+						   enum drm_mode_subconnector subtype)
 {
 	struct drm_mode_config *mode_config = &connector->dev->mode_config;
 
@@ -1594,7 +1596,7 @@ void drm_connector_attach_dp_subconnector_property(struct drm_connector *connect
 
 	drm_object_attach_property(&connector->base,
 				   mode_config->dp_subconnector_property,
-				   DRM_MODE_SUBCONNECTOR_Unknown);
+				   subtype);
 }
 EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 474785110662..5819105187f6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5391,7 +5391,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 	enum port port = dp_to_dig_port(intel_dp)->base.port;
 
 	if (!intel_dp_is_edp(intel_dp))
-		drm_connector_attach_dp_subconnector_property(connector);
+		drm_connector_attach_dp_subconnector_property(connector,
+							      DRM_MODE_SUBCONNECTOR_Unknown);
 
 	if (!IS_G4X(dev_priv) && port != PORT_A)
 		intel_attach_force_audio_property(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5a8115dca359..a130a78f6e0f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1990,7 +1990,8 @@ const char *drm_get_hdcp_content_type_name(int val);
 int drm_get_tv_mode_from_name(const char *name, size_t len);
 
 int drm_mode_create_dvi_i_properties(struct drm_device *dev);
-void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
+void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector,
+						   enum drm_mode_subconnector subtype);
 
 int drm_mode_create_tv_margin_properties(struct drm_device *dev);
 int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
-- 
2.39.2

