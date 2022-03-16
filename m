Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2A04DB6BE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A2E10E8CA;
	Wed, 16 Mar 2022 16:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DAE10E8C8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647449620; x=1678985620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67HJ5xsUQCH77LSjNv9g0hLBWeBJ7D0jAoL2UnUtLbY=;
 b=aWRH9ZX8P9G9VOAwKjT0z067+U4PslJxZfjc2StkklK2QBYgObPZNF+E
 NAbqcnA8poCf33Cs4PGN5SvpQfZWiOdkPlCwasvPKG8JFFzKBMZModPqB
 JiWugmA4qKPwyvsML/NcKTc6RKZHZNTxGB8Yyifab85S2462PmNSY5Y0K
 ItF/1whE2EdtA/4TfB9cKjgzdgeGAYXdIGcfRiQMm9ASY/Znefj5xQVEH
 xfBdMs46dpvJw0AXYlRu57yHpZDNOtpgXlXWCvvFjijxvklXtSZwVGPrz
 DoRlHoXSSfZ35fX7yKH2cTiYvhGOcj5nN8dZPjVefitYP6Kfi4ivE3pbQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="343095787"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="343095787"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="513107709"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2022 09:53:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7D8E3192; Wed, 16 Mar 2022 18:53:55 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: fbtft: Consider type of init sequence values
 in fbtft_init_display()
Date: Wed, 16 Mar 2022 18:53:51 +0200
Message-Id: <20220316165351.58107-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
References: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
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

In the fbtft_init_display() the init sequence is printed for
the debug purposes. Unfortunately the current code doesn't take
into account that values in the buffer are of the s16 type.

Consider that and replace the printing code with fbtft_par_dbg_hex()
call.

Fixes: b888897014a9 ("staging/fbtft: Remove all strcpy() uses")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes, just based on prerequisite
 drivers/staging/fbtft/fbtft-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 6dc77895a87c..3b182115bd6e 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1034,10 +1034,9 @@ int fbtft_init_display(struct fbtft_par *par)
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
2.35.1

