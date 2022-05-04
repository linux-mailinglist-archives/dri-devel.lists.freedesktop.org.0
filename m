Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76E51AD5B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1FC10E247;
	Wed,  4 May 2022 18:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8110E19C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 18:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651690542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5sq7D0GSE1tPNdbO+G8lvLB2O9LGGtgK7KLOXhSz24=;
 b=jUkgY8xKxSYDKg+uaOLBFOE/PLREfb3dBgNRc7Hw7pR1nQXs9v+i6DY+Qys+Mxx8Hl7vLW
 6CVSFo4msgRo1CanB6uPULEafHKTTQJGUzyT4XpLQfEAt91kTw915xkcDTQqtICLrDJC0b
 99K8QGl+r/DwLgYcqDtEqBGtV5GRT+4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-MDNi_r1BP4-8sSnqW5oFyQ-1; Wed, 04 May 2022 14:55:38 -0400
X-MC-Unique: MDNi_r1BP4-8sSnqW5oFyQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 bz15-20020ad44c0f000000b0045641657fd2so1508679qvb.22
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=G5sq7D0GSE1tPNdbO+G8lvLB2O9LGGtgK7KLOXhSz24=;
 b=NIowa1VU/ovIiTZBCr5iibW786ALXh0W848FxfdQP4zMCFpxM9deZ3jrnt3r1GLiOy
 pk+gPyZW7o1RczjC0jtI5Bs/Z9TNIEj3fW4wHJZ+DwyD1NWxZFohXZKigYkRxECjOYsh
 e3qhlAfsiZw0Tbd5ee91nN3GXSpSIYPu7d6gidhYSFWNDmfEHdObvLyn1+QoJGRsF0Rl
 UwU/JA5iF3vqqr8WFrZ7/zVgl4oijvaDgDud/9L/8jDz//pY7t9lGQluYkthCZrIB35K
 /8ud4o3mnHfUiHCtYdpd4cS7uDq158ctCb5PySQoxl9uR4XmZQACjpemNyzx+80Tpy2D
 x5LQ==
X-Gm-Message-State: AOAM532aW+rKpGN8vYkR4HzFtGixt623Vj91hwGD3LpZXdwN+S4697tt
 Pvw6SlmLO0KgK5/yR+fqmgRCLpOT2YFN+yqilmG7mJHZlNWF5JsA1UZKU4XvJaO98H3nxnqJnzY
 Yu1d801ZeUS4DPejCfVeMSW+wUNmP
X-Received: by 2002:a05:622a:351:b0:2f3:9508:913d with SMTP id
 r17-20020a05622a035100b002f39508913dmr20929547qtw.591.1651690537893; 
 Wed, 04 May 2022 11:55:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM4NAc3Zu7Pt08jcQZmnlTYfqOQGKWsleikyeCgJL5yw/+oZ/joLQ4Zxedkro6eTP3eBvGsg==
X-Received: by 2002:a05:622a:351:b0:2f3:9508:913d with SMTP id
 r17-20020a05622a035100b002f39508913dmr20929536qtw.591.1651690537653; 
 Wed, 04 May 2022 11:55:37 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 n68-20020a37a447000000b0069fc13ce1edsm8154936qke.30.2022.05.04.11.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 11:55:36 -0700 (PDT)
Message-ID: <47305e0aacc88a7a8386e80a9fa291035cb7a282.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for fault errors
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Wed, 04 May 2022 14:55:35 -0400
In-Reply-To: <8c3592767ac4c3d4c3bcb0294d97aff5a7375319.camel@redhat.com>
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
 <8c3592767ac4c3d4c3bcb0294d97aff5a7375319.camel@redhat.com>
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

Mhhh - looks like it goes far back enough I probably should just Cc it without
a version tag and see how far it applies for greg. Will do that


On Wed, 2022-05-04 at 14:49 -0400, Lyude Paul wrote:
> On Tue, 2022-05-03 at 21:23 +0200, Karol Herbst wrote:
> > not able to hit any error on my machine, but regardless:
> > 
> > Reviewed-by: Karol Herbst <kherbst@redhat.com>
> > 
> > I suspect there are more places where we could put it, but we can add
> > those later.
> > 
> > Anyway, I think it's valuable to push it through fixes, not sure how
> > far back we want to CC stable though.
> 
> JFYI - dim fixes can figure this out if you just give it the commit that
> introduced the issue.
> 
> Anyway, will push this upstream in a moment
> 
> > 
> > On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
> > > 
> > > There's plenty of ways to fudge the GPU when developing on nouveau by
> > > mistake, some of which can result in nouveau seriously spamming dmesg
> > > with
> > > fault errors. This can be somewhat annoying, as it can quickly overrun
> > > the
> > > message buffer (or your terminal emulator's buffer) and get rid of
> > > actually
> > > useful feedback from the driver. While working on my new atomic only MST
> > > branch, I ran into this issue a couple of times.
> > > 
> > > So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> > > ratelimit errors from faults. This should be fine for developers, since
> > > it's nearly always only the first few faults that we care about seeing.
> > > Plus, you can turn off rate limiting in the kernel if you really need
> > > to.
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
> > >  4 files changed, 15 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > index 1665738948fb..96113c8bee8c 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
> > >  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
> > >  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
> > >  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> > > +
> > > +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR,
> > > err_ratelimited, f, ##a)
> > >  #endif
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > index 53a6651ac225..80b5aaceeaad 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > > 
> > > -               nvkm_error(subdev,
> > > -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc),
> > > -                          (stat & 0x00000002) ? "!ENGINE " : "",
> > > -                          (stat & 0x00000004) ? "PRIVRING " : "",
> > > -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> > > +               nvkm_error_ratelimited(subdev,
> > > +                                      "MMIO %s of %08x FAULT at %06x [
> > > %s%s%s]\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc),
> > > +                                      (stat & 0x00000002) ? "!ENGINE "
> > > :
> > > "",
> > > +                                      (stat & 0x00000004) ? "PRIVRING "
> > > :
> > > "",
> > > +                                      (stat & 0x00000008) ? "TIMEOUT "
> > > :
> > > "");
> > > 
> > >                 nvkm_wr32(device, 0x009084, 0x00000000);
> > >                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > index ad8da523bb22..c75e463f3501 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > > 
> > > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc));
> > > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > > %06x\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc));
> > > 
> > >                 stat &= ~0x00000008;
> > >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > index 3a1e45adeedc..2055d0b100d3 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > > 
> > > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc));
> > > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > > %06x\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc));
> > > 
> > >                 stat &= ~0x00000008;
> > >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > > --
> > > 2.35.1
> > > 
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

