Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF6367039
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 18:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065846E9BC;
	Wed, 21 Apr 2021 16:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7825E6E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 16:31:58 +0000 (UTC)
IronPort-SDR: fkS/+04QrIJPeln8HsNlJdOkQKd4fRypGMxsC/2OWtxrfw3TRadaiMn7UrB0Gxr+N/YY7kxroO
 SkZKEv+ieDkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="193609070"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="193609070"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 09:31:58 -0700
IronPort-SDR: +awME68o3LU6XESKpXUuI+gGA1VHq6tI9n/JGQahZplVcquFGyEcKCeNGVBpAxEkd6Q3sas8WK
 Dym5vSbBRkGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="455406202"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 09:31:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E43F42B8; Wed, 21 Apr 2021 19:32:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] drm/ili9225: Avoid spamming logs if probe is deferred
Date: Wed, 21 Apr 2021 19:31:56 +0300
Message-Id: <20210421163157.50949-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421163157.50949-1-andriy.shevchenko@linux.intel.com>
References: <20210421163157.50949-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPIO request can fail and probe may be deferred. Thus,
the error message may be printed again and again. Avoid
this by replacing DRM_DEV_ERROR() by dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/tiny/ili9225.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 8e98962db5a2..db89cced67df 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -379,16 +379,12 @@ static int ili9225_probe(struct spi_device *spi)
 	drm = &dbidev->drm;
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dbi->reset)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
-		return PTR_ERR(dbi->reset);
-	}
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
 	rs = devm_gpiod_get(dev, "rs", GPIOD_OUT_LOW);
-	if (IS_ERR(rs)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'rs'\n");
-		return PTR_ERR(rs);
-	}
+	if (IS_ERR(rs))
+		return dev_err_probe(dev, PTR_ERR(rs), "Failed to get GPIO 'rs'\n");
 
 	device_property_read_u32(dev, "rotation", &rotation);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
