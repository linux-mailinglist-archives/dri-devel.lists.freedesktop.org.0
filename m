Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBC763EE7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80610E091;
	Wed, 26 Jul 2023 18:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF1310E053
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:49:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98e39784a85so290274766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397342; x=1691002142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPI2zan0vB60L24M8VngPtTHJpRLNCz44Rgi3kK/geg=;
 b=FDEvCueTvD5/2wdPIbWP/l6cfT8RoRQD+x+FwClNM6YqipoTAWhrMoM1khODOU3Ckp
 sT5oiLc0ocdWxQgAWf8XMxo0SkUpf617JRAR8pHYggcRxxiKOsG3yimzwDfJylVCpBmi
 7yNTY7qj4kkRIqFrA5PaCuUcWorZVXzcMjVry+NvUQXCmxhxnCS5WLj11Yon5KyeoLks
 9RmV9Gg9H53yyAH7YQORsLKBvm/u1YKIxxqu/RDWSJeNQ7RHyIvcRBx+biV6/xxIvf+w
 aN6C5CoBbPw64D/loWnS7YudOO2rO79LMKPKE4+p92mc9XrE8WTcSMzxozRKuEoyjQAD
 3Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397342; x=1691002142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gPI2zan0vB60L24M8VngPtTHJpRLNCz44Rgi3kK/geg=;
 b=CpZJ/sqZyC3KOl8kOqSEqLvsu27P+HOjNKsz+g9w1ukQOoiU6GQ+nvALTgnaUJr6eu
 /RH0hvyY5wAWnnGuv49Dqn0oGRBGTYf8gxvDNcyG4szo1pbZzevx3I6JUUO39GeY6Nla
 /o6EwrdKtdOT4+pD6j9VX5qr9a1DxEQc1uNU9noYdSIZqbw1ZD0dck6nzC2tmDVoUGmu
 jpaMD7vowfCqjAepKoqQbro72x+C5BEuh19EJR6qVqrUn7OEFgE33oqOLCGuPVfGzzRt
 XPp6lkIGMzhb9Euwpt+pHfzb1F6VMcvxD4J8/rJgwRnDHbv5BTm4zA9gOBNFeFpf7Gxj
 DAlw==
X-Gm-Message-State: ABy/qLZ9ahGXsv5inhnkK88jwAUinrXXryCmLTGrsiJhfnDAsqTV6lmG
 kt/xPSrmlWWkFkWZWbQzSGQ=
X-Google-Smtp-Source: APBJJlFEz7GEIeoCEWRMaD/WV7pBFz+cf93M9VkO7Zp/n5IIKT4wJtCBN+YSvNT2o8V06RojOJ+TGQ==
X-Received: by 2002:a17:906:76d2:b0:993:f611:7c97 with SMTP id
 q18-20020a17090676d200b00993f6117c97mr380393ejn.33.1690397342321; 
 Wed, 26 Jul 2023 11:49:02 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 cb14-20020a170906a44e00b00992eabc0ad8sm9875996ejb.42.2023.07.26.11.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:49:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] drm/panel: Relax porches for HannStar HSD101PWW2
Date: Wed, 26 Jul 2023 20:48:56 +0200
Message-ID: <20230726184857.2294570-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The porch maximum values for the HannStar HSD101PWW2 are unusually
small. Make them a bit larger to allow a more flexibility when
overriding the timings in device tree. Unfortunately the datasheet
doesn't list porch limits in detail, so this is a bit of guesswork.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4badda6570d5..4bab181e9d4b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2104,13 +2104,13 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 static const struct display_timing hannstar_hsd101pww2_timing = {
 	.pixelclock = { 64300000, 71100000, 82000000 },
 	.hactive = { 1280, 1280, 1280 },
-	.hfront_porch = { 1, 1, 10 },
-	.hback_porch = { 1, 1, 10 },
-	.hsync_len = { 58, 158, 661 },
+	.hfront_porch = { 1, 1, 64 },
+	.hback_porch = { 1, 1, 64 },
+	.hsync_len = { 58, 158, 553 },
 	.vactive = { 800, 800, 800 },
-	.vfront_porch = { 1, 1, 10 },
-	.vback_porch = { 1, 1, 10 },
-	.vsync_len = { 1, 21, 203 },
+	.vfront_porch = { 1, 1, 32 },
+	.vback_porch = { 1, 1, 32 },
+	.vsync_len = { 1, 21, 159 },
 	.flags = DISPLAY_FLAGS_DE_HIGH,
 };
 
-- 
2.41.0

