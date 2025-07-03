Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0634AF82F5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DCE10E8FB;
	Thu,  3 Jul 2025 21:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LSZ1MI2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386010E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751579806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fYR7VZlgABLKP1NRozT8CE9xb7sNdOcfvOJxK/ixyQ=;
 b=LSZ1MI2AEWHuC0duIoOJXC4nefGh0AlQJqVUGCXFXsRvvwy3xFb13f8Vmk3VYXXHlUx/Ap
 AYmDV8J1ALNfay6PUOrfARLWQ4+QqGNZ8MbURXBofuQsGELHo1qnvwcxFmzCcVbL01LLew
 Z0lSwjR43mf7Y1ngpmHJxVgz6F02neA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-a6V2Me10PemVu2fdX30gTQ-1; Thu, 03 Jul 2025 17:56:45 -0400
X-MC-Unique: a6V2Me10PemVu2fdX30gTQ-1
X-Mimecast-MFC-AGG-ID: a6V2Me10PemVu2fdX30gTQ_1751579804
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3138e65efe2so270377a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751579803; x=1752184603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fYR7VZlgABLKP1NRozT8CE9xb7sNdOcfvOJxK/ixyQ=;
 b=VIy0B28XiGYpGKl7Buq/BhOR53uKY1OBHAHu8/qad4o1ldxHvQialnqVvhisWWmCps
 MWv5JlWhl3h/DikdOv4zL7wZPkksEA2V4EqCoN/pfnkujoep7+E0ygM6vFsqs6IaREmr
 AkNf4BgH+hJcX8BBkVPcl7BiPVxBMzBUzdizn+7MiGqBPCl34A0LLciCdZ6F8qwgiFo6
 a2/Zn4ecdBHX0CJ0JfdwBjoD3oXi/otOx3zsy55FHtSxuCVoEhEBq4OUBO1d8xlP7w4R
 CciO/PxTLtfUFsSAbCorNjwQKsOKCOBFGC4TAv71qb/8k5L8WA0w18qLq0hY/Yg6EXO1
 a3+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdisdir50PAUyzQ/KsS9+DcFwJnsjigCMPozcrqW7hWhtgRIoQXchIBp5Asg3FLZiZtauQbGYF8vE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxocxWLb+PKU0EWN8zzNdx4Oznvt2QIwZc/XTzEMdRMZejJK4ma
 hNINj4YPYTAsxH7isCADRgr6/SywhBr3UcT+l/RAUvcgQGqkb0DtAuAI70cXFStPA7O5ohXgIC9
 CUL9dPOcHu6nNdcEE2ExBNlAOFBQBY95Rd+VZjreSMjj5C+CVKu59Zgp4xT5DITjJqajSrf/kZC
 i5Xq/qQtS6dAEqYe09jYeB6zsTNE7Xpx4cJcBX0+zLq7q+UiJc0aRhCU0=
X-Gm-Gg: ASbGncsDU1RuyhgkK4m3TIVUMx87VHYzX8aZD5n4AJh5Ws0kKjnYEaihEjXTeE/zYqp
 MIV0pic3S28v2QDRnfdZTIjqkEuAxbHl7XWMQNxkiQDuE5IlpketSB5ReSceBEZ7ma/zTD4/T9z
 l4gA==
X-Received: by 2002:a17:90b:394a:b0:315:6f2b:ce53 with SMTP id
 98e67ed59e1d1-31aac4f0f17mr282528a91.25.1751579803654; 
 Thu, 03 Jul 2025 14:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QsL4/4lbdu2VgAxra8OjeGaMaz7G/joe/hTMUWVrl3BwEfAgKyvMvBLL8Evt3sQY1YZL6uZ/fwzabaaILsk=
X-Received: by 2002:a17:90b:394a:b0:315:6f2b:ce53 with SMTP id
 98e67ed59e1d1-31aac4f0f17mr282508a91.25.1751579803345; Thu, 03 Jul 2025
 14:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250702232707.175679-1-airlied@gmail.com>
 <3bdcc576-5c5a-4735-9e6f-e56ead2270b8@kernel.org>
In-Reply-To: <3bdcc576-5c5a-4735-9e6f-e56ead2270b8@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Fri, 4 Jul 2025 07:56:30 +1000
X-Gm-Features: Ac12FXw0hcVP8Zqb-SDWuNhKXYrwwVhPaZMMQvb2YOUWY3UayM2Wo2HazJUMMhI
Message-ID: <CAMwc25ob7F+4jTttyvqgBrNraAX9jdCjN4=unt0WJWZLbY+vNw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: add a 50ms delay between fbsr and driver
 unload rpcs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hHM-E-rk3E82nU6Y9COM4neLbsaylbIMLnwGgeXy6UQ_1751579804
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 4, 2025 at 7:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 7/3/25 1:27 AM, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This fixes a bunch of command hangs after runtime suspend/resume.
> >
> > This fixes a regression caused by code movement in the commit below,
> > the commit seems to just change timings enough to cause this to happen
> > now, and adding the sleep seems to avoid it.
> >
> > I've spent some time trying to root cause it to no great avail,
> > it seems like a bug on the firmware side, but it could be a bug
> > in our rpc handling that I can't find.
> >
> > Either way, we should land the workaround to fix the problem,
> > while we continue to work out the root cause.
>
> I think we should add a TODO above the msleep(); what do you think would =
be a
> good comment here?

TODO: debug the gsp firmware or the rpc handling to find out why this
is happening and why it's Turing specific.

Don't really have a lot to go on,

Dave.
>
> I can add it when applying the patch if you want.
>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > Cc: Ben Skeggs <bskeggs@nvidia.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Fixes: 21b039715ce9 ("drm/nouveau/gsp: add hals for fbsr.suspend/resume=
()")
> > ---
> >   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/dr=
ivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > index baf42339f93e..ff362a6d9f5c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > @@ -1744,6 +1744,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
> >                       nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt=
);
> >                       return ret;
> >               }
> > +
> > +             /* without this Turing ends up resetting all channels aft=
er resume. */
> > +             msleep(50);
> >       }
> >
> >       ret =3D r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
>

