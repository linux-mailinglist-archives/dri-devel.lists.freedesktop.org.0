Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676BBD3B85
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDF910E11E;
	Mon, 13 Oct 2025 14:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cYdDTdXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C30510E11E;
 Mon, 13 Oct 2025 14:54:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4clgNx2Q5Jz9t8m;
 Mon, 13 Oct 2025 16:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760367281; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ni/5KqpXbxH47lZi6KXS7u0qGXwD7ao9vWL4UHhOhg4=;
 b=cYdDTdXgnGUaNJpWgD00j/ERXPvl2F/TGp4wh48TUjxv6X5piLvr4Qz9vn6HtV2TW5+3/j
 8BU8fk1e3LF1FyXzn+QDEV00lA2XYa6uogfih88Nzeien2SgPcidUkGwiTrps8z+IBnSFJ
 YY1G1+YKOpPUIpQJ5MxOjNBKTHIC1J7c9v3f0B2c4axhADxCyob/9Ta+1Lv5TXtDfg4f28
 t+ycRoQ2zDHTrfJ32BS6U/emGpBJ3+8CMvo+do4g7e5dphfx2Tnmg35knkKA6IB2Kw/l/p
 EHerx4kvvyxBCOUr27kiX8M0uBROLvhD8iBiNCY4mxnrcVzKXDeb02oBlaaLQg==
Message-ID: <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
Subject: Re: Independence for dma_fences!
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Mon, 13 Oct 2025 16:54:39 +0200
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d655a16cd48717b4852
X-MBO-RS-META: qheqit5ht6re8ixxgjj3ot88nzr6jhm8
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-10-13 at 15:48 +0200, Christian K=C3=B6nig wrote:
> Hi everyone,
>=20
> dma_fences have ever lived under the tyranny dictated by the module
> lifetime of their issuer, leading to crashes should anybody still holding
> a reference to a dma_fence when the module of the issuer was unloaded.
>=20
> But those days are over! The patch set following this mail finally
> implements a way for issuers to release their dma_fence out of this
> slavery and outlive the module who originally created them.
>=20
> Previously various approaches have been discussed, including changing the
> locking semantics of the dma_fence callbacks (by me) as well as using the
> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
> from their actual users.
>=20
> Changing the locking semantics turned out to be much more trickier than
> originally thought because especially on older drivers (nouveau, radeon,
> but also i915) this locking semantics is actually needed for correct
> operation.
>=20
> Using the drm_scheduler as intermediate layer is still a good idea and
> should probably be implemented to make live simpler for some drivers, but
> doesn't work for all use cases. Especially TLB flush fences, preemption
> fences and userqueue fences don't go through the drm scheduler because it
> doesn't make sense for them.
>=20
> Tvrtko did some really nice prerequisite work by protecting the returned
> strings of the dma_fence_ops by RCU. This way dma_fence creators where
> able to just wait for an RCU grace period after fence signaling before
> they could be save to free those data structures.
>=20
> Now this patch set here goes a step further and protects the whole
> dma_fence_ops structure by RCU, so that after the fence signals the
> pointer to the dma_fence_ops is set to NULL when there is no wait nor
> release callback given. All functionality which use the dma_fence_ops
> reference are put inside an RCU critical section, except for the
> deprecated issuer specific wait and of course the optional release
> callback.
>=20
> Additional to the RCU changes the lock protecting the dma_fence state
> previously had to be allocated external. This set here now changes the
> functionality to make that external lock optional and allows dma_fences
> to use an inline lock and be self contained.

Allowing for an embedded lock, is that actually necessary for the goals
of this series, or is it an optional change / improvement?

If I understood you correctly at XDC you wanted to have an embedded
lock because it improves the memory footprint and because an external
lock couldn't achieve some goals about fence-signaling-order originally
intended. Can you elaborate on that?

P.


>=20
> The new approach is then applied to amdgpu allowing the module to be
> unloaded even when dma_fences issued by it are still around.
>=20
> Please review and comment,
> Christian.
>=20

