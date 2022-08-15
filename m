Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D771A593EA4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 23:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8246D50C2;
	Mon, 15 Aug 2022 21:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3232E10EEF3;
 Mon, 15 Aug 2022 21:14:55 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id y141so7621574pfb.7;
 Mon, 15 Aug 2022 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dTc3puoo2xv02+7+HIFO9LAkjK/P01/XbA/vkW8hPyo=;
 b=lUo9El7WmA0vaXppLobZTZwSSO4s3aBGpAdCeA3hM0xWiJE1bO0cX4scbqYfWAPcUv
 tCcM3DxIffFblEb6QQB5cyOd6W+L/5Cq0v34kx5zPkHZ7qe5mZyflu4PhCBZfSlHYZ6h
 U9AMe0FKCi93jdyTMnsrGn5mMtYnChc8odfjK8lj8WVBKHji3tEISpdoEqnfvqIOm6oo
 cso4B9WPu/wPNPLbjE/CZF7PAkFNeZD/YkWFhACAlvMWPJOwgPPu+HqFx51I/6vQj4LJ
 a4zevWUjQGkmiey6vsvoILQwBaYEJrlo6fC3TeQyY/3J1A+KhRuv29cQgRtNnvM7CIuq
 ccJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dTc3puoo2xv02+7+HIFO9LAkjK/P01/XbA/vkW8hPyo=;
 b=0GeKU3jsXUmIr8cJGUyYbMHxqiEaZ6rcjHfeDmW3sxVP43/uxT7JZtcI8+2ybwY0FD
 4IrbqvHgcTJA2YR+YflfxWl6TqhiiMSEgkc9yrIwSrvS2liGzzpc2moSzp8MmrSjVW4d
 xM1M02oZ7o3I60kzpzbFDaRTXE5c0MUs3nO1d8NfA7/FGJA/hANV72QnIZ32ilwpO2vc
 cBMfzzuBk0RA+Xfmhu18aRIpr6MAUB1sKQUTZDbZHJ6qu0mt8H4xr7MPyFM+wpKLJ6uI
 9KdeKAYXSecr/+oYCUgvzvHoPTHfXGpLvs8Unu2j83lTXwwOS+4816dA84mqqFnFnDNs
 qsQA==
X-Gm-Message-State: ACgBeo2bpAT8aa5PzjFFOFENTCOxzxrqbsR8ZgZ4G99ztAGM9GefaBxn
 diqe130oNvzudyuB7rUIrf5nQVXyqFk=
X-Google-Smtp-Source: AA6agR40Ony4nyLZFzq0XayICdaN3uMIdS5sXW5BLIENRDX2jxVXcH5BdrTr3WQTtUckfu7UWR7o0g==
X-Received: by 2002:a63:8049:0:b0:41b:e8db:d912 with SMTP id
 j70-20020a638049000000b0041be8dbd912mr15075841pgd.380.1660598094195; 
 Mon, 15 Aug 2022 14:14:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee26224a4sm7384427plm.305.2022.08.15.14.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 14:14:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/prime: Wire up mmap_info support
Date: Mon, 15 Aug 2022 14:15:13 -0700
Message-Id: <20220815211516.3169470-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815211516.3169470-1-robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Just plumbing the thing thru an extra layer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_prime.c |  3 +++
 include/drm/drm_gem.h       | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..4457fedde1ec 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -888,6 +888,9 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 		.resv = obj->resv,
 	};
 
+	if (obj->funcs && obj->funcs->map_info)
+		exp_info.map_info = obj->funcs->map_info(obj);
+
 	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 EXPORT_SYMBOL(drm_gem_prime_export);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index f28a48a6f846..a573ebfc529a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -172,6 +172,17 @@ struct drm_gem_object_funcs {
 	 * This is optional but necessary for mmap support.
 	 */
 	const struct vm_operations_struct *vm_ops;
+
+	/**
+	 * @map_info:
+	 *
+	 * Return dma_buf_map_info indicating the coherency of an exported
+	 * dma-buf.
+	 *
+	 * This callback is optional.  If not provided, exported dma-bufs are
+	 * assumed to be DMA_BUF_MAP_INCOHERENT.
+	 */
+	enum dma_buf_map_info (*map_info)(struct drm_gem_object *obj);
 };
 
 /**
-- 
2.36.1

