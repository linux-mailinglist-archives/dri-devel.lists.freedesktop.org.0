Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961C4E9722
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C8610E43B;
	Mon, 28 Mar 2022 12:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5B10E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:55:18 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id v15so11228517qkg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+wjaE9zp8UiiJ3ll5xchHseTtAzJ2kCou17dDYzPoA=;
 b=tcx16Kj+7Cqux9mvpPivKKmgL8LuL0VEeyv7xtoKn155d3O5pQ1xM9KdQFbPq67vAu
 ncPSybCNjkrekLm+BxOjgqjGogipQmtloV8c1paAp+7GYhYuV6wCmsGykAk0FTp6Il/w
 SveZKg7ZHVBl72dE00xbC1PExj+UjXh2sEWE/3MXLhw/aMamfw35KhT50syApyCDML5H
 d2KWjYD0l7FoZFzuPTMtRxzKpj3dQESwtb/YnSuKykGxKYinz3NENxy+Xt7Er2ZZfRq1
 aWmBYOcwAkasBZD3JTKhMM9WLTWQDzMc+Sv2cWoc0BLJqX+/sYa7eWtfaYESenkXCpJ5
 gnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+wjaE9zp8UiiJ3ll5xchHseTtAzJ2kCou17dDYzPoA=;
 b=e5PGelWv1sgkazpj5oXcIDwunFhCyzonxrtysKfi+o2FsoaiduBhRKhx4EUVW7ZdTI
 sOzGBgF5nVg0G5v8nD/n8vX/kTnBEGgidSynMFqXInE4kHId1s4N2ACAW7LRg4L6nUr9
 7Jy92jTzs5hBfR5v7ayv0gzAl2KNBeeD9l1mC/TbthS59ycW/SywfkkffSfjMOmfHxia
 l4aBkxImngZ8fAtR8Txik3aj5Zv7BBs8aiuzv4QoFcanw2/MIGqmyvWeCElmqteKkS9X
 ZhK3FbHpbuC57piSp9oXqdUPkliX7vVnhrvwGCZzWhCS3IWTx7bLXOUGqh4awxr7c9k1
 J1qA==
X-Gm-Message-State: AOAM533g+HBOWYzXJ8ZUiwF67+hkKRK2aH/9qCBFgo9F7+ab8un9vGlp
 3PmHHFGiFfpvH2/xebJVD1k2mg==
X-Google-Smtp-Source: ABdhPJxc8NsbZVET0kGypEAfG6BJjXHoFiXSRAGghnfGjwEdoHpPzeLu52swAHTy2TVKfJyxc8qtoQ==
X-Received: by 2002:a37:a084:0:b0:67d:405b:60d0 with SMTP id
 j126-20020a37a084000000b0067d405b60d0mr15545606qke.83.1648472117315; 
 Mon, 28 Mar 2022 05:55:17 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 c10-20020ac87dca000000b002e1db1b7b10sm12441798qte.25.2022.03.28.05.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:55:16 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: use orig_nents to iterate over scatterlist with
 per-process tables
Date: Mon, 28 Mar 2022 08:55:05 -0400
Message-Id: <20220328125505.31605-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, dpiliaiev@igalia.com,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This matches the implementation of iommu_map_sgtable() used for the
non-per-process page tables path.

This works around the dma_map_sgtable() call (used to invalidate cache)
overwriting sgt->nents with 1 (which is probably a separate issue).

Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bcaddbba564df..22935ef26a3a1 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -58,7 +58,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
-- 
2.26.1

