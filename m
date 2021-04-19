Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B536418B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790036E301;
	Mon, 19 Apr 2021 12:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631586E301
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:21:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e7so40325215edu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhvfaxDa34GkMn7qTdktOnF1iTHsEAngxP1ACkMOLqQ=;
 b=ZbxUu6hMwMC0SgRXkEY5H8EE1dWIT05183i8gpkHVnBdTSY8UWEW8StM/qjxN89Z00
 OAFwd3criUveEqV2uOpU7s6o+juIQ7lf4Z+3eGXFky5EeCeIQ9mad4Xxkm7gEvQiOlHG
 1FgSplZmXousFSMfFZ+vPd2m1rxrWThQBKu/vz8P2SDM5htivQ37w48PJso8kag9qvhZ
 Dckklsx3aotcc1TAAxVlkZqqFq7bCrS+80jSVHdpx6t2xeLXErGqzRoPwTiFKHA54tOi
 f/qYuPfpSyiZ5QVGagTc1iFUV2MoI10QFEH5A/YqgLEPHppikV5c0FNtzOnTp1AoJ/VO
 WOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhvfaxDa34GkMn7qTdktOnF1iTHsEAngxP1ACkMOLqQ=;
 b=PFwXpK/vM/Lue05lO+B4uc+K/HcUn3O+tETMOyC88EygOVh2Z6ePhan/WBZ/EnXf3c
 v6/F5UnQtuKKkgLrGbLaQuJSR42EVDfUNw+pJkM+LCAl8z9mEdlvY68xTGRtSAH0evtK
 fHc9ZbyId8sQm3uew8BMNE8UuaQHMg2wuadZ2p5fNWTMH60fFe/9fX9lcdDOP9CSY21+
 9BdW8VaNC2MHYdSxfkLAI3x9V8wL5VaGqlM5ddMu3VOFdXOwnxTADZWDdOyhN245volD
 VMoFxhbA6YDZVO4OGQLNxUP3jf3Fqo6aN+Vqtzr2+IJCkmSbR0VMg3aHTVD6QY1Ezzyh
 +7bg==
X-Gm-Message-State: AOAM533cdn2FibXfwwJOgzHLiiybApNgKbUxReZAmUufnzmMtOIJfJuF
 1pGMoK9lv5hpf80vlP/nLJM=
X-Google-Smtp-Source: ABdhPJx8NPtKqsdeYSyTxijMCIrzk6UFN03b6DZPYSr/dSJmRK8qZ4aVf7ERWJ7xnHb8UxHF3iwP+g==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr25005111edt.106.1618834870041; 
 Mon, 19 Apr 2021 05:21:10 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id c19sm12576152edu.20.2021.04.19.05.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 05:21:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH 2/2] drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_*_all
 with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 14:20:59 +0200
Message-Id: <20210419122059.738-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419122059.738-1-fmdefrancesco@gmail.com>
References: <20210419122059.738-1-fmdefrancesco@gmail.com>
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
of the DRM subsystem.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
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
