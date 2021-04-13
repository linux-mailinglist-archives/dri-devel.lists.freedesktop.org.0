Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B735DBA5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09866E321;
	Tue, 13 Apr 2021 09:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FBE6E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w4so12034513wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m56BVCqfwfl5q0jPz4hzEYoV7UdZ/KST4hTQZTeuJdk=;
 b=DlN1qLsRkwspcoQjZHLlkmJmsRzvKA8b3BZx7Ij6a/J7hK2lxohgdq1Lz5WwmRyTiE
 y6Ijp9eFpL0gR/XBxFlrkxHCmsQwwjvuCMxIOp8ENOpy+NzljtuXoYaxd7OhmAbgFpO+
 sQ+G3DQE4yzJhVm18ZYYkeig9SX6t1+hOv+3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m56BVCqfwfl5q0jPz4hzEYoV7UdZ/KST4hTQZTeuJdk=;
 b=qcBqNVfhz0cKnmrvdUiWZ3j8ZtPe4RClofhI6/qVzL3Lsl/rGmZZeepv6S6wkK2Jpm
 o8k3RAenWJ1duAUDvs4d63DYnfhVvUCTcvkNktWaVvBpLtEbUtD2uadaHmobYXlQCz3D
 3PXoy1sQ3hRWvLPKlvyp3PoBDAdBFRBliYHTBSBHbC7ybQ2nlUFcvJ7v+lU8OALBRY+z
 TNPOPl6aWyik8/SKzcsPYbgJenG0OW6grjcKeC4yvvuc4hOgXw3ncxkLS5PbtWh02XyO
 hPX18LXThapKK0B1d4AyySF5fqLFgYDbRIyomOrJ5sBJNkaC4V97SXl8vjtuqPtyEoWT
 da/Q==
X-Gm-Message-State: AOAM530BfwcK/jtCmFmf4tkSFXGwiIFw7yzEZogJfncbTGpYyqsAZumV
 woU/qvJ4VocjM6sd9kTJMmry9IUWci3j8w==
X-Google-Smtp-Source: ABdhPJxba/UokgDDBGd45GnkdAsegWSdlxRgWh5ae6CT+UZ1J8D7VSV+2k5yG+VDZ5PL+WaH+ETJ/Q==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr35724697wru.381.1618307356600; 
 Tue, 13 Apr 2021 02:49:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/12] drm/msm/mdp4: Fix modifier support enabling
Date: Tue, 13 Apr 2021 11:48:58 +0200
Message-Id: <20210413094904.3736372-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting the cap without the modifier list is very confusing to
userspace. Fix that by listing the ones we support explicitly.

Stable backport so that userspace can rely on this working in a
reasonable way, i.e. that the cap set implies IN_FORMATS is available.

Cc: stable@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3d729270bde1..4a5b518288b0 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -88,8 +88,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 	if (mdp4_kms->rev > 1)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
-	dev->mode_config.allow_fb_modifiers = true;
-
 out:
 	pm_runtime_put_sync(dev->dev);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 9aecca919f24..49bdabea8ed5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -349,6 +349,12 @@ enum mdp4_pipe mdp4_plane_pipe(struct drm_plane *plane)
 	return mdp4_plane->pipe;
 }
 
+static const uint64_t supported_format_modifiers[] = {
+	DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 /* initialize plane */
 struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 		enum mdp4_pipe pipe_id, bool private_plane)
@@ -377,7 +383,7 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
 	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
 				 mdp4_plane->formats, mdp4_plane->nformats,
-				 NULL, type, NULL);
+				 supported_format_modifiers, type, NULL);
 	if (ret)
 		goto fail;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
