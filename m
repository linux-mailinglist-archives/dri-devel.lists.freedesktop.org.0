Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DBB8346F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EA10E0E5;
	Thu, 18 Sep 2025 07:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="luGo9XoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E78F10E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 07:12:33 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-77b91ed5546so581562b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758179553; x=1758784353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kkm5768qLYG/7lMt2aDpCtrK/g19VAgQZBHIXA7VzC8=;
 b=luGo9XoZaLbLP/GtB5ZzgXHlqhKsqBAAH3SvZ71E8gSWXOjVH3IkVJQybsum8qDsRr
 5F+R5BNZ3lHKEHPziKFGERcTKcG6BrU666i4q21GZh3L53qy6fmQ8nJcyBJyz1dqwzbR
 whrvtiKLvu8JC0wWQBmHvUvu9lX2MCF93Fu7aror/hhb8UF8J1xAomvIer6BFVEI53np
 x9alCOP9vD4EM8SACKP4HUQo+/RGWQaE/T9AGQ0+X9AvaAcn/m7DFjib45kiR8RWBERI
 z3mAaCwxGyi5ibt9IAYSVae79JKyAl63Y8AQuyXgz7cKr9jqj8l7VS0dgMit3cBQMecW
 KtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758179553; x=1758784353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkm5768qLYG/7lMt2aDpCtrK/g19VAgQZBHIXA7VzC8=;
 b=VhpIZXi6EQMZrdVtDhDvKoJIGWt3P/oZgraqPbipqfkN92UTPR+sOlVvddEV2U1P4O
 RwEPq5T8OougmsgyrHFxzd8t5sNYqI2oQ9FuiKHHPp5uIhBzt5zRsoY1NxzgO4c+p2t2
 NEyFGy25B7yus9LPhYp3u1y9obpLRtNqELMQjBeclcce39d/FiVntmiti1UcffkoxUzQ
 1d1Ae8PNL/x2m/NRXySNV1cHLP2UdD3CCvdAjaHXrCHAagAuT9VthCm05lzaIUlTJXhZ
 n3qT3hS7EFwyDFGz5Ls8jbrtTFn4at15z+TSehMI6+kE1VFL0ZZjypXOJNzq+F2M4GQI
 ULCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cES/pBHDhwYhPuEMp+o7x19zm/vBNvlIKKhW+0q+a+GXx/klXPJEAgwpc8Cy0o/tYSn+lzzpV+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3MoV+czwUhVhNYBT3ivLgDw4MOxt/ovsGgy31TDuNgfYyNjRA
 AVHFSUggL3Hr8LwwcCH5sIWavZbOX7/0onomvvvKqmb1x504HYqgRQR8
X-Gm-Gg: ASbGncuCuEer4zJMwD2E8/zVbCH/EZEobrurKkPHBtohLFhnnG2Kd8UjyxWltDiChCg
 IPsNC5PERihy3SWcoIESyn2INocplUsRswv8uGoS8F84znmAaoJUDVQibaLKkBRgzcC/k4lY2kV
 YezuTKc3r8zoUWt8AA0ErpInZnW8H9J1O4y/VjLHMsJ2v2F102/U+Hgr4UqLLkB6gUq9RJ/oPOS
 VZmwz20I7KX3egczxp1gwi4U69IIbFYGtwLVs7NDeF+blEm4FNhDGBK7Ad9me4GBrDJ1VIf3ml1
 hc6nwVJJ/Rx92KFAUSbJCVLlg516K/j4M62rFvlaNRJYwU5A40CxLdEE9FkTIEvZyNUCocnbz2O
 bfRRcS3nJDbpZ941dHoKp7/qEqVuyS675V2M1rs+5JuUwVeK1TAP60tE=
X-Google-Smtp-Source: AGHT+IGdU2UHmJHhU9RR2jUy+RtSKtOMtaGZXLns5gxJCl2FXNsuL8oTowVvbbfw7QvNTE+aUNdCBQ==
X-Received: by 2002:a05:6a20:6a10:b0:23d:ab68:1b7c with SMTP id
 adf61e73a8af0-27aa99bdb9emr7214606637.46.1758179552545; 
 Thu, 18 Sep 2025 00:12:32 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff3743bcsm1435597a12.20.2025.09.18.00.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 00:12:32 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rk0006818@gmail.com, Felix Kuehling <felix.kuehling@amd.com>
Subject: [PATCH v2] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
Date: Thu, 18 Sep 2025 12:42:00 +0530
Message-ID: <20250918071201.350162-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c,
amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
amdgpu_amdkfd_gfx_v12.c to make the intended allocation size clearer
and avoid potential overflow issues.

Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes since v1:
- Extend fix to amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
  amdgpu_amdkfd_gfx_v12.c as suggested.
- Added Suggested-by tag.
Link to v1:
https://lore.kernel.org/all/f782159b-ad3f-4d0c-8476-50a701bf29e6@amd.com/
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

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
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 6d08bc2781a3..f2278a0937ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -338,7 +338,7 @@ static int hqd_dump_v10_3(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -435,7 +435,7 @@ static int hqd_sdma_dump_v10_3(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+12)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index e0e6a6a49d90..aaccf0b9947d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -323,7 +323,7 @@ static int hqd_dump_v11(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -420,7 +420,7 @@ static int hqd_sdma_dump_v11(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (7+11+1+12+12)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
index 6f0dc23c901b..e0ceab400b2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
@@ -115,7 +115,7 @@ static int hqd_dump_v12(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -146,7 +146,7 @@ static int hqd_sdma_dump_v12(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (last_reg - first_reg + 1)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
-- 
2.43.0

