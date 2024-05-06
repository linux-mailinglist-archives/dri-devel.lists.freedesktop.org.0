Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A78BD5A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FCA11232D;
	Mon,  6 May 2024 19:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZKriHOA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985810F094
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so509214866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024641; x=1715629441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C88NXh5dRoqqDkaBrG5x3LDrKI9aAW0uYwvaYAfrMG8=;
 b=ZKriHOA7A3r60shw4ukMGu+XUeA0CQZC678AKxWrhr8NLAWdLqAfIO0S76xPdmqY0x
 KHIqYrQbudPT+t43ExQ8s9ps8zuuymC7SzLBj6Tom7JP8bH0ptHNSxCQ52pGxVaT2Vv2
 3fmvksd15RVYCPdG/egQSJt0rghq1jvtTgvaxSVNR077CRIR7YZyBSLVYoDkYhBv4+4s
 t4yRAGn5iTtw56DWJapMF0fM2lwKmqSz+TB+o6R6pGjlAy1adtue3dYb1m8I1+ZW3OOa
 iUZYbTjQUTuIGf4H7D1GU7WzpCQXEjuYaXh9W2h0FUWdVAeoV4/y65FbQ77MlBYIet5L
 IO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024641; x=1715629441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C88NXh5dRoqqDkaBrG5x3LDrKI9aAW0uYwvaYAfrMG8=;
 b=DO/T8x6lX/ErxLHD3b4Bb8IV7VIZ73drz6fUicqD3EDLX+pvQzMAqtAuNWga9CYrjF
 KM9KEVFU99Dt3STkK77M5uTmnFoywiDMDdfunoTNx6Jp9NbbR50atjh1lxxbgSq1Xs3Q
 Y5rYeI2MxLHfhmhPVGs3R6a4eafDDbxdfS/B5I5GaU+iC+VfTVHB5eVazueCyX4pzyvG
 phDNNdGhV2uaDuwkZQngfOyP7YRsQCpgRX0190zA2VeEABVkBkBKQrmzwzC094GJ1P7I
 s1nC/IcM7QSiUmcuRLZx5wW9b7EAWVRITbNLCOFcMUddUUkc+BM+cmDPLJHFspsZuFo6
 HoQQ==
X-Gm-Message-State: AOJu0YxCLjoboiR+DhVr3so4R7+fOlDxKo+khNe4XVevqKbch4KK2PD1
 bTQD+t2lQyNHPMXin445dBFeOhfDB8l1Sfc5bvR/vU0j2VAVRx0=
X-Google-Smtp-Source: AGHT+IGXkpTxbAh5DwLseWHJnyaH5MLqujBbL8ZKSiMVh7SfVdr7KWTIModIbwpe+SyWgj9tViY0hA==
X-Received: by 2002:a17:907:944d:b0:a59:ccc8:577a with SMTP id
 dl13-20020a170907944d00b00a59ccc8577amr3025674ejc.47.1715024641199; 
 Mon, 06 May 2024 12:44:01 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:44:00 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 4/7] clk: rockchip: rk3128: Add hclk_vio_h2p to critical clocks
Date: Mon,  6 May 2024 21:43:39 +0200
Message-ID: <20240506194343.282119-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506194343.282119-1-knaerzche@gmail.com>
References: <20240506194343.282119-1-knaerzche@gmail.com>
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

The DSI controller needs this clock to be enabled in order to be able to
access the registers. Make it critical for that purpose.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index a20d1fd25e2a..d076b7971f33 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -563,6 +563,7 @@ static const char *const rk3128_critical_clocks[] __initconst = {
 	"pclk_cpu",
 	"aclk_peri",
 	"hclk_peri",
+	"hclk_vio_h2p",
 	"pclk_peri",
 	"pclk_pmu",
 	"sclk_timer5",
-- 
2.43.2

