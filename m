Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C48AC846
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3477910F4E6;
	Mon, 22 Apr 2024 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="pBIG7Djn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C923112901
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:36 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6ece8991654so3925086b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776615; x=1714381415; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnqPgkVLzV+3jDYl1oUryZqqEdno7AXyD0XeGcrBAnA=;
 b=pBIG7Djn9GTHOzdD24AjE6bN/ZYawPuKLUzH64ggcTG6Dbs0KFPPG1AHKk9KscJdIP
 H/lCbgSATR7Ty6gh27/wnRGSt95gdf3f9dYXB/CLhqPzqgZds7Xmr9TPQuOS8uxcgrUx
 MSPJKWBwzr11vFl7HDi1O7S+baHBo2tsVZ43eoYu2Ppd5Yrh3NjUyc60dvy3hqfJuVr2
 bfjF0Y2rW6dDGlJskv1iMRoQ5aA7ZWjBx8xvhCOco7rIvNKd3BWwiEkkpVGUYdSi/5pS
 MSbPqxJ50I3k7fO2BvOR2ejzxwQcUJz14iodvoe3ZIk8LDv078AKfIpA//QMgynxnpvn
 vymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776615; x=1714381415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnqPgkVLzV+3jDYl1oUryZqqEdno7AXyD0XeGcrBAnA=;
 b=RlOaRNv4OHZugwzetylF4UOAnm6a6IXqEzdlJtuuVFEFbLqK89AV880rEcQvH0ileH
 LWlcvrUUK91fQ+n7J7zJpD3MySURCVUnDAfm4ntMKUpYWl+Bkn1ZSMzDRymKRzWr457g
 p3DxPlFfgjssSCgs8jVB3WtdwiG4jHRtldi627La7f5iV+T+ej4tje1q7I3tNxyMzsQS
 kZNfjgr4BPpIKFt+LRDpYpRCGi/1fCTJAo0afVLQ98pIaB/KHtN82yjxkOrdHXQoB1N2
 XLg7dMcq58FL5oZJwvL/RHgtRd5cMmSxIETM7LD/pyu8EfoxJsmnONaPLA4HcJPhxEnf
 LJEA==
X-Gm-Message-State: AOJu0YxYandslmSfKnAulhUo85eVoOgg55+/5VRlfkKsD57t3fvUNnE5
 EA6DbEN23D5Uc6nxfEWMcItz5iNE+GFuW7UND+o2WNl6bqLblMP1s7gT9aF1Flc=
X-Google-Smtp-Source: AGHT+IGOWzu8Sm8Boy+KiVHgZhpsdqCs/U5Pw74Tds0iYevluy6MAqtOWmu41LUeQ1x3ipKWvjB/ew==
X-Received: by 2002:a05:6a00:4f8e:b0:6f0:b81f:af61 with SMTP id
 ld14-20020a056a004f8e00b006f0b81faf61mr16298827pfb.5.1713776615456; 
 Mon, 22 Apr 2024 02:03:35 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:35 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
Date: Mon, 22 Apr 2024 17:03:06 +0800
Message-Id: <20240422090310.3311429-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
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

