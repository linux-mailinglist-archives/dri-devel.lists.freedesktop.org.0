Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EEB4EB65B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8158610F184;
	Tue, 29 Mar 2022 23:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4062310F184;
 Tue, 29 Mar 2022 23:00:37 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e5so18948180pls.4;
 Tue, 29 Mar 2022 16:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOn9Tor8polPNHF4xDcLky0lDAw9l38xozLRMXI1//U=;
 b=UN4Q6WhLgf+4vrubk9sXCwnzz6Q0Jt+nQdZQ6OlAkbulUb2eXDmHc6zY3ldlN9PSCA
 5L4VKLE2Dk0o6Many2PDkMydcqPUGn4YlPCE/a8JQwgJE2bunvQ7iaWzd6sedaS96eSi
 fUm3ZcuDRMJNVLp+R8jDP8KZ4Wt28YhlCxEm/KCZmiFB+8WHKR5JiBhcxvZt939tpaWt
 YSc9F3lLtTncP1Z49mOyQSy64g+T0mWGFedopBuWDd5AntsuXI+92je/BQgzo+ONZEGV
 ddqsLTLU51zKEtjPaT5ZvptsHR4Tk3oIRaXpHiBdWE84BRpj8v7IX2OW+PY5lr9E1kzf
 TJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOn9Tor8polPNHF4xDcLky0lDAw9l38xozLRMXI1//U=;
 b=1iPI7e/82vfwldQLEMnFY0SLQGxqOW4S+HvCZljGNZQGWlNP46uywdVTYZ3c36fvSu
 wgq85+a+MTZhJytFfL1Js2nxzoXbWo1QFvsuVvI/kNrZ5MGfbCq/bA+gb2InfgC1ThuD
 CXGQUr6drRsxc38M3+uJGEtRQRBOXYLSXjgyvcjwhC9hII/UOYxZvbr+OQ0WH9KDvuvX
 Lq97Ps6TU66BM7eAYKGagR8rM9O+WhvHcat+VvmMfLJTcNO0fY+g/dWDKFz9XPfNmLOT
 Fv45+U3n4cqrfzma1rrNsrCaGZRCDANVi4L/oKUGgQEOXEltS6MIilzIiBIJ6JDRbc5g
 efKQ==
X-Gm-Message-State: AOAM531YwcF57KQUiJLy3C0dGDHJeNL+ZJdh0wanurHhbforHEJiZfva
 2A0rzZTc0QMyoZRdD1KokyrqRHGzG4E=
X-Google-Smtp-Source: ABdhPJwo5MrDonYYuGDt2Jf4p+x2gHzaOcNSGey1owiYh4QGci/Lv9t0iqMtGyJ61u8eqTwxIhQ2Mg==
X-Received: by 2002:a17:902:dac6:b0:154:740a:909f with SMTP id
 q6-20020a170902dac600b00154740a909fmr33040344plx.76.1648594836039; 
 Tue, 29 Mar 2022 16:00:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 il7-20020a17090b164700b001c779d50699sm4364757pjb.55.2022.03.29.16.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/msm/gem: Rework vma lookup and pin
Date: Tue, 29 Mar 2022 16:00:54 -0700
Message-Id: <20220329230105.601666-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Combines duplicate vma lookup in the get_and_pin path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 50 ++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index deafae6feaa8..218744a490a4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,39 +376,40 @@ put_iova_vmas(struct drm_gem_object *obj)
 	}
 }
 
-static int get_iova_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
+static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace,
 		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
-	int ret = 0;
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = lookup_vma(obj, aspace);
 
 	if (!vma) {
+		int ret;
+
 		vma = add_vma(obj, aspace);
 		if (IS_ERR(vma))
-			return PTR_ERR(vma);
+			return vma;
 
 		ret = msm_gem_init_vma(aspace, vma, obj->size,
 			range_start, range_end);
 		if (ret) {
 			del_vma(vma);
-			return ret;
+			return ERR_PTR(ret);
 		}
+	} else {
+		GEM_WARN_ON(vma->iova < range_start);
+		GEM_WARN_ON((vma->iova + obj->size) > range_end);
 	}
 
-	*iova = vma->iova;
-	return 0;
+	return vma;
 }
 
-static int msm_gem_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
+static int msm_gem_pin_iova(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
 	struct page **pages;
 	int ret, prot = IOMMU_READ;
 
@@ -426,15 +427,11 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
 		return -EBUSY;
 
-	vma = lookup_vma(obj, aspace);
-	if (GEM_WARN_ON(!vma))
-		return -EINVAL;
-
 	pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	ret = msm_gem_map_vma(aspace, vma, prot, msm_obj->sgt, obj->size);
+	ret = msm_gem_map_vma(vma->aspace, vma, prot, msm_obj->sgt, obj->size);
 
 	if (!ret)
 		msm_obj->pin_count++;
@@ -446,19 +443,18 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
-	u64 local;
+	struct msm_gem_vma *vma;
 	int ret;
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
-	ret = get_iova_locked(obj, aspace, &local,
-		range_start, range_end);
-
-	if (!ret)
-		ret = msm_gem_pin_iova(obj, aspace);
+	vma = get_vma_locked(obj, aspace, range_start, range_end);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
 
+	ret = msm_gem_pin_iova(obj, vma);
 	if (!ret)
-		*iova = local;
+		*iova = vma->iova;
 
 	return ret;
 }
@@ -500,10 +496,16 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
 {
-	int ret;
+	struct msm_gem_vma *vma;
+	int ret = 0;
 
 	msm_gem_lock(obj);
-	ret = get_iova_locked(obj, aspace, iova, 0, U64_MAX);
+	vma = get_vma_locked(obj, aspace, 0, U64_MAX);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+	} else {
+		*iova = vma->iova;
+	}
 	msm_gem_unlock(obj);
 
 	return ret;
-- 
2.35.1

