Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12B908DEE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868D10E089;
	Fri, 14 Jun 2024 14:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="svwZ3BrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7710E089
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 14:55:21 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-6c4f3e0e3d2so1777527a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718376921; x=1718981721; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKrtvuv9e+28adQDYfi4Q1PiGt6oFDueFE0cEpVrccw=;
 b=svwZ3BrYREGEr2tExnZV9H844cvgdQu8jKvXgs1Rl3vwooX23Lb86TeTABC2bTMOKI
 MX4zRNas6ztTrQVNt5sy572qhPHeTSgbzRv5HMz2g0w1AiwZAFcCsyJI521brD+T5cgO
 CdtMdbQfA5V3LQUY50efJC3UkWPrNrHtYsc44/8rMrTyHykDqExJqYG8RZMmVcZ6xzYv
 uAgK/LEwcKzQ4qf3Hdr27JRjwWVQXE08/R8zhXmB0uchkwy7zQ40IF00k4Os7yFVLoke
 OfSQ5iGd+DhYVzlT1SuvtQh2yF7Uc8bxK9NzeOkaPie8MpM6aR/CqRVjqmVTJ4O9SWfs
 Ao6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718376921; x=1718981721;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKrtvuv9e+28adQDYfi4Q1PiGt6oFDueFE0cEpVrccw=;
 b=BZgBCDhdr/m/U19BnNZ71339DA4Slyu9Ftg789Hg5mxHuN0yjImJUq9oThRIfQAtsR
 s2z43LyTS0B2nvLzNURRiw8oLUPAwa00nxRQBjMZvIQ890317x/ts4Q1qBO7tfnL/xIL
 6l6bscMO0cyDIiuVbaK8pBh/3Qqhn2SXgisc6hWuEYWOBMrTUbCvbxJAwTuH1u8HuMEz
 C2C8ofZQCUjnyMAHaCiyEnPd8EpOXofYcXx3wMn6medb24yhIrGKfAsexo+oZa36yxus
 C5dxx1X4BpnPF5aBAXxIIPaaX8xyLcrKVeYKA5EYhKLDLb6mGtV6ygAdB2nsz/pB34Aj
 fDfQ==
X-Gm-Message-State: AOJu0YybW1TL37V3pFUKy1P0AhhpeFgoPmJhEKDtEc/gi0F9NejeYDvI
 /dgpWEEciJfIrFe8Jn1BeB0lAnpVlD2Km7CfSbz/XcJF7fI9IJ1EiE2RetC5rVo=
X-Google-Smtp-Source: AGHT+IFQ8ZXvrcwtOwwSeet7NZay5/89+E/ZuDuorUcB7AyNnAMPyC8n3GvHLsC6maBmoHPyAQS7rg==
X-Received: by 2002:a17:902:ec91:b0:1f6:fbc2:526f with SMTP id
 d9443c01a7336-1f8627c7d21mr34144975ad.32.1718376920964; 
 Fri, 14 Jun 2024 07:55:20 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e739b7sm32914495ad.93.2024.06.14.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:55:20 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/4] Add kd101ne3-40ti configuration in driver jd9365da
Date: Fri, 14 Jun 2024 22:55:06 +0800
Message-Id: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This kingdisplay panel uses the jd9365da controller, so add it to 
panel-jadard-jd9365da-h3.c driver, but because the init_code and timing 
are different, some variables are added in struct jadard_panel_des to 
control it.

In addition, since sending init_code in the enable() function takes a long time, 
it is moved to the prepare() function.

Changes in v3:
- PATCH 1/4: Modify the init_code sending method
- PATCH 2/4: Add binding for kingdisplay-kd101ne3 in jadard,jd9365da-h3.yaml
- PATCH 3/4: Add compatibility for kingdisplay-kd101ne3 in panel-jadard-jd9365da-h3.c driver,
-            and add some variables to control timing.
- PATCH 4/4: Add the function of adjusting orientation.
- Link to v2: https://lore.kernel.org/all/20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/4: Delete some unnecessary information.
- PATCH 2/4: Use the new mipi_dsi_dcs_write_seq_multi() function, deleted some unnecessary functions.
- PATCH 3/4: Add compatible for Starry-er88577.
- PATCH 4/4: Add starry panel configuration in panel-kingdisplay-kd101ne3 driver.
- Link to v1: https://lore.kernel.org/all/20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (4):
  drm/panel: jd9365da: Modify the method of sending commands
  dt-bindings: display: panel: Add compatible for kingdisplay-kd101ne3
  drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel.
  drm/panel: jd9365da: Add the function of adjusting orientation

 .../display/panel/jadard,jd9365da-h3.yaml     |    1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 1081 +++++++++++------
 2 files changed, 693 insertions(+), 389 deletions(-)

-- 
2.17.1

