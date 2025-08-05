Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75021B1B6DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ACD10E6A7;
	Tue,  5 Aug 2025 14:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zl23PYxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020710E6A5;
 Tue,  5 Aug 2025 14:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A0DB5C5588;
 Tue,  5 Aug 2025 14:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B763C4CEF0;
 Tue,  5 Aug 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754405285;
 bh=yDTCqMbktP5T7/s/6qRHaUnSmDaSqNv3r3EwtVnqXMQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Zl23PYxdyrbcMtf4QHnUXgEH+BAUYflh4vqk1AiWBRDYDwgmHTppBOdzdaSM9k9xx
 WTw9QBVWN2U5SIyMqY4zMZsuJGVquhLUemjqGgDSSw7amSiyGnqrJG9koeMFUUin3e
 1MVL1tDp4/6oPQj2O9/u/d0JxxSOcmHYnT7V82nKx1xlmz904Fwo2snoBMi60OlVgP
 hHXk49QPIzuMv/Vf926DbbsKu/EBXKCuFONEqQVsih2cgu9VaqwLnYl/RM7hMf33oV
 yGv36wMeMhVs8J8zU10eLfOfMTFrGod+AFhum9ZlHlcFfh7IvaB9dxs4enM06NskHh
 g01FNu3ce8a6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 16:48:00 +0200
Message-Id: <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
Subject: Re: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the
 driver as remap
Cc: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Danilo Krummrich" <dakr@redhat.com>,
 "Connor Abbott" <cwabbott0@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lyude Paul"
 <lyude@redhat.com>, "open list" <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
To: "Rob Clark" <rob.clark@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
 <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
 <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
In-Reply-To: <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
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

On Tue Aug 5, 2025 at 4:32 PM CEST, Rob Clark wrote:
> On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
>> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> > index bbc7fecb6f4a..e21782a97fbe 100644
>> > --- a/drivers/gpu/drm/drm_gpuvm.c
>> > +++ b/drivers/gpu/drm/drm_gpuvm.c
>> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>> >                                offset =3D=3D req_offset;
>> >
>> >                       if (end =3D=3D req_end) {
>> > +                             if (merge) {
>> > +                                     /*
>> > +                                      * This is an exact remap of the=
 existing
>> > +                                      * VA (potentially flags change)=
?  Pass
>> > +                                      * this to the driver as a remap=
 so it can
>> > +                                      * do an in-place update:
>> > +                                      */
>> > +                                     struct drm_gpuva_op_map n =3D {
>> > +                                             .va.addr =3D va->va.addr=
,
>> > +                                             .va.range =3D va->va.ran=
ge,
>> > +                                             .gem.obj =3D va->gem.obj=
,
>> > +                                             .gem.offset =3D va->gem.=
offset,
>> > +                                     };
>> > +                                     struct drm_gpuva_op_unmap u =3D =
{
>> > +                                             .va =3D va,
>> > +                                             .keep =3D true,
>> > +                                     };
>> > +
>> > +                                     return op_remap_cb(ops, priv, NU=
LL, &n, &u);
>> > +                             }
>>
>> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries t=
he
>> struct drm_gpuva to unmap. You can easily compare this to the original r=
equest
>> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
>>
>> Which is what you have to do for any other unmap operation that has keep=
 =3D=3D true
>> anyways, e.g. if D is the exact same as A, B and C.
>>
>>         Cur
>>         ---
>>         1                       N
>>         |---A---|---B---|---C---|
>>
>>         Req
>>         ---
>>         1                       N
>>         |-----------D-----------|
>
> Ugg, this means carrying around more state between the unmap and map
> callbacks, vs. just handing all the data to the driver in a single
> callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
> unmap.. I guess in your case the map operation is tolerant of
> overwriting existing mappings so this works out, which isn't the case
> with io_pgtable.

There is no "your case" as far as I'm concerned. Please don't think that I =
don't
care about solving a problem, just because it's not relevant for any of the
drivers or subsystems I maintain. :)

> I guess I could handle the specific case of an exact in-place remap in
> the driver to handle this specific case.  But the example you give
> with multiple mappings would be harder to cope with.
>
> I still feel there is some room for improvement in gpuvm to make this
> easier for drivers.  Maybe what I proposed isn't the best general
> solution, but somehow giving the drivers info about both the unmaps
> and maps in the same callback would make things easier (and the remap
> callback is _almost_ that).

I generally agree with that, my concern is more about this specific patch.

There are patches on the list that replace all the req_* arguments of
__drm_gpuvm_sm_map() with a new struct drm_gpuvm_map_req.

Maybe the unmap callbacks could simply provide a pointer to this object?

> BR,
> -R
>
>>
>> In this case you get three unmap ops with keep =3D=3D true, which you ca=
n compare to
>> your request to figure out that you can keep the corresponding PTEs.
>>
>> Besides that it changes the semantics that the documentation mentions an=
d that
>> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap represe=
nts
>> an actual change and any call to __drm_gpuvm_sm_map() results in an arbi=
trary
>> number of unmap ops, a maximum of two remap ops and exactly one map oper=
ation.
>>
>> >                               ret =3D op_unmap_cb(ops, priv, va, merge=
);
>> >                               if (ret)
>> >                                       return ret;

