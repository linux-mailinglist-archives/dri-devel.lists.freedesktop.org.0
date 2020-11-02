Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8672A272A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394BC6E454;
	Mon,  2 Nov 2020 09:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E916E454
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:38:56 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 13so10615918pfy.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KIkUS/F/h0cPY8zoQYXrrVqLmu2PvOEJdmO7uBtIRmA=;
 b=e8iOFOWnoSM+T3VgJIdvUIoDbCbNf3KV95reaRCqBmp2FvsCbL4CFcbuUYPkHqxmkc
 YhdotRfTN81ubPChT7zXGTUsqyNxgeFKNBMCf3SzBPvO9TaXdr+qN9rINCzpASxuYsnj
 N3ZothOUEwZsCsqVm4UXP/NadPUfKNBFMjM6A6dMU7y2wX98kCALGuMEOy3CIoZiAcDP
 kIvitL06u2RajJIyUxt65QaCyZDajX7Gqg1UkiyD+jmHwo8W88hGTfXBUmFaJ3gAMlcI
 cEe5O++yDuXwJtyM44W+wXdYOtwJ4mj5w4oXpjaqcWkEeq9B6ecjw1avm597BfmDlIBi
 xD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KIkUS/F/h0cPY8zoQYXrrVqLmu2PvOEJdmO7uBtIRmA=;
 b=cmQhHCXdsfOUhjYYlU4OAOtAqSfE7wfeabXmn3K5QrAXX24UhfpWyx4iwFOPGS0B/O
 iWQZzeoLu7fYCIqmmRqJ+fOJ+wmSU8H/jRGBRQj73Eu3yiArKu6hET8glAX55SQU/X14
 C7mpScW4rhHgpXLjXwmX5HZJhKyCBg7ymQOL7Df0dbc9JmGmV9HCEzNvfHdVMk1BsrRQ
 WNA6r8owDSUEhKjch/TvVvT0Sy7fWYs1+Ud27EegcziNBW4pBYECQOwWfQg3/8U0pFrX
 qj2IAZGAVlCZG1VVMsDzR4sMKspqP/Scv+FiCu4GaBNG59lbIadweMG5ZUcP4SZJS9F7
 y9oA==
X-Gm-Message-State: AOAM5325zFYIPINyLk6KTLl/N7CkNlEA6O1pZhRDrV9XGQKCROPy8bbt
 lHpa8jxBwEeyyOczkEi7Vg==
X-Google-Smtp-Source: ABdhPJzCgNIMLBogFRg0xQa7AqfDjpwCrCxnaBYR0EmavPxwn1TrqXYVqyom19qz7drAlhjDOwtHSg==
X-Received: by 2002:a05:6a00:c8:b029:18b:b0e:e51 with SMTP id
 e8-20020a056a0000c8b029018b0b0e0e51mr1972116pfj.37.1604309936301; 
 Mon, 02 Nov 2020 01:38:56 -0800 (PST)
Received: from localhost.localdomain (59-125-13-244.HINET-IP.hinet.net.
 [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id u11sm12574877pfk.164.2020.11.02.01.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:38:55 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>
Subject: [PATCH v2 2/2] tty/vt: Avoid passing struct console_font_op to
 con_font_copy()
Date: Mon,  2 Nov 2020 04:37:55 -0500
Message-Id: <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

con_font_op() is passing an entire `struct console_font_op *` to
con_font_copy(), but con_font_copy() only uses `op->height`. Additionally,
con_font_copy() is silently assigning the unsigned `op->height` to the
signed `con`, then pass it to fbcon_copy_font().

Let con_font_copy() and fbcon_copy_font() pass an unsigned int directly.
Also, add a comment in con_font_op() for less confusion, since ideally
`op->height` should not be used as a console index, as the field name
suggests.

This patch depends on patch "console: Remove dummy con_font_op() callback
implementations".

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
con_font_set(), con_font_get() and con_font_default() also pass an entire
`console_font_op`.

con_font_get() and con_font_default() actually update the structure (later
copied to userspace), so let them be.

con_font_set() does not update the structure, but it uses all fields of it
except `op`. Avoiding passing `console_font_op` to con_font_set() will
thus make its signature pretty long (6 parameters).

Changes in v2:
  - Remove redundant `con < 0` check in con_font_copy() (kernel test robot
    <lkp@intel.com>)
  - Remove unnecessary range check in fbcon_copy_font(). con_font_copy()
    calls vc_cons_allocated(), which does the check
  - Do not Cc: stable
  - Rewrite the title and commit message accordingly

 drivers/tty/vt/vt.c              | 8 ++++----
 drivers/video/fbdev/core/fbcon.c | 2 +-
 include/linux/console.h          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 9506a76f3ab6..27821ef97b13 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4704,9 +4704,8 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
 	return rc;
 }
 
-static int con_font_copy(struct vc_data *vc, struct console_font_op *op)
+static int con_font_copy(struct vc_data *vc, unsigned int con)
 {
-	int con = op->height;
 	int rc;
 
 
@@ -4715,7 +4714,7 @@ static int con_font_copy(struct vc_data *vc, struct console_font_op *op)
 		rc = -EINVAL;
 	else if (!vc->vc_sw->con_font_copy)
 		rc = -ENOSYS;
-	else if (con < 0 || !vc_cons_allocated(con))
+	else if (!vc_cons_allocated(con))
 		rc = -ENOTTY;
 	else if (con == vc->vc_num)	/* nothing to do */
 		rc = 0;
@@ -4735,7 +4734,8 @@ int con_font_op(struct vc_data *vc, struct console_font_op *op)
 	case KD_FONT_OP_SET_DEFAULT:
 		return con_font_default(vc, op);
 	case KD_FONT_OP_COPY:
-		return con_font_copy(vc, op);
+		/* uses op->height as a console index */
+		return con_font_copy(vc, op->height);
 	}
 	return -ENOSYS;
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..cb5b5705ea71 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2451,7 +2451,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h,
 	return 0;
 }
 
-static int fbcon_copy_font(struct vc_data *vc, int con)
+static int fbcon_copy_font(struct vc_data *vc, unsigned int con)
 {
 	struct fbcon_display *od = &fb_display[con];
 	struct console_font *f = &vc->vc_font;
diff --git a/include/linux/console.h b/include/linux/console.h
index 4b1e26c4cb42..34855d3f2afd 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -62,7 +62,7 @@ struct consw {
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font);
 	int	(*con_font_default)(struct vc_data *vc,
 			struct console_font *font, char *name);
-	int	(*con_font_copy)(struct vc_data *vc, int con);
+	int	(*con_font_copy)(struct vc_data *vc, unsigned int con);
 	int     (*con_resize)(struct vc_data *vc, unsigned int width,
 			unsigned int height, unsigned int user);
 	void	(*con_set_palette)(struct vc_data *vc,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
