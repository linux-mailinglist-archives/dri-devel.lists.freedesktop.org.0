Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C6586F3D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AE510EC08;
	Mon,  1 Aug 2022 17:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED8510E704;
 Mon,  1 Aug 2022 17:04:34 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y15so11014202plp.10;
 Mon, 01 Aug 2022 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FldoPR8BVfM3iFKwCM1XMFRXAR81Z32eid0v1j3G9ms=;
 b=P5t1olBIPvtepOhoWbKkkUVf08sqYRhi/TWm0yi84qISkPToL9ZOLKl9vbFjIhS8b6
 bYTGbV0qB/1eFZxubi3BGt7V+ba/RPrbVnj2ybfRDE1e4/zGNVRt84kxHdnCLYh48VMh
 yGWtynCaP4Gs4beiBVSZtPZ0zuPSDeZMuSQBe8GFNhIaaWNaRxYXfhpdFWnH1+8BSYla
 B1QVJcxpfiKeMa0GZm7VYaXkCIdRz302vr8+YYr5MmLE0Q93QpYRn8tB1hjqLiaZg6Qv
 0gVNQbMUetaPGuhYCUUlsObNnTVxyaUBmhWs2DGHn17+baKEzk962HChc/qyqhDF4zRo
 8x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FldoPR8BVfM3iFKwCM1XMFRXAR81Z32eid0v1j3G9ms=;
 b=w/KhfHUi7Zh4+fEUtoeez5d4fHoZkUVPK0ufmoAfQJTxRlcju7lNY6I2O4rhr4LqiS
 mFMk8WqDkCqyfMobpaBVa3iq+Rs5Zld9aqcdo0lAulHMiGxqvFMiFTBaG+Ywft1b1Umf
 XT6skH6/UfUdRZyxS3GJ+Znkt/JPw9YEfMgaVZkj/BJ11vxgv7DDwe46TvSSPGcrAHwu
 vyFSu7auC9wELga1+HpI7VwhmSuL3ufZdhgy1OF0sFBO8gu5/H5RvZeL8wXtZSwxqvLx
 Z0xeKr3W1+a7GGwp08O/DioegU3UWGVAQ8PNEs2dfIeRlN7k5j/nbN2FEE1KRfrl9M1G
 sdsg==
X-Gm-Message-State: ACgBeo2Rn7okyMNwt7PpEPyj2czEwlA4d046tvnYuJ8TR5y/5RlKlLIr
 pKKjGj6/Y8BmRs7D3YZ+1z+ELZczocw=
X-Google-Smtp-Source: AA6agR7RKmYUgh7A3D15hwwh+KxJFk2yHczvexmfofd2/7qJwEl8Vx18v5W+zk5ElLXMIRH6WGWqOg==
X-Received: by 2002:a17:902:e945:b0:16b:f802:1660 with SMTP id
 b5-20020a170902e94500b0016bf8021660mr17490083pll.7.1659373473559; 
 Mon, 01 Aug 2022 10:04:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170902ced100b0016d9877d3bfsm9937250plg.32.2022.08.01.10.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:04:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/prime: Wire up mmap_info support
Date: Mon,  1 Aug 2022 10:04:56 -0700
Message-Id: <20220801170459.1593706-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801170459.1593706-1-robdclark@gmail.com>
References: <20220801170459.1593706-1-robdclark@gmail.com>
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

