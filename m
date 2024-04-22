Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AA8AC841
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6610E6BE;
	Mon, 22 Apr 2024 09:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="TQ7Rge5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED610E6BE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:20 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1e3ff14f249so30011855ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776600; x=1714381400; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zShzprvocFR15NkBJxriMaUREG3UA4nsglZt6D8YZXU=;
 b=TQ7Rge5zga6EH6/XBxJ7vRuR1QkAIdsu4O1ZNoxvdPz58yqm/OZOX7XIrt9R9J7uAG
 5xfIR/SE5f25RrOlhY9oj2ZuHY7rhYgVAQuKj1WHWo5vCWHX7rnc6zOn4L3V61qLdauD
 H0wxLIeiT2lfu/7ideCCcHseBAlxT63Pi9ppJ8mjJjQTy3O7CAx1yF/Sx0rhgtN66igX
 9ZD1iCy0iiq/TfxAhSptzQkQq3aAnYqFrnOBHii8HNfz5Mq7WrwH03OiQIO7umTs+jSu
 eeg3DDMb+sj3VKkreDZT89QXUlQRUfFTFzQUBTs7rHDapuoiLaJueiWm+aqju637UUdI
 EB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776600; x=1714381400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zShzprvocFR15NkBJxriMaUREG3UA4nsglZt6D8YZXU=;
 b=Wj+DjpVwTC9wrf1emvm5NRoSAgOOeB9bI50YZuVQrOi7haeKGO4cheVDErwS9Js4ya
 8cLm5/yhO53zSkxLuoRnvzYDOvXS6QOYARosD6cAvCMsaj+lzKOxjMc7Juzw5ybqprKW
 zSI4TGjXV+yxJsHRB6g+0jANMmDBdPKJ3Wk2I2Bti9MCLJlHsU69wg7dsTvJV9LWu1Zq
 UdbgpD/0pEJVBIuHvnZrbGctK9GcvlkKbcm25Ofp4vm5vxTml7+dUvSZ+6ngfpCbuCab
 mVRe5L8aKgvfOcIcxPI7XdYCbzGGl/LXS7OlRDSXK3Nd8W6gDPoR4dhATysTXZ/EtGUL
 NbfQ==
X-Gm-Message-State: AOJu0Yy+1uxYs3MMyKx2buw2+CeykHT4ZVqGUOIz4XInoKokONHcDSQb
 qXIaraVz0ahqtDgRlse7MGqoErrmORs9Kl5kGLVMbpeVTUKXEzNiTDnBtaZv+gA=
X-Google-Smtp-Source: AGHT+IGkZLhJ4wqK/T/b/O9cZ3in5wv/8f9RFCQdHdixQXCo29pNUd8HeX6R/LOTeGqCRZpxw9/djQ==
X-Received: by 2002:a17:903:234e:b0:1e5:e664:9c12 with SMTP id
 c14-20020a170903234e00b001e5e6649c12mr19449363plh.0.1713776600255; 
 Mon, 22 Apr 2024 02:03:20 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:19 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/7] Break out as separate driver and add BOE nv110wum-l60
 IVO t109nw41 MIPI-DSI panel
Date: Mon, 22 Apr 2024 17:03:03 +0800
Message-Id: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
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
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  99 --
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 943 ++++++++++++++++++
 7 files changed, 1031 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c

-- 
2.25.1

