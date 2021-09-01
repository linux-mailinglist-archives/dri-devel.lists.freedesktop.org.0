Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0E3FE3B4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9E6E2D5;
	Wed,  1 Sep 2021 20:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6746E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:41 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id c17so705002pgc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWpQuuJjmOltxcGlhp80Go7kcj2rBByEKq5WUEPaCUU=;
 b=XK94ViAcm0nxkHX43OqtJrmDk10oapIw+sE89kl6IesikSt+5Jv6hCy+/YIjBhe8NU
 ldI/mEX6luWPDd3MUKfPNt2tHvoCnvN4ej7yZuvIxr6MxL+AloelI0Fl+k8Td78wfGiz
 AWlJWNJobDgFv+/YDryZq12xHWLaxOG1XqeCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWpQuuJjmOltxcGlhp80Go7kcj2rBByEKq5WUEPaCUU=;
 b=qErKb6UB9tuaLIryFUXdnJu90xf6KVD68Ln6PKdfoMIg43zEnfOJmXWC56Qax8wXgm
 649vZQj0s7mQD0XnqFkuURQEk5TPQB7yLb9OMVeWi7EbhZ3MFVM9NJwG8RF/8xLq7LCY
 gBt0asp3o6J5bDJ4dHKfFtakql3fLVp2fbP6y7TB/BGH3c+MkPzy4nEqhXwgcvaKhQVd
 1+8ekfCHKW1jSypcPcezn/hkw31qluzu1YsKbFiVTkN/UtOA0BT1Q6NeNbdIy5TzTHK5
 95vbsQBYkioPr165IzAnrAJGxLNXmAGDh0v8kI+ZTeoa+ehQ5J3Ag2bMNx71RWn0JTce
 4+Mw==
X-Gm-Message-State: AOAM530nQekt6hFoRG8qaTUND0DxnZTSQE9V0Sp48R8XLx/5L1MH4SY+
 +qurAmMIFkyXp2w7MV860pCCSA==
X-Google-Smtp-Source: ABdhPJzp2cmXbEsSbVWCOkZZKfiv31TzBP31B0LfIbPldpdBtF6YxlUM1F7d6HlVMOhOFD452XmjKw==
X-Received: by 2002:a63:ed03:: with SMTP id d3mr802704pgi.24.1630527641056;
 Wed, 01 Sep 2021 13:20:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/16] arm64: defconfig: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
Date: Wed,  1 Sep 2021 13:19:25 -0700
Message-Id: <20210901131531.v3.7.Ied5c4da3ea36f8c49343176eda342027b6f19586@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. Let's enable the
new config.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..914057efa160 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -697,6 +697,7 @@ CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_SIMPLE_EDP=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
-- 
2.33.0.259.gc128427fd7-goog

