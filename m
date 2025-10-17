Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFCBE72D3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5410EB5B;
	Fri, 17 Oct 2025 08:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lG9uCBkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515B610EB5B;
 Fri, 17 Oct 2025 08:32:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cnyjc0Jtxz9tFN;
 Fri, 17 Oct 2025 10:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760689924; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmEtM+tBvyNR8tKZRftb9/HButF7a/0q04v2fWmUSto=;
 b=lG9uCBktbUoT5Va6j1PSoL57TFAVi2bVuiQzvSxw7d0+WZjO2a/EPwwn1DqUIkqdS2JJ/U
 h/1dJgq9JOiDcT1GIbqfUTAmDWCJ0XScBtR6zvdvRp+VJh4M4R1TQHypzo1JOpqXfKpPMX
 MJcM6tMnzWBZE2BaVMaiYwP2PcBRp/bij+qtZt1S8/mHdtsd2D99QpX8DlC0SRldGi5DT9
 Nrq7/0j3fUlPEU54hfAgpe19QF6Qo2v7wMlvLcXLCM7ztJXLFAgCKraXEcGns7tdtNHa/c
 g1dVRTRuEhA9GpJgVeLGvLe2l1/T7SoVaCCwHHrs+kiDrTj9jJSR3bZde6X0QQ==
Message-ID: <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
Subject: Re: Independence for dma_fences!
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 17 Oct 2025 10:32:01 +0200
In-Reply-To: <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 275ca5eb86323de5772
X-MBO-RS-META: u3dge87t3hrqqpaa7epc41mk6w1za3k7
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

On Tue, 2025-10-14 at 17:54 +0200, Christian K=C3=B6nig wrote:
> On 13.10.25 16:54, Philipp Stanner wrote:
> > On Mon, 2025-10-13 at 15:48 +0200, Christian K=C3=B6nig wrote:
> > > Hi everyone,
> > >=20
> > > dma_fences have ever lived under the tyranny dictated by the module
> > > lifetime of their issuer, leading to crashes should anybody still hol=
ding
> > > a reference to a dma_fence when the module of the issuer was unloaded=
.
> > >=20
> > > But those days are over! The patch set following this mail finally
> > > implements a way for issuers to release their dma_fence out of this
> > > slavery and outlive the module who originally created them.
> > >=20
> > > Previously various approaches have been discussed, including changing=
 the
> > > locking semantics of the dma_fence callbacks (by me) as well as using=
 the
> > > drm scheduler as intermediate layer (by Sima) to disconnect dma_fence=
s
> > > from their actual users.
> > >=20
> > > Changing the locking semantics turned out to be much more trickier th=
an
> > > originally thought because especially on older drivers (nouveau, rade=
on,
> > > but also i915) this locking semantics is actually needed for correct
> > > operation.
> > >=20
> > > Using the drm_scheduler as intermediate layer is still a good idea an=
d
> > > should probably be implemented to make live simpler for some drivers,=
 but
> > > doesn't work for all use cases. Especially TLB flush fences, preempti=
on
> > > fences and userqueue fences don't go through the drm scheduler becaus=
e it
> > > doesn't make sense for them.
> > >=20
> > > Tvrtko did some really nice prerequisite work by protecting the retur=
ned
> > > strings of the dma_fence_ops by RCU. This way dma_fence creators wher=
e
> > > able to just wait for an RCU grace period after fence signaling befor=
e
> > > they could be save to free those data structures.
> > >=20
> > > Now this patch set here goes a step further and protects the whole
> > > dma_fence_ops structure by RCU, so that after the fence signals the
> > > pointer to the dma_fence_ops is set to NULL when there is no wait nor
> > > release callback given. All functionality which use the dma_fence_ops
> > > reference are put inside an RCU critical section, except for the
> > > deprecated issuer specific wait and of course the optional release
> > > callback.
> > >=20
> > > Additional to the RCU changes the lock protecting the dma_fence state
> > > previously had to be allocated external. This set here now changes th=
e
> > > functionality to make that external lock optional and allows dma_fenc=
es
> > > to use an inline lock and be self contained.
> >=20
> > Allowing for an embedded lock, is that actually necessary for the goals
> > of this series, or is it an optional change / improvement?
>=20
> It is kind of necessary because otherwise you can't fully determine the l=
ifetime of the lock.
>=20
> The lock is used to avoid signaling a dma_fence when you modify the linke=
d list of callbacks for example.
>=20
> An alternative would be to protect the lock by RCU as well instead of emb=
edding it in the structure, but that would make things even more complicate=
d.
>=20
> > If I understood you correctly at XDC you wanted to have an embedded
> > lock because it improves the memory footprint and because an external
> > lock couldn't achieve some goals about fence-signaling-order originally
> > intended. Can you elaborate on that?
>=20
> The embedded lock is also nice to have for the dma_fence_array, dma_fence=
_chain and drm_sched_fence, but that just saves a few cache lines in some u=
se cases.
>=20
> The fence-signaling-order is important for drivers like radeon where the =
external lock is protecting multiple fences from signaling at the same time=
 and makes sure that everything stays in order.

I mean, neither external nor internal lock can somehow force the driver
to signal fences in order, can they?

Only the driver can ensure this.

I am, however, considering modeling something like that on a
FenceContext object:

fctx.signal_all_fences_up_to_ordered(seqno);


P.

>=20
> While it is possible to change the locking semantics on such old drivers,=
 it's probably just better to stay away from it.
>=20
> Regards,
> Christian.
>=20
> >=20
> > P.
> >=20
> >=20
> > >=20
> > > The new approach is then applied to amdgpu allowing the module to be
> > > unloaded even when dma_fences issued by it are still around.
> > >=20
> > > Please review and comment,
> > > Christian.
> > >=20
> >=20
>=20

