Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7A8BE4C2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90E10FB53;
	Tue,  7 May 2024 13:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Y44hiJMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED08210FAA2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:53:07 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5b20c4eda82so1176885eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715089987; x=1715694787; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=Y44hiJMVvft+LZAtah9nJexHCctzYQg412OlxwMXqLyxfQ8VsYmG6pQXsgwcvJkqDx
 cBJ/0lMZTPhKwkE+iZ0krNhO3cAJk+XQjZPTwaj5lfjseiqeIbbX3eEJxuNIBnHuZ46V
 BxWFNUJqYigdr42pO0ZsZCgyurLqtkIHId9MBYAOJaHWke+NpLOTSpZJ2Jl2+/ozR03j
 TCJtjHVSug1w6GjXMSjVwytiWuXsah62G4O7hc1UgRHOfFJ1fnPS3qkkM4cppKvULuvU
 +EURGGdU0PYxAUPrG4wSCNSjrXa3YrZ4f77ywAxcQjByHYqLLWhWQBl47DcDZ794Ma71
 BgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089987; x=1715694787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=WUx4YBXs44wB3V4uzFSi5PGxr1t9vXhwBYsguUE18G2OIlCoZ755xdz1aARdiN7YGI
 wrC1Z1ZzsCYypjoU7Ore6n4FJ1q9ny+yUZUJUZN3UEetsXKR13eGwYVDyKs4xV7zBWiM
 dXKgKmnsxqUyCTyZUScQKpkEmOQAhBVcmZW1dvwXt3QSbPGxguv41NVDyAv4sUmKL1Lx
 bfjmGUeHLX46q5b7eUZZIdjomNbgUlvHtv9PIE5Lm0H+lwRmXaY9uMp7KYWWO9PbwvRs
 ib82qlhPvluxBNE+658W3fCC5PFDS2ytGQZplroLnuElW2hTWk61q06pxabZwDTDGeSk
 WBrw==
X-Gm-Message-State: AOJu0YwR33kRv6eCNz6B/9wWeWoAQBs3wiDQMLmGO1lMRi3QecH3vHJE
 1iMWeFA/LoAQf1gWII343idF+lrwcdqCZAAw3T64suuX9DUz1vksgYsqgxUJYzc=
X-Google-Smtp-Source: AGHT+IE9obv3BpQSyoBColioAcwozW3A062gFLNakZyDyk37X93rIIhLS1HS1uSg/WopCyDk2ODppQ==
X-Received: by 2002:a05:6358:2616:b0:192:4bf2:a397 with SMTP id
 l22-20020a056358261600b001924bf2a397mr3260074rwc.17.1715089987051; 
 Tue, 07 May 2024 06:53:07 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a63e007000000b005dc8702f0a9sm9850542pgh.1.2024.05.07.06.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:53:06 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v4 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Tue,  7 May 2024 21:52:30 +0800
Message-Id: <20240507135234.1356855-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
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

