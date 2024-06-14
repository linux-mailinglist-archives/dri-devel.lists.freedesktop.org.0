Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD7908DFB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E928010E26F;
	Fri, 14 Jun 2024 14:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="KB+BBynH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FF810ED7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 14:56:24 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-6819d785528so1753028a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718376983; x=1718981783; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGygWhumk+tcqwp5GMYArhejKx0AliClordD1s0bXAA=;
 b=KB+BBynHxiZZZXqtGTB2O8QH+DqJ84k4SMy4EDZ/H8NQZWWzzuqjILjwqv7RMtfsI2
 vL0BArixX5db4EqeJDUpLe6bt5qCEX+osstmWCwzgJz3uD9dDPsRRVMl4ONH6HaIsTG4
 UfRgYMwZlOedRKRN9T6es1kPVeHMZdsaKsLyBeQLxM0O11GZccv67X+PCpJLbV8adWLI
 JxZula5yRxYH1bSfKS0wFI8NONUe5WU0mqfGFMeV0fdxj9eViRZsSfov7ZDLbrC7XUGO
 w/sZSXx7fqWVtRzGeuN+Z1ZpwKncthSIjSOnr6o2/E43HmXaM5NGfn5InooiXbH86Vdd
 pvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718376983; x=1718981783;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGygWhumk+tcqwp5GMYArhejKx0AliClordD1s0bXAA=;
 b=Z3LSIJj5nvrMr+MJEJeeeL2h8gqPuUGOR3fUOzBBwTSBsMK18Gjv7Xn6KnYAieglio
 p7tYLtcz57xY9kOVQHiii9MGLHzuDTnbc2075PftPewQTH9Rbv26tsSFFUmj7N8OuW1P
 Cf82pmH9uA7Vj3zegoqNLO03IfL8yUwqo0JGjiH/ZHgmYzoqnlC9wj7jBcvG33FvzM6q
 XNQSI0xtski0wrFP36XRT+261i29NhdwWdE6OdHXbwqJoTorpwaumTrFj/DqK5S7PEiQ
 c3vVHK752FYEcNrl1O8SeR8wAbzAWWw7/9mvFfPl5JHuDZGGKXtOLAub2u8HBmi/O/Uk
 7i5A==
X-Gm-Message-State: AOJu0YwFetlCVDUwrt4s7LOolje5t7nJ9YH57qKQ9CN4efBJN6JGxc8U
 EwWmp93DeycKGdGJkRrOc8WKhZLAMgOSKbU8cwrAw+VOnNwY9VAElC/BcRLedxM=
X-Google-Smtp-Source: AGHT+IFF8YyHtiWKRfgYbPogRWZMDRHsWrrRNIRMzbrYy6fGxcj5I4OrroNKrSwkZwkeuKPImyd0Sg==
X-Received: by 2002:a17:90a:1542:b0:2c0:f62:7b88 with SMTP id
 98e67ed59e1d1-2c4db44b9dfmr2912524a91.25.1718376983559; 
 Fri, 14 Jun 2024 07:56:23 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4c467c60fsm3985913a91.53.2024.06.14.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:56:23 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] Support Starry er88577 MIPI-DSI panel
Date: Fri, 14 Jun 2024 22:56:07 +0800
Message-Id: <20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

The Starry is a 10.1" WXGA TFT LCD panel with er88577 controller
Because Starry-er88577 and kingdisplay-kd101ne3 are not the same IC, 
separate Starry-er88577 from the panel-kingdisplay-kd101ne3 driver.

Changes in v3:
- PATCH 1/2: This add the bindings to panel-simple-dsi.
- PATCH 2/2: Add a separate driver for Starry-er88577, and Use the new mipi_dsi_dcs_write_seq_multi() function.
- Link to v2: https://lore.kernel.org/all/20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/4: Delete some unnecessary information.
- PATCH 2/4: Use the new mipi_dsi_dcs_write_seq_multi() function, deleted some unnecessary functions.
- PATCH 3/4: Add compatible for Starry-er88577.
- PATCH 4/4: Add starry panel configuration in panel-kingdisplay-kd101ne3 driver.
- Link to v1: https://lore.kernel.org/all/20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  dt-bindings: display: panel-simple-dsi: add Starry-er88577 DSI panel
    bindings
  drm/panel: starry-er88577: add new panel driver

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-starry-er88577.c  | 343 ++++++++++++++++++
 4 files changed, 355 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-starry-er88577.c

-- 
2.17.1

