Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44204DB6C1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A359110E8CB;
	Wed, 16 Mar 2022 16:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32F10E8CC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647449625; x=1678985625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+siQ0CJV8sIl5v5e72rj8Q6p8jCbZEt28U8U4nLaIAM=;
 b=GhE861RGrnVQjBv26nerhuyJQeA/K9ZexPcnWL1WancBCOTQ02Ib2vwE
 DxYp5e0K2I8vaQhI3CfFZpA8c9wxXlQ02VlmWywT59Z7nNQl2y8S9cn8/
 y18i0VcUnSnOE9lWSuLAftC/r0z0bbe3byba3zIvZ72THjdsT/vIF7xV4
 S099hUfRo2EfBR+ETIN3pAhA0/5lUD4+Ii0DvoZ8Wl3zFyyviRSxlv1ky
 VL7l3u7ONPzDToqUzhAVps3O4E/7HoHjTegfvK2AUAXivt9sdn0wHwAp6
 B7kbS0OQKJp36JeVDDLb+HZyzj4itE+XxoVryYrNcdyviYcuXB3kjd/BD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="281444437"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="281444437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="598790953"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2022 09:53:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 59E14107; Wed, 16 Mar 2022 18:53:54 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: fbtft: Constify buf parameter in
 fbtft_dbg_hex()
Date: Wed, 16 Mar 2022 18:53:50 +0200
Message-Id: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
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

It's obvious that we don't and shouldn't modify buffer that
is about to be dumped. Constify parameter in fbtft_dbg_hex()
to make it clear.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch to fix a warning (Greg)
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 drivers/staging/fbtft/fbtft.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f2684d2d6851..6dc77895a87c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -49,7 +49,7 @@ int fbtft_write_buf_dc(struct fbtft_par *par, void *buf, size_t len, int dc)
 EXPORT_SYMBOL(fbtft_write_buf_dc);
 
 void fbtft_dbg_hex(const struct device *dev, int groupsize,
-		   void *buf, size_t len, const char *fmt, ...)
+		   const void *buf, size_t len, const char *fmt, ...)
 {
 	va_list args;
 	static char textbuf[512];
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 55677efc0138..c3d8b2aae607 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -240,7 +240,7 @@ struct fbtft_par {
 int fbtft_write_buf_dc(struct fbtft_par *par, void *buf, size_t len, int dc);
 __printf(5, 6)
 void fbtft_dbg_hex(const struct device *dev, int groupsize,
-		   void *buf, size_t len, const char *fmt, ...);
+		   const void *buf, size_t len, const char *fmt, ...);
 struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 					struct device *dev,
 					struct fbtft_platform_data *pdata);
-- 
2.35.1

