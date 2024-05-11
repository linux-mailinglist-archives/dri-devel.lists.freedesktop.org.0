Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FD8C2EDC
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683110E051;
	Sat, 11 May 2024 02:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="K171WftJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A45410E051
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:38 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6f457853950so2535693b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393617; x=1715998417; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ro9Gj4s2KJidLF5j2cDQmmJU7+8x9Tzsgj7WCx41KcY=;
 b=K171WftJHVD1PbVQArF/RlTumsXNNdW4d4Wnz9kRBV958bJnTF0Lg09wp6K2Q2p8RT
 +unuEchXCWfhsbnF+QJE+AIL7NvZSgGvh1Zbtxl1kRd2KhVEb9CtmAGjwAIXmG/0tvg4
 KOQzQjc+xVw9BL14qTdU1SqkvdM1d0T6kXMpDxxkfecEK+uhwNBgstledvCNf4T9wh1P
 y1ymCYrvbEjG4T/qZ582nBpoWckBYF9Ksq75f0r7dVQ6yKOc2dXGkBURkqRvKNCD1BNM
 Pr1MKEO9sd6uJ2e4kuPoQw4ntT4xgA7ZpJJFee4jWV4q7lCTqHFWniWJiZWLvcGRIOLV
 izxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393617; x=1715998417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ro9Gj4s2KJidLF5j2cDQmmJU7+8x9Tzsgj7WCx41KcY=;
 b=Rt00Y6mVNcuMVLrbPT7Oxw3wDugfKP4OnX+jEsqEsbOMIAmBOSN5hvdytNCgN34Gjo
 wQdPvhAMr+s1jXlbrKNXi2lQM8BNkjMvcN2jaX5bIy+ObkiW4kzYvThVWgvx8yaQIjxK
 KDAh1wtWUUAS4/dQzK617j7d+qBMq2lET0+A1H0fDfiGzIJ5DzTq7BZ8EgH/54EQsJfo
 zQnp+WL1/V9b6jZyiOXUpEPqgFvT8kyJypEMfnZM0kjR5ZuG418X3B0x7kXrXQelag6A
 LOEbbhcnEFImCU/GBUZi4HX3H2ZiiW/n/tPphVD4joS6Ce244xpz2LwiAK6Yb6AFzuf3
 RW9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYt9TxCaVS/9E/QyKqTdFJPkMZq7ujrl6SMNzV+pLFKi9I2m+kf+yxOnEmsSYTSIAEX3hT7XG45luhRbQ+ThPua/tTfmsSdlKzTrbmeQCm
X-Gm-Message-State: AOJu0YxFnABN+lTMMwzm/G6qvMmE7AZ4SRg+EEmAQ0ag7AxzFI8MXuuZ
 n2CTXcsrD0rrGDHOzpUtQbFCWVHNVoeKNJr+lQqZX7f5rzVFnWYjlEzfuq4GDjY=
X-Google-Smtp-Source: AGHT+IH5UAoi6zEEiaiBde4SESiUMnjHXNGfQ6nAR1zwD1VkVFreQrCHTiNI4cjlIrD40CMt7gWQbg==
X-Received: by 2002:a05:6a21:c91:b0:1a7:590e:279e with SMTP id
 adf61e73a8af0-1afde07d798mr6686077637.5.1715393617402; 
 Fri, 10 May 2024 19:13:37 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:36 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v6 0/7] Break out as separate driver and add BOE nv110wum-l60
 IVO t109nw41 MIPI-DSI panel
Date: Sat, 11 May 2024 10:13:19 +0800
Message-Id: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Discussion with Doug and Linus in V1, we need a
separate driver to enable the hx83102 controller.

So this series this series mainly Break out as separate driver
for Starry-himax83102-j02 panels from boe tv101wum driver.

Then add BOE nv110wum-l60 and IVO t109nw41 in himax-hx83102 driver.

Add compatible for BOE nv110wum-l60 and IVO t109nw41
in dt-bindings

Note:this series depend Dous'series [1]
[1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromium.org/

Changes in v5:
- PATCH 1/7: Modify compatible format.
- PATCH 2/7: Modify hx83102_enable_extended_cmds function and adjust inital cmds indentation.update commit message.
- PATCH 3/7: No change.
- PATCH 4/7: No change.
- PATCH 5/7: Adjust inital cmds indentation and check accum_err before calling mdelay in init().
- PATCH 6/7: No change.
- PATCH 7/7: Adjust inital cmds indentation and check accum_err before calling mdelay in init().
- Link to v4:https://lore.kernel.org/all/20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com

Changes in v4:
- PATCH 1/7: Update commit message and add fallback compatible.
- PATCH 2/7: Add hx83102_enable_extended_cmds function, rename UNKNOWN CMDS and depend Dous'series [1].
- PATCH 3/7: No change.
- PATCH 4/7: No change.
- PATCH 5/7: Depend Dous'series [1].
- PATCH 6/7: No change.
- PATCH 7/7: Depend Dous'series [1].
- Link to v3:https://lore.kernel.org/all/20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/7: Update commit message.
- PATCH 2/7: Drop excess flags and function, inital cmds use lowercasehex.
- PATCH 4/7: Update commit message.
- PATCH 5/7: inital cmds use lowercasehex.
- PATCH 6/7: Update commit message.
- PATCH 7/7: inital cmds use lowercasehex..
- Link to v2: https://lore.kernel.org/all/20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/7: Delete Starry-himax83102-j02 from boe,tv101wum-nl6.yaml, add a new bindings file.
- PATCH 2/7: Break out as separate driver with Starry-himax83102-j02 panels.
- PATCH 3/7: Enable HIMAX_HX83102 panel.
- PATCH 4/7: Add compatible for BOE nv110wum-l60 in dt-bindings.
- PATCH 5/7: Support for BOE nv110wum-l60 MIPI-DSI panel.
- PATCH 6/7: Add compatible for IVO t109nw41 in dt-bindings..
- PATCH 7/7: Support for IVO t109nw41 MIPI-DSI panel.
- Link to v1: https://lore.kernel.org/all/20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com/

Cong Yang (7):
  dt-bindings: display: panel: Add himax hx83102 panel bindings
  drm/panel: himax-hx83102: Break out as separate driver
  arm64: defconfig: Enable HIMAX_HX83102 panel
  dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
  drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
  dt-bindings: display: panel: Add compatible for IVO t109nw41
  drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   2 -
 .../bindings/display/panel/himax,hx83102.yaml |  77 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 133 ----
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 738 ++++++++++++++++++
 7 files changed, 826 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c

-- 
2.25.1

