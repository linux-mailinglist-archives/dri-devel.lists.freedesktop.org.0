Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093191036E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2496410E047;
	Thu, 20 Jun 2024 11:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wiMAT9ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F72B10E047
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:52:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7046211e455so552151b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718884378; x=1719489178; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxshfbiYtk1odTxX03f+kq7uhvGyIninyQ/wy7iz3xQ=;
 b=wiMAT9uiwu2zQmq6DVyD7Tb2gWBNs2pUiH0OCMv/jg53NHTM6wSdqYFrapYL+tt0Hu
 EcorsdgqWcEPII7KE88ta0DnUJIk1MbeLsWO+5hVyWkv0FOB6FhWl6YdZj6hkUZqNqCb
 /3Q+nKVNMqfxunU8lrs663l7U0cVQAGNTM6ir+sAYi3BcIeemJz8dk1YeGqke02GlEnK
 2A2OEUIBXrQl1mfIqYeQcV1xppd04xJ4Seoo/jN8N3YD8bcseGSh2tX2Y2RurBRecJfq
 2wYZTvDYVl4RsLGHEFxzxgZmUIK0/YnWxGUtjoHaa2/RAzivu3SOuAeHBkjIkG2qo/Ct
 OXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718884378; x=1719489178;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxshfbiYtk1odTxX03f+kq7uhvGyIninyQ/wy7iz3xQ=;
 b=ZNE8ewF5kozcinmOr3ZmPlMERnaZ0TiUaCyh9M0qL0sTeHR4WU16NGN2hFLgyZm8mR
 dKjGv70TGMPb6wDjUhysJLMl0DRXAco5yTRfuBLzl0x3MIhKNxsNtTV8Jn4dWnoTwrWc
 +rxGbpMprEyZtzAt6seQa/l9ePMCvu7yKDg6nXDC/HG2oplfhnY/HCNG16yMid4/5ySv
 D8qgdmlQFpM/ERfpMCPIltAd/7Ksd5Hem1vPdWO/PBlB/uvkogLbNDwphQ5nJv8QLxQU
 aYe1EDofiEHoYbsGkhYTziyfdjVaoXOdhnMQUbAFeSs/819Iz2RHmC2ID9GfFltfdvHV
 HrpQ==
X-Gm-Message-State: AOJu0YxmtCGSdMmb4OXtV5jbTB39RyFbsAlznKRU99l6Gg7W09zKczZi
 AqR9uEW8xpMMWpyq6CrzeYTLgT8ykepa1VToex+fnOpDVxW0zy8pPaDv37595cs=
X-Google-Smtp-Source: AGHT+IHWVuA9ptbleuNtiiQwSC0s7v5qEfJr+4Yzd7+QkHCwMzolv8Kc1rfPAEj837awwHSzsEBFXQ==
X-Received: by 2002:a05:6a20:1b18:b0:1b7:1ede:ce57 with SMTP id
 adf61e73a8af0-1bcbb626642mr4846670637.59.1718884377880; 
 Thu, 20 Jun 2024 04:52:57 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c7e64a1da9sm1486316a91.53.2024.06.20.04.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:52:57 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/2] Support Starry er88577 MIPI-DSI panel
Date: Thu, 20 Jun 2024 19:52:43 +0800
Message-Id: <20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Changes between V4 and V3:
- PATCH 1/2: Move positions to keep the list sorted.
- PATCH 2/2: Adjust the ".clock" assignment format.
- Link to v3: https://lore.kernel.org/all/20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- PATCH 1/2: This add the bindings to panel-simple-dsi.
- PATCH 2/2: Add a separate driver for Starry-er88577, and Use the new mipi_dsi_dcs_write_seq_multi() function.
- Link to v2: https://lore.kernel.org/all/20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
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

