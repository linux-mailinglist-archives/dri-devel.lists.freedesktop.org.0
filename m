Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC72278134
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB226EC29;
	Fri, 25 Sep 2020 07:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61506EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:40:03 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d9so1936977pfd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yfOuAbI9UUg6VrnUSeHXgk4nmP275+ivWKv7Dcy/q8=;
 b=PMmQQ6aOHZ+zTXVL+c9oRrZOqYrsOc2Cl/QsXZ6udk4Xk9kFPNuF6QdQu1S9eKKVMR
 oLTKhLfMNejwvYa5JDZFy9W23DstgXeGbBDY9ewFKSW2KDftKh3cqNIunrSxBgLzQ9vm
 g5zdpCrarDa4cg6nOaRoMdtLr78b0TfSuzuwcxTs1HuPR5c6GMBSRVDswl55Eylv3tN7
 ivh0GMHmT6cPtXwbKNzueQdpCshHtCAUXkm52oEYUzqHlamEKt0BBm18wJW+/0MspIqJ
 Q+j0H/wRF8TM3E9Zy7i40/pr1WcCqvwdckV0AF5aQHOUEDnQTsC06Oxh7i04xPqM/o8m
 R76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2yfOuAbI9UUg6VrnUSeHXgk4nmP275+ivWKv7Dcy/q8=;
 b=jRdSR8y3syG8U1KKkM1wIt9M7Cv7q7kW7UkoB4UW79xDmgnWygelbNxWKJYS+ePr/j
 /t2Np6HxM4/xIf3nLx/cIbyXqzLKY62bt2P4c1rUY9joilI0W8r71K+8oQNnr2NUAwcc
 IV6WzMuU0BYile33v5fEee18GBj4y1uRiH/CtkzkXWN2e6RO2ZAVs8rdeeLKvXly3uW0
 iVUxNlB/L45h8OR8qzEj5im/fCh+ErwCayK3XI1JhYv8jjmqUicfdzLQt+vV0uHbHvi4
 kuR8JxIfzAQTxpSjiD5Mt7XBjxi8e5ITNehHfcwo1RWC9+tct9paBnRZwhgGmPvAO9DV
 L7PQ==
X-Gm-Message-State: AOAM5323tJEDWj3uxPrls97n3+fA4H3OTAVnF7yMqNaUi3IJss7CsRmS
 hXqT7MTppKHsmTG5m1AYKQ==
X-Google-Smtp-Source: ABdhPJyy7G4q8VNVUkrM4snz9Kk8FrXM/XKbi5D6uu4gFFKxLMUw8zdONA+NQ6GnVmTzabg2B5ALxA==
X-Received: by 2002:a65:580c:: with SMTP id g12mr4170995pgr.257.1600954803400; 
 Thu, 24 Sep 2020 06:40:03 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id d7sm3171827pgg.1.2020.09.24.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:40:02 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Date: Thu, 24 Sep 2020 09:38:22 -0400
Message-Id: <cover.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0000000000006b9e8d059952095e@google.com>
References: <0000000000006b9e8d059952095e@google.com>
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

Hi all,

syzbot has reported [1] a global out-of-bounds read issue in
fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
font data buffers, declared in lib/fonts/font_*.c:

(e.g. lib/fonts/font_8x8.c)
#define FONTDATAMAX 2048

static const unsigned char fontdata_8x8[FONTDATAMAX] = {

        /* 0 0x00 '^@' */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        [...]

In order to perform a reliable range check, fbcon_get_font() needs to know
`FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
do not keep that information in our font descriptor,
`struct console_font`:

(include/uapi/linux/kd.h)
struct console_font {
	unsigned int width, height;	/* font size */
	unsigned int charcount;
	unsigned char *data;	/* font data with height fixed to 32 */
};

To make things worse, `struct console_font` is part of the UAPI, so we
cannot add a new field to keep track of `FONTDATAMAX`.

Fortunately, the framebuffer layer itself gives us a hint of how to
resolve this issue without changing UAPI. When allocating a buffer for a
user-provided font, fbcon_set_font() reserves four "extra words" at the
beginning of the buffer:

(drivers/video/fbdev/core/fbcon.c)
	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
        [...]
	new_data += FONT_EXTRA_WORDS * sizeof(int);
	FNTSIZE(new_data) = size;
	FNTCHARCNT(new_data) = charcount;
	REFCOUNT(new_data) = 0;	/* usage counter */
        [...]
	FNTSUM(new_data) = csum;

Later, to get the size of a data buffer, the framebuffer layer simply
calls FNTSIZE() on it:

(drivers/video/fbdev/core/fbcon.h)
	/* Font */
	#define REFCOUNT(fd)	(((int *)(fd))[-1])
	#define FNTSIZE(fd)	(((int *)(fd))[-2])
	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
	#define FNTSUM(fd)	(((int *)(fd))[-4])
	#define FONT_EXTRA_WORDS 4

Currently, this is only done for user-provided fonts. Let us do the same
thing for built-in fonts, prepend these "extra words" (including
`FONTDATAMAX`) to their data buffers, so that other subsystems, like the
framebuffer layer, can use these macros on all fonts, no matter built-in
or user-provided. As an example, this series fixes the syzbot issue in
fbcon_get_font():

(drivers/video/fbdev/core/fbcon.c)
 	if (font->width <= 8) {
 		j = vc->vc_font.height;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
	[...]

Similarly, newport_con also use these macros. It only uses three of them:

(drivers/video/console/newport_con.c)
	/* borrowed from fbcon.c */
	#define REFCOUNT(fd)	(((int *)(fd))[-1])
	#define FNTSIZE(fd)	(((int *)(fd))[-2])
	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
	#define FONT_EXTRA_WORDS 3

To keep things simple, move all these macro definitions to <linux/font.h>,
use four words instead of three, and initialize the fourth word in
newport_set_font() properly.

Many thanks to Greg Kroah-Hartman <gregkh@linuxfoundation.org>, who
reviewed and improved this series!

[1]: KASAN: global-out-of-bounds Read in fbcon_get_font
     https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd

Peilin Ye (3):
  fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
  Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
  fbcon: Fix global-out-of-bounds read in fbcon_get_font()

 drivers/video/console/newport_con.c     |  7 +------
 drivers/video/fbdev/core/fbcon.c        | 12 ++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  7 -------
 drivers/video/fbdev/core/fbcon_rotate.c |  1 +
 drivers/video/fbdev/core/tileblit.c     |  1 +
 include/linux/font.h                    | 13 +++++++++++++
 lib/fonts/font_10x18.c                  |  9 ++++-----
 lib/fonts/font_6x10.c                   |  9 +++++----
 lib/fonts/font_6x11.c                   |  9 ++++-----
 lib/fonts/font_7x14.c                   |  9 ++++-----
 lib/fonts/font_8x16.c                   |  9 ++++-----
 lib/fonts/font_8x8.c                    |  9 ++++-----
 lib/fonts/font_acorn_8x8.c              |  9 ++++++---
 lib/fonts/font_mini_4x6.c               |  8 ++++----
 lib/fonts/font_pearl_8x8.c              |  9 ++++-----
 lib/fonts/font_sun12x22.c               |  9 ++++-----
 lib/fonts/font_sun8x16.c                |  7 ++++---
 lib/fonts/font_ter16x32.c               |  9 ++++-----
 18 files changed, 79 insertions(+), 67 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
