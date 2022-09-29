Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8E5EF65C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25EE10EA66;
	Thu, 29 Sep 2022 13:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886310E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x92so1935170ede.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5h1tswu/X88tJaPbT1f7Ia/Vt5VzuYCNSkGec6syos4=;
 b=eh9HIdmLZ/76cPr7qevbMVj8a0/D83CcGUbk1doC29JHdbHrITE+bap/amVYo51fsQ
 ibvMuYcjYZTHDbvUyVgl5jl2Vsl17w/yz6bUi4DzAddVsAFkK32LRmqPakZGLY0++oO3
 lWX9dNwUS2zApCnk0SI6QlgIJgfH91UlH0RFZxMjyeaaO3X5Oi5P+oEFZDwQPU/RZYh7
 12uZdbWWQ58c8MzYkzYEd1Dm8hTb1G1kSQJT5yl6JC/bGDp6P1qLLpdMwod6FWScCb0P
 lNGuPGRxL0PihAfozdR5sQ1c4RMDRO2cIcScpxryB9tTGH2Y2ZrBcLK+NeesrPWgWK5K
 +GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5h1tswu/X88tJaPbT1f7Ia/Vt5VzuYCNSkGec6syos4=;
 b=eayFXxaq8J0PVrXCXcF28UbLZoq7yEwwOyWt2gBCrgptsYPzjQoc1k2WQ3HREEHL+u
 zxazI5cLQqx1AmD3vNdoLu5wvqfvSVfNU+/FsqZcgsG8DOPfK1fCkf6+fXDxsCnHWNGI
 2cQ1hEK7qYjNDVcl76bK9X5aXokAkOqUUv+qq5k4nad2CVXq0uN+J/Zp1DKMUU/aDjiF
 JFskzOTOPnp3E1u5SG4tx0khulXO5rQEMAIC6CsDX8r+TfHHVB8FhMxRLk8FOZ0uM2of
 y4Ynh0/gXVd1Z6jqTUE9DFeDdw2gaaGBkJYIImEHLLcbbdWrwLRZS0EjF2oqqc9iixUO
 LoIg==
X-Gm-Message-State: ACrzQf1F03QCtbw+QEYY/j4jerNDhp1GRHPP3fvdezDpEVo+S3JIgzRG
 lKlXNjbVZW8N5mzYxdgnNtW9Zv8L0VM=
X-Google-Smtp-Source: AMsMyM4mp/5CAp+rJKoJPL2TH0QanvCaGG8+FzuzYrORKHT3TBdk62ecP5Fl5M5s8TwxCnnTomkt8A==
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id
 f7-20020a056402354700b004513be6d55bmr3341199edd.57.1664457706746; 
 Thu, 29 Sep 2022 06:21:46 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/amdgpu: use scheduler depenencies for UVD msgs
Date: Thu, 29 Sep 2022 15:21:32 +0200
Message-Id: <20220929132136.1715-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of putting that into the job sync object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 8baddf79635b..e00bb654e24b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1177,9 +1177,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 		if (r)
 			goto err_free;
 	} else {
-		r = amdgpu_sync_resv(adev, &job->sync, bo->tbo.base.resv,
-				     AMDGPU_SYNC_ALWAYS,
-				     AMDGPU_FENCE_OWNER_UNDEFINED);
+		r = drm_sched_job_add_resv_dependencies(&job->base,
+							bo->tbo.base.resv,
+							DMA_RESV_USAGE_KERNEL);
 		if (r)
 			goto err_free;
 
-- 
2.25.1

