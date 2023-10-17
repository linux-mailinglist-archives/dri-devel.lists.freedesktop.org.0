Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDF7CBD0D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866910E281;
	Tue, 17 Oct 2023 08:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D910E280;
 Tue, 17 Oct 2023 08:06:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso4375360f8f.2; 
 Tue, 17 Oct 2023 01:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697529979; x=1698134779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=StdO7xGyH3UvCyXhFtXv4psWFKvp1DucCdvwZVAgPBA=;
 b=ey2+QUOd7vmwnTTlqXS7t2w+/qxfDpJE1WTNYOZyq7Q27+nmDkGVn+xKkBMzEfawA3
 3aCLkJPluft0Ew7NNchbKZDylxtF8yvL+ZB2qqEPoC0IjGlQyKorEiwHFK80zfL+2Sdd
 57o+QW4+bsXR6A+I41y+W1wUkJgj6Mn8e9XbG+5vbFpZZ6UX5mp+Kx3fusqrMJmso9jp
 c5kQhLez7SoH+J2Gmi9v4ESuSx0u96oXU/1Zr1spDmcFz3T4Pf3xMJqfmqauPUOIM6Ci
 dWatm+hWyko2CEJCUcFMvu3darL1Dz0ON14fPytgRviEGhKAAe2YX9S8VHaLgBfBqu2I
 +foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697529979; x=1698134779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StdO7xGyH3UvCyXhFtXv4psWFKvp1DucCdvwZVAgPBA=;
 b=uk9AwwGycNiAvMZRuj8j/omvLakxCKENnGtGJqOvsjadcP5fRrXIIlMxXGrCVWtros
 d3LrbmqaiiqBV4Gu6GMJeJ9W/v7aU8VyHs8Zr12BMZe62h8zjmYfqFFOCoBD5vTUheeU
 hJqe76Y6VLZqzcLJn+gUWvIZ7ICeQHPgo2c7w5ZK0XoSkh2A0ctm83eROcvwVQy5Z8WH
 eI3dYgpuNH6nBSje5Loz50rDkVTzrv5SSduk7D4uBfhvmojLpb/clrErLKIRUoxWgju/
 7dMmugnHPNIr6gbbD0ja72Vn/18kY6g8Y3S/jdjxsbpQ1k4OndYD+doKDPPMGoVKvemt
 PeJw==
X-Gm-Message-State: AOJu0Yy2LGHVgCnm4hVBQb7gLAW2/fKGqWTODAdga5NCmHXcCYvP0/oq
 v4rS7JA+h9D2sydhNbn60tahBtVknmDJyw==
X-Google-Smtp-Source: AGHT+IFR4L3IZmU8EMr8i/pPBeWSbK4wVJmXm3XWNz2lDoOIdQiZh9xearr+dexY2Zc4QIiTdnjeqA==
X-Received: by 2002:a05:6000:1104:b0:32d:96e0:8048 with SMTP id
 z4-20020a056000110400b0032d96e08048mr1417525wrw.9.1697529978826; 
 Tue, 17 Oct 2023 01:06:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 i5-20020adffc05000000b0032dab20e773sm1072053wrr.69.2023.10.17.01.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 01:06:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: Fix a handful of spelling mistakes in
 dml_print output
Date: Tue, 17 Oct 2023 09:06:16 +0100
Message-Id: <20231017080616.18970-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a few spelling mistakes and an minor grammatical issue in
some dml_print messages. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 851db026f251..218c355a97a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -1507,7 +1507,7 @@ static dml_bool_t CalculatePrefetchSchedule(struct display_mode_lib_scratch_st *
 		dml_print("DML: Tvm: %fus - time to fetch page tables for meta surface\n", s->TimeForFetchingMetaPTE);
 		dml_print("DML: Tr0: %fus - time to fetch first row of data pagetables and first row of meta data (done in parallel)\n", s->TimeForFetchingRowInVBlank);
 		dml_print("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (dml_float_t)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml_print("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((dml_float_t) (*p->DSTXAfterScaler) / (dml_float_t)p->myPipe->HTotal)) * s->LineTime);
+		dml_print("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((dml_float_t) (*p->DSTXAfterScaler) / (dml_float_t)p->myPipe->HTotal)) * s->LineTime);
 		dml_print("DML: Tvstartup - TSetup - Tcalc - Twait - Tpre - To > 0\n");
 		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingMetaPTE - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((dml_float_t) (*p->DSTXAfterScaler) / (dml_float_t)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -9323,7 +9323,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 				if (mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_not_required && locals->ImmediateFlipSupportedForPipe[k] == false) {
 					locals->ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
+					dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
 #endif
 				}
 			}
@@ -9376,7 +9376,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 	if (locals->PrefetchAndImmediateFlipSupported) {
 		dml_print("DML::%s: Good, Prefetch and flip scheduling solution found at VStartupLines=%u (MaxVStartupAllPlanes=%u)\n", __func__, s->VStartupLines-1, s->MaxVStartupAllPlanes);
 	} else {
-		dml_print("DML::%s: Bad, Prefetch and flip scheduling soluation NOT found solution! (MaxVStartupAllPlanes=%u)\n", __func__, s->MaxVStartupAllPlanes);
+		dml_print("DML::%s: Bad, Prefetch and flip scheduling solution did NOT find solution! (MaxVStartupAllPlanes=%u)\n", __func__, s->MaxVStartupAllPlanes);
 	}
 
 	//Watermarks and NB P-State/DRAM Clock Change Support
-- 
2.39.2

