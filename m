Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD521406872
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78EB6E997;
	Fri, 10 Sep 2021 08:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B116E990
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i23so1470876wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
 b=HybftAd+7uKdOV5zg2ea0y+qhWvQofD19fVH44gZl20wjwRGG1zpzzasvlB1cJjN7u
 5OLeGUdVvhXnrz93ObRQjFXGpoTmn+f5IfUQp9X0ClvsDVJuq2POC9dWspHGv9C7qf5Y
 SUM4Mqk1mXxACItxPdU7gFcsg7TOuFo1V122TOkOE1AZXMNKvE/zDlAn2RnUrm3PnAoJ
 jZaaCERt4hzU7yqGy1IjJtQ76pMLGTiJSQxOCVxQo3jh3dADc3PldDEe1lVymKyfSco9
 uU/jPvx5MQ4XME91lEapNwjnxXvCqTm+34SAC4ZoYb2SshqdbWAsG0vEiPBPVDra8Iu/
 1GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
 b=7QJhclLU5G/d9tK6dJxh1VUVq7lZ035U8S32R0T/l8q4vs8/wSisIFNr0t3pYxMXnG
 M4o167FlnOjXs3iBMubxMqJqxXv3IDpJdvlW4Gck1CM++MlTILoHUMz2/IbxBqZHLKDU
 nbroZBmtjPEDoaqfbUKqarS0maWzwYW7oi0GMZv+cPiO7h4+JTlK5duIsiC1To6ABFKX
 zKrqdPBr6z0ThwxZOINahiwFFaKNhppB7X8sR9//D6/Snp9RSUPk89BiVKjGkIRx8xvt
 ftlikwNS2RK/gtVQ/tTD/T0XsQtoOVXSBLIO+r4hoW1HmEU0OE9OWOTOYaFsKY11V89O
 ukCQ==
X-Gm-Message-State: AOAM533k43VGNJonIc037EF98tOima3yWiVvtYL6nyuN8WJYNt6hUCol
 PtDTG8vw9X8RR09fFqfxCp0=
X-Google-Smtp-Source: ABdhPJzfd/Udc2aUZ+b/NYD27ztPjCkExkaZPwjk+zgrhKyeNASlXYGYiyLGf6eAhsuRtI8c+BhUKQ==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr320170wrp.95.1631262427136;
 Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 11/14] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Fri, 10 Sep 2021 10:26:52 +0200
Message-Id: <20210910082655.82168-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489e22190e29..0a927006ba9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_cursor resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1349,14 +1348,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

