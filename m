Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC786258AA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65BF10E80B;
	Fri, 11 Nov 2022 10:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B983A10E7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:48:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4868320199;
 Fri, 11 Nov 2022 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668163684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6WEAmxBHjoiaTFMT7VLwFHXkqROAYQK5hPFehSseOMw=;
 b=rFyyoP0Yfoo8+wN9p4PS9adB9qj15yDj1qh832osE3tT6fbVlQqKp+AA2zdn2vX/16O6t3
 4JjnVaU8nu9z7XBWkvf39A9eNBEboLxOrEtCBfy1txRk7oaDWt3LCwJLsD3+v/y6FMZNRr
 0xlDN7KMqZ493cLJ05VM0gSLOo3da9c=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CD94A2C143;
 Fri, 11 Nov 2022 10:48:03 +0000 (UTC)
Date: Fri, 11 Nov 2022 11:48:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v3 33/40] printk, xen: fbfront: create/use safe
 function for forcing preferred
Message-ID: <Y24oY5PDIuQbN06R@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-34-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-34-john.ogness@linutronix.de>
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

On Mon 2022-11-07 15:22:31, John Ogness wrote:
> With commit 9e124fe16ff2("xen: Enable console tty by default in domU
> if it's not a dummy") a hack was implemented to make sure that the
> tty console remains the console behind the /dev/console device. The
> main problem with the hack is that, after getting the console pointer
> to the tty console, it is assumed the pointer is still valid after
> releasing the console_sem. This assumption is incorrect and unsafe.
> 
> Make the hack safe by introducing a new function
> console_force_preferred_locked() and perform the full operation
> under the console_list_lock.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3457,6 +3458,43 @@ int unregister_console(struct console *console)
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

One more thing. It would make sense to check that it has
really been called under console_list_lock():

	lockdep_assert_console_list_lock_held();

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

Best Regards,
Petr
