Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF1BEE8F7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 17:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614910E07A;
	Sun, 19 Oct 2025 15:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nz+rcMfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDC510E07A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760889241; x=1792425241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5PN7GETpS9idJ617+SVI/czLHfb0EdEQ3+7TWAzs2g=;
 b=Nz+rcMfPiH2PORYUx9lvqOFtiiT7EeTtclt3GYrdIQTC7I7H+BQsrSin
 308oMYWB12PP/WT7TEDz2xJpvD3rNR0lwmJnWxjeQY3PftKI6TyVfFEMz
 rygRpvfclMgS0yUjcCYIaNKNED/PMwxw8npzREVHfk71rUlW+Th5gykYj
 ZZG0bPA3f6wM5jdDxN0uzMANB/92a4yV6RbOga2aq/DsT7xwULQdKrnaq
 HLEYUbOJvXNYNv2+8O1vyySX7WLa68HyZf6WmLfYQTt4EETTmZp+DVirQ
 m4M6EzmI3V486e9hjTklFcedVLsSw4ieprOzoYCny019rxm70uEQspBuh A==;
X-CSE-ConnectionGUID: ENkaIWK5Ttu8OIKJjEUlKA==
X-CSE-MsgGUID: sCuHblULRnW34zuHPbE1yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63176438"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="63176438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 08:54:01 -0700
X-CSE-ConnectionGUID: /I3oDpP5Rh6VrkNMutR1iw==
X-CSE-MsgGUID: BEz4SnD1QVSNszj/RQDlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="182979301"
Received: from b580.bj.intel.com ([10.238.152.130])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 08:53:58 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zsolt Kajtar <soci@c64.rulez.org>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Junjie Cao <junjie.cao@intel.com>,
 syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: bitblit: bound-check glyph index in bit_putcs*
Date: Mon, 20 Oct 2025 07:53:31 +0800
Message-ID: <20251019235331.1243671-1-junjie.cao@intel.com>
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
 drivers/video/fbdev/core/bitblit.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index a9ec7f488522..710883831826 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -79,12 +79,15 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
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
+	if (ch >= charcnt)
+		ch = 0;
+	src = vc->vc_font.data + (unsigned int)ch * cellsize;
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -112,14 +115,17 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
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
+	if (ch >= charcnt)
+		ch = 0;
+	src = vc->vc_font.data + (unsigned int)ch * cellsize;
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
-- 
2.48.1

