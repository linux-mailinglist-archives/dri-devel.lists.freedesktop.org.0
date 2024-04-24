Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440678AFE68
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAF10F4A3;
	Wed, 24 Apr 2024 02:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="KJgg+PTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9BE10EFC8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:30:22 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-36a06a409caso32754875ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925821; x=1714530621; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDuDS/PYysgnwfhzRTemDNx6xn19xsq6wPCRMweWSlU=;
 b=KJgg+PTrPALlGm072W9RG+qk+29gjH5kUNN+5WCEDCMR1DPy1q4GbvHbZx4odHe+1z
 Ee1SqhLo3stty7XSaYHGdZOZaTFQQiiB2kdzE5S+qKA8naEaj2QNvJjMi4dXYvWYnKpG
 tYKZiM9jsTk1GI1eWaBoHxM2XylX5G7Qr8KL1Vj3mpt2LdHKnZHMZ7Nb0mZ57fjiaUv/
 WZNHciVixAike+aev/oeyZJ8oIi6H8dt0zfV2wDJzCuNKS1UlsvHxoCpjpvjmV8JIn+n
 QP/Abz85qS6rt1jK7/OKNaH7KmMDc9sslHTsW+VW5rhbrnNhGphYXhyVYnUJM7/ljiX9
 KrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925821; x=1714530621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDuDS/PYysgnwfhzRTemDNx6xn19xsq6wPCRMweWSlU=;
 b=cSryGoPNA2FKLamOeTZaxWzqprqecN6Zd7f9Hw3a9ohMvq3q0Nk+AVOP/eHElEjHnh
 0Y6O0uU2kNstYLMw/r5kg9SBa7odf9VxiCAILrXOk5h1I38kYjLHMGL1aaGNcFU/rNF3
 /zBYk3WHeSf+UwKx3C102v6KFsJP6cr1Lzgg2wNv6CDyVhtbVP91ncz0/1VUx8BNu4me
 qQv5LR/G0WhrBfAPb06wN7bLVEjrOG0cRLJxsvShKSTkdVH8JlEt9wpretql6gItbTeV
 Z8js2CIufAYew2Veo7BWhSO1v2BdM+P7eFoe4iVRmpEDQc6z41mYYRxR+iYDmf2kO1zv
 w/Eg==
X-Gm-Message-State: AOJu0YyN+R13xYu5S3zMgb57u3CKqD4ySmQL0S3ilUuxLzY/UCg3YUyP
 5UzSJDOlxC2ivLjdAi+EM7JnDtYwWHOTcut2qO8y3LYOADarx7JphDw23GzJ7/4=
X-Google-Smtp-Source: AGHT+IFXTkr92CHcVMQccZURFuLiL9561gpJ8Hww/IBjkIZpKLRRVpOQs+UJOZ3+zGkoCoF2aLpmPA==
X-Received: by 2002:a05:6e02:188f:b0:36c:8d6:3641 with SMTP id
 o15-20020a056e02188f00b0036c08d63641mr1544845ilu.30.1713925821441; 
 Tue, 23 Apr 2024 19:30:21 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:20 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/7] Break out as separate driver and add BOE nv110wum-l60
 IVO t109nw41 MIPI-DSI panel
Date: Wed, 24 Apr 2024 10:30:03 +0800
Message-Id: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
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

Changes in v3:
- PATCH 1/7: Update commit message.
- PATCH 2/7: Drop excess flags and function, inital cmds use lowercasehex.
- PATCH 4/7: Update commit message.
- PATCH 5/7: inital cmds use lowercasehex.
- PATCH 6/7: Update commit message.
- PATCH 7/7: inital cmds use lowercasehex..
- Link to v1: https://lore.kernel.org/all/20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com/

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
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 889 ++++++++++++++++++
 7 files changed, 977 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c

-- 
2.25.1

