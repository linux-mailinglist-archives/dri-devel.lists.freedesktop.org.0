Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B28B2019
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203DE10FA36;
	Thu, 25 Apr 2024 11:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cqPdFADT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764A10FA36
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 11:21:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41af670185fso6880365e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714044088; x=1714648888; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXBdVhclN8iRuqar3CwvdUJWpfJdsgIEIzFUbTS5W/4=;
 b=cqPdFADT48HyK7R3ukI+2zSIw1OjCPjHfnvtcX30aKo1YRNsCmeglL/l7hRJ70rdfC
 HY263e7L354fDbj9JdeuJguwV3MNozr/ilX8YPq4hu/sVHzZ1iXecRgho+i/sgUMd3ad
 oID4dar2SXNCOTv149e1UsClU00pBfjMIrzsIHpfyFT6ez2LCp8MAjQJsph01ykk62bl
 psbwuPSn9/lTD5J5UMfNK3WjChDqAeX2/tIrZtXeg7oHu3pHoYJ2RkEaMhLZvDZ8TTEz
 L9a4b/xaM94VoSWV5jtbY23cqbkznjaA+yURRFjPYsoe3Kq1Ififm+mjJJPeS110A3oX
 8QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714044088; x=1714648888;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXBdVhclN8iRuqar3CwvdUJWpfJdsgIEIzFUbTS5W/4=;
 b=OtAewgdffvxa6UZKQc25+V4pgWiU6+2TsD3XJ+FM8lvrEYXeqiIHBI4azXKNxGEMuT
 fYmMvN+XnpaBIIGMcTAfZ58kHhnseLG9muVzfkREcYZYs6eKL8Vg+uGx466lU8tbkkMS
 /9HvfahilYueCRIl325HRoaXzxgjJAKCM4pGIj1u/944EwCAxHzyaiUdUNvX4bzkyt4A
 FNUIewYfa61ghQykCiC0FstYzs15iYlMcYouvev9pusqnopUA7D3NsZvxktfS6rPkTRg
 XyClNyriGDlviz7yICvNHJJa6XrcEa2DJrSb7K96or0vyYrbvll6hglmnxare/ruBbmT
 cj8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU99lsrAue/dxsxnwO6G8qYMMWmXjrcRNeuvyoTCNHSjkOmjazOT1hikHmA3GBh90rjUqVkXnljvtCr4WK/8tywnUh921x222eKazmvucoO
X-Gm-Message-State: AOJu0YzHKBBSiN7np8Vt9t0b0rHiWhng8wJBSp4GKd6OsLMQh86OUGgu
 87JcSWlDzIzQGlmUZlAO8MrZDmLWvLguUyfv3+MBdmBgFLdiEV0/EV+EFXF2xzk=
X-Google-Smtp-Source: AGHT+IEkRzF902REA9b5+gdCdVfVhX1mEE+4IWBK9dgathGvN8Vw5Fx6OzS2pvtmCTAMrqcKfcYtzA==
X-Received: by 2002:a05:600c:470d:b0:418:5e80:b7af with SMTP id
 v13-20020a05600c470d00b004185e80b7afmr5104977wmo.36.1714044087693; 
 Thu, 25 Apr 2024 04:21:27 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 d15-20020adffbcf000000b0034b1bd76d30sm9826105wrs.28.2024.04.25.04.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 04:21:27 -0700 (PDT)
Date: Thu, 25 Apr 2024 14:21:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alvin Lee <alvin.lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Jun Lei <jun.lei@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: re-indent dc_power_down_on_boot()
Message-ID: <ad54bf29-cb70-49bd-a89f-c51ef7abb3ee@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These lines are indented too far.  Clean the whitespace.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Delete another blank line (checkpatch.pl --strict).

 drivers/gpu/drm/amd/display/dc/core/dc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 3e16041bf4f9..5a0835f884a8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5192,11 +5192,9 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
 void dc_power_down_on_boot(struct dc *dc)
 {
 	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
-			dc->hwss.power_down_on_boot) {
-
-			if (dc->caps.ips_support)
-				dc_exit_ips_for_hw_access(dc);
-
+	    dc->hwss.power_down_on_boot) {
+		if (dc->caps.ips_support)
+			dc_exit_ips_for_hw_access(dc);
 		dc->hwss.power_down_on_boot(dc);
 	}
 }
-- 
2.43.0

