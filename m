Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB01FA3E9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEDB6E550;
	Mon, 15 Jun 2020 23:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E06E550
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:10:24 +0000 (UTC)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D51EC2068E;
 Mon, 15 Jun 2020 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592262623;
 bh=7RV+LZohdXGjxU20nhjS42pqNFlJCzFWcJTRRTFiDDc=;
 h=Date:From:To:Cc:Subject:From;
 b=CEs4aLG5bPIwZbrsvC2dSFTmKvPInHk5eson9VqbhFdXVH0XydZjGHGGolJ1XST+g
 mlNkDLx5IU3HQg59/H7h47facnlBhyRq+gX3NcxcZ6UcYuXoBExfajLH22hE+PRHfu
 BpG1T8V0uj1NWRhG3TsLNA7PQU73D1kX15FUM8YM=
Date: Mon, 15 Jun 2020 18:15:42 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH][next] fbcon: Use array3_size() helper in scr_memcpyw()
Message-ID: <20200615231542.GA20470@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use array3_size() helper instead of the open-coded version in scr_memcpyw()
and scr_memsetw(). These sorts of multiplication factors need to be wrapped
in array3_size().

This issue was found with the help of Coccinelle and, audited and fixed
manually.

Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 9d28a8e3328f..6af2734f2a7b 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -639,7 +639,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 			       GFP_KERNEL);
 		if (save) {
 			int i = cols < new_cols ? cols : new_cols;
-			scr_memsetw(save, erase, logo_lines * new_cols * 2);
+			scr_memsetw(save, erase, array3_size(logo_lines, new_cols, 2));
 			r = q - step;
 			for (cnt = 0; cnt < logo_lines; cnt++, r += i)
 				scr_memcpyw(save + cnt * new_cols, r, 2 * i);
@@ -676,7 +676,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 		q = (unsigned short *) (vc->vc_origin +
 					vc->vc_size_row *
 					rows);
-		scr_memcpyw(q, save, logo_lines * new_cols * 2);
+		scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2));
 		vc->vc_y += logo_lines;
 		vc->vc_pos += logo_lines * vc->vc_size_row;
 		kfree(save);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
