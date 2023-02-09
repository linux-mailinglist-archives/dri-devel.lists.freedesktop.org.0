Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DEF691248
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 21:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE0810EB84;
	Thu,  9 Feb 2023 20:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB41B10EB84
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675976177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOijvwsKDok7G2BOzmH1GSGEU6At5AF1U1zcEVVJWFM=;
 b=RPS27plWqrP4AkkcU8vLbA05zvmqzMXVrr34rY6U0VmBWd+joZ3Ta48kNcSYpefEqK+tz6
 37R/AP/w0UPzFuzslNncgrimFsEDj2JpfPbgzESC/TMnMFFPOQVo5Cmb1Q6r/HW7iq9lQM
 yaq91YwBKea0cYV4xXO1wB9Wr88Y3M8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-ULBmap9OOqmRq52z-Cos_Q-1; Thu, 09 Feb 2023 15:56:16 -0500
X-MC-Unique: ULBmap9OOqmRq52z-Cos_Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 x20-20020ad44594000000b0056c25bbe602so1964238qvu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 12:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MwvhZIExeC6pg1mA1eBczPhmNq0o9JVqra38D4tU9DA=;
 b=aW5r+xrW6/zEkIL/gTjK39PC51MxBFXo/7j3PJO6R9r+x6E5h0dqVofMyA9QAQRoKb
 W5djLOSfI5LWvu2FGAPT3XNqszVO8JuUqMRr5szTyNL+hYzFKTkuGJG4qUVAo4CBoQiy
 1Z8Sbu5chQ5rQit7rMor9FZUlN/ympqWiaJe+1xWp6ZyB71SJMwxv8UEaNLjp5gxi3r6
 KsHDY2D0Ks+V6o6FQmoNgHxfcGqYHfA1iN8x7SqQL/eEpDN1oa3f7GYrhMyFCE5UQPCm
 i5TSG/4FZhUvSlb9ACd5HzMUSVFAEsMA/tIFI4fR6QxMXVu7JvAP1cykNaUXBM56idRU
 H2GQ==
X-Gm-Message-State: AO0yUKUWHAJGPG4V8NHn21Z8/zwk+y+cEzjRbJUuZstZrpHJjlvOk9Yw
 3Oe/uQI4EEaKsflSNhiShauLA++67ueexnyWoQ3x8vPwr/qk8QwbOerNcc7jPZbwbaT8JYZFy5Y
 HhLOo62bTKlrJK0/S6RZyUDxfEtac
X-Received: by 2002:ac8:5842:0:b0:3b6:3508:2a3e with SMTP id
 h2-20020ac85842000000b003b635082a3emr22689024qth.4.1675976175885; 
 Thu, 09 Feb 2023 12:56:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/Sgu6IrdyuvSr/55VxeDEiDRADgmgMtUxxr0kepPtczgL94WYP5qNW4ED01WvYyZ4jpi+QiA==
X-Received: by 2002:ac8:5842:0:b0:3b6:3508:2a3e with SMTP id
 h2-20020ac85842000000b003b635082a3emr22688994qth.4.1675976175614; 
 Thu, 09 Feb 2023 12:56:15 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800:3463:5df7:aced:152e?
 ([2600:4040:5c68:6800:3463:5df7:aced:152e])
 by smtp.gmail.com with ESMTPSA id
 73-20020a370b4c000000b007259807a512sm2078501qkl.12.2023.02.09.12.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 12:56:15 -0800 (PST)
Message-ID: <4ecbb8cde92a422fab52e29f826b7d5dda0ac681.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Fix nvif_outp_acquire_dp() argument size
From: Lyude Paul <lyude@redhat.com>
To: Kees Cook <keescook@chromium.org>
Date: Thu, 09 Feb 2023 15:56:14 -0500
In-Reply-To: <202301271141.6741F43@keescook>
References: <20221127183036.never.139-kees@kernel.org>
 <202301251214.8E52414D0@keescook>
 <9c53c624604b7415ceeedf7222e78abc2c64430f.camel@redhat.com>
 <202301271141.6741F43@keescook>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think that shoud be fine, which branch is it on?

