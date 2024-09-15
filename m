Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA76979576
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 10:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2412110E2DE;
	Sun, 15 Sep 2024 08:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="z5ilszDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2A10E2DE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 08:10:49 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-717880daae7so443291b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726387849; x=1726992649; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZyUzb3Mdq8sdR0kQgQ7St7N5IVlDEl1Zqsb226N1tk=;
 b=z5ilszDsQkHsAJ2BTjGXLs6zr0y/wEjv30ERlmr9hRH+YWj+iap16yMl5Db6zfPXYe
 C4saZ6/tnMvZtBvvbKUcVyJnHA6LMG0KH+POQVM+sKqK5NpdF/E+ZGRoiUWeZz53Tw+3
 bO4r2+q1hUCI7j8K9WJa0n1uRaerIzFPOYoP51PDw+gDrNHi2Xa40VzSFRFCoix0SOme
 m6BdBHWXGG9QSSqLjgHTyRlMJvL0yM9ZPEeUE7cl0jgkysvddJFkR1DY3ArLEGXYdY8y
 2RDddkTU9w9TW6JmvOQT3BgDXygDgGVNp02pRDb4tvuFMCibmgxM/9hXdcYs2ejrfn7J
 XoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387849; x=1726992649;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ZyUzb3Mdq8sdR0kQgQ7St7N5IVlDEl1Zqsb226N1tk=;
 b=Rp8xiFRIDtbZ9fy5E3V2m7SXbFMYmYnfV5SG2ckEzznJUn+ZjexLF6XzuzoV4aMowJ
 E5GEsDD9KxjJvQYZ4GkDzXB/da5wGOv4U+ni7ItrwSGSlRZ97qj+VexNtyAEt2DHp7o0
 SLal7GhQtv1topV29WGQSJoawhNHjv9vZvJq5VfuHt4lnTPkTy+g7MgLcdnlF4XPQFVQ
 SErDwEHE1QJ5U2zGgore+WPBsD3Ta2vFf4bjHWLBLgkJiGvNEKBudQQMnU1keoghpI5n
 H64/jtLtdw6HrAp3Sq4x6IASRN6PjvLKa+DWv6ZxvV8dFcpqhrkCHS8L/POjniMibLfF
 q8sA==
X-Gm-Message-State: AOJu0Yw7qMLBLb+mRv4ud3/9jHK7HVoMn5chJ1lbuVjdn8jxJWqmSYRK
 HwvOoSFxSsYNx97RPfqif6z+IxEv3h02ZoVppSn/z1ogpewUi3DAz1JDpZx1H6g=
X-Google-Smtp-Source: AGHT+IFqciYuNSxruvSjidW3BBxJEjz4Bx90EoR3MufHRD+vxKmEg+WY2TuKBqEmigxpyQQrEMr9nA==
X-Received: by 2002:a17:90a:f2cd:b0:2ca:7e67:d11e with SMTP id
 98e67ed59e1d1-2db9ff7d413mr5718453a91.2.1726387848770; 
 Sun, 15 Sep 2024 01:10:48 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dbcfd26f2csm2662672a91.31.2024.09.15.01.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:10:48 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Modify the timing of three panels
Date: Sun, 15 Sep 2024 16:08:28 +0800
Message-Id: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Zhaoxiong Lv (2):
  drm/panel: jd9365da: Modify Kingdisplay and  Melfas panel timing
  drm/panel: boe-th101mb31ig002: Modify Starry panel timing

 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c     |  6 ------
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.17.1

