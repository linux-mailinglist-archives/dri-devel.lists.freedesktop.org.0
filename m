Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C691F34466D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0E26E4A6;
	Mon, 22 Mar 2021 14:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2D46E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:02:15 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v8so6636257plz.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6erX6ToHXLRuZfuXfXRbYjKdzeAdL/fkelwcvkPciOs=;
 b=CpmkjiZEiTD1VuoxjCroqku+wWlTOrF5gVuSRuXjI3s7XifZGkvo+mkz0kM0Hw2QPk
 +cQ4w8GVvECsKG+JVNHIrA6ig0isWKdJgP624UityAsTaWaQShGarPTA0b3lcWj40igP
 R/PpJtThw32XvhUtfMrq7XfNZPyGiyKX/GT/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6erX6ToHXLRuZfuXfXRbYjKdzeAdL/fkelwcvkPciOs=;
 b=fmTeALoVtqnbjt27YI0ctnyIErixBhTVJDrJgNJSssYHR12gsQgLQdSQ0vO2kX1biy
 RdM1/s+FqBPTsRdmiDzKQuEGqLUiSx5I4uXxkb1N2VZyifWWQtr7R0iYTR3Mb7CuYhiH
 ZYnazQkfe2dPymF6zPdT483+7UGVT4b/VZ9boYRP6HVFr1TRPIQQ8Lu15EVaeBlJht2w
 g3inQf0WUtmTnwZOxY/7VUTR0b9datS1PCQrfqiQ1MkHDDCGGbaBa185+EYjqR7EFmZZ
 Bdpr+rVSXJBXetDDeSvgUzCYPEAY/xRpd7DU8FQgarLSu0CHxqaa+zV5Re7W/AQgnFeL
 M9KQ==
X-Gm-Message-State: AOAM533OjYWnAxXKKAMYbbr6GBV6DU5NB5soOyHZKoMpoPIuu0WhEKEc
 B49SHVGhWp773IECoLoyobIoIQ==
X-Google-Smtp-Source: ABdhPJxBV7Me2fZ6O6rz7h41k6pjvrEDk+k3i0598TfX3KSj/y+ettrlscSBCT9r/k0oD1MywbpxYw==
X-Received: by 2002:a17:90a:d907:: with SMTP id
 c7mr13221009pjv.45.1616421735136; 
 Mon, 22 Mar 2021 07:02:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:15c1:9a30:414f:d84b])
 by smtp.gmail.com with ESMTPSA id gg22sm14112997pjb.20.2021.03.22.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:02:14 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 0/4] drm: sun4i: dsi: Convert drm bridge
Date: Mon, 22 Mar 2021 19:31:48 +0530
Message-Id: <20210322140152.101709-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series convert Allwinner DSI controller to full functional 
drm bridge driver for supporting slave panel, bridges.

Here, are the previous version changes[1].

Patch 1: use drm_of_find_panel_or_bridge API

Patch 2: Adding DRM Bridge support

Patch 3: Convert to bridge driver, that indeed drop
	 encoder API's and support bridge API's

Patch 4: Overlay patch for bridge enablement in BPI-M2M

Note: Only nit on this series is kms hotplug, added Samuel Holland
for reviews and comments as he is authorized the code before.

[1] https://lkml.org/lkml/2021/2/14/173

Any inputs on this would be appreciated!
Jagan.

Jagan Teki (4):
  drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
  drm: sun4i: dsi: Add bridge support
  drm: sun4i: dsi: Convert to bridge driver
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable S070WV20-CT16 panel

 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts |  85 ++++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c       | 100 +++++++++++++------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h       |   8 +-
 3 files changed, 160 insertions(+), 33 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
