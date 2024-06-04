Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C028FB875
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20610E464;
	Tue,  4 Jun 2024 16:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTrc48bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612E710E238;
 Tue,  4 Jun 2024 16:05:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so13775431fa.1; 
 Tue, 04 Jun 2024 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517110; x=1718121910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45ZzxSZH4yq0DA4k8j9nWaCJsroG/zENBm1chlxTjVU=;
 b=fTrc48bsXdt0O72pTZ8oPvOjFKqnev/rv0pbwQgjd9RInH66j9OvT5FXRSv/hM2D0i
 gWc1JlfX/e73ZRqwAYC+D9k27hTFUYcKcXFx/oePSVCqAiJTXF9O1uFjWZURjg0psrE/
 vA6tbqBPMJDhXCdTybZZMHdPUAWSz2wkiRrJxglVH8L/szumLr5fH7yAjuF08kmI98kV
 M0KW+zyJBabnq3o4L4CJarhznodDvXSMmkU7Xp3x0DQeq+ie5yjqIMFy4hoGeCd2/nKe
 t1EhxAly8RZ9e2FvUJQpMivZapLpcDpDTGOX/TOAdAeTDzjsqGFqzLNQJblqEiIoqr6W
 QIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517110; x=1718121910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45ZzxSZH4yq0DA4k8j9nWaCJsroG/zENBm1chlxTjVU=;
 b=Z27yZrNCbO5uOHCTW77lFMkf6KbcnaGC494UvXgKnVMnBr+rj7IQDXAlSQyp5kkSo1
 1w2rxPdhVwK+UMLZh818fPgp90IzwNhTMA7TKKh498P3QtCJsLHmYCdWDxf/qsoVl1uC
 +blFP/wgA7Dr7ATuLCl0XQjxqYp7nwkUunoMDGk39sqSXPg5q2t4UIhgXunchLcYKG8z
 sLYsEPPMKuXw5Js1XC6d2hLvUUE10u2e5+gDAaxaDnoNI7iE+dr1/C/WSj1NteX/5ypH
 wQDZK58HT8CqFGgYZJQjkvG/4PKVs4dBN2z/gMu57pQgdMdbfaM/uDOls1ePpBSS7zWm
 9F7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcoyk8HRvr1Ka05GRbKTlEyLCCPkW0K7EjNazbNV0t/TbfwfcDmTsHce6c1kzxqiCAaIOqBoiRRCdMQn5BwWJ4hh/g67uEiI8EL0W9uQ==
X-Gm-Message-State: AOJu0Yy8L4fahxw/1mgFuMnp6+Xe6smeE42lytmUOpPdKnsT9gauZA0u
 mWV4AiuCoh/bfJYa+fxXKi8edxMMvcKgojntziy4bjSwhjEd/AU9
X-Google-Smtp-Source: AGHT+IGlFRb8zlNEV86Rej1R+IHNe6jYMfoLpsYaPecgDPPr70qB3irG/88JCKhNugz4pBtkPtBosw==
X-Received: by 2002:a05:651c:1a28:b0:2ea:8456:fca3 with SMTP id
 38308e7fff4ca-2ea951f696fmr92315271fa.46.1717517110271; 
 Tue, 04 Jun 2024 09:05:10 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: re-order AMDGPU_GEM_DOMAIN_DOORBELL handling
Date: Tue,  4 Jun 2024 18:05:01 +0200
Message-Id: <20240604160503.43359-5-christian.koenig@amd.com>
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

That should probably come last.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f7b534c55c43..8c92065c2d52 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -161,14 +161,6 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		c++;
 	}
 
-	if (domain & AMDGPU_GEM_DOMAIN_DOORBELL) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = AMDGPU_PL_DOORBELL;
-		places[c].flags = 0;
-		c++;
-	}
-
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
 		places[c].fpfn = 0;
 		places[c].lpfn = 0;
@@ -218,6 +210,14 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		c++;
 	}
 
+	if (domain & AMDGPU_GEM_DOMAIN_DOORBELL) {
+		places[c].fpfn = 0;
+		places[c].lpfn = 0;
+		places[c].mem_type = AMDGPU_PL_DOORBELL;
+		places[c].flags = 0;
+		c++;
+	}
+
 	if (!c) {
 		places[c].fpfn = 0;
 		places[c].lpfn = 0;
-- 
2.34.1

