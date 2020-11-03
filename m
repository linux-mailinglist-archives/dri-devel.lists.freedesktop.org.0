Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD12A5F87
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734E6F3D8;
	Wed,  4 Nov 2020 08:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29486ECE0;
 Tue,  3 Nov 2020 19:00:23 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604430021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7vA0Pp8Yw32NcCmeGMglrNZNTsusNNmUR0JbokXn0s=;
 b=Wh43mnWM8kdYti+K6Ejg70IQfa+GmZ8DCSo20FQE/hkLNmxVT4iphQnlk6m40FPrmWktQO
 8ayXKz0ztE1cqx/iEhmcbhojQh9yCHEkFANOGr1w8fGEwrPOcrWAWxi/OenSb5evTEILWa
 oclhRZDu2W0eltn+sc+1j25HCEzKjNSXz+4io/CbYUyMFuxTbNnNJEiCm1jMBn8PGej5s3
 E3JpbZR0aFWpI6lV+SZv22HUNUyPWbXG8oMYz+BmJikgi+ivLhTWpXqqgXf53DcJR+Ltrn
 dCfpJUdQQNPCTgPlSMPzbs0whzNCaCVS/fZbTm34UVovthqkFff3qyFpeY0sbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604430021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7vA0Pp8Yw32NcCmeGMglrNZNTsusNNmUR0JbokXn0s=;
 b=STcwQ6RaI64DeextSGHfCvrA9zLqnmZlfhd6kn3GgHfcpWRfVbJIkhHpoM7lA8B8jXR4lp
 QBLUYE/euA+zomCg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V3 22/37] highmem: High implementation details and
 document API
In-Reply-To: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
References: <20201103092712.714480842@linutronix.de>
 <20201103095858.827582066@linutronix.de>
 <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Date: Tue, 03 Nov 2020 20:00:20 +0100
Message-ID: <87y2ji1d17.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, virtualization@lists.linux-foundation.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03 2020 at 09:48, Linus Torvalds wrote:
> I have no complaints about the patch, but it strikes me that if people
> want to actually have much better debug coverage, this is where it
> should be (I like the "every other address" thing too, don't get me
> wrong).
>
> In particular, instead of these PageHighMem(page) tests, I think
> something like this would be better:
>
>    #ifdef CONFIG_DEBUG_HIGHMEM
>      #define page_use_kmap(page) ((page),1)
>    #else
>      #define page_use_kmap(page) PageHighMem(page)
>    #endif
>
> adn then replace those "if (!PageHighMem(page))" tests with "if
> (!page_use_kmap())" instead.
>
> IOW, in debug mode, it would _always_ remap the page, whether it's
> highmem or not. That would really stress the highmem code and find any
> fragilities.

Yes, that makes a lot of sense. We just have to avoid that for the
architectures with aliasing issues.

> Anyway, this is all sepatrate from the series, which still looks fine
> to me. Just a reaction to seeing the patch, and Thomas' earlier
> mention that the highmem debugging doesn't actually do much.

Right, forcing it for both kmap and kmap_local is straight forward. I'll
cook a patch on top for that.

Thanks,

        tglx


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
