Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05366543DCF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548C11A037;
	Wed,  8 Jun 2022 20:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165411A031
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654721503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbMyK7TZQftKTG3O3T1f3sHboTsvCwRpAGDUWPiFV1k=;
 b=XhnatpkHx+9JhlTgQQM7lxaXYhYWxg12D3MAOBSLrqk2IdGgZgkb+tHzxSC7ekaJ/rLuc4
 OeQFPlJHCvynHVE/MBPqGBC5KeQt1gb/aNgiM56BEAWhZhNVXYhd46GCZQ0TqeVm1K+HZr
 0ELVK8eP6lTjXQQ3QZeFFVzVJfgovJk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-KQx6XJxMOGmT5bJTLydb3A-1; Wed, 08 Jun 2022 16:51:42 -0400
X-MC-Unique: KQx6XJxMOGmT5bJTLydb3A-1
Received: by mail-qk1-f198.google.com with SMTP id
 s8-20020a05620a0bc800b006a6d42a1a0eso5578383qki.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bbMyK7TZQftKTG3O3T1f3sHboTsvCwRpAGDUWPiFV1k=;
 b=yD6sQWkwugzLg3WqQv1sFdNGuXtb17KqUw3U3c2Ik22OG8FzcNyHQJ+MmB95hDNWjf
 v2y2J0O0B/rW586ys+YggCcLXwc/lQv4FIcAbj44WNto2WVMHm15o1qq4jDJg+YoPOdP
 B6OFAIsA4UKI74PafNKis7k+xZJOer1rjVjm9JFTMEVEsMwQYBGpl981GUPqja9LPjqd
 kuv04pzPhnrVCdbYmb9hp5lZffqXy6oKNR91/Am6BSZ9Dzv6F9km3v039acSBx0r5Ybb
 c5PO2RLHMcvFhX1GVgDOU81+omBTqxh9uCqmj3IV5/pNfgetMD4Choe0UI5aSi0QK0SB
 Fc4w==
X-Gm-Message-State: AOAM532bYNhAAOb1s6IY9PmxaniVoB43YsqO7jFtiC8Ss/KvCNR6cTTE
 J2MykgIkAb38p1rZ9MrB3DVHK5M9+iRgPikDbzQ+oaR/BKJPtYBrCFZ+zrn5lrAyU9sulrepl69
 usvhhuaTKwXdtFm9Lo+PpAQMiRTMu
X-Received: by 2002:a05:620a:240a:b0:6a6:b841:a635 with SMTP id
 d10-20020a05620a240a00b006a6b841a635mr12580526qkn.689.1654721495652; 
 Wed, 08 Jun 2022 13:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw563j9Ikgp8UZy2o2Gq0mZYMB0zAtGvX1GX/jgOO02fGrg6IbIAPJH0fNtTotm//aCk+tO/A==
X-Received: by 2002:a05:620a:240a:b0:6a6:b841:a635 with SMTP id
 d10-20020a05620a240a00b006a6b841a635mr12580506qkn.689.1654721495392; 
 Wed, 08 Jun 2022 13:51:35 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05620a268300b006a6be577535sm8283564qkp.85.2022.06.08.13.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:51:34 -0700 (PDT)
Message-ID: <f548e6d03daf6c56cd011bd1a9ce46001e93590c.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/bios: Rename prom_init() and friends
 functions
From: Lyude Paul <lyude@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Wed, 08 Jun 2022 16:51:33 -0400
In-Reply-To: <8c6e570f5e65e4f5abebc136d40d567e9af4f940.camel@redhat.com>
References: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
 <f6e72c6e6d9ae9019ad675081493372f745cbbf5.camel@redhat.com>
 <8735ggeih2.fsf@mpe.ellerman.id.au>
 <8c6e570f5e65e4f5abebc136d40d567e9af4f940.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Alright, dim's pushing it now. sorry about that!

