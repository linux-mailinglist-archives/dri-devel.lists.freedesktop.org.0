Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B12B96876
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F93110E1D3;
	Tue, 23 Sep 2025 15:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 547 seconds by postgrey-1.36 at gabe;
 Tue, 23 Sep 2025 15:16:35 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB0610E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 1FA9C3F116;
 Tue, 23 Sep 2025 17:07:24 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>, stable <stable@vger.kernel.org>
Subject: [PATCH] fbcon: fix buffer overflow in fbcon_set_font
Date: Wed, 24 Sep 2025 00:06:28 +0900
Message-ID: <20250923150642.2441-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
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

Commit 1a194e6c8e1ee745e914b0b7f50fa86c89ed13fe introduced overflow
checking for the font allocation size calculation, but in doing so moved
the addition of the size for font housekeeping data out of the kmalloc
call.

As a result, the calculated size now includes those extra bytes, which
marks the same number of bytes beyond the allocation as valid font data.

The crc32() call and the later memcmp() in fbcon_set_font() already perform
an out-of-bounds read, the latter is flagged on ppc64el:

    memcmp: detected buffer overflow: 4112 byte read of buffer size 4096

when loading Lat15-Fixed16.psf.gz.

Since the addition of the extra size should only go into the kmalloc()
call, calculate this size in a separate variable.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
Fixes: 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
Cc: stable <stable@vger.kernel.org> #v5.9+
---
 drivers/video/fbdev/core/fbcon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 5fade44931b8..a3fbf42c57d9 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2518,7 +2518,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	unsigned charcount = font->charcount;
 	int w = font->width;
 	int h = font->height;
-	int size;
+	int size, allocsize;
 	int i, csum;
 	u8 *new_data, *data = font->data;
 	int pitch = PITCH(font->width);
@@ -2551,10 +2551,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 		return -EINVAL;
 
 	/* Check for overflow in allocation size calculation */
-	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
+	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &allocsize))
 		return -EINVAL;
 
-	new_data = kmalloc(size, GFP_USER);
+	new_data = kmalloc(allocsize, GFP_USER);
 
 	if (!new_data)
 		return -ENOMEM;
-- 
2.47.3

