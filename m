Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8C6CDA6D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8C910EABB;
	Wed, 29 Mar 2023 13:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D54610EAB9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:26 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so18511322pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2tcpLeWl99rVNnc/BvvLtZEsLOgUmupjkNUsxeTVcU=;
 b=UdCHrE7/F4LUh7hQ2PmcZsobbVhzz88QVAURCF04bdOUcixNytJMVbyBR/3Rw8N12x
 MVxl5we+vHJftN0y2JnudLK2tnLlZax9Sbw+5Oot89CpJUDrLdG8XFnbedNYOmo9FXDB
 oIduaHar12yN2QSMpZ8CpRYroeFZ6UkiA65Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2tcpLeWl99rVNnc/BvvLtZEsLOgUmupjkNUsxeTVcU=;
 b=4JqO3rnPvjJJCuZjc36h97b8vwug6XLj8l+Ke/scgekan5yDF4vHwS3OFHVVpsa6ab
 5XYqpCq3Dy5xiiSeWyfy5keadTKM09aglUcG6qi/sxrSSFhCHxbqeqCQuI49TmXq1wnN
 wFOQx4uXgeewZdSR8H0l3kOZ7AoS6f71G0gKHWehK4Fu2DAU4CTpvQNSQjMX8Rt0uRe/
 VTH3CmgXmuwYFLWxcDnfAWysz1F0lKfsqQZeeGH+hOe7TE6MZQlE06Xk8jOx9SSvhTy4
 /Q4b+0yLMgOCOgwUdY5F1DLVVDBFtK2qiX+bIFEEykHfcvw3Id69lPZjTtpAyEAsU7d4
 K4bg==
X-Gm-Message-State: AAQBX9e4247voF4kQFyyk+a5gpwSxRQMFNK7AWt29O3Tf2gNxnMsp5IK
 MDJMr3JBJoBqauJjzVZhz104Ig==
X-Google-Smtp-Source: AKy350aezuMjKTTjFyH6/gyzvMVWaT+9pmv5Ms2TGgIoeYwTtKj6D8+d21S+PexByXuy9cf7MOK6Yw==
X-Received: by 2002:a17:90b:4acf:b0:236:99c4:6096 with SMTP id
 mh15-20020a17090b4acf00b0023699c46096mr20503031pjb.35.1680095905750; 
 Wed, 29 Mar 2023 06:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:25 -0700 (PDT)
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
Subject: [PATCH v7 06/12] drm: panel: feixin-k101-im2ba02: Enable
 prepare_prev_first flag
Date: Wed, 29 Mar 2023 18:46:12 +0530
Message-Id: <20230329131615.1328366-7-jagan@amarulasolutions.com>
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag for feixin-k101-im2ba02
so-that the previous controller should be prepared first before the
prepare for the panel is called.
                   
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Cc: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 76572c922983..77c936496eef 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -466,6 +466,7 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-- 
2.25.1

