Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B173985F7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2206EC27;
	Wed,  2 Jun 2021 10:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CEE6EC3D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jt22so3003963ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jnQq72+JO1BIyLYzEE5E18Rg96h+FVtRl0xhLQBiCDc=;
 b=WkvMcftqM13OV2CMSEA5HmzJk9Se1oY+o7E9dMB3LuEFgizw0OQG3f9JD1RkdlX2TM
 WXLbVBknzGK4o0VuAq02893ENH7Ezmrw9msboItNyChLu8JI44xqd9o6yhezv3n9R/yJ
 3mHvA1+80IET/QtZV4DF/aoTxNqLeeSvTbX77hU8jWzjxlkrJkEKdP0tOynCR9TkrKEh
 XjCgyy3J541QCT2W5QNszS/edCfCxttvSnOJAC+lAe7WN//K19ATt6L7d6BQqhiWXEHF
 jR8p000giA977X5I09Pt9MKSMfFj1hGjcrgWs2Xydw2aWS3aoVg+whuKTk3/ANTHuy8O
 zTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnQq72+JO1BIyLYzEE5E18Rg96h+FVtRl0xhLQBiCDc=;
 b=TPFqEXO6C1GC6krbNQtg70Q9SM9FHg5ZDSpj4jeTw/6VRmaCKOz8GqC2OZ+Oqkftew
 cYx2GKLrVABHe1jx+37gNMLuNNDPsd7dwMhSj/CdcP3fk9Htln72At/K0bBmr4k1+S4o
 MCvwJNzuXYGOCfdlPR2//iCsSlZEefsmPZZkEtmEdgMK+bgnAtd3NkoDvNCRzZhoLILV
 1SetlEtL2XiW6mfXkbID61YCnRy+Zv9+KmUKXAzGHLLi2swl940b9E3R+QAQOx7LKbi7
 K/rO2Qr2394cIfjbR+o9US7QUfgq0K9i6pyoc+7gutT70mGQz5LDvS2+u7IT9TmccNMz
 P0Ew==
X-Gm-Message-State: AOAM530RPKu0/huHCk1WX3Fg8rwbXmOaMG6ZSuSwYh4DOFm5ySFLbPV1
 1akINyWAsoB/a784OaMBPE4=
X-Google-Smtp-Source: ABdhPJwlHd2V44B0EZjQicfidyv0jmgQOZi9vfnxsVhw56As29ds40c+crtQ8z38CujD79s7s0HsZg==
X-Received: by 2002:a17:906:b2c1:: with SMTP id
 cf1mr33064776ejb.544.1622628560684; 
 Wed, 02 Jun 2021 03:09:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] drm/nouveau: switch the TTM backends to self alloc
Date: Wed,  2 Jun 2021 12:09:12 +0200
Message-Id: <20210602100914.46246-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to the TTM range manager.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.h | 1 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 7df3848e85aa..3a6a1be2ed52 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -13,6 +13,7 @@ nouveau_mem(struct ttm_resource *reg)
 }
 
 struct nouveau_mem {
+	struct ttm_resource base;
 	struct nouveau_cli *cli;
 	u8 kind;
 	u8 comp;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index b08b8efeefba..1ac2417effc0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -58,6 +58,8 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 	if (ret)
 		return ret;
 
+	ttm_resource_init(bo, place, reg->mm_node);
+
 	ret = nouveau_mem_vram(reg, nvbo->contig, nvbo->page);
 	if (ret) {
 		nouveau_mem_del(reg);
@@ -86,6 +88,7 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 	if (ret)
 		return ret;
 
+	ttm_resource_init(bo, place, reg->mm_node);
 	reg->start = 0;
 	return 0;
 }
@@ -111,6 +114,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 	if (ret)
 		return ret;
 
+	ttm_resource_init(bo, place, reg->mm_node);
 	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
 			   (long)reg->num_pages << PAGE_SHIFT, &mem->vma[0]);
 	if (ret) {
-- 
2.25.1

