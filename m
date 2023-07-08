Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9174BA6A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 02:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4100810E626;
	Sat,  8 Jul 2023 00:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6B910E626
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688774810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClNl+J5kZre4g9U4Ilh/C86VTLXimbatUVRVhRP/EmY=;
 b=K4+uD5dugJ5qlg2ymE4QggX1VqesB4TTxY4GBESrG4VuWbYEWJJHfjDKyNSqcICfWaity1
 dasYi6W/so3yMF+7ZXR7ty3purys5FECh2MiAejuXk+27sptozaDwzVyNDdsNFrdmQcZue
 r/Z+zcgYUdr1mqE5umrNFm42sTi57dg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-iY1So6mZMwOQLFblMA9hcg-1; Fri, 07 Jul 2023 20:06:48 -0400
X-MC-Unique: iY1So6mZMwOQLFblMA9hcg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so4286001fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 17:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688774807; x=1691366807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ClNl+J5kZre4g9U4Ilh/C86VTLXimbatUVRVhRP/EmY=;
 b=AZCuoK7nvV9iMaonmfivAa7vs2pYcXWIdnernCjQDZMjaie5GuF2YIAkck19+o3R/i
 Fnsh3o3kCzx+yOY47FQjPXcedUo6AepUtZ0bipcHSqt2QCLm6FmHLzfXuYpmTE4u9VKn
 F3Bwcn3fae/8WLmjRqj4WnA4vlRwb1OxYsEsRqg5x90pH39mCJYo+IwjfUOeaF3G3Hbi
 5IJruabybgWW+OCwnVm79zaw8T1mIKrUWVxkBv8O5uFMMMUtNTwmE8iRaKG/T/VEb3Lc
 ssWYGGd1kKDRnytxcUS8l64mHzLytk+gtamhRNq+Sye3gobLN8ykCYfbpDm7lI6Y2v9+
 ygug==
X-Gm-Message-State: ABy/qLbizDN6xm4B7c7vjQDmqotidNQEDI6fuzqdQUSdlvdqcsaEuxwI
 tMoQgQkqpjm1mdQhApWnpT8zqpFJlg3XjSMIrgBJJuHlh0YNQzG/QQ6Llw0kW/GOWcJU88DqSwh
 5khCB4DUnGw8aOZc2oB5Bx35m7ISdYohpzWepo+ur3LQO
X-Received: by 2002:a2e:a4af:0:b0:2b6:cd7f:5ea8 with SMTP id
 g15-20020a2ea4af000000b002b6cd7f5ea8mr3974263ljm.1.1688774807530; 
 Fri, 07 Jul 2023 17:06:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpPr6r6JoBVvnvb4DwD31nWTUtEWSpKheU8SGmCkexh44pjRQR6+zxMEjOSNetT8JZmG/XoPxNZG9/X8BANUg=
X-Received: by 2002:a2e:a4af:0:b0:2b6:cd7f:5ea8 with SMTP id
 g15-20020a2ea4af000000b002b6cd7f5ea8mr3974256ljm.1.1688774807136; Fri, 07 Jul
 2023 17:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230630160645.3984596-1-kherbst@redhat.com>
 <14f2b03302c07a62cce1ec272f54727b2ad39721.camel@redhat.com>
In-Reply-To: <14f2b03302c07a62cce1ec272f54727b2ad39721.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 8 Jul 2023 02:06:36 +0200
Message-ID: <CACO55tv_2Oisgkm+FqQ6xz91zJ8KidwFV6hMoCxHS-JYMkiFxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp/g94: enable HDMI
To: Lyude Paul <lyude@redhat.com>
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 11:03=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> But seeing as I looked at this + some other patches yesterday I assume th=
ere's
> still more to this?
>

not really. All those patches are all independent and just a bunch of
fixes. I just figured this one out a bit later.

> On Fri, 2023-06-30 at 18:06 +0200, Karol Herbst wrote:
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire +=
 infoframe methods")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/g94.c
> > index a4853c4e5ee3..67ef889a0c5f 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
> > @@ -295,6 +295,7 @@ g94_sor =3D {
> >       .clock =3D nv50_sor_clock,
> >       .war_2 =3D g94_sor_war_2,
> >       .war_3 =3D g94_sor_war_3,
> > +     .hdmi =3D &g84_sor_hdmi,
> >       .dp =3D &g94_sor_dp,
> >  };
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

