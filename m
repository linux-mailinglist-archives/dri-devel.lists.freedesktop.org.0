Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DC8C10DF
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293510EA97;
	Thu,  9 May 2024 14:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WzHO7Ivu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2F10EA6C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso625457f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263621; x=1715868421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAJ0ir3EvsiOixSkrLpbfd6IrLvM1qhtQ0lJENdLIss=;
 b=WzHO7Ivu5FYSBQuIctyaRE9qneBhhLKFUlfBmi1pBFli4EnLhzlwn7Ffxa/1GvJsf9
 ObboNmyfHqnWh7hmhmdvsbBZeFoIxOQ65X6lFy8ZbtFke01DSowJsHcUJv6wfjhoT/z9
 TfMtemGoD2tgA/fLW30LCRY/j+u1FhbE4gtrr7j9Anh3aCgB+rUBK3bnhc4Jl6Pm72TO
 PMgr7FdHMY4bf+93NOtPUilYiArN4+8u4DpR+zceqR5Fbnxx3po7Qz89P2VRCyvW4GNw
 LKaRZigAR/7IIjgSQgN0oQWn5HiQlYb6bNrXeVJBQ0bT7exEqg9Am+Twq+mDU/vTRzvx
 G0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263621; x=1715868421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAJ0ir3EvsiOixSkrLpbfd6IrLvM1qhtQ0lJENdLIss=;
 b=GQ05k81jfYXn4JmCbk0FqkspVQyVH3LHxEmifey0Tuttfil7SPVXqFxRssoGAdXmpC
 I8wt0Qchw4YkQn+AfbKektbTBAhbZxQSdXZEESUp2MFANrw422jY+Ca5oJs1uhTCSd22
 iFDQZkOpH2h3jZQ/I1rndbeifYMMuwDNzZblRfdep4EvFHe5NZE8XXtfAK64SQ7DQEef
 RnmXUCjQ6/jE6MoXg5VIsh835sLCuDVDRQquzq53k3GUNVaQpoLK5jBto95be9BibJq5
 ZIMNRJmeXsIfzHUalg5hR00wgGLjD6ES5jc3j/5HJ5HJmAFrtU8fGiM0rW+pM8vWnkT6
 1btg==
X-Gm-Message-State: AOJu0YzIyV6/mJ+KpJSv3vioJfJTzJceRaMrMcT4NmlUhXAilBiKjlSA
 uZ4124gf0lGnlqZBaFBUrRyIs75/M+gD/IRdeQRN3UhdVPO1VH8=
X-Google-Smtp-Source: AGHT+IGDm2zqiPzTsp+rCVEziHjhfj96YGRsnuCAnq5URS0U33f4RSu428fC/l+DFwekkggv2NMBOw==
X-Received: by 2002:adf:fa07:0:b0:34d:b4db:9927 with SMTP id
 ffacd0b85a97d-34fca6214femr4085933f8f.50.1715263620665; 
 Thu, 09 May 2024 07:07:00 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:06:59 -0700 (PDT)
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
Subject: [PATCH v3 3/7] clk: rockchip: rk3128: Export PCLK_MIPIPHY
Date: Thu,  9 May 2024 16:06:49 +0200
Message-ID: <20240509140653.168591-4-knaerzche@gmail.com>
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

Export the D-DHY's APB clock for usage in the DT. Also drop the
CLK_IGNORE_UNUSED-flag, as the clock will be enabled on demand.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes since v1:
 - reword commit message

 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 75071e0cd321..a20d1fd25e2a 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -526,7 +526,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(PCLK_ACODEC, "pclk_acodec", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 14, GFLAGS),
 	GATE(0, "pclk_ddrupctl", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 7, GFLAGS),
 	GATE(0, "pclk_grf", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 4, GFLAGS),
-	GATE(0, "pclk_mipiphy", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 0, GFLAGS),
+	GATE(PCLK_MIPIPHY, "pclk_mipiphy", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 0, GFLAGS),
 
 	GATE(0, "pclk_pmu", "pclk_pmu_pre", 0, RK2928_CLKGATE_CON(9), 2, GFLAGS),
 	GATE(0, "pclk_pmu_niu", "pclk_pmu_pre", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 3, GFLAGS),
-- 
2.43.2

