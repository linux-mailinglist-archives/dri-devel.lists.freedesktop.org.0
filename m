Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C9246756
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 15:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5D6E516;
	Mon, 17 Aug 2020 13:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9E6E326
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:27:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2EB96297B9E
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] tty/sysrq: Extend the sysrq_key_table to cover capital
 letters
Date: Mon, 17 Aug 2020 15:27:26 +0200
Message-Id: <20200817132727.14564-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817132727.14564-1-andrzej.p@collabora.com>
References: <20200817132727.14564-1-andrzej.p@collabora.com>
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
Cc: linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jslaby@suse.com>,
 kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All slots in sysrq_key_table[] are either used, reserved or at least
commented with their intended use. This patch adds capital letter versions
available, which means adding 26 more entries.

For already existing SysRq operations the user presses Alt-SysRq-<key>, and
for the newly added ones Alt-Shift-SysRq-<key>.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 Documentation/admin-guide/sysrq.rst |  2 ++
 drivers/gpu/drm/drm_fb_helper.c     |  2 +-
 drivers/tty/sysrq.c                 | 49 +++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index e6424d8c5846..67dfa4c29093 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -79,6 +79,8 @@ On all
 
 		echo t > /proc/sysrq-trigger
 
+The :kbd:`<command key>` is case sensitive.
+
 What are the 'command' keys?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8697554ccd41..1543d9d10970 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -325,7 +325,7 @@ static void drm_fb_helper_sysrq(int dummy1)
 
 static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
 	.handler = drm_fb_helper_sysrq,
-	.help_msg = "force-fb(V)",
+	.help_msg = "force-fb(v)",
 	.action_msg = "Restore framebuffer console",
 };
 #else
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index a8e39b2cdd55..959f9e121cc6 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -19,6 +19,7 @@
 #include <linux/sched/rt.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
+#include <linux/ctype.h>
 #include <linux/interrupt.h>
 #include <linux/mm.h>
 #include <linux/fs.h>
@@ -440,7 +441,7 @@ static const struct sysrq_key_op sysrq_unrt_op = {
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
-static const struct sysrq_key_op *sysrq_key_table[36] = {
+static const struct sysrq_key_op *sysrq_key_table[62] = {
 	&sysrq_loglevel_op,		/* 0 */
 	&sysrq_loglevel_op,		/* 1 */
 	&sysrq_loglevel_op,		/* 2 */
@@ -497,6 +498,32 @@ static const struct sysrq_key_op *sysrq_key_table[36] = {
 	/* y: May be registered on sparc64 for global register dump */
 	NULL,				/* y */
 	&sysrq_ftrace_dump_op,		/* z */
+	NULL,				/* A */
+	NULL,				/* B */
+	NULL,				/* C */
+	NULL,				/* D */
+	NULL,				/* E */
+	NULL,				/* F */
+	NULL,				/* G */
+	NULL,				/* H */
+	NULL,				/* I */
+	NULL,				/* J */
+	NULL,				/* K */
+	NULL,				/* L */
+	NULL,				/* M */
+	NULL,				/* N */
+	NULL,				/* O */
+	NULL,				/* P */
+	NULL,				/* Q */
+	NULL,				/* R */
+	NULL,				/* S */
+	NULL,				/* T */
+	NULL,				/* U */
+	NULL,				/* V */
+	NULL,				/* W */
+	NULL,				/* X */
+	NULL,				/* Y */
+	NULL,				/* Z */
 };
 
 /* key2index calculation, -1 on invalid index */
@@ -508,6 +535,8 @@ static int sysrq_key_table_key2index(int key)
 		retval = key - '0';
 	else if ((key >= 'a') && (key <= 'z'))
 		retval = key + 10 - 'a';
+	else if ((key >= 'A') && (key <= 'Z'))
+		retval = key + 36 - 'A';
 	else
 		retval = -1;
 	return retval;
@@ -621,6 +650,8 @@ struct sysrq_state {
 	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
 	unsigned int alt;
 	unsigned int alt_use;
+	unsigned int shift;
+	unsigned int shift_use;
 	bool active;
 	bool need_reinject;
 	bool reinjecting;
@@ -805,10 +836,20 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		}
 		break;
 
+	case KEY_LEFTSHIFT:
+	case KEY_RIGHTSHIFT:
+		if (!value)
+			sysrq->shift = KEY_RESERVED;
+		else if (value != 2)
+			sysrq->shift = code;
+		break;
+
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
 			sysrq->alt_use = sysrq->alt;
+			/* either RESERVED (for released) or actual code */
+			sysrq->shift_use = sysrq->shift;
 			/*
 			 * If nothing else will be pressed we'll need
 			 * to re-inject Alt-SysRq keysroke.
@@ -831,8 +872,12 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 
 	default:
 		if (sysrq->active && value && value != 2) {
+			unsigned char c = sysrq_xlate[code];
+
 			sysrq->need_reinject = false;
-			__handle_sysrq(sysrq_xlate[code], true);
+			if (sysrq->shift_use != KEY_RESERVED)
+				c = toupper(c);
+			__handle_sysrq(c, true);
 		}
 		break;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
