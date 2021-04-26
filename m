Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58136B9FE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152E6E870;
	Mon, 26 Apr 2021 19:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2FB6E870
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 19:28:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id zg3so4514508ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPSGYcihSYfm5NnA+nu9YTkGLMVNgdMxJvMX/B7FahE=;
 b=ctXrYWq3oz6pjzAXmFpyJd/LoD0/v+4tl7HlYy8uF5CLLgpv6M8UmNUPLsPomE0iA1
 IbJjJZ6tjjLS4sM55IgbpW9yDGZzZn9pJHHIFxfMVa2gbPU25sdhChZCVgJUZyDvH62f
 IvusHlYK/dmNk4ddrQjOcQclx+tRkOIOBAOx5eh9z4GyeD7KsOwiwr6GEsOB2U1r1ZLy
 fu9vfUQP3WT+EHM1aJ8f2ZuYcJbO63u9p+9s7HLJ/tKORD6z95KhytxfMmgWW55FD4dh
 hCnTI5CqbHAR0XGbUSFIdUl+yXW3JUsNHGjIphoFg2dAlbppxLp6deUJSN56Ovvet3sx
 xZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPSGYcihSYfm5NnA+nu9YTkGLMVNgdMxJvMX/B7FahE=;
 b=IUUGaFohCjEOTW01neDh2uLGn79bOKWHs38x/7DR6NzVee2e8s3QKlrHUUgd/rN4lG
 0aa1Iz50Dd6mf1iYhnLpFwUFc5ve3NRPN68uKuLdi/Rwk9ThZpoDzTQazIX3Z+hHeuOv
 PiGJ/FZKEgHKvV3LYk4IBZsWFZB2Z/l8I+gkBte9altJGk31JUVRbSkAG5a/BzGdk0pQ
 wdZ9XKbT4bgaW1R11WIXxUUUw23nYjDD7lY/1pL0qD3vpSZcEp7pK2xKeNc3uv2cuxGM
 lEGenNGIRjRjGBqILG0Ib7PRTJqBM3kn2Sag+2M5QXj/Chtzc4bHILn6RxM8H4DNSMLw
 vJwg==
X-Gm-Message-State: AOAM530tgDhW1rke6raC0dpsF9jTINLwad4cqrZYi0ne+lpeZLYv+zC8
 Y0sERKfs24o0KcBxwZJOX3c=
X-Google-Smtp-Source: ABdhPJxt5ijbkx1gr5nMUoX4S1ZPQTXA4JCK9wk3uzykoQlBO5tcNsIlVyD2cNLLFRGveTBeQRClDg==
X-Received: by 2002:a17:906:cb88:: with SMTP id
 mf8mr20576558ejb.541.1619465336843; 
 Mon, 26 Apr 2021 12:28:56 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id p4sm807568ejr.81.2021.04.26.12.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:28:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3] drm/amd/amdgpu: Replace drm_modeset_lock_all with
 drm_modeset_lock
Date: Mon, 26 Apr 2021 21:28:51 +0200
Message-Id: <20210426192851.30155-1-fmdefrancesco@gmail.com>
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

drm_modeset_lock_all() is not needed here, so it is replaced with
drm_modeset_lock(). The crtc list around which we are looping never
changes, therefore the only lock we need is to protect access to
crtc->state.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---

Changes from v2: Drop file name from the Subject. Cc'ed all maintainers.
Changes from v1: Removed unnecessary braces around single statement
block.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 671ec1002230..adfeec2b17c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1439,17 +1439,15 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	if (amdgpu_device_has_dc_support(adev)) {
 		struct drm_crtc *crtc;
 
-		drm_modeset_lock_all(drm_dev);
-
 		drm_for_each_crtc(crtc, drm_dev) {
-			if (crtc->state->active) {
+			drm_modeset_lock(&crtc->mutex, NULL);
+			if (crtc->state->active)
 				ret = -EBUSY;
+			drm_modeset_unlock(&crtc->mutex);
+			if (ret < 0)
 				break;
-			}
 		}
 
-		drm_modeset_unlock_all(drm_dev);
-
 	} else {
 		struct drm_connector *list_connector;
 		struct drm_connector_list_iter iter;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
