Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F36EBF36
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FE110E30B;
	Sun, 23 Apr 2023 12:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05210E30B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:12:53 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-32a7770f7d1so35585075ab.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251972; x=1684843972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kmlliGRkQt3zFcGLj9Go0Ae946lja32lat9O7DSGJ1s=;
 b=PiHgoOLlsJuL21nPDzQBkQ6wNUxHJHMrJke/SD3DX89cNmUnGulmMBm7Ck3QZEe1jJ
 M8vbckkkIgLAkDQWn0/WejBhDijURz64QDfTogbJuyXiD/9l529uws1blBSsUlGGNbJ4
 LBYVITbRU0ftIRRzDc+rt1GfQf4JOOMkNNZ/XutRjbEUnV9IQKRCcYDZBpMPIx18A2ac
 xjQlyaQCuSWDNRAkzMtFgKQ2iOx3TapVe7G+NySApBAPnrkpnaNfB3xBRDjIwcQoowmC
 F1YZmjVqbvvLjkHiiUbpISunwI2tkvVHKhhnK9g8iixJWGLTBAqpk3fjqd4H++ATMwPx
 twLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251972; x=1684843972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmlliGRkQt3zFcGLj9Go0Ae946lja32lat9O7DSGJ1s=;
 b=foOd9ZngmexSHPmzocRYyzyNhihAOgKfvZ12iFQrZqo2ybqQv9u5b+bsGHiPQZPe+t
 9Xt6Ved3GFEAJNnbi0p2kU/k0A7s9z9QCZaRZvY91KoXLMzqnWdZcK1IeXP6r6jZbRoa
 o/6fiZHaKrhNdnXdgRmldzBbyGIg0yAVqXsv2aHasqYQf3wWl0wuuVi9fIm3UEZy7Y8M
 iKidSHXnEiHE6p5/ma9GwU1AvqxVQYqh0btVQdtzKqJUq3g9IzjZshKy/ytoALSD7OBk
 L1IYgfooN5vTDNkZcOur4rwR8VQe5U4y/j3zG3PcttMonMNkmAsUIZ2trfHT0QWUvRNA
 CQJA==
X-Gm-Message-State: AAQBX9cGHXPcIrsGX3crgQDgkVH0n6YejY3phX7BZ3+LXtmAqr0iWYf8
 5doiw8Nj5oiCIOkAy+CNDf4k/mTxM9s=
X-Google-Smtp-Source: AKy350Z+/FqvbghweTImeWKxFlGIN4GJb1ciPYdiWsEAx/ozS9tZ1ED/le+s9cSTvXEmhFZc8xmy9g==
X-Received: by 2002:a05:6602:368a:b0:763:5548:c53a with SMTP id
 bf10-20020a056602368a00b007635548c53amr3498141iob.8.1682251972271; 
 Sun, 23 Apr 2023 05:12:52 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:12:51 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/6] drm: bridge: samsung-dsim: Support variable clocking
Date: Sun, 23 Apr 2023 07:12:26 -0500
Message-Id: <20230423121232.1345909-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 dario.binacchi@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes the blanking pack size and the PMS calculation.  It then
adds support to allows the DSIM to dynamically DPHY clocks, and support
non-burst mode while allowing the removal of the hard-coded clock values
for the PLL for imx8m mini/nano/plus, and it allows the removal of the
burst-clock device tree entry when burst-mode isn't supported by connected
devices like an HDMI brige.  In that event, the HS clock is set to the value
requested by the bridge chip.

This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should work
on i.MX8M Mini as well.


Adam Ford (5):
  drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
  drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
  drm: bridge: samsung-dsim: Dynamically configure DPHY timing
  drm: bridge: samsung-dsim: Support non-burst mode
  drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
    mode

Lucas Stach (1):
  drm: bridge: samsung-dsim: fix blanking packet size calculation

 drivers/gpu/drm/bridge/samsung-dsim.c | 150 ++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |   5 +
 2 files changed, 135 insertions(+), 20 deletions(-)

---
V2:  Instead of using my packet blanking calculation, this integrates
     on from Lucas Stach which gets modified later in the series to
     cache the value of the HS-clock instead of having to do the
     calucations again.
     
     Instead of completely eliminating the PLL clock frequency from
     the device tree, this makes it optional to avoid breaking some
     Samsung devices.  When the samsung,pll-clock-frequency is not 
     found, it reads the value of the clock named "sclk_mipi"
     This also maintains backwords compatibility with older device
     trees.
     
     This also changes the DPHY calcuation from a Look-up table, 
     a reverse engineered algorithm which uses
     phy_mipi_dphy_get_default_config to determine the standard
     nominal values and calculates the cycles necessary to update
     the DPHY timings accordingly.
     
-- 
2.39.2

