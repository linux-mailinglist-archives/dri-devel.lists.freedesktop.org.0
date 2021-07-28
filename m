Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D03D8E7F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E1C6E8F0;
	Wed, 28 Jul 2021 13:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A0E6EAC1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:05:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z4so2432134wrv.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8w+Orxw5/iMYfAI73wXoE5cAgUNnijvBuaTUaBuFfZk=;
 b=CY7nxWG1fIdihgn0JpLGGrtDMink4IW21/7fYUSd9hm6urxG1Ka4rlOxdoI7FCSt+j
 w0vVFokWECpCZnVH4Z8k79vEHK/wSB0S9lRnpxU8j6q04FxlM3mS7SV/ibuinH6rCVGI
 RgOh0QqEjn1rpKLFLQ/pFYdV/CDXACiMov9k5Wr7Xi2NwfoDBFlF3LqKrHHnGVnkOS5b
 yLLweP9eI0aSednZVgRDHBOJNLVA053mxVpGgrLc/rllUDk1oksKIqsyg1+Jzine47Xg
 fb42L71lfjcrtAV4Pw5IQacf01PiQ1PL8zlMfyaqVbHLKJpWT/j0mt8atwQsCOXjTM3h
 VZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8w+Orxw5/iMYfAI73wXoE5cAgUNnijvBuaTUaBuFfZk=;
 b=UtJK2Nzv1Y7JVZW7wYyXEABUFduZg9CoNGUViEaaULS+4jXzTMosevJpBxTurX1bwx
 wgulP3WYLNFK7wtrHkPeMKqR9feYH7vLli5ZYuZWB4iai/Z5dHHVIqy5rTFRdR1npISX
 HxNCMcgShTH6xp022wmENGI2xCzcV+IjRkgkwHZ7dakgDXeF10wppc8igc3cEKukHBPm
 B29Kn/DdDwB7g2jTZdOtkA1kjMZpyxijUFFUzf45kvL8ne+CFPPT41Xlhh5l3Wg3l+l4
 L6n+JXvPhnTQ4zr42xvI6FaJ0TwL9E2/x2eMz1xG0nEgHIis4qb6Hv/PNFaCmMmYGSLF
 q4xQ==
X-Gm-Message-State: AOAM532lBFPfuuDK36VdQV2ivOl+tYv+Ybs5HzVpXfi/a3kkhCJ2QBXf
 ckm7FZd0X6AsjxMtkEtQ2Ok=
X-Google-Smtp-Source: ABdhPJw/SINH2BlN/ErExR4hnJQxoH0ZmK00w6tgJIKsDVEiL0v8ADH4ZdlP5aKGGQ+iCM0hVX/FDA==
X-Received: by 2002:adf:f983:: with SMTP id f3mr7347662wrr.69.1627477554258;
 Wed, 28 Jul 2021 06:05:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a03:ba57:3127:59bd])
 by smtp.gmail.com with ESMTPSA id o17sm5867374wmp.31.2021.07.28.06.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:05:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 2/5] drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
Date: Wed, 28 Jul 2021 15:05:49 +0200
Message-Id: <20210728130552.2074-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728130552.2074-1-christian.koenig@amd.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing this in amdgpu_ttm_backend_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index acd95d3a4434..2a57076c5233 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1066,7 +1066,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
-	amdgpu_ttm_backend_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
 	if (gtt->usertask)
 		put_task_struct(gtt->usertask);
@@ -1148,6 +1147,8 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
+	amdgpu_ttm_backend_unbind(bdev, ttm);
+
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
-- 
2.25.1

