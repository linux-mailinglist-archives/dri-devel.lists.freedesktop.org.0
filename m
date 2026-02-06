Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NEbJJe/hWnEFwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:16:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3EFC90D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2866010E6C8;
	Fri,  6 Feb 2026 10:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oh8BuHVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8AC10E6C8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:16:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0ACF243AAF;
 Fri,  6 Feb 2026 10:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6E4C116C6;
 Fri,  6 Feb 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770373010;
 bh=uWFvkPo2jAVmYgug3FLkwIosXWlv9dOkXenRhtzUySI=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=oh8BuHVRk+pnoBdLUE5n/9xMy3O7NJUNGHP5G59cqkM0KQ296EUV7DabvrkB2dvPJ
 qPFlDLcr2tdXRTrPsB5HAbgyUv3Tow7eJAewCq+npGu411Eci4GJjGJPXQ2eL7yvD8
 J8QszSJgFOyVUycDMht9jjA4p06UnLOcfeC47EN95c+B4SWnLw1nhJC2ICxoXSixEr
 QwHLWkTvTOfaCr8Q5xWYBMeGP7e1shlqQjhTt7sPbE2NsCZylDwuioG1iu90TRvQGi
 X6Cigam6O6fFz6W0ax6IHWX2SrEoS8CQLT99OmsQefSBT+6c6/pNJ+2yx2NinytdF0
 fn+kSvKWuDrBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:16:46 +0100
Message-Id: <DG7SURIB90VK.1B71FGJR6U5GZ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: <phasta@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
 <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
In-Reply-To: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,collabora.com,gmail.com,ffwll.ch,google.com,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:gary@garyguo.net,m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:aliceryhl@google.com,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:phasta@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 18A3EFC90D
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 10:32 AM CET, Philipp Stanner wrote:
> Who needs fences from another driver?

When you get VM_BIND and EXEC IOCTLs a driver takes a list of syncobjs the
submitted job should wait for before execution.

The fences of those syncobjs can be from anywhere, including other DRM driv=
ers.

> I think we should go one step back here and question the general
> design.
>
> I only included data: T because it was among the early feedback that
> this is how you do it in Rust.
>
> I was never convinced that it's a good idea. Jobqueue doesn't need the
> 'data' field. Can anyone think of anyone who would need it?
>
> What kind of data would be in there? It seems a driver would store its
> equivalent of C's
>
> struct my_fence {
>    struct dma_fence f;
>    /* other driver data */
> }
>
> which is then accessed in C with container_of.

Your current struct is exactly this pattern:

	struct DmaFence<T> {
	    inner: Opaque<bindings::dma_fence>,
	    ...
	    data: T,
	}

So, in Rust you can just write DmaFence<MyData> rather than,

	struct my_dma_fence {
		struct dma_fence inner;
		struct my_data data;
	}

> But that data is only ever needed by that very driver.

Exactly, this is the "owned" type that is only ever used by this driver.

> They are *not* a data transfer mechanism. It seems very wrong design-
> wise to transfer generic data T from one driver to another. That's not
> a fence's purpose. Another primitive should be used for that.
>
> If another driver could touch / consume / see / use the emitter's data:
> T, that would grossly decouple us from the original dma_fence design.
> It would be akin to doing a container_of to consume foreign driver
> data.

Correct, that's why the suggestion here was to have a second type that is o=
nly

	struct ForeignDmaFence {
	    inner: Opaque<bindings::dma_fence>,
	    ...,
	    /* No data. */
	}

i.e. it does not not provide access to the rest of the allocation, since it=
 is
private to the owning driver.

This type should also not have methods like signal(), since only the owner =
of
the fence should be allowed to signal the fence.
