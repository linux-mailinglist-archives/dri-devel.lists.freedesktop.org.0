Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D5CB5DFD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875810E803;
	Thu, 11 Dec 2025 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hI+AFekK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1B10E802
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:34:04 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dRsTN6MsTz9tTQ;
 Thu, 11 Dec 2025 13:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765456440; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqu9E7aQBHmxDuPehdzIcx2FY5xq8vahFzhQwNQOBgM=;
 b=hI+AFekKmhC7u6xPHfJIzfMS3QAm20kgxb/wB7DZuMxcOdqPTCx6qK8C63zg68rY1D0CY8
 QNuauzfYXvhRfm7b6yZraoJ6HiEfC6QT+i/sHwp/J45ZeoevD3/wGtTAaAjUXeX6y8qlOo
 +fD1/uLs1PeGQp3o53+eeciWIZoc5lpeS4D2+iwDBNzkwJyObgWHyndY1qfbjWI3+DetNN
 Ezh1fUJyGr52pPGa+sFxYIQ3J15CT1zQS87fgl5wPJohyPmf+y1TaoIY9ZUomgKTVradyH
 r9Ze2ECo5Qj6Acw0/xjTtgRMv2euMD2Ldz/aLy/5XKZPkFKvFFnSUKmBCrn7DQ==
Message-ID: <34407595c6ffb9cff3e00736b1256abb75c1adef.camel@mailbox.org>
Subject: Re: Independence for dma_fences! v4
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 11 Dec 2025 13:33:57 +0100
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d5e281bf4e44679f351
X-MBO-RS-META: eh31zgcgrgus19mmqywk8kkjc4mi7367
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

On Thu, 2025-12-11 at 13:16 +0100, Christian K=C3=B6nig wrote:
> Hi everyone,
>=20
> dma_fences have ever lived under the tyranny dictated by the module
> lifetime of their issuer, leading to crashes should anybody still holding
> a reference to a dma_fence when the module of the issuer was unloaded.
>=20
> The basic problem is that when buffer are shared between drivers
> dma_fence objects can leak into external drivers and stay there even
> after they are signaled. The dma_resv object for example only lazy releas=
es
> dma_fences.
>=20
> So what happens is that when the module who originally created the dma_fe=
nce
> unloads the dma_fence_ops function table becomes unavailable as well and =
so
> any attempt to release the fence crashes the system.
>=20
> Previously various approaches have been discussed, including changing the
> locking semantics of the dma_fence callbacks (by me) as well as using the
> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
> from their actual users, but none of them are actually solving all proble=
ms.
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
>=20
> v4:
>=20
> Rebases the whole set on upstream changes, especially the cleanup
> from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".
>=20
> Adding two patches which brings the DMA-fence self tests up to date.
> The first selftest changes removes the mock_wait and so actually starts
> testing the default behavior instead of some hacky implementation in the
> test. This one should probably go upstream independent of this set.
> The second drops the mock_fence as well and tests the new RCU and inline
> spinlock functionality.
>=20
> Especially the first patch still needs a Reviewed-by, apart from that I
> think I've addressed all review comments.
>=20
> The plan is to push the core DMA-buf changes to drm-misc-next and then th=
e
> driver specific changes through the driver channels as approprite.

This does not apply to drm-misc-next (unless I'm screwing up badly).

Where can I apply it? I'd like to test the drm_sched changes before
this gets merged.

P.

>=20
> Please review and comment,
> Christian.
>=20
>=20

