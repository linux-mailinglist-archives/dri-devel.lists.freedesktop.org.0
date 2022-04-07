Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F04F8851
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81010E6C6;
	Thu,  7 Apr 2022 20:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C4C10E6C6;
 Thu,  7 Apr 2022 20:27:40 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id s11so6046766pla.8;
 Thu, 07 Apr 2022 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJceoc9W0NY6WQcLWDMIjUqaSV6YiSwG7eotLlprMMg=;
 b=QJu7DvN0eWTomcuK6UZ/vOM3RvOr+ZoXAeWbsasj4HCWNICOkIgYYpSkqlbswtVm1z
 Acy1HWO3rk9a983uxCW0/xcfkEMMp8FFtfk79qp5tMrrmH9JsBsy9n4c6fEVVnFw+K3/
 n1JFF8CE6pHhcISKrcAohYImmD3QcJSmYFRQRHje790xtHkylQiO8spF6Pgdl48Ve7aN
 psUslbw8LIksxjefWNb3VVI23vM0UpeObvySgkOFDDRBbnGq5zrH72S1PBN6L1xpg3Vl
 jtYEkc9P6l1InTcglroX/L7LL24Fpsxw6KQzm8sRSl3QYGOOmbhosKRWgQtuyy8i6BSD
 eogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJceoc9W0NY6WQcLWDMIjUqaSV6YiSwG7eotLlprMMg=;
 b=kYqlie2qHGDDmma7aQXt4C+r7ghh3+lqFFdv0xyJ0mwWOC5Eo/hwG+y6ihr4AvTljB
 Vp2IUMiFtL38qDWmqfjJQ5QhHs+WplthUuIyGT0+8N/t4LifKHzN/NZPFiSf4KRjZjK3
 LW66nZDUCmjeA+Lxpx8MVzp7uG/QeQVXLb/u6+hsXp0FREO1PgtPsCKm5EuehfXYqxjg
 5gz8hj0XZgX3yKcIgjkNgjuAzPgJEiHrBdeMtkW5avxlEACSqdnq9oH33T/DkD8laHNc
 /FpvLRlwgWVATF08ALR8hh3SrMYoGjF+ry58Fz6wPwenXzI41gQklxpEZQoUYuYDgo2U
 B/AA==
X-Gm-Message-State: AOAM532Typlfli7wfD5/NMt/B148nxDTnJbv9r3fYyD9cF0nrLAJsQv3
 FDZveMtXls34/51RHEtXIf0PwPFkAeE=
X-Google-Smtp-Source: ABdhPJxZXljtWG1ZL15O/6dRhB5QKE8O289YejrO4KoHkde3SlpynJRKXjvUmXAJbl+CD0L7QvChaQ==
X-Received: by 2002:a17:902:8b88:b0:156:2b14:cb6e with SMTP id
 ay8-20020a1709028b8800b001562b14cb6emr15911211plb.14.1649363259814; 
 Thu, 07 Apr 2022 13:27:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm10251800pjb.25.2022.04.07.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:27:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix range size vs end confusion
Date: Thu,  7 Apr 2022 13:28:33 -0700
Message-Id: <20220407202836.1211268-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The fourth param is size, rather than range_end.

Note that we could increase the address space size if we had a way to
prevent buffers from spanning a 4G split, mostly just to avoid fw bugs
with 64b math.

Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 17de46fc4bf2..80d57608b34a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1742,7 +1742,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_address_space_create(mmu,
-		"gpu", 0x100000000ULL, 0x1ffffffffULL);
+		"gpu", 0x100000000ULL, SZ_4G);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
-- 
2.35.1

