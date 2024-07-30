Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C189403DE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B5B10E1D7;
	Tue, 30 Jul 2024 01:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DB84aOMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21CC10E1D7;
 Tue, 30 Jul 2024 01:38:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44ff418e040so23218081cf.2; 
 Mon, 29 Jul 2024 18:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722303533; x=1722908333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SCz45+BPbCjHq8X/VdUn+0NTCgnAzl07b5UECsnodY=;
 b=DB84aOMdHxB7mI9I6E6BCMiz3RrlIrNCyVPUSh7KbSjjZZ3YtOlN9wTtcfWv2JvtPQ
 oHdG+tkt6Ik9kO2/ktQXLWO/z6KhnBkyyCdHy0iU1HvY5N/QkkDzyOAgWkxFLbHteQ9o
 rKtIafrJVtZAMTWqnay+8+elCvX0Mer/quF4gkuD1ELZppmSCmCNasyrz1DbSH4ii7ZN
 TrwX57c4fIh9/y7jhrngaa6B9aCyAe8FjW1PYeWnQU1nn0CFCi2cGxPR9lrffZ4XMYc0
 gbdDtTxklarBTvEvquF9168SkoFObHraPwefxg13xRr2K56nSYqoUlHzgA5AMSaEiu/N
 J6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722303533; x=1722908333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4SCz45+BPbCjHq8X/VdUn+0NTCgnAzl07b5UECsnodY=;
 b=WS2XOyWjayqKzyqq8IpChud5izWIDk/eat4XuHoSXD9YmxFoTfWjGoj7wEvsRU3l37
 nU4IqV/J6LpNb00qiwnBxrH0/RVls6uz5sVPoCfqqzSis1HnmR3aMnU3D7mrSfK8qgdX
 4AxLA/jGQO8M9iDwrJiztwb3qWYqSDi8/KaqUlgbz4lA69FmjFYu/PL2Dmb6j+FY0jA/
 bzXNNZZCQVwq/ARkY8wkX2USPkBl1XmWC0gWsNqHqliwnh17Qn7dF2HyW81g26KR98Kq
 vVawNtD58VvqGb58HEQ4SmiB5AUqH4Yd7NbekMgW4Xh7dnDYiHy+gj9aUlOMX8Fd2t6w
 U3hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAv3CFLXzycdeMIb7AgbjFQfJ9wBAMfChfpXRDhXN+m48pMO9Aw3YhhKGvYSDQMFI9GiL0iDvJd7crXdjQ19QcwJX0nG3K1qheBwuelzoxDURhwDZxwyfrQ7fEusqWG2I2e2Cwo7xELp8+/KvO6L5I
X-Gm-Message-State: AOJu0YxxvAbd32o49eRrMDNAwnsQ1y5k6uSo54Y6n/ZN527PSzpJQKjR
 woVhgzTbHJu8evmLBmnxjRk8SSiCxgRTCjbyJtj+SOEAhBoPPwFy
X-Google-Smtp-Source: AGHT+IFeEeg8clOiGdEAAhcNy0xa4Aaj0rQjm2UC8tAdca4VXiAtuGxBMfi7SFMT9uW+nbvQLLdP9w==
X-Received: by 2002:a05:622a:8b:b0:44f:f20e:84e5 with SMTP id
 d75a77b69052e-45004e0b738mr154738761cf.34.1722303533388; 
 Mon, 29 Jul 2024 18:38:53 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe814d0bfsm46525421cf.33.2024.07.29.18.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 18:38:53 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/4] drm/msm/adreno: add a615 support
Date: Mon, 29 Jul 2024 21:38:47 -0400
Message-ID: <20240730013844.41951-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
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

The Adreno A615 is used in SDM670. Add an entry to support it along with
the speed bins.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..fc4fa2a9547d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -651,6 +651,33 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 615,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			/*
+			 * The default speed bin (0) has the same values as
+			 * speed bin 90 which goes up to 432 MHz.
+			 */
+			{ 0,   0 },
+			{ 90,  0 },
+			{ 105, 1 },
+			{ 146, 2 },
+			{ 163, 3 },
+		),
 	}, {
 		.machine = "qcom,sm7150",
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-- 
2.45.2

