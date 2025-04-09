Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2597A82943
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9BA10E937;
	Wed,  9 Apr 2025 15:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LS9up8sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BF210E931;
 Wed,  9 Apr 2025 15:04:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZXmSR19b9z9t7P;
 Wed,  9 Apr 2025 17:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744211063; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXNbrTLUQrlYNydORT5K+rP57dVB2oADM2jV2AgBth4=;
 b=LS9up8szfCpBJACvt4gXa2EtpB97sVavX67wzRPpNDGRm6AHGs0RWhd+AXtPqRnp9op8zM
 yE04pWSHbv+2bVCH/VYb7yTY+oy+qVUAZ4WW9/6lnP3PpHLGzc4tcRtTF4O7CQkK3tXhvX
 cCiMrZuEgIld1a2KfjtHsIUu/oAQCKCx7fGs11u4gWzMoATXWnWjLCYPUuT99rUvw0HFVE
 FckYqYRVDbBSXy1btg0Kjd2aoH0hjFAIPruG1nC4IsLJddiCYtoMfHQpDpP9RKPQBOiAnR
 HJHimkXP9tmHGGqthFRauJolLOimIaLd2csSieO9zeWinLAUXQxNFxqKta20mA==
Message-ID: <0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,  Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>,  Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,  Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,  Steven Price
 <steven.price@arm.com>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>,  Matthew Brost <matthew.brost@intel.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Melissa Wen
 <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Zack
 Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Bas Nieuwenhuizen
 <bas@basnieuwenhuizen.nl>,  Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Tim Huang <tim.huang@amd.com>,  Sathishkumar S
 <sathishkumar.sundararaju@amd.com>, Saleemkhan Jamadar
 <saleemkhan.jamadar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang
 <jinhuieric.huang@amd.com>, Asad Kamal <asad.kamal@amd.com>, Srinivasan
 Shanmugam <srinivasan.shanmugam@amd.com>,  Jack Xiao <Jack.Xiao@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <mdaenzer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev,  spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 17:04:00 +0200
In-Reply-To: <334e843c-d7fe-4e33-b4fc-f3d18226465a@amd.com>
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-3-phasta@kernel.org>
 <20250409143917.31303d22@collabora.com>
 <73d41cd84c73b296789b654e45125bfce88e0dbf.camel@mailbox.org>
 <72eb974dfea8fa1167cf97e29848672223f6fc5b.camel@mailbox.org>
 <ab7d1937-d0e9-45f8-8f7d-ddd7a1a9d3d5@amd.com>
 <9a90f7f14c22c01aa28d89aa91bf4dfa4049c062.camel@mailbox.org>
 <334e843c-d7fe-4e33-b4fc-f3d18226465a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 9wh48drngnos9i43y9zpcu5f5mrpihgx
X-MBO-RS-ID: f0082fb0ff96fc9be99
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

