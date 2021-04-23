Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B1369ABC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 21:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050826EC4E;
	Fri, 23 Apr 2021 19:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECDD6EC3F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:16 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id v7so22608108qkj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xJl3e5+bs5xqB+lF7D0IwdsLJO17snjwANXkX2D6wU=;
 b=yFL1c6CkBYFO5JvUiub7cftnWbdO+hwi+wprHjCffpYFQ9zqO0puXavnOKEyKqE88M
 Sz6qq1w8ugjMiCyhYwEETsIa6u5706n8155YOcMYS4yk1e9NBG1s5lIACSc1wTvDpqLt
 kCNK2YVcA7BElhE1qHDkGM0bh5VtJjJ5B9LXxOp6m97rV906P64zWI1cci3mE+xpQhPM
 oLOWM9D839/LDjt1Fih68q2xgwel149qbW9n+abS9DHT0KewIKCi+h2NT+ht+iiiIb4A
 mweOQW8fEAA+pIN08b6Y3c/hPxkrTq8gLsgcxq1t5tmrC8dG1sCAfIwPrsLosyUz3/J9
 VTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xJl3e5+bs5xqB+lF7D0IwdsLJO17snjwANXkX2D6wU=;
 b=HmEbpZbRBE2IG8A6AMSI0FCoK5SXLp0jCOzoN8sxk+/kTlBKVnbT9AHNmgF0IIPzZd
 sFOk2BO41LO+dKILID5mlBdL2zzQofA8xT0qgcTBvgjs/v+gVbyCFv6o8twBeq3r9BId
 +Gzyh/UArMmQPJfJMHJG95I8NaidAm82HaHoZ4ft60fyfZE9jZ/+SuM8AspKaUoUnMaU
 /uGv9Z1H2qUVlpACs7LD/eQSkT1p2hWr15xS2orSTpES8E1uOp5JlHBNgkQ0Hmly3hst
 QsU4JqGEwqHiZRe+hUa5OFdYpT5MBsC3r5yszvSt3A1baFYNBeKtfxqOrYKIx8KdUi3H
 YUJA==
X-Gm-Message-State: AOAM5310h9n70fEKkq8m2SsFNcHnF1GoyItEwa+nmzzVu6mQp1YFS7xs
 H9unGgtre4rA8VHcXtZFYgePYA==
X-Google-Smtp-Source: ABdhPJyTqUJ+yXOSnr85wWiD5YuFTJo/pB6G1Lp1vxTohgVnsCkkTbkKgoGO2WgJsu6VOogbUcIBAg==
X-Received: by 2002:ae9:f404:: with SMTP id y4mr5460750qkl.500.1619205135351; 
 Fri, 23 Apr 2021 12:12:15 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:15 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm: use the right pgprot when mapping BOs in the
 kernel
Date: Fri, 23 Apr 2021 15:08:19 -0400
Message-Id: <20210423190833.25319-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the same logic as the userspace mapping.

This fixes msm_rd with cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09abda42d764..0f58937be0a9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -199,6 +199,15 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 	/* when we start tracking the pin count, then do something here */
 }
 
+static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
+{
+	if (msm_obj->flags & MSM_BO_WC)
+		return pgprot_writecombine(prot);
+	if (msm_obj->flags & MSM_BO_UNCACHED)
+		return pgprot_noncached(prot);
+	return prot;
+}
+
 int msm_gem_mmap_obj(struct drm_gem_object *obj,
 		struct vm_area_struct *vma)
 {
@@ -206,13 +215,7 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
 
 	vma->vm_flags &= ~VM_PFNMAP;
 	vma->vm_flags |= VM_MIXEDMAP;
-
-	if (msm_obj->flags & MSM_BO_WC)
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	else if (msm_obj->flags & MSM_BO_UNCACHED)
-		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
-	else
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
 
 	return 0;
 }
@@ -632,7 +635,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 			goto fail;
 		}
 		msm_obj->vaddr = vmap(pages, obj->size >> PAGE_SHIFT,
-				VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+				VM_MAP, msm_gem_pgprot(msm_obj, PAGE_KERNEL));
 		if (msm_obj->vaddr == NULL) {
 			ret = -ENOMEM;
 			goto fail;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
