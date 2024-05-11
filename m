Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C38C2EE0
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F0F10E215;
	Sat, 11 May 2024 02:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="I4rU74Iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B110E5D4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:48 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-22e6b61d652so1433153fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393627; x=1715998427; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=I4rU74IwX8s3H/riDEnl6rFTB3oUQMepMdtoI1h0w5Wk555X5CjZJBzRg0XDw5cxpV
 E+YrJPh8HP+HlZjua4bJGMz0cTc6pGSe8NJDbut31BUq7ulb9H3n3o+ivelFL8qdNn0B
 0OC7MISOos4FvR/uBUB3bxSuRgiES0zPOoAxYOuSxnj22eQWnFHUBfwF+vJ7/mv6uiYa
 jzH3t/9hRbUYuswa1vX3mCWpGGzW0lXN1TCZtuq3ZcIUkTd4QrhboUmiWcDhDI2YyavW
 6opcJWok7IBrHTUgXtk8hrLL9qEz7q8i5BXF3raWwlpDkUjkl/p+AFZVQdHvYwPnu8lL
 GbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393627; x=1715998427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdgMcjk2SUhSnewSfUlS0/MTnaKK3tPj0hOvx8EtZQk=;
 b=gjJeaPkWVmnF2wQNPZU1tOPW5uRc/QdIPbWVOTNQRMFXJvUl2WfvUKO3zgFwZDlZPQ
 pEdBEspDz0jAVBolwtCJWkHg9z71b8xvCFkP3p67OIHJcTXslOItsKT055M/w8HG77b0
 cWl8r5UG48vpqeN1v3jqcfRSvrB5mLXJ96MUtncK8ulHnE1NJgFpJColLm9Nvq2czYub
 ZgqS9RPL/djfVHzoh2GRTpV0UWEZ9PALKA5qOUOPMbn/3YHgT3YnLlxePMWhJupNA2Wl
 jGfAlqEUCm/h8H0wDin0Saly2KlXrGOFZdmpORzeKEeOjJG+qmWZNBaAr7O4Ni3l8XWe
 skkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpggm3shU73xj4ZcAVR0rteLJwfG+tl3feiD52EZVcEx991SGrNhE/Ed4UPHntXoyH04LVjsbCF0TruFqJeUa4A4EGLbxY7UK8woaftW7c
X-Gm-Message-State: AOJu0YzyZ6oYCPm7xNwhERcOOHZ1hTU1jBDQeG5B+r2Ju0ywz5cpaY1n
 PYiy0b4ieudlx3bbjBEHFyooN71hWGbNcV+wU7g+QqL3dnYQbTffYqnRrzU9IDA=
X-Google-Smtp-Source: AGHT+IGt5ozTilihdFm6QnwK53QFlUL+BcLhjGe5iaw3ZZIAu3O12T/s5KX1KobrB7H34Ewr4Z5x3g==
X-Received: by 2002:a05:6870:fe84:b0:22e:cf91:7046 with SMTP id
 586e51a60fabf-24172e12675mr5393992fac.39.1715393627283; 
 Fri, 10 May 2024 19:13:47 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:46 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v6 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Sat, 11 May 2024 10:13:22 +0800
Message-Id: <20240511021326.288728-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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

