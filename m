Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C8706BC1
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4410E43B;
	Wed, 17 May 2023 14:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28810E435
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:52:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d20548adso605289f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335169; x=1686927169; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=;
 b=iG7od/evTKtot/nJm1gK/1OL6Lc2v1Bmw9HJrvZNepXY3d+ijpP+DWiwPAyVpH4pE1
 whGLUhjKSF4oMqvwtGaC3U7qu0JGLJf2iHcaZHG/KUWeDATqb+7kMGgK4oAbo+BiDQwI
 jpxA3KkT4mge9b6qQfuW6PavzHMyngFUeL5rUs8wtlXokzk0Gl/ytdd5BZqb0/1Z5e/Y
 cIV4AMhkBECqg1zNTCLE/3Y42tLbWIq2Tz99acBQU/rwUfG6htIKFOBvud87i13WKEpC
 cNz6RrsgVyoegDNgLU4Dj6l4jtXBZeukG92pSorCCUG0L5/O72DQRlJqUtdW4XruFu5P
 MPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335169; x=1686927169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=;
 b=Hn1BWKFtobSJm+d/Xx1uTTk6dRqBJlgvPnngz7CdKSsejxq1MkqD/XxB8Gb5/DurzD
 HvfwpyANA5LJ3JQ1TQyIIG3yzBQDriOmMQpYitQyDyGJdHscGTd298jKrvjCHote7qCA
 M9cz1aDarCUw0RPDHh+5eViZkP2jkx/HxrXmla9FSMS1+Cpd5oIH+oaVJ6Lu8y4phm5b
 N6lu6LPHSV7HxyvBMUCp7R7d2FoRJpw5+RNqKh+28sHzvP2b0kXLYi7MczfSOOd4cYke
 7JFDIYgP/82FrrtaaM7egZgJPu4BlCj7J6tULnM0rkfrEgR4FwTabHrwUbd9KJ6mb4HN
 H0SA==
X-Gm-Message-State: AC+VfDzRSNilGapvgWig1BfofowVKq8U08BygeWf+vvc6ws7uUvx7R8l
 o6WGvxbAiEo/g1DF/9np2cinwg==
X-Google-Smtp-Source: ACHHUZ5uCAqHjUKdV/6t3weODX6sjiburDexUUIvFFfFHhqo6Yq6iD6TS/qXA3nyRGAEZJG5rutnCQ==
X-Received: by 2002:a5d:4cc9:0:b0:2fb:7099:6070 with SMTP id
 c9-20020a5d4cc9000000b002fb70996070mr839383wrt.47.1684335169252; 
 Wed, 17 May 2023 07:52:49 -0700 (PDT)
Received: from blaptop.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 07:52:48 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 5/7] drm/apu: allow platform driver to implement their own
 mmap function
Date: Wed, 17 May 2023 16:52:35 +0200
Message-Id: <20230517145237.295461-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Julien Stephan <jstephan@baylibre.com>

By default we will call drm_gem_mmap() unless the apu driver has
declared it's own mmap handler.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Reviewed-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/apu/apu_drv.c      | 38 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/apu/apu_internal.h |  2 ++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/apu/apu_drv.c b/drivers/gpu/drm/apu/apu_drv.c
index a0dce785a02a..703d4515f075 100644
--- a/drivers/gpu/drm/apu/apu_drv.c
+++ b/drivers/gpu/drm/apu/apu_drv.c
@@ -29,7 +29,20 @@ static const struct drm_ioctl_desc ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_DMA_FOPS(apu_drm_ops);
+static int apu_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+
+static const struct file_operations apu_drm_ops = {
+	.owner          = THIS_MODULE,
+	.open           = drm_open,
+	.release        = drm_release,
+	.unlocked_ioctl = drm_ioctl,
+	.compat_ioctl   = drm_compat_ioctl,
+	.poll           = drm_poll,
+	.read           = drm_read,
+	.llseek         = noop_llseek,
+	.mmap           = apu_drm_gem_mmap,
+	DRM_GEM_DMA_UNMAPPED_AREA_FOPS
+};
 
 static struct drm_driver apu_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -45,6 +58,29 @@ static struct drm_driver apu_drm_driver = {
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_dma_dumb_create),
 };
 
+/**
+ * apu_drm_gem_mmap()
+ *
+ * @filp: DRM file pointer
+ * @vma: VMA for the area to be mapped
+ *
+ * by default will call drm_gem_mmap() unless the apu driver has declared it's
+ * own mmap handler
+ *
+ */
+static int apu_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+	struct apu_drm *apu = dev->dev_private;
+
+	if (apu->mmap)
+		return apu->mmap(filp, vma);
+	else
+		return drm_gem_mmap(filp, vma);
+}
+
+
 /**
  * apu_dev_alloc() - Allocate a new APU device
  *
diff --git a/drivers/gpu/drm/apu/apu_internal.h b/drivers/gpu/drm/apu/apu_internal.h
index ea4183f3fb15..46e0b2be7821 100644
--- a/drivers/gpu/drm/apu/apu_internal.h
+++ b/drivers/gpu/drm/apu/apu_internal.h
@@ -45,6 +45,8 @@ struct apu_drm {
 	struct iova_domain iovad;
 	int iova_limit_pfn;
 
+	int (*mmap)(struct file *filp, struct vm_area_struct *vma);
+
 	struct list_head cores;
 	struct list_head node;
 
-- 
2.39.2

