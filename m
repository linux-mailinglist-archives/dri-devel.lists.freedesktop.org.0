Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2040A4209D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5F10E2B2;
	Mon, 24 Feb 2025 13:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="CnrlGXKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24D3910E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:29:54 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 3EAB6203CDDA; Mon, 24 Feb 2025 05:29:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3EAB6203CDDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740403786;
 bh=i01zIab6305TaFlNKn7K/1S71vqUHIZ2SMtS+KnZW5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CnrlGXKlOaWiyi66FhJ6/N36v5KvcV6ldKV+IQevrGpmO7UGJnZ8rJ7Cd/BQuYkw0
 lLWRMnUwFeM4OuGuimbaznlHZ4tZQmlbIr5R/GlWCw8txh7UxhvKliD0zif9TV17AM
 FEUNe9MgWI+y11r/xtxLv/fIOAOcmwsztrr4Z7ew=
Date: Mon, 24 Feb 2025 05:29:46 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "deller@gmx.de" <deller@gmx.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: Re: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Message-ID: <20250224132946.GA7039@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
 <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157F6CF7CACF45C398933C4D4C62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250223140933.GA16428@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB41571ED5CEA6B91A7F35AC3FD4C02@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR02MB41571ED5CEA6B91A7F35AC3FD4C02@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2025 at 12:38:22AM +0000, Michael Kelley wrote:
> From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Sunday, February 23, 2025 6:10 AM
> > 
> > On Sat, Feb 22, 2025 at 08:16:53PM +0000, Michael Kelley wrote:
> > > From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Saturday, February 22, 2025 9:27 AM
> > > >
> 
> [anip]
> 
> > > >
> > > > I had considered moving the entire `hvfb_putmem()` function to `destroy`,
> > > > but I was hesitant for two reasons:
> > > >
> > > >   1. I wasn’t aware of any scenario where this would be useful. However,
> > > >      your explanation has convinced me that it is necessary.
> > > >   2. `hvfb_release_phymem()` relies on the `hdev` pointer, which requires
> > > >      multiple `container_of` operations to derive it from the `info` pointer.
> > > >      I was unsure if the complexity was justified, but it seems worthwhile now.
> > > >
> > > > I will move `hvfb_putmem()` to the `destroy` function in V2, and I hope this
> > > > will address all the cases you mentioned.
> > > >
> > >
> > > Yes, that's what I expect needs to happen, though I haven't looked at the
> > > details of making sure all the needed data structures are still around. Like
> > > you, I just had this sense that hvfb_putmem() might need to be moved as
> > > well, so I tried to produce a failure scenario to prove it, which turned out
> > > to be easy.
> > >
> > > Michael
> > 
> > I will add this in V2 as well. But I have found an another issue which is
> > not very frequent.
> > 
> > 
> > [  176.562153] ------------[ cut here ]------------
> > [  176.562159] fb0: fb_WARN_ON_ONCE(pageref->page != page)
> > [  176.562176] WARNING: CPU: 50 PID: 1522 at drivers/video/fbdev/core/fb_defio.c:67
> > fb_deferred_io_mkwrite+0x215/0x280
> > 
> > <snip>
> > 
> > [  176.562258] Call Trace:
> > [  176.562260]  <TASK>
> > [  176.562263]  ? show_regs+0x6c/0x80
> > [  176.562269]  ? __warn+0x8d/0x150
> > [  176.562273]  ? fb_deferred_io_mkwrite+0x215/0x280
> > [  176.562275]  ? report_bug+0x182/0x1b0
> > [  176.562280]  ? handle_bug+0x133/0x1a0
> > [  176.562283]  ? exc_invalid_op+0x18/0x80
> > [  176.562284]  ? asm_exc_invalid_op+0x1b/0x20
> > [  176.562289]  ? fb_deferred_io_mkwrite+0x215/0x280
> > [  176.562291]  ? fb_deferred_io_mkwrite+0x215/0x280
> > [  176.562293]  do_page_mkwrite+0x4d/0xb0
> > [  176.562296]  do_wp_page+0xe8/0xd50
> > [  176.562300]  ? ___pte_offset_map+0x1c/0x1b0
> > [  176.562304]  __handle_mm_fault+0xbe1/0x10e0
> > [  176.562307]  handle_mm_fault+0x17f/0x2e0
> > [  176.562309]  do_user_addr_fault+0x2d1/0x8d0
> > [  176.562314]  exc_page_fault+0x85/0x1e0
> > [  176.562318]  asm_exc_page_fault+0x27/0x30
> > 
> > Looks this is because driver is unbind still Xorg is trying to write
> > to memory which is causing some page faults. I have confirmed PID 1522
> > is of Xorg. I think this is because we need to cancel the framebuffer
> > deferred work after flushing it.
> 
> Does this new issue occur even after moving hvfb_putmem()
> into the destroy() function?

Unfortunately yes :( 

>                             I'm hoping it doesn't. I've
> looked at the fb_deferred_io code, and can't quite figure out
> how that deferred I/O work is supposed to get cancelled. Or
> maybe it's just not supposed to get started again after the flush.
> 

I want to understand why cancel_delayed_work_sync was introduce in
hvfb_suspend and not the flush. Following commit introduced it.

382a462217572 ('video: hyperv_fb: Fix hibernation for the deferred IO feature')

But I agree this need more analysis.

> If the new issue still happens, that seems like more of a flaw
> in the fb deferred I/O mechanism not shutting itself down
> properly.
> 

As the repro rate is quite low, this will take some effort to get this
fixed. Shall we take this in a separate patch later ?


> Michael
>

<snip> 
