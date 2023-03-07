Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E936AF97D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15710E56A;
	Tue,  7 Mar 2023 22:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26E10E56B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urgniuwIBWeoGMPS8boRrlzhMscnLqM508A9kIsStfo=;
 b=i6SJ0Zg44x2Ax5pSSqQpegP4RJreHuwl89IDqvv0JNTUUc33HF9sq6z+B3S43tMzkxZXIl
 3VQh8fL3Td9+TH7e2IkLFPghfHMpqqPSA6l23D8Lf/u+JsIRmnzXMeSzx/S82J/9PpPXYv
 l+XFSv2SbTZBUByN/CAymSlpCb8PFTI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-pYRZy0RnOTGcPSRNC-Pftw-1; Tue, 07 Mar 2023 17:49:11 -0500
X-MC-Unique: pYRZy0RnOTGcPSRNC-Pftw-1
Received: by mail-qt1-f197.google.com with SMTP id
 t22-20020ac86a16000000b003bd1c0f74cfso8042844qtr.20
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229351;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jpiPjWQVLrWJQByXN7/QqMdv5LfiV5aMULGXTdQqSWA=;
 b=K8x5F9fU1n3DTBjRjdUr9U3jvJM2a5rZHgFjIBbzM7IesSg+Dc+h53fyE/fyGKZf1S
 kDG49CV46IN0mG607XKf5XxJXgfRRxaMNot+LWXtEcI7hYktFWBrePp7Kpl2H14wsSuR
 16y1kRkTSqtboVtU9QxuuBlnb4pp+ckHgnKv/N/1U15WoLZzy9OWlH02JOfDKt9pEkCn
 I8orZYYr+njZI/zvcbsscR5PcoxqYKgzJFZP+p7X0dLmWI4X3d07hfepfCfZwLPfj5Od
 25VPqS0OvHW0g12ehZc4IaOPd/3+wZYK24ElUuq5DjKdLcxILUpqcU1+l5/BpV+UwOhb
 Bdsw==
X-Gm-Message-State: AO0yUKVnDNyl2n1NhzsX9DFvR+XcIVei/VtXN932Ij7+y7xHWU7jE3E5
 qDZ85J0nZ6mRpCKbL5vgCa7RqoFEti3RqY2dK9u9wRNy8ZU2yi3rwmJ254unkV/qN5Zo9xLgpwd
 bSv458ToqJ/tPgZl6qx70t+dC07Gc
X-Received: by 2002:a05:622a:15c6:b0:3bf:e39f:a9aa with SMTP id
 d6-20020a05622a15c600b003bfe39fa9aamr29975769qty.27.1678229350750; 
 Tue, 07 Mar 2023 14:49:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8D0kt0w8UWfWFSmc8IGR59KwpNAYdDZegDL5U+4w/82o/iSmt73NW03WYqKFasWTrX/rU/LA==
X-Received: by 2002:a05:622a:15c6:b0:3bf:e39f:a9aa with SMTP id
 d6-20020a05622a15c600b003bfe39fa9aamr29975745qty.27.1678229350506; 
 Tue, 07 Mar 2023 14:49:10 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 191-20020a370cc8000000b007416c11ea03sm10364394qkm.26.2023.03.07.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:49:09 -0800 (PST)
Message-ID: <361fb10adaa1cb3ff5360cbb0e36a3c1e99fe3e8.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/device: avoid usage of list iterator
 after loop
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:49:08 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-1-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <20230301-drm-nouveau-avoid-iter-after-loop-v1-1-0702ec23f970@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> If potentially no valid element is found, 'pstate' would contain an
> invalid pointer past the iterator loop. To ensure 'pstate' is always
> valid, we only set it if the correct element was found. That allows
> adding a BUG_ON in case the code works incorrectly, exposing currently
> undetectable potential bugs.
>=20
> Additionally, Linus proposed to avoid any use of the list iterator
> variable after the loop, in the attempt to move the list iterator
> variable declaration into the marcro to avoid any potential misuse after
> the loop [1].
>=20
> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXP=
wr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> index ce774579c89d..7c9dd91e98ee 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -72,7 +72,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl=
, void *data, u32 size)
>  =09} *args =3D data;
>  =09struct nvkm_clk *clk =3D ctrl->device->clk;
>  =09const struct nvkm_domain *domain;
> -=09struct nvkm_pstate *pstate;
> +=09struct nvkm_pstate *pstate =3D NULL, *iter;
>  =09struct nvkm_cstate *cstate;
>  =09int i =3D 0, j =3D -1;
>  =09u32 lo, hi;
> @@ -103,11 +103,14 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *=
ctrl, void *data, u32 size)
>  =09=09return -EINVAL;
> =20
>  =09if (args->v0.state !=3D NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> -=09=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09=09if (i++ =3D=3D args->v0.state)
> +=09=09list_for_each_entry(iter, &clk->states, head) {
> +=09=09=09if (i++ =3D=3D args->v0.state) {
> +=09=09=09=09pstate =3D iter;
>  =09=09=09=09break;
> +=09=09=09}
>  =09=09}
> =20
> +=09=09BUG_ON(!pstate);

Let's replace this with

=09=09if (WARN_ON_ONCE(!pstate))
=09=09=09return -EINVAL;

>  =09=09lo =3D pstate->base.domain[domain->name];
>  =09=09hi =3D lo;
>  =09=09list_for_each_entry(cstate, &pstate->list, head) {
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

