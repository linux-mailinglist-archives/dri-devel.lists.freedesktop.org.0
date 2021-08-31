Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D53FC5DA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232B288437;
	Tue, 31 Aug 2021 11:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3189A88
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:21:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id i3so10928066wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sVca61Kl8JxO61bspaysHLQGaf8iPz7R5MzqkuTuH/s=;
 b=FseTJq0Eg8bx8KSzKCrp+uxvkg54GC/ajfso+5pjYWaChKOwBse0XRmn0bWo01q2oA
 gy8jVYcfI979UvEvD7N2r77N20YSSJOdhOdjD7jq61uG33jPlvBmmqD5zNN646XTYNMg
 oCs5ZaGwlSGBfjgdRjsL61EczrcmlDAQrb/vQM5e5uiKl5MNnjQSJ44SBRno9x5d8Vrn
 vzHqcZ1s+arZEKpurSU1u2GpABp61jXbRvTCBY/s7QBKXKY/NvT/yxdhlud+jkY0OkBy
 LX0BIRm2Kx1kDRfUBx8Nf3k/HDKAQeu6y1CzGLwbLQXTDYytbVhIBDcDJ3d+coJtRRxM
 ArYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVca61Kl8JxO61bspaysHLQGaf8iPz7R5MzqkuTuH/s=;
 b=V4w2dK6H5f7W8m4dm2119s42dmEDglZfq85BVXpE8Qvov9hkfJcPFB6Ehjpd1GptXb
 J5nkzAKlUlBSShU9vtXhdyzdwU6OvP31Pp07/ljRiVsBscQkpzovh0f9zvitMSQFbq5S
 9RU4PKvmcgwz8E2uJlOZVbBVjiimtAIz3+LAuNyXqsGO9xq03zPcWxOtsu3p9SZJzNaX
 M9R62QlCI0/SgkExEe2Rst/c45pYqmVMU96Ymp1KJYsWPBGWE7+iZse1AAJw3b78shzt
 hqll41rFXWM4n8WvyDSWPmm8GJZSrdcyPSoAYaXmBVXeVGMsucysoY0bcv+AFy52IMqk
 7Kfg==
X-Gm-Message-State: AOAM532C1hYE76RMF7hlbSjrw9JfzWPZJNQalNmCBcF4r0xzeuk+9wSh
 55LkW6ddSvqjm9XkfbeuLvL5do1LyBB+zzHh
X-Google-Smtp-Source: ABdhPJzgpIw+lBzOG5rbdDT/s6QFxI6NKtRCMuZHQao8d8a+KmpS4eiC44k+r6c/gBr1D7+rBmDmxw==
X-Received: by 2002:a1c:1f49:: with SMTP id f70mr3533481wmf.13.1630408880227; 
 Tue, 31 Aug 2021 04:21:20 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g5sm18054957wrq.80.2021.08.31.04.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:21:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: [PATCH 3/5] drm/amdgpu: use new placement flags
Date: Tue, 31 Aug 2021 13:21:08 +0200
Message-Id: <20210831112110.113196-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831112110.113196-1-christian.koenig@amd.com>
References: <20210831112110.113196-1-christian.koenig@amd.com>
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

Instead of the busy placement.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index d15eee98204d..327b8af6cc1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1393,8 +1393,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 					AMDGPU_GEM_DOMAIN_GTT);
 
 	/* Avoid costly evictions; only set GTT as a busy placement */
-	abo->placement.num_busy_placement = 1;
-	abo->placement.busy_placement = &abo->placements[1];
+	abo->placements[0].flags |= TTM_PL_FLAG_IDLE;
 
 	r = ttm_bo_validate(bo, &abo->placement, &ctx);
 	if (unlikely(r == -EBUSY || r == -ERESTARTSYS))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489e22190e29..27f0acb7b3da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -153,8 +153,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 							AMDGPU_GEM_DOMAIN_CPU);
 			abo->placements[0].fpfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
 			abo->placements[0].lpfn = 0;
-			abo->placement.busy_placement = &abo->placements[1];
-			abo->placement.num_busy_placement = 1;
+			abo->placements[0].flags = TTM_PL_FLAG_IDLE;
 		} else {
 			/* Move to GTT memory */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
-- 
2.25.1

