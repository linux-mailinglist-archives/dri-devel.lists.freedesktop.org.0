Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B447D2C62A5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFE36EBAC;
	Fri, 27 Nov 2020 10:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F816E844;
 Thu, 26 Nov 2020 08:28:45 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gj5so1644608ejb.8;
 Thu, 26 Nov 2020 00:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RE/xM2EQ4ie5bNoZ/Tgb5zG1vYn52jD8l8KkGA0b1e0=;
 b=uO5tVeJ5ECYefjP3f7fZrFkdPo9iSKs/GZ1Y3MtaYMfsumcb6QESFMhE2U60qIFvBS
 RlOLkmRqHN+Z2qdDYu1Pm1C9blFEFGFwBNx5n4JKMkn9hemTqPpnzBlwfcc+1FaIGs14
 /oOn9AiSD6XBJlUkKohXeSYAyDaqeO06JGr2bhx+5LEg1p1k0FTZxzVEdifZocJX1H2O
 SPSJWhT1Zk8FVjf6SLpIe7AOwzxNnFQ6F1lpPo2TwaPYXOmur6qzeJuOVgw97+RJ5aK1
 pecvc1W5KsaDPt/G3BvUThZisxIKnnG85fUIpVyRcCURIrYlSmVV+gCjZ1IxuQ+RNqFa
 2XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RE/xM2EQ4ie5bNoZ/Tgb5zG1vYn52jD8l8KkGA0b1e0=;
 b=iI05CddaSMpyTVYMwZc8Dy0XriwDu/ysZNTyKWPZkNCBmUckFzHnP7bQAE9Y1muXFs
 G4Oad1jzz/yvssSzPq48l/nrOCd1JaGTMpGFFpnfLNVz8f+71rheEh9eH93YaGQOkgJY
 Z3l2ULfmFRTpKqRgpaa3ZwyHRTUI1psK7XgFBmVIAq6TQttp+BCXjIC3fmw0rKoTB+p/
 D1o34UND18c7A/pmy/og+yCh6bI+5iFuCR2/DONGOFV/Ntvzc4Ce4i10SOGJtbe2luOJ
 gUQUBgJpBTmyOXSkzv4X150MyY1WcdZNag0FIIqqT1nDjO6tiiSME890VhWwcS2/XFX2
 5btg==
X-Gm-Message-State: AOAM531s3PMBan82t7aUy9HlXaSF9XeuVR3Rilks5Snwm5LAZjSVG1FG
 +NlIq3dsYnZwXCP/Bgf7aVU=
X-Google-Smtp-Source: ABdhPJwohLHG1zO5BWX7ZH3w7w1t09xLT1Zg+Cwc6CXMtDUe43P0939oWKeWv4fPOb2+J7MvN8F9FA==
X-Received: by 2002:a17:906:b0f:: with SMTP id
 u15mr1686801ejg.109.1606379324217; 
 Thu, 26 Nov 2020 00:28:44 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id u23sm2581647ejy.87.2020.11.26.00.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 00:28:43 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm: Fix use-after-free in msm_gem with carveout
Date: Thu, 26 Nov 2020 10:28:17 +0200
Message-Id: <20201126082817.1242995-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using gem with vram carveout the page allocation is managed via
drm_mm. The necessary drm_mm_node is allocated in add_vma, but it freed
before the drm_mm_node has been deallocated leading to use-after-free on
every single vram allocation.

Currently put_iova is called before free_object.

	put_iova -> del_vma -> kfree(vma) // vma holds drm_mm_node

	free_object -> put_pages -> put_pages_vram
				 -> drm_mm_remove_node

It looks like del_vma does nothing else other than freeing the vma
object and removing it from it's list, so delaying the deletion should
be harmless.

This patch splits put_iova in put_iova_spaces and put_iova_vmas, so the
vma can be freed after the mm_node has been deallocated with the mm.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 15715a156620f..b83247202ea5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -355,18 +355,31 @@ static void del_vma(struct msm_gem_vma *vma)
 
 /* Called with msm_obj locked */
 static void
-put_iova(struct drm_gem_object *obj)
+put_iova_spaces(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+	struct msm_gem_vma *vma;
 
 	WARN_ON(!msm_gem_is_locked(obj));
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
+	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
 			msm_gem_purge_vma(vma->aspace, vma);
 			msm_gem_close_vma(vma->aspace, vma);
 		}
+	}
+}
+
+/* Called with msm_obj locked */
+static void
+put_iova_vmas(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct msm_gem_vma *vma, *tmp;
+
+	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		del_vma(vma);
 	}
 }
@@ -688,12 +701,14 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
-	put_iova(obj);
+	put_iova_spaces(obj);
 
 	msm_gem_vunmap(obj);
 
 	put_pages(obj);
 
+	put_iova_vmas(obj);
+
 	msm_obj->madv = __MSM_MADV_PURGED;
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
@@ -942,7 +957,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 
 	msm_gem_lock(obj);
 
-	put_iova(obj);
+	put_iova_spaces(obj);
 
 	if (obj->import_attach) {
 		WARN_ON(msm_obj->vaddr);
@@ -965,6 +980,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 		msm_gem_unlock(obj);
 	}
 
+	put_iova_vma(obj);
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj);

base-commit: 6147c83fd749d19a0d3ccc2f64d12138ab010b47
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
