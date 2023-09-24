Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB97ACB97
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0557A10E13A;
	Sun, 24 Sep 2023 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8539310E133
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so620602366b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583573; x=1696188373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mum4j91XFiU8Xtc7TFcTf1fNSOJNvZg3YC6vHA1cwnU=;
 b=FeJsYDCgT4EVpsFGL82r3a79GajqsOdPoimk2J1riu7sNMJ+GIEyko+Q8HyKKZ1o35
 b49t0NaW8eLVGP3EDg335sEmGdoCyOWNRImv4JsIDS0m/fi4SMg0picfsV/YUwIim5Dm
 UIZZEHO8zQYxDrYOzLWzrKPa0yeys88iuOmf1fx7vlvFH8yU531uFB32NV4A+VT561UR
 Ni6moF7Hl8i41CcEozwbFcWPfqbfalVFbd/lOxsBvVjT4HvME2Y0gQRrgCHCXmKSGHN0
 J0FAhEcYsS6KK7xp6dFvzUxLRn4nwO9jtzWw6Z6VDoCx/HIUJA08a9feQZXnR2FoFDgk
 z16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583573; x=1696188373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mum4j91XFiU8Xtc7TFcTf1fNSOJNvZg3YC6vHA1cwnU=;
 b=BQFb7OTc+1hXTvO/pDOE2TS1lwkIgF/PKtSlxojzPDQUTG2ceTlFP9+nYnFnkRQI3c
 7ua9F7IKi/4+/oHRzEtQ1Wz3L8x43HIZ0Mz4m6UoWpBQg4xUb4E8Br9C6kNUozm1h/q6
 L/gzRJiRjsdeBbklDpWfsv/geuH6d+PizVwDCf/LH0qDdtG5Wx0YyxvqqhiPU7/KON2M
 Z+bdMWZTdhGHjZ4E7Yfr1Nj+UxaP7xaAPF0VC9Eq5fPrxSEqm4yU7+wDcdNJJY7cZ7pH
 0hvh+QzMb57Iin9k6rp0FdUewTv5jzf3WVSK+egBFMBF3MS9DMxkSm6YP41jye9258ga
 fbhQ==
X-Gm-Message-State: AOJu0Yxi10sfSCp7Vj3b/5gbN/0kagOxOy2sTzq6eOFoY1W9p6SELqjU
 IOVjEvou25jhSGSYmNcqjXM=
X-Google-Smtp-Source: AGHT+IHXITx2ykaLrpQKUUcUVgZplQwvgEedTJsw9ydWxvo2fANUWEHTFIz/szbg85S67tayV/onBg==
X-Received: by 2002:a17:906:31ce:b0:9ae:6ffd:be12 with SMTP id
 f14-20020a17090631ce00b009ae6ffdbe12mr4738928ejf.76.1695583572612; 
 Sun, 24 Sep 2023 12:26:12 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:12 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 0/7] drm/sun4i: dw-hdmi: Fix initialization & refactor
Date: Sun, 24 Sep 2023 21:25:57 +0200
Message-ID: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Main goal of this series is to fix race condition between probing display
connector driver and sun8i dw-hdmi platform driver. Sometimes, boards have
ddc-en gpio specified in DT file. This is handled by display connector
driver since commit 920169041baa ("drm/sun4i: dw-hdmi: Fix ddc-en GPIO
consumer conflict"). However, because there is no link between it and
sun8i dw-hdmi driver, probe order isn't determined. If display connector
driver if probed afterwards, then sun8i dw-hdmi driver won't be able to
read EDID and thus fall back to 1024x768. This can be easily solved by
using bridges and linking them together. Coincidentally, switching to
bridge model is also long term goal.

I found out some other issues when working on them (missing phy deinit and
memory corruption during executing fail path). Since there is now a bigger
chance of deferring probe, it's also good to skip reporting deferred probe
as error. This often confuses users when examining dmesg output, especially
if there is no error code reported.

I also throw 2 refactoring patches for a good measure.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (7):
  drm/sun4i: dw-hdmi: Deinit PHY in fail path
  drm/sun4i: dw-hdmi: Remove double encoder cleanup
  drm/sun4i: dw-hdmi: Switch to bridge functions
  drm/sun4i: Don't show error for deferred probes.
  drm/sun4i: dw-hdmi: Split driver registration
  drm/sun4i: dw-hdmi: Make sun8i_hdmi_phy_get() more intuitive
  drm/sun4i: dw-hdmi: check for phy device first

 drivers/gpu/drm/sun4i/sun4i_drv.c      |   3 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 191 ++++++++++++++++++-------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |   9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c |  13 +-
 4 files changed, 151 insertions(+), 65 deletions(-)

-- 
2.42.0

