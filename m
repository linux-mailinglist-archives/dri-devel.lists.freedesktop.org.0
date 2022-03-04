Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C944CDD59
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 20:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B4210E501;
	Fri,  4 Mar 2022 19:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058AE10E501
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646422453; x=1677958453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=prSCg+P2w+6rp7GYMZxEjueC6DVV7pXYvo+J6n3NE1o=;
 b=X3VdjIPUNdSCWvenZ+CHQhfPcknQK8zmQyLjAxiTsft5ySmXK6P0SmYj
 So2Bn0LHPvP4aaVXWjOv3ZIy1wd1JsZaJEtboYXqEkcRpPr/jJOtBn0Or
 NK8Lwr3jmFMcM9hOmp1zO6JDSQDuOGlGEhmPI2z5bym4P4MrqZp7yS4Au
 RsEtz3U63kEOFKQ8Sxbn1UnzIZMMDGb+ILjZU6cm9F7ZhlVmxmFshDOq+
 uxHuOqc5Cb6Wx3bvs61+XUVt0Oti7MKZuowrN/GZaxxEQUDAV1Ct045Bh
 MVYBrfYxDYZDnUooxrtqrBK+9lzYtXrIao+20SG/mDQVsnUTaArDttb18 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="251621736"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="251621736"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 11:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="511959167"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 04 Mar 2022 11:33:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4AD81A7; Fri,  4 Mar 2022 21:34:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence values
 in fbtft_init_display()
Date: Fri,  4 Mar 2022 21:34:14 +0200
Message-Id: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the fbtft_init_display() the init sequence is printed for
the debug purposes. Unfortunately the current code doesn't take
into account that values in the buffer are of the s16 type.

Consider that and replace the printing code with fbtft_par_dbg_hex()
call.

Fixes: b888897014a9 ("staging/fbtft: Remove all strcpy() uses")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4a35347b3020..b28a059ad3b4 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1035,10 +1035,9 @@ int fbtft_init_display(struct fbtft_par *par)
 			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
 				;
 
-			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
-				      "init: write(0x%02X) %*ph\n",
-				      par->init_sequence[i], j,
-				      &par->init_sequence[i + 1]);
+			fbtft_par_dbg_hex(DEBUG_INIT_DISPLAY, par, par->info->device,
+					  s16, &par->init_sequence[i + 1], j,
+					  "init: write(0x%02X)", par->init_sequence[i]);
 
 			/* Write */
 			j = 0;
-- 
2.34.1

