Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88662C40C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C12710E187;
	Wed, 16 Nov 2022 16:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6C310E187
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:22:15 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668615732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXbxC6JVJ+uC/rHR//oihXQviGVU9SyaOLb0BW4WVkQ=;
 b=LkpXIHJO8B+YQGVTcPEhOmF6o85fbBVZsjNCb9sna4O0OUflqM62zl7N8YLgWUtINRBDq9
 6loOUJNzVVpmAhyP6TDqkZAgy2b+mvZVDCouf4GSyq86hzmRxgtezOj4rELb7tocUScO4J
 2DZjAcUhvrNUcjl9DGPJex9xVKNBtJgAgIbA7I9hqDxka3fENpGkCHHFDD/Bs5jbbTDdOa
 LuRBlUdyNLAyaf6qB6291uSzCLyXW3HqT4OyoXaYQZrqdciDZVDsm9HM8BlWNrufeLn/c6
 jYo1WB6s3s7NlsFNAFmDgPC2uqPJKlTomPPgESDMnrms5xVN23fG91jl8N0Y9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668615732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXbxC6JVJ+uC/rHR//oihXQviGVU9SyaOLb0BW4WVkQ=;
 b=aJ+OvlENo5zCvnworlHkhLW2ECjAESLEwtxR1qampDPfmlrUySSqcLernNYaBQewAHGX5b
 JujLFM840TLOzQCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v5 32/40] printk,
 xen: fbfront: create/use safe function for forcing preferred
Date: Wed, 16 Nov 2022 17:27:44 +0106
Message-Id: <20221116162152.193147-33-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
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
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/video/fbdev/xen-fbfront.c | 12 +++-----
 include/linux/console.h           |  1 +
 kernel/printk/printk.c            | 49 +++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 11 deletions(-)

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
index f716e1dd9eaf..9cea254b34b8 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -291,6 +291,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(char *name, int idx, char *options);
+extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
 extern void console_lock(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 410d3f2cdeb3..ece34abbc9cc 100644
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
 	 * Detecting if this context is really in the read-side critical
 	 * section is only possible if the appropriate debug options are
@@ -3489,6 +3490,48 @@ int unregister_console(struct console *console)
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
+	/*
+	 * Delete, but do not re-initialize the entry. This allows the console
+	 * to continue to appear registered (via any hlist_unhashed_lockless()
+	 * checks), even though it was briefly removed from the console list.
+	 */
+	hlist_del_rcu(&con->node);
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
+	console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
+	hlist_add_head_rcu(&con->node, &console_list);
+}
+EXPORT_SYMBOL(console_force_preferred_locked);
+
 /*
  * Initialize the console device. This is called *early*, so
  * we can't necessarily depend on lots of kernel help here.
-- 
2.30.2

