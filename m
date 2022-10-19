Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B9604AA8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53B10E4DE;
	Wed, 19 Oct 2022 15:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 791 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 15:09:21 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20BF10E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:09:21 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXcesGHiS9CJwBLB5AtQkJ+SjPh3MNkbA2I4bHFlwT4=;
 b=vyVdNsmDCOtZ1td7FZJE2kL0NFcmHJkDeb8tBWR6iDUAHMNtB/gaxUaCu7IOuYDjCtdTGf
 7JMy3AFlQHUwJVxxWRF61DKsEUyqZRkxV7auxPl3IWWrfKeqXCbTFP1XCjq4+t36WbX9n3
 Lk0u97wao4rNY5seMwaeTD9hMMmwwZAO7FNkBian35LLG7JI5kr+LIiauXac/JHyFLh0oS
 0bab60tCRUjG95HHblokpeEUA2qyzG6Wp6FwAKRehYx7odX+BRLntV+unpa7brXAp90riX
 g0saBHF8isP/h2pPYkiVRR0qX2oN2XOyv2ogU5splu0VZKufFuAm+1ETP7yO7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXcesGHiS9CJwBLB5AtQkJ+SjPh3MNkbA2I4bHFlwT4=;
 b=3KenGGEQ+2eWZ5r+4AzHNAE//1dUZSpARbtG8UMeJGjl8XQGUV1nPPSymknxmfh1mJh3sK
 E+W71aY0Z0vk/3Bg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 38/38] printk,
 xen: fbfront: create/use safe function for forcing preferred
Date: Wed, 19 Oct 2022 17:02:00 +0206
Message-Id: <20221019145600.1282823-39-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-1-john.ogness@linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
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
console_force_preferred() to perform the full operation under
the console_list_lock.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/video/fbdev/xen-fbfront.c |  8 +---
 include/linux/console.h           |  1 +
 kernel/printk/printk.c            | 69 +++++++++++++++++++------------
 3 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 2552c853c6c2..aa362b25a60f 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -512,12 +512,8 @@ static void xenfb_make_preferred_console(void)
 	}
 	console_srcu_read_unlock(cookie);
 
-	if (c) {
-		unregister_console(c);
-		c->flags |= CON_CONSDEV;
-		c->flags &= ~CON_PRINTBUFFER; /* don't print again */
-		register_console(c);
-	}
+	if (c)
+		console_force_preferred(c);
 }
 
 static int xenfb_resume(struct xenbus_device *dev)
diff --git a/include/linux/console.h b/include/linux/console.h
index bf1e8136424a..41378b00bbdd 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -235,6 +235,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(char *name, int idx, char *options);
+extern void console_force_preferred(struct console *c);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
 extern void console_lock(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 840d581c4b23..9a056a42b8d8 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3207,38 +3207,17 @@ static void try_enable_default_console(struct console *newcon)
 
 static int unregister_console_locked(struct console *console);
 
-/*
- * The console driver calls this routine during kernel initialization
- * to register the console printing procedure with printk() and to
- * print any messages that were printed by the kernel before the
- * console driver was initialized.
- *
- * This can happen pretty early during the boot process (because of
- * early_printk) - sometimes before setup_arch() completes - be careful
- * of what kernel features are used - they may not be initialised yet.
- *
- * There are two types of consoles - bootconsoles (early_printk) and
- * "real" consoles (everything which is not a bootconsole) which are
- * handled differently.
- *  - Any number of bootconsoles can be registered at any time.
- *  - As soon as a "real" console is registered, all bootconsoles
- *    will be unregistered automatically.
- *  - Once a "real" console is registered, any attempt to register a
- *    bootconsoles will be rejected
- */
-void register_console(struct console *newcon)
+static void register_console_locked(struct console *newcon)
 {
 	struct console *con;
 	bool bootcon_enabled = false;
 	bool realcon_enabled = false;
 	int err;
 
-	console_list_lock();
-
 	for_each_console(con) {
 		if (WARN(con == newcon, "console '%s%d' already registered\n",
 					 con->name, con->index)) {
-			goto unlock;
+			return;
 		}
 
 		if (con->flags & CON_BOOT)
@@ -3251,7 +3230,7 @@ void register_console(struct console *newcon)
 	if (newcon->flags & CON_BOOT && realcon_enabled) {
 		pr_info("Too late to register bootconsole %s%d\n",
 			newcon->name, newcon->index);
-		goto unlock;
+		return;
 	}
 
 	/*
@@ -3282,7 +3261,7 @@ void register_console(struct console *newcon)
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL)
-		goto unlock;
+		return;
 
 	/*
 	 * If we have a bootconsole, and are switching to a real console,
@@ -3346,7 +3325,31 @@ void register_console(struct console *newcon)
 				unregister_console_locked(con);
 		}
 	}
-unlock:
+}
+
+/*
+ * The console driver calls this routine during kernel initialization
+ * to register the console printing procedure with printk() and to
+ * print any messages that were printed by the kernel before the
+ * console driver was initialized.
+ *
+ * This can happen pretty early during the boot process (because of
+ * early_printk) - sometimes before setup_arch() completes - be careful
+ * of what kernel features are used - they may not be initialised yet.
+ *
+ * There are two types of consoles - bootconsoles (early_printk) and
+ * "real" consoles (everything which is not a bootconsole) which are
+ * handled differently.
+ *  - Any number of bootconsoles can be registered at any time.
+ *  - As soon as a "real" console is registered, all bootconsoles
+ *    will be unregistered automatically.
+ *  - Once a "real" console is registered, any attempt to register a
+ *    bootconsoles will be rejected
+ */
+void register_console(struct console *newcon)
+{
+	console_list_lock();
+	register_console_locked(newcon);
 	console_list_unlock();
 }
 EXPORT_SYMBOL(register_console);
@@ -3411,6 +3414,20 @@ int unregister_console(struct console *console)
 }
 EXPORT_SYMBOL(unregister_console);
 
+void console_force_preferred(struct console *c)
+{
+	console_list_lock();
+
+	if (unregister_console_locked(c) == 0) {
+		c->flags |= CON_CONSDEV;
+		c->flags &= ~CON_PRINTBUFFER; /* don't print again */
+		register_console_locked(c);
+	}
+
+	console_list_unlock();
+}
+EXPORT_SYMBOL(console_force_preferred);
+
 /*
  * Initialize the console device. This is called *early*, so
  * we can't necessarily depend on lots of kernel help here.
-- 
2.30.2

