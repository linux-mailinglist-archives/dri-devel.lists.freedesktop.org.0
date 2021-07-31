Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601413DC4C9
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 10:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F346E5CA;
	Sat, 31 Jul 2021 08:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822256E5C5;
 Sat, 31 Jul 2021 08:05:40 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id z3so12506797plg.8;
 Sat, 31 Jul 2021 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M8s8mhhqZ8Up+UA2vSw3vvwlmTtYXes+e5VhDxbCIyA=;
 b=bLCvfbuEP6qV/fkOAbd7z0uDgSx0ITQwQ67JwV6y4UggR35pF/iBN9Y8uYAn4i/h1Q
 +OmDW2Bp+HnZF8bq9DQrAQLAEtP7Hmw43DF3bGKC9mVG1uM++cb6eue6AYxwUf5FGa/5
 yygFB1IvISIM9pbIojyzAmH8J9NROnYxvvngVaPra8EzHBvCwLcguFYJNOaNzh22y/DI
 xG2VSnH4tKPMDU1rbk/FTaKi279oWIWrgkhDyJsmN7b6bOcccMIb7I2RPvOU1KzK9+Jm
 1fy57BXltuQjLDKNAwRGrPzvaxfc77lC6ehTunPUh7Se1cx+02jNjUKqTV0KXl+Td99o
 rqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M8s8mhhqZ8Up+UA2vSw3vvwlmTtYXes+e5VhDxbCIyA=;
 b=Yhibs43n0KYq+9R1jnoSiszC7+y00st316c/FkqHCHS34LzSodxGPL+JkuW2mUpIUc
 2dslKHD05F/845vQk8iQTVNU0T5plfWvn2K1cLISRECFRyRhABWNmfYlqWY844SRmIFK
 rxwGt6wv0qTfFcUEG7bqhsVD5o4cF74vtouHITPtNhvSoaqVSi2mWOXAun8y/NScRHnP
 kGGAYZo7T6B1CVgw9t12UqQiaCnMsjWDPtY5ZYOZb5s2zXBAJpUGHeRu6JOEfc5BO8PF
 RYD3ng82UlRH6q2TQFExp4vH77buVQHu73bvqu0TkxFtTDE6gV6A+mZZZUM8ViSdnZsr
 2wgA==
X-Gm-Message-State: AOAM533a1HcBEThXOsQtQIg8RCzzer2J/mazNjDj38qOMVcayRDItNK3
 mGugJjmZaJuDFj7rE8ujRfU=
X-Google-Smtp-Source: ABdhPJwlGBDhCkzdHi57AylTjultSYaBz302y2ff7rorMx5fNPjeqUSkEm9NlFx7UyITj/vo3B1mUg==
X-Received: by 2002:a63:b60:: with SMTP id a32mr1585053pgl.29.1627718740214;
 Sat, 31 Jul 2021 01:05:40 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
 by smtp.gmail.com with ESMTPSA id c7sm5288427pgq.22.2021.07.31.01.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:05:39 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 airlied@redhat.com, Felix.Kuehling@amd.com, Oak.Zeng@amd.com,
 nirmoy.das@amd.com, tzimmermann@suse.de, Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/amdgpu: fix possible null-pointer dereference in
 amdgpu_ttm_tt_populate()
Date: Sat, 31 Jul 2021 01:04:37 -0700
Message-Id: <20210731080437.74539-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ttm is assigned to the variable gtt, and the variable gtt
is checked in:
  if (gtt && gtt->userptr)

This indicates that both ttm and gtt can be NULL.
If so, a null-pointer dereference will occur:
  if (ttm->page_flags & TTM_PAGE_FLAG_SG)

Also, some null-pointer dereferences will occur in the function
ttm_pool_alloc() which is called in:
  return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);

To fix these possible null-pointer dereferences, the function returns
-EINVAL when ttm is NULL.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a55f08e00e1..80440f799c09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1120,8 +1120,11 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
+	if (ttm == NULL)
+		return -EINVAL;
+
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
 		if (!ttm->sg)
 			return -ENOMEM;
-- 
2.25.1

