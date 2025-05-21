Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB51ABF6E1
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0D010E151;
	Wed, 21 May 2025 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RpKFK8B1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B5710E156;
 Wed, 21 May 2025 13:59:46 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5290be1aedcso5311998e0c.1; 
 Wed, 21 May 2025 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747835986; x=1748440786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xw9g/u+PTutmpr92tmdCCF0EI8aDcB/IZ4deCZgUTAY=;
 b=RpKFK8B1Ban5njQku7QN3kG+5vSK2vUJD6DSuHb0s5hnCgdRPQ2N56Q3gEd3hAs9UE
 j6A+1ZfaJpCJTSLigX3g25ibVV1tXh5l3TTAjiUhyhHnXiqY+ECEHLB96r2f3tDaBbs1
 wQJ/69rkeJzKclREin3WCsxnwJH4OpLhvfTpPzyiurYWoHMnPSPQJjJ1Nk2VcEeMkcfW
 +YjI76dEfvBkr8ZQgJV8V+CnDfFWJAxhMA3bLLHtdBhNFlOj6DUhg1dI366AJQeqd2KS
 +sx9ja69rx8KIg7vnMMN4f1UpwxrG2mlBTSi2fFC9Ok/piz/FrRN6ysH6kPpTfThZC73
 ZWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747835986; x=1748440786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xw9g/u+PTutmpr92tmdCCF0EI8aDcB/IZ4deCZgUTAY=;
 b=CJCeNzTn6d7VPGmJakiEIw3uRod+oAlsFomNcpnTnQRmBmmPgfR/OAeZEGtTKkM/dQ
 A9c8l7kquSv4UZBvvkLAUoSYGWkp982xzYSkby5+bsWpCGp/xOtuZ5kO/Xqgl6bv7BbG
 wDSeuxYh9tdJqncWb2HvTileJuKIcboppLewGdvZgTIB6HmjnPoW4Cv94f/1goNJU5qv
 SXZP7o/3saL52uo38Boifa7cxKvdEWZkAAxo5wF/tj4kfDT9gt/vI5lc22cewNkH0POp
 Rv7PF0gP47FblhU6gs02SWidZrgl0oy+DvN/aYN4RM5H14g8/KvcY67mKVjiKBYrEFYR
 10lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvVAf2VvXlqYnWsbjDHfe+khnP5z3kwidZO7iyOlXDDVveTIxLttTOhdeMltOBTvxLzVTBCinJ@lists.freedesktop.org,
 AJvYcCVSau4wbFAU420dJC/M1tncIOsgo301w91u9sZd3IZaOD69xpZIY74x5k/714DPOjVj7Lr99YuHFsJw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMNIbYNKlXh3toByEbgigZdIrEqkQAa5ZiMy7rjDVOPMRzPFU4
 i7N2xcRu/R5wh5hsn/YxELRDepYdzmygdlKmtGsnWXs94CLnIk5UpAy9
X-Gm-Gg: ASbGncuigXZ8aNZm5qy4Dn8diqFyGulJPVWmG2o2KkBo6wTYTq2DqBoyl+/xbiYaF99
 S6SDxiA4SwtPHJsXj12P/NGwtNl1c0AS9HI5Z76fBx6Cc+VcsnpyL9EjX50v+vQq/sFS8I3x7fS
 Nm9nsSoPjCbZgRmnh4a0tKCY8YW44dr/fEM/OJD8aoZz7pPvCmZidWggziHJdYMJl2Dm1/KJgYf
 kVh1yn/e7Z+IsOk2sibf3ZH/zbm/DYTCZygO+FbSKZQWfwqkAcShDG6aBmp65w8eaIsf+6jxB3f
 Hfq9sC5MuDB9qUEHgUJdcdQ6f7aqBpQhggyGuz8P63neru1jbqI9eaG4vSPZ0SIxFB+yFcwpgBj
 gnpK6bQ==
X-Google-Smtp-Source: AGHT+IGU3Zp/2zebyqDel2Xw4rWlOVSOhsahtwHujXtuc/Itm9qXDr93dFezj+gD4xSXz9L53Jo9sg==
X-Received: by 2002:a05:6122:2c2f:b0:52d:bcd1:ab55 with SMTP id
 71dfb90a1353d-52dbcd1aba9mr13953246e0c.2.1747835985890; 
 Wed, 21 May 2025 06:59:45 -0700 (PDT)
Received: from xodo-linux.tailb46509.ts.net ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dba940919sm10156170e0c.17.2025.05.21.06.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 06:59:45 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo da Silva Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/amd/display: Adjust prefix of dcn31_apg construct
 function name
Date: Wed, 21 May 2025 10:58:40 -0300
Message-ID: <20250521135851.11110-1-leonardodasigomes@gmail.com>
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

From: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>

Adjust the dcn31_apg construct function name from
'apg31_construct' to 'dcn31_apg_construct'.
This helps the ftrace to detect the file by the function name.

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c                | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h                | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
index 05aac3e444b4..d1ccc9a34b2e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
@@ -101,7 +101,7 @@ static struct apg_funcs dcn31_apg_funcs = {
 	.disable_apg			= apg31_disable,
 };
 
-void apg31_construct(struct dcn31_apg *apg31,
+void dcn31_apg_construct(struct dcn31_apg *apg31,
 	struct dc_context *ctx,
 	uint32_t inst,
 	const struct dcn31_apg_registers *apg_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
index 1b81f6773c53..54c6b62195c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
@@ -100,7 +100,7 @@ struct dcn31_apg {
 	const struct dcn31_apg_mask *apg_mask;
 };
 
-void apg31_construct(struct dcn31_apg *apg3,
+void dcn31_apg_construct(struct dcn31_apg *apg3,
 	struct dc_context *ctx,
 	uint32_t inst,
 	const struct dcn31_apg_registers *apg_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index dddddbfef85f..b3553ae26d7c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1207,7 +1207,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index 26becc4cb804..be55a3c36a78 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1263,7 +1263,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 6c2bb3f63be1..b9847b4bb0f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1205,7 +1205,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 568094827212..b6cf2a296ab4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1200,7 +1200,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 2a59cc61ed8c..66fef6f6000e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1187,7 +1187,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 38d76434683e..9be23da216d0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1170,7 +1170,7 @@ static struct apg *dcn321_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index ffd2b816cd02..27affafb14f1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1252,7 +1252,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 98f5bc1b929e..d5341b0d59f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1232,7 +1232,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index b6468573dc33..6fb2261c554d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1233,7 +1233,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 7436dfbdf927..ef4d758bfb5a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1162,7 +1162,7 @@ static struct apg *dcn401_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
-- 
2.43.0

