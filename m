Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04C8753836
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A810E867;
	Fri, 14 Jul 2023 10:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617AD10E866;
 Fri, 14 Jul 2023 10:32:03 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689330720; x=1689589920;
 bh=d3nLDD8DBb3ZPn+J0fDpDNq67SzaLe4eliBagI1p0Vs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CQvOW1P3CYRmO8Kv8ScA1JJwZUkY34E6aD5kYGdA4y5ZvA5Olm2ma7Vht2qV87YUG
 pIO8w8EvAe+BNqLrZvJWmXtFH6gChhu9Lt30mvi17xoMiqxtCRg72pHW4kMIZSZxsr
 eX66tUtLDAGRAzsQ/8aDxVzDcRCcxmrOS6ZEpWwq0n3cbnvz7VzmWStzL+syV/ctyC
 /3jYnTx+UhwOsC6bxKL4ay+Ca+GrecO4IbF1Gv4XcJTepRWIQCPVc3aL0RH5b34c+O
 LM9N2NVXev2nqyRZAVOdjXpQV9U4LO9zb1LTB/ufZfENaHEPec59fiHFY8qnC6Uuu6
 7YKuZl5Sk0T8g==
To: James Zhu <James.Zhu@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: support up to 128 drm devices
Message-ID: <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
In-Reply-To: <20230630115651.354849-1-James.Zhu@amd.com>
References: <20230630115651.354849-1-James.Zhu@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(cc Daniel Vetter and Pekka because this change has uAPI repercussions)

On Friday, June 30th, 2023 at 13:56, James Zhu <James.Zhu@amd.com> wrote:

> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
>=20
> This makes room for up to 128 DRM devices.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 73b845a75d52..0d55c64444f5 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -137,7 +137,7 @@ static int drm_minor_alloc(struct drm_device *dev, un=
signed int type)
>  =09=09r =3D idr_alloc(&drm_minors_idr,
>  =09=09=09NULL,
>  =09=09=0964 * type,
> -=09=09=0964 * (type + 1),
> +=09=09=0964 * (type + 2),

The type comes from this enum:

    enum drm_minor_type {
    =09DRM_MINOR_PRIMARY,
    =09DRM_MINOR_CONTROL,
    =09DRM_MINOR_RENDER,
    =09DRM_MINOR_ACCEL =3D 32,
    };

Before this patch, 0..63 are for primary, 64..127 are for control (never
exposed by the kernel), 128..191 are for render, 2048..2112 are for accel.
After this patch, 0..127 are for primary, 64..191 are for control (never
exposed by the kernel), 128..255 are for render, 2048..2176 are for accel.

I'm worried what might happen with old user-space, especially old libdrm.
When there are a lot of primary nodes, some would get detected as control
nodes, even if they aren't. Is this fine? This would at least be confusing
for information-gathering tools like drm_info. I'm not sure about other
consequences. Do we want to forever forbid the 64..127 range instead, so
that we have the guarantee that old libdrm never sees it?

I'm also worried about someone adding a new entry to the enum after
DRM_MINOR_RENDER (DRM_MINOR_ACCEL was specifically set to 32 so that new
node types could be added before). drm_minor_alloc() would blow up in this
case, because it'd use the 192..319 range, which overlaps with render.
I think a switch with explicit ranges (and WARN when an unknown type is
passed in) would be both easier to read and less risky.

>  =09=09=09GFP_NOWAIT);
>  =09=09spin_unlock_irqrestore(&drm_minor_lock, flags);
>  =09}
> --
> 2.34.1
