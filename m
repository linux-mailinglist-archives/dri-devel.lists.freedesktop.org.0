Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HajJucii2lyQQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:21:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF511AB2F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5C010E141;
	Tue, 10 Feb 2026 12:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mtPTGOmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764F010E141
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770726113;
 bh=jMJV9tKFqsuBrmNctkDK2BnQ6D28pGD2piAupHW2p88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mtPTGOmqIKmUIBc0P69rw4gmQbmaxUYXbAXQksJSy99Pozl59V/iD875PGaMIernh
 hOMhXaaR3OH0gTJRLHee7JK2XhW8415qb2MJhg1Aj+JkCX1vYi0xUVT3qXB62cdXH2
 0Hivv1kbdmi2RB+YV7FwFPOHLFh+JoP3jBR+WVKRV0jvkgxbrIg1owOnHGD22251Es
 ofXeq/uF467EFwO4JAokOkb3kHfPc0bFJCq6sbnN1IFVkQOoAas+A+oyo1c1O3+ZI5
 QR89piZoEjJroPbJ754gK4s12lTdIs1SVv5Ct7G6f0yPFNKGDhL6nXMfKfbsQfJhIs
 X9x9K10K1+aJw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7104B17E114C;
 Tue, 10 Feb 2026 13:21:52 +0100 (CET)
Date: Tue, 10 Feb 2026 13:21:47 +0100
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
Message-ID: <20260210132147.4d5a491b@fedora>
In-Reply-To: <aYsaYBimKUaRA1Gb@google.com>
References: <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210123432.588a20f5@fedora>
 <aYsaYBimKUaRA1Gb@google.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: CFBF511AB2F
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 11:45:36 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 10:15:04 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > > impl MustBeSignalled<'_> {
> > >     /// Drivers generally should not use this one.
> > >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > > 
> > >     /// One way to ensure the fence has been signalled is to signal it.
> > >     fn signal_fence(self) -> WillBeSignalled {
> > >         self.fence.signal();
> > >         self.i_promise_it_will_be_signalled()
> > >     }
> > > 
> > >     /// Another way to ensure the fence will be signalled is to spawn a
> > >     /// workqueue item that promises to signal it.
> > >     fn transfer_to_wq(
> > >         self,
> > >         wq: &Workqueue,
> > >         item: impl DmaFenceWorkItem,
> > >     ) -> WillBeSignalled {
> > >         // briefly obtain the lock class of the wq to indicate to
> > >         // lockdep that the signalling path "blocks" on arbitrary jobs
> > >         // from this wq completing
> > >         bindings::lock_acquire(&wq->key);
> > >         bindings::lock_release(&wq->key);  
> > 
> > Sorry, I'm still trying to connect the dots here. I get that the intent
> > is to ensure the pseudo-lock ordering is always:
> >   
> >    -> dma_fence_lockdep_map
> >       -> wq->lockdep_map  
> > 
> > but how can this order be the same in the WorkItem execution path? My
> > interpretation of process_one_work() makes me think we'll end up with
> >   
> >   -> wq->lockdep_map
> >     -> work->run()
> >        -> WorkItem::run()
> >           -> dma_fence_lockdep_map
> >              -> DmaFenceSignalingWorkItem::run()  
> >                 ...
> > 
> > Am I missing something? Is there a way you can insert the
> > dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> > execution path?  
> 
> Conceptually, the dma_fence_lockdep_map is already taken by the time you
> get to WorkItem::run() because it was taken all the way back in the
> ioctl, so WorkItem::run() does not need to reacquire it.
> 
> Now, of course that does not translate cleanly to how lockdep does
> things, so in lockdep we do have to re-acquire it in WorkItem::run().
> You can do that by setting the trylock bit when calling lock_acquire()
> on dma_fence_lockdep_map. This has the correct semantics because trylock
> does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.

Ah, I never noticed dma_fence_begin_signalling() was recording a
try_lock not a regular lock. I guess it would do then.
