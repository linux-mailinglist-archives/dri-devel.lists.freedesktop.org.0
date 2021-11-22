Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43C458970
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAF989C21;
	Mon, 22 Nov 2021 06:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183789C21
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:21 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id u11so13255194plf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctsSbmqiK1AF7MRJPPTX1pj71cRw45KE0xoh/8Lm0n0=;
 b=nfEYGNBTjE0K099BCMKvgv7nmpauHB6B9JU9fpAc307rBs0eOxqzOg83mkPE2+dIqD
 TZwfFuIYdu2xQmXgkTZG00atqsMbYwSLYqyeEeu55hXcBruts8FIzpDxMb526pwOlyv4
 bCAZuaU9p5Bx28eeioZb5ldeTEcWErIA3dReo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctsSbmqiK1AF7MRJPPTX1pj71cRw45KE0xoh/8Lm0n0=;
 b=JzkWSuLFnAWBmSvi/BXsSiRdhT/WzOi0o9+wJtc4qg2FTJqcNaUJj3E4LZibaJFTkU
 ph00+Ixkd432jhAuX8lli0cL+z96P+Pg2V1G5Fd57jPwUj6nPBTCs3WNqfapieLx1GvP
 owSW9d3fWoRDq4w3+E4leahsWee1Sulz2LH5SDUR0Fz21XuVypBI8lpI1vAavZktOC/B
 okBYOdrLOae2fwJBSeJxGgVTRCDekCzHqCPUAloNY/GptiVo+Chmpl2spg/ZFd7vZmJP
 DKxKzf729C+79u0V4Tift1NhG6PsbX7lEFtI/Idpx4rXfQ89rJiuK7Cf9bTT8hrNOdSF
 zW8A==
X-Gm-Message-State: AOAM531KMpZfBKfv8xaR4m/uQFOGI/Y0o6VdYzVFNIw8zrLhX+62TRrJ
 mViLESg6HyBF7KdnSkbGlsUk+g==
X-Google-Smtp-Source: ABdhPJyL5zcYs+P9Q0J6Xr4KeCqEAeSCnqSDaIZ6X/Kvk9Wsb8C63ey9AFlVMSugLkEnOfbe2RbGHA==
X-Received: by 2002:a17:90a:b107:: with SMTP id
 z7mr27726222pjq.104.1637564001151; 
 Sun, 21 Nov 2021 22:53:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v5 0/7] drm: sun4i: dsi: Convert drm bridge
Date: Mon, 22 Nov 2021 12:22:16 +0530
Message-Id: <20211122065223.88059-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series convert Allwinner DSI controller to full functional 
drm bridge driver for supporting all variants of DSI devices.

Here, are the previous version changes[1].

Patch 1: Drop the DRM bind race while attaching bridges

Patch 2: Move component_add into sun6i_dsi_attach

Patch 3: Convert the encoder to bridge driver

Patch 4: Add mode_set API

Patch 5: Enable DSI Panel

Patch 6: Enable DSI Bridge

Patch 7: Enable DSI Bridge (I2C)

[1] https://www.spinics.net/lists/arm-kernel/msg883560.html

Any inputs?
Jagan.

Jagan Teki (7):
  drm: sun4i: dsi: Drop DRM bind race with bridge attach
  drm: sun4i: dsi: Add component only once DSI device attached
  drm: sun4i: dsi: Convert to bridge driver
  drm: sun4i: dsi: Add mode_set function
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable S070WV20-CT16 Panel
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable ICN6211 DSI Bridge
  [DO NOT MERGE] ARM: dts: sun8i: Enable DLPC3433 Bridge (I2C)

 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts |  63 ++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c       | 225 ++++++++++++-------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h       |   9 +-
 3 files changed, 218 insertions(+), 79 deletions(-)

-- 
2.25.1

