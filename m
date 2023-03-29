Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F216CDA64
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE86510EAAE;
	Wed, 29 Mar 2023 13:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B3B10EAAE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:06 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id kc4so14855166plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cv6/4Vvh1vUo/moG1pbR53z8ML2U7R1WxCNXSlwjPc4=;
 b=dq2gflaXd3rWznoyd8LJ65hUjiMDXLDqp0a5RSfLfMrNFDFrbLmoQMU43Fdj4z/O58
 EDaIilmoyGxnNIuc9fNDvnyuCQiqB/pxw2QJFWV4UHFuG+va90m/gzt+D+JUulqQ3WbF
 sW46WI7QF9fIp0ljJytY4DuJU/0fhAqSLg+iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cv6/4Vvh1vUo/moG1pbR53z8ML2U7R1WxCNXSlwjPc4=;
 b=w4PliUTJaVUhOpkkI68JpgSqdLUrCVhZv4MzrfTv+rO3QLY0Z4kVH8YRE7lrKejKJV
 RPaInEANcCfgdnCMk+jPfOFz0AcCaU/e8VN9CSvbqWZ56grUrim0DYVnsY9xmvbJ9H0D
 T9Je/9Lf3aEoUTffBl/fzCopxHhwvWCqKCpFY0a+cEXq8Rb3s66GxfGRVepTHfsjJ/AO
 glGBS08Z3Hq1WXyTQpmzgYt/TZF/WFvnkKEoho4v7gyH5ahJuIB2UUuINZuQCeK527hM
 W+W55SdejBlQxzKjNT0VlVgY7bFAtAljx+Pt+Ac62mgt26BaPMqZDjGKqGjik2z7ZUMB
 dgcg==
X-Gm-Message-State: AAQBX9fuq+k1BfdJEgcdl0Q4Ig6anSaJ/pDjzkfRG6PaZJF3JGZ4zMeN
 recpO0WeMhQWe/oH2YC/fXt27w==
X-Google-Smtp-Source: AKy350YSAxdStQu5k6BQ8X+TusC/NXLcHiqOIQaUy4h6emrwaIZtDtwCxjujQZcpQ0YsrrHN0GERmw==
X-Received: by 2002:a17:90a:19d:b0:23f:ebf2:d3de with SMTP id
 29-20020a17090a019d00b0023febf2d3demr21536210pjc.27.1680095885930; 
 Wed, 29 Mar 2023 06:18:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:05 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 03/12] drm: panel: feiyang-fy07024di26a30d: Enable
 prepare_prev_first flag
Date: Wed, 29 Mar 2023 18:46:09 +0530
Message-Id: <20230329131615.1328366-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag for feiyang-fy07024di26a30d
so-that the previous controller should be prepared first before the
prepare for the panel is called.
       
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index df493da50afe..77d66dbe01fe 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -198,6 +198,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &feiyang_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
 	if (IS_ERR(ctx->dvdd))
-- 
2.25.1

