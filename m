Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0678295929
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1AE6F524;
	Thu, 22 Oct 2020 07:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66F6E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 05:05:13 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a17so365909pju.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 22:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=br1VG/AftR5rvhAmwlJkFmu6wT77im0wqYMY63lXCPc=;
 b=f48hBtEYiQ9cumyN91pZln9WRYzYGIagC8IaqGZt02+O2MHl6eQhg0BtJ9+cg1Lz5h
 o78FtZXmTE3jBKH3YGJw6UO0d0jZFwtKCoYPkexfnY1SZ/dfXt7VslCJZM/bN6IMdzvi
 1GjVCtofogBD1D5SMd8g0By60jOJ/X9Pviva4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=br1VG/AftR5rvhAmwlJkFmu6wT77im0wqYMY63lXCPc=;
 b=RwXrqEd/XgObl99FqzZR2HlqZSktzC57hGIDLDRlEhiYEJr57IvitBEFNLNNAalxny
 dUy137K/bRS9T/sYNN10p9aYxxkA5+MF2kguU2GQqnQX1N3wq8hPCydEfdganfVGckqO
 vx79u5a2hfOn5pfngirkDm5juboGXVBwbW8etrdR1+986ZOPrraQOxa4LJo96YQuKhYs
 w6EtKtrJ8aN8mDPE0VI0V19ErFPX68YQJIUTkZjEkBnvS7WvajvyGGPrx9dxpZ60SKlg
 BIjAtlvLOdVsb6ZP3NgdFP4z8oFtdK9HAijtlYX90636J0SUa0ZSJ/IXrLL5fPbYahXj
 T7Og==
X-Gm-Message-State: AOAM532We8Np1wyImXsk2dB9FE23ikZ/sgTnj1gEXK/jhKBCW6LQMQIO
 JnfTFlNtok46jz3Jop7wKDSogw==
X-Google-Smtp-Source: ABdhPJymcPyyQm+Vwkk6bRyWkhQZdrrKBm+8kHDpsoJwQTQghvs0I0e+UpqN3Vxv1JCNbjDoQlFwsw==
X-Received: by 2002:a17:902:ab89:b029:d5:b297:2cc1 with SMTP id
 f9-20020a170902ab89b02900d5b2972cc1mr765458plr.7.1603343113453; 
 Wed, 21 Oct 2020 22:05:13 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net.
 [73.63.253.164])
 by smtp.gmail.com with ESMTPSA id q16sm394954pfu.206.2020.10.21.22.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 22:05:12 -0700 (PDT)
From: Alexandru Stan <amstan@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 0/3] PWM backlight interpolation adjustments
Date: Wed, 21 Oct 2020 22:04:42 -0700
Message-Id: <20201022050445.930403-1-amstan@chromium.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Alexandru Stan <amstan@chromium.org>, linux-pwm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was trying to adjust the brightness-levels for the trogdor boards:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
Like on a lot of panels, trogdor's low end needs to be cropped,
and now that we have the interpolation stuff I wanted to make use of it
and bake in even the curve that's customary to have on chromebooks.

I found the current behavior of the pwm_bl driver a little unintuitive
and non-linear. See patch 1 for a suggested fix for this.

A few veyron dts files were relying on this (perhaps weird) behavior.
Those devices also want a minimum brightness like trogdor, so changed
them to use the new way.

Finally, given that trogdor's dts is part of linux-next now, add the
brightness-levels to it, since that's the original reason I was looking at
this.

Changes in v3:
- Reordered patches, since both dts changes will work just fine
  even before the driver change.
- Rewrote a bit of the commit message to describe the new policy,
  as Daniel suggested.
- Removed redundant s64 for something that's always positive

Changes in v2:
- Fixed type promotion in the driver
- Removed "backlight: pwm_bl: Artificially add 0% during interpolation",
  userspace works just fine without it because it already knows how to use
  bl_power for turning off the display.
- Added brightness-levels to trogdor as well, now the dts is upstream.


Alexandru Stan (3):
  ARM: dts: rockchip: veyron: Remove 0 point from brightness-levels
  arm64: dts: qcom: trogdor: Add brightness-levels
  backlight: pwm_bl: Fix interpolation

 arch/arm/boot/dts/rk3288-veyron-jaq.dts      |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts   |  2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts    |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 +++
 drivers/video/backlight/pwm_bl.c             | 70 +++++++++-----------
 5 files changed, 43 insertions(+), 42 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
