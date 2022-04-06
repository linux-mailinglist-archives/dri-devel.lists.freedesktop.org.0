Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE414F7789
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952010E587;
	Thu,  7 Apr 2022 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBB910E122;
 Wed,  6 Apr 2022 13:41:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r13so4365607ejd.5;
 Wed, 06 Apr 2022 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0IeTkY1yhaJPK6VDqHKztL6/sdrLKeK5VaUPik01uco=;
 b=WbP9ySUZSPgHLrHFRxIUWqAkKlwtz3/lphdxBTdMOVQuUT5+HfJKYrAg4eUTEsXZkz
 8e8KhdnBO1xUEtEoMVUbtRmhxsR8BiyPPc5TfM+9lfBW5O/VYyOW+YLyas51CMQO09SJ
 sZRGZOroZ5LEsaydgXPFKgZgbG1xzpflqC0GHSWYpUCcjg8C4j+ZieSFKHPLTUOmbrOS
 FoxY0v0cP6iQBZ+ms6c4zzRlAar3PgroXfqXIn9AfuiaBKa3RqrlilCrfE7ZwizUQ6Gj
 m53Hcr11tJjGhloLapsO3Q2jt656PpXU7Rt7ClPkwJ/n3+3r+zLKxwgtFNDXTmcfVLZU
 ZYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0IeTkY1yhaJPK6VDqHKztL6/sdrLKeK5VaUPik01uco=;
 b=Y+q2oC4XXksaGcuJ7ayRlfTtleJXJijWGdbF008BJZMb15/UNgW6Y/Lru1Qvf2Ui8P
 n6iDmeS13HkUuoGuBWB80MkwXfpUsCxFga1uBqewt5nzng37gjggpTooOEq7jI5tEQ9s
 79ydUrzrkhd5bsp0TA7FGuzLgvhepjmQ4Xy2F+k/pR/R/0RYW5GCvU/gkISUbzNNPbo8
 PinIf10n2/SbaXhXyDLF04KP4XRxDrSA1IIxsQHzxg5XMchGM77ngmi1s2oWArVQMv1s
 3k/eqCRstChdEROs9Smg9bHEGKIXe8+e6aNT1oF2SuSxigiBXFPb8n4TmB5G9/2gCXFO
 8J1A==
X-Gm-Message-State: AOAM531mJR0YBxIGtGKQfVxi2qucx52bcdHLlRSr9IQYCPMdkpASbTMY
 aUpw0ymTCnrNFYS7hxAnZXIwaNHv3FD8fZz1nDU=
X-Google-Smtp-Source: ABdhPJxZ9dElneUwA1wzU6Q0bcRp/j+jGbBrxLosQpe0RT2zY1YIsaK+d6cZ5N6w4jJF97TCJJ6VotA+kDLMYk0zyDo=
X-Received: by 2002:a17:907:980b:b0:6e0:71d9:c87e with SMTP id
 ji11-20020a170907980b00b006e071d9c87emr8142309ejc.510.1649252495645; Wed, 06
 Apr 2022 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220404222132.12740-1-h0tc0d3@gmail.com>
 <c55e9866-83f6-a3a0-2ad3-40090e978b40@amd.com>
In-Reply-To: <c55e9866-83f6-a3a0-2ad3-40090e978b40@amd.com>
From: =?UTF-8?B?0JPRgNC40LPQvtGA0LjQuQ==?= <h0tc0d3@gmail.com>
Date: Wed, 6 Apr 2022 16:41:34 +0300
Message-ID: <CAD5ugGDL7U1TiOW3P=ecwVhF95XgdibtoYGV8GzbAskuB5UWCA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix potential NULL pointer dereference
To: Felix Kuehling <felix.kuehling@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Apr 2022 07:32:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. You are right. I found a potential bug, and as I understand
it, the code only applies to the Aldebaran GPU and I can not check the
correctness of the code. I only test code on my navi 10 and run GPU
stress tests.
My knowledge of amdgpu is limited, and fixing potential bugs allows me
to learn more about amdgpu code. But there are many that I still don't
understand. In any case, we need to fix the code to eliminate
problems in the future.

Regards, Grigory.

=D0=B2=D1=82, 5 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 20:00, Felix Kuehli=
ng <felix.kuehling@amd.com>:
>
> Am 2022-04-04 um 18:21 schrieb Grigory Vasilyev:
> > In the amdgpu_amdkfd_get_xgmi_bandwidth_mbytes function,
> > the peer_adev pointer can be NULL and is passed to amdgpu_xgmi_get_num_=
links.
> >
> > In amdgpu_xgmi_get_num_links, peer_adev pointer is dereferenced
> > without any checks: peer_adev->gmc.xgmi.node_id .
>
> What's worse, peer_adev is uninitialized with an undefined value if src
> is NULL. So that code was definitely bogus.
>
> However, I think your patch will result in incorrect results. Currently
> amdgpu_amdkfd_get_xgmi_bandwidth is always called with is_min=3Dtrue if
> src=3D=3DNULL, and with is_min=3Dfalse if src!=3DNULL. The intention is, =
that we
> assume a single XGMI link in the case that src=3D=3DNULL. That means the
> is_min parameter is redundant. What we should do instead is, assume that
> num_links=3D=3D1 if src=3D=3DNULL, and drop the is_min parameter.
>
> That would keep things working the way they do now, and prevent
> potential problems in the future.
>
> Regards,
>    Felix
>
>
> >
> > Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_amdkfd.c
> > index be1a55f8b8c5..1a1006b18016 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > @@ -541,11 +541,10 @@ int amdgpu_amdkfd_get_xgmi_bandwidth_mbytes(struc=
t amdgpu_device *dst,
> >       struct amdgpu_device *adev =3D dst, *peer_adev;
> >       int num_links;
> >
> > -     if (adev->asic_type !=3D CHIP_ALDEBARAN)
> > +     if (!src || adev->asic_type !=3D CHIP_ALDEBARAN)
> >               return 0;
> >
> > -     if (src)
> > -             peer_adev =3D src;
> > +     peer_adev =3D src;
> >
> >       /* num links returns 0 for indirect peers since indirect route is=
 unknown. */
> >       num_links =3D is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_a=
dev);
