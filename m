Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6175494A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 16:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296F110E11B;
	Sat, 15 Jul 2023 14:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Sat, 15 Jul 2023 14:20:22 UTC
Received: from out-59.mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5BA10E11B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 14:20:21 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1689430474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Exn0iOvVonsyS0RrlLSc0WGJin7aNNSG8UVnuWPxU9U=;
 b=t/W/IPYE3d7Jq/unFMsbXJLxEErOfxhf4yu6/72S9Q+SjRgLquoMqkKQezx0JsO0jec71+
 yd+XLox94l1Rfe6tP4f0GcgRUtGtt/xPEv/GSU+tBZQvYVqiAN/zt3VjScJGnhmQmSz8m7
 MMDRXTatfmE2t5WRkGqzmkO7/LO4PLUROW1+MkN1rDaKE7DhehIwcvxF1MR0d9uLTXMfka
 Ef8flkwck6XqlzG6u4sO0BSYHaVQp2pEPPvulTePYrEPcZP8KhFLY5KLGZpCYWc2o0YCiQ
 xWXhEW24YGpZ9EVSG627zq5mggx8+PTHVDLZdqxUlRhTv+WXAtsJ43TJhIf2ow==
Date: Sat, 15 Jul 2023 14:14:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: alyssa@rosenzweig.io
Message-ID: <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
TLS-Required: No
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
To: "Luben Tuikov" <luben.tuikov@amd.com>,
 "=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=" <christian.koenig@amd.com>, "Asahi
 Lina" <lina@asahilina.net>, "David Airlie" <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "Sumit Semwal" <sumit.semwal@linaro.org>
In-Reply-To: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15 July 2023 at 00:03, "Luben Tuikov" <luben.tuikov@amd.com> wrote:


>=20
>=20On 2023-07-14 05:57, Christian K=C3=B6nig wrote:
>=20
>=20>=20
>=20> Am 14.07.23 um 11:49 schrieb Asahi Lina:
> >=20
>=20> >=20
>=20> > On 14/07/2023 17.43, Christian K=C3=B6nig wrote:
> > >=20
>=20>=20
>=20>  Am 14.07.23 um 10:21 schrieb Asahi Lina:
> >  A signaled scheduler fence can outlive its scheduler, since fences a=
re
> >  independencly reference counted. Therefore, we can't reference the
> >  scheduler in the get_timeline_name() implementation.
> >=20
>=20>  Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when share=
d
> >  dma-bufs reference fences from GPU schedulers that no longer exist.
> >=20
>=20>  Signed-off-by: Asahi Lina <lina@asahilina.net>
> >  ---
> >  =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
> >  =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_fence.c=C2=A0 | 4 +++-
> >  =C2=A0=C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> >  =C2=A0=C2=A0 3 files changed, 14 insertions(+), 2 deletions(-)
> >=20
>=20>  diff --git a/drivers/gpu/drm/scheduler/sched_entity.c=20
>=20>  b/drivers/gpu/drm/scheduler/sched_entity.c
> >  index b2bbc8a68b30..17f35b0b005a 100644
> >  --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >  +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >  @@ -389,7 +389,12 @@ static bool=20
>=20>  drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity=
)
> >  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /*
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
 Fence is from the same scheduler, only need to wait for
> >  -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it to be schedul=
ed
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it to be schedul=
ed.
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note: s_fence->s=
ched could have been freed and reallocated
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * as another sched=
uler. This false positive case is okay,=20
>=20>  as if
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the old schedule=
r was freed all of its jobs must have
> >  +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * signaled their c=
ompletion fences.
> >=20
>=20>  This is outright nonsense. As long as an entity for a scheduler ex=
ists
> >  it is not allowed to free up this scheduler.
> >=20
>=20>  So this function can't be called like this.
> >=20
>=20> >=20
>=20> > As I already explained, the fences can outlive their scheduler. T=
hat=20
>=20> >  means *this* entity certainly exists for *this* scheduler, but t=
he=20
>=20> >  *dependency* fence might have come from a past scheduler that wa=
s=20
>=20> >  already destroyed along with all of its entities, and its addres=
s reused.
> > >=20
>=20>=20
>=20>=20=20
>=20>  Well this is function is not about fences, this function is a call=
back=20
>=20>  for the entity.
> >=20=20
>=20>=20
>=20> >=20
>=20> > Christian, I'm really getting tired of your tone. I don't appreci=
ate=20
>=20> >  being told my comments are "outright nonsense" when you don't ev=
en=20
>=20> >  take the time to understand what the issue is and what I'm tryin=
g to=20
>=20> >  do/document. If you aren't interested in working with me, I'm ju=
st=20
>=20> >  going to give up on drm_sched, wait until Rust gets workqueue su=
pport,=20
>=20> >  and reimplement it in Rust. You can keep your broken fence lifet=
ime=20
>=20> >  semantics and I'll do my own thing.
> > >=20
>=20>=20
>=20>=20=20
>=20>  I'm certainly trying to help here, but you seem to have unrealisti=
c=20
>=20>  expectations.
> >=20=20
>=20>  I perfectly understand what you are trying to do, but you don't se=
em to=20
>=20>  understand that this functionality here isn't made for your use ca=
se.
> >=20=20
>=20>  We can adjust the functionality to better match your requirements,=
 but=20
>=20>  you can't say it is broken because it doesn't work when you use it=
 not=20
>=20>  in the way it is intended to be used.
> >=20
>=20
> I believe "adjusting" functionality to fit some external requirements,
> may have unintended consequences, requiring yet more and more "adjustme=
nts".
> (Or may allow (new) drivers to do wild things which may lead to wild re=
sults. :-) )
>=20
>=20We need to be extra careful and wary of this.

Either drm/scheduler is common code that we should use for our driver, in=
 which case we need to "adjust" it to fit the requirements of a safe Rust=
 abstraction usable for AGX. Or, drm/scheduler is not common code intende=
d for drivers with our requirements, and then we need to be able to write=
 our own scheduler.

AMD has NAK'd both options, effectively NAK'ing the driver.

I will ask a simple yes/no question: Should we use drm/sched?

If yes, it will need patches like these, and AMD needs to be ok with that=
 and stop NAK'ing them on sight becuase they don't match the existing req=
uirements.

If no, we will write our own scheduler in Rust, and AMD needs to be ok wi=
th that and not NAK it on sight because it's not drm/sched.

Which is it?

Note if we write a Rust scheduler, drm/sched and amdgpu will be unaffecte=
d. If we do that and AMD comes back and NAKs it -- as said in this thread=
 would "probably" happen -- then it is impossible for us to upstream a dr=
iver regardless of whether we use drm/sched.

Lina has been polite and accommodating while AMD calls her code "outright=
 nonsense" and gets "outright NAK"s, and puts her into an impossible catc=
h-22 where no matter what she does it's NAK'd.

That's not ok.
