Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42DA8C5EDF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 03:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541210E021;
	Wed, 15 May 2024 01:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wEn/+x3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9419A10E021
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 01:46:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1ed012c1afbso49709815ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715737613; x=1716342413; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qatb2ki/gRFcDKjjv1lZSs1b2qoB9BBw3fm11JJ23aA=;
 b=wEn/+x3F2p//SbrTbhU7fkjs8e60qtSTuGW+YaRedHySQiIH/Zyu6dpcLM7OkPA0z5
 tfVbq1hORIi0YW1SSXp2x6sD+rp6DFpY+VBpTgKnbrofPwlZg3IlA7zG2F8BBWW53lLd
 07VfrmVsFWL+a0d5Y+MbADBy7sk+VK8Oq4xyXyIs/Ok5lTB7FxoP7HGC9iR6qxmxOE8W
 4FDjy8u8nbhndjPSIQRsJDeatwdxDQ33qkFb6MUQvCbMBTI5aICPf0vDkz/R5Y260dao
 BTa36wXRIhakjPEVp7CWQX6+lCK5ssQTIvrA5dS3TsbegM+oxrIOfypDoUovtZI+bANT
 yOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715737613; x=1716342413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qatb2ki/gRFcDKjjv1lZSs1b2qoB9BBw3fm11JJ23aA=;
 b=Pu2VKrNSgZ3VYUz/48Lke5TZ+AjKa/WEr+m47vcF/8PLPADjLi2LNMrs6iA8Kr/cXD
 oau+qMUrnbpi/dR26PmX4yQHmG+NQsuvr7LoIPsSJgEZJfuPQGofqTsP09m7ALdpXQdt
 9wkZhTpmS2F4DKPu/aEu3VJbdNi99BoDnX4H5xLAhmtW01z6UfoLLRa8SPARCnmByFXu
 hv+UKj7hBLEBhH5BdPiHfY4ny1i0EijH6B/5Ln9RT/u+hz727GLRi1rUOnWIqeqNz8Cd
 aTcB5xwNyA5t72L0p02ahopHj185U+rrat+xOwE/B5TKzVrEKbW2augx/i7jslR2MXRw
 d7tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhw2W95F8JLx29Ay2UFZZIFaaRlAju3ohzm43oXejqmgy/E/fIpmU8MkJKcZyE1/D6y+iWR7ZRXzPu4dgEJBYn/tYLH+dQQ5TtQCcGINV0
X-Gm-Message-State: AOJu0Yys2CoPH2Wvf0S9T2ybxgF4z3nT69UjgjzhSjmFgXe3TeRIvZnS
 cyKIZtfuGj/egwEOm3fehppXOx1go1eatRTAO2OVDfjBB9SNqJkeAaoO5WiCTBg=
X-Google-Smtp-Source: AGHT+IHuHlNOXteEjWxaNKLT8UAoUjFeJ097JUC3Dhx6T42V42lC/KHOF2FJ5cLfZ1t5lIKOny42GA==
X-Received: by 2002:a17:902:6f09:b0:1e2:bb09:6270 with SMTP id
 d9443c01a7336-1ef4329f94dmr170026115ad.28.1715737612801; 
 Tue, 14 May 2024 18:46:52 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c1368desm105582145ad.233.2024.05.14.18.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 18:46:52 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v7 0/7] Break out as separate driver and add BOE nv110wum-l60
 IVO t109nw41 MIPI-DSI panel
Date: Wed, 15 May 2024 09:46:36 +0800
Message-Id: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
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

Changes in v7:
- PATCH 1/7: No change.
- PATCH 2/7: Fix Doug comment "return ret" change to "goto poweroff".
- PATCH 3/7: No change.
- PATCH 4/7: No change.
- PATCH 5/7: Fine tune HFP/HBP/CLK to increase the frame rate to 60.01Hz.
- PATCH 6/7: No change.
- PATCH 7/7: Fine tune HFP/HBP/CLK to increase the frame rate to 60.01Hz.
- Link to v6:https://lore.kernel.org/all/20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v6:
- PATCH 1/7: No change.
- PATCH 2/7: Modify Move mipi_dsi_dcs_exit_sleep_mode and  mipi_dsi_dcs_set_display_on from enable() to prepare().
- PATCH 3/7: No change.
- PATCH 4/7: No change.
- PATCH 5/7: No change.
- PATCH 6/7: No change.
- PATCH 7/7: - Adjust inital cmds indentation and check accum_err before calling mdelay in init().
-Adjust somes inital cmds to Optimize gamma.
- Link to v5:https://lore.kernel.org/all/20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com/

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

