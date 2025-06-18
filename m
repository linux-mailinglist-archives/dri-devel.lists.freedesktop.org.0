Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED4ADE4F1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FF710E7A4;
	Wed, 18 Jun 2025 07:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="0Z7HXL4d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tcc7XPlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036CF10E1D2;
 Wed, 18 Jun 2025 07:54:00 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750233232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lJEJerT30uVZeLbMloQis7w9Ly4m8IEIdpJZd3Pc9DU=;
 b=0Z7HXL4dErSQLVLsyMoZIe63Mo11EmBOh3csLLgOHzz+LhnIDZt81PmP8jlfkt3gSvdi4j
 4J6Xdo4a2TR1FMqh26GAK/ZC4XVKhKlbzMnshoYYdbjF0r8TjYDq9CCk2nRhaAUKffNMq+
 1qa3Ai5RGeazgqoo1wfbxTx5+WhKju5sCRobkM1c59MxkwJr1mfAuUpXw8Llt1/ECPOolF
 vPN9OeNq4/rORlb/skFfH2A89jZkYDg3+1cJ9QUnDZb7pEWSKNakM7NG+nmTCw5FCIbolE
 wNb8F+ul6JoQqOQA7mWaPmqqocYNwq7L7woH+tAEH0Zskpepkg4iDvqcZJHAwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750233232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lJEJerT30uVZeLbMloQis7w9Ly4m8IEIdpJZd3Pc9DU=;
 b=tcc7XPlFrtUWw6TWH00NCkmrkFyHBCCHbY9mZWCx9RgB5mKOgKepQea6SWDYFecg6kHkF6
 CGKzfR0iDuD5qNBA==
Subject: [PATCH 0/3] drm: Don't use %pK through printk
Date: Wed, 18 Jun 2025 09:52:19 +0200
Message-Id: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADNwUmgC/x3MTQ5AMBBA4avIrE1Sv8VVxAIdzELJTCMScXeN5
 bd47wElYVLokgeELlY+fESWJjBvo18J2UVDbvLKlKZEIQ3CcyCH58E+kCg62bGxkzVFbdtldBD
 rU2jh+z/3w/t+klJVYGkAAAA=
X-Change-ID: 20250404-restricted-pointers-drm-87b703679fad
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=1512;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZGg7BEj9Zk6TuFkTwYnSmEoyEZPeB0NY8xBLjHfQJZY=;
 b=kxcx3RkP3c4uH68PbMFCnE5QAQ0f3j92Ut+jSaXyoSJxxZQVBSkR7GYRX5/mWdahdihpofEYG
 8RZi6sQoKLrDiKOK1mYQ4Nb450F8EfdRvHDs3bbJvRDWjQeLIbkJk1m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There is still a user of %pK left, but this uses it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (3):
      drm/bridge: samsung-dsim: Don't use %pK through printk
      drm/exynos: Don't use %pK through printk
      drm/msm: Don't use %pK through printk

 drivers/gpu/drm/bridge/samsung-dsim.c       |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 32 ++++++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++--
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 7 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
change-id: 20250404-restricted-pointers-drm-87b703679fad

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

