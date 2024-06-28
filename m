Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7091B5E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 07:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4524110E533;
	Fri, 28 Jun 2024 05:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mq8+ncqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DC210E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:10:59 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-700d3ffc28cso121705a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 22:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719551458; x=1720156258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZOviDQs/MBQD8ld1vhQDebgxIDzTBqHnA9k/ikra64=;
 b=mq8+ncqNm6sIII0P4eRWYGGbjOU+1WyRXJPR5l2PLRHCAvmojLtHo4Uq2ijceiZKou
 KIlELrjLJQtpwN2SGsk3LNqeSGBV4VRVQDS49gicV/qVsCqJ57Ir7Ev0QDe0qzdeG1YO
 5ZQodyPKqKta/c/mmqNgRkXiClfJ1v1c98yfKKyRKnA6IhzcmkNTnaVAQCfn3zdZT53W
 Wh80Z0gyOlZjc7c7tkAzVj2q5Gkf1vt3pDtQdnWY5u0+yRUA59ULc50ulusA2Y7Qmw/p
 sEofCAhUhSgNAeuLq3inA6f/J/ZylqSiZnfOQb8ocmzkm2YianvWJYzkqnw2yRl84G4Q
 RevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719551458; x=1720156258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZOviDQs/MBQD8ld1vhQDebgxIDzTBqHnA9k/ikra64=;
 b=i7r7QofXLNGZSyO7cQyYRn+sKaAostke0j0CatlfU18P6TnAvDr2w3Z3SkCqP4D3WP
 EjlRv//9Ivppocf8d3IQg0Rx/6w5m/TmNZtRZ16sNBVnoLXmWvyZ8eHTh7sr95GGmcIM
 WNrBUBUz0oEdpmEk27ILUwZLhIY5UW0PyAbiBZU0s+8kLCBBmSDcBcd6nvfVNJMg1Cd3
 Tsz3NGJq1fYl+DJ870YK+8aBzcNsYNBGZeGqrMwQbfG2CJ6M/NsHnqwlfGr6KLauQgJF
 9vqbbIYVvfOlKfx04IUvy+Jxy/ld+tLwSNv/w3gogIxoIS8b3MwmulRDtGHgDpkU/iE5
 qHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXynD7e3VH264l347DdVbIZgCjqC0kCNdy2bQC5phafCJdFcaXRBn3QB1MfQ4P8N6n0r80TrStWSq/oJKwoeM5OWeV4iRXWrSyH16mj8d10
X-Gm-Message-State: AOJu0YwvsI/40YGUf1qbhN4ZEdmnuqmT+v6Lp/PLfnbTLo+2hI3weHI6
 R7jYFaoftOcmFiQGsQ+a3UBJkGGdMY5nkIYgWItEtdKDM7UPF0+v
X-Google-Smtp-Source: AGHT+IEM3bDBrt30alpajKkos/IxGqPZ7xRkmoOjUEHyZ4phZitXVg3133+I0ub4CXr8Kt4EtjoiEQ==
X-Received: by 2002:a05:6871:588f:b0:254:b0b0:9335 with SMTP id
 586e51a60fabf-25d016e7c2cmr15937221fac.33.1719551458463; 
 Thu, 27 Jun 2024 22:10:58 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804893e4bsm624716b3a.184.2024.06.27.22.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:10:57 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] drm/panel: st7701: Add Anbernic RG28XX panel support
Date: Fri, 28 Jun 2024 14:10:14 +0900
Message-ID: <20240628051019.975172-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Add support for the display panel of the Anbernic RG28XX, a handheld
gaming device from Anbernic.

This panel is driven by a variant of the ST7701 driver IC internally,
and is connected via an RGB parallel interface for image transmission and
an SPI interface for configuration.

Since the current panel driver for the ST7701 variants only supports MIPI
DSI as the configuration interface, add support for SPI as well.

v2:
  - Update dt-bindings
  - Rename DSI_CMD* macros to ST7701_CMD*
  - Rename ST7701_DSI macro to ST7701_WRITE
  - Fix incorrect dev_err_probe() usage
  - Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
  - Remove st7701_remove() and st7701_spi_remove()
  - Call drm_panel_disable() and drm_panel_unprepare() on cleanup

Hironori KIKUCHI (3):
  dt-bindings: display: st7701: Add Anbernic RG28XX panel
  drm/panel: st7701: Add support for SPI for configuration
  drm/panel: st7701: Add Anbernic RG28XX panel support

 .../display/panel/sitronix,st7701.yaml        |   69 +-
 drivers/gpu/drm/panel/Kconfig                 |    2 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 1074 ++++++++++-------
 3 files changed, 732 insertions(+), 413 deletions(-)

-- 
2.45.2

