Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C28FB86C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD6810E2EE;
	Tue,  4 Jun 2024 16:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FkqeHeQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72410E195;
 Tue,  4 Jun 2024 16:05:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4213a496a81so22810125e9.3; 
 Tue, 04 Jun 2024 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517109; x=1718121909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu+Hg3onwvDwkR/F66dBSzl00zBahj7dxo5N/vUuXKk=;
 b=FkqeHeQiHvCXZQ5X7ITpuAG8CGvanoWiApYOuci/lJlzj0O2f4G4zvzd7t1i8DoZvf
 yJzQkApS76YfUuAluATkvQkjExTRtjlO3bROyLYtpjhUgfMsz2J0Etk25kDLUHp2VrZ2
 Cx1KPBbXYj6dPOFHc1z7thaM014xNNlgpgs82DZfwqvuMgQmV11WXiRpN/zM4rZNhY5S
 +q28WRYJFQvYbjkIw8jhak9BVSEJlHU7+naio06T6kbIv3xu44a2PmnE8soVsPzcXia2
 D6cPf7fw1zQcX3qNtD8Cxp7nzrK3iR67UjA56o9V0q0e2K0YCH49Qe2SeM0grqJZXPJQ
 nHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517109; x=1718121909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu+Hg3onwvDwkR/F66dBSzl00zBahj7dxo5N/vUuXKk=;
 b=w7YS7nndEcVU/zajCxAdesXRMUFqJJSGPtpP/DeZkdVNjJYEBeobFT7OPPG+BnJqUD
 QcnKgOUG/Nlo1X7LctSJSQiAPsaKdbErfrq2hDUhGi4QOjbR+alk4qv9ieKlRXHz7qnl
 eeXg29xU84fE8DpL9oT6jKVyszyPdfHnMzh3EReLahXDLwn6de767qkfNH4YyGqUWvI+
 E5hxJOG22O7hn6UhQgK6k80s9YuxktdzECCnJhnhpGJRpG9HRA9JBoRlQtM1xWtaEmqp
 n3oWXQtRV8q3pcn9QTs+TC3f9iK7fSr17Amd9vK8G8SNFDtQKAJCMbp3c26rvZgxtZMU
 GYzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX3kAn53dDl5Q38vMewQK/83POwdSfM9c8LHbLEIqNmV7Enkl5TuDWe1y4/tt5qu5SbziXI7C1RNugx9xbmvBJGbuSMiOCBaxrBuVOig==
X-Gm-Message-State: AOJu0YyetzSwJF5Ou4Np931OCyQSZQ4CDKDwJT2opfUYOSwtr6lX6nZm
 uQV1DuKrGduI0R6+7peTNmx7KGScT/DkawD+1hJRzfT9qag0jts/
X-Google-Smtp-Source: AGHT+IEIqYK5eJMBr1lk8zanDceNoq5sQpwNDGNPjCMLnh45ODUaYBP3drpCMslWna4anmkRpJPC7A==
X-Received: by 2002:a05:600c:34ca:b0:420:104e:27ec with SMTP id
 5b1f17b1804b1-421562db4d6mr646755e9.15.1717517109577; 
 Tue, 04 Jun 2024 09:05:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: enable GTT fallback handling for dGPUs only
Date: Tue,  4 Jun 2024 18:05:00 +0200
Message-Id: <20240604160503.43359-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604160503.43359-1-christian.koenig@amd.com>
References: <20240604160503.43359-1-christian.koenig@amd.com>
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

That is just a waste of time on APUs.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 8d8c39be6129..f7b534c55c43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -180,7 +180,8 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		 * When GTT is just an alternative to VRAM make sure that we
 		 * only use it as fallback and still try to fill up VRAM first.
 		 */
-		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
+		    !(adev->flags & AMD_IS_APU))
 			places[c].flags |= TTM_PL_FLAG_FALLBACK;
 		c++;
 	}
-- 
2.34.1

