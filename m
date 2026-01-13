Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F32D1A1FF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A841610E50F;
	Tue, 13 Jan 2026 16:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DnBBUHda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8406C10E50F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:13:58 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4drDnt2Zq9z9tGC;
 Tue, 13 Jan 2026 17:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1768320834; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPy6IDsyxgR6I7tCL3efb0M+UJy85KxibJHrXpRUb4E=;
 b=DnBBUHda7VPJyAKbqUDBA5SmmnsHeKyfRp/Y4+vUS7p4ClToCBiVo9llCj255r1YMtNGxk
 vIeDzN/qXURWFDknAwOPX+fbSQ8/ofgAW75YseSbo8qd27UI/ZGKsrWNfLi7xy9IQKP0Sc
 cSyeFqBzMRLWnuXlacL9e0jpOfn6q87Lx9Wl96WRvQJw3/dWbuea95n8+HmLXdRqEjOpES
 Tdfkt3a7w4C+AH1q1OrWlguNzkCTnMAQPPcKBo7Kj6o9/wsxZkL1vZUFYzvelFpvGrIYrE
 GfA/PeMcyYCXtLomNmqsyDSTbO1VMz94Y257dQZ+Czoh9OoGPSq199x40ch+TQ==
Message-ID: <195fbfacc4b3964d1239a963b683ba5471ded0a1.camel@mailbox.org>
Subject: Re: Independence for dma_fences! v5
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, matthew.brost@intel.com, sumit.semwal@linaro.org, 
 dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Tue, 13 Jan 2026 17:13:51 +0100
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 84843c69a449a301c6f
X-MBO-RS-META: kqr5zzniuxegs7g5oksqsbqx16wrkqeg
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

On Tue, 2026-01-13 at 16:16 +0100, Christian K=C3=B6nig wrote:
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
> test. This one got upstreamed independent of this set.
> The second drops the mock_fence as well and tests the new RCU and inline
> spinlock functionality.
>=20
> v5:
>=20
> Rebase on top of drm-misc-next instead of drm-tip, leave out all driver
> changes for now since those should go through the driver specific paths
> anyway.
>=20
> Address a few more review comments, especially some rebase mess and
> typos. And finally fix one more bug found by AMDs CI system.
>=20
> Especially the first patch still needs a Reviewed-by, apart from that I
> think I've addressed all review comments and problems.
>=20
> Please review and comment,
> Christian.


You forgot Danilo, who is also a drm_sched maintainer.
+Cc.

P.

>=20

