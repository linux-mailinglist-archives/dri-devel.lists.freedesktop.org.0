Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263A3DF969
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 03:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED876E9A4;
	Wed,  4 Aug 2021 01:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0696E9A4;
 Wed,  4 Aug 2021 01:52:28 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id j1so782437pjv.3;
 Tue, 03 Aug 2021 18:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSQgo07VJZLrzxtRhVpF2elOIx5PWfCaTzxcdQTI7sQ=;
 b=AH1zW7BE9omAKOjq4atorPk+57PqXqxm72okT/sJJeaB/KGSI/yVXGbo+or5iSV8DM
 Nzn+Op61BdpBBK2z0eQ56R+86cH/pdH1JvRsF2MLdZdLN9QyF40cAis3V+3r+gys6pLF
 Wt5nbPEidUbNwkSB0bSwwY/NkmoH+2qcmUVnwUGZ/MVha1n4bzf99cl4kCeR9U37tb6u
 9ETOoeec+DlA30Cp/wA7qihjWYeg+EISnWTAmlGvj/kipYID5haaaGyo4YUdfN4Eghv2
 1ckHyd5/COwgsJu8mDz2pcuozW/teLegKpb3Vkpb5WSx3f2bDQG3tuazJVz028oiSn8M
 YmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSQgo07VJZLrzxtRhVpF2elOIx5PWfCaTzxcdQTI7sQ=;
 b=JiKz9iKNS2/Ton1lvL92A2lFfOCTBFydK30D1R5ehEZYCvgcxmgr3ARSueUbewFHFp
 YMvTlvSS2HtFTRxSL5QFVdllYLMwaWkpTfR29sBsCcYbRnksVKsw0uh5S8gwMerwO3Wr
 ycIGYnAkGbk8AAatLaz7tSCShEa/Mdls/sHjpvnI3NDuz50zfq6X+3GKMx4gcKq+z04k
 X78jHMmC9xCrc4iT7Ec8354kIuLp0mZ0C+49Nlzsyv7Tc7L5BtG0gyRDkwLIJAdmjXMe
 sR+sascnicCSec8yG3OQLVhfF2UZe3TbBbSS3l3nnKf6YFG3UIVFpCm6wTe28jwJSpkF
 nNWQ==
X-Gm-Message-State: AOAM533HKeKM8qJRWnXGWNTk100ISHhZU0EDeOmH4t+5yGxSLnqmAoZ3
 R9lgCEuA7QgSWvFVUMK3fo8=
X-Google-Smtp-Source: ABdhPJzyXDotjHwSv5EpTfdtG5zDwsdMySRsOZ7X/2I9Tj1ioD9a+FZjytRGdxDjmqtg3iLd1+amag==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id
 h11mr18676578pjz.157.1628041948277; 
 Tue, 03 Aug 2021 18:52:28 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.49])
 by smtp.gmail.com with ESMTPSA id b12sm496069pff.63.2021.08.03.18.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 18:52:27 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 airlied@redhat.com, Felix.Kuehling@amd.com, Oak.Zeng@amd.com,
 nirmoy.das@amd.com, tzimmermann@suse.de, Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/amdgpu: drop redundant null-pointer checks in
 amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
Date: Tue,  3 Aug 2021 18:51:32 -0700
Message-Id: <20210804015132.29617-1-islituo@gmail.com>
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

The varialbe gtt in the function amdgpu_ttm_tt_populate() and
amdgpu_ttm_tt_unpopulate() is guaranteed to be not NULL in the context.
Thus the null-pointer checks are redundant and can be dropped.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a55f08e00e1..719539bd6c44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1121,7 +1121,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
 		if (!ttm->sg)
 			return -ENOMEM;
@@ -1146,7 +1146,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
 		ttm->sg = NULL;
-- 
2.25.1

