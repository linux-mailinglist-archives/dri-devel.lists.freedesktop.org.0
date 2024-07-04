Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF2927094
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4FA10E1D7;
	Thu,  4 Jul 2024 07:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="FtwDSswa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178A10E1D7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:30:11 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-706b539fcaeso1148720b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720078211; x=1720683011; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoZASCSjh5HMX+iYg6EyKw+Bujbjq1YrTEDuwpgZE9Q=;
 b=FtwDSswai14FApD4jvVWDHukza1eWtKDhjB5Er63W2+Ud5EPe9VM+E4xNBKYFKCb/z
 RgPEnJlmL2FqnTzCoImW9ShUeBUdiTghU+HJRZvDig96nQpSpTLQ0yTh4r9wqjWmqo0Q
 XLQfH69+4TIc3aFAKXCodoJZD5hk9g11zglL8bcvKOzUHmaH7/XOHOc0rADxoBs+Q1e5
 Q1r4b22SD5d0wjoiRo//fThEJ5jH/ViZ8PG8Il5z9CG6Ah6gIlqC8FfNor0nLYhbcqmR
 znALX56SLXrK8v3tcUQkTqaEpJOQx+WWqIyNoX7zz2471zqc4Lb1zCUHZfbcWUujcnkk
 76eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078211; x=1720683011;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoZASCSjh5HMX+iYg6EyKw+Bujbjq1YrTEDuwpgZE9Q=;
 b=TYpBgo+U46ydITgL+cC0Nz86juscH4xIiBGhm9FaXl5r+5Vw5smk/PAWXBSZkXxHFn
 hXO3aGdLU1DG8EhfmxH6ow+NrYg62GivUCWoBDrTbiovJkgivB3eHNgIiY5sza41X9/p
 vUcZxhcUOJlJkPL78omO1KvSR7BhQkEPAYJFbWqksJgxNegTyma0cRqRXkJkXGt6k34p
 0pc7eDdI8oOglqqGacjmQQOQdYjsfakRm8VhMqpF/ZuMCN5ehtplbp4l7rI9P8vL0T8r
 wQllT1eCPW/4pKyHCGDWphQfInet1oJ3/s+mhQxc4/GwEtUpiXXXozz/Esxn3vZ8tbf7
 ZY5w==
X-Gm-Message-State: AOJu0YzOHvPU0Gx6Nr45812Vf5aYB1tM9K3ok1UfMnKjNNxS1Qrw8TCu
 7iTo2AxtF7VvS6XzX2oEyEaie0tCKeWfeJeRdzLjBX8DX2hALTg2LrDAAjLCts4=
X-Google-Smtp-Source: AGHT+IF0CGZi0nRLYzMbd6CFtfqKawTIK20i6+6QYDX1nOMjNRk44Geb04TJIT85AHJuXHPHgbzLXA==
X-Received: by 2002:a05:6a20:5510:b0:1be:c3f8:aeda with SMTP id
 adf61e73a8af0-1c0cd1a53b8mr766246637.16.1720078209074; 
 Thu, 04 Jul 2024 00:30:09 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a8dbb2fsm7735699a12.31.2024.07.04.00.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 00:30:08 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/5] Support Starry er88577 MIPI-DSI panel
Date: Thu,  4 Jul 2024 15:29:53 +0800
Message-Id: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The Starry is a 10.1" WXGA TFT LCD panel. Because Starry-er88577 
and boe-th101mb31ig002 have very similar inti_code, after 
discussing with Dmitry Baryshkov, We will modify it based on the 
panel-boe-th101mb31ig002-28a.c driver instead of using a separate 
driver.

Changes between V5 and V4:
- PATCH 1/5: Add a new patch, make it compatible with more panels.
- PATCH 2/5: Add a new patch, change devm_gpiod_get() to devm_gpiod_get_optional() in the Probe() function.
- PATCH 3/5: Add a new patch, use wrapped MIPI DCS functions.
- PATCH 4/5: Add it to the "boe,th101mb31ig002-28a.yaml.
- PATCH 5/5: Compatible with starry-er88577 panel in panel-boe-th101mb31ig002-28a.c driver.
- Link to v4: https://lore.kernel.org/all/20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com/

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

Zhaoxiong Lv (5):
  drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.
  drm/panel: boe-th101mb31ig002: switch to devm_gpiod_get_optional() for
    reset_gpio
  drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS functions
  dt-bindings: display: panel: Add compatible for starry-er88577
  drm/panel: :boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI
    panel

 .../display/panel/boe,th101mb31ig002-28a.yaml |   2 +
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 298 +++++++++++++-----
 2 files changed, 215 insertions(+), 85 deletions(-)

-- 
2.17.1

