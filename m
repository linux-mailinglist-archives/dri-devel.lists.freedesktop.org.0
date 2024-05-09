Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8E8C0955
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 03:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785F10E22E;
	Thu,  9 May 2024 01:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="MLXTk7aZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FC210E22E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 01:53:09 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1edf506b216so2363015ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 18:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715219588; x=1715824388; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=MLXTk7aZven0TbA9851NKk4WvQWaJg5bqc/GKfFtZEtuZZr2pMkbD47jkw9xUsU6kM
 zMZddmC4k7VKjmYR1aJuzgJslhP7VXZkZmrgU7KDeUVduZfztsqPDLl04E9xhZH8SXSw
 4nF5N+tiZ7XCn6MIgMy3DY6+w2rM6GHPPG2yxAGbSQZ/rUW6hhtczUu3BQu9vR6jRPsX
 6RxyIoTqIWdqBVrj3Kx+8+A9aZJJClpP2Nn7/DuVz5xn/IBuKLyhr/VcplPoZSPjHTfg
 u6CCF9x+btHXxsduu2lyxBErIIOmdM6kpWYEQyP9RaqYIssbsCHHbAJWkjpsiUzOo6bd
 aJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715219588; x=1715824388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=Pb4L9/faj8WRpq9NAe1DzKI0VEfzrKUD0sy1/ntwPFRSMq7oY+gpjAq6L0YRN5HCOe
 npiCPQ7xpfBsVZPBozJ+Pff9pldlgoqSHy5EnFhjJ0vxS3WcSbdc5zi6jsKjWgT53MRP
 IlTZW23Mi0zVZB+5DBb4y2nnOEyMdNVnATkPET5efsR/TOpeAv1uT4TiHDKOibvjB+lU
 vkWCwFM5EIF1CWifcUMsOPbG21iuneSctdOCkIghA6VXYaXUeXqN4kFrASrR7r+ZL6oq
 69bfPDVF/KQ46DHIS6eJNZj+vHTmbIkAu/BfDa2Pag4TaCKl9QVaTSQ+Uau2LRbTkTz6
 YdKA==
X-Gm-Message-State: AOJu0YyG0+eJWzq3lCV2I/lsCKxdhWdH6DrSVM5MOs7nWgf3j5xQaQIn
 f0wZ3hHk2rdz0NR2RDrE5m9Y+BFOBleM6pJ2LD3S3fZMGjJhgdn+jXGe1uvISFY=
X-Google-Smtp-Source: AGHT+IFuZ1ciQmQfC4rMtuiuLyVXsr/sSBUXfOirzhQb9N/x2TesGhuSmdYudAFRFjbHiyWukwABIg==
X-Received: by 2002:a17:903:11d1:b0:1e2:9aa7:fd21 with SMTP id
 d9443c01a7336-1eeb0998c52mr48491225ad.54.1715219588654; 
 Wed, 08 May 2024 18:53:08 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d15dfsm2117465ad.62.2024.05.08.18.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 18:53:08 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v5 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Thu,  9 May 2024 09:52:03 +0800
Message-Id: <20240509015207.3271370-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
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

