Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34F765E88
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8CD10E1F0;
	Thu, 27 Jul 2023 21:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765610E1F0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690495056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9OuLr3u1FKmz7UA09k1shRXalh3/1PXcGGjjo2Ltyc=;
 b=DWz6HnoxVP/mgWyWVhONuTxAQLj4cJ99VqItZuvRkZ5PUO9A+6cpwHO3O+oRQHsoOE4qdh
 GQkRBWjIGcwsiLxP1Xjs2i+8pJ6fMB51opGXdBGs/GzfGLC6CP2U6WTq4AffFf+al3vOIz
 O2qvUAic35LHeu9FCy9HQzdaGBLttq0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-ZlgIuvTzNuuhDm3GjAc_fQ-1; Thu, 27 Jul 2023 17:57:34 -0400
X-MC-Unique: ZlgIuvTzNuuhDm3GjAc_fQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76c562323fbso199400685a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495054; x=1691099854;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9OuLr3u1FKmz7UA09k1shRXalh3/1PXcGGjjo2Ltyc=;
 b=Ghpu1ABrwQ5TE8QsNA3/v3wcOkTQf58Fs6EnfT49TokoFnCYwCWWL6N4ymlQZMgpYT
 Vn41eeIYUq8dWO9P6QXM7riHlEkSQTQrj6fnyq8uXaem6OIUzvFG5CHgPYyrmfsL1b37
 IKt28PVtsSuW0VIuTol7HJ09HmEhE/Wkv/+17Z/ezoNR2d/TnJItk9l/Y4m3C30ZXvJy
 4aZnwn0GYv2weY/nwllePRNj9wBuQt4FmJQvXw/vRZV3FvHsPjXG4LU0MG5mugRIJjYY
 03IZrihc/nEnz2keBKPo+HUpETOhxvVCkW3osE3ZtHel7WxHBB52Vh6QxNFIsyPGBrm7
 yzcA==
X-Gm-Message-State: ABy/qLYkZUkVicw//vzrWVuwrLG6c9L4WEosVdzYd/nypGGXERag5b26
 tV6AtokD/JPRy4RqvyodcGW32XZDNZiSwKjh9O4wlbEzi2vTvROwLSkPdohWdj3yhiQbaJdWrA1
 QAGYkiFYPahsrYXQ+8ZLNOzprugD3
X-Received: by 2002:a05:620a:22d6:b0:767:dc58:f256 with SMTP id
 o22-20020a05620a22d600b00767dc58f256mr576820qki.70.1690495054399; 
 Thu, 27 Jul 2023 14:57:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEzY7IQL3ZyLnsNAB2lwLy/4bDaZV4xaXncyDjJN0h+TlqUMguVN/HH1elUGz4ZzbmQ37uo1Q==
X-Received: by 2002:a05:620a:22d6:b0:767:dc58:f256 with SMTP id
 o22-20020a05620a22d600b00767dc58f256mr576803qki.70.1690495054117; 
 Thu, 27 Jul 2023 14:57:34 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05620a146800b0076c73ec2f88sm544372qkl.19.2023.07.27.14.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:57:33 -0700 (PDT)
Message-ID: <badef3d33469d97b01a42da520ad22ae4c9485fe.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+ DPCD issues
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Thu, 27 Jul 2023 17:57:33 -0400
In-Reply-To: <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
References: <20230707215851.590754-1-lyude@redhat.com>
 <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-07-09 at 01:42 +0200, Karol Herbst wrote:
> On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com> wro=
te:
> >=20
> > Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side of
> > nouveau in order to read the DPCD of a DP connector, which makes sure w=
e do
> > the right thing and also check for extended DPCD caps. However, it turn=
s
> > out we're not currently doing this on the nvkm side since we don't have
> > access to the drm_dp_aux structure there - which means that the DRM sid=
e of
> > the driver and the NVKM side can end up with different DPCD capabilitie=
s
> > for the same connector.
> >=20
> > Ideally to fix this, we want to start setting up the drm_dp_aux device =
in
> > NVKM before we've made contact with the DRM side - which should be pret=
ty
> > easy to accomplish (I'm already working on it!). Until then however, le=
t's
> > workaround this problem by porting a copy of drm_dp_read_dpcd_caps() in=
to
> > NVKM - which should fix this issue.
> >=20
> > Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
>=20
> Should a Fixes: or Cc: stable tag be added so it gets backported?

JFYI I think not adding one is fine nowadays? The stable bot seems to be
pretty good at catching anything with the words fix/fixes in it

>=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 ++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/disp/dp.c
> > index 40c8ea43c42f..b8ac66b4a2c4 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > @@ -26,6 +26,8 @@
> >  #include "head.h"
> >  #include "ior.h"
> >=20
> > +#include <drm/display/drm_dp.h>
> > +
> >  #include <subdev/bios.h>
> >  #include <subdev/bios/init.h>
> >  #include <subdev/gpio.h>
> > @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_ou=
tp *outp)
> >         return outp->dp.rates !=3D 0;
> >  }
> >=20
> > +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps=
()
>=20
> Well.. maybe we should rephrase that _if_ we want to see it
> backported. But is this code really that bad? It kinda looks
> reasonable enough.
>=20
> > + * converted to work inside nvkm. This is a temporary holdover until w=
e start
> > + * passing the drm_dp_aux device through NVKM
> > + */
> > +static int
> > +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> > +{
> > +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> > +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> > +       int ret;
> > +
> > +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_R=
ECEIVER_CAP_SIZE);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       /*
> > +        * Prior to DP1.3 the bit represented by
> > +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > +        * If it is set DP_DPCD_REV at 0000h could be at a value less t=
han
> > +        * the true capability of the panel. The only way to check is t=
o
> > +        * then compare 0000h and 2200h.
> > +        */
> > +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > +               return 0;
> > +
> > +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd=
_ext));
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > +               OUTP_DBG(outp, "Extended DPCD rev less than base DPCD r=
ev (%d > %d)\n",
> > +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_R=
EV]);
> > +               return 0;
> > +       }
> > +
> > +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > +               return 0;
> > +
> > +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> > +
> > +       return 0;
> > +}
> > +
> >  void
> >  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
> >  {
> > @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
> >                         memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lt=
tpr));
> >                 }
> >=20
> > -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd,=
 sizeof(outp->dp.dpcd))) {
> > +               if (!nvkm_dp_read_dpcd_caps(outp)) {
> >                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x06, =
0 };
> >                         const u8 *rate;
> >                         int rate_max;
> > --
> > 2.40.1
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

