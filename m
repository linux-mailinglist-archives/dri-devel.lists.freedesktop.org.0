Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F02B184EC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3347610E8C2;
	Fri,  1 Aug 2025 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yp4U9ubD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BC110E8C5;
 Fri,  1 Aug 2025 15:27:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-31f5ab057ebso220718a91.2; 
 Fri, 01 Aug 2025 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754062032; x=1754666832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sue6t6MTPcNQBk6SuoZyb4NSK8qFHZ5fMm2zaPQjRWg=;
 b=Yp4U9ubD4JJO+yl3otAg+L7oaJG1GjPc5l36ZpRAfwLLb0ucY1SBXH9XpdTGewY8q9
 bB6tgBKwZidFvj9bYbCuzg1cwpQD0D8nxytg3xUkqiBxkjtPSn1m8Ls8puV3ZdCg9UtY
 iMVk0Kd80kbHWCqKNFUlY2dgZ0fWtE4d+oU5VYmp5kwEEcp0GthtwdVE39V0UutwWsl1
 fn8yodYqkQU8DZzfwedLkr2ybVx51SicDWy8dVdNIrBfX9ip88O7j2x8CkcLwrpfUS8G
 tLQE3UfdhMNfTv6URUBwk3vQzbDM6E6+MqYT4Yly0IIsd/jjDwUoR/y/3M/FtZJrp/a+
 oQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754062032; x=1754666832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sue6t6MTPcNQBk6SuoZyb4NSK8qFHZ5fMm2zaPQjRWg=;
 b=VKmT9RHrtxzzowRFerAlpgGRkWf70zlBazHJNLgVrb3Vr+9M6H2SvLIuO5EIF3wJcT
 yt5CuC770n0527bA+CyxpYWUotKDCNaoNv8LCjAqL7OtIXdtHPQf+JchtM7euSkxszy5
 w8ylhDdf1yFTd2Yj11KZOeP8YbExJEwEmy61L9f5NQHdlUfQ+BuqG3fhop6Ws4lGAfJO
 iow2qpSzu62ZtTf6gIkjDV5ZXFJ1CiNJiXOB5uvYNGpvRLuv1NPSftnh75Vh6BmKl4tM
 1ySxibETHtbp2Z4MCaMoRt7YxiYcnDM6FxDXPhETV7STGQidQj308mU5G25TJa3mPywE
 2Bwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk+VnNGTISQKHOZvaPOaEHpXP7Rm1Gpsc/w43n1yKiQ79zo2rawEMIs47NqTHF17N4QoBCCwlU@lists.freedesktop.org,
 AJvYcCXgkLBI3OhtXN+BI544jzwQyuLSwkX40XB3s55VUuxuNkWHNPi5d74pJ/6PlN1eimC8cKcmEcF6G7Vi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaoqstpABjcljKaYYMrARkNBFZSasPyUNQcnHChKKh3wKn1hSi
 Jju3Yj6CI5wpSyD0sYtDQFe/10cyS9uBkkSjEfO9jWmrDoVMc5BYGnNJel3yeVaY+KB2ogc1uTO
 0QyQhFMwNqrNY39wF3QY0jK2DL2ccmwY=
X-Gm-Gg: ASbGncuYsKRIFfNLXuCE3lnXHzOGlbGzsQBWpOVY86ZrQ2aYwEXorGf4h6qgt78PUBC
 LyJuIKyXzQ6uQrBwGU8dHv4jh2T+IQYN7kkVUPB35MXSNcnXCOqza4KA2SIWQRtFFKkS/GLnKBH
 tPMmQqYlZvt2bi4a1BdeAbOQjZxXTw2Ibe0edTdMwuroXqecFZDQ5wRYVUkECkZNyI/0tp7czUX
 jNczuvs
X-Google-Smtp-Source: AGHT+IGcY9/E697eI01t68yQeKJXujMHzq8xNHqAlhrRhZMa9gFBozLEmAtafrd865Vr5KQ5G0MMabnPjlidWUIuHpc=
X-Received: by 2002:a17:90b:4b41:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-321161dd619mr105201a91.1.1754062032130; Fri, 01 Aug 2025
 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <20250731-b4-dont-wake-next-v1-5-e51bdc347fa3@gmail.com>
 <CADnq5_PG1Am4OGkfKo9o9cfnvSdzwRFeYudbvw220+P1AHO4xA@mail.gmail.com>
 <CA+gwMcc41Hh=or7NLMnG++miHj_dNLZ04iFYdf=U7_LLG1gSZw@mail.gmail.com>
In-Reply-To: <CA+gwMcc41Hh=or7NLMnG++miHj_dNLZ04iFYdf=U7_LLG1gSZw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Aug 2025 11:27:00 -0400
X-Gm-Features: Ac12FXx6aGmZ0f-GSzZPjWGMqlxozfqEFXRIzujilNBKisW76BTEkWFPF_r7fqI
Message-ID: <CADnq5_MpUcifxeBtfk6Q5bd6rjFusRCVvOBOguq0mP6ejG0fuA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/6] drm/amdgpu: don't wake up the GPU for
 mmGB_ADDR_CONFIG register read
To: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 1, 2025 at 2:11=E2=80=AFAM Philipp Zabel <philipp.zabel@gmail.c=
om> wrote:
>
> On Thu, Jul 31, 2025 at 9:38=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
>>
>> On Thu, Jul 31, 2025 at 3:33=E2=80=AFAM Philipp Zabel <philipp.zabel@gma=
il.com> wrote:
>> >
>> > Don't wake the GPU if libdrm queries the mmGB_ADDR_CONFIG register
>> > value during amdgpu_query_gpu_info_init(). Instead, return the already
>> > cached value adev->gfx.config.gb_addr_config.
>> >
>> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
>> > Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
>> > ---
>> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_kms.c
>> > index fe1347a4075c4..ed4d7d72f2065 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> > @@ -883,6 +883,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, voi=
d *data, struct drm_file *filp)
>> >
>> >                 alloc_size =3D info->read_mmr_reg.count * sizeof(*regs=
);
>> >
>> > +               if (info->read_mmr_reg.dword_offset =3D=3D 0x263e &&
>>
>> I think the offset of this register varies across chip families.
>> You'll need some way to determine what the offset is for each family.
>
>
> Thank you. This workaround was specifically intended for the following ca=
ll in libdrm [1]:
>
>         r =3D amdgpu_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0,
>                                              &dev->info.gb_addr_cfg);
>
> [1] https://gitlab.freedesktop.org/mesa/libdrm/-/blob/9ea8a8e93d542fe61d8=
2716d1a721e8d1d257405/amdgpu/amdgpu_gpu_info.c#L215-216
>
> which also seem to hard-code the dword_offset?
>
> The same is now copied into Mesa [2] as:
>
>    r =3D ac_drm_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0, &info->g=
b_addr_cfg);
>
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/blob/c64c6a0c31f9cb1339bc7=
00d236932171f7444a3/src/amd/common/ac_linux_drm.c#L722

Nevermind, it's at the same absolute offset on all chips right now.
The relative offsets are just different.

Alex
