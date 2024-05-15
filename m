Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63358C5EE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 03:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532410E2ED;
	Wed, 15 May 2024 01:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="12Bz9gts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAE710E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 01:47:04 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1eca195a7c8so51531785ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715737624; x=1716342424; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=12Bz9gtsmhKSKLC8ffAKdezYj426vIdSqoPQTFRV1pJbA4Zf5tK5lUH9Ep/CARewwZ
 DVn949CDmL7+Bzj5xdeEplwqtsRAnKKn9SXvH52iXxV+CysdVRmRG/9Vws3J58whUrst
 5TTsclE6CdHrtANUpGryYt7mYqHw+0ndIq5nI+4qySeyv0/uwVs+PvRWYQ5ypjuopeaP
 QkvHEx5jyD2tsXug0xdLZ/h1JqGDfSLoQpxhvh7g8zCj0H7a2b6Pv1IzJ/4ZGj77se01
 sJiYOdWomnibea3ICtTolp2t8NsX72+mpBND1lSF/V9LDH+LUvyNcZnhW6fOYynwxJJv
 qTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715737624; x=1716342424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=uLUYApwBQT9XPC1as1rUZasvO8yQnzXRJOHSL10pZjyxwADphFwv9ZyWjAZfUcBdzC
 oahvxT+yWnwHVyoi4eqxeT9oepa3IpWyQgxHpIgd/7JhXfijJvuu/1WTJWKOY+k6V72o
 MSjMcLabZf2bYvVgF0kzH4Aul0+InE4WRxyLof+mAmu4UO7hXAJp2M8GQvNH1NgPg7eV
 wxPM3jiijB7nuFHrCBRJe07xuu76phNuB1EWobDRp1QT8g9ge4Dk4qM9TLLp4jGV9uOP
 crHMuW0Iv08JRTe/SrJLOpL8pjIivhtR4wHtTVGQUbVu1AcQ+IWH+SBAA/81DnhgYDlZ
 djEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqLh3kXVL3baOXulnTaXsjyx3JT6gIpyr9wiw4Q+FHNHKNuMaAEpNEhJGzcQY+h3zOjwlTY5U1X34aIZVrwj0FI0kWtRAAk5lQ4DVDLWTZ
X-Gm-Message-State: AOJu0YwQTmbnmhImjOJxz8fCpoJzquvJpQAB8X+G1ulRnrh9Of72l1my
 qpZfFeQ3tI9L9TvAf7WMH1YnUGEsKpu25cxdPvw17uN5reTth/QDuQD16CPot48=
X-Google-Smtp-Source: AGHT+IF/Y5IjqSiHWK6hQBWVh1d+uba2aFO8m6/Dl7mHurcax/7WVutp1eMa6gbxtL9XATZHBr3qgg==
X-Received: by 2002:a17:902:e847:b0:1e0:f473:fd8b with SMTP id
 d9443c01a7336-1ef43c0f5f4mr180045495ad.9.1715737624203; 
 Tue, 14 May 2024 18:47:04 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c1368desm105582145ad.233.2024.05.14.18.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 18:47:03 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Wed, 15 May 2024 09:46:39 +0800
Message-Id: <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
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

DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WUM_NL6.
Since the arm64 defconfig had the BOE panel driver enabled, let's also
enable the himax driver.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..687c86ddaece 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
+CONFIG_DRM_PANEL_HIMAX_HX83102=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
-- 
2.25.1

