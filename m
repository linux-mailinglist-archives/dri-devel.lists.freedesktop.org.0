Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0C750838
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8283210E4FF;
	Wed, 12 Jul 2023 12:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082D410E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ZXR+7zHmkWbyYVaIYilEixXpel3+ET8rhBNIy+I7sKc=; b=burEIjw7Ax9oR6XyYXgzDOhcuF
 Xhtc5KYLObU41T0IENhk9G9qohZmC0Yvpb0wRw7l1oWGurx+n06gfe89pV9j1He1PowmLd8jJyW8G
 6zVp1GF2gkOuSfQqmnXwyuzEsSHJpzBzRoDcraZR5u1o/H5XlxRZYWJLxZ3Q2LE0UHn9fNAfiTk55
 AwKLj1j/r+rbJ4LHiTTJZlao2GGhqWJsjFEZodtwqDNEFYvFkQ0yagZeMU8KXrBVYKFvCwlCCX60H
 AgkXU1Hco0bnyVOotp2bryNT8o+jpABaFGlsKFzTpw66wm7t7tRLyXKz9AmKG+OeMgsd4mE9EXCCa
 pxRUvSiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJYwd-003e8q-0G; Wed, 12 Jul 2023 12:27:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AB77B30036B;
 Wed, 12 Jul 2023 14:27:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8E54B243429D2; Wed, 12 Jul 2023 14:27:45 +0200 (CEST)
Date: Wed, 12 Jul 2023 14:27:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <20230712122745.GH3100107@hirez.programming.kicks-ass.net>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
 <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 11:04:16AM +0200, Geert Uytterhoeven wrote:
> Hoi Peter,
> 
> On Wed, Jul 12, 2023 at 10:05 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:
> > > I wonder whether the right thing to do here is somehow scaling the threshold
> > > according to the relative processing power. It's difficult to come up with a
> > > threshold which works well across the latest & fastest and really tiny CPUs.
> > > I'll think about it some more but if you have some ideas, please feel free
> > > to suggest.
> >
> > We could scale by BogoMIPS I suppose, it's a bogus measurement, as per
> > the name, but it does have some relation to how fast the machine is.
> 
> That's gonna fail miserably on e.g. ARM and RISC-V, where BogoMIPS
> depends on some timer frequency.
> 
> R-Car M2-W with 1.5 GHz Cortex-A15: 40.00 BogoMIPS
> R-Car V4H with 1.8 GHz Cortex-A76: 33.33 BogoMIPS
> 
> while the real slow 48 MHz VexRiscV gets 128 BogoMIPS.

Hehe, OK, really bogus then. Lets file this idea in the bit-bucket then.
