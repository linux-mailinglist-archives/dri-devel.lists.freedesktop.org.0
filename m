Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B326EEC80
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 04:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82010E583;
	Wed, 26 Apr 2023 02:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7322B10E583;
 Wed, 26 Apr 2023 02:48:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94f161ee14fso182000566b.0; 
 Tue, 25 Apr 2023 19:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682477324; x=1685069324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luIBezxVj8vjsN8taNGI10NmyK3fPLG8Q9qSFZe7gVg=;
 b=ry1w73aKJZhF+mw0bkTlPfi3NbHr2/r5LIV+7uuHtOZw2S0AU5hZV6agpBs5LVE9DE
 oUbO/kvBh69w2pol++Z8lg1MonDRS7VNSnk/gX0ceyn/HkDMTvUm3UYG1mtgj+aBEWXl
 Yu23ATANopFyLcA5MwyfFQ/QAdVRRLffuXKnL5majIbPm+81MjCV2nGreqsz5tYSm5k6
 fELHB8SOyEOSNAg8R+qnj4TQyhJ04k1q6bhS0V8FXDr4fhPoRzxwL6PY7WkgZcfy4VYf
 H8YbrOp1rC9t8FiKhzzQ1wWc9LBSupPu4zojUkO9IA5NtinbqIOXyEW+zibRrAlezp/n
 HEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682477324; x=1685069324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=luIBezxVj8vjsN8taNGI10NmyK3fPLG8Q9qSFZe7gVg=;
 b=T5HdwoY0Gkp+NeAseE83kMPGrzLzrd18/1Q03YWI+vIJjO4P1tgsbDiIwuvVeX/GkA
 5ZDd5YB49o5p8w70WeqtNyhwMJUeEb1vUg9h0WOVTxgq0lY4zTUx0MoSdyft5matv9FZ
 L4+GF8rL5aogasbkWd8P+3RMJKcJeWz5u0YpKBw8SaoSYzyHC3B8w6CPKiiFikQf8ggI
 6cPcLG6j/EQZ4HhSA9/URHdVLshqXnP6WqhjGTjDQv2FaAzaUE3JnEyTLt072obyRnNT
 W45lnVR58+StbbnYsgCFoQe1fHRR1w0bD32GX4H6HjH+laUiKwAlhs1NL0udZHqyNVAD
 jboQ==
X-Gm-Message-State: AAQBX9eXx9Wo/gC/uGT2jjJNU0FpmfdJ9jwLhPEY9FoD2IlDnteY1t10
 T9/ufOescyRY/wnNpQk5uTG5jqZqkMtOOVumFg8=
X-Google-Smtp-Source: AKy350ah10QfjHhR3RthnizYYdfMX/dVDPe92W7VgE61H/ui8jl13kTYbQo4YMuGTSjZrMGEVf9Gvgn7D7dF7fy00yk=
X-Received: by 2002:a17:907:2087:b0:930:7f40:c1bb with SMTP id
 pv7-20020a170907208700b009307f40c1bbmr15743065ejb.4.1682477323728; Tue, 25
 Apr 2023 19:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230426004831.650908-1-olvaffe@gmail.com>
 <BL0PR12MB2465ACA3AC6D8CCDFA043239F1659@BL0PR12MB2465.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB2465ACA3AC6D8CCDFA043239F1659@BL0PR12MB2465.namprd12.prod.outlook.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 25 Apr 2023 19:48:32 -0700
Message-ID: <CAPaKu7SA5wWrwdP6MQvDu=3qH-QCH_iUFASmDY-VYxnrXn=2zg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add a missing lock for AMDGPU_SCHED
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 7:27=E2=80=AFPM Chen, Guchun <Guchun.Chen@amd.com> =
wrote:
>
> From coding style's perspective, this lock/unlock handling should be put =
into amdgpu_ctx_priority_override.
The locking is to protect mgr->ctx_handles.
>
> Regards,
> Guchun
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Chia=
-
> > I Wu
> > Sent: Wednesday, April 26, 2023 8:48 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Pan, Xinhui <Xinhui.Pan@amd.com>; linux-kernel@vger.kernel.org;
> > stable@vger.kernel.org; amd-gfx@lists.freedesktop.org; Daniel Vetter
> > <daniel@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>;
> > David Airlie <airlied@gmail.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>
> > Subject: [PATCH] drm/amdgpu: add a missing lock for AMDGPU_SCHED
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > index e9b45089a28a6..863b2a34b2d64 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > @@ -38,6 +38,7 @@ static int
> > amdgpu_sched_process_priority_override(struct amdgpu_device *adev,  {
> >       struct fd f =3D fdget(fd);
> >       struct amdgpu_fpriv *fpriv;
> > +     struct amdgpu_ctx_mgr *mgr;
> >       struct amdgpu_ctx *ctx;
> >       uint32_t id;
> >       int r;
> > @@ -51,8 +52,11 @@ static int
> > amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
> >               return r;
> >       }
> >
> > -     idr_for_each_entry(&fpriv->ctx_mgr.ctx_handles, ctx, id)
> > +     mgr =3D &fpriv->ctx_mgr;
> > +     mutex_lock(&mgr->lock);
> > +     idr_for_each_entry(&mgr->ctx_handles, ctx, id)
> >               amdgpu_ctx_priority_override(ctx, priority);
> > +     mutex_unlock(&mgr->lock);
> >
> >       fdput(f);
> >       return 0;
> > --
> > 2.40.0.634.g4ca3ef3211-goog
>
