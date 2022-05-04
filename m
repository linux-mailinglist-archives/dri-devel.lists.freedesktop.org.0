Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DC51AD50
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227A610E548;
	Wed,  4 May 2022 18:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601610E44A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651690196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4be0lUN3rLKvbTqi1ev9U0hEQDKuQCw8SDgLXDDtQ8=;
 b=QQdjlhf0jgVucxgsXv9Nsz3/h1xslENGu3/4rPEysFrH7rB4xd4gUp2p7C7AU9hktg7W15
 xWLvj0BaMNagb8IfFVdWO8NyIl62g6/3mul8QSkx0HBFLxGs8feWm7II+krP0Tbsrl+eR/
 GNvEF+0GwQJmDcqm6Vkd4PxTnrYH0W0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-R4DjmMl5Pb-VceKmiITGEA-1; Wed, 04 May 2022 14:49:56 -0400
X-MC-Unique: R4DjmMl5Pb-VceKmiITGEA-1
Received: by mail-qt1-f199.google.com with SMTP id
 x5-20020a05622a000500b002f37cb8b803so1699767qtw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=m4be0lUN3rLKvbTqi1ev9U0hEQDKuQCw8SDgLXDDtQ8=;
 b=6m3XAwRqaEMWQpvEJPei5JOIWq+UTM9gaax/PyyGFcgUZiwzTzsJbBvoCFS7I+/KuV
 aKhO8+ner9Ohuy55vmzVoAVk71McrhxZw/0mxfSgPcBEEEMZF5WUorPkpqnCxx7/srMH
 +n9jt8zTPmlQ/Q7Unypk8NOTQNTMQk+yvs2jQ9caeIs3Rvi4K9tEXJgj0txB1zm9Whd2
 +8T5BjVdx6G++8gytqazx4Ugdhl8Y1U6X5p+/GJZLnSLy6zPuACWloXASI7lR6EPv2hY
 wQpZ96oInMUwMi/1IeV4M7jCO6Sf5qoN9dgZtOToxI0dr6DApLkPP9vz7VWEVx+T2He+
 GTig==
X-Gm-Message-State: AOAM531i/vKy//jU3tt0bfvIFAdZV2yiU2n0+fswgD6N9Mo1sDlLr/Dh
 BLqCkbpUdR19/+dohPyzkfu0AAXJ4nGcfFsPbcjXJdboY9dav7PLpuVSSwn4JsAH06o5jqmbSio
 C6nQJhaZ78wwMSaE7+3jpeGAGXjsK
X-Received: by 2002:ac8:4e8f:0:b0:2f3:83ef:f06b with SMTP id
 15-20020ac84e8f000000b002f383eff06bmr20138273qtp.344.1651690194861; 
 Wed, 04 May 2022 11:49:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG+YEE9640XC9Q0TxKXIOu4OYQRb9HIa17dkwYt7i3SPR51ROIyeLOHCH0GKjio7e5whfd8A==
X-Received: by 2002:ac8:4e8f:0:b0:2f3:83ef:f06b with SMTP id
 15-20020ac84e8f000000b002f383eff06bmr20138250qtp.344.1651690194570; 
 Wed, 04 May 2022 11:49:54 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 o26-20020ac872da000000b002f39b99f6afsm7565524qtp.73.2022.05.04.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 11:49:53 -0700 (PDT)
Message-ID: <8c3592767ac4c3d4c3bcb0294d97aff5a7375319.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for fault errors
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Wed, 04 May 2022 14:49:52 -0400
In-Reply-To: <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
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

On Tue, 2022-05-03 at 21:23 +0200, Karol Herbst wrote:
> not able to hit any error on my machine, but regardless:
> 
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
> 
> I suspect there are more places where we could put it, but we can add
> those later.
> 
> Anyway, I think it's valuable to push it through fixes, not sure how
> far back we want to CC stable though.

JFYI - dim fixes can figure this out if you just give it the commit that
introduced the issue.

Anyway, will push this upstream in a moment

> 
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

