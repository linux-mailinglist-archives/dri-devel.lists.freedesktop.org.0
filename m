Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF07585438
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC57810EE2E;
	Fri, 29 Jul 2022 17:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF5F10E301;
 Fri, 29 Jul 2022 17:07:23 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id v18so5121890plo.8;
 Fri, 29 Jul 2022 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FldoPR8BVfM3iFKwCM1XMFRXAR81Z32eid0v1j3G9ms=;
 b=HKz9QeN1B04S71KqwGZWo+wwf6kYkXxGdcKiMMHsrsr13IRifPJQhbh5KiqAal/DsE
 vmjJYbyNR97KhbEFgVt6sDx0Pw/eEnSBmdQG15mvI3z/WZaWhK4GWeFNA03PfPyOe5vu
 yTKimkqFzz72xhuoFlkIVRLFDeoQnq3XOJyLCDpX7m1tK4Kb4xNn9qopeHrIDF5PxWAm
 JZW/VRTDBeDZKYhtX4Xk349gSo/lWOrmUHKaG+44tHdLZEUNGvlJNmt/LwMdPDoQMNCC
 6fvIfU7eJFgMMkHB2vZYsWnHyfQTqJAKlMVd5pQHRv1+lWJdaWbpupNA3RegpyUILm1P
 MI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FldoPR8BVfM3iFKwCM1XMFRXAR81Z32eid0v1j3G9ms=;
 b=P2ARoR0HjZq7ydj+Os38WOevwu836KsGPC5hfI7xFGGfMpXCnfkBJMXbe4CJNlzY3R
 Nug1aFlSVcs0jOFGbcg30FjBlm0K9t1AH/spmWrJako7TilhbIbhy9ngtSZ47rc/rPRE
 xv/ccnJYewJuCGVXYNfBVhj/u+KfAIFJKxgfK+YhencYAYMl/XSxva/9wBb8loYtp/jG
 MZndWO5jHW3zSd79nxxsYnX3ONITlY7fRDlEdUm6vsraLbaD5Ak95rZ2xHDIT5skglp8
 Yq/3kqcjF0uAdNFpZFL04koRLOgUKK1X64k3p4100K+WOaldpNoiSxVjwhiKBnihHSlk
 EYaA==
X-Gm-Message-State: ACgBeo2cHqqXWnRCZfvM3LIZs8f6ZdyKxcdOHKHvUrenhNfbxJWPzS0l
 W/Gw29+yLFsptFZFIfiw6iOYRNtCOjw=
X-Google-Smtp-Source: AA6agR56jDy8w/4vyMlbH3lvpqcpJ00Ke/e1+Z/3QybslmIHKNYd1sUZrzP7R7Q9uY7p/hqGynTRKw==
X-Received: by 2002:a17:90a:9709:b0:1f3:7ac:73dd with SMTP id
 x9-20020a17090a970900b001f307ac73ddmr5214940pjo.184.1659114442062; 
 Fri, 29 Jul 2022 10:07:22 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 jz21-20020a17090b14d500b001f1ef42fd7bsm6183882pjb.36.2022.07.29.10.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:07:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/prime: Wire up mmap_info support
Date: Fri, 29 Jul 2022 10:07:41 -0700
Message-Id: <20220729170744.1301044-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729170744.1301044-1-robdclark@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Just plumbing the thing thru an extra layer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 12 ++++++++++++
 include/drm/drm_drv.h       |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..f58586e131c5 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -784,6 +784,17 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
+static int drm_gem_dmabuf_mmap_info(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_device *dev = obj->dev;
+
+	if (!dev->driver->gem_prime_mmap_info)
+		return -ENOSYS;
+
+	return dev->driver->gem_prime_mmap_info(obj);
+}
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
@@ -792,6 +803,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
 	.mmap = drm_gem_dmabuf_mmap,
+	.mmap_info = drm_gem_dmabuf_mmap_info,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..797c0f8c2dd0 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -355,6 +355,13 @@ struct drm_driver {
 	 */
 	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+	/**
+	 * @gem_prim_mmap_info:
+	 *
+	 * Get info about mmap setup by gem_prime_mmap.  See dma_buf_ops:mmap_info.
+	 */
+	int (*gem_prime_mmap_info)(struct drm_gem_object *obj);
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.36.1

