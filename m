Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E97FF428
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3E010E71E;
	Thu, 30 Nov 2023 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9082D10E710
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:41 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6d7f3a4bbc6so616175a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359801; x=1701964601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yvbtfdc0ukYgjaMnQaR3gnU2LYirrG4L32lYa3jmGOs=;
 b=nebmK3RbML2hYy+4PxMkHLx/2A41BlmZxkFjsQUxpynQwhQDYP8rPKMxxWDEBBgbQu
 yKoSPOcyuXkL3bLf1nJelS7AOx6NHmZDV2QJKiHF33n/cFA+wM3ChxPB1tEw1DninrVk
 SeExmndQwEme0xgKQpqqzYTD1ySj8LiMVzDqJTWYgmea/bwNzkyobG19jY7rTpQ7ikuU
 3Mq9lNGpgTo7QLE61IeCPMnH4yyzdIVggT+wTSzrMi4b3HSQE0iNq7YjgLpcppz+/sKF
 akIqOuwmRB8iCVDFFcfQ6crdFcd9qMcDlYE8MuWN/jpM5s/rWuM3SQTfbgLAYE5r4orX
 fzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359801; x=1701964601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yvbtfdc0ukYgjaMnQaR3gnU2LYirrG4L32lYa3jmGOs=;
 b=d5LCo9mZbO7TB5sXp2Hlpl2si6yf599LkA6crQLA0nmiHuyQL4Kpr2T6+MoofgCBFl
 BwURbG14+lyIveCcS/w/Cau8nb0J7L/3O66VszUaxKUAUaF5PlBUvZGPRSrs4pz9H622
 QeNXQdMOSt5TcAck5W6Yqm8BaNt7g8luIfBv6DltwP+TSmCi93yQ9iQcz5kUEKdP+KVa
 umbr3tLS6IM8eiB/kOtkcFlBf8jQgLmjpL3o39/HM8O4OjLSZF35wSE23+tIRkRckZbE
 APzdsSOKhQ72dDP8H5dpSYT+li5s5jALSUCSeNZ+WF+tpRRjEdRlSk94p+FI4KOJVN2p
 s1qw==
X-Gm-Message-State: AOJu0YwuRfn0DVqqvH/ONZ+aLc9ItuczamGzs0nv8WQrlgf1+5bebY3g
 sJZOviwfZZVM6zEdQkmoRso=
X-Google-Smtp-Source: AGHT+IGsSEdgmXvkMLWehieUnhkz5DRkyYhpKW9XKjn9lAcA+W/k0ia8pgSLGSBCNZTbWh63UjUhNw==
X-Received: by 2002:a9d:66c6:0:b0:6d8:480f:7abf with SMTP id
 t6-20020a9d66c6000000b006d8480f7abfmr8615169otm.8.1701359800828; 
 Thu, 30 Nov 2023 07:56:40 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:40 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 7/9] clk: rockchip: Mark pclk_usb as critical on rk3568
Date: Thu, 30 Nov 2023 09:56:22 -0600
Message-Id: <20231130155624.405575-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
index a8457b17bc41..0e0b7b396682 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1596,6 +1596,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"pclk_php",
 	"hclk_usb",
 	"hclk_vo",
+	"pclk_usb",
 };
 
 static const char *const rk3568_pmucru_critical_clocks[] __initconst = {
-- 
2.34.1

