Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232C624853
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528AF10E134;
	Thu, 10 Nov 2022 17:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8263910E71D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 17:26:52 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9FD55228D3;
 Thu, 10 Nov 2022 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668101209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nzyi44WKO3p/rhzOL3lGsqVjLxzcpLoKQVlmwsHqaY4=;
 b=VIifZ/vuAtq6adyPtfIzER7lD6dcovCYFn2LPl2N7liyeJ2smk+e619717bVZOVG2cCs4L
 4NW34hAc5nZGPOp/hx+KHmTKMgvXYz+r6z8waJ7yaz+ZDQCc5GlM2IINXZtTuek5vPZ+hB
 8h++xOtr6IViY8n5P15stCuy6lMKTek=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3D2E22C141;
 Thu, 10 Nov 2022 17:26:49 +0000 (UTC)
Date: Thu, 10 Nov 2022 18:26:48 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v3 33/40] printk, xen: fbfront: create/use safe
 function for forcing preferred
Message-ID: <Y200WG6q4z0JGYBc@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-34-john.ogness@linutronix.de>
 <Y20aBwNWT19YDeib@alley> <877d026blr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d026blr.fsf@jogness.linutronix.de>
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

On Thu 2022-11-10 17:09:12, John Ogness wrote:
> On 2022-11-10, Petr Mladek <pmladek@suse.com> wrote:
> >> +void console_force_preferred_locked(struct console *con)
> >> +{
> >> +	struct console *cur_pref_con;
> >> +
> >> +	if (!console_is_registered_locked(con))
> >> +		return;
> >> +
> >> +	cur_pref_con = console_first();
> >> +
> >> +	/* Already preferred? */
> >> +	if (cur_pref_con == con)
> >> +		return;
> >> +
> >> +	hlist_del_init_rcu(&con->node);
> >
> > We actually should re-initialize the node only after all existing
> > console list walks are finished. Se we should use here:
> >
> > 	hlist_del_rcu(&con->node);
> 
> hlist_del_init_rcu() only re-initializes @pprev pointer.

Ah, I was not aware of it.

> But maybe you
> are concerned that there is a window where list_unhashed() becomes true?
> I agree that it should be changed to hlist_del_rcu() because there
> should not be a window where this console appears unregistered.

Makes sense.

> >> +	/* Only the new head can have CON_CONSDEV set. */
> >> +	WRITE_ONCE(cur_pref_con->flags, cur_pref_con->flags & ~CON_CONSDEV);
> >
> > As mentioned in the reply for 7th patch, I would prefer to hide this
> > WRITE_ONCE into a wrapper, e.g. console_set_flag(). It might also
> > check that the console_list_lock is taken...
> 
> Agreed. For v4 it will become:
> 
> console_srcu_write_flags(cur_pref_con->flags & ~CON_CONSDEV);

I am happy that your are going to introduce an API for this.

Just to be sure. The _srcu_ in the name means that the write
will use WRITE_ONCE() so that it can be read safely in SRCU
context using READ_ONCE(). Do I get it correctly, please?

I expect that the counter part will be console_srcu_read_flags().
I like the name. It is better than _unsafe_ that I proposed earlier.

Best Regards,
Petr
