Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DCD614DE8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136A410E3DA;
	Tue,  1 Nov 2022 15:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81310E3DA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667315388; x=1698851388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s75q2MsgxsQuSoRbKCZULbXrGHbPl+xDbnix/pI6B6E=;
 b=VmNJHqaNpxCyy7O6JC8xfcdIFUIzVtbW7yvFoF2U+gu6Y6kF/KAvPXUm
 Z9mxIshcwICAMfO0Hpfn0e1nHoEjC7pt3JGqIMp+vGdMjY6V0rUyZbZHY
 ka4xWgu4/iDmPB+tquuaXRmoYMbKe4Y+diwx3+5Cq16OGLnPPRdhEkevH
 Hqn5mrPcfk0/KdKpiQt50zOGZpS/k2TiJony3ZGByIDQS3FOL+pxGxle6
 JFEdkOJiDg6tQmB4wYdx04ecwZ7R8VRVcNTAClRry+vTDI/RJKVUhRrCw
 hN7ayummgMJ2C8QJCsbyliGVGAEWk8COmzmm8cQpenBTzLxK3f7Dm2EWX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="309156583"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="309156583"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 08:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="667221094"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="667221094"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 01 Nov 2022 08:09:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5620DF7; Tue,  1 Nov 2022 17:09:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] fbdev: ssd1307fb: Drop optional dependency
Date: Tue,  1 Nov 2022 17:09:46 +0200
Message-Id: <20221101150947.67377-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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

Only a single out of three devices need a PWM, so from driver it's
optional. Moreover it's a single driver in the entire kernel that
currently selects PWM. Unfortunately this selection is a root cause
of the circular dependencies when we want to enable optional PWM
for some other drivers that select GPIOLIB.

Fixes: a2ed00da5047 ("drivers/video: add support for the Solomon SSD1307 OLED Controller")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbdev/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a98987aa2784..b88d8bfe992e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2218,7 +2218,6 @@ config FB_SSD1307
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
 	select FB_DEFERRED_IO
-	select PWM
 	select FB_BACKLIGHT
 	help
 	  This driver implements support for the Solomon SSD1307
-- 
2.35.1

