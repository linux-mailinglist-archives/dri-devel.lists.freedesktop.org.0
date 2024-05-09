Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84F8C10DD
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895F510EA96;
	Thu,  9 May 2024 14:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dmGSghZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFC910EA96
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-34d9c9f2cf0so725664f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263622; x=1715868422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7sDaxG0HvtHzdSFKGwBhhlzSS8/ejghi2usyHe6yIk=;
 b=dmGSghZblw/OmynoUti6PPa7I91jokCCvjHGS3Pk8+H0uIyUUC5l4o0HXD1sFH9wHl
 AoA6dgS1tArscyo15e4XoHQOTAiD9ZQps5G3qCVXeuMX4RGzLiqwIKV+Hdo2uYlN/U2l
 XAgC1OGq9K4Z750d5B0Z4stw7toQHdSZO7Wch1cxj9Ve0dKgqMgq+0EZKxHq40wRuvOv
 aOwNVMJ5tmnFKaGRxyHJkL9rZpIlQloaZ5AKnyvHrPrRpZKNlHomO/0SR9OI9Ox3wDOt
 ZF7/tSEB6jdrIHHVOE6XTQC9jXYZ+fuuzyB0//m1AnTvUKJ0Hs7KLGq45uSifeCtsJQq
 vcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263622; x=1715868422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7sDaxG0HvtHzdSFKGwBhhlzSS8/ejghi2usyHe6yIk=;
 b=ZtTBw3lTl7l57ZiL/T2lv4rERS7Qh70Hx+m9G3npH8amSvp3lwuiuxOUjnfR0SRTka
 cuVpXSc4aaGixPOpqCEHQKlBwFXJZTOHexe24+yxayX9fetJ9z+3yQQh39X2DEFskbnG
 p2Ha7P5pOggpIHnOSU+Zvwr0mAvmF65WwIs0Bk5z1DQ03IgS2j0nC8sYAPIylhOUlwZn
 /oO0K2iS3a6ZjKlTvzKzWX9hk5N4TV8zmr1xr2NlYUiUjrFuS6wxJnbP7ZVMXE+sF4lD
 60aMGig7y4VHNg67IhVAqlhJyoZ6VdbJ+O9lAhqVlfzPKUgfyO5LLkm6+/0VWAxUTCE9
 5q3w==
X-Gm-Message-State: AOJu0YzHTAJxLJib44tIH8nhQnmOLg1yXVssOa8YnJLchpCVwKaVUsBg
 NkIRj+8shxxhzIiOOZxoXM43qG1hvfSRuy7YdvX03tfSPU21skM=
X-Google-Smtp-Source: AGHT+IFljPNeI2NnGG45C+k3hGACkIN7MrrcjptnJgVqnmjgLGPcaqegGP1B5NCUyh20R+F22xanOQ==
X-Received: by 2002:a05:6000:120d:b0:34d:8fac:9540 with SMTP id
 ffacd0b85a97d-34fca80df25mr5625135f8f.59.1715263621985; 
 Thu, 09 May 2024 07:07:01 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:07:01 -0700 (PDT)
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
Subject: [PATCH v3 4/7] clk: rockchip: rk3128: Add hclk_vio_h2p to critical
 clocks
Date: Thu,  9 May 2024 16:06:50 +0200
Message-ID: <20240509140653.168591-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
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
changes since v1:
 - dropped patch
 
changes since v2:
 -re-added patch

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

