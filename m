Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84040754546
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 01:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841D610E03D;
	Fri, 14 Jul 2023 23:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E709910E059
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689376034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqDiqY4N3zDWFlHFUlK8i/J+HIGUbJcqEkShbsY9GIc=;
 b=f9et3qhpSwLrtPcgCY38XnaG/DuBMVVRKerQVi8WgEQUliqz+1ZUUOQJJN89xOTSFWudI5
 c0YQILwGVvkzu4fAklrjI7ltP9dh7bF/luHDwxJHqPhUy0MPaBQrMGR2p/rKxBT+AzIIOL
 n7Bq8G/Sh+5SPjGz7XkDwCrkAhmUQyM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-UgQ2GbWlMIiOHrVvxPV4EQ-1; Fri, 14 Jul 2023 19:07:13 -0400
X-MC-Unique: UgQ2GbWlMIiOHrVvxPV4EQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-635e0889cc5so24776266d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 16:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689376032; x=1691968032;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqDiqY4N3zDWFlHFUlK8i/J+HIGUbJcqEkShbsY9GIc=;
 b=ceZ/WL8zDBbcqLuL9PRTB12Lbjmjl5VgX0uHcB2SrF2P08YUH05n6+MvGqV/u+SOSv
 xb7ZRV6lVwZZHtz7Jx5ljIFetOtYWoKAu6+E6CrPgk+Ty7NH4FeS+VopCzyGcSyK/+BM
 8i7eZB0hWXXu9U8E9jVxmGhjXandl71kypDBR1HB2KNegXSAKGWg++Hwyu0KCR8BChgV
 RAezKoOB/Op40i0nec69hgUs7jsy8skDCFdsDSugJe5tliUMSFuQSQXINOlICWabqg+9
 TaFT1gDjmUv745xkoGXAGHNaRgUy2v5UcfK3g0L/mNbQf5iOKCxBVyx5hv6K3S7mxuXa
 iWow==
X-Gm-Message-State: ABy/qLYv/EYP6CaMH33QGdAfb3gAJn2G3zmyvEElvoyandiMG8rcgoTa
 hd6r1It0LH0JK3PfBQZ9v5y+/yuKKYL0sy+kPEndYWyseD3FnxWtg2qxzGPk3XFWsp+x3hAyTsY
 I/dutkKEd5DfG0ipc7x+5ICli8kwL
X-Received: by 2002:a05:622a:11ca:b0:400:91d8:a704 with SMTP id
 n10-20020a05622a11ca00b0040091d8a704mr8261752qtk.47.1689376032714; 
 Fri, 14 Jul 2023 16:07:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFEDeUJQAf5GAAHKm0EYcAKtwaaDfwtH7D7qV8NAv+bu8ED8AvVMP5+iouCbmTPPgwbpF9k0w==
X-Received: by 2002:a05:622a:11ca:b0:400:91d8:a704 with SMTP id
 n10-20020a05622a11ca00b0040091d8a704mr8261731qtk.47.1689376032460; 
 Fri, 14 Jul 2023 16:07:12 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 x24-20020ac87318000000b00402364e77dcsm4334646qto.7.2023.07.14.16.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 16:07:11 -0700 (PDT)
Message-ID: <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of the
 gk104.c error: ERROR: : trailing statements should be on next line
From: Lyude Paul <lyude@redhat.com>
To: huzhi001@208suo.com, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
Date: Fri, 14 Jul 2023 19:07:10 -0400
In-Reply-To: <0ad4154429aaa41ca26da859c3f35784@208suo.com>
References: <5c894d0a8a178628ca200d054004be3c@208suo.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
 <2f4a7303e305d07fdd9c15a9dc95dc5f@208suo.com>
 <d0d767fb0dd3a9b7642559f379dbb0d6@208suo.com>
 <0ad4154429aaa41ca26da859c3f35784@208suo.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NAK - checkpatch.pl is a (strongish) guideline, but not a rule. In the case=
s
corrected in the patch series here, we format the switch cases on single li=
nes
as it dramatically improves the readability of what is otherwise just a /lo=
ng/
list of slightly different static mappings. I don't believe we're the only
part of the kernel to do this either.

On Fri, 2023-07-14 at 14:58 +0800, huzhi001@208suo.com wrote:
> Signed-off-by: ZhiHu <huzhi001@208suo.com>
> ---
>   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++-----
>   1 file changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c=20
> b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> index d8a4d773a58c..b99e0a7c96bb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct=20
> nvkm_cctx *cctx, struct nvkm_chan
>       u64 addr =3D 0ULL;
>=20
>       switch (engn->engine->subdev.type) {
> -    case NVKM_ENGINE_SW    : return;
> -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> -    case NVKM_ENGINE_NVDEC :
> +    case NVKM_ENGINE_SW:
> +        return;
> +    case NVKM_ENGINE_GR:
> +        ptr0 =3D 0x0210;
> +        break;
> +    case NVKM_ENGINE_SEC:
> +        ptr0 =3D 0x0220;
> +        break;
> +    case NVKM_ENGINE_MSPDEC:
> +        ptr0 =3D 0x0250;
> +        break;
> +    case NVKM_ENGINE_MSPPP:
> +        ptr0 =3D 0x0260;
> +        break;
> +    case NVKM_ENGINE_MSVLD:
> +        ptr0 =3D 0x0270;
> +        break;
> +    case NVKM_ENGINE_VIC:
> +        ptr0 =3D 0x0280; break;
> +    case NVKM_ENGINE_MSENC:
> +        ptr0 =3D 0x0290;
> +        break;
> +    case NVKM_ENGINE_NVDEC:
>           ptr1 =3D 0x0270;
>           ptr0 =3D 0x0210;
>           break;
> @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct=20
> nvkm_memory *memory, u32 start,
>       int target;
>=20
>       switch (nvkm_memory_target(memory)) {
> -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> +    case NVKM_MEM_TARGET_VRAM:
> +        target =3D 0;
> +        break;
> +    case NVKM_MEM_TARGET_NCOH:
> +        target =3D 3;
> +        break;

This one isn't very long, but I'd still say it's definitely a lot easier to
read in the compact form. If anything, the only change I would make here is
formatting the default: case to be on a single line as well

>       default:
>           WARN_ON(1);
>           return;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

