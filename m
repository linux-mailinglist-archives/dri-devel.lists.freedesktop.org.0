Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA87BFAEB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7756010E33D;
	Tue, 10 Oct 2023 12:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B9610E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:14:38 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c8a1541233so16474885ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696940078; x=1697544878; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHsWCEokA8wJ7YfM4FgwNRdXNr/eKs99se6DzVS9JbM=;
 b=J/ECZK+BKy0kf6uSzOp7I23Q0Kt9YavOrcQ73h0IN3YA+xYg2pIbJ7fd5gw3O/J1l5
 6JGXs7veaV/sUnQ7feCPbdzbOfkWz8+50vAOTm+gWRlAYrnF6uUHG5gCApy/E3MRR5sa
 g2/RL50ovF03WgOrjddzDjal6BbaNnxwkey+VGtcuwJeU3mxl4Yg8OWbYI/BLybaHm4i
 o/hfIk8Qn4xm6h4i6PU9rN8H+Lesg87KgxK7m8HMSXivOVcG5NRA9UYEtgbEjjxkhBgZ
 tjj/y5ZCn31zZt/fSWt6LBP7FNtISLuuExb15yLPm9diF2Os5jXH8QxwUXojoyUajSpe
 lI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696940078; x=1697544878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHsWCEokA8wJ7YfM4FgwNRdXNr/eKs99se6DzVS9JbM=;
 b=Z4gDfFBGB5B1+Iu56fuEXr20x6DXlFJxZFKpJYhQRHe7tTN8MX/6a6A0Z4aRo2XymP
 4SrCt5h8yRgjgU5Cq0biDfuz2KXqoZn2FJlg37kgKEa+hatJkOB9e/qzsirRUvP4uYzf
 EKnuhaeUgRb2XZaYwd6p49kTOZaSc0ltJVQCf0onXH9YccRYXycoHvYcN8zXYbYfx3lv
 Y8kcVqJMF6UEloMpcaCGzlnzH4LzrVuEOmUvwvs+tc75Gx5O24R7ceMqsna5v0kUz0wl
 qcBRlNyVPHjpCOO9XwEvZVjHbJPe2fthdPX/gF9/Pfa03Qz21DbBQuRix/s92X335BtZ
 uWcw==
X-Gm-Message-State: AOJu0YwyoI0mvwv3eKYlrg29KcHavKWJf2IUCU6xej6Wl3E9GxF/5xhL
 Q9wrOs5Sb/hLA696x0Wp0zySYQ==
X-Google-Smtp-Source: AGHT+IGck34GYNROcm31U5to2+Wt94M5AiPktgd6gIlhLZHc/gXlIAqLYTYkmuycAiDWCaIZ/D9Ewg==
X-Received: by 2002:a17:903:192:b0:1c8:9bc6:2a09 with SMTP id
 z18-20020a170903019200b001c89bc62a09mr6906643plg.15.1696940078421; 
 Tue, 10 Oct 2023 05:14:38 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170902ecc400b001c74df14e6esm11570486plh.51.2023.10.10.05.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 05:14:38 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v2 3/3] arm64: defconfig: Enable ILITEK_ILI9882T panel
Date: Tue, 10 Oct 2023 20:14:02 +0800
Message-Id: <20231010121402.3687948-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable ILITEK_ILI9882T panel.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0777bcae9104..c3453dcbad3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -813,6 +813,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
+CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
-- 
2.25.1

