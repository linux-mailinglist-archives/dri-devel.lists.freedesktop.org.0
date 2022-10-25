Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB260CDB8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 15:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B510E3BB;
	Tue, 25 Oct 2022 13:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DB210E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:39:46 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 928FB1F74A;
 Tue, 25 Oct 2022 13:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666705183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jV+/V964f5a6YsdV9cIZOOLPnxJd1yg28bVzYXvdSNE=;
 b=XfWRH0X5l35RDq60Md4xj6mjphfPfdcDgAokBsoxJCwBD/D13j9+KFxlyb4FKt5iSZItym
 WXjU+SIf+EzrhXI/XgAOV3iJLTMLmTJ6FyEP7t+XkQMZVG9vPQfuK76P7B6rA86a9c2chI
 maR6uSFaDrSC1lZJQUYwHiA3mygb6rs=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 729402C141;
 Tue, 25 Oct 2022 13:39:43 +0000 (UTC)
Date: Tue, 25 Oct 2022 15:39:40 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v2 24/38] xen: fbfront: use srcu console list
 iterator
Message-ID: <Y1fnHH2J4bIS59ER@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-25-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-25-john.ogness@linutronix.de>
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
 Tom Rix <trix@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 2022-10-19 17:01:46, John Ogness wrote:
> Since the console_lock is not being used for anything other than
> safe console list traversal, use srcu console list iteration instead.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

> ---
>  drivers/video/fbdev/xen-fbfront.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
> index 4d2694d904aa..2552c853c6c2 100644
> --- a/drivers/video/fbdev/xen-fbfront.c
> +++ b/drivers/video/fbdev/xen-fbfront.c
> @@ -500,16 +500,18 @@ static int xenfb_probe(struct xenbus_device *dev,
>  static void xenfb_make_preferred_console(void)

Just for record. This function is a dirty hack how to associate "ttyX"
console with /dev/console.

A clean solution would be to just reshuffle console_drivers list. I
have a patch for this in my bottom drawer. It is part of a bigger
clean up that it not ready for upstreaming yet.

Best Regards,
Petr

>  {
>  	struct console *c;
> +	int cookie;
>  
>  	if (console_set_on_cmdline)
>  		return;
>  
> -	console_lock();
> -	for_each_console(c) {
> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(c) {
>  		if (!strcmp(c->name, "tty") && c->index == 0)
>  			break;
>  	}
> -	console_unlock();
> +	console_srcu_read_unlock(cookie);
> +
>  	if (c) {
>  		unregister_console(c);
>  		c->flags |= CON_CONSDEV;
> -- 
> 2.30.2
