Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C8923E51
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB710E029;
	Tue,  2 Jul 2024 13:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YrWlArJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B8B10E029
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 13:02:03 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-706b53ee183so3541300b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719925323; x=1720530123; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qZtrnZ09n95IC/BfvYp8Bv1QvGg6hzmuOXjgAkx8r4U=;
 b=YrWlArJRoHUvqjjV9j57BJ70d2j7cFPtb863+H/uAGfqsO+52XpoK3qQvFi6PqA3QP
 KqT8U81U8DWOhBJRoQd2Rt0P+nqUse/oDOQvNV+/izA5KsLbNuw5Of0ONV3BDkyc60v2
 +9eZFTcyPJeq9YcrM/BxCJCCMIPuBNhRiDBA9UJiTWAbYbHKnDN8faRbsaJdvv9TpGth
 6cZEL9M9zuwoc+uiTLAx4GYIkMLWjTaidiO6J1kWV+HMeOwRBHCjHoyo1T3VMW+JFUtz
 edp1NTZJ4QwHJSuzitSAs+mmAwuG7RClgkHAHIicODq0dkyxylO2mZ38h9BCKRkzEVgv
 Yy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925323; x=1720530123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qZtrnZ09n95IC/BfvYp8Bv1QvGg6hzmuOXjgAkx8r4U=;
 b=Px5P1oo5DwIYWF4l26dn601G66kQwIga1va5q9v53o+AwjAR6Gd4+9x69exWitcoIM
 VaxYGtg6brijC0Lm8NiJkYG4UByFvb7ucduKmcypKPmqD3XcxVSTLzCgq/nW3i3vTH1o
 97WRa7lhxq9AOp6pm91bL/ajQxza3ciVUAd8eNrTu6jL+VDKmmnb/acuHC6TotuUOVum
 oDYnlup0haUuJAxxT1+B5Wp0tVed/m4OMWkWHK2qbMXUEB9dW5+bYz2N1dhf4l7XAu6c
 ZBYB+mVcAeTWjt3WppZfCrg6LJfQErsHWKg+pEAKDoMUV+rK4E+PVrYHoLS09sxtKVYw
 J/tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyHFBmcB2YEONSx6UJm+VR19LiKBtIirMxIK5HVA1r5UkHzUU7D/eTzXkcAwvEXExFo05t82y/Gc0wEXFemIjkLYXGH9ZLtkK1qmh3XiF1
X-Gm-Message-State: AOJu0YyEKlXoNLWhcBsndrXd7SUp9ZagPPrlZJvq4cDlaHmqa3vF0NTl
 QBd4LUGU77vHsXmvLxsKBc0dFyApzmvpytZ+lO5QytZ9Rxnto/mg3NTfeNWXV5w=
X-Google-Smtp-Source: AGHT+IHHwOYQGp6vYM2oRjMRQI8gLSDsunWGnK1uML0DYGFvbUO9k1Pbtg8uL4+EUK2Pgm+LWhCk4Q==
X-Received: by 2002:a05:6a21:339a:b0:1bc:e9ad:e736 with SMTP id
 adf61e73a8af0-1bef610ce49mr13461970637.3.1719925321416; 
 Tue, 02 Jul 2024 06:02:01 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6c8ec50csm6233111a12.59.2024.07.02.06.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:01:58 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Support for Melfas lmfbx101117480 MIPI-DSI panel
Date: Tue,  2 Jul 2024 21:01:36 +0800
Message-Id: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Melfas lmfbx101117480 is a 10.1" WXGA TFT LCD panel with jadard-jd9365da
controller, which fits in nicely with the existing panel-jadard-jd9365da-h3
driver. Add compatible for melfas lmfbx101117480 in dt-bindings.

Cong Yang (2):
  dt-bindings: display: panel: Add compatible for melfas lmfbx101117480
  drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 246 ++++++++++++++++++
 2 files changed, 247 insertions(+)

-- 
2.25.1

