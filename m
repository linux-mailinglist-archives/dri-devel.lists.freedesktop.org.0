Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848F91BEE0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFC110E222;
	Fri, 28 Jun 2024 12:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="r6o6Aksr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9B610E222
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:44:53 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f6fabe9da3so3479455ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719578693; x=1720183493; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ft63GgjralOgMe++xlYUJpktC9o9kPzkBcld+WAsA1g=;
 b=r6o6AksrO23md6PTzNVCkdtc1pFUPFnY/WvEGbC1CcwtI5SDGMvcLJ8eYC1xORmbY1
 GuIFTHzCcE8G7OZwieGkoH34KjYenyI95a0ZelMbkF8UD2tg3jHJTYtBGmr8N0gFLDq4
 ljbtOu4uCTa2wLJHuiabqPva6OKjTw9BSKHeypVbIow97615WvWQtr++mnFt+/oYl1rl
 z0mKz7rBLBfwZFyc2Pf+W2xQEywKv6DBVBrxJgOB9zlwwvtG+nAJWtYly/zJv/zN9APC
 M0ebaBVpWSdcJpMFvZDDTRbBstnpMONjfhcXRRmYPpBtlVzTCGjUQOdQi//kkbhUmtXD
 triA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719578693; x=1720183493;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ft63GgjralOgMe++xlYUJpktC9o9kPzkBcld+WAsA1g=;
 b=bFXfbBDZO1W0q+6c5RmlvULh26RNo5tcGBO4t8uM7V/73HEyupiY6J7cx6pDMfRzeb
 2NoUWmKkhVArGfKXJZp7ScY5S8KR+1YSSiMg8+gj+41bhlRJ/KY05cD3LiZmcIpP8Xsl
 VtrbQ+JSkNOmpMpS80H+8t1Em53fStBs4d/7FdmOSqnfzZXSYGc+evuEr/SSPWZT0Jbn
 hPVwm2MKot+WfuUVr2UQzxkD+PIOCdJX9mJs2LYodYbqSuBQSzIt3xsgX3dhBvwXyrGI
 lFTF0KFUOqGUclK1ZxBXjRms4Xq3BjxEjSUq0rl58dSD/U5A+lEgm2Hg/dMZYDlezizn
 EmIQ==
X-Gm-Message-State: AOJu0YwZsgN0qknKSly4uS3sa4ddL/lIe+dGrg7ktaQ3/7nfnrjYfBza
 FegnR8HJvw/XYc6x2bjk+D5M2QSIIwzzViRSsC9aI1Ffj/3boJ10GmB6Ybz6miw=
X-Google-Smtp-Source: AGHT+IGNId4+C8dYDixct0tmKy6AQ4GcMFTQnFAYcvYlU1iuODGUyQya+hJnG1DQIIT/aPu1xslN2g==
X-Received: by 2002:a17:902:f789:b0:1fa:acf0:72b7 with SMTP id
 d9443c01a7336-1faacf07565mr36744995ad.15.1719578693175; 
 Fri, 28 Jun 2024 05:44:53 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15695b4sm14346255ad.225.2024.06.28.05.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:44:52 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 0/5] Add kd101ne3-40ti configuration in driver jd9365da
Date: Fri, 28 Jun 2024 20:44:39 +0800
Message-Id: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Changes between V6 and V5:
- PATCH 1/5: No changes.
- PATCH 2/5: No changes.
- PATCH 3/5: Convert the hex from UPPERCASE to lowercase.
- PATCH 4/5: No changes.
- PATCH 5/5: No changes..
- Link to v5: https://lore.kernel.org/all/20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com/

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

