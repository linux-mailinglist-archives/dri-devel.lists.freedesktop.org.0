Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADD278138
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FCC6EC1F;
	Fri, 25 Sep 2020 07:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912906E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 5so1935267pgf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXp4SMdhtGATfhHsl/+G06GlWj8IVOPfotDaVzkM7uw=;
 b=OtlvbpXF/ECfXRYBaiRcIpx2pOm3Z1RMgW1qGBA/sQ1DL0+a0Bcli09oIxL3wSwJXu
 oSwn2lwketEYcopnYRPPuESf9U4i+NbtjyozQIBtW06rGmd0TJj2rexyS6SAXoz33UmT
 M90QkLUoDK+GT2kzIQSQnQ6UG25KQ6ssQL6D3rdTVY1ltRb4YRsAW8hp0hJa8f6diefB
 MG3hFfcLuCzwBAU32ALcd0WPYXetuLK9FbXq27Fxj1p+WOJxwSMLNYT2gV5/QJL47JAT
 9D46CSzYubZW8Ho5DfCqEbZ1M24UF7xVaP6RW9dOA1c79qjSEKboPvHj64Rg+Gcc1j3G
 E/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXp4SMdhtGATfhHsl/+G06GlWj8IVOPfotDaVzkM7uw=;
 b=cV4chTCHvNfbRoBbWtSLfHboxA1LUPD1lPSrFylg/st6l7N5wA7LnGldQZFH4ii5p4
 7QwcInJqM3FNED+FP/6ZGkK1saOF+J5tKw5FzHRU9DvDum/IajCV/v9+xz57ID/gnnsn
 VRNLv54yPWlXnQ6Mb86Snf948H5ACyuNDweiHGEpaBz1pJ4wzu3BDwaXOhWkaszwXJpd
 Lh+RBD/O4OvnO0cQmrITxjF3zTE5mZZse8d1tS2lpSkoJo7WtA2FV3O3Yl1Wd6xfdU/6
 KlEbTjIbDZ+u9X8VNZb+JvNjuMX+RAXyL7UYpugeBdkc7/im7eXVFnu/mJKAHU1+p2LN
 nHkA==
X-Gm-Message-State: AOAM530z1eMzKE4mu7JcyKZVb3EMeTmd16xOXDUQ1A4NwV0pmi7msnky
 wVngDirGnJ680himG1/nOQ==
X-Google-Smtp-Source: ABdhPJzXYqCs3PJDgKW5fdZ3Dh5AiaT47Pde38vaglC/Rl/0Pmj57uGXtxvq7ubpnQ73YLUxLhiy0A==
X-Received: by 2002:a63:a26:: with SMTP id 38mr1299965pgk.118.1600955104158;
 Thu, 24 Sep 2020 06:45:04 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id o5sm2534926pjs.13.2020.09.24.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:45:03 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/3] fbcon: Fix global-out-of-bounds read in fbcon_get_font()
Date: Thu, 24 Sep 2020 09:43:48 -0400
Message-Id: <b34544687a1a09d6de630659eb7a773f4953238b.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ef18af00c35fb3cc826048a5f70924ed6ddce95b.1600953813.git.yepeilin.cs@gmail.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
 <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
 <ef18af00c35fb3cc826048a5f70924ed6ddce95b.1600953813.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon_get_font() is reading out-of-bounds. A malicious user may resize
`vc->vc_font.height` to a large value, causing fbcon_get_font() to
read out of `fontdata`.

fbcon_get_font() handles both built-in and user-provided fonts.
Fortunately, recently we have added FONT_EXTRA_WORDS support for built-in
fonts, so fix it by adding range checks using FNTSIZE(). 

This patch depends on patch "fbdev, newport_con: Move FONT_EXTRA_WORDS
macros into linux/font.h", and patch "Fonts: Support FONT_EXTRA_WORDS
macros for built-in fonts".

Cc: stable@vger.kernel.org
Reported-and-tested-by: syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 66167830fefd..bda24c64e646 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2492,6 +2492,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 
 	if (font->width <= 8) {
 		j = vc->vc_font.height;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 32 - j);
@@ -2500,6 +2503,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 		}
 	} else if (font->width <= 16) {
 		j = vc->vc_font.height * 2;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 64 - j);
@@ -2507,6 +2513,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 			fontdata += j;
 		}
 	} else if (font->width <= 24) {
+		if (font->charcount * (vc->vc_font.height * sizeof(u32)) > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			for (j = 0; j < vc->vc_font.height; j++) {
 				*data++ = fontdata[0];
@@ -2519,6 +2528,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 		}
 	} else {
 		j = vc->vc_font.height * 4;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 128 - j);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
