Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KSRBYNbhGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:57:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79242F025D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330F710E80A;
	Thu,  5 Feb 2026 08:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JftojCoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EA710E7FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770281852;
 bh=ievRL1UrAqDbcV4FouDDI6LBWuW8kiFgJWc5S1huqZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JftojCoUDqcMhG7mjifhPlZ4N8LGER57VVo2KZZfCV+WpKua0hxWhjPTf7lARbKMl
 6j+8pzOsBi4FpiFWdChry3SjCPXKNVbVDN5YANsHL1wF4I5BfXPo1EQRJlqNpEHxc5
 xj9tUTZSpebz2PgoVy1oVk3G+syoWwNMjeBaRvf0QINw7+hOucCxT8US6aR/zjd89F
 VydDglp1+uUBayx/78rHKrW0MEUWGWVDHS3eysFvgotPSWYHGmdPlZ2/A4RXkaSPZP
 txj6zWGoEMeHE3ctPuWr3YUCRT8tB+llc71kNYa+X3Zff23xgdniGC83vubilCwmQz
 0OMa6occpwDjQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7131017E1299;
 Thu,  5 Feb 2026 09:57:31 +0100 (CET)
Date: Thu, 5 Feb 2026 09:57:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260205095727.4c3e2941@fedora>
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: 79242F025D
X-Rspamd-Action: no action

Hi Philipp,

On Tue,  3 Feb 2026 09:14:01 +0100
Philipp Stanner <phasta@kernel.org> wrote:


> +
> +    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
> +    /// gets published.
> +    ///
> +    /// The signalling critical section is marked as finished automatically once the fence signals.
> +    pub fn begin_signalling(&mut self) {
> +        // FIXME: this needs to be mutable, obviously, but we can't borrow mutably. *sigh*
> +        self.signalling = true;
> +        // TODO: Should we warn if a user tries to do this several times for the same
> +        // fence? And should we ignore the request if the fence is already signalled?
> +
> +        // SAFETY: `dma_fence_begin_signalling()` works on global lockdep data and calling it is
> +        // always safe.
> +        self.signalling_cookie = unsafe { bindings::dma_fence_begin_signalling() };

Maybe it's me misunderstanding what's happening here, but I don't think
you can tie the signalling section to the fence [published -> signalled]
timeframe. DmaFence signalling critical section is a section of code, in
a thread, that's needed for any previously published fence to be signalled,
and as such, has constraints on memory allocation types and locks it can
acquire (any lock taken while a blocking allocation happens can't be taken
in the DmaFence signalling path for instance).

But here, you're going to flag the thread doing the submission as
being in the signalling path, and this will likely be dropped in a
different thread (because the signalling will happen asynchronously,
when the job is done or cancelled). Think about this sequence for
instance:

	thread A				thread B (workqueue thread)
	
	iocl(SUBMIT_xxx) {
		create(job)
		arm(job->fence)							<- fence signalling section starts here
		queue(job)
	}

	ioctl(xxxx) {
		kmalloc(GFP_KERNEL)						<- BOOM, can't do blocking alloc in a
										   fence signalling path
	}

						job_done_work() {
							...
							signal(job->fence)	<- fence signalling section supposedly ends here in
										   a completely different thread it was started
						}

Unfortunately, I don't know how to translate that in rust, but we
need a way to check if any path code path does a DmaFence.signal(),
go back to the entry point (for a WorkItem, that would be
WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
Not only that, but we need to know all the deps that make it so
this path can be called (if I take the WorkItem example, that would
be the path that leads to the WorkItem being scheduled).

Hopefully Alice and other rust experts can come up with some ideas
to handle that.

Regards,

Boris
