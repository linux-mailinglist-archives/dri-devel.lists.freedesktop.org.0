Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31CAA443A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9767B10E6DA;
	Wed, 30 Apr 2025 07:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMMwirGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E357010E15E;
 Wed, 30 Apr 2025 00:08:47 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so6256534b3a.0; 
 Tue, 29 Apr 2025 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745971727; x=1746576527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+F+v5m6yj3cGcoqMHs7EgZ+8PI4PBW7+WB/WP9mOT0=;
 b=KMMwirGa5ETllFLZ7AflDHwXDmvbqvKX2aeNR2rPL8BpXERWVmuuuiPypbPmdS3AgK
 hXT1iEM1ldriAXUHwXq+k92dFxXvGS1qEAR29XdacSVRvL062CMWMAqZnrwYEP/WcB8J
 O51NX9MxpJjFLEvjK8cuH2T8926e6tCtukRuMzil5Ja7YHUi1BWjv5ePh+VFvlIWQFwu
 Dh/+Ao/gG8zXTf2j8CW8sO1qTEtipNc55Ixdw5j4+wNT4fpdncZ+pvjntl6OlP3RKtXI
 MvARkSACRT/1fwKtybiswV1IXVBKQbHSp1SoGVgioNt4wtyR2We2s8oRdsOfOsfaoojn
 FWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745971727; x=1746576527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+F+v5m6yj3cGcoqMHs7EgZ+8PI4PBW7+WB/WP9mOT0=;
 b=hey2XPnb2zOVc8GbHZADTj2mcWFTilxj83IYoPNpfEqT+MgdjaAeYpb0+SOYdwE0g6
 Pu8DW/EDDOCOBzbjuUcfyxcFVBYx+kd7z4eoVPjrClHtuubWEyPgovyxQDLzcxsYS38C
 8pqrUGaqySaqakwQFD8ksNrwuFtSRtxgJ+GJh3VA1h+CyM1+YsE8rve5Xs4PbTkmd7i0
 gTOrt3u1rLElrPApP//o42PlPlsdu7kPzmkNgyHqCYGzX0wMSURadxjAPQ6FHtQks9CR
 KcLqKiS2hhxi8l+qXYr1jwgT2mOM69gxeM40ohkhbQRX2tZw/h/3euwFedmumGlOTP0o
 8bcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQjBq6sWuROTCUsP+Ht39Hm6equbQEP5h/vo+FlhYNVuEhcdWkPaLkdqrXNPWo7M7dGSIPYmYC@lists.freedesktop.org,
 AJvYcCWoRG/d1yEAaxl2qYV9KKGUVcdYZ2aC+p6m82DicAVkKCfNYISoPeUNkykFopdckybXdCwHCJeldok2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsiCVXZj6bEuvuppiBud1f90TaHilVOlyti0uj7mLqMVd89axD
 ngKZtGuKBxrkRRDF8Nc9Bex433ljbDbtbYM51SHVWaTom/CoQ6hK
X-Gm-Gg: ASbGnct7L+UtTAw5f7213OQ8X5j2+fVJDQavFASanAe/mScBwPoX10goN8qnkpjNcAo
 l16omzbB5DLaBemB4Rxi5jQMh6nuN8BkhrDdL6A2hMaxalOrIWk+6DSdYy2uEoTATCdFxAx6DGN
 Q8kNkq16f9l99Bs9kGdId3k/mSpavcwBMjXlnazMz5hXpmawycxSekkH/zzblJvkH/WbNMPa2so
 BrLwHgoScN88BIoFxfcqUf2ZoyRp7b17fu4vK7VOIWM6xnGUB74dU4qnBVVPquuDUA0ADIyExn/
 TXDZYVjtSacMtrsbFaiiGxcLkgavQRVvkcPGGK3lT8pN0aXcfS08IxCEvnvNmvpTEwIFMlz3KIA
 mKd8=
X-Google-Smtp-Source: AGHT+IECAs9dAkCdTV1JKhc8aELYWoCdrQ/KmD683RmorBGh+SWjqjFVNNX1pZKKJckCVqivBXYNWw==
X-Received: by 2002:a05:6a21:3943:b0:1f5:5aac:f345 with SMTP id
 adf61e73a8af0-20a898108f6mr1319400637.36.1745971726671; 
 Tue, 29 Apr 2025 17:08:46 -0700 (PDT)
Received: from fernando-Dell-G15-5520..
 ([2804:14c:38:8026:7a68:45ae:9be2:4d64])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f4b1749dsm9557910a12.0.2025.04.29.17.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 17:08:46 -0700 (PDT)
From: Antonio Fernando Silva e Cruz Filho <fernando.cruz.ctt@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: andrenogueiraribeiro@usp.br,
 Antonio Fernando Silva e Cruz Filho <fernando.cruz.ctt@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Nogueira=20Ribeiro?= <r.andrenogueira@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Rename program_timing function for better
 debugging
Date: Tue, 29 Apr 2025 21:08:20 -0300
Message-ID: <20250430000835.34139-1-fernando.cruz.ctt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Apr 2025 07:44:03 +0000
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

[WHY]
Improve the output when using the ftrace debug feature,
making it easier to identify which function is currently being executed.

[HOW]
Rename the program_timing function to a name that
includes the path to the function's file.

Signed-off-by: Antonio Fernando Silva e Cruz Filho <fernando.cruz.ctt@gmail.com>
Co-developed-by: André Nogueira Ribeiro <r.andrenogueira@gmail.com>
Signed-off-by: André Nogueira Ribeiro <r.andrenogueira@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
index 003a9330c..88e7a1fc9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
@@ -105,7 +105,7 @@ static void program_pix_dur(struct timing_generator *tg, uint32_t pix_clk_100hz)
 	dm_write_reg(tg->ctx, addr, value);
 }
 
-static void program_timing(struct timing_generator *tg,
+static void dce80_timing_generator_program_timing(struct timing_generator *tg,
 	const struct dc_crtc_timing *timing,
 	int vready_offset,
 	int vstartup_start,
@@ -185,7 +185,7 @@ static void dce80_timing_generator_enable_advanced_request(
 
 static const struct timing_generator_funcs dce80_tg_funcs = {
 		.validate_timing = dce110_tg_validate_timing,
-		.program_timing = program_timing,
+		.program_timing = dce80_timing_generator_program_timing,
 		.enable_crtc = dce110_timing_generator_enable_crtc,
 		.disable_crtc = dce110_timing_generator_disable_crtc,
 		.is_counter_moving = dce110_timing_generator_is_counter_moving,
-- 
2.43.0

