Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C3403B0B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4CD6E151;
	Wed,  8 Sep 2021 13:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30D6E151
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:54:09 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id h133so3182530oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PoThhVHI+CpdzEgbh+scXgZrwASU+pwID9AwwUPF63k=;
 b=JB/hOY4azKr0nOZp3JVoVVjfLTG9LraA3gH4xiwvDXq6AYDNEaa0UVomjx69L9YMH+
 73pG7pHWPRVffZ5ChzV15wOYUXTFrXUjkggGrPuYMV0Eimwl9uHhuhHmRMsNkOEk/7HG
 lo5xT3/3Wu0WNYxGd1Lv5LGNfH/DrI+3Wp4uTDrVPWpBk+xSMA6fYmDbnPIJZI1aZx0v
 yKcn6hvYXzmB4UsjVkLz+AGGKUy5/vdTdc8PHkcvdkb2vKNXabol265AkPRtctZ32kAw
 8FtlSdLQshpHtSrZts+KgboteBhhsV5F2/MFwitj4Qj+v8XEHfXgmiVZjBEL3POJqtCt
 e0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PoThhVHI+CpdzEgbh+scXgZrwASU+pwID9AwwUPF63k=;
 b=CEXs50x0LUymSPT7WxqQ3enLp39c2CYFmY3dgrwERExOsEqOzd9UxFfRQP2ZndfLhG
 wXjDPD+GqVhbRPkO9l+u6QaAO+QcJCpaoQSO0H+krYc4kMtCtpoawyY34p7aDeyiJSd4
 MD46AZt1bHo9frOMwTJYIymzBSzEstXr40LyvcfDEK0onT+Y7WclkMYunc2tJR+u7Jzl
 2i/RJG4cviBuKGyzXPkiea7z8H58dYoTafrE77lVyaJddmKEM+i6ubv5kQtbR90oCTuH
 KQMUCiX+SYQAlBxtFlx0eSqemIs6wRwYp0eGKAAc8GAD2JFGEmhxtuKCE9f4FIPXD7fH
 fx1g==
X-Gm-Message-State: AOAM533VqIrLNQu98Igj8BIRwjcN3mVhlILALepnKe4lxQE36+Peg0VG
 dJ9YIBTGgg7pglBvBCGgG7g=
X-Google-Smtp-Source: ABdhPJxS/hL9sd8p8yzOu6wDDTwZSa0fSfI/mWESuQWUWYwOgMmMKq23McgrFeyRjE5eu6Tah4Opwg==
X-Received: by 2002:a54:4714:: with SMTP id k20mr2407177oik.103.1631109248826; 
 Wed, 08 Sep 2021 06:54:08 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id q26sm463704otf.39.2021.09.08.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:54:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@linux.ie,
 heiko@sntech.de, hjc@rock-chips.com, andriy.shevchenko@linux.intel.com,
 zhangqing@rock-chips.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] drm/rockchip: Update crtc fixup to account for fractional clk
 change
Date: Wed,  8 Sep 2021 08:53:56 -0500
Message-Id: <20210908135356.18689-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

After commit 928f9e268611 ("clk: fractional-divider: Hide
clk_fractional_divider_ops from wide audience") was merged it appears
that the DSI panel on my Odroid Go Advance stopped working. Upon closer
examination of the problem, it looks like it was the fixup in the
rockchip_drm_vop.c file was causing the issue. The changes made to the
clk driver appear to change some assumptions made in the fixup.

After debugging the working 5.14 kernel and the no-longer working
5.15 kernel, it looks like this was broken all along but still
worked, whereas after the fractional clock change it stopped
working despite the issue (it went from sort-of broken to very broken).

In the 5.14 kernel the dclk_vopb_frac was being requested to be set to
17000999 on my board. The clock driver was taking the value of the
parent clock and attempting to divide the requested value from it
(17000000/17000999 = 0), then subtracting 1 from it (making it -1),
and running it through fls_long to get 64. It would then subtract
the value of fd->mwidth from it to get 48, and then bit shift
17000999 to the left by 48, coming up with a very large number of
7649082492112076800. This resulted in a numerator of 65535 and a
denominator of 1 from the clk driver. The driver seemingly would
try again and get a correct 1:1 value later, and then move on.

Output from my 5.14 kernel (with some printfs for good measure):
[    2.830066] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
[    2.839431] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
[    2.855980] Clock is dclk_vopb_frac
[    2.856004] Scale 64, Rate 7649082492112076800, Oldrate 17000999, Parent Rate 17000000, Best Numerator 65535, Best Denominator 1, fd->mwidth 16
[    2.903529] Clock is dclk_vopb_frac
[    2.903556] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
[    2.903579] Clock is dclk_vopb_frac
[    2.903583] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16

Contrast this with 5.15 after the clk change where the rate of 17000999
was getting passed and resulted in numerators/denomiators of 17001/
17000.

Output from my 5.15 kernel (with some printfs added for good measure):
[    2.817571] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
[    2.826975] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
[    2.843430] Rate 17000999, Parent Rate 17000000, Best Numerator 17018, Best Denominator 17017
[    2.891073] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
[    2.891269] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
[    2.891281] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000

After tracing through the code it appeared that this function here was
adding a 999 to the requested frequency because of how the clk driver
was rounding/accepting those frequencies. I believe after the changes
made in the commit listed above the assumptions listed in this driver
are no longer true. When I remove the + 999 from the driver the DSI
panel begins to work again.

Output from my 5.15 kernel with 999 removed (printfs added):
[    2.852054] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
[    2.864483] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
[    2.880869] Clock is dclk_vopb_frac
[    2.880892] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1
[    2.928521] Clock is dclk_vopb_frac
[    2.928551] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1
[    2.928570] Clock is dclk_vopb_frac
[    2.928574] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1

I have tested the change extensively on my Odroid Go Advance (Rockchip
RK3326) and it appears to work well. However, this change will affect
all Rockchip SoCs that use this driver so I believe further testing
is warranted. Please note that without this change I can confirm
at least all PX30s with DSI panels will stop working with the 5.15
kernel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba9e14da41b4..bfef4f52dce6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1169,31 +1169,16 @@ static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
 	 *
 	 * - DRM works in in kHz.
 	 * - Clock framework works in Hz.
-	 * - Rockchip's clock driver picks the clock rate that is the
-	 *   same _OR LOWER_ than the one requested.
 	 *
 	 * Action plan:
 	 *
-	 * 1. When DRM gives us a mode, we should add 999 Hz to it.  That way
-	 *    if the clock we need is 60000001 Hz (~60 MHz) and DRM tells us to
-	 *    make 60000 kHz then the clock framework will actually give us
-	 *    the right clock.
-	 *
-	 *    NOTE: if the PLL (maybe through a divider) could actually make
-	 *    a clock rate 999 Hz higher instead of the one we want then this
-	 *    could be a problem.  Unfortunately there's not much we can do
-	 *    since it's baked into DRM to use kHz.  It shouldn't matter in
-	 *    practice since Rockchip PLLs are controlled by tables and
-	 *    even if there is a divider in the middle I wouldn't expect PLL
-	 *    rates in the table that are just a few kHz different.
-	 *
-	 * 2. Get the clock framework to round the rate for us to tell us
+	 * 1. Get the clock framework to round the rate for us to tell us
 	 *    what it will actually make.
 	 *
-	 * 3. Store the rounded up rate so that we don't need to worry about
+	 * 2. Store the rounded up rate so that we don't need to worry about
 	 *    this in the actual clk_set_rate().
 	 */
-	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
+	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000);
 	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
 
 	return true;
-- 
2.25.1

