Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968028AFE6C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74210FD3F;
	Wed, 24 Apr 2024 02:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="tBbE/+Iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE26410FD3F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:30:39 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6ed3587b93bso1587040a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925839; x=1714530639; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=tBbE/+IwAfDFScJyxlNXZGaEAG1F28o7THQ825qZpde25n2Hz2JXboPf/uSenNz4+P
 RgNjoPaVF2LYOAz64jbF6eURtsFubYH2tCZo8IGLmpPWnnmLiJcZWhtzFnFEl2Xlnbxt
 7tnkleinW5O3PFHKSlZT3LuF9mRDz+f64nidLM715h/8/Otzhgz2DWtfGPOzCj26/Zv1
 GR6taXtkaSB5GVkcYiMDdPZeFTYLBbfamsMJVWzlkFbU12ajF6Q2G3ugb54b5Z8043xz
 RlXZF7Ok79qMlReQ0bvBx1cjb/q+BZoGtywwCWn8pF000osb9mqGfhmzfhLQHAh2qoZl
 xhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925839; x=1714530639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=gQL0dR/JXggnmr44woV89crHu7ZDha+3xZaEko147wkpKmlR/SH4MdW1Tpg3DMwtj4
 7AQo5DlC+/7X9gdjmFEB1hjh40DeHROpgqcVDInhQTDcyagSDn3EgKaVEVgQycM4GzZB
 82Z/Skk8WgfPP6RZ7FNoPo2zfqjePPIcqLOjMlMnvK/s+jWaUWhwKQzggcrSpmbak4NC
 OeWgL0Kk0PjPOq7+CmkkrRx/DH/blUDfCkKO+UcPDNy9F7Wcg/sohi3Bzymbm4xMewS0
 5Pme6SgJSlPtWnHVn/cVnvlaeIV3QLzrIeYtP7Gy9gPHS2Y9airpEev5v8V8106Hvtic
 VgIg==
X-Gm-Message-State: AOJu0YwSr6qIFlRVihcdp5cSr8evi3S8mwof4KzMC7lu11bP2ymApkK4
 5DRpGXS8IXETZXBZyUdj9dqW0NiFOasxug8nk84HRWfEn3m0R270Ce0PwVODu6k=
X-Google-Smtp-Source: AGHT+IF+H/psnQOqgjI5FBt3w3oeQ9GZc171xd/LPRweALS55ze4i2g8pxZNH9RrfxIpXP9njz3+nQ==
X-Received: by 2002:a9d:6d0e:0:b0:6ea:126a:bbd0 with SMTP id
 o14-20020a9d6d0e000000b006ea126abbd0mr1542792otp.14.1713925838979; 
 Tue, 23 Apr 2024 19:30:38 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:38 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Wed, 24 Apr 2024 10:30:06 +0800
Message-Id: <20240424023010.2099949-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
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

