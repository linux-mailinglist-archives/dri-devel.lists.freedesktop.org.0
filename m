Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C65457925
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAFE6E40F;
	Fri, 19 Nov 2021 22:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A306E40F;
 Fri, 19 Nov 2021 22:54:32 +0000 (UTC)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1318F61AE2;
 Fri, 19 Nov 2021 22:54:29 +0000 (UTC)
Date: Fri, 19 Nov 2021 17:54:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: jim.cromie@gmail.com
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with
 it - RFC
Message-ID: <20211119175428.2ab95873@rorschach.local.home>
In-Reply-To: <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
 <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
 <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: quic_saipraka@quicinc.com, Jason Baron <jbaron@akamai.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 maz@kernel.org, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Sean Paul <sean@poorly.run>,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 quic_psodagud@quicinc.com, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021 15:46:31 -0700
jim.cromie@gmail.com wrote:


> > So I could see us supporting subsystem specific trace buffer output
> > via dynamic debug here. We could add new dev_debug() variants that
> > allow say a trace buffer to be supplied. So in that way subsystems
> > could 'opt-out' of having their data put into the global trace buffer.
> > And perhaps some subsystems we would want to allow output to both
> > buffers? The subsystem specific one and the global one?
> >  
> 
>  * trace_array_printk - Print a message to a specific instance
>  * @tr: The instance trace_array descriptor
>  * @ip: The instruction pointer that this is called from.
>  * @fmt: The format to print (printf format)
>  *
> 
> what happens when @tr == NULL ?

It does nothing, but perhaps crash the kernel.

> It could allow up-flow of events to the global instance

Absolutely not!

Then it's just a reimplementation of trace_printk(). Which I refuse to
have.

Nothing should just dump to the main instance. Once we allow that, then
everyone will be dumping there and you will no longer be able to trace
anything because it will be filled with noise.

What is allowed is an event that acts like a trace_printk() but is an
event, which you can turn off (have default off), and even pick which
instance to go to.

> 
> > Thanks,
> >
> > -Jason
> >
> >  
> 
> So I wonder, is there any conceptual utility to this ?
> 
> echo 1 > instances/foo/filter_up  # enable event upflow (or query-time merging?)
> 
> Maybe enabling this causes other files (the ones missing from
> instances/foo) to magically appear
> so all those filtering capacities also appear.


I've been busy doing other things so I haven't been keeping up with
this thread (which I need to go back and read). Perhaps it was already
stated, but I don't know why you want that.

trace-cmd can read several instances (including the top level one) and
interleave them nicely, if that is what you are looking for. So can
KernelShark.

-- Steve
