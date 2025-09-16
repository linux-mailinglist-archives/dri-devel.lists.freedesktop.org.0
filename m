Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEBB7E327
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672B910E0A0;
	Tue, 16 Sep 2025 22:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWdU0eR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D11A10E6F1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:30:19 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32e372c413aso1679247a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758015019; x=1758619819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xMegCBQz7YTxSeWsApsavoRdrbMxT8WcHe9sV3hQY/k=;
 b=aWdU0eR0MXkbcD06Hlq4p4BVUIpdyZtmsQU+jHeHTCYGtQBQow3MVl4n+5BNPyNkBA
 acGkacsrd0sQka8K5dInxUY2iJxYmDL2aNDw/sigGySppEr3/X15GdzXEyZTc31zmhuH
 CznhSAUTrKJSDO1CW+tcT7HQFf08QS4A/MFJMpZJQE8BfrWetNF1kDyGUks+Yvb9BVGJ
 Qkg0i2FvaSmaSRqC2oWYldAeXXxr1ONMzfUdWyfVd3S9Ae2KCbcclGh+YLNCBxs6uEQA
 B2IyiWb1IsGK+yjWwAODE/h2/nLvn0fjMuoQVo86/aKt5Z0bTE+9WNQ5GwDperOedN4P
 KWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758015019; x=1758619819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMegCBQz7YTxSeWsApsavoRdrbMxT8WcHe9sV3hQY/k=;
 b=QQZwZX0RyZ5/JNj2Oh7e1NGuDK/jOwIQRYnDJkLi6URqGlJ82fiVr1mMOx+qci2anj
 3ZtUEUOeDDhVrH/mwphOcTYOU0sOarMwREwaERcpBrA+L6XUpe2wp0mkmF/G/g6oEvyv
 4zNXo/b3owQ8TOmMReQKoqgT1JRyFLAjbg3Pui5a/GFqHqKTIyT2o71Kt6nIzHctrGLn
 7j+c98DvfLYSOKQMxiiYylHFe+46IRRj6wO5gpwTuXkJeErFeACn5d07CPB2f8Mv+rNz
 X6bVC0IQV91t3a7BZIseG9dmRN/+/1EUlhsOVnLawKUVXjLRSYIHEyGfMQ/ZbC3we0oE
 VdOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDU4yRtEMkcfU0BeyzwrgKgpA+ZGzalt4ijDUkcMH24YCh+4cA5KbfWy37MTBb/fk+3V706kE58dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ1OFCCcz/btEIbAzUA3iyG4YeGqS7d2f+mVY1Xbfj6PizJlOF
 41V4uHG79AXIXLUPmoNZFzZTA+YiKqMuJJY3GdDXlMIlk8EqIIMhAegR
X-Gm-Gg: ASbGncstHuKP+TTEdJQyoPupgsMQn/bvAE3rExn0kkieAnKgQb/8vTIJ08ua4TIXEt9
 seaEvdo2wgqBrceQ/uSEnv1rOobPtxUutotDAGcYsalN/D5RqE/bOz5PpHgfQmMHi5lK/BDP8Ix
 DHfxP3IXqzyaJ17ymrDlk7Z5v+hXIJICBROt3dWYosUz+o6PUuylxZR8jEd79DSXCseROLOaK3x
 SMGZSjHAWa6Ao+htEHUHlgOuPID3GWKQyBfSsYQuszObE+3tzupPmjGXkue7HQ0szcLsf6brezc
 ygytOflKxKaWYEwf7cObjayI6JNHATxkBuQdQe3CpSyaRGv3ENkofddbT+t4ybCSfA9K3DVHkiG
 iQCu2U20r3qNFVE3DIGBbGRM6m559QO7fsAcuLYEs4lUJB/w=
X-Google-Smtp-Source: AGHT+IHaY5c65oxrMkdcTL0n+OlnjEx6RcD6jC9gi1YeTOzARVykTuROW5jlE0gu3jOJro1VNfqXFA==
X-Received: by 2002:a17:90b:38d2:b0:32b:baaa:21b0 with SMTP id
 98e67ed59e1d1-32de4eabfbamr18284658a91.6.1758015018661; 
 Tue, 16 Sep 2025 02:30:18 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ea3c72dacsm869074a91.4.2025.09.16.02.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 02:30:18 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, rk0006818@gmail.com
Subject: [PATCH] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
Date: Tue, 16 Sep 2025 14:59:49 +0530
Message-ID: <20250916092949.4118999-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Sep 2025 22:36:40 +0000
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

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c
to make the intended allocation size clearer and avoid potential
overflow issues.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 04ef0ca10541..0239114fb6c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -352,7 +352,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -449,7 +449,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+10)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
-- 
2.43.0

