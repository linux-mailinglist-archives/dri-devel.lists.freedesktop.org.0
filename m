Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D536703B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 18:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8426E9D5;
	Wed, 21 Apr 2021 16:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3864D6E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 16:32:10 +0000 (UTC)
IronPort-SDR: AbQENlU89NnOi4E0H8Wqa6a/Z//XTLZdyGHbLXDVs14k7mxKYHhlQwUztLG3BTGgR64k3cFYTG
 SRyLjFxmWJqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="257043083"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="257043083"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 09:31:55 -0700
IronPort-SDR: GOya5ek2+uiIv+P8uzWsNJ+SGq06mCM2Tix19vsMpSPyVUs0m7DsuZ+IWBVK4Pq4ilL+y3G5hg
 kUHzpIsuSZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="445985933"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2021 09:31:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C64E61C8; Wed, 21 Apr 2021 19:32:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] drm/mi0283qt: Avoid spamming logs if probe is deferred
Date: Wed, 21 Apr 2021 19:31:53 +0300
Message-Id: <20210421163157.50949-3-andriy.shevchenko@linux.intel.com>
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
 drivers/gpu/drm/tiny/mi0283qt.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index ff77f983f803..c90b5dee7761 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -196,16 +196,12 @@ static int mi0283qt_probe(struct spi_device *spi)
 	drm = &dbidev->drm;
 
 	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dbi->reset)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
-		return PTR_ERR(dbi->reset);
-	}
+	if (IS_ERR(dbi->reset))
+		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
 	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
-	if (IS_ERR(dc)) {
-		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
-		return PTR_ERR(dc);
-	}
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 
 	dbidev->regulator = devm_regulator_get(dev, "power");
 	if (IS_ERR(dbidev->regulator))
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
