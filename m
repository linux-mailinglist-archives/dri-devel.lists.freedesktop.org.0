Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5597EC7D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BE310E17D;
	Mon, 23 Sep 2024 13:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZjwE4i5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E9910E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:42:40 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-718ef6a26dbso412729b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727098960; x=1727703760; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MauEvGZKIi80AJIhpX9GBqvR/KkW3DC1LQXpbagt1zA=;
 b=ZjwE4i5e2wxa4T3A2lyMTXM6b53sCZkr4GzSTcT2tQ9ePPojx9fkFMuuqIN4ut011v
 Q/0+gBu5/xvjhwIoPcPJJZTjFBTyjA8cfkskzBetxrQi6Fx2S0KMn57nr006+DnvkUYJ
 9I+0yBeo5rr+NriP2jx/hE0vmustyZYyuBHVzCPTje+olNnAYXGUZMU+PAW+pB03ywP8
 bOXVIs+EBf2pnuLFecVOQyRQ6a/iVfwQSs5HJioEAwANXCd1pMxNpVhLxZNNzR0M3j1N
 rBsFTO9M3o5jDMvN8wG0x9JMThdr1YzcOtms04np0NJGO60JMRtoNUT1tfZ3N4oZ8Cq6
 0vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727098960; x=1727703760;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MauEvGZKIi80AJIhpX9GBqvR/KkW3DC1LQXpbagt1zA=;
 b=nOLmHHG8tk2mNYm+VULWRbWPKWWquPArKb5CECmaL/0ZeFQDM3yl4kzN9q6FMk300V
 URFX95eF14PjwtJKhJEldXTW7HIgiCa9HZ3PuxvWO2RnUsZ8OCTqMJX3SqFfdPENdoev
 4/iNdezqgBdpimJ2nqSoXH7DxsqP1rsz+roGxx6/OA3NvFmVLqpf/rCig05lecykCnKs
 b4ZtmCdpHmrRBShkf0KYIyZiZlLSCefMdS45uSqLmAO5hKGhcQXn8lVWzNSrcvO6TN5p
 GOK/WUK67MJySp7ZNauf+kya4RzDOMuY9JC2782IooWKMxAwjYOPHwr6DJ/QbFya4My5
 c71g==
X-Gm-Message-State: AOJu0YxIS32xbvu7xk3xg2/1E722vtfDwLYQ0l/oLSox4rVF1ZYtYcoX
 eB3LWARBUSYrXVYPqoSOPu4VAKfSbgp4qfUJD/c7thtf0zECmYb4dN1QH3PMPeqiL5GobMPDSnw
 iEsg=
X-Google-Smtp-Source: AGHT+IG+uvpL+c++gnazNXMbcsE8W6pFaeYRRhj2JaWv+y4hmgtatOe4eP1On41DSLthoyWEmAlshg==
X-Received: by 2002:a05:6a20:7351:b0:1cf:35db:2c3c with SMTP id
 adf61e73a8af0-1d30a8bf315mr7383954637.3.1727098960354; 
 Mon, 23 Sep 2024 06:42:40 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b97302sm14376009b3a.147.2024.09.23.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:42:39 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] Modify the timing of three panels
Date: Mon, 23 Sep 2024 21:42:25 +0800
Message-Id: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

