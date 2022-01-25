Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0D49BCDF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 21:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF88210E356;
	Tue, 25 Jan 2022 20:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE51410E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643142074; x=1674678074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lUZK4l/4nhTIU+qINgzNeJUNGAB8cORP+SXj5e08x/Q=;
 b=JT63my6YUBZ5oS23jwNNmr0itxgW+V/OEtK3qF27JIuEQuXSMJTtlXE8
 ryBqioh7OCkIfmzmRaOOcoUOlPCtWoxPOe6kKjVJTtSvO94cBQuh9UOVq
 Vw9F4IWPi4RkuhAJTdej9A5wCX4FfX6D88CMvtbs2h9bYC10lbttMTRS7
 aY25dbLeugticMsdiLC5Ij45DDUNsVGTMkZMJi8uOCaaSnFMR0SxlYOPt
 gLW3JMOzYN0BX+W200qiV2HrV7VLqE/UoWFxcjT5X9c+W+/KQ19cPs/gx
 46TFDaxyhsMJ6esM8b1hsK3H9e8hdKcNZ4EIJSeKGy3PuLekDtZd4jiZw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307125506"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="307125506"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 12:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="477249110"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 12:21:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5E917FD; Tue, 25 Jan 2022 22:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Date: Tue, 25 Jan 2022 22:21:13 +0200
Message-Id: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we got a maintainer for fbdev, I would like to
unorphan fbtft (with the idea of sending PRs to Helge)
and move it out of staging since there is no more clean
up work expected and no more drivers either.

Thoughts?

Andy Shevchenko (4):
  fbtft: Unorphan the driver
  fbtft: Move driver out from staging
  fbtft: Kill outdated documentation
  fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'

 MAINTAINERS                                   |  6 ++--
 drivers/staging/Kconfig                       |  2 --
 drivers/staging/Makefile                      |  1 -
 drivers/staging/fbtft/README                  | 32 ------------------
 drivers/staging/fbtft/TODO                    |  3 --
 drivers/video/Kconfig                         |  1 +
 drivers/video/Makefile                        |  1 +
 drivers/{staging => video}/fbtft/Kconfig      | 33 +++----------------
 drivers/{staging => video}/fbtft/Makefile     |  0
 .../{staging => video}/fbtft/fb_agm1264k-fl.c |  0
 .../{staging => video}/fbtft/fb_bd663474.c    |  0
 .../{staging => video}/fbtft/fb_hx8340bn.c    |  0
 drivers/{staging => video}/fbtft/fb_hx8347d.c |  0
 drivers/{staging => video}/fbtft/fb_hx8353d.c |  0
 drivers/{staging => video}/fbtft/fb_hx8357d.c |  0
 drivers/{staging => video}/fbtft/fb_hx8357d.h |  0
 drivers/{staging => video}/fbtft/fb_ili9163.c |  0
 drivers/{staging => video}/fbtft/fb_ili9320.c |  0
 drivers/{staging => video}/fbtft/fb_ili9325.c |  0
 drivers/{staging => video}/fbtft/fb_ili9340.c |  0
 drivers/{staging => video}/fbtft/fb_ili9341.c |  0
 drivers/{staging => video}/fbtft/fb_ili9481.c |  0
 drivers/{staging => video}/fbtft/fb_ili9486.c |  0
 drivers/{staging => video}/fbtft/fb_pcd8544.c |  0
 drivers/{staging => video}/fbtft/fb_ra8875.c  |  0
 drivers/{staging => video}/fbtft/fb_s6d02a1.c |  0
 drivers/{staging => video}/fbtft/fb_s6d1121.c |  0
 drivers/{staging => video}/fbtft/fb_seps525.c |  0
 drivers/{staging => video}/fbtft/fb_sh1106.c  |  0
 drivers/{staging => video}/fbtft/fb_ssd1289.c |  0
 drivers/{staging => video}/fbtft/fb_ssd1305.c |  0
 drivers/{staging => video}/fbtft/fb_ssd1306.c |  0
 drivers/{staging => video}/fbtft/fb_ssd1325.c |  0
 drivers/{staging => video}/fbtft/fb_ssd1331.c |  0
 drivers/{staging => video}/fbtft/fb_ssd1351.c |  0
 drivers/{staging => video}/fbtft/fb_st7735r.c |  0
 drivers/{staging => video}/fbtft/fb_st7789v.c |  0
 drivers/{staging => video}/fbtft/fb_tinylcd.c |  0
 drivers/{staging => video}/fbtft/fb_tls8204.c |  0
 drivers/{staging => video}/fbtft/fb_uc1611.c  |  0
 drivers/{staging => video}/fbtft/fb_uc1701.c  |  0
 .../{staging => video}/fbtft/fb_upd161704.c   |  0
 drivers/{staging => video}/fbtft/fbtft-bus.c  |  0
 drivers/{staging => video}/fbtft/fbtft-core.c |  0
 drivers/{staging => video}/fbtft/fbtft-io.c   |  0
 .../{staging => video}/fbtft/fbtft-sysfs.c    |  0
 drivers/{staging => video}/fbtft/fbtft.h      |  0
 drivers/{staging => video}/fbtft/internal.h   |  0
 48 files changed, 10 insertions(+), 69 deletions(-)
 delete mode 100644 drivers/staging/fbtft/README
 delete mode 100644 drivers/staging/fbtft/TODO
 rename drivers/{staging => video}/fbtft/Kconfig (89%)
 rename drivers/{staging => video}/fbtft/Makefile (100%)
 rename drivers/{staging => video}/fbtft/fb_agm1264k-fl.c (100%)
 rename drivers/{staging => video}/fbtft/fb_bd663474.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8340bn.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8347d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8353d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8357d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8357d.h (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9163.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9320.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9325.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9340.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9341.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9481.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9486.c (100%)
 rename drivers/{staging => video}/fbtft/fb_pcd8544.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ra8875.c (100%)
 rename drivers/{staging => video}/fbtft/fb_s6d02a1.c (100%)
 rename drivers/{staging => video}/fbtft/fb_s6d1121.c (100%)
 rename drivers/{staging => video}/fbtft/fb_seps525.c (100%)
 rename drivers/{staging => video}/fbtft/fb_sh1106.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1289.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1305.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1306.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1325.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1331.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1351.c (100%)
 rename drivers/{staging => video}/fbtft/fb_st7735r.c (100%)
 rename drivers/{staging => video}/fbtft/fb_st7789v.c (100%)
 rename drivers/{staging => video}/fbtft/fb_tinylcd.c (100%)
 rename drivers/{staging => video}/fbtft/fb_tls8204.c (100%)
 rename drivers/{staging => video}/fbtft/fb_uc1611.c (100%)
 rename drivers/{staging => video}/fbtft/fb_uc1701.c (100%)
 rename drivers/{staging => video}/fbtft/fb_upd161704.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-bus.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-core.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-io.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-sysfs.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft.h (100%)
 rename drivers/{staging => video}/fbtft/internal.h (100%)

-- 
2.34.1

