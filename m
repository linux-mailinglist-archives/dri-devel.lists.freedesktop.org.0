Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAD803DDD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9DE10E3C4;
	Mon,  4 Dec 2023 18:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBF810E3D5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6d81faeefc4so2682835a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716251; x=1702321051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jS34Td6ydiJu49ocw1zXulx/VuEOGYfI7vU1+EDroQA=;
 b=DW+lToWB+c1uzaXTAMyY2nt5oS438vWViSf+YYNUvqOKwcPA6Sb+Ek6zmArWutloFP
 7dmxvD2ACmcIRAjIh2DRzetnwrFN0UCDP616ECOAlODItMusaozvnKGbRtvVtaFlgm5a
 W9BRYidPE5/BVkxX1PMGkV5+tcqt+ixJtTbZPG2/GdJrqL/6EalTG53ylxExOK37k4U3
 maT0zQQ2gc9HHMnhSpC+hle+FGZF6UDbooyA03VSs9ialW67NbdYHiOXdMWiIUQfKkEv
 wB2swUcb/v7FI0NXCWmilr1Pq2jUNnmWogEctJlo9ApmUj3rEvalY0GpGrkjn1t17jgT
 5Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716251; x=1702321051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jS34Td6ydiJu49ocw1zXulx/VuEOGYfI7vU1+EDroQA=;
 b=vZ1q4yu2ZOCxFVrwucyA5WVYtDuv4jr7wQLmco7uMUHZqWURO75/xlLguRKLFq23WS
 RnEm1YM9JdaOODzK/BSET2gdRxIkk872DYDC3vSZA+KqRteaQna37NeaDLRIcZ1H02Qa
 ZnXdH1+T+A4m2oZeQzcsVF37UK164NazuQP1JHkfCK1L1m0Id7n4PWvnEXzka0u2m62p
 ah9HXAKU0EXOnrXHuZ+vRKHyRZoA2HPyQC5qTNGtMjc38ONQY2TMpkLcjYNCjg4q68DM
 PGa6W+bt4HZIuxVpt5q0D8CjiDw3zdyHpDFShHlc7Z2J4MmUFqOXd36dLP2jL8pOcj8h
 gsjQ==
X-Gm-Message-State: AOJu0YybNz7do6Gc0Om7g1nuBji8U/2GFcn4/RhZ5SqRMmbCIW6Rhzz2
 ASTcyIVpvOk/vUt8ZQ9mFyM=
X-Google-Smtp-Source: AGHT+IEUm8NisHgqn3y2rfnvd8YPgGCJGZWYz3Vvoe+MmLVG/2AgljpOpgZvYnOCvaNysMml8E1gGQ==
X-Received: by 2002:a05:6830:d7:b0:6d8:74e2:5d22 with SMTP id
 x23-20020a05683000d700b006d874e25d22mr4372548oto.75.1701716251596; 
 Mon, 04 Dec 2023 10:57:31 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:31 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
Date: Mon,  4 Dec 2023 12:57:16 -0600
Message-Id: <20231204185719.569021-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

In the reference manual under "2.8.6 NIU Clock gating reliance"
it is stated that pclk_usb_niu has a dependency on hclk_usb_niu.

While the manual does not state that this is a bi-directional
relationship it was noted that the sdmmc2 failed to operate for me in
mmc mode if the pclk_usb was not marked as critical. The parent clock
of the hclk_sdmmc2 is hclk_usb.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index bfbcbb744327..c4fa2375dbfb 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1595,6 +1595,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"pclk_php",
 	"hclk_usb",
 	"hclk_vo",
+	"pclk_usb",
 };
 
 static const char *const rk3568_pmucru_critical_clocks[] __initconst = {
-- 
2.34.1

