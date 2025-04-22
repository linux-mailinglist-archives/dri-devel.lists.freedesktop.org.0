Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BEA965DF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6582710E1AD;
	Tue, 22 Apr 2025 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSCp68do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200F510E1AD;
 Tue, 22 Apr 2025 10:26:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so39690505e9.1; 
 Tue, 22 Apr 2025 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745317593; x=1745922393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g7SxF5DbGT5htrrk5YgOA+scpYjVb9Z25iQ9Uytxx0w=;
 b=QSCp68do+C2Uattg5NfH8q7rDxMCTE7Cw+uJcWGoPZGlCGpL5F1TW6/jIerVxIY+IV
 o1ZBxzel2YasK5fuVKVACQHMe7ifXL7mP4qKKqC+RTmP/i5j+1XJGI2OKWZzBm/zuv8B
 q49OhjxNYsI4xBAt4JDmVj70oo6BgvIoKP62wpjBgQGsmYK57wtOihTuxeYuGUjZBs+d
 eM57dPIONwdSq2b2vPqS7aopYhj7C1liL0i0w8pvCXRr7HevTxXBmS0KGCC5EcECYgOw
 zgbN5ZLE9vmj6vYBaieRo4HIViODGX61VXHpOWR2wHJLzFR3v1a95eu7BgCChwqsDvMa
 hhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745317593; x=1745922393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7SxF5DbGT5htrrk5YgOA+scpYjVb9Z25iQ9Uytxx0w=;
 b=mLXICC/DF/XVkMvB1viSTozQ+dDKcL3JqKbH7FiRSxqyyobMPRwMWTlgsoqAWoffLm
 sH+yJU+syMUpi1viNZvMaCl/vajvS33LHhemx8KdMiV3mLe9c2om56t9VdBuYPwsOuKt
 63jb63iJCsD2JUAD0VHyvzGiI9jsPVUbRxOvUo50EG2pIQl6+uBe22E+0TGR07GJ15UE
 qbfqg4hsGG+geq7zuA5dLuipqo1DJg8XJEFwU1gORisvhs2StndkJR13Rd9pnB+W0zN4
 LF2Fg20EJWHm8cjOKSx+ykYMYtmH/gDuJ2IIAF0oA4I147L/u/ynuohDbhCUu/xcv5cX
 XiPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmqkytU9dhxNbw6aDY0AmAApUgMahBoG+2PqBVDFdZUK1YgOW0PIX9Br5nq4WVee/9EgM8ZgkkF3lQ@lists.freedesktop.org,
 AJvYcCUnZJLEq8dIpSCNEQG9F9/c4AbR2KcHo8OU7hOVnRFKYRoYQcsJr/c3wBgedbx/lzW/qJPSBmZX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7soT7++PMQa+ljIstHP46x4dsPx+pTdRBqwke+tslDQCUGEmT
 lHlk+ZWeEuPMoVJbsqHZ1/N0Q5ltdAyV9IdcujOSdNeG7z24W+ES
X-Gm-Gg: ASbGnctNOtHfpcyJ15M0uqFkkozEwSSUTdCP08U29kH3Xswr3NSFVrHbERJBHq0uy2M
 AGJ3TtV7oxR7KgFbVNSJ3UHgJkrtLw17RydER2lk+uMtSk7ge7t2gm+afBXAyIYm/5qiVfkFDbi
 nNz/4tG3WJ3yW5MZqziKxUHD1b6o7grIYnBJkz4iQtYnBBq4M9ovwus7giJY9PqifuRT16SwDkE
 aSlj8nVzDljpdrloR9kBVIKaX3hodVNSy0zPqm2Wz6uJPsexJL+ST6UfnHX4vt61nlE/MvmRYMh
 XLKydzPAQdDVxFdhbRYiuhIm50+7I0U33M7T7ZlHsQ==
X-Google-Smtp-Source: AGHT+IGlq5aQo6biEBoKrYltKM02BlS5tU2XYCn2QzFs14ArIDjnApRfpVJZzbfhnaPVk4Nsu5WREQ==
X-Received: by 2002:a05:600c:4ecc:b0:43d:db5:7af8 with SMTP id
 5b1f17b1804b1-4406ac0f3c0mr111465995e9.21.1745317592548; 
 Tue, 22 Apr 2025 03:26:32 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4406d5acccdsm165855825e9.11.2025.04.22.03.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 03:26:32 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: Fix spelling mistake "rounter" -> "rounter"
Date: Tue, 22 Apr 2025 11:26:26 +0100
Message-ID: <20250422102626.29965-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake with the array utcl2_rounter_str, it
appears it should be utcl2_router_str. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
index d81449f9d822..c48cd47b531f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -1547,7 +1547,7 @@ static void gfx_v9_4_2_log_utc_edc_count(struct amdgpu_device *adev,
 {
 	uint32_t bank, way, mem;
 	static const char * const vml2_way_str[] = { "BIGK", "4K" };
-	static const char * const utcl2_rounter_str[] = { "VMC", "APT" };
+	static const char * const utcl2_router_str[] = { "VMC", "APT" };
 
 	mem = instance % blk->num_mem_blocks;
 	way = (instance / blk->num_mem_blocks) % blk->num_ways;
@@ -1568,7 +1568,7 @@ static void gfx_v9_4_2_log_utc_edc_count(struct amdgpu_device *adev,
 		dev_info(
 			adev->dev,
 			"GFX SubBlock UTCL2_ROUTER_IFIF%d_GROUP0_%s, SED %d, DED %d\n",
-			bank, utcl2_rounter_str[mem], sec_cnt, ded_cnt);
+			bank, utcl2_router_str[mem], sec_cnt, ded_cnt);
 		break;
 	case ATC_L2_CACHE_2M:
 		dev_info(
-- 
2.49.0

