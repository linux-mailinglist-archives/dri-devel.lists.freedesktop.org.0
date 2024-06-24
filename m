Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81231914FBB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7D10E45D;
	Mon, 24 Jun 2024 14:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="WPry1qCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F3E10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:20:31 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so10489845ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719238831; x=1719843631; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwg4BQF2dSjJe6bI8pPiDT6kPYePsjlkVpxfKFjF+5g=;
 b=WPry1qCDhCJgtBUmT1rN5tgIB1nVQY6uVb918/Iz1syTCnrVN/giTCC0CABecLx7dW
 zqcV1mYeGa7QPrNjgrt4TAg04/Nvsd8HsXzXcLRNgG1UqRmJDre4lZWAI5V4jRnTkYL4
 7Y+BAF0IBGmutaC7Mv+foyWu5OxJV9l9XPW8M6Y9fRYoUrWLJMWfm8hSL1zejPf1KvOy
 V0ElGMTj+77iOscQ5fDwIhpxHY+qW4uqDDbakL9NQP8D31F1RSARBxorwM86WFJ51Pjx
 SH3xraX0E3KFeqGC9DhMiyJJ6mXjA3/EYKoBFTbg/zr4dlrSgGxcgECuwaZEzZNlRY+J
 v/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719238831; x=1719843631;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwg4BQF2dSjJe6bI8pPiDT6kPYePsjlkVpxfKFjF+5g=;
 b=GchiqtSlRFDmC8tUKooncmfJXFa6YU1wtQZk/4YDFMtOzkh50GjPcx8plGbRmUM/c2
 wpa2atAsviE/0f5zSRne1mCU4WiUMD/nrVTV/RBQmr0ry/V602DpiUfi2nAmmOBly1az
 n4XwkLhBZ+BmdxFSN8HNpu4mc9xusDRLdJ4PYtJULZLyaItO1E6fdGrcqqxQXCHZJg7Q
 Pxzqt0YPLqxIegWlCbqy35WaAzzjVvuhEGZVIj+KQe9pq2bKN9CtwZ4jVEHsEdVvj96B
 /tZ1ljEtm92pvs490DeJBmdgWhpt/P7nECtZi3tAqdOQfqt30UUHJJ7njl8nU2hpxbh1
 GhZA==
X-Gm-Message-State: AOJu0YwhCg/hRwWOjC9LEdAnfoMdAf4SswYbASSOfUFDftEyuzOT+Gey
 d+hDm1xBhb85yyK6NPjPuM4fxQO872vBroSEYzIq1JstwHg1g7YkIiIM/4Yz2fM=
X-Google-Smtp-Source: AGHT+IGYlIr+em1HKoMDj2T2Wg7YebKnOS+eaCeriqn/VjnyS7h0Ony6B1U/lGY6dS+giJ8U7cEDnw==
X-Received: by 2002:a17:902:ce82:b0:1f6:81f9:cf34 with SMTP id
 d9443c01a7336-1fa23ecccebmr55180605ad.34.1719238831057; 
 Mon, 24 Jun 2024 07:20:31 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d5fa9sm63243855ad.206.2024.06.24.07.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:20:30 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/5] Add kd101ne3-40ti configuration in driver jd9365da
Date: Mon, 24 Jun 2024 22:19:21 +0800
Message-Id: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Changes between V5 and V4:
- PATCH 1/5: No changes.
- PATCH 2/5: No changes.
- PATCH 3/5: New Patch, Switch jd9365da to use mipi_dsi_dcs_write_seq_multi() but no
-            functional changes.
- PATCH 4/5: Add a "_ms" suffix to the variables.
-            Use more "_multi" in the enable/disable function
-            Use mipi_dsi_dcs_write_seq_multi() in the init() function.
- PATCH 5/5: Use dev_err_probe().
- Link to v4: https://lore.kernel.org/all/20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- PATCH 1/4: Only move mipi_dsi_dcs_write_buffer from enable() function to prepare() function,
-            and no longer use mipi_dsi_dcs_write_seq_multi.
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

Zhaoxiong Lv (5):
  drm/panel: jd9365da: Modify the method of sending commands
  dt-bindings: display: panel: Add compatible for kingdisplay-kd101ne3
  drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
  drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel
  drm/panel: jd9365da: Add the function of adjusting orientation

 .../display/panel/jadard,jd9365da-h3.yaml     |    1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 1088 +++++++++++------
 2 files changed, 682 insertions(+), 407 deletions(-)

-- 
2.17.1

