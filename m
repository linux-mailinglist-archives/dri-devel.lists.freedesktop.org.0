Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D33646AC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346F46E415;
	Mon, 19 Apr 2021 15:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896B6E400
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 15:03:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id mh2so31887388ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwQs6URv7HNMupPfMl1z7anTkm71LLarAtVxM5MnJpI=;
 b=auTFHlrR4AaNfjcuouBHpTCso9BoF7ybZRoVlEHjIjJ8YSyVzAgPIZcxb1xGaJ1i/M
 ttVJazEbUJWItZxQbjJTYM3YtnzSpGlezabHMPHzsfD7d6qGvb3DV7sKkSKVpLIKx0p8
 gQOnOGE2fS1dJpngoIVxaReOliSuBAqwSYK/uml4YReKFtv8ia/cSf7HVQ7zBU1TQ7hS
 xiUt1L9Vuv2MQB+DmFNwVuMLhZ/lsL4/Sd4CDIBVY/WdBjOkHwUupDHNczKuzYaHOOuJ
 BvKmY74kqoRwvDzY722Gg5J5T/fNCXiJEcz8xh0q0MBUodP/3RuCK27y+8q5O4BEpjaS
 mwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XwQs6URv7HNMupPfMl1z7anTkm71LLarAtVxM5MnJpI=;
 b=IVGUEpSgs2TD44dJe/CCDhOPrbM4poYHg9NhRDGyk1U0xuD32LYHpy0xSAj9YpEFuM
 0SD7LDXoBBo8tqAU4ixxPhZ/7D8irHMG2vsky9x6LSMlbppM1QKb3tIQpN0ecJpyD4kp
 6gnNEhuXOB7hXEvQyfD6QUT5Il3Ic6j/QdwHU+3Y0DH0h3JQGjClN9T6N3KgfCwUFAuB
 EhXX/teHmJ2ZvYP+JJIBIyteAlgMCRgk/QiAdQQ8+AM3Kj36K4G9e/rogaY/FvNkYb8f
 zP0sHHFWZs/H4tT72q2ZQEjWIGWnsA9zC51E3TMw+lSXUGdSgPYkcdiaiOkUFPuu9NTp
 wJxQ==
X-Gm-Message-State: AOAM5319THUq47PvPUGWvhxle07gGbANLe7jTQG+ZQcYefHDUv0v3Kr9
 Nv+qafBWCs7Z/a1WYi5wfhM=
X-Google-Smtp-Source: ABdhPJwK9gA/IO8XqJRidvs/+3/wxH+tjo06Tb2wG0WDk9T43Y7f4UT8uyRnUW6ZCvT8b3uIK+zXLA==
X-Received: by 2002:a17:906:cd17:: with SMTP id
 oz23mr14866667ejb.375.1618844632930; 
 Mon, 19 Apr 2021 08:03:52 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id o5sm1965954edc.8.2021.04.19.08.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:03:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v2 2/2] drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_*_all
 with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 17:03:41 +0200
Message-Id: <20210419150341.24959-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419150341.24959-1-fmdefrancesco@gmail.com>
References: <20210419150341.24959-1-fmdefrancesco@gmail.com>
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

Replace the deprecated API with new helpers, according to the TODO list
of the DRM subsystem. The new API has been introduced with commit
b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset
locks using a local context and has the advantage of reducing boilerplate.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Added further information to the commit message.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 671ec1002230..0e9b7a180ee7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1438,8 +1438,10 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 
 	if (amdgpu_device_has_dc_support(adev)) {
 		struct drm_crtc *crtc;
+		struct drm_modeset_acquire_ctx ctx;
+		int ret_lock;
 
-		drm_modeset_lock_all(drm_dev);
+		DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret_lock);
 
 		drm_for_each_crtc(crtc, drm_dev) {
 			if (crtc->state->active) {
@@ -1448,7 +1450,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 			}
 		}
 
-		drm_modeset_unlock_all(drm_dev);
+		DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret_lock);
 
 	} else {
 		struct drm_connector *list_connector;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
