Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA56A3FD84
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 18:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB4110E228;
	Fri, 21 Feb 2025 17:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mfwduxJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E7210E228
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Y3q5SEZ22PIlzGuL/p51TBUcu7BuCGZLgTAPxKOn4WE=; b=mfwduxJQZv1iIbvGuFxS8NULnT
 WF/z8ONiiCdtuqi90QA5YkhyfYqGA+fhoJ1lHxGZkEretuIMA2HKggJF4cm8Xh0QK+Rn6CCwefAbz
 iCpL3spMKUFPtI1oTRdrar+x+WmshCut9jlUML8gwB0MVlOxJDmXG6mSCw4img7n+cDAC5wNlmVsK
 gSsgllRwaeVl5Efs1L52KxZ5StRZcjdQyKFvOy4Ril7jrqCGPm4wIkRnOQy30okc+XwiOL9gu7BBO
 cWkjau1NnIXmByPCpbr61A/9o9LVdQvEoaXTQpX9NIj1CItTGG66q+L/b0W06y1nPiXrm5/Cx+ap1
 zriGYDvA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tlWs9-0000000EYtb-37Jg; Fri, 21 Feb 2025 17:31:33 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [PATCH] fbtft: Remove access to page->index
Date: Fri, 21 Feb 2025 17:31:29 +0000
Message-ID: <20250221173131.3470667-1-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to print out page->index as part of the debug message.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/staging/fbtft/fbtft-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4cfa494243b9..da9c64152a60 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -337,9 +337,7 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 	list_for_each_entry(pageref, pagereflist, list) {
 		y_low = pageref->offset / info->fix.line_length;
 		y_high = (pageref->offset + PAGE_SIZE - 1) / info->fix.line_length;
-		dev_dbg(info->device,
-			"page->index=%lu y_low=%d y_high=%d\n",
-			pageref->page->index, y_low, y_high);
+		dev_dbg(info->device, "y_low=%d y_high=%d\n", y_low, y_high);
 		if (y_high > info->var.yres - 1)
 			y_high = info->var.yres - 1;
 		if (y_low < dirty_lines_start)
-- 
2.47.2

