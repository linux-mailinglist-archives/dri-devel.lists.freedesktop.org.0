Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7874961DE34
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 22:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0862210E0F2;
	Sat,  5 Nov 2022 21:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F063510E09A;
 Sat,  5 Nov 2022 21:03:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B12CB808C4;
 Sat,  5 Nov 2022 21:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FADC433D6;
 Sat,  5 Nov 2022 21:03:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ek158U/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1667682204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eqdLYS8BDcnZ1CTVSLTL2V9mpBrsInljjeWX569KabI=;
 b=Ek158U/IwAdzp/7JgxH8/niYIDD2c7iDpM/q00frrsf+kptgL3uCiSQ7Xlb7SIQ9YvTtg5
 hlBVvQrg9GahoQxIsHXxgh/CGzM4sTACdo/WX2PYJwuZbLx0SZ+njeVN3snq9LgpG5MQMr
 EBxmnADIwq+lyFhZU+rPI7l5k3bHDuo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f7ca4808
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 5 Nov 2022 21:03:23 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:03:18 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <Y2bPlllkHo5DUmLY@zx2c4.com>
References: <20221105060024.598488967@goodmis.org>
 <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
 <20221105123642.596371c7@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221105123642.596371c7@rorschach.local.home>
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org, cgroups@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 05, 2022 at 12:36:42PM -0400, Steven Rostedt wrote:
> ----------------------8<------------------------
> @@
> identifier ptr, timer, rfield, slab;
> @@
> (
> -	del_timer(&ptr->timer);
> +	timer_shutdown(&ptr->timer);
> |
> -	del_timer_sync(&ptr->timer);
> +	timer_shutdown_sync(&ptr->timer);
> )
>     ...
> (
> 	kfree_rcu(ptr, rfield);
> |
> 	kmem_cache_free(slab, ptr);
> |
> 	kfree(ptr);
> )
> ---------------------->8------------------------

Something that might help here is changing the `...` into
`... when exists` or into `... when != ptr` or similar.
See this section of the manual:
https://coccinelle.gitlabpages.inria.fr/website/docs/main_grammar004.html

Jason
