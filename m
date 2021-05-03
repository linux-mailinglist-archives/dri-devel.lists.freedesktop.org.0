Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A9371E5D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12AC6E9E6;
	Mon,  3 May 2021 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76CB6E9E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:21:05 +0000 (UTC)
IronPort-SDR: ixHQxsESqNRoGOEAQuoQSd5AEiux7YH30POYUVc2J2l+9RdDDTecSEXnmzyzArMTVLJtmmNQmc
 zqb19WPXCXmA==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="177326318"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="177326318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:21:02 -0700
IronPort-SDR: VrOy76AmqL4T0zx2YUWVBg0Fv1E91Qppz4mp+c/5r3/3lWJQrPK0ypGqdfbZu+NHR3lcBMLMk6
 nr5JcqrYUv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="450456779"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 May 2021 10:21:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id AA8C414B; Mon,  3 May 2021 20:21:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] staging: fbtft: Fixing GPIO handling issues
Date: Mon,  3 May 2021 20:21:09 +0300
Message-Id: <20210503172114.27891-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a number of GPIO handling issues after converting this driver
to use descriptors.

The series has been tested on HX8347d display with parallel interface. Without
first patch it's not working.

In v4:
- fixed Fixes tags (Greg)
- added return statement to dev_err_probe() (Dan)
- new patch to support orientation on HX8347d

In v3:
- added staging prefix (Fabio)
- slightly amended commit message in the patch 1
- added Rb tag (Phil)
- dropped Fixes tag from the patch 2 (Greg)

Andy Shevchenko (5):
  staging: fbtft: Rectify GPIO handling
  staging: fbtft: Don't spam logs when probe is deferred
  staging: fbtft: Add support for orientation on Himax HX8347d
  staging: fbtft: Replace custom ->reset() with generic one
  staging: fbtft: Update TODO

 drivers/staging/fbtft/TODO             |  5 -----
 drivers/staging/fbtft/fb_agm1264k-fl.c | 30 +++++++-------------------
 drivers/staging/fbtft/fb_bd663474.c    |  4 ----
 drivers/staging/fbtft/fb_hx8347d.c     | 29 ++++++++++++++++++++++---
 drivers/staging/fbtft/fb_ili9163.c     |  4 ----
 drivers/staging/fbtft/fb_ili9320.c     |  1 -
 drivers/staging/fbtft/fb_ili9325.c     |  4 ----
 drivers/staging/fbtft/fb_ili9340.c     |  1 -
 drivers/staging/fbtft/fb_s6d1121.c     |  4 ----
 drivers/staging/fbtft/fb_sh1106.c      |  1 -
 drivers/staging/fbtft/fb_ssd1289.c     |  4 ----
 drivers/staging/fbtft/fb_ssd1325.c     |  2 --
 drivers/staging/fbtft/fb_ssd1331.c     |  6 ++----
 drivers/staging/fbtft/fb_ssd1351.c     |  1 -
 drivers/staging/fbtft/fb_upd161704.c   |  4 ----
 drivers/staging/fbtft/fb_watterott.c   |  1 -
 drivers/staging/fbtft/fbtft-bus.c      |  3 +--
 drivers/staging/fbtft/fbtft-core.c     | 25 +++++++++------------
 drivers/staging/fbtft/fbtft-io.c       | 12 +++++------
 19 files changed, 53 insertions(+), 88 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
