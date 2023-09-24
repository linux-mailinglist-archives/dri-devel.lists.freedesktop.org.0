Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0597ACBA3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3C810E143;
	Sun, 24 Sep 2023 19:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB8E10E13B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:18 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9a9cd066db5so674009566b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583576; x=1696188376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P67yQ9/R8vP33MNrFu8s/BR4RgUF4Oo7AxmSI7wtbGo=;
 b=laTA8Me7u963lXKIpwTrzdL7qT5kynTYHjA+oaz2PsNIRyEUCySsj8Y7STPx5bWrIJ
 XXnc6Z4w/5UiIClWbD+XXT2a2Hre7wksRgk1HjZ2uwSdpMs6PF+DCv4NiWoILU9+hQL0
 iORQomhck2Ih19QbC2QYI1X6OdbV2m2GiccjUdF7Wc+b+NTXsbjUyKPf26gpsdndy2nr
 AVma63oqc0Jmp5YLfQewz8WWHGwyrdH3xh6gfMCOsnOqNCHr4h+DqoegjY+anhsACPM2
 nL90CLsA6QndVZXthQ83qtPN4TY8se3Hx1MkhomrXutczb2gWEWiw+08S1ynOoqxxqEV
 E7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583576; x=1696188376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P67yQ9/R8vP33MNrFu8s/BR4RgUF4Oo7AxmSI7wtbGo=;
 b=OE75UbJDvAT6sqYa9Um0w3RQTE3xYkRBz4hCNs99CjOmTizJKBLiseqZK4psc/mQUX
 WrBi+IMvbe0oYrkg59cC7MLf7000+98PznTg/7FkF6FNJgWloQ9bUi9+1f/9yaZYDrt5
 p7/53q/yNjncN0R+WCoAa/7DRTv3i8wK1pw42v+fb2lxy/qV/VGMqDqB2PC0synpXRAp
 85JpeLjXVW8LHZluEeRQN8VLMeMBCLV2TneVucfPtHWAVNvvqdZrgJsXdnzca+lgZchb
 rMVXjth+ee/asqcLgDhgcM0yZTVAU1tAM6HwCX7DcUURDvp5Qv9S6yNmW8QVrcwC1JOT
 OIQA==
X-Gm-Message-State: AOJu0YyPWgEvlscjqDwW1DiXA1C74J0/ZIFf/NECMobdQePjpmgZ3wBw
 MHugrciFKeEpXuD6eKEa/98=
X-Google-Smtp-Source: AGHT+IGYcIjckD309lYilHv1Z7GzrnSkK3WVyjDqrq0qtPDgxT6RI3OTizpfVXr1WSEMocNk7yTMyQ==
X-Received: by 2002:a17:907:775a:b0:9b0:169b:eee2 with SMTP id
 kx26-20020a170907775a00b009b0169beee2mr4068950ejc.10.1695583576620; 
 Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 4/7] drm/sun4i: Don't show error for deferred probes.
Date: Sun, 24 Sep 2023 21:26:01 +0200
Message-ID: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers probing in display pipeline can be deferred for many reasons.
Don't print error for such cases.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a8dfc022d3c..b4816a1b0be3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -88,7 +88,8 @@ static int sun4i_drv_bind(struct device *dev)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret) {
-		dev_err(drm->dev, "Couldn't bind all pipelines components\n");
+		dev_err_probe(drm->dev, ret,
+			      "Couldn't bind all pipelines components\n");
 		goto cleanup_mode_config;
 	}
 
-- 
2.42.0

