Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KJkHwc4i2kKRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:52:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4611B708
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C4610E2BD;
	Tue, 10 Feb 2026 13:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Lsfgc3Oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9800B10E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770731521;
 bh=ptAp3UBY7Z7YEPWsB4A/QpHNzBY+YFPPb9hovwlyhuU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lsfgc3OiRSZWCdL4EdJGSCHr+E4dvHD7Rh6/ZRXK5f6BsnivBCwNyIcrRbIppCtDz
 ogOTuUx3be9F3Yn7+vsDf5iEg/wYDVRuXP966Zg8ZCrtrm2bjX691yb8wJh/KbavNA
 dDoKGp2J8+8RIF1ja77pJmax5iIQKWfi4fEWAt33fWXEAbiKuw9wZUoG8ybnU2coLV
 5HtBwThwhPl3Jn0la/1MhfPeewN0Ulap7jPtqO8ebclSVj+EvM+P9e63CSa1p7e7sC
 Cog7R11WlVfw0i1L5o+QApPkndVMRHfgf5O3wjEX7yvNxtSER18i0P2Qk222qPi3HZ
 BrJ4VX2TEZYTg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 79D8417E0699;
 Tue, 10 Feb 2026 14:52:00 +0100 (CET)
Date: Tue, 10 Feb 2026 14:51:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp
 Stanner <phasta@mailbox.org>, phasta@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260210145156.108ab292@fedora>
In-Reply-To: <aYsyGAwy4rq-H7Hd@google.com>
References: <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
 <aYsyGAwy4rq-H7Hd@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C3F4611B708
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 13:26:48 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 10:15:04 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > > /// The owner of this value must ensure that this fence is signalled.
> > > struct MustBeSignalled<'fence> { ... }
> > > /// Proof value indicating that the fence has either already been
> > > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > > /// up the proof value.
> > > struct WillBeSignalled<'fence> { ... }  
> > 
> > Sorry, I have more questions, unfortunately. Seems that
> > {Must,Will}BeSignalled are targeting specific fences (at least that's
> > what the doc and 'fence lifetime says), but in practice, the WorkItem
> > backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> > met, and N > 1 if more than one job is ready). Similarly, an IRQ
> > handler can signal 0-N fences (can be that the IRQ has nothing to do we
> > job completion, or, it can be that multiple jobs have completed). How
> > is this MustBeSignalled object going to be instantiated in practice if
> > it's done before the DmaFenceWorkItem::run() function is called?  
> 
> The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
> that ensures a specific fence is signalled. If you have code that
> manages a collection of fences and invokes code for specific fences
> depending on outside conditions, then that's a different matter.
> 
> After all, transfer_to_wq() has two components:
> 1. Logic to ensure any spawned workqueue job eventually gets to run.
> 2. Once the individual job runs, logic specific to the one fence ensures
>    that this one fence gets signalled.

Okay, that's a change compared to how things are modeled in C (and in
JobQueue) at the moment: the WorkItem is not embedded in a specific
job, it's something that's attached to the JobQueue. The idea being
that the WorkItem represents a task to be done on the queue itself
(check if the first element in the queue is ready for execution), not on
a particular job. Now, we could change that and have a per-job WorkItem,
but ultimately, we'll have to make sure jobs are dequeued in order
(deps on JobN can be met before deps on Job0, but we still want JobN to
be submitted after Job0), and we'd pay the WorkItem overhead once per
Job instead of once per JobQueue. Probably not the end of the world,
but it's worth considering, still.

> And {Must,Will}BeSignalled exists to help model part (2.). But what you
> described with the IRQ callback falls into (1.) instead, which is
> outside the scope of {Must,Will}BeSignalled (or at least requires more
> complex APIs).

For IRQ callbacks, it's not just about making sure they run, but also
making sure nothing in there can lead to deadlocks, which is basically
#2, except it's not scoped to a particular fence. It's just a "fences
can be signaled from there" marker. We could restrict it to "fences of
this particular implementation can be signaled from there" but not
"this particular fence instance will be signaled next, if any", because
that we don't know until we've walked some HW state to figure out which
job is complete and thus which fence we need to signal (the interrupt
we get is most likely multiplexing completion on multiple GPU contexts,
so before we can even get to our per-context in-flight-jobs FIFO, we
need to demux this thing).
