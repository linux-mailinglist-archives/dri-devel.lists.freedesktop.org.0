Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699F5158C6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 01:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2CF10E27E;
	Fri, 29 Apr 2022 23:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA51110E27E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651273467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4DG5k7BAzkTCilt7w3+yZz+mLZhkxC8TdQc8ihe/QE=;
 b=bRXO+DgdmSqTNB0EMCbjAs3XbqAJjKa2bEyEh9lqz/Rye8CQtX+QVm8lKfM/ls1WxZQM/Q
 xuH0L1OfyZq6HddqJlPqGEt7iF+vjMsE3l7yU5wBS6YZgt7WPz/OOap+NYI2ISdIZZXCKJ
 kTE2JK6aIdc39uuymsFVEMa52jOokOM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-hdaCsQK1NkuC8WeD9C_Cfg-1; Fri, 29 Apr 2022 19:04:26 -0400
X-MC-Unique: hdaCsQK1NkuC8WeD9C_Cfg-1
Received: by mail-qv1-f71.google.com with SMTP id
 jx10-20020a0562142b0a00b00456531ba83dso6490877qvb.16
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=P4DG5k7BAzkTCilt7w3+yZz+mLZhkxC8TdQc8ihe/QE=;
 b=OuVtnLTqZR/TWRYw222pm0sfgEdROeuRT/bkxbnaGuExydHiVfwJx20zo/d6Cu8808
 SeXe5GCq5vjk2WwH4tlx/eKUrnVTJJiTSO6RNpJ7Rkww02mnairhN1cfi8hFoMyNGQ29
 Nf/JW2Z/GNpVcRJr3WIePRAAQXq7y7IXc8tdA8JJgyBHWe5EFN2y0YZYw7ZTAAMcoBRF
 2Xya58rVcWmud2TurfoT7yMyX9Yfoc67Szckzzvp143SYKOg4YVVTNNb4PofCpYJNikd
 J5gSOKsI8vqffwT6m8IC3aU1+tabv2Idj1opOXCDUyRNGHQrcTMR4MhS01iOI86Q2RDL
 ytOw==
X-Gm-Message-State: AOAM533LceTehKCk0UuYK5+qexjxIx7DlW0E32mg8hDMH4S866PjcbNe
 lXmPdSfVQV09pcDQfnwNVWuu1nCntrqdgIrnbTuUlPm9ol5OPgZ2b80ELKE2FM07oAitrZqKGhn
 B2tWknXbVL2iI9wOs1gAohojEi4ow
X-Received: by 2002:a05:620a:270d:b0:69e:bfab:6455 with SMTP id
 b13-20020a05620a270d00b0069ebfab6455mr1098640qkp.360.1651273465336; 
 Fri, 29 Apr 2022 16:04:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjyTtWGxFWkywX29LJU3vdElYL7Z7LeKNxBjx+Ua2YNeiggKBgD3lab+S7LtyztkQjnq3puw==
X-Received: by 2002:a05:620a:270d:b0:69e:bfab:6455 with SMTP id
 b13-20020a05620a270d00b0069ebfab6455mr1098617qkp.360.1651273465023; 
 Fri, 29 Apr 2022 16:04:25 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac86bd8000000b002f39b99f67esm320893qtt.24.2022.04.29.16.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 16:04:24 -0700 (PDT)
Message-ID: <a16299814fbbb4cad99f7c7bc9b83c7c31b63a69.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for fault errors
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Fri, 29 Apr 2022 19:04:23 -0400
In-Reply-To: <CACO55tuY6ACoW5jgRk8jCVZ_ZZDEBXczkaiTSpFDvw2h81r=xA@mail.gmail.com>
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55tuY6ACoW5jgRk8jCVZ_ZZDEBXczkaiTSpFDvw2h81r=xA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-04-30 at 00:56 +0200, Karol Herbst wrote:
> On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > There's plenty of ways to fudge the GPU when developing on nouveau by
> > mistake, some of which can result in nouveau seriously spamming dmesg with
> > fault errors. This can be somewhat annoying, as it can quickly overrun the
> > message buffer (or your terminal emulator's buffer) and get rid of
> > actually
> > useful feedback from the driver. While working on my new atomic only MST
> > branch, I ran into this issue a couple of times.
> > 
> > So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> > ratelimit errors from faults. This should be fine for developers, since
> > it's nearly always only the first few faults that we care about seeing.
> > Plus, you can turn off rate limiting in the kernel if you really need to.
> > 
> 
> good idea :)
> 
> Although I think we ultimately need a detection of "GPU state is
> trashed" where we cease to do anything and disable interrupts as some
> of those issues actually cause the kernel to get DOSed by nouveau
> spamming/handling interrupts. Not sure if we should go with this patch
> in the meantime, or if we should just go straight ahead and disable
> interrupts, which would also stop the spam.
> 
> Do you know if this patch here is enough to get the system to reboot
> normally or is it only spamming less?

I'd have to try to come up with a setup that can hit this again, although it
might not be that hard - last time I hit this it was because I was programming
the wrong PBN values for MST payloads into nvidia's hardware.

So I can't remember for sure if I could reboot, but I do know I could actually
log into the system easily and do stuff with ratelimiting applied so it's
definitely better then the current situation.

> 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
> >  4 files changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > index 1665738948fb..96113c8bee8c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
> >  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
> >  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
> >  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> > +
> > +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR,
> > err_ratelimited, f, ##a)
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > index 53a6651ac225..80b5aaceeaad 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev,
> > -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc),
> > -                          (stat & 0x00000002) ? "!ENGINE " : "",
> > -                          (stat & 0x00000004) ? "PRIVRING " : "",
> > -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> > +               nvkm_error_ratelimited(subdev,
> > +                                      "MMIO %s of %08x FAULT at %06x [
> > %s%s%s]\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc),
> > +                                      (stat & 0x00000002) ? "!ENGINE " :
> > "",
> > +                                      (stat & 0x00000004) ? "PRIVRING " :
> > "",
> > +                                      (stat & 0x00000008) ? "TIMEOUT " :
> > "");
> > 
> >                 nvkm_wr32(device, 0x009084, 0x00000000);
> >                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > index ad8da523bb22..c75e463f3501 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > %06x\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc));
> > 
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > index 3a1e45adeedc..2055d0b100d3 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > %06x\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc));
> > 
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > --
> > 2.35.1
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

