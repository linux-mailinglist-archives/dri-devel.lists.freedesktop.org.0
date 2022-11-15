Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE7C6299FA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B93010E3D2;
	Tue, 15 Nov 2022 13:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAA410E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:22:18 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AFDB21F8CD;
 Tue, 15 Nov 2022 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668518536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QmX7RJNNVBj1FU2joU/lqNhMfCU9lMkhGvr+3DdJhfg=;
 b=iRMOUOKOWNnBtw6+eGOtN4tmTznrw3/yio0CZFdwk76Npxu5xZrQMnLuPWOJZaZRJhr8bU
 OuFgBhGGQMQLaOoIJ2fF/z9dxbUcOLYu0CaEHVNetJKx8C7V4C0b5tqrI+hjNkNq+mQ5x8
 2G+HZgSGsI5B+D3aEntVGEYNZsUZGT4=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6B80D2C142;
 Tue, 15 Nov 2022 13:22:16 +0000 (UTC)
Date: Tue, 15 Nov 2022 14:22:15 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v4 31/39] printk, xen: fbfront: create/use safe
 function for forcing preferred
Message-ID: <Y3OSh8OCL/SYH9qi@alley>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
 <20221114162932.141883-32-john.ogness@linutronix.de>
 <87mt8tfh6x.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt8tfh6x.fsf@jogness.linutronix.de>
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

On Mon 2022-11-14 20:57:18, John Ogness wrote:
> Hi,
> 
> After more detailed runtime testing I discovered that I didn't re-insert
> the console to the correct place in the list. More below...
> 
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3461,6 +3462,48 @@ int unregister_console(struct console *console)
> >  }
> >  EXPORT_SYMBOL(unregister_console);
> >  
> > +/**
> > + * console_force_preferred_locked - force a registered console preferred
> > + * @con: The registered console to force preferred.
> > + *
> > + * Must be called under console_list_lock().
> > + */
> > +void console_force_preferred_locked(struct console *con)
> > +{
> > +	struct console *cur_pref_con;
> > +
> > +	if (!console_is_registered_locked(con))
> > +		return;
> > +
> > +	cur_pref_con = console_first();
> > +
> > +	/* Already preferred? */
> > +	if (cur_pref_con == con)
> > +		return;
> > +
> > +	/*
> > +	 * Delete, but do not re-initialize the entry. This allows the console
> > +	 * to continue to appear registered (via any hlist_unhashed_lockless()
> > +	 * checks), even though it was briefly removed from the console list.
> > +	 */
> > +	hlist_del_rcu(&con->node);
> > +
> > +	/*
> > +	 * Ensure that all SRCU list walks have completed so that the console
> > +	 * can be added to the beginning of the console list and its forward
> > +	 * list pointer can be re-initialized.
> > +	 */
> > +	synchronize_srcu(&console_srcu);
> > +
> > +	con->flags |= CON_CONSDEV;
> > +	WARN_ON(!con->device);
> > +
> > +	/* Only the new head can have CON_CONSDEV set. */
> > +	console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
> > +	hlist_add_behind_rcu(&con->node, console_list.first);
> 
> This is adding the console as the 2nd item. It should be the new
> head. The patch below fixes it.
> 
> I have done careful runtime testing with this fixup. After the
> force_preferred, the console is the new head and sending data to
> /dev/console redirects to that console.

Great catch!

> It would be nice if we could fold this in. Sorry.

I have missed it as well :-/

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 8d635467882f..4b77586cf4cb 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3494,7 +3494,7 @@ void console_force_preferred_locked(struct console *con)
>  
>  	/* Only the new head can have CON_CONSDEV set. */
>  	console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
> -	hlist_add_behind_rcu(&con->node, console_list.first);
> +	hlist_add_head_rcu(&con->node, &console_list);
>  }
>  EXPORT_SYMBOL(console_force_preferred_locked);

With this change:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
