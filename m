Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1C40DBA2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3E689D4A;
	Thu, 16 Sep 2021 13:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8291C89333
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:46:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAF3C60F38;
 Thu, 16 Sep 2021 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631799987;
 bh=vAWpkg7utluiGE0SOsIPwH5/ZP6yegBAj/dcwUtYN9s=;
 h=Subject:To:Cc:From:Date:From;
 b=F4MdogFPYa2t65lJNYA3B3nXkeuQ6rcoHCCfHZCddXM6Cukjjd+/k4oF/I3Ep8QiW
 p5Qo8bGdhjaudSUTye0rCPRwmWc+lJ6ZAI/d+QvO3C6sligHLsETDS/8QN41tkenBe
 sqYD/i3zX1OddN/WLmRilJIGX8eD0MOA95Ycs+L8=
Subject: Patch "drm/mgag200: Select clock in PLL update functions" has been
 added to the 5.10-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 emil.velikov@collabora.com, gregkh@linuxfoundation.org, sam@ravnborg.org,
 tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 16 Sep 2021 15:45:58 +0200
Message-ID: <163179995869156@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/mgag200: Select clock in PLL update functions

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mgag200-select-clock-in-pll-update-functions.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 147696720eca12ae48d020726208b9a61cdd80bc Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 14 Jul 2021 16:22:28 +0200
Subject: drm/mgag200: Select clock in PLL update functions

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 147696720eca12ae48d020726208b9a61cdd80bc upstream.

Put the clock-selection code into each of the PLL-update functions to
make them select the correct pixel clock. Instead of copying the code,
introduce a new helper WREG_MISC_MASKED, which does masked writes into
<MISC>. Use it from each individual PLL update function.

The pixel clock for video output was not actually set before programming
the clock's values. It worked because the device had the correct clock
pre-set.

v2:
	* don't duplicate <MISC> update code (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: db05f8d3dc87 ("drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O")
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.9+
Link: https://patchwork.freedesktop.org/patch/msgid/20210714142240.21979-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |   16 ++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |   20 +++++++++++++-------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |    9 ++++-----
 3 files changed, 33 insertions(+), 12 deletions(-)

--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -43,6 +43,22 @@
 #define ATTR_INDEX 0x1fc0
 #define ATTR_DATA 0x1fc1
 
+#define WREG_MISC(v)						\
+	WREG8(MGA_MISC_OUT, v)
+
+#define RREG_MISC(v)						\
+	((v) = RREG8(MGA_MISC_IN))
+
+#define WREG_MISC_MASKED(v, mask)				\
+	do {							\
+		u8 misc_;					\
+		u8 mask_ = (mask);				\
+		RREG_MISC(misc_);				\
+		misc_ &= ~mask_;				\
+		misc_ |= ((v) & mask_);				\
+		WREG_MISC(misc_);				\
+	} while (0)
+
 #define WREG_ATTR(reg, v)					\
 	do {							\
 		RREG8(0x1fda);					\
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -172,6 +172,8 @@ static int mgag200_g200_set_plls(struct
 	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
 		    clock, f_vco, m, n, p, s);
 
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	WREG_DAC(MGA1064_PIX_PLLC_M, m);
 	WREG_DAC(MGA1064_PIX_PLLC_N, n);
 	WREG_DAC(MGA1064_PIX_PLLC_P, (p | (s << 3)));
@@ -287,6 +289,8 @@ static int mga_g200se_set_plls(struct mg
 		return 1;
 	}
 
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	WREG_DAC(MGA1064_PIX_PLLC_M, m);
 	WREG_DAC(MGA1064_PIX_PLLC_N, n);
 	WREG_DAC(MGA1064_PIX_PLLC_P, p);
@@ -383,6 +387,8 @@ static int mga_g200wb_set_plls(struct mg
 		}
 	}
 
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		if (i > 0) {
 			WREG8(MGAREG_CRTC_INDEX, 0x1e);
@@ -520,6 +526,8 @@ static int mga_g200ev_set_plls(struct mg
 		}
 	}
 
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
 	tmp |= MGA1064_PIX_CLK_CTL_CLK_DIS;
@@ -652,6 +660,9 @@ static int mga_g200eh_set_plls(struct mg
 			}
 		}
 	}
+
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 		tmp = RREG8(DAC_DATA);
@@ -752,6 +763,8 @@ static int mga_g200er_set_plls(struct mg
 		}
 	}
 
+	WREG_MISC_MASKED(MGAREG_MISC_CLKSEL_MGA, MGAREG_MISC_CLKSEL_MASK);
+
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
 	tmp |= MGA1064_PIX_CLK_CTL_CLK_DIS;
@@ -785,8 +798,6 @@ static int mga_g200er_set_plls(struct mg
 
 static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 {
-	u8 misc;
-
 	switch(mdev->type) {
 	case G200_PCI:
 	case G200_AGP:
@@ -811,11 +822,6 @@ static int mgag200_crtc_set_plls(struct
 		break;
 	}
 
-	misc = RREG8(MGA_MISC_IN);
-	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
-	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
-	WREG8(MGA_MISC_OUT, misc);
-
 	return 0;
 }
 
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -222,11 +222,10 @@
 
 #define MGAREG_MISC_IOADSEL	(0x1 << 0)
 #define MGAREG_MISC_RAMMAPEN	(0x1 << 1)
-#define MGAREG_MISC_CLK_SEL_MASK	GENMASK(3, 2)
-#define MGAREG_MISC_CLK_SEL_VGA25	(0x0 << 2)
-#define MGAREG_MISC_CLK_SEL_VGA28	(0x1 << 2)
-#define MGAREG_MISC_CLK_SEL_MGA_PIX	(0x2 << 2)
-#define MGAREG_MISC_CLK_SEL_MGA_MSK	(0x3 << 2)
+#define MGAREG_MISC_CLKSEL_MASK		GENMASK(3, 2)
+#define MGAREG_MISC_CLKSEL_VGA25	(0x0 << 2)
+#define MGAREG_MISC_CLKSEL_VGA28	(0x1 << 2)
+#define MGAREG_MISC_CLKSEL_MGA		(0x3 << 2)
 #define MGAREG_MISC_VIDEO_DIS	(0x1 << 4)
 #define MGAREG_MISC_HIGH_PG_SEL	(0x1 << 5)
 #define MGAREG_MISC_HSYNCPOL		BIT(6)


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.10/drm-mgag200-select-clock-in-pll-update-functions.patch
