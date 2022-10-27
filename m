Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633360FA5E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED210E64F;
	Thu, 27 Oct 2022 14:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E6E10E64F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 14:27:38 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3E3561F8E8;
 Thu, 27 Oct 2022 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666880857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0qpq/M/opCRpvF3FSdjlTdiqC45BiRz5sGZaOTgW0Sk=;
 b=dX95m2lVjr68CqcXgfwMM+/vozHuhOFtUCxWGxQK7iOx92ZJhMygrLLabYB2Nr2Manu0tV
 m/6CGaOrj0vRvXbgzYWILO8IFQOdNwBx5tz8nxr/sNk7i3vSNqkGv1AUg5R8xaRl9jxwyW
 tE/LzH7OQv6HOVt/Xobnc/3i6OgSkd0=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E1B092C141;
 Thu, 27 Oct 2022 14:27:36 +0000 (UTC)
Date: Thu, 27 Oct 2022 16:27:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v2 38/38] printk, xen: fbfront: create/use safe
 function for forcing preferred
Message-ID: <Y1qVWOyJuALz0vXf@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-39-john.ogness@linutronix.de>
 <Y1qFHbi39SpTggPH@alley> <87v8o5crtw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8o5crtw.fsf@jogness.linutronix.de>
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

On Thu 2022-10-27 15:41:23, John Ogness wrote:
> On 2022-10-27, Petr Mladek <pmladek@suse.com> wrote:
> >> -	if (c) {
> >> -		unregister_console(c);
> >> -		c->flags |= CON_CONSDEV;
> >> -		c->flags &= ~CON_PRINTBUFFER; /* don't print again */
> >> -		register_console(c);
> >> -	}
> >> +	if (c)
> >> +		console_force_preferred(c);
> >
> > I would prefer to fix this a clean way.
> >
> > [...]
> >
> > I would suggest to implement:
> >
> > [...]
> >
> > It is a more code. But it is race-free. Also it is much more clear
> > what is going on.
> >
> > How does this sound, please?
> 
> I wasn't sure if any of the other preferred-console magic in
> register_console() was needed, which is why I kept a full
> register_console() call. But if it really is just about forcing it the
> head and setting a new CON_CONSDEV, then your suggestion is much
> simpler. Thanks.

I believe that it is just this. I have spent a lot of time
investigating these hacks when thinking about refactoring
of register_console().

Best Regards,
Petr
