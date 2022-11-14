Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8C6289D6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864A10E069;
	Mon, 14 Nov 2022 19:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A172310E069
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 19:51:20 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668455478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfwmN3gCUQ+9TAw/6+bki3KtgpMLZgBklmxHfTgDw4o=;
 b=iMGGVuDKNStmNor0UI3iTAYJ0AUO55XogBClFvM6B+tx0AU7fG2GCFY1lB/NC6Tb3UDkHT
 wjMXw+7S+KKxg6nci2jZINQSPEpVH8/S75n8xpxWvbZB9TxM/doLt1grp8dJYSQNe4gcu2
 DqQPQFAS80ZUU4gsK6dxxarHe2nXdRbTQa10ScIZY9lfZD459n/D+zboV2n4sGBx1lblni
 JnLYd56MPxPaQR/+Mg3f7wjXIhTMsGxmrmPTrYXYKM4AA9jm8M7zDoQPx6vcpAWYDQ7x6x
 bqOsfc0s5Ggddqj32cmnHa27cCEyV5ocQGudIreuupfSYr3csW2a8Zggd4jVgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668455478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfwmN3gCUQ+9TAw/6+bki3KtgpMLZgBklmxHfTgDw4o=;
 b=dncJ14jVrz1LFCtglE+whx9TPp6GS0vWhsUTBrHNZGXicNcXkFVwyCGWGQtJhi1XDLy5gW
 vPUxufgOngSBI2Bw==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v4 31/39] printk, xen: fbfront: create/use safe
 function for forcing preferred
In-Reply-To: <20221114162932.141883-32-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
 <20221114162932.141883-32-john.ogness@linutronix.de>
Date: Mon, 14 Nov 2022 20:57:18 +0106
Message-ID: <87mt8tfh6x.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi,

After more detailed runtime testing I discovered that I didn't re-insert
the console to the correct place in the list. More below...

On 2022-11-14, John Ogness <john.ogness@linutronix.de> wrote:
> diff --git a/include/linux/console.h b/include/linux/console.h
> index f716e1dd9eaf..9cea254b34b8 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -291,6 +291,7 @@ enum con_flush_mode {
>  };
>  
>  extern int add_preferred_console(char *name, int idx, char *options);
> +extern void console_force_preferred_locked(struct console *con);
>  extern void register_console(struct console *);
>  extern int unregister_console(struct console *);
>  extern void console_lock(void);
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index e770b1ede6c9..dff76c1cef80 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3461,6 +3462,48 @@ int unregister_console(struct console *console)
>  }
>  EXPORT_SYMBOL(unregister_console);
>  
> +/**
> + * console_force_preferred_locked - force a registered console preferred
> + * @con: The registered console to force preferred.
> + *
> + * Must be called under console_list_lock().
> + */
> +void console_force_preferred_locked(struct console *con)
> +{
> +	struct console *cur_pref_con;
> +
> +	if (!console_is_registered_locked(con))
> +		return;
> +
> +	cur_pref_con = console_first();
> +
> +	/* Already preferred? */
> +	if (cur_pref_con == con)
> +		return;
> +
> +	/*
> +	 * Delete, but do not re-initialize the entry. This allows the console
> +	 * to continue to appear registered (via any hlist_unhashed_lockless()
> +	 * checks), even though it was briefly removed from the console list.
> +	 */
> +	hlist_del_rcu(&con->node);
> +
> +	/*
> +	 * Ensure that all SRCU list walks have completed so that the console
> +	 * can be added to the beginning of the console list and its forward
> +	 * list pointer can be re-initialized.
> +	 */
> +	synchronize_srcu(&console_srcu);
> +
> +	con->flags |= CON_CONSDEV;
> +	WARN_ON(!con->device);
> +
> +	/* Only the new head can have CON_CONSDEV set. */
> +	console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
> +	hlist_add_behind_rcu(&con->node, console_list.first);

This is adding the console as the 2nd item. It should be the new
head. The patch below fixes it.

I have done careful runtime testing with this fixup. After the
force_preferred, the console is the new head and sending data to
/dev/console redirects to that console.

It would be nice if we could fold this in. Sorry.

John Ogness

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 8d635467882f..4b77586cf4cb 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3494,7 +3494,7 @@ void console_force_preferred_locked(struct console *con)
 
 	/* Only the new head can have CON_CONSDEV set. */
 	console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
-	hlist_add_behind_rcu(&con->node, console_list.first);
+	hlist_add_head_rcu(&con->node, &console_list);
 }
 EXPORT_SYMBOL(console_force_preferred_locked);
 
