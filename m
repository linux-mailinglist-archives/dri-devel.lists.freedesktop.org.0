Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB458114F3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D933E10E7B9;
	Wed, 13 Dec 2023 14:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA310E2D1;
 Wed, 13 Dec 2023 14:42:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1e35c2807fso928876866b.3; 
 Wed, 13 Dec 2023 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702478546; x=1703083346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=iR+XYbIr0efzKHJ7ZQKyWLiBole5/xbE074DRTG8r5FJ4GLc+jzrQHOt/7Q21cwqtj
 kIzNIbfibWLJo3ypr5rbquy62MsCkLW7+t+bu+UfsugcnXjSRbNfuQEVoGGmp5ZpOY7z
 BApVQRqzHSavKAI5HEcBoZATtN6MrTWRLBn3G+cXlGs0Z4O7QWzYZM97xVS6GwkMNbAm
 XmPCsV/8DQkdmFVXIO6fcKMV3laU2kRHb+a3RSnb2/gwd0oDjjL3PQVG7/vRFaCKIZaq
 ETjq6UGGOxz4RxJofWQ1xPEOa6dcLFCGSzFdEH2W0JP8pEgcjgOpg5BYUgyuTjcX8VfA
 Qxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702478546; x=1703083346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=gsl14btutMmAFGUCBIby+xF0eHwhPd0LfKLvy8dvrmINSvZPNm1WGT2tEBQcN2XGKv
 sEHjSK6Lgs+XFPtUySt9DITQeaDGNpCwxg9edD2mNrRmARnb5CHWMfOfoiANR4BaH7gk
 RjPmTad5Epu17rSb8yArHzoexOHue/R1Eibnc3qmfEAYfiLFkmj/qafsS3jR8h1uwTlk
 11q3g5ZcotlY6u6kyiLv5h0gShBxJu2tVaVFzC6tlUIQE5lwi7Fp91FSEUjw6B4URc24
 04PAyfgw0bCBFRLIU8bcdGyhVZDSNodsxH6fllvdOgbZMYmvy7Xc/flN2nMHo1WrDnwF
 fdWg==
X-Gm-Message-State: AOJu0Yw25VwzOVX6BdIz2lEJJLnkCpvVuPfJTNwuyaP0PmsvrwM5t6zJ
 dvMw+yEtwk7Ald7jH/xS/rkR4jXxxRI=
X-Google-Smtp-Source: AGHT+IG4KLLfz8EX3da6Z7FTsCArwWqOdac5J3L57nTBbakVfDdtS5rZE7zEsFODss5in/0wOSE9Jw==
X-Received: by 2002:a17:907:d25:b0:a1f:6b64:6a52 with SMTP id
 gn37-20020a1709070d2500b00a1f6b646a52mr5161271ejc.43.1702478546176; 
 Wed, 13 Dec 2023 06:42:26 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c5:a700:2883:dd2d:c4a4:5a04])
 by smtp.gmail.com with ESMTPSA id
 rm6-20020a1709076b0600b00a1f6f120b33sm7402525ejc.110.2023.12.13.06.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:42:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Wed, 13 Dec 2023 15:42:22 +0100
Message-Id: <20231213144222.1871-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213144222.1871-1-christian.koenig@amd.com>
References: <20231213144222.1871-1-christian.koenig@amd.com>
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

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f110dfdc4feb..979cecf18f17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_BUSY;
 		c++;
 	}
 
-- 
2.34.1