On Wed, 2025-04-09 at 16:10 +0200, Christian K=C3=B6nig wrote:
> Am 09.04.25 um 16:01 schrieb Philipp Stanner:
> > On Wed, 2025-04-09 at 15:14 +0200, Christian K=C3=B6nig wrote:
> > > Am 09.04.25 um 14:56 schrieb Philipp Stanner:
> > > > On Wed, 2025-04-09 at 14:51 +0200, Philipp Stanner wrote:
> > > > > On Wed, 2025-04-09 at 14:39 +0200, Boris Brezillon wrote:
> > > > > > Hi Philipp,
> > > > > >=20
> > > > > > On Wed,=C2=A0 9 Apr 2025 14:06:37 +0200
> > > > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > > >=20
> > > > > > > dma_fence_is_signaled()'s name strongly reads as if this
> > > > > > > function
> > > > > > > were
> > > > > > > intended for checking whether a fence is already
> > > > > > > signaled.
> > > > > > > Also
> > > > > > > the
> > > > > > > boolean it returns hints at that.
> > > > > > >=20
> > > > > > > The function's behavior, however, is more complex: it can
> > > > > > > check
> > > > > > > with a
> > > > > > > driver callback whether the hardware's sequence number
> > > > > > > indicates
> > > > > > > that
> > > > > > > the fence can already be treated as signaled, although
> > > > > > > the
> > > > > > > hardware's /
> > > > > > > driver's interrupt handler has not signaled it yet. If
> > > > > > > that's
> > > > > > > the
> > > > > > > case,
> > > > > > > the function also signals the fence.
> > > > > > >=20
> > > > > > > (Presumably) this has caused a bug in Nouveau (unknown
> > > > > > > commit),
> > > > > > > where
> > > > > > > nouveau_fence_done() uses the function to check a fence,
> > > > > > > which
> > > > > > > causes a
> > > > > > > race.
> > > > > > >=20
> > > > > > > Give the function a more obvious name.
> > > > > > This is just my personal view on this, but I find the new
> > > > > > name
> > > > > > just
> > > > > > as
> > > > > > confusing as the old one. It sounds like something is
> > > > > > checked,
> > > > > > but
> > > > > > it's
> > > > > > clear what, and then the fence is forcibly signaled like it
> > > > > > would
> > > > > > be
> > > > > > if
> > > > > > you call drm_fence_signal(). Of course, this clarified by
> > > > > > the
> > > > > > doc,
> > > > > > but
> > > > > > given the goal was to make the function name clearly
> > > > > > reflect
> > > > > > what
> > > > > > it
> > > > > > does, I'm not convinced it's significantly better.
> > > > > >=20
> > > > > > Maybe dma_fence_check_hw_state_and_propagate(), though it
> > > > > > might
> > > > > > be
> > > > > > too long of name. Oh well, feel free to ignore this
> > > > > > comments if
> > > > > > a
> > > > > > majority is fine with the new name.
> > > > > Yoa, the name isn't perfect (the perfect name describing the
> > > > > whole
> > > > > behavior would be
> > > > > dma_fence_check_if_already_signaled_then_check_hardware_state
> > > > > _and
> > > > > _pro
> > > > > pa
> > > > > gate() ^^'
> > > > >=20
> > > > > My intention here is to have the reader realize "watch out,
> > > > > the
> > > > > fence
> > > > > might get signaled here!", which is probably the most
> > > > > important
> > > > > event
> > > > > regarding fences, which can race, invoke the callbacks and so
> > > > > on.
> > > > >=20
> > > > > For details readers will then check the documentation.
> > > > >=20
> > > > > But I'm of course open to see if there's a majority for this
> > > > > or
> > > > > that
> > > > > name.
> > > > how about:
> > > >=20
> > > > dma_fence_check_hw_and_signal() ?
> > > I don't think that renaming the function is a good idea in the
> > > first
> > > place.
> > >=20
> > > What the function does internally is an implementation detail of
> > > the
> > > framework.
> > >=20
> > > For the code using this function it's completely irrelevant if
> > > the
> > > function might also signal the fence, what matters for the caller
> > > is
> > > the returned status of the fence. I think this also counts for
> > > the
> > > dma_fence_is_signaled() documentation.
> > It does obviously matter. As it's currently implemented, a lot of
> > important things happen implicitly.
>=20
> Yeah, but that's ok.
>=20
> The code who calls this is the consumer of the interface and so
> shouldn't need to know this. That's why we have created the DMA fence
> framework in the first place.
>=20
> For the provider side when a driver or similar implements the
> interface the relevant documentation is the dma_fence_ops structure.
>=20
> > I only see improvement by making things more obvious.
> >=20
> > In any case, how would you call a wrapper that just does
> > test_bit(IS_SIGNALED, =E2=80=A6) ?
>=20
> Broken, that was very intentionally removed quite shortly after we
> created the framework.
>=20
> We have a few cases were implementations do check that for their
> fences, but consumers should never be allowed to touch such
> internals.

There is theory and there is practice. In practice, those internals are
being used by Nouveau, i915, Xe, vmgfx and radeon.

So it seems that we failed quite a bit at communicating clearly how the
interface should be used.

And, to repeat myself, with both name and docu of that function, I
think it is very easy to misunderstand what it's doing. You say that it
shouldn't matter =E2=80=93 and maybe that's true, in theory. In practice, i=
t
does matter. In practice, APIs get misused and have side-effects. And
making that harder is desirable.

In any case, I might have to add another such call to Nouveau, because
the solution preferred by you over the callback causes another race.
Certainly one could solve this in a clean way, but someone has to do
the work, and we're talking about more than a few hours here.

In any case, be so kind and look at patch 2 and tell me there if you're
at least OK with making the documentation more detailed.

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > P.
> >=20
> > > What we should improve is the documentation of the dma_fence_ops-
> > > > enable_signaling and dma_fence_ops->signaled callbacks.
> > > Especially see the comment about reference counts on
> > > enable_signaling
> > > which is missing on the signaled callback. That is most likely
> > > the
> > > root cause why nouveau implemented enable_signaling correctly but
> > > not
> > > the other one.
> > >=20
> > > But putting that aside I think we should make nails with heads
> > > and
> > > let the framework guarantee that the fences stay alive until they
> > > are
> > > signaled (one way or another). This completely removes the burden
> > > to
> > > keep a reference on unsignaled fences from the drivers /
> > > implementations and make things more over all more defensive.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > P.
> > > >=20
> > > > > P.
> > > > >=20
> > > > >=20
> > > > > > Regards,
> > > > > >=20
> > > > > > Boris
>=20