On Wed, 2022-06-08 at 16:48 -0400, Lyude Paul wrote:
> Whoops, it totally may have. Thank you for the reminder, I will double check
> and make sure this gets pushed today
> 
> On Tue, 2022-06-07 at 23:00 +1000, Michael Ellerman wrote:
> > Lyude Paul <lyude@redhat.com> writes:
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > 
> > > Will push to drm-misc-next
> > 
> > I don't see this patch in mainline or drm-misc-next, did it get lost?
> > 
> > cheers
> > 
> > > On Sat, 2022-03-19 at 11:27 +0100, Christophe Leroy wrote:
> > > > While working at fixing powerpc headers, I ended up with the
> > > > following error.
> > > > 
> > > >         drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1:
> > > > error:
> > > > conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *,
> > > > const
> > > > char *)'
> > > >         make[5]: *** [scripts/Makefile.build:288:
> > > > drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
> > > > 
> > > > powerpc and a few other architectures have a prom_init() global
> > > > function.
> > > > One day or another it will conflict with the one in shadowrom.c
> > > > 
> > > > Those being static, they can easily be renamed. Do it.
> > > > 
> > > > While at it, also rename the ops structure as 'nvbios_prom' instead of
> > > > 'nvbios_rom' in order to make it clear that it refers to the
> > > > NV_PROM device.
> > > > 
> > > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > > ---
> > > > v2: using nvbios_prom prefix instead of nvbios_rom. Changed structure
> > > > name
> > > > to keep things consistant.
> > > > 
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |  2 +-
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  2 +-
> > > >  .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   | 14 +++++++------
> > > > -
> > > >  3 files changed, 9 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > > index fac1bff1311b..cfa8a0c356dd 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > > @@ -19,7 +19,7 @@ struct nvbios_source {
> > > >  int nvbios_extend(struct nvkm_bios *, u32 length);
> > > >  int nvbios_shadow(struct nvkm_bios *);
> > > >  
> > > > -extern const struct nvbios_source nvbios_rom;
> > > > +extern const struct nvbios_source nvbios_prom;
> > > >  extern const struct nvbios_source nvbios_ramin;
> > > >  extern const struct nvbios_source nvbios_acpi_fast;
> > > >  extern const struct nvbios_source nvbios_acpi_slow;
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > > index 4b571cc6bc70..19188683c8fc 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > > @@ -171,7 +171,7 @@ nvbios_shadow(struct nvkm_bios *bios)
> > > >         struct shadow mthds[] = {
> > > >                 { 0, &nvbios_of },
> > > >                 { 0, &nvbios_ramin },
> > > > -               { 0, &nvbios_rom },
> > > > +               { 0, &nvbios_prom },
> > > >                 { 0, &nvbios_acpi_fast },
> > > >                 { 4, &nvbios_acpi_slow },
> > > >                 { 1, &nvbios_pcirom },
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > > index ffa4b395220a..39144ceb117b 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > > @@ -25,7 +25,7 @@
> > > >  #include <subdev/pci.h>
> > > >  
> > > >  static u32
> > > > -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> > > > +nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios
> > > > *bios)
> > > >  {
> > > >         struct nvkm_device *device = data;
> > > >         u32 i;
> > > > @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length,
> > > > struct
> > > > nvkm_bios *bios)
> > > >  }
> > > >  
> > > >  static void
> > > > -prom_fini(void *data)
> > > > +nvbios_prom_fini(void *data)
> > > >  {
> > > >         struct nvkm_device *device = data;
> > > >         nvkm_pci_rom_shadow(device->pci, true);
> > > >  }
> > > >  
> > > >  static void *
> > > > -prom_init(struct nvkm_bios *bios, const char *name)
> > > > +nvbios_prom_init(struct nvkm_bios *bios, const char *name)
> > > >  {
> > > >         struct nvkm_device *device = bios->subdev.device;
> > > >         if (device->card_type == NV_40 && device->chipset >= 0x4c)
> > > > @@ -55,10 +55,10 @@ prom_init(struct nvkm_bios *bios, const char
> > > > *name)
> > > >  }
> > > >  
> > > >  const struct nvbios_source
> > > > -nvbios_rom = {
> > > > +nvbios_prom = {
> > > >         .name = "PROM",
> > > > -       .init = prom_init,
> > > > -       .fini = prom_fini,
> > > > -       .read = prom_read,
> > > > +       .init = nvbios_prom_init,
> > > > +       .fini = nvbios_prom_fini,
> > > > +       .read = nvbios_prom_read,
> > > >         .rw = false,
> > > >  };
> > > 
> > > -- 
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

