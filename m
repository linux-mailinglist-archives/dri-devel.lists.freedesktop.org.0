Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D744D22F6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7710E1FA;
	Tue,  8 Mar 2022 20:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BF410E577
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:56:40 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id x3so425410qvd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUvOUvE5Op88Q/V11W4jcwEtpm6VehQAMJSMRSR02kY=;
 b=Aimllqxg0sooheStcC8EuuvccstJp2VDREOk7TqXOywQ8e4cxJPhBfsexOiUiFalsO
 q+utwiBIGy1qcLF8zwZBZSOU3nZ2OVjqWFvimV7RHGR2IlVlj2lgp41H4BmM8eydLEOW
 h/SVXTSmbN8HHOiqwnj/UGNEC4jPoFlYegEeiYF3/R8X5dkH7xcPLRalZzDGReWUXQ3l
 ol0j5EdYQJTbRKZluL+bYO586jBfRbts6QooKy5hEHbxyqfl9UHYx3KmxzNfg99K7VV5
 ao13T86D1/5sL3sBmJvcR1pT+8Om7vHai9XZj65TE0hrtK6dmjuOYUZMHcRZhvG2pBWK
 +rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUvOUvE5Op88Q/V11W4jcwEtpm6VehQAMJSMRSR02kY=;
 b=MfXt3qPKerpb0Xn7Lno/HJqz/CMYkAenhXMrjlnuYdYUHgQWpEOqMvoJE7ki3awoF5
 BiKzkVCX+InaIPE6fIXzH8tv/RLKsY/kzfiWGngDRlfPQSF8hcqGCccCnxzk2qncYdBl
 bi3jyyN0EK6/JWs8boZ40gwLvGDxhc/M1HuJJhI873LTP4aq8VidlyiOoyWqFjzQb0kl
 bXFUUWx1piYiMJaS6d9+I4fP9dd8kjkPWD1RrCvAMwUE0fAVT1/hgHVzVMZG4NShKOdP
 e0WAseL+aeUdW7HF1N7qioyHl11gHW8nx9E7vTR+VsVCFKUyEIjclWEsWgbj4cVvo96m
 ZpVw==
X-Gm-Message-State: AOAM5331A5yY1XZoIsukCcwHsvMzJjN/W1EK+OltZsZt/fSxL5gZEKde
 Nd3kzzru4RzUOuddHH+4f/yJpoUE5dDkhA==
X-Google-Smtp-Source: ABdhPJzr9EAUKTKdZsTdS+sANPteWitYCUBc0vmRS0qMuYnhDHeyay5/uhi2tWCJBwaUMVHZdw3lTw==
X-Received: by 2002:a05:6214:234d:b0:435:9a81:c4e3 with SMTP id
 hu13-20020a056214234d00b004359a81c4e3mr7241543qvb.51.1646772999509; 
 Tue, 08 Mar 2022 12:56:39 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com.
 [35.245.46.29]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a15a900b00646d7cb7afbsm16301qkk.19.2022.03.08.12.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 12:56:39 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 harry.wentland@amd.com, alexdeucher@gmail.com
Subject: [PATCH] drm/amdgpu: Add support for drm_privacy_screen
Date: Tue,  8 Mar 2022 20:56:30 +0000
Message-Id: <20220308205638.1744064-1-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 hdegoede@redhat.com, Sean Paul <seanpaul@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, rajatja@google.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the necessary hooks to make amdgpu aware of privacy
screens. On devices with privacy screen drivers (such as thinkpad-acpi),
the amdgpu driver will defer probe until it's ready and then sync the sw
and hw state on each commit the connector is involved and enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---

I tested this locally, but am not super confident everything is in the
correct place. Hopefully the intent of the patch is clear and we can
tweak positioning if needed.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2ab675123ae3..e2cfae56c020 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -26,6 +26,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_managed.h>
 #include "amdgpu_drv.h"
@@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 {
 	struct drm_device *ddev;
 	struct amdgpu_device *adev;
+	struct drm_privacy_screen *privacy_screen;
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0, i;
 	bool supports_atomic = false;
@@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	size = pci_resource_len(pdev, 0);
 	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
 
+	/* If the LCD panel has a privacy screen, defer probe until its ready */
+	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
+	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	drm_privacy_screen_put(privacy_screen);
+
 	/* Get rid of things like offb */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e1d3db3fe8de..9e2bb6523add 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		if (acrtc) {
 			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
 			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
+
+			/* Sync the privacy screen state between hw and sw */
+			drm_connector_update_privacy_screen(new_con_state);
 		}
 
 		/* Skip any modesets/resets */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 740435ae3997..e369fc95585e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -27,6 +27,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/dp/drm_dp_helper.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "amdgpu_dm.h"
@@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector,
 				       int link_index)
 {
+	struct drm_device *dev = dm->ddev;
 	struct dc_link_settings max_link_enc_cap = {0};
 
 	aconnector->dm_dp_aux.aux.name =
@@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
 				      &aconnector->base);
 
-	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
+	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
+		struct drm_privacy_screen *privacy_screen;
+
+		/* Reference given up in drm_connector_cleanup() */
+		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
+		if (!IS_ERR(privacy_screen)) {
+			drm_connector_attach_privacy_screen_provider(&aconnector->base,
+								     privacy_screen);
+		} else {
+			drm_err(dev, "Error getting privacy screen, ret=%d\n",
+				PTR_ERR(privacy_screen));
+		}
 		return;
+	}
 
 	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

