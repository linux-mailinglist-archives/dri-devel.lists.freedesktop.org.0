Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0427FB35
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0CA6E846;
	Thu,  1 Oct 2020 08:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F96E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 22:40:15 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x14so3499290oic.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Q03gpzYZKFx4WbmDyv5/MoHJyzVeXQE9aurdxl6jkE=;
 b=S8gdE9fvVQaxNMP5Tk07sOhi1O9IPbRElmRLsx6QZ4qwMH5OwpbW7cPFTFaQkbOq4Q
 BVKhFHBXh7ogQPPqOp16wDNufm1pdR73IKAHuSdTjxlJ7/z251VQR3+dcP8HvY6Xn2cO
 HYGQc2oQDtnTShDnCi4xJ8BP2jpCvEHstXq++V+bWH1EjYzS/dTMbql4zbpRGzG6TDFs
 VJuH0A2oHnZVTWEKDQqImr/HJ05iz3yp54KJLRxKoTMeJa1wBDGcZii5g/xGH8RBKFnq
 r9ydfl+B3mMgWs23jHmBHGtJFk2d118/fxUgH19PjPaam1rE4DmlKePcRMN/5tVrcOiz
 aRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Q03gpzYZKFx4WbmDyv5/MoHJyzVeXQE9aurdxl6jkE=;
 b=UJvy3S8phMsIQpZK6uYf2ttxBToYSlFSZIuNMN21hSy2F/Sa8EK4N4YGUDE/9gi8SW
 BGFhjYzXmt0BPzUj94mWMCzGxGHIq2q5BYcaH6HS+jdVc1G9TZ1sOAZz3vY+hvwPHIwb
 fotHef2LV9but5Wx3mw8UOChiZuamjtU1zylEK0AwZo5Jq45Xg09EE1jqSQWmE6els+h
 10BpjWaPr1G2fQGjctd/jhW0wuMHdHKxwc7M2y4eOXk32EkVu3qnKgMiIiIaXDCXgR1X
 UyN0wFVbnpieWS/ovBzo5UG0sc6XFmCINmeeZmDe/r1DqCzsXOl3yj6tIiuYOmO3WngL
 ZJCQ==
X-Gm-Message-State: AOAM532bN5ZIApRU1zNKDNnJO8j1Gr02KAU1OHuw5k6E2qoivgwSPlwr
 W9baQUKtfADtDV7/icDxzplWiQ==
X-Google-Smtp-Source: ABdhPJyfioIRVXxFrO8udLEGAlCapQ6/ekLaouaVOiQBLkxLGmHem4ShXrogGhVvqMPo8mzsPd3mcg==
X-Received: by 2002:aca:d693:: with SMTP id n141mr2683787oig.26.1601505614911; 
 Wed, 30 Sep 2020 15:40:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p8sm781364oot.29.2020.09.30.15.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 15:40:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/2] drm/bridge: ti-sn65dsi86: Support backlight controls
Date: Wed, 30 Sep 2020 17:35:30 -0500
Message-Id: <20200930223532.77755-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TI SN65DSI86 support driving a backlight driver using a signal
exposed on GPIO4, implement this as a backlight device.

Bjorn Andersson (2):
  dt-bindings: drm/bridge: ti-sn65dsi86: Replace #pwm-cells
  drm/bridge: ti-sn65dsi86: Expose backlight controls

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   9 +-
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 143 +++++++++++++++++-
 3 files changed, 146 insertions(+), 7 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
