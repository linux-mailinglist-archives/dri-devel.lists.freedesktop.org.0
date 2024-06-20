Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CC90FE37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747F10E843;
	Thu, 20 Jun 2024 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="kJuhNtG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761110E843
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:05:20 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70627716174so558695b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718870720; x=1719475520; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNCgvVlOOifZF9apQvtNhD1L3e/9RH0OWo8h9OSyfUg=;
 b=kJuhNtG8sTvvT1LJGn1ZUURgLw5lVfXvGPfSmV8Sfdnrik/ucUMB3qpKDykNzMWoND
 //TXpghjIFXAcerwuDn4VhbvfYrc7J7r9I66altU/9c71lGKln/18DHhvMZwiQRD/G+Q
 zotBRPH6qvlyjwP8UXIdqAQUGJ4GUk9Yv6LzBcfcBxoG7Sv5I7950k0GrHDAqkr38Zl/
 g6hZKlHkcUP+MEdR9mYtMGQ3S+PVKSnky+Rx4HsJNBBm53swbCRVf/QSGNp+gIe01yhc
 PiWhBvdekMywvgr3L7rivXekmLk++1CWQa/hH0RZllEsx0vJyPZyP8RzvKt4E6ijyd4E
 yn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718870720; x=1719475520;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNCgvVlOOifZF9apQvtNhD1L3e/9RH0OWo8h9OSyfUg=;
 b=dbo2Qyr/HMJkdca/PTGIT7tDPuNyD/8LCjnrQqJGF57mX6mrkEJISJny9tt3WY1W8b
 nplG1eelYDZmfUu+mA/u9H35nn4GzgV2Q9USuWKliHnmKm5IApJW5+CuR4Ul2ZDLfMG1
 MgnsZkSO60fJ/F0f4+lijlppncCNgPTQGvaUSETi1e2LRpTj/8gEcopN61BSHE/R3Ufl
 4PszRtxlkG1NGovp8PlO3gQxyY015SbmeDgQIUqVq11U0GM873e/f2EaHHivjZdRG3LC
 0aaxmiY//wUIrgMwiWM7V6Rts5LID0LN+HeAnFKyDdaLqgBJ7xCiE7rwbNb06eYiJsho
 QMFw==
X-Gm-Message-State: AOJu0YwYjnhOyCWyMUBV+rkgHFMh2jnvPT9ti/CJGadIimT8++CJyrdi
 PKkYQTb7OIEka0MJGDkVnrdt5zGBqZ0pKwhXwCCnvcZlnTlZuO5g8OOsRGPnHpY=
X-Google-Smtp-Source: AGHT+IE+Z7VKBsNNqQi0ACz9IVzfEKfuILFymkOWQsu8QUPWCLCQZXQCJyw1PEROQqPaIVEZCFiY4Q==
X-Received: by 2002:a05:6a20:af81:b0:1bc:bade:e8c with SMTP id
 adf61e73a8af0-1bcbb6626b2mr4070049637.51.1718870720115; 
 Thu, 20 Jun 2024 01:05:20 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96c8c5sm11805889b3a.58.2024.06.20.01.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:05:19 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/4] Add kd101ne3-40ti configuration in driver jd9365da
Date: Thu, 20 Jun 2024 16:05:05 +0800
Message-Id: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In addition, since sending init_code in the enable() function takes a long 
time, it is moved to the prepare() function.

Changes between V4 and V3:
- PATCH 1/4: Only move mipi_dsi_dcs_write_buffer from enable() function to 
- 	     prepare() function, and no longer use mipi_dsi_dcs_write_seq_multi.
- PATCH 2/4: Move positions to keep the list sorted.
- PATCH 3/4: Use mipi_dsi_msleep.
-            Adjust the ".clock" assignment format.
-            Adjust "compatible" positions to keep the list sorted.
- PATCH 4/4: No changes.
- Link to v3: https://lore.kernel.org/all/20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
- PATCH 1/4: Modify the init_code sending method
- PATCH 2/4: Add binding for kingdisplay-kd101ne3 in jadard,jd9365da-h3.yaml
- PATCH 3/4: Add compatibility for kingdisplay-kd101ne3 in panel-jadard-jd9365da-h3.c driver,
-            and add some variables to control timing.
- PATCH 4/4: Add the function of adjusting orientation.
- Link to v2: https://lore.kernel.org/all/20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
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

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 317 +++++++++++++++++-
 2 files changed, 304 insertions(+), 14 deletions(-)

-- 
2.17.1

