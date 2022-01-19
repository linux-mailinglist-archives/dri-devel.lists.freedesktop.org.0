Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9664949D7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E610E8EF;
	Thu, 20 Jan 2022 08:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7810EEE3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:23:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c24so6555299edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lFHQBay/q6+NnOl2SII/Ps5xmFarxwMCV5ET8Tr+2Ks=;
 b=l6aA2GXwD+dROz0YFw7ehLY4dgmbv+40TX9Ts7qiofcKfAz1LVs0R3DSVj2z1JgvrI
 UTJYZGGFgMga7wQ7dNkAuQ28hO/tbaI25Iom3JFsi5NJV6vJKBchKpoAdJ1kSh3Sa4sQ
 1xC9a22YkHOilOyROJcXMRvr0SpynVcs42gKIiD35iZn3XEjjpkyGKhdS5xUqKSHeOZr
 SOyxQrHyxMc2Srp/Oa8yMQj8Zfb7gwRDiVRFJDh2zWdAWVp8VEEXb09XRX+UxHdwllWt
 0wGpb2TGO8/vDZrYoKQDorxodoQqpbl8pn0WJs5BtEvipjuuGG/2wdUrIeBkhAjEFouW
 rU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lFHQBay/q6+NnOl2SII/Ps5xmFarxwMCV5ET8Tr+2Ks=;
 b=4gSTdkxknWpgCmanknD1s1vO36RlwaURJhnZ8l9qiuKWot3FS0/LVhINrvQdcgeNsm
 vhdqWTwUQS9eakuWivgqahlLjuao+BPtpblCQG+AvTf5+tb5cUmZq8Bj3GVKwMxqgtoF
 rVkvGMFkKsk7gDaM7AuHIponCz/0P9SRHMRg6DKuad3Hzsd+K52JzsUgNCUPcGiONoNw
 LWg9yLJQw4kxn2hUYRZe8fnqLyA3bn7MeoAWv0f/EzMq7qFTLSm9EfSqJ9131p8K/dVK
 M0o02gkg8ZjMe7sAzyIXWsX1UO6sguw7tJ17+14CAt55m/ER9LDdu3Wbvxpz66m7COnz
 43Hw==
X-Gm-Message-State: AOAM5306u2V5Zfvel1NR9jYv68J7q6ee3X9hp3uU71FKuqQuHBVWaIuL
 nJ0jU45w0w4uywySWTLNmiMa7OnxvSg=
X-Google-Smtp-Source: ABdhPJy5WBJKHzb6nGWtktk0x3HF73uuNdLuGC6azC1gyuoMx0eXFpasQ2c/ScKtGXV4Kkoc8E5bcA==
X-Received: by 2002:a17:906:9750:: with SMTP id
 o16mr23715220ejy.410.1642587822170; 
 Wed, 19 Jan 2022 02:23:42 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
 by smtp.gmail.com with ESMTPSA id b4sm3456546ejb.131.2022.01.19.02.23.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:23:41 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/3] drm: omapdrm: simplify omap_gem_pin
Date: Wed, 19 Jan 2022 12:23:09 +0200
Message-Id: <1642587791-13222-2-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tony@atomide.com,
 merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move tiler related code to its own function.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 75 +++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b0fa174..bb12cb4 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -750,6 +750,46 @@ void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,
 	}
 }
 
+static int omap_gem_pin_tiler(struct drm_gem_object *obj)
+{
+	struct omap_gem_object *omap_obj = to_omap_bo(obj);
+	u32 npages = obj->size >> PAGE_SHIFT;
+	enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
+	struct tiler_block *block;
+	int ret;
+
+	BUG_ON(omap_obj->block);
+
+	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
+		block = tiler_reserve_2d(fmt, omap_obj->width, omap_obj->height,
+					 PAGE_SIZE);
+	} else {
+		block = tiler_reserve_1d(obj->size);
+	}
+
+	if (IS_ERR(block)) {
+		ret = PTR_ERR(block);
+		dev_err(obj->dev->dev, "could not remap: %d (%d)\n", ret, fmt);
+		goto fail;
+	}
+
+	/* TODO: enable async refill.. */
+	ret = tiler_pin(block, omap_obj->pages, npages, omap_obj->roll, true);
+	if (ret) {
+		tiler_release(block);
+		dev_err(obj->dev->dev, "could not pin: %d\n", ret);
+		goto fail;
+	}
+
+	omap_obj->dma_addr = tiler_ssptr(block);
+	omap_obj->block = block;
+
+	DBG("got dma address: %pad", &omap_obj->dma_addr);
+
+fail:
+	return ret;
+}
+
 /**
  * omap_gem_pin() - Pin a GEM object in memory
  * @obj: the GEM object
@@ -774,11 +814,6 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 
 	if (!omap_gem_is_contiguous(omap_obj) && priv->has_dmm) {
 		if (refcount_read(&omap_obj->dma_addr_cnt) == 0) {
-			u32 npages = obj->size >> PAGE_SHIFT;
-			enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
-			struct tiler_block *block;
-
-			BUG_ON(omap_obj->block);
 
 			refcount_set(&omap_obj->dma_addr_cnt, 1);
 
@@ -786,35 +821,9 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 			if (ret)
 				goto fail;
 
-			if (omap_obj->flags & OMAP_BO_TILED_MASK) {
-				block = tiler_reserve_2d(fmt,
-						omap_obj->width,
-						omap_obj->height, PAGE_SIZE);
-			} else {
-				block = tiler_reserve_1d(obj->size);
-			}
-
-			if (IS_ERR(block)) {
-				ret = PTR_ERR(block);
-				dev_err(obj->dev->dev,
-					"could not remap: %d (%d)\n", ret, fmt);
-				goto fail;
-			}
-
-			/* TODO: enable async refill.. */
-			ret = tiler_pin(block, omap_obj->pages, npages,
-					omap_obj->roll, true);
-			if (ret) {
-				tiler_release(block);
-				dev_err(obj->dev->dev,
-						"could not pin: %d\n", ret);
+			ret = omap_gem_pin_tiler(obj);
+			if (ret)
 				goto fail;
-			}
-
-			omap_obj->dma_addr = tiler_ssptr(block);
-			omap_obj->block = block;
-
-			DBG("got dma address: %pad", &omap_obj->dma_addr);
 		} else {
 			refcount_inc(&omap_obj->dma_addr_cnt);
 		}
-- 
1.9.1

