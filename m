Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6B61F547
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561D810E32E;
	Mon,  7 Nov 2022 14:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9ED10E326
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:16:57 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS+TlnBfnvuNwOKZQIZcdjPH9bhpfrs5K1fOz4tyq8E=;
 b=djqqVbIJuMlxRG/KUYbjTE3WlJPb8/4BRjZqiVgvYMTr7/Sg0autRsyaU2JWaZq3VN3Mfw
 OwXHjvPPuCWuVO7A4iO0R7oz5UwNRLhdk02uk4jpCy9Gt7MNNPJoFi4PLw9QL+wwMeqZgG
 x8w4JTnSU8McnTmTMP+zEv1TCPiXlXiHUYwTYDDfpGnYPpWIDb6LZ00TZMmkMkukcDDlD8
 pGbuhmV/Z89XLkI7qVEP/xlfkQntbD1FliCvEtwapvNn1D8KcDpxh7Pcm+BFSRCbglYTQK
 WSb0+BfzqLoXNbMVTMuI8qVDma66XMtIjHtCHVcUsZm6wYyw6AxM9KLuzMDR0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS+TlnBfnvuNwOKZQIZcdjPH9bhpfrs5K1fOz4tyq8E=;
 b=M60ZeenQNKgOoEahohQx+InKZNToZ2PTl+S+h/Y9/Dwe3ZAZMQrMX+0/9pXQL0rFd4ySGx
 /D2ZyiONrI29IoCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v3 33/40] printk,
 xen: fbfront: create/use safe function for forcing preferred
Date: Mon,  7 Nov 2022 15:22:31 +0106
Message-Id: <20221107141638.3790965-34-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
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
Cc: Juergen Gross <jgross@suse.com>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit 9e124fe16ff2("xen: Enable console tty by default in domU
if it's not a dummy") a hack was implemented to make sure that the
tty console remains the console behind the /dev/console device. The
main problem with the hack is that, after getting the console pointer
to the tty console, it is assumed the pointer is still valid after
releasing the console_sem. This assumption is incorrect and unsafe.

Make the hack safe by introducing a new function
console_force_preferred_locked() and perform the full operation
under the console_list_lock.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/video/fbdev/xen-fbfront.c | 12 +++------
 include/linux/console.h           |  1 +
 kernel/printk/printk.c            | 44 ++++++++++++++++++++++++++++---
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 4d2694d904aa..8752d389e382 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -504,18 +504,14 @@ static void xenfb_make_preferred_console(void)
 	if (console_set_on_cmdline)
 		return;
 
-	console_lock();
+	console_list_lock();
 	for_each_console(c) {
 		if (!strcmp(c->name, "tty") && c->index == 0)
 			break;
 	}
-	console_unlock();
-	if (c) {
-		unregister_console(c);
-		c->flags |= CON_CONSDEV;
-		c->flags &= ~CON_PRINTBUFFER; /* don't print again */
-		register_console(c);
-	}
+	if (c)
+		console_force_preferred_locked(c);
+	console_list_unlock();
 }
 
 static int xenfb_resume(struct xenbus_device *dev)
diff --git a/include/linux/console.h b/include/linux/console.h
index cdae70e27377..b6b5d796d15c 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -273,6 +273,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(char *name, int idx, char *options);
+extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
 extern void console_lock(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index be40a9688403..d74e6e609f7d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -247,9 +247,10 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
 void console_list_lock(void)
 {
 	/*
-	 * In unregister_console(), synchronize_srcu() is called with the
-	 * console_list_lock held. Therefore it is not allowed that the
-	 * console_list_lock is taken with the srcu_lock held.
+	 * In unregister_console() and console_force_preferred_locked(),
+	 * synchronize_srcu() is called with the console_list_lock held.
+	 * Therefore it is not allowed that the console_list_lock is taken
+	 * with the srcu_lock held.
 	 *
 	 * Whether or not this context is in the read-side critical section
 	 * can only be detected if the appropriate debug options are enabled.
@@ -3457,6 +3458,43 @@ int unregister_console(struct console *console)
 }
 EXPORT_SYMBOL(unregister_console);
 
+/**
+ * console_force_preferred_locked - force a registered console preferred
+ * @con: The registered console to force preferred.
+ *
+ * Must be called under console_list_lock().
+ */
+void console_force_preferred_locked(struct console *con)
+{
+	struct console *cur_pref_con;
+
+	if (!console_is_registered_locked(con))
+		return;
+
+	cur_pref_con = console_first();
+
+	/* Already preferred? */
+	if (cur_pref_con == con)
+		return;
+
+	hlist_del_init_rcu(&con->node);
+
+	/*
+	 * Ensure that all SRCU list walks have completed so that the console
+	 * can be added to the beginning of the console list and its forward
+	 * list pointer can be re-initialized.
+	 */
+	synchronize_srcu(&console_srcu);
+
+	con->flags |= CON_CONSDEV;
+	WARN_ON(!con->device);
+
+	/* Only the new head can have CON_CONSDEV set. */
+	WRITE_ONCE(cur_pref_con->flags, cur_pref_con->flags & ~CON_CONSDEV);
+	hlist_add_behind_rcu(&con->node, console_list.first);
+}
+EXPORT_SYMBOL(console_force_preferred_locked);
+
 /*
  * Initialize the console device. This is called *early*, so
  * we can't necessarily depend on lots of kernel help here.
-- 
2.30.2

