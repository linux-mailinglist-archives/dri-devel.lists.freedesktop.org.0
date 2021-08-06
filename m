Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559C73E2FFB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 21:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC306EC25;
	Fri,  6 Aug 2021 19:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97A6EB89;
 Fri,  6 Aug 2021 19:57:29 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id o20so13590256oiw.12;
 Fri, 06 Aug 2021 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MF/jpY158To6EQXX0lXK4wBeAKXkbUZOPZcMLvj2pKA=;
 b=hrNvxp1VsGcKekVYog+ETgyNkvHKn2ouDTTHSJ90MKkTVJfZ0JnAyjzIkbRaoiKTKW
 fFSI+fxLToydj8cuARGoYpZNci95367d+eMwpeIuzc2Ah+rpKJNosDJNxLH6VPCGqQJV
 w5qtT3/Rdm1ho0gWOfPUgNa64c3L7KyCmlMKYiphe9IvTrwdDc7q3Mwaigvhy/JRzPyW
 aA+tQCfA/O2vj9T6LWdtN9NwYMFmWTS845LeNRjy54UrQ7ouGY2IbAxqmjj79qps275t
 nyuvoThRuK85u1Bp/rWd3AMQHJPTavkbFsTiDjv+NlSIhCHDJaPqFx15QwsQzkjgWkbw
 0m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MF/jpY158To6EQXX0lXK4wBeAKXkbUZOPZcMLvj2pKA=;
 b=LaKxOj/qnv9C6RMJv57+IRO3wxIH/bAjzxqQ3I9JH4pntg2KuJCpHq46imNVrOhVFF
 i/c8S9qbJdfznZTnBJX7qD9MZweUrIK9sMCbxbAYkA2sI1vWTZMzTtq+/6BVgOy+/aie
 9eRxXCQ0SA4sLvjXO3QMwBu/183pVed2WOi4b/2HgGFXXel79XrdLoTURM6Nw3wSBkTk
 n4oQpxAhNpC24MDSNde8dWABOKui/wR89rVpal87ZyWLEIQAUJ5WHFy6+kOiuLZWKtpU
 nDg1CVG8KBbKENHYl6MtMeIKp7IRugCUPIUDD6liaKCZbCr1I+6Pa9/0l5sF2mQ4lafz
 mYvw==
X-Gm-Message-State: AOAM532oTduuD7DK3oBJnbgruy5sTHkm0z3I+ysU/U2NpG1yWydekoGk
 KwE3hwpSX3ImcQF91eJQ2dJsmW4gQTmQP1W5qb4=
X-Google-Smtp-Source: ABdhPJzRSNKmGvNbvRyoSzgRq6E+O9Kzd/sBqr3+djhVmtJy0dMvFGmqRCJDI3aD25wsE4BhCgiQB1bIvJpgQ/eJycQ=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr8542725oih.120.1628279848481; 
 Fri, 06 Aug 2021 12:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210806150518.GC15586@kili>
 <ca0cfa01-e1ef-1ee8-8adc-ebd4fa253e70@amd.com>
In-Reply-To: <ca0cfa01-e1ef-1ee8-8adc-ebd4fa253e70@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Aug 2021 15:57:17 -0400
Message-ID: <CADnq5_OceaWQUjrOWmOykKKVhD+KbE6F_Wq16CyBFPrCQD6vBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check for allocation failure in
 amdgpu_vkms_sw_init()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Ryan Taylor <Ryan.Taylor@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org
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

Applied.  Thanks!

Alex

On Fri, Aug 6, 2021 at 11:09 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.08.21 um 17:05 schrieb Dan Carpenter:
> > Check whether the kcalloc() fails and return -ENOMEM if it does.
> >
> > Fixes: eeba0b9046fc ("drm/amdgpu: create amdgpu_vkms (v4)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vkms.c
> > index 50bdc39733aa..ce982afeff91 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -482,6 +482,8 @@ static int amdgpu_vkms_sw_init(void *handle)
> >               return r;
> >
> >       adev->amdgpu_vkms_output =3D kcalloc(adev->mode_info.num_crtc, si=
zeof(struct amdgpu_vkms_output), GFP_KERNEL);
>
> Is the line above not a bit long?
>
> > +     if (!adev->amdgpu_vkms_output)
> > +             return -ENOMEM;
> >
> >       /* allocate crtcs, encoders, connectors */
> >       for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
>
