Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A031F28DA34
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3E6EA0D;
	Wed, 14 Oct 2020 07:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644E76E8AE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:01:27 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id e10so16249538pfj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kobb2e1tlICZgkQS/oGVtY54aK5l9kHJ2QZVBKXSGxE=;
 b=HvRYgaNc6roOxiu+jeMNUaEvL5jd+9FuF8oUyy0Qut6ZicDzpSKH3rWKcSKeygEjEn
 yb0slmgyi3zc3tFthbRId+EYOgfZZFgKsSyDAhoLqFIbgcMmoSRBIMdI4D74fUepQXuR
 VahaQpxlXCfl8FLlEz1J7risjgxjMtLieTEX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kobb2e1tlICZgkQS/oGVtY54aK5l9kHJ2QZVBKXSGxE=;
 b=F8hpwaVXKJP01tCQKq65RrgiG+2uqnPcrjIf+T7t+I3079PD37iCxeKSluz8PYUadr
 fX2rq1TMA3Q6DXxGL+RnE/GEZ9mbVimZbeQMvZFPSFRcqp12rcJh2iRk3l+4qoohhrK2
 i1F9Yi+tuZL8HP+e4juVsm/1sG66VQx/JBmptVUhP4xoM4o8iUaKFpuq0B+kqEXWX/Tp
 oYzarV4Pp1oIJ7E2mWOCXXTO942xxxEo93e/b9VdY2LsMjhlZJ1z2UmMQ26sJzsMy1ea
 Iv/wDihYUCj25muipiWvdQNxTQViCL766ENspCtQ+o8/+Gd97fi0XFhjzi8eYbbJnJZK
 1mZg==
X-Gm-Message-State: AOAM532iMkupVh8RZGmk/Jxlbvf5ZM0+jxVcxiq1mVbQXN8Khy3cSFwA
 aIJS1Fkjw21EVKk3O3R1eUmkGA==
X-Google-Smtp-Source: ABdhPJxP6pxFhLR56ZtuQO0U0FlPcp8Gjo0ZGCypcR6tvA2syik1UwDJOMcOKfmi863CHLyQwReK/Q==
X-Received: by 2002:a62:2a94:0:b029:155:3225:6fd0 with SMTP id
 q142-20020a622a940000b029015532256fd0mr25008896pfq.64.1602576086840; 
 Tue, 13 Oct 2020 01:01:26 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net.
 [73.63.253.164])
 by smtp.gmail.com with ESMTPSA id y124sm14956924pfy.28.2020.10.13.01.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 01:01:26 -0700 (PDT)
From: Alexandru Stan <amstan@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/3] PWM backlight interpolation adjustments
Date: Tue, 13 Oct 2020 01:01:00 -0700
Message-Id: <20201013080103.410133-1-amstan@chromium.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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

Changes in v2:
- Fixed type promotion in the driver
- Removed "backlight: pwm_bl: Artificially add 0% during interpolation",
userspace works just fine without it because it already knows how to use
bl_power for turning off the display.
- Added brightness-levels to trogdor as well, now the dts is upstream.


Alexandru Stan (3):
  backlight: pwm_bl: Fix interpolation
  ARM: dts: rockchip: veyron: Remove 0 point from brightness-levels
  arm64: dts: qcom: trogdor: Add brightness-levels

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
