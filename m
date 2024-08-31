Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D0966FF9
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513C10E0B1;
	Sat, 31 Aug 2024 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F0AJs6Y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC5010E0B1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725088438;
 bh=g2IjUGiloe+I9Bxz5i7qZEHJPMDj/Co1Vb2EbekTfUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F0AJs6Y/d0hBu2rYR035baq3lXwIZavzGwuv/VuyTvI8geKz9mY2Upny/llZHQKii
 NikhA1evBgViWIww2vGZDVCzuRqo+4OFDkXG7lLeb4C0GwwD0WcXA0PmEgEHT2fYvs
 PfsqYFkG5VNKH4dnUmHzXyUcleBQabC+SuoQFzWSuZSruu1KvuTry/daDwUh0Wlypf
 Nj8uxiYih8E2Q6DdfyvPa97vjdIbGZDMm9pCxnRg66gyeQDVr+QX8aH9kxnZPd2gtF
 aSsZ2jqAkhRRRD3Gv8RtntI6ton6wRCxa0hdqh+jV3/J3aaahqkP2vE3OEu3TXJ632
 8Tf/a19gn+IsA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E821E17E0F75;
 Sat, 31 Aug 2024 09:13:57 +0200 (CEST)
Date: Sat, 31 Aug 2024 09:13:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
Message-ID: <20240831091352.1f212fff@collabora.com>
In-Reply-To: <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
References: <20240830104057.1479321-1-boris.brezillon@collabora.com>
 <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hi Matthew,

On Fri, 30 Aug 2024 22:28:19 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Fri, Aug 30, 2024 at 12:40:57PM +0200, Boris Brezillon wrote:
> > dma_fence objects created by drm_sched might hit other subsystems, which
> > means the fence object might potentially outlive the drm_sched module
> > lifetime, and at this point the dma_fence::ops points to a memory region
> > that no longer exists.
> >=20
> > In order to fix that, let's make sure the drm_sched_fence code is always
> > statically linked, just like dma-fence{-chain}.c does.
> >=20
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Just like for the other UAF fix, this is an RFC, as I'm not sure that's
> > how we want it fixed. The other option we have is to retain a module ref
> > for each initialized fence and release it when the fence is freed. =20
>=20
> So this is different than your other patch. From Xe PoV the other patch
> is referencing an object which is tied to an IOCTL rather than a module
> whereas this referencing a module.

Well, it's not fixing the exact same problem either. My other patch was
about making sure the timeline name string doesn't disappear when a
scheduler is destroyed, which can happen while the module is still
loaded. As Christian pointed out, the "module unload while fences
exist" problem can be solved by binding the module refcounting to
the drm_sched_fence_timeline object lifetime, but I wanted to show a
simpler alternative to this approach with this patch.

> If a module can disappear when fence
> tied to the module, well that is a bit scary and Xe might have some
> issues there - I'd have audit our of exporting internally created
> fences.

Yeah, I moved away from exposing driver fences directly because of
that. Now all I expose to the outside world are drm_sched_fence
objects, which just moves the problem one level down, but at least we
can fix it generically if all the drivers take this precaution.

>=20
> Based on Christian's feedback we really shouldn't be allowing this but
> also don't really love the idea of a fence holding a module ref either.
>=20
> Seems like we need a well defined + documented rule - exported fences
> need to be completely decoupled from the module upon signaling

That basically means patching drm_sched_fence::ops (with the lock held)
at signal time so it points to a dummy ops that's statically linked
(something in dma-fence.c, I guess). But that also means the names
returned by get_{driver,timeline}_name() no longer reflect the original
fence owner after signalling, or you have to do some allocation+copy
of these strings. Neither of these options sound good to me.

> or
> exported fences must retain a module ref.

Yes, and that's the option I was originally heading to, until I
realized we have a 3rd option that's already working well for the core
dma-fence code (AKA the stub, the chain, and other containers I might
have missed). If the code is not in a module but instead statically
linked, all our module-lifetime vs fence-lifetime issues go away
without resorting to this module refcounting trick. Given sched_fence.c
is pretty self-contained (no deps on other DRM functions that might be
linked as a module), I now think this is our best shot for drm_sched
fences.

The story is a bit different for driver fences exposed to the outside
world, but if you're using drm_sched, I see no good reason for not using
the drm_sched_fence proxy for all your fences. Note that the same kind
of proxy can be generalized at the dma-fence.c level if it's deemed
valuable for other subsystems.

The idea behind it being that:

- the dma_fence_proxy ops should live in dma-fence.c (or any other
  object that's statically linked)
- driver and timeline names attached to a proxy need to be dynamically
  allocated and owned by some dma_fence_proxy_context object
- the dma_fence_proxy_context object needs to be refcounted, and each
  fence attached to this 'fence-context' needs to hold a ref on this
  struct

> I'd probably lean towards the
> former.

For the reasons exposed above, I don't think that's a viable option,
unless we decide we no longer care about the fence origin after
signalling happened (which would be a mess for people looking a
dma_buf's debug file to be honest).

> One reason to support the former is fences can be released in
> IRQ contexts and dropping a module ref in IRQ context seems a bit
> problematic. Also because some oher part of kernel holds on to fence ref
> lazily block a module unload just seems wrong.

There's always the option to defer the release if we're in a context
where we can't release immediately. But I think we're overthinking it.
For the drm_sched_fence, the simple answer is to make this code static,
just like dma-fence{-chain}.c.

>=20
> Sorry if above we have well defined rule and I'm just not aware.

AFAICT, it's not.

Regards,

Boris
