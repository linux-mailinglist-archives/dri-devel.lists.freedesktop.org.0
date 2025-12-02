Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1BC9C9CE
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE36210E6A4;
	Tue,  2 Dec 2025 18:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="QU3gFqS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Tue, 02 Dec 2025 18:22:32 UTC
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8110E6A4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:22:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1764699418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pl72qzIOzrYUk8v9JNDm8vYai5+J2tm/+q9u/2KEJQg=;
 b=QU3gFqS82ZU9PLt/RC6mfJ3vzXtBVuZkYYa8LQsocu/eqqHZuyshvW7lqYb5vddPkY27rE
 oZ9ZBYCtF5/tr33zIHsCW5R4XcFmCq78N+IWTh+62JRO3Bvtu6Qlcq2blwT4RXsUpo5Uet
 HwSIen91KQK5rRHOGlyL+3vScF6kojs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Helge Deller <deller@gmx.de>,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
Date: Tue,  2 Dec 2025 19:15:32 +0100
Message-ID: <20251202181600.511166-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The variables were never clamped because the return value of clamp_val()
was not used. Fix this by assigning the clamped values, and use clamp()
instead of clamp_val().

Cc: stable@vger.kernel.org
Fixes: 3f16ff608a75 ("[ARM] pxafb: cleanup of the timing checking code")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/video/fbdev/pxafb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index b96a8a96bce8..e418eee825fb 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -419,12 +419,12 @@ static int pxafb_adjust_timing(struct pxafb_info *fbi,
 	var->yres = max_t(int, var->yres, MIN_YRES);
 
 	if (!(fbi->lccr0 & LCCR0_LCDT)) {
-		clamp_val(var->hsync_len, 1, 64);
-		clamp_val(var->vsync_len, 1, 64);
-		clamp_val(var->left_margin,  1, 255);
-		clamp_val(var->right_margin, 1, 255);
-		clamp_val(var->upper_margin, 1, 255);
-		clamp_val(var->lower_margin, 1, 255);
+		var->hsync_len = clamp(var->hsync_len, 1, 64);
+		var->vsync_len = clamp(var->vsync_len, 1, 64);
+		var->left_margin  = clamp(var->left_margin,  1, 255);
+		var->right_margin = clamp(var->right_margin, 1, 255);
+		var->upper_margin = clamp(var->upper_margin, 1, 255);
+		var->lower_margin = clamp(var->lower_margin, 1, 255);
 	}
 
 	/* make sure each line is aligned on word boundary */
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

