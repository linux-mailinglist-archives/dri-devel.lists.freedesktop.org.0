Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB0543DBF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A431136A8;
	Wed,  8 Jun 2022 20:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878971136A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654721318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clHxW3sgfzzmzoMvOGIzcMmgsX8xQLBmlm21w7Tbfi4=;
 b=YQ8cW5qT5UGXdUThhOeM3EHmGjuwjZZcrkQ6XLHMa0eln85VKlQP+5VotO1hIRrCqI37Vh
 S0FyTbbQeR16M2tPgMGgd8WtFmc4PyGxSDRzv9fi3zBcqajl3taws4q5kUmYQrrF5QXYIh
 8oHpUSYkNAhPWtMFVCsszO4qDMAnIkE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-C4X4YAMJMCO1AgUFvBL4Og-1; Wed, 08 Jun 2022 16:48:37 -0400
X-MC-Unique: C4X4YAMJMCO1AgUFvBL4Og-1
Received: by mail-qv1-f71.google.com with SMTP id
 q36-20020a0c9127000000b00461e3828064so13670385qvq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=clHxW3sgfzzmzoMvOGIzcMmgsX8xQLBmlm21w7Tbfi4=;
 b=xWDJkoQbde+f/fAEKMx7xQNmz5rK+FFcqbvg7Bsf2W9TKJDUyKfFuz8QEewZ7vYZtp
 dD6z4r69YoT5IIOuvGZVExeLQhEhmxldaX/d7wFLfpsqLRWfEpsGpbeqBC8yYeHjNgIo
 dj5XuT9yfxlYHpmJ1ZRN5+2m7MeEBs8fWoKJJSHxmSJf/wOoLpqLK1i1fnPq4wiudQBj
 OEKwhUBIbtH1ojSllFde8tr1gngy89tbuGkPOXXRHY4EGUPXdpAh1203RRwyDWb4BWlo
 oPFmyss1CNid7NiYxe60r8b8eH/WQcYhR/Pb/jT46uOo99yOMqfQzY2z+I3rOYsXoF+O
 1/Mg==
X-Gm-Message-State: AOAM532Hy5171t7K9gN/OhBK/twIh4I7cnc/myeGY391YZ/0/HzpGAIe
 cp2tJPQXwwbeBeXWB79+jzCTA+SakacFm7R0D3WpeDcN+0nFOvgGFplZY2/m25h2SXxBW+EueUp
 AreFEgIC+vn7VdTP0tM4F2B5tbI+E
X-Received: by 2002:a05:620a:1792:b0:6a6:c734:d983 with SMTP id
 ay18-20020a05620a179200b006a6c734d983mr10766269qkb.682.1654721316199; 
 Wed, 08 Jun 2022 13:48:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4yQbEU3fDKosIS7kn5Gst5/farh3YaMGcVhxk0pUHaesd9XyYZl1qpwf5KBt+5Wbey6VZiQ==
X-Received: by 2002:a05:620a:1792:b0:6a6:c734:d983 with SMTP id
 ay18-20020a05620a179200b006a6c734d983mr10766244qkb.682.1654721315912; 
 Wed, 08 Jun 2022 13:48:35 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 de13-20020a05620a370d00b006a6d7c3a82esm4812257qkb.15.2022.06.08.13.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:48:35 -0700 (PDT)
Message-ID: <8c6e570f5e65e4f5abebc136d40d567e9af4f940.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/bios: Rename prom_init() and friends
 functions
From: Lyude Paul <lyude@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Wed, 08 Jun 2022 16:48:34 -0400
In-Reply-To: <8735ggeih2.fsf@mpe.ellerman.id.au>
References: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
 <f6e72c6e6d9ae9019ad675081493372f745cbbf5.camel@redhat.com>
 <8735ggeih2.fsf@mpe.ellerman.id.au>
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

Whoops, it totally may have. Thank you for the reminder, I will double check
and make sure this gets pushed today

