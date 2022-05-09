Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6D51F405
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 07:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4DB10E8A5;
	Mon,  9 May 2022 05:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FA510E8A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 05:45:20 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x18so12865881plg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cicmyo9fma3vroeKIGErP7E3mBkjABO4msZ5eM9hcRo=;
 b=LVuNP+WYky7iLeP1k2Esgi1WbqIrqsoqJLN6SppMoRPjnzlapPl5j2vLCaTAASNGCj
 0BOozjxdYFgAjuO8gs2O0SS28UuL2UAFIEQuZPy4GVVRgKu0sIGcOeTAfd10TdwhX8or
 mUt362oP7ewMTSS3xbLVpPWei4pi5tDmfoK03tedVoYoIDNLGVXv3tIMe166REfQ07oY
 b7mS9azClsKeSWK8A/KfX5Tx16wgkZ4NdnuwbHnnO0r8OyXSFC3QShWCAbhgWkWFuJ2Z
 CDPizlVVXkIXMnq6Z/gsquiQnheCm+X3DLIEVuDJflkWQQSbwh9S96e4IuLu/Z7db/Mp
 EJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cicmyo9fma3vroeKIGErP7E3mBkjABO4msZ5eM9hcRo=;
 b=v7KjKscSCFlQ1dkPrXK9HF3OcnrtAyVpH2CFtyr8M7M8g835yr4WMRbxSaVKfW/79e
 L7soyXZxSfbjVy1md2zaVbo3KuKd1kB0/wSbGo5yk97BEVVkpaKYbyNw/3TZGIztieC+
 jifgQOLxpaE1J0V3XMdIsO7F2UDng3QcYjXfWxAvxmqaVljleNiUIAwMnvh6JsBc9H6m
 qurPPaAL7jye8A5EITes7A0qOYBC0gHAX2AVD9n/joSZc37slElcSZstJYEwI0mumWVX
 MmIi3x4HMVrUhh+E8jfSWvvv1prbIHtpi1pNIhcz378dX/ZDylz2uVX2Ss6VNW9tPYIe
 GFHA==
X-Gm-Message-State: AOAM532Bcd16I7zMvyHTeQiZHt8KSm5SFBzEsrX4xsB2qqB0o3RgCwsb
 eSEU4b20QsWKrlGWs18og34=
X-Google-Smtp-Source: ABdhPJyJ+woJlVxbxcdZeoB6A4Umfd4irv65r3VsB2dDgLLtgfytcJ3dvk3bMS/Al4nrzrpFvAfIxA==
X-Received: by 2002:a17:90b:694:b0:1d9:6a2e:bc9 with SMTP id
 m20-20020a17090b069400b001d96a2e0bc9mr24621202pjz.169.1652075119609; 
 Sun, 08 May 2022 22:45:19 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a170902db0d00b0015eb200cc00sm6104625plx.138.2022.05.08.22.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 22:45:19 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu: drm: fix possible memory leak in drm_addmap_core()
Date: Mon,  9 May 2022 13:44:41 +0800
Message-Id: <20220509054441.17282-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

map->handle need to be handled correctly when map->type is _DRM_SHM or
_DRM_CONSISTENT just like map->type is _DRM_REGISTERS.

Fixes: 8d153f7107ff ("drm: update user token hashing and map handles")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..2b3f504c5f9c 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -344,6 +344,15 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 	if (!list) {
 		if (map->type == _DRM_REGISTERS)
 			iounmap(map->handle);
+		else if (map->type == _DRM_SHM) {
+			dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
+			vfree(map->handle);
+		} else if (map->type == _DRM_CONSISTENT) {
+			dma_free_coherent(dev->dev,
+					  map->size,
+					  map->handle,
+					  map->offset);
+		}
 		kfree(map);
 		return -EINVAL;
 	}
@@ -361,6 +370,15 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 	if (ret) {
 		if (map->type == _DRM_REGISTERS)
 			iounmap(map->handle);
+		else if (map->type == _DRM_SHM) {
+			dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
+			vfree(map->handle);
+		} else if (map->type == _DRM_CONSISTENT) {
+			dma_free_coherent(dev->dev,
+					  map->size,
+					  map->handle,
+					  map->offset);
+		}
 		kfree(map);
 		kfree(list);
 		mutex_unlock(&dev->struct_mutex);
-- 
2.25.1

