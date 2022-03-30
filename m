Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962E4ECE40
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3669610E905;
	Wed, 30 Mar 2022 20:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E9010E97A;
 Wed, 30 Mar 2022 20:48:12 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so1325879pjk.4; 
 Wed, 30 Mar 2022 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOn9Tor8polPNHF4xDcLky0lDAw9l38xozLRMXI1//U=;
 b=UPK7hL40Q2YvCF9wKbtwYgJsCkDD4S3VjnoBgdNSt+WHM9zo7jOHSYtbtzE/pU7cc0
 vWJUocRHernfEg73QBM9SK2P7rVRf+2qdpt+ZCnjAmUNaIeYI02wik/UvelXsmEXugFg
 mTdOEsnNaUwfQ3W9rElImmVHtS95BnTfIj0w4SFFy33B7vRuFqiyB0rLTQpND+vxfjtH
 rCYoA7o2YWALAs1UeWMk1if0oh2cESd++RhA4sJ9c4ITBqScF7/6YyldnC+nq+FLVFGB
 8O8zqvBh1YQAdW1FoWS9e2nQjbVz42hJ+8eewUQecBhbeb47p8JtIXXDUNSDVXTrK/WH
 dwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOn9Tor8polPNHF4xDcLky0lDAw9l38xozLRMXI1//U=;
 b=7mWX7ve6pFp/a/NvbNMPJi6+dtOeM7cRxyrSmRbuSEzrSQoxm0v75aIErVuTWbZSfh
 +u9kD4PbY0DMKWqMb782DOd60Yq31ATIRfOl6CuZ5J12d/SizCPBwn9PS7YGuXOUzOce
 KpjbLEzl+BrZaGEbbSLn5lWSmIw0IdNrrQELN1p7TVwicCZEsRdcOlG29w5q0v7aIWa/
 w9V/zz7fQuf3O9UdqAbZKcGKDLsXtyX1VbqzAyRvUXdSR3QaUHOzePF1asKe/Q3mJcue
 iKSJuqUK+9JYjKjClOZMdINNoCAyCq4EfXEWZUH9CvDF1SKaOeoMJIeO256ziT0RS1D3
 4CvA==
X-Gm-Message-State: AOAM533jJNPaa3jP9blifwGQSH8Oj8kiMAsGoKNhr73pG6nEd3VU2Fwk
 bmhbPgSn/8qBkBB7mBrgK7pjQtSb7CY=
X-Google-Smtp-Source: ABdhPJwJYRnX56RJoMLOVKWPDbw1s9PqMDGKWuJcsQPWKmnOylUzAMHvewFPAxCbjEv4C8yhrsXlMQ==
X-Received: by 2002:a17:902:c745:b0:151:e8fa:629b with SMTP id
 q5-20020a170902c74500b00151e8fa629bmr38131930plq.90.1648673291159; 
 Wed, 30 Mar 2022 13:48:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056a0024d500b004fb0e7c7c3bsm21656825pfv.161.2022.03.30.13.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:48:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/10] drm/msm/gem: Rework vma lookup and pin
Date: Wed, 30 Mar 2022 13:47:52 -0700
Message-Id: <20220330204804.660819-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330204804.660819-1-robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

