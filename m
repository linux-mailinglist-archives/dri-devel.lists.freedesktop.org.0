Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E62C629B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390806EB92;
	Fri, 27 Nov 2020 10:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BE06E946;
 Thu, 26 Nov 2020 13:02:31 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id mc24so2824615ejb.6;
 Thu, 26 Nov 2020 05:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QY7dh3vckMKD6ltiTnksJuU8XWzuwGJAwKPsT1GH95k=;
 b=fESxPUs/SuTDJqRxWAuiI526aY/jWEhn8FEf/I+/puc7bZSLa+Ekx6q2XHo8F3N4Gk
 McczI6dT0/kWPHOJhHgQCpa7dB7e7YAAsorvgmYAjw+TJQR1MSfbuZ8F0N72mMImeSj+
 WaMTOCPpx85Yrx1srZ0Duxpq0l/KOoZ+JoIzrWmBCLCG8+DW0KcPH1XRdNeo1l1AT7Jz
 vyvz+EJ9/a9Ti3FrVWzo1DSXG0nzUwoKaWSiOMyVJGRteeLZoE9/Vd0g1d1A1CnOTBch
 iefGXSd562MU1daLguSxVuSYz48gbB4cw9V2VrpWT1ohWxBZWfHUGKX7gVMhZayptsdN
 6tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QY7dh3vckMKD6ltiTnksJuU8XWzuwGJAwKPsT1GH95k=;
 b=oS+kMS/v0J4xRbF65bKBJPaQ+JbgPiWPR+FpAE8U3Hf5Ao4dhpWm69JsE1WNd72thb
 oNmeDmbN4WriShDWCo9JBdNkIImp1I5NPqoEehPYkECLUCyucHD7smPFbyJ7iHJJJT8w
 zN8TtDoc2G3vDAN9vpG+7pMe+yQ0u1w/okXpuxnF7B4BBWnOrVviR0npd46B6Mehj8TC
 RKhiO8G/Vm7Rr9BDJZwaxgobD/RI37mOjqxxFtW+2QOdbx+95x/iBkCpBDnr6rIcrwHn
 FRZWBUQMkqsQzgj4KdtWzpMd51L9z9XBY7ILvmfqrCUqb6OadZZpxWmiyiI7+Tk9tfvC
 FQpQ==
X-Gm-Message-State: AOAM533IOoA4uj4CLSAiyhgVKV+yG8Ejy1zmrdgvk5wAf4/hEooWgyaQ
 ooJVh5SAlV8xJJ0e3U9bfao=
X-Google-Smtp-Source: ABdhPJwVFv4wBEiQMW6J55O5DFXO9OXLz5XqS6hm2ntps1LABNFAjygVJ6W5qcIzFMtXZIXRJo5khQ==
X-Received: by 2002:a17:906:7c56:: with SMTP id
 g22mr2526763ejp.282.1606395749956; 
 Thu, 26 Nov 2020 05:02:29 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id t11sm3030276ejx.68.2020.11.26.05.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 05:02:29 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH v2] drm/msm: Fix use-after-free in msm_gem with carveout
Date: Thu, 26 Nov 2020 15:02:23 +0200
Message-Id: <20201126130223.1663853-1-iskren.chernev@gmail.com>
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
drm_mm. The necessary drm_mm_node is allocated in add_vma, but it is
referenced in msm_gem_object as well. It is freed before the drm_mm_node
has been deallocated leading to use-after-free on every single vram
allocation.

Currently put_iova is called before put_pages in both
msm_gem_free_object and msm_gem_purge:

	put_iova -> del_vma -> kfree(vma) // vma holds drm_mm_node
	/* later */
	put_pages -> put_pages_vram -> drm_mm_remove_node(
						msm_obj->vram_node)
				 	// vram_node is a ref to
					// drm_mm_node; in _msm_gem_new

It looks like del_vma does nothing else other than freeing the vma
object and removing it from it's list, so delaying the deletion should
be harmless.

This patch splits put_iova in put_iova_spaces and put_iova_vmas, so the
vma can be freed after the mm_node has been deallocated with the mm.

Note: The breaking commit separated the vma allocation from within
msm_gem_object to outside, so the vram_node reference became outside the
msm_gem_object allocation, and freeing order was therefore overlooked.

Fixes: 4b85f7f5cf7 ("drm/msm: support for an arbitrary number of address spaces")
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
v1: https://lkml.org/lkml/2020/11/26/130

Changes in v2:
- patch now compiles (oops)
- improve commit message
- add fixes tag

 drivers/gpu/drm/msm/msm_gem.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 15715a156620f..dfe6387c62c86 100644
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
+	WARN_ON(!msm_gem_is_locked(obj));
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

+	put_iova_vmas(obj);
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
