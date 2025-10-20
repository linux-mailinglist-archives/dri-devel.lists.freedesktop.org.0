Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045CEBF16DB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3D710E432;
	Mon, 20 Oct 2025 13:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1jOkYyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37DE10E432
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760965586; x=1792501586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wAI0xMkSnbhaSLTqgomUxHh2ZZalda3QNhhiLBoAQgI=;
 b=J1jOkYyOw65Gl7I5dB68E30rH7C59DSgCMhxqOhoPfkR56Sm5nbL3yFR
 pH039HM7N5ALrYbRNfl53PurZGTB5op8YBLQSD1vRf9snz65BOxlYae5u
 gTOyQiso37YfrpZkL0mrFRH1vC5/Vjp84nYzyBMkM9ezbwK0qqr6pku1E
 0SXFZUJVFuEB07yPPjA1QMy0aYCT1e5v0imk2JemS/2Aw2/dkAKLKzlZf
 7mNF6TCDa2DWJemiglH8K3qd44ytXTGeQQpThp24OnUD6OTTEgX1FYIZQ
 gD9KT6/puRi5CKosYwFv1DcRQy2hkIIjOfvWt1w8vpgidw3stQxdV4fTz Q==;
X-CSE-ConnectionGUID: nvzBDQDGRUqsQNTPryPj8g==
X-CSE-MsgGUID: WTkcQEbCRze8zw3yqnO1KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66942897"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66942897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 06:06:26 -0700
X-CSE-ConnectionGUID: 1WMr52nHQFe+l2MAr15/QQ==
X-CSE-MsgGUID: DHmPvODTREu8wI8w65VIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187583943"
Received: from b580.bj.intel.com ([10.238.152.130])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 06:06:23 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zsolt Kajtar <soci@c64.rulez.org>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Junjie Cao <junjie.cao@intel.com>,
 syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
Subject: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
Date: Mon, 20 Oct 2025 21:47:01 +0800
Message-ID: <20251020134701.84082-1-junjie.cao@intel.com>
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

bit_putcs_aligned()/unaligned() derived the glyph pointer from the
character value masked by 0xff/0x1ff, which may exceed the actual font's
glyph count and read past the end of the built-in font array.
Clamp the index to the actual glyph count before computing the address.

This fixes a global out-of-bounds read reported by syzbot.

Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
v1 -> v2:
 - Fix indentation and add blank line after declarations with the .pl helper
 - No functional changes

 drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 9d2e59796c3e..085ffb44c51a 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				     struct fb_image *image, u8 *buf, u8 *dst)
 {
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
+	unsigned int charcnt = vc->vc_font.charcount;
 	u32 idx = vc->vc_font.width >> 3;
 	u8 *src;
 
 	while (cnt--) {
-		src = vc->vc_font.data + (scr_readw(s++)&
-					  charmask)*cellsize;
+		u16 ch = scr_readw(s++) & charmask;
+
+		if (ch >= charcnt)
+			ch = 0;
+		src = vc->vc_font.data + (unsigned int)ch * cellsize;
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 				       u8 *dst)
 {
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
+	unsigned int charcnt = vc->vc_font.charcount;
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
 	u8 *src;
 
 	while (cnt--) {
-		src = vc->vc_font.data + (scr_readw(s++)&
-					  charmask)*cellsize;
+		u16 ch = scr_readw(s++) & charmask;
+
+		if (ch >= charcnt)
+			ch = 0;
+		src = vc->vc_font.data + (unsigned int)ch * cellsize;
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
-- 
2.48.1

