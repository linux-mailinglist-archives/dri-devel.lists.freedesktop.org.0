Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7448B5A693F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36D010E20F;
	Tue, 30 Aug 2022 17:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94AF10E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yATArImrPbIdbkbJ+hsnN/9dIbuyx0Cx7ksTH+tJO44=;
 b=H5+GfBkE0jpfYLFU7yyVM/gA1deuEIZOq+/PTfaXJnFmH41wG5uqfMJxqBFjQEEQjkQiuij/zpg+d
 zQA+voxGCBrNH7e3Vpl6eC7jaxN2+wLdbYtbDwlA8K9RqYa3t5FEYX4Aj8DCcCo++wurSKgzdgYejN
 rnTKeLtPmuYjQILB0lto7Qx1Jmj/MO2m08AIwCHB9wki7m5BCMwST41pfT/YQvu7QKmECcP0FnLl+e
 gASLKDAuMzcfQDDqZvb7z8LWqLLmlGQyyRjpOKLjpVs0+3XtTQlkJwImf4TC2yUUehXwTwTaOqeXC2
 atiOAJINQUpCYEwnsTjPPHvMQS+1dxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yATArImrPbIdbkbJ+hsnN/9dIbuyx0Cx7ksTH+tJO44=;
 b=BTqJZD30Y7DGArUp4cCUmXdRg3NTadt6T+dHuoltm2mE5UWbmaC3aMlZTZb7P8e4SRpUMIbHMLfUJ
 9vNyqg6AQ==
X-HalOne-Cookie: d4c5467cf0517736179749e36de942919052f25d
X-HalOne-ID: 3ac09ed2-2886-11ed-824a-d0431ea8bb10
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3ac09ed2-2886-11ed-824a-d0431ea8bb10;
 Tue, 30 Aug 2022 17:07:30 +0000 (UTC)
Date: Tue, 30 Aug 2022 19:07:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] tty/vt: Add console_lock check to vt_console_print()
Message-ID: <Yw5D0QeSt9TYy/41@ravnborg.org>
References: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
 <20220830144945.430528-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830144945.430528-1-daniel.vetter@ffwll.ch>
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
Cc: Petr Mladek <pmladek@suse.com>, Yangxi Xiang <xyangxi5@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 nick black <dankamongmen@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Aug 30, 2022 at 04:49:45PM +0200, Daniel Vetter wrote:
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
> v2: WARN_CONSOLE_UNLOCKED already checks for oops_in_progress
> (something else that should be fixed I guess), hence remove the
> open-coded check I've had.
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

It is always good to warn in case assumptions do not hold.
And thanks for the comment.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Hmm, I prefer to start comments with upper-case, but in vt.c there is no
specific style.

	Sam

> --
> Note that this applies on top of my earlier vt patch:
> 
> https://lore.kernel.org/lkml/20220826202419.198535-1-daniel.vetter@ffwll.ch/
> 
> Expect more, I'm digging around in here a bit ...
> -Daniel
> ---
>  drivers/tty/vt/vt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 4d29e4a17db7..a6be32798fad 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -3083,7 +3083,9 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
>  	ushort start_x, cnt;
>  	int kmsg_console;
>  
> -	/* console busy or not yet initialized */
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	/* this protects against concurrent oops only */
>  	if (!spin_trylock(&printing_lock))
>  		return;
>  
> -- 
> 2.37.2
