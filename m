Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3ED405E47
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1056E91E;
	Thu,  9 Sep 2021 21:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E986E91B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:34 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id 5so802583plo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0YD6/w741DLBo+8epZ84w+Nzh2RSrsyIyRP4DXTlfI=;
 b=KLqQo69jsDgiLLzLxVcFmLS+QUjTP9TCMprej1GSz83J1W8zrp7qShkr6DMt5Mrmq0
 J5UKuJouUKRPtg9f+5wwnrMc8fI9N5+BXJpiubtdZN+gjYEU9rFjNw26KWZ9E0tga57Y
 mI3wNQmqjb5yUMVGAgpuUyb86FnIkRRhpoMIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0YD6/w741DLBo+8epZ84w+Nzh2RSrsyIyRP4DXTlfI=;
 b=LargJj8vfp7EtURHsM4FvUaXJN8vtHS5JhucBLVOQfATNPLhY4UXc5404mvNpDen3j
 p5P1b2HiD8+z2Mb40Lm9J29qR4GJgJWPViNj1vIkSFlVjmSZ/o0/QcIqse5JwxKxlfYC
 82P+ulfCYJ9PYF+q2U2avyqtMMG3FZcfs10pCfycmOAWG5jURNEviEyu3+AOhDp6c8op
 gMdvsGkGEr4xOHoFg7JIzj0KywTF57FU3iskbaASacOi8tKKYoAzIXtpHQ6fQ5qQkuOI
 uHVul3toiEuDSmJWg5kzfSWQ3s9vwW3bmSc/Vc2RCVrKkd2kZer6WLxZYBbgbg7ZssfG
 ki+Q==
X-Gm-Message-State: AOAM533UrzmI3ZM4ZbBBp8F1+JbOY78HFLT9O5p0m4Dx6GX7aOhvEzn5
 Lnua6npp4JZmJipFGUVvGGrUHw==
X-Google-Smtp-Source: ABdhPJzMGLCk8suYXbCVV/DXix14488+h1XgFszZairIgMIm+G7m5pc0V0dVvPrZYmw2hSbvBAp/Zg==
X-Received: by 2002:a17:903:31cd:b0:134:5b6f:2ff8 with SMTP id
 v13-20020a17090331cd00b001345b6f2ff8mr4413248ple.46.1631221293771; 
 Thu, 09 Sep 2021 14:01:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] arm64: defconfig: Everyone who had PANEL_SIMPLE now
 gets PANEL_EDP
Date: Thu,  9 Sep 2021 14:00:22 -0700
Message-Id: <20210909135838.v4.6.Ied5c4da3ea36f8c49343176eda342027b6f19586@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4:
- PANEL_SIMPLE_EDP => PANEL_EDP
- Reordered config patches to be before code patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..01b30f4a7e74 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -697,6 +697,7 @@ CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
-- 
2.33.0.309.g3052b89438-goog

