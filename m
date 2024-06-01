Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1528D6EF5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 10:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14E910E061;
	Sat,  1 Jun 2024 08:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="cBbBA6+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0F10E061
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 08:46:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-701b0b0be38so2638869b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1717231569; x=1717836369; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8W/njC8us0KW9wHmKF1n4OA9SOaALdpb4Qdax8q7WYs=;
 b=cBbBA6+k2/oE/KthdTtOCdwabxQjSktmVPhToYiUr5A4lxr5RnJePmpgUWIwqshW+x
 Tz137MoOhef29SokjT1IF263y2E73mP1UJSs+MXj56jPB1YQ2Tfm/Y/t25yg8T7ihaVN
 Ey6LnsqVak6fzUZ8bpYvxF5HSiik+h75lpb/ICBZoVhu+f17pt0JM5ZmWOEGEsDeEUIF
 iaP2M6YsZFCZAb14O6fYybTsdQL5q8bVyBOec7nC2r4yw77ZMdVG6d2sQdo5kmZSPiRs
 lguEVobhGxZ8Q+giGGfeF1jgN1XVaVGBvcRvS+FVw5dXJILF+SFsrC18FOIhebhEW3Cw
 uicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717231569; x=1717836369;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8W/njC8us0KW9wHmKF1n4OA9SOaALdpb4Qdax8q7WYs=;
 b=aQZrj/qRFvDEdXcnYMxnst7zoXjPal4StEZZUytYt7CIzxBmECKY4vEzzU12UPD0Gz
 sw+TaQGJJGa37hJiE/xvphYJL7qTQj1QbN9fhXkvBFV3/yf//KHdsU9IFjrsopcpOX4a
 H9/JiWxSZ3rqJUVG5g3MIcRHs8G8gtKUN9m+ly6a66Gq+i2BPcfJfZqOIXNlVWhCcLNQ
 r6JyN8YFp5hCWVcmvNPErMZ0tZySQcPp8zX/fyLpfF4pdLCRN6ADpzJ9DQNHIpR/KVCd
 FB6g+hhpE12Td238rhJ2zb+dgntsyg3XHpLtINWp/xp9npGL2pu4AexQzri/QCUnCwV0
 Cbnw==
X-Gm-Message-State: AOJu0YwpnH5CxYTudzOMEIkR1AOwuiCsx6+qKuWPA90z2DYb/GkJBhwM
 95PKNZ3ZngwbXswWkTRPB+M92cEC5TbJqfuoTptzQegrgAm05rUV+zgxwsQDj18=
X-Google-Smtp-Source: AGHT+IFmDV3Jqwu0YGOOnlIeAfrrik6DTGBn2D+eeZPZ5jFdR+A2cJFQgPvdZghdlvohqml57qK3bw==
X-Received: by 2002:a05:6a20:100e:b0:1b1:ed95:6191 with SMTP id
 adf61e73a8af0-1b26f3059d4mr3641718637.52.1717231568693; 
 Sat, 01 Jun 2024 01:46:08 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-702423c7b49sm2512044b3a.37.2024.06.01.01.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 01:46:08 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/4] Support Kingdisplay kd101ne3 and Starry er88577
 MIPI-DSI panel
Date: Sat,  1 Jun 2024 16:45:24 +0800
Message-Id: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Kingdisplay kd101ne3 and Starry er88577 both 10.1" WXGA TFT LCD panel,
And the two panels have the same timing, so add compatible for Kingdisplay 
kd101ne3 and Starry er88577 in dt-bindings and drivers.

Changes in v2:
- PATCH 1/4: Delete some unnecessary information.
- PATCH 2/4: Use the new mipi_dsi_dcs_write_seq_multi() function, deleted some unnecessary functions.
- PATCH 3/4: Add compatible for Starry-er88577.
- PATCH 4/4: Add starry panel configuration in panel-kingdisplay-kd101ne3 driver.
- Link to v1: https://lore.kernel.org/all/20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (4):
  dt-bindings: display: panel: Add KD101NE3-40TI support
  drm/panel: kd101ne3: add new panel driver
  dt-bindings: display: panel: Add compatible for Starry-er88577
  drm/panel: starry: add new panel driver

 .../panel/kingdisplay,kd101ne3-40ti.yaml      |  60 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-kingdisplay-kd101ne3.c    | 625 ++++++++++++++++++
 4 files changed, 695 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c

-- 
2.17.1

