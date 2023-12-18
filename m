Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8924817CF7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 22:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18A210E371;
	Mon, 18 Dec 2023 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA0910E383
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:34:34 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1702893460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8g1705acTr/tgoPBJPCxDzSYFLliwXwTit5yL2vhLY=;
 b=QYB7/wZCAy3GKkvWhPXPJbjtv5jqKhrH0IhYndaJGvRnNE5S1hUB61ByPMusRDvNNvXgM2
 Q42MtKtQcxIyvDOHEYF2bCyRS3fRHM1KxPYBheyoHag0Q60sHOgHrQe4WBs4L4E4anC+yZ
 XqiLqjsIHSNwrd5uf/LED1uVcwDCIqsepv6Tq0iX/+/+w5S6Ew9QTde2vjoYJDeY+j6Tjs
 9VL/bFO4UEd87V4BsklZqXav85aVZRZpD1ecWcON3F/ygKc/m7ezm5g0C7R0qmcFXlFlK/
 RYNSGG5Ff4hjhg06dbm+Df+XIta8gHP6ifJnPlez0yxhdqzWqMKtqAyhV/b1qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1702893460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8g1705acTr/tgoPBJPCxDzSYFLliwXwTit5yL2vhLY=;
 b=2c6pIzvCC2pWWiknD+IJ9Ed+Cd9zmCRkfZrO1U/2cAVRfSf59hAhENuaciIIH6Edz/mnb5
 Z7ATSmsGmX1ghRCA==
To: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Antonino Daplas <adaplas@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Mundt <lethal@linux-sh.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fb: flush deferred work in fb_deferred_io_fsync()
Date: Mon, 18 Dec 2023 10:57:30 +0100
Message-Id: <d15187348e7d7f76b7a1adf95aa5e3e3ecfc10b4.1702890493.git.namcao@linutronix.de>
In-Reply-To: <cover.1702890493.git.namcao@linutronix.de>
References: <cover.1702890493.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Dec 2023 21:52:28 +0000
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
Cc: Nam Cao <namcao@linutronix.de>, bigeasy@linutronix.de,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's fsync() is supposed to flush any pending operation to
hardware. It is implemented in this driver by cancelling the queued
deferred IO first, then schedule it for "immediate execution" by calling
schedule_delayed_work() again with delay=3D0. However, setting delay=3D0
only means the work is scheduled immediately, it does not mean the work
is executed immediately. There is no guarantee that the work is finished
after schedule_delayed_work() returns. After this driver's fsync()
returns, there can still be pending work. Furthermore, if close() is
called by users immediately after fsync(), the pending work gets
cancelled and fsync() may do nothing.

To ensure that the deferred IO completes, use flush_delayed_work()
instead. Write operations to this driver either write to the device
directly, or invoke schedule_delayed_work(); so by flushing the
workqueue, it can be guaranteed that all previous writes make it to the
device.

Fixes: 5e841b88d23d ("fb: fsync() method for deferred I/O flush.")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/core/fb_defio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core=
/fb_defio.c
index 274f5d0fa247..6c8b81c452f0 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -132,11 +132,7 @@ int fb_deferred_io_fsync(struct file *file, loff_t sta=
rt, loff_t end, int datasy
 		return 0;
=20
 	inode_lock(inode);
-	/* Kill off the delayed work */
-	cancel_delayed_work_sync(&info->deferred_work);
-
-	/* Run it immediately */
-	schedule_delayed_work(&info->deferred_work, 0);
+	flush_delayed_work(&info->deferred_work);
 	inode_unlock(inode);
=20
 	return 0;
--=20
2.39.2

