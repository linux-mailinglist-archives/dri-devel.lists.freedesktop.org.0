Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF993614DE7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DBF10E00F;
	Tue,  1 Nov 2022 15:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBBE10E00F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667315388; x=1698851388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ak/4T+4EA30gwIfd/EobbLy7FhELRXx6beNhV222/eY=;
 b=LOzjS1j1BjTdk57k43v15TXr3FpQmAmpwWX2KYCbhrwDix2WB9FfUmL7
 EqSWiOyGlsgPcj6SjV87L67BHGyYVhcxEvCkfMCgsKUXVsFjZAGH4XbV6
 lfUxZIHeqEabnS02KRCJQokvsJGTcUin0E2JFbANSo+BCtvWA6O/5Yfgw
 gOfKZoVjTwDgVt9MoT52fUksAfPK5xHTnf4cCLRWJ6ubRdjHBpaHGzhxW
 ZFTRfMu+VWYAJY6Q5pv70S5Vegzn+SmpN01YCi9E+ZZ3nfZgEhMJ4Ky7U
 wdMgQlT3HXZBMRe3EGohBAHO6lO5Rf3ajLCdSQxzrMUd7lylz81vGPjtG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="309156582"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="309156582"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 08:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="667221091"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="667221091"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 01 Nov 2022 08:09:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 61770D0; Tue,  1 Nov 2022 17:09:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] fbdev: ssd1307fb: Drop duplicate NULL checks for PWM
 APIs
Date: Tue,  1 Nov 2022 17:09:47 +0200
Message-Id: <20221101150947.67377-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101150947.67377-1-andriy.shevchenko@linux.intel.com>
References: <20221101150947.67377-1-andriy.shevchenko@linux.intel.com>
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
Cc: Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pwm_disable() and pwm_put() are NULL-aware, no need to
duplicate the check in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/ssd1307fb.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 5c891aa00d59..046b9990d27c 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -803,10 +803,8 @@ static int ssd1307fb_probe(struct i2c_client *client)
 bl_init_error:
 	unregister_framebuffer(info);
 panel_init_error:
-	if (par->device_info->need_pwm) {
-		pwm_disable(par->pwm);
-		pwm_put(par->pwm);
-	}
+	pwm_disable(par->pwm);
+	pwm_put(par->pwm);
 regulator_enable_error:
 	if (par->vbat_reg)
 		regulator_disable(par->vbat_reg);
@@ -827,10 +825,8 @@ static void ssd1307fb_remove(struct i2c_client *client)
 	backlight_device_unregister(info->bl_dev);
 
 	unregister_framebuffer(info);
-	if (par->device_info->need_pwm) {
-		pwm_disable(par->pwm);
-		pwm_put(par->pwm);
-	}
+	pwm_disable(par->pwm);
+	pwm_put(par->pwm);
 	if (par->vbat_reg)
 		regulator_disable(par->vbat_reg);
 	fb_deferred_io_cleanup(info);
-- 
2.35.1

