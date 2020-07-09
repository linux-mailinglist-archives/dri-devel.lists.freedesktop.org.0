Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62321A906
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 22:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014F76EB2D;
	Thu,  9 Jul 2020 20:32:08 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAD46EB2D
 for <dri-devel@freedesktop.org>; Thu,  9 Jul 2020 20:32:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594326727; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/YQzaclXXVll+oHhpmXvlwvvQSukbA3wfGfVXn7TwMM=;
 b=WaXu5cc7h+KMnb3FK4o2FN8gOKVLkD5GAr0AB5Nax8d7Q6ouygani+xM8MFyFnwmXAXKObiK
 dGMwLd4HvlmmGtYOJwq+h61AJUJmbxZiLlMSEcKdyAtgASb3zo7+NGVTDVG9jEoFZWK4ogkU
 y2yd1/UyPjFqLlUcQJUxse6B16w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f077ec6d07c135855003a3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:32:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14497C433CB; Thu,  9 Jul 2020 20:32:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DE6DC433C6;
 Thu,  9 Jul 2020 20:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DE6DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v1] drm/msm: Fix a null pointer access in
 msm_gem_shrinker_count()
Date: Fri, 10 Jul 2020 02:01:55 +0530
Message-Id: <1594326715-21565-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding an msm_gem_object object to the inactive_list before completing
its initialization is a bad idea because shrinker may pick it up from the
inactive_list. Fix this by making sure that the initialization is complete
before moving the msm_obj object to the inactive list.

This patch fixes the below error:
[10027.553044] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
[10027.573305] Mem abort info:
[10027.590160]   ESR = 0x96000006
[10027.597905]   EC = 0x25: DABT (current EL), IL = 32 bits
[10027.614430]   SET = 0, FnV = 0
[10027.624427]   EA = 0, S1PTW = 0
[10027.632722] Data abort info:
[10027.638039]   ISV = 0, ISS = 0x00000006
[10027.647459]   CM = 0, WnR = 0
[10027.654345] user pgtable: 4k pages, 39-bit VAs, pgdp=00000001e3a6a000
[10027.672681] [0000000000000068] pgd=0000000198c31003, pud=0000000198c31003, pmd=0000000000000000
[10027.693900] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[10027.738261] CPU: 3 PID: 214 Comm: kswapd0 Tainted: G S                5.4.40 #1
[10027.745766] Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
[10027.752472] pstate: 80c00009 (Nzcv daif +PAN +UAO)
[10027.757409] pc : mutex_is_locked+0x14/0x2c
[10027.761626] lr : msm_gem_shrinker_count+0x70/0xec
[10027.766454] sp : ffffffc011323ad0
[10027.769867] x29: ffffffc011323ad0 x28: ffffffe677e4b878
[10027.775324] x27: 0000000000000cc0 x26: 0000000000000000
[10027.780783] x25: ffffff817114a708 x24: 0000000000000008
[10027.786242] x23: ffffff8023ab7170 x22: 0000000000000001
[10027.791701] x21: ffffff817114a080 x20: 0000000000000119
[10027.797160] x19: 0000000000000068 x18: 00000000000003bc
[10027.802621] x17: 0000000004a34210 x16: 00000000000000c0
[10027.808083] x15: 0000000000000000 x14: 0000000000000000
[10027.813542] x13: ffffffe677e0a3c0 x12: 0000000000000000
[10027.819000] x11: 0000000000000000 x10: ffffff8174b94340
[10027.824461] x9 : 0000000000000000 x8 : 0000000000000000
[10027.829919] x7 : 00000000000001fc x6 : ffffffc011323c88
[10027.835373] x5 : 0000000000000001 x4 : ffffffc011323d80
[10027.840832] x3 : ffffffff0477b348 x2 : 0000000000000000
[10027.846290] x1 : ffffffc011323b68 x0 : 0000000000000068
[10027.851748] Call trace:
[10027.854264]  mutex_is_locked+0x14/0x2c
[10027.858121]  msm_gem_shrinker_count+0x70/0xec
[10027.862603]  shrink_slab+0xc0/0x4b4
[10027.866187]  shrink_node+0x4a8/0x818
[10027.869860]  kswapd+0x624/0x890
[10027.873097]  kthread+0x11c/0x12c
[10027.876424]  ret_from_fork+0x10/0x18
[10027.880102] Code: f9000bf3 910003fd aa0003f3 d503201f (f9400268)
[10027.886362] ---[ end trace df5849a1a3543251 ]---
[10027.891518] Kernel panic - not syncing: Fatal exception

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6277fde..f63bb7e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -994,10 +994,8 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
-		struct drm_gem_object **obj,
-		bool struct_mutex_locked)
+		struct drm_gem_object **obj)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1023,15 +1021,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	INIT_LIST_HEAD(&msm_obj->submit_entry);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
-	if (struct_mutex_locked) {
-		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-	} else {
-		mutex_lock(&dev->struct_mutex);
-		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
-		mutex_unlock(&dev->struct_mutex);
-	}
-
 	*obj = &msm_obj->base;
 
 	return 0;
@@ -1041,6 +1030,7 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		uint32_t size, uint32_t flags, bool struct_mutex_locked)
 {
 	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj = NULL;
 	bool use_vram = false;
 	int ret;
@@ -1061,14 +1051,15 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, &obj, struct_mutex_locked);
+	ret = msm_gem_new_impl(dev, size, flags, &obj);
 	if (ret)
 		goto fail;
 
+	msm_obj = to_msm_bo(obj);
+
 	if (use_vram) {
 		struct msm_gem_vma *vma;
 		struct page **pages;
-		struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 		mutex_lock(&msm_obj->lock);
 
@@ -1103,6 +1094,15 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 	}
 
+	if (struct_mutex_locked) {
+		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	} else {
+		mutex_lock(&dev->struct_mutex);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+		mutex_unlock(&dev->struct_mutex);
+	}
+
 	return obj;
 
 fail:
@@ -1125,6 +1125,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev,
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	uint32_t size;
@@ -1138,7 +1139,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj, false);
+	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
 	if (ret)
 		goto fail;
 
@@ -1163,6 +1164,11 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	}
 
 	mutex_unlock(&msm_obj->lock);
+
+	mutex_lock(&dev->struct_mutex);
+	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	mutex_unlock(&dev->struct_mutex);
+
 	return obj;
 
 fail:
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
