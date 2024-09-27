Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1898818A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0716210E332;
	Fri, 27 Sep 2024 09:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="BDr0LO3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29110E332
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:43:54 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2d883286bd2so141533a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727430234; x=1728035034; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+EfgAcgWmuWiqbNHjJcsLkV7bQteBK+Xb+kdKI2dEA=;
 b=BDr0LO3FuM15pBRInWsupkHaOoTeUmIjexmdWhAZqF+sOvk8bMCcl2CDihD6OK+/Rp
 yYpFYKXlXCsCh4SUwQcpjCrh1lLwYt4jU0CGCw+K8SYBKMHWYgw0Xy0iMjPtugcudVTP
 6zquB6A83BLhE4unh6rZZxJF2l3hQpUg1w1Wp85q0e4bgHBA3TtnHVa6b/ND2gskryWT
 5MO16WL7LNvtO4yi9FCmVHKnQGVOaksVd+kP2VYlppy4LAwLA5KrD1cBwMN14o79vQ1M
 5eFrV0HwkV2y1CX9WKyNswzd0fd2DrJoVtCZGFXDQ0Ytvqp5CrydHEGlDSqjx4ANV5s9
 8HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727430234; x=1728035034;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+EfgAcgWmuWiqbNHjJcsLkV7bQteBK+Xb+kdKI2dEA=;
 b=f/JY8Xf7KfYaY8ETKnzcERnIl0hA7ifMBL4ohH6NK8mqRz5nXPeodl6OcVZdHuQikO
 y+y/C5+PDhB12WfgEGrx3InCnxAfTwoYdzMUN91ygitzteKKoFB87QiGPyBGuXoh3EdX
 M9zL7Yg83Zpdcog6rO7x6NDJqrJJlyegPeLcuOC07l9PAvLdkxrY0/R4nY1JmJQ5wWn/
 we3LaMIJg0pC+cRtzetY3v3rSmDAzUKuHKYRefEbJoGqE02T5VPiyG7PUXiIFDl41oKD
 zaBNHb5wmvq8PTkWEv3iQJz38OQTpzYw9Ln8neRo03+eMm4E9EQmvVrHXJ8YgroJQsR+
 y6RA==
X-Gm-Message-State: AOJu0YyfJdiTu/bc0s//9tPNi8+Xl3Lm0VotGyD/eCDHMCgIZTDle64G
 QDkhu33DRNBgDJ0jOh+6BEv98VJBlbhyWzQ4YRCgsq/V8GdQOAroZAsQOqjjRQY=
X-Google-Smtp-Source: AGHT+IH30NwnGAhwR7roVzndyBVM3XwwjJV1ZHPSohbZoxqPt652ZKf6bv+RWhQzpm+v0Np+G8T7Dg==
X-Received: by 2002:a17:90a:a78a:b0:2e0:876c:8cbe with SMTP id
 98e67ed59e1d1-2e0b8ee52a2mr1300086a91.7.1727430233845; 
 Fri, 27 Sep 2024 02:43:53 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e06e1bae46sm5105895a91.22.2024.09.27.02.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:43:53 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] Modify the timing of three panels
Date: Fri, 27 Sep 2024 17:43:38 +0800
Message-Id: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Modify the power-off sequence of the Kingdisplay/Starry/Melfas panel.

Changes between V3 and V2:
- PATCH 1/2: Modify the commit message 
- PATCH 2/2: Modify the commit message.
- Link to v2: https://lore.kernel.org/all/20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: Modify the commit message 
-            Modify the value of backlight_off_to_display_off_delay_ms.
- PATCH 2/2: Modify the commit message.
-            Delete the value of backlight_off_to_display_off_delay_ms.
-            Modify the value of enter_sleep_to_reset_down_delay_ms.
- Link to v1: https://lore.kernel.org/all/20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: jd9365da: Modify Kingdisplay and  Melfas panel timing
  drm/panel: boe-th101mb31ig002: Modify Starry panel timing

 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c    | 13 ++++++-------
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c    |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.17.1