On Fri, 2023-01-27 at 11:42 -0800, Kees Cook wrote:
> On Wed, Jan 25, 2023 at 04:24:19PM -0500, Lyude Paul wrote:
> > Sorry! I've been pretty busy until now, this is:
> >=20
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Let me know if you've pushed it already or if you want me to push it to=
 drm-
> > misc
>=20
> Either way is fine. I'm currently carrying it, but I can easily drop it
> if you prefer it go via drm-misc.
>=20
> Thanks!
>=20
> -Kees
>=20
> >=20
> > On Wed, 2023-01-25 at 12:15 -0800, Kees Cook wrote:
> > > Ping. I'll take this via my tree unless someone else wants to take it=
...
> > >=20
> > > On Sun, Nov 27, 2022 at 10:30:41AM -0800, Kees Cook wrote:
> > > > Both Coverity and GCC with -Wstringop-overflow noticed that
> > > > nvif_outp_acquire_dp() accidentally defined its second argument wit=
h 1
> > > > additional element:
> > > >=20
> > > > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_pior_ato=
mic_enable':
> > > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: error: 'nvif_outp_=
acquire_dp' accessing 16 bytes in a region of size 15 [-Werror=3Dstringop-o=
verflow=3D]
> > > >  1813 |                 nvif_outp_acquire_dp(&nv_encoder->outp, nv_=
encoder->dp.dpcd, 0, 0, false, false);
> > > >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: note: referencing =
argument 2 of type 'u8[16]' {aka 'unsigned char[16]'}
> > > > drivers/gpu/drm/nouveau/include/nvif/outp.h:24:5: note: in a call t=
o function 'nvif_outp_acquire_dp'
> > > >    24 | int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> > > >       |     ^~~~~~~~~~~~~~~~~~~~
> > > >=20
> > > > Avoid these warnings by defining the argument size using the matchi=
ng
> > > > define (DP_RECEIVER_CAP_SIZE, 15) instead of having it be a literal
> > > > (and incorrect) value (16).
> > > >=20
> > > > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > > > Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
> > > > Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
> > > > Link: https://lore.kernel.org/lkml/202211100848.FFBA2432@keescook/
> > > > Link: https://lore.kernel.org/lkml/202211100848.F4C2819BB@keescook/
> > > > Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into ac=
quire")
> > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > Cc: Karol Herbst <kherbst@redhat.com>
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/include/nvif/outp.h | 3 ++-
> > > >  drivers/gpu/drm/nouveau/nvif/outp.c         | 2 +-
> > > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/=
gpu/drm/nouveau/include/nvif/outp.h
> > > > index 45daadec3c0c..fa76a7b5e4b3 100644
> > > > --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > > > +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > > > @@ -3,6 +3,7 @@
> > > >  #define __NVIF_OUTP_H__
> > > >  #include <nvif/object.h>
> > > >  #include <nvif/if0012.h>
> > > > +#include <drm/display/drm_dp.h>
> > > >  struct nvif_disp;
> > > > =20
> > > >  struct nvif_outp {
> > > > @@ -21,7 +22,7 @@ int nvif_outp_acquire_rgb_crt(struct nvif_outp *)=
;
> > > >  int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
> > > >  =09=09=09   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool h=
da);
> > > >  int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc=
8);
> > > > -int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> > > > +int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIV=
ER_CAP_SIZE],
> > > >  =09=09=09 int link_nr, int link_bw, bool hda, bool mst);
> > > >  void nvif_outp_release(struct nvif_outp *);
> > > >  int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_o=
utp_infoframe_v0 *, u32 size);
> > > > diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/=
nouveau/nvif/outp.c
> > > > index 7da39f1eae9f..c24bc5eae3ec 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> > > > @@ -127,7 +127,7 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 pr=
oto, struct nvif_outp_acquire_v0
> > > >  }
> > > > =20
> > > >  int
> > > > -nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > > > +nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_C=
AP_SIZE],
> > > >  =09=09     int link_nr, int link_bw, bool hda, bool mst)
> > > >  {
> > > >  =09struct nvif_outp_acquire_v0 args;
> > > > --=20
> > > > 2.34.1
> > > >=20
> > >=20
> >=20
> > --=20
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

