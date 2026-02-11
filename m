Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPqaNbuZjGkhrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:01:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D712560F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5410E057;
	Wed, 11 Feb 2026 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pmQd1pHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997310E057
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770822065;
 bh=Qr0hJirRUXJ4nG3UbsCtaYyZU92hcAVog4Xnym16/6s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pmQd1pHQWhgNtYeepX6hL1Xqy860u0dyf+8VR4Up6pGkAMVk30nZc8/TE0p7kVvqw
 M0y3ptl4pqvvHu5U82ICHVgaarPdANjFocvcNx5zxhUXx7c9vvN5779SRHzQsKg7gC
 DDZvsVAWVw13sZEynSh7YSTqngYt4cUmC4ZA0wPKyFTqaFR5HxdHqYIIBIZN36/Bjg
 4iCea5Ib3B4Y3sYYGEkqOuf0hHLQHwUxm2kGuuPYBL0qpVmomQUEpPwVkvVx/U3wEC
 z3y0Qspf9g3lsOyI8FGG7xJuJ/x0mM9+MpsHF+iftKgQGNyo3A36OeVDk84xrR0ZfS
 J3J5ORkq+XoiQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ED6F17E012E;
 Wed, 11 Feb 2026 16:01:04 +0100 (CET)
Date: Wed, 11 Feb 2026 16:00:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211160059.6e0d3b60@fedora>
In-Reply-To: <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com>
 <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com>
 <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora>
 <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
 <20260211121223.78674f22@fedora>
 <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
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
	RSPAMD_URIBL_FAIL(0.00)[jobq.rs:server fail];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jobq.rs:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 788D712560F
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 15:38:32 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Feb 11, 2026 at 12:12 PM CET, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 12:00:30 +0100
> > "Danilo Krummrich" <dakr@kernel.org> wrote:  
> >> I.e. sharing a workqueue between JobQs is fine, but we have to ensure they can't
> >> be used for anything else.  
> >
> > Totally agree with that, and that's where I was going with this special
> > DmaFenceWorkqueue wrapper/abstract, that would only accept
> > scheduling MaySignalDmaFencesWorkItem objects.  
> 
> Not sure if it has to be that complicated (for a first shot). At least for the
> JobQ it would probably be enough to have a helper to create a new, let's say,
> struct JobQueueWorker that encapsulates a (reference counted) workqueue, but
> does not give access to it outside of jobq.rs.

Except we need to schedule some work items that are in the
DMA-signaling path but not directly controlled by the jobq.rs
implementation (see [1] for the post-execution work we schedule in
panthor).

The two options I can think of are:

1. Add a an unsafe interface to schedule work items on the wq attached
   to JobQ. Safety requirements in that case being compliance with the
   DMA-fence signalling rules.
2. The thing I was describing before, where we add the concept of
   DmaFenceWorkqueue that can only take MaySignalDmaFencesWorkItem. We
   can then have a DmaFenceWorkqueue that's global, and pass it to the
   JobQueue so it can use it for its own work item.

We could start with option 1, sure, but since we're going to need to
schedule post-execution work items that have to be considered part of
the DMA-signalling path, I'd rather have these concepts clearly defined
from the start.

Mind if I give this DmaFenceWorkqueue/MaySignalDmaFencesWorkItem a try
to see what it looks like a get the discussion going from there
(hopefully it's just a thin wrapper around a regular
Workqueue/WorkItem, with an extra dma_fence_signalling annotation in
the WorkItem::run() path), or are you completely against the idea?

[1]https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpu/drm/panthor/panthor_sched.c#L1913
