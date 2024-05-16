Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680A8C71E8
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848810E604;
	Thu, 16 May 2024 07:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="P7aUSx5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3917E10E604
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:21:07 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so6479481a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715844066; x=1716448866; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ToSw8/xXq6HjfzbRr5t4Tk0/fieWO/pkI64Nv2v4KY4=;
 b=P7aUSx5LQXprvvE/DtqCwHaPsUNodcc7rOugUO0l9B/gJctbx2OSgUGfppbtNDPvFu
 IKba68rxzaOtBSBuGj/fl3S/Gp0pzWNPXww802EuT4UTPqaVjshGrTszr1WSOXWnHCAn
 7HWc/igZx6RleeuyCpucuCbJg/lAUn0PS0I0SJqOG6QujdWPZqRxW6y3+1Gi+ISC2YIm
 gWSP/Z8c1UoP6Vnr7YNkt2jdlFw+B7cUKZDVHni0GD3ysgwvx6AeIkMr3+I72D12cO+g
 LJRaFJKg+ghVHIYpgb17cXrGmcBdSWBCzR3QcK1T7+LF0HDtZ/2qm+wc+IUXYpI3MfQ6
 oNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715844066; x=1716448866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ToSw8/xXq6HjfzbRr5t4Tk0/fieWO/pkI64Nv2v4KY4=;
 b=MXN8jKfvRegm9/qFWZJUC/NXgwSHVZyzi1n+GC1Y0Nqy89nFNnmgiOFZ6SFHJoAVR7
 jVYGijRa1hq8JTLdaqZwXMi1nwM2CTx9Ij4JI8WRZAnQbVpLhN0OsJhn2+HMycVaaKQs
 ajqYtRAokLzzo0UI3jznfpTqHjWzlHeTgrmmu/YZ5oRZDrrcLCPT2PMZdFy51oCmPjOs
 f0OwgmTjX6QJjDvK4OdiP+wsdXusemITZQCpMOJkmL7KfEJwMcUUXIA+3f2BuFMQYP1d
 /QQzYbPe/XKu/M3W3sboZK9jSMsVCj+ot/r3Gq9IkjmabrqNe3ZvnN8rzgSM9deLUx3Q
 i0NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32+gt0EFQfLHHWZS2tqwpvEsLWpMArrP+EnLy4rmYyWhORMZFzkOc0tMldu9hxOha5FIlETkVF/nkAH1AmCd4Wi4QamWX224dHxx4bIzR
X-Gm-Message-State: AOJu0YyGJ8wG/tciRyU6yaBwGEFegOBwN03+RS0x7eKh4RXk3hxZwgWZ
 euHhPPJyfMBlkJ2GJNM78rPfZDl/Jpdtr2TbGQsidhkf/ZcMldUK8vv9cKo79LM=
X-Google-Smtp-Source: AGHT+IEAnol0Q9MPVD5URxRpCHiFamJ1XGv9zEh1AAJQVhTl/mUtFn8KoAsDgmlwRJtZqBIRf9l4Jg==
X-Received: by 2002:a05:6a20:d48c:b0:1b0:1c8d:5bd3 with SMTP id
 adf61e73a8af0-1b01c8d607amr6382388637.59.1715844066568; 
 Thu, 16 May 2024 00:21:06 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a663a3sm12318724b3a.41.2024.05.16.00.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 00:21:06 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v8 0/6] Break out as separate driver and add BOE nv110wum-l60
 IVO t109nw41 MIPI-DSI panel
Date: Thu, 16 May 2024 15:20:33 +0800
Message-Id: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
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

Changes in v8:
- Neil think need sent separately to ARM SoC maintainer with "arm64: defconfig: Enable HIMAX_HX83102 panel patch ", so remove it.  
- PATCH 1/6: No change.
- PATCH 2/6: Fix Doug comment "return ret" change to "goto poweroff".
- PATCH 3/6: No change.
- PATCH 4/6: No change.
- PATCH 5/6: No change.
- PATCH 6/6: No change.
- Link to v7:https://lore.kernel.org/all/20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com/


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
Cong Yang (6):
  dt-bindings: display: panel: Add himax hx83102 panel bindings
  drm/panel: himax-hx83102: Break out as separate driver
  dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
  drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
  dt-bindings: display: panel: Add compatible for IVO t109nw41
  drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   2 -
 .../bindings/display/panel/himax,hx83102.yaml |  77 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 133 ----
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 738 ++++++++++++++++++
 6 files changed, 825 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c

-- 
2.25.1

