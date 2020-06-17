Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F361FD3BC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 19:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7866E9FC;
	Wed, 17 Jun 2020 17:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3429F6E9FC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 17:51:28 +0000 (UTC)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6562421527;
 Wed, 17 Jun 2020 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592416287;
 bh=U94GeFraD01aVQEM8vl0Oh3vdf1LW+6sHme4vUAVTcs=;
 h=Date:From:To:Cc:Subject:From;
 b=HgiE+iQsxkKj1piB7LAgU1JiiOlZZ49+RlrRCXfbLUMEwSBpXPuZRtHNKTgCfLq3k
 xLikeI01z5XBmS4nX02fm0hjslVKjpOWS8xFwuiLE7tr/UXhSC+DtI6QZN4f3+MmH+
 mmuivD/x1ZkhF5iR0tCF+LK8sp+V/LjFmh8o6U5o=
Date: Wed, 17 Jun 2020 12:56:47 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH][next] fbdev/fb.h: Use struct_size() helper in kzalloc()
Message-ID: <20200617175647.GA26370@embeddedor>
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

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

This code was detected with the help of Coccinelle and, audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/linux/fb.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3b4b2f0c6994..2b530e6d86e4 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -506,8 +506,9 @@ struct fb_info {
 };
 
 static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
-	struct apertures_struct *a = kzalloc(sizeof(struct apertures_struct)
-			+ max_num * sizeof(struct aperture), GFP_KERNEL);
+	struct apertures_struct *a;
+
+	a = kzalloc(struct_size(a, ranges, max_num), GFP_KERNEL);
 	if (!a)
 		return NULL;
 	a->count = max_num;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
