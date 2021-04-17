Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95E3631EF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 21:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54C26ED1E;
	Sat, 17 Apr 2021 19:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48326ED1E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 19:12:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v6so45607378ejo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EeE/jEG+BwS2yLzax1oxoe1YlEFDe9IUirRYoBxddY=;
 b=c7+kaWC9DjKkxn882whe6mMcd7HxFJ1bFx6boT52Kt5Na7Hsz74IweAgpdXTr9Hdqb
 cHm600tCOzfepihXRSKoRjr6P6Y7eHYHOVaJM4nU41WthSVcIRCiEcASb4fNULWj5dHK
 8cAGqT78I0dG6DkmvQFXelgrGqLF+iR5FO8Q83Llwb9dq3d6fRcivo0AMZoeFtu61O8u
 gaJNhW5PcY9WXX5H/Xp07n41hirN7EnlshoAtZsKOU7mQMSw9zqmt6z11qzqVDZJSCXg
 CwEkFYy4nhHJSDaTd8rYJP9LREtzHDp2MWoE4IMYRiJdzeIGdOPaL5AqlbeWNOwB38e7
 ZonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EeE/jEG+BwS2yLzax1oxoe1YlEFDe9IUirRYoBxddY=;
 b=flVySZB+2g4gBd3EWOeuafTvVe/GfrgjI8hdlIOU52duMqbUYMa8W0obzuIe7jIy2v
 PxOSE6oblVZQ0swXCaeIQJrO3PVNPqyCWC6PX6zKT5npHI6rnITVigmKGMCXwdlS4oLa
 QXM0HvkmFmVZRcqQ0I3mYxWdqnqzwdX79EEC1IwkSmRKxYgK9TJfZntyGPmEm8AX+HlS
 OabS0cOb/4QBGQAUtkMA+hNLkK54mluQGzujEJXEKzd6qxtEKPKoMz5u9kSKqTsdJBGF
 OtT3sSq9O1w91Jm7sKcbCog41+tUs6b6PUQ9BcQi4nwXXkYdfr0Wno4m9/t7UX1y9nMX
 qeag==
X-Gm-Message-State: AOAM5304H2FmZ8XB5kbO9epmQSXE4Q4DYgTeqBwi+Kgq26lhocPrgwZK
 TqaV7S4xzRaUafdg0RNWtb+XpMqXjWoiXAur
X-Google-Smtp-Source: ABdhPJyGYSdAqu7p2msp8dZbH+4TtUnNXsdN6d5lTefqsUv+w53QsA3buofHXcR1ZmmLg6pI3vpMDg==
X-Received: by 2002:a17:906:3509:: with SMTP id
 r9mr14193077eja.490.1618686753304; 
 Sat, 17 Apr 2021 12:12:33 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id g11sm8330120edy.9.2021.04.17.12.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:12:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/dispnv50: disp.c: Replace drm_modeset_*_all with
 DRM_MODESET_LOCK_ALL_*
Date: Sat, 17 Apr 2021 21:12:28 +0200
Message-Id: <20210417191228.2980-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated API with DRM_MODESET_LOCK_ALL_* helpers (according
to the TODO list of the DRM subsystem).

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 828f48d5bdd4..e167bf96ff12 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -666,16 +666,19 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	drm_modeset_unlock_all(drm_dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
+
+	return ret;
 }
 
 static void
@@ -685,12 +688,14 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	drm_modeset_unlock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
