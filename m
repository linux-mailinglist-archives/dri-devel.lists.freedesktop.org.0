Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E096F9F7B5B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5630710E158;
	Thu, 19 Dec 2024 12:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Faupaq5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5094710E158;
 Thu, 19 Dec 2024 12:32:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so5254345e9.0; 
 Thu, 19 Dec 2024 04:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734611556; x=1735216356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7uOMmOxTuC9inC7UAGuj5K8CgVJVzatCr2SxuceBbgc=;
 b=Faupaq5vxWbw46eIOBxY1+9dTAYCdlHyzsXVESv2QbRa7gY9uDK8HHQNAkJXm8/vh7
 p7RdiETzEOLr7lEMkKIwIrIAXzSg/CkAXV8RSQNSeB7+IJA8EyYYwmHas9bA19Awm88U
 acqbX0SeWhsEvA/1RD/h3CGs2brhW7PQD8+BT9jCMeuv0zct0AZcDWdLrAFRZCV/oUcj
 PMyllWGHqzS03aXrIQMPPRApVhNMgbBN3VaieeadZh+MGRCCFdA1S+a2jm8AHxp0sWnX
 k1s3NL+BeW7hHMB6GDAZwG5en2Cs6yIemLCJQRwwejNveOTEgpoY++v5UOBWzFPLjK9y
 Vl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734611556; x=1735216356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7uOMmOxTuC9inC7UAGuj5K8CgVJVzatCr2SxuceBbgc=;
 b=cXa+I5t2RzRQMPr4vG9pwoara9rd0T4ReyQN+e27MBZSOe4Ec45awyCfEaMnlC3GSO
 moEIS/dGjITDep2+OwBU8H2fDlFL3eUN4gpnkaDNZps0ZTuHupzjyDQyN3he8ckjT/vE
 MyMQLjA3QtbxPPbW0adjZGJkBXgHd8dC32UAsZayyQPyto2Scl8JUVbPGUlWNYqOQi7I
 nK8LRqtGHUv3pLjX9nGktC62qa138jW7taTCZeNuhFiGDZm72l1qldYOOEfOMFgi9G9G
 IPUxhx82FxrB6ePRbINPw39bsRkY5yvOVc9r+9Y0SEKxrHdjjNPz9h1eVAoUvPHB95jO
 7srg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlN5MNp1p4kBs/9l+JUnFQO5izf8Ot2e7w2BG5S/mL8QU7Rh8hQ1Q1Wsbc/6ejFvuYEuJsLOw+MJyn@lists.freedesktop.org,
 AJvYcCW4i0a00Lh/7DtBuxGe5loLXmZlOhvoBVX4P7Yth1S98QcglvG44h7NeWZOVql8sGeoSYryf+CP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtciijZJ31A1BUw500ZIplBs1eIQLzAmPU9hnAgfy3yNDcuNKj
 Kp/61iFKuMc1aIHiwbKE5OreKHFVCIJnWJOUuSqmzsZVJP56Fbdq
X-Gm-Gg: ASbGncsV3zX1rmINX4rGvMT+g7wIQNsQG5leUl97ynh15VqBkltDrzbYJVHqLJCpuCq
 nfr/+QC/7RQIqVaqEHNBe2KoMHSrTbMc79Vtt/L6u87fM4OyrvsQYzVWddwP9I7xHoKwajONlNe
 cO2HDnAf9Ci8hTcSEtV7aa8HFNTGKUHXdb4/GQXPqWwrgr246hf6gfJHAdn9xQIE3yXBn6CVm0g
 wZV60L5OKFBaAHhIc8K7FwTnPFlO3Z5ooJKS/Yx9jTuNEDMzprWzS2p3g==
X-Google-Smtp-Source: AGHT+IHJaWy4Syj1FDqmmodsg0qce4bbV8C9mjEYRpvZWrWVy6MDcpPigtdiqfpwr/3HujPnW6Dr1w==
X-Received: by 2002:a05:600c:350a:b0:434:f7e3:bfa8 with SMTP id
 5b1f17b1804b1-4365cbbc5c5mr23736705e9.33.1734611555485; 
 Thu, 19 Dec 2024 04:32:35 -0800 (PST)
Received: from localhost ([194.120.133.23]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289e0fsm17105165e9.39.2024.12.19.04.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 04:32:35 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "tolarance" ->
 "tolerance"
Date: Thu, 19 Dec 2024 12:32:33 +0000
Message-ID: <20241219123233.404925-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.2
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

There is a spelling mistake in a dml2_printf message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index b9ec243cf9ba..774c7692d416 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -8561,7 +8561,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
-- 
2.45.2

