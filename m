Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93762A4503
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 13:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A29C6EC73;
	Tue,  3 Nov 2020 12:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9E06EC73;
 Tue,  3 Nov 2020 12:25:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7EE724101;
 Tue,  3 Nov 2020 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604406346;
 bh=JnG9AEM3urtQJZbyh27ncRK5xtNjXhkMpT9pLY6ruAw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1mtdK2dSQdS/K56+WquRZ8OWcsGdMtHmqIVFEMzZQi4+6uzgYEqYBwm+18gTL0/sS
 b59ZZ2pDtOE21j/UNcPbpblqLEOIaPKuGZCQHZmbdojGfOXKR1R7EH2TxZ9KkuU3wq
 iHFZuvtgo7ShOczv8vAXd79g6XKfxQVOX3Rurk14=
Received: by mail-wr1-f51.google.com with SMTP id a9so18312372wrg.12;
 Tue, 03 Nov 2020 04:25:45 -0800 (PST)
X-Gm-Message-State: AOAM533maafVJQHRxJJZaJEdSe567IU1i36D7C7y2SmbrRV8XodsVoWn
 mvVShz2IkRfSOdgp3uL6R2xmKXX6erF+Fzj+gGA=
X-Google-Smtp-Source: ABdhPJzaMTU0V4sDEP7WFi1D19pueRl5ySNY/GA/QmiGvW8mi19ZpCI6gDmcGIwe2rHXpOPoRB6cN5TL6gD3Vvt/QEU=
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr19654094wrn.165.1604406343518; 
 Tue, 03 Nov 2020 04:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.078043987@linutronix.de>
In-Reply-To: <20201103095857.078043987@linutronix.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Nov 2020 13:25:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3q1O=vTLHpjkufNhspj+OJFn0BkMD6XaPZvN_0D+=FFQ@mail.gmail.com>
Message-ID: <CAK8P3a3q1O=vTLHpjkufNhspj+OJFn0BkMD6XaPZvN_0D+=FFQ@mail.gmail.com>
Subject: Re: [patch V3 05/37] asm-generic: Provide kmap_size.h
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio <linux-aio@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 sparclinux <sparclinux@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, ML nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, virtualization@lists.linux-foundation.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 10:27 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> kmap_types.h is a misnomer because the old atomic MAP based array does not
> exist anymore and the whole indirection of architectures including
> kmap_types.h is inconinstent and does not allow to provide guard page
> debugging for this misfeature.
>
> Add a common header file which defines the mapping stack size for all
> architectures. Will be used when converting architectures over to a
> generic kmap_local/atomic implementation.
>
> The array size is chosen with the following constraints in mind:
>
>     - The deepest nest level in one context is 3 according to code
>       inspection.
>
>     - The worst case nesting for the upcoming reemptible version would be:
>
>       2 maps in task context and a fault inside
>       2 maps in the fault handler
>       3 maps in softirq
>       2 maps in interrupt
>
> So a total of 16 is sufficient and probably overestimated.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
