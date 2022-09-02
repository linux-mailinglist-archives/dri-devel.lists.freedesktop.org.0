Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7695AB2D9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 16:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C2F10E856;
	Fri,  2 Sep 2022 14:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 95357 seconds by postgrey-1.36 at gabe;
 Fri, 02 Sep 2022 14:04:24 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59910E85F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 14:04:24 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8324622578;
 Fri,  2 Sep 2022 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1662127462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQVLDvqI/cu+2QzLbwVDv4Z8cIzmiDvwYW+Tdc9xaSc=;
 b=fJAxo84aFsY9jlWuydvvndtNM1uyx6H7eSaCtxGz0lmOrVX54eH+pwyUXM3G6uNlcMd2w5
 FihKwmBvV9Q6hbGNRNW1khLyb+ngL2Hn7RG7/uQCDSR6VI1h+NMVgqO1wdpO3EreQm4CZF
 PDS84AeIZEqqcbyw4dAhA+d/xdmu9sQ=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7FDD52C141;
 Fri,  2 Sep 2022 14:04:21 +0000 (UTC)
Date: Fri, 2 Sep 2022 16:04:21 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] tty/vt: Add console_lock check to vt_console_print()
Message-ID: <20220902140421.GB29761@pathway.suse.cz>
References: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>, John Ogness <john.ogness@linutronix.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 nick black <dankamongmen@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 2022-08-30 15:28:03, Daniel Vetter wrote:
> I'm scratching my head why we have this printing_lock. Digging through
> historical git trees shows that:
> - Added in 1.1.73, and I found absolutely no reason why.
> - Converted to atomic bitops in 2.1.125pre2, I guess as part of SMP
>   enabling/bugfixes.
> - Converted to a proper spinlock in b0940003f25d ("vt: bitlock fix")
>   because the hand-rolled atomic version lacked necessary memory
>   barriers.
> 
> Digging around in lore for that time period did also not shed further
> light.
> 
> The only reason I think this might still be relevant today is that (to
> my understanding at least, ymmv) during an oops we might be printing
> without console_lock held. See console_flush_on_panic() and the
> comments in there - we flush out the console buffers irrespective of
> whether we managed to acquire the right locks.
> 
> The strange thing is that this reason is fairly recent, because the
> console flushing was historically done without oops_in_progress set.
> This only changed in c7c3f05e341a ("panic: avoid deadlocks in
> re-entrant console drivers"), which removed the call to
> bust_spinlocks(0) (which decrements oops_in_progress again) before
> flushing out the console (which back then was open coded as a
> console_trylock/unlock pair).
> 
> Note that this entire mess should be properly fixed in the
> printk/console layer, and not inflicted on each implementation.
> 
> For now just document what's going on and check that in all other
> cases callers obey the locking rules.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
> Cc: Yangxi Xiang <xyangxi5@gmail.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: nick black <dankamongmen@gmail.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> --
> Note that this applies on top of my earlier vt patch:
> 
> https://lore.kernel.org/lkml/20220826202419.198535-1-daniel.vetter@ffwll.ch/
> 
> Expect more, I'm digging around in here a bit ...
> -Daniel
> ---
>  drivers/tty/vt/vt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 4d29e4a17db7..54399dcc334e 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -3083,7 +3083,10 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
>  	ushort start_x, cnt;
>  	int kmsg_console;
>  
> -	/* console busy or not yet initialized */
> +	if (!oops_in_progress)
> +		WARN_CONSOLE_UNLOCKED();
> +
> +	/* this protects against concurrent oops only */
>  	if (!spin_trylock(&printing_lock))
>  		return;

I am not sure how this was supposed to work. But it reminds me
similar games in other console drivers, see how oops_in_progress
is used.

Typical code looks like:

void serial8250_console_write(struct uart_8250_port *up, const char *s,
			      unsigned int count)
{
	int locked = 1;

	if (oops_in_progress)
		locked = spin_trylock_irqsave(&port->lock, flags);
	else
		spin_lock_irqsave(&port->lock, flags);

	/* Write the given string to the serial port */

	if (locked)
		spin_unlock_irqrestore(&port->lock, flags);
}

The logic is actually opposite in compare with vt_console().
Most console drivers allow to re-enter console->write() callback
during Oops or panic().

The "locked" variable is used to prevent double unlock in Oops
message when the system might try to continue working after
the Oops messages are printed.

IMHO, it works this way because there is a high-chance that the serial
console will print the message even when con->write() is called twice
in parallel. The message might be messed but it might be better than
nothing.

I am not sure how vt-code could deal with re-entrance. I guess that
there will be a big risk of deadlocks. It might explain why
printing_lock prevents the re-entrance completely.

Anyway, this explains why it is not solved on the higher level.
Serial consoles actually allow re-entrance. And they need
to handle the port->lock the special way.

The atomic consoles might eventually allow to remove these hacks.

Best Regards,
Petr