On Tue, 2022-06-07 at 23:00 +1000, Michael Ellerman wrote:
> Lyude Paul <lyude@redhat.com> writes:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Will push to drm-misc-next
> 
> I don't see this patch in mainline or drm-misc-next, did it get lost?
> 
> cheers
> 
> > On Sat, 2022-03-19 at 11:27 +0100, Christophe Leroy wrote:
> > > While working at fixing powerpc headers, I ended up with the
> > > following error.
> > > 
> > >         drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1:
> > > error:
> > > conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *,
> > > const
> > > char *)'
> > >         make[5]: *** [scripts/Makefile.build:288:
> > > drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
> > > 
> > > powerpc and a few other architectures have a prom_init() global
> > > function.
> > > One day or another it will conflict with the one in shadowrom.c
> > > 
> > > Those being static, they can easily be renamed. Do it.
> > > 
> > > While at it, also rename the ops structure as 'nvbios_prom' instead of
> > > 'nvbios_rom' in order to make it clear that it refers to the
> > > NV_PROM device.
> > > 
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > > v2: using nvbios_prom prefix instead of nvbios_rom. Changed structure
> > > name
> > > to keep things consistant.
> > > 
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |  2 +-
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  2 +-
> > >  .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   | 14 +++++++-------
> > >  3 files changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > index fac1bff1311b..cfa8a0c356dd 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> > > @@ -19,7 +19,7 @@ struct nvbios_source {
> > >  int nvbios_extend(struct nvkm_bios *, u32 length);
> > >  int nvbios_shadow(struct nvkm_bios *);
> > >  
> > > -extern const struct nvbios_source nvbios_rom;
> > > +extern const struct nvbios_source nvbios_prom;
> > >  extern const struct nvbios_source nvbios_ramin;
> > >  extern const struct nvbios_source nvbios_acpi_fast;
> > >  extern const struct nvbios_source nvbios_acpi_slow;
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > index 4b571cc6bc70..19188683c8fc 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> > > @@ -171,7 +171,7 @@ nvbios_shadow(struct nvkm_bios *bios)
> > >         struct shadow mthds[] = {
> > >                 { 0, &nvbios_of },
> > >                 { 0, &nvbios_ramin },
> > > -               { 0, &nvbios_rom },
> > > +               { 0, &nvbios_prom },
> > >                 { 0, &nvbios_acpi_fast },
> > >                 { 4, &nvbios_acpi_slow },
> > >                 { 1, &nvbios_pcirom },
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > index ffa4b395220a..39144ceb117b 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> > > @@ -25,7 +25,7 @@
> > >  #include <subdev/pci.h>
> > >  
> > >  static u32
> > > -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> > > +nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios
> > > *bios)
> > >  {
> > >         struct nvkm_device *device = data;
> > >         u32 i;
> > > @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct
> > > nvkm_bios *bios)
> > >  }
> > >  
> > >  static void
> > > -prom_fini(void *data)
> > > +nvbios_prom_fini(void *data)
> > >  {
> > >         struct nvkm_device *device = data;
> > >         nvkm_pci_rom_shadow(device->pci, true);
> > >  }
> > >  
> > >  static void *
> > > -prom_init(struct nvkm_bios *bios, const char *name)
> > > +nvbios_prom_init(struct nvkm_bios *bios, const char *name)
> > >  {
> > >         struct nvkm_device *device = bios->subdev.device;
> > >         if (device->card_type == NV_40 && device->chipset >= 0x4c)
> > > @@ -55,10 +55,10 @@ prom_init(struct nvkm_bios *bios, const char *name)
> > >  }
> > >  
> > >  const struct nvbios_source
> > > -nvbios_rom = {
> > > +nvbios_prom = {
> > >         .name = "PROM",
> > > -       .init = prom_init,
> > > -       .fini = prom_fini,
> > > -       .read = prom_read,
> > > +       .init = nvbios_prom_init,
> > > +       .fini = nvbios_prom_fini,
> > > +       .read = nvbios_prom_read,
> > >         .rw = false,
> > >  };
> > 
> > -- 
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

