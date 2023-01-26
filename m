Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB067D8A5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 23:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285E710E07C;
	Thu, 26 Jan 2023 22:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EF110E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 22:40:48 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d3so2639602qte.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E/whuDA41L1xd+asNNG2DrY4JLR8H5pt8fDqxVOjlkA=;
 b=hYb6luPMu/RIBO/nPxBsCYyoOm7mA3N3eVwLTjeLyF+aD2iEWnVZR7GKcU3Hspul5r
 V7Ju0WCGHxQTEldeZhuQkS8KZWXb6QYHDPnkMN08h+LwI6TSAt7poWbXyAjHlWXtw4kj
 ppG8DFruxkvlQ6MbMu0B3h7heLbarV4UPa4ogIYZpx8rDaYXMPE1viDclekdDmN5ydS9
 baTdGfdRbEdX/TtmgEtFE+HroAGPD3m5B+7PXsVObYOx8N/6KBFgtNlWLHjhc9dzOYJ8
 mk/m4aEyP0FPMH2MmEAHz2T46xJj2FgwjwX0VEuhlb45pq40gnDqeE7seaaNf+gBjTdi
 AXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/whuDA41L1xd+asNNG2DrY4JLR8H5pt8fDqxVOjlkA=;
 b=jYhocw36moroZEEBGyK9yVm2qakDkHKLBUUC5a42s4EOzg7MZVRqVS+5Ofd+5zxqxy
 Hpxic2Bc6CTcqgirBdRNvmHwP51ub8tnUBYrBkGGGDgs8LpjvQQ6CatIYht9rYrV+HUY
 9XPuqccjJVi7UeELzkRvEcdCdBjmti9ATOmN4UIJu3kb3BD6x6wwP5kKyScgBY+RMMd5
 wdTzsmtDyY1+0DMxvqsVF1jB3b+BQaGo9+oxUAH8NYQZEDYVt12q3ejTVcdRFTGJIAW0
 6e7t+aJ8/U7I4fTBGxt8t9f+oYYfgcPrIjwbQVEHt1fWRjMNnvQh6CbYlYPfFNq2J1F0
 sq8w==
X-Gm-Message-State: AO0yUKWL4Z+UWA4s15b27nNB9X3SXrcY9h+ME9KfRFYjDpA/jx4RE7Us
 v26WXpQtwdX4R5xxog6JjSghow==
X-Google-Smtp-Source: AK7set9LhKUBf8vCljxfEsfIRvuerq9Epym/AUDSZe/1wWpXbTcEhROMUPtiSp8zM0pStGwhx9pFCA==
X-Received: by 2002:ac8:7dc2:0:b0:3b8:1434:2a0f with SMTP id
 c2-20020ac87dc2000000b003b814342a0fmr5397072qte.13.1674772847339; 
 Thu, 26 Jan 2023 14:40:47 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 ek3-20020a05622a4fc300b003b68ea3d5c8sm1505678qtb.41.2023.01.26.14.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 14:40:46 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH v2 0/4] drm/bridge: tfp410: Add i2c support
Date: Thu, 26 Jan 2023 17:40:41 -0500
Message-Id: <20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkB02MC/22OQQ6CMBBFr0K6tmbaIkRX3sMQ0pZBJkIhbSUYw
 t0tuHX5fublzcoCesLAbtnKPM4UaHQJ5CljttPuiZyaxEyCVCDkhcd2ygXUJC1XRpZgwLQKgSX
 B6IDceO1stys9ufdSDzpE9PVP268mjy0tR/JRJe4oxNF/jg9msa9/Y7PgwItC502O6gqmvFtPk
 azuU+d1tuPAqm3bvm4KkCPRAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=JMty2kJ2wva/VHoMk6AFMIIVtUpwMF3osnmd+s87GsI=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0wFuA4bCH010zpGr3hM2glXIAgaMA0hVNq7VlRRO
 uAt6v72JAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9MBbgAKCRDc1/0uCzbrqpGPEA
 CpGITQA1mm++uT/+DaQkdSr8iZ4GW+Chn1EaY1srTZBj6Eg+XW/6UUoK4NxCVlf2zVmL4Gcd2Db2HV
 0OKeI+4LlyTuc5cKg6NQt0aLIl1iF9k97cCaC+0PbC5ZsqP922/NAS/5AUTfMfF2OrXSbWk8IlTvXZ
 rhgPEhz5gwAAzZVPe027T/R2bJDR5kpF5KonlRR5+eOZiNVu5DUmMA8vuFd4oto//x0xsRZoPQF+Gf
 mJzcKg2WhwoAqP5/iARoq8nbWugmfWTaRTsJy94rcq6NVNYOZtmJRmviTvvwU0g9cxOLggG0dAqbsQ
 wrTqHKeT3F8S7q0/+SuMODGUJbvI8YMqxN+W+sfGPPzRoqf+uxWmgkCvEZ2YGnfw6pRdY20UhTfcDP
 lofxpLuuWlnFMhoSadAoxVSbNht+FKkJ2SIoJmEmDbWe353E0ElLON4b0mx8CIAJEUX1O7mDpdebx3
 2SpgLp4LT3W9xGp8no9bkJP8+35dojyLLincZpWt97psDCZdb78N8H0ZqSID9g8hvDCh/AaUMKDYJ/
 DrLlb/ANgn071XhvHrCdjqw8o6eVywJK26xZkJInd3PkVL2I/Bg8thBPBj2mSBYAut0FGT382LMpuw
 5aIlICUApYNhgiXLZOHvJWcMMZKOmUfGiEM3EIM38/OQ8ifzV5zGUi3+LiZg==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TFP410 driver does not support I2C.  As such, the device remains in
Power Down if the I2C is enabled by the bootstrap pins.

Add basic support for the I2C interface, and provide support to take
the device out of power down when enabled.  Also read the bootstrap mode
pins via the CTL_1_MODE register when using the I2C bus.

Also allow polling device to support hdmi/dvi hotplug detection.

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
Changes in v2:
- Fix dt_binding_check errors
- Remove hdmi connector from binding example
- Fix compile warning. Unused variable and unsigned int instead of int for ret
- Fix commit titles
- Drop of_match_ptr change
- Link to v1: https://lore.kernel.org/r/20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com

---
Jonathan Cormier (1):
      dt-bindings: display: bridge: tfp410: Add tfp410 i2c example

Michael Williamson (3):
      drm/bridge: tfp410: Support basic I2C interface
      drm/bridge: tfp410: Fix logic to configured polled HPD
      drm/bridge: tfp410: If connected, use I2C for polled HPD status.

 .../bindings/display/bridge/ti,tfp410.yaml         |  30 ++++++
 drivers/gpu/drm/bridge/ti-tfp410.c                 | 107 +++++++++++++++------
 2 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: 93f875a8526a291005e7f38478079526c843cbec
change-id: 20230125-tfp410_i2c-3b270b0bf3e0

Best regards,
-- 
Jonathan Cormier <jcormier@criticallink.com>

