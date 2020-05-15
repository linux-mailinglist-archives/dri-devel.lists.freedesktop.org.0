Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93771D500D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A656ECAC;
	Fri, 15 May 2020 14:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F6E6ECAC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:10:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m12so2485937wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=30bGS6eEbT86bOm7q/Pff7E63+A8Ea8IBpRUjx6DIDM=;
 b=gJSVBZI0QlhqGUW8UtzhRnoJ274kWv3HjMykc9bVeORarY1yl+TqTqiMd1h1RBNvIe
 tQqmVwj1G5eJy+/HPwpj5NYss+lwBzI4k8imb3APpTs0kHKqfDJDUxZLAvZcpaINkUYD
 3eeim2T7m7OepSo/GpLBZyfSBF6yofhgTmD58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=30bGS6eEbT86bOm7q/Pff7E63+A8Ea8IBpRUjx6DIDM=;
 b=pa2qv9sxvUESa4Iyv9HsAxeCr+tUYZqhdAcZFTePa5vatiaazb98Ya3PqoyAjR/8Nm
 A4xLiFjCZtzVgED6QMRkpZBOsASAwnlW317r1BiAVM2qP7jJPpnxKzBf76iz8H+UTMko
 r3XSwHmhG5S1VF26j1Zf0ncgWmoEpJPRc8WHtLlFg5sTnSKkWEklCbIzNd07D1yuCJaC
 6zOQdRMJgaJ61ENbW9GgPDhggyIVn8cGGZRfvL7n9ZDI5uyQ+T3c51fATm/orVgWpW4U
 IZYvxLIuxcHVZ199pU1aJ4mXhsqQZgRGP53fJsX6wNLXgeiJGNMkiUSwUM2SMN8nVOc3
 otTA==
X-Gm-Message-State: AOAM533n0P6ZDSP7M5hfqdn2odX8HwiPq99ALHSYZkmLbeUk0bS6OOUl
 polnNUkXDfxw82L+wl9thNQpTA==
X-Google-Smtp-Source: ABdhPJxWkWnxN4cVtYpfVZbc42YSRRr9A2AxYDW5FUuRl5TSSDC04Mj6L3TTTtEcYA4wun7JTrU6PQ==
X-Received: by 2002:a1c:a947:: with SMTP id s68mr4299107wme.25.1589551847585; 
 Fri, 15 May 2020 07:10:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c80sm4017827wme.15.2020.05.15.07.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:10:46 -0700 (PDT)
Date: Fri, 15 May 2020 16:10:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
Message-ID: <20200515141044.GH206103@phenom.ffwll.local>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 08:58:02AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 14.05.20 um 22:36 schrieb Rob Herring:
> > On Thu, May 14, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Wed, May 13, 2020 at 05:03:11PM +0200, Thomas Zimmermann wrote:
> >>> SHMEM-buffer backing storage is allocated from system memory; which is
> >>> typically cachable. Currently, only virtio uses cachable mappings; udl
> >>> uses its own vmap/mmap implementation for cachable mappings. Other
> >>> drivers default to writecombine mappings.
> >>
> >> I'm pretty sure this breaks all these drivers. quick grep on a few
> >> functions says this is used by lima, panfrost, v3d. And they definitely
> >> need uncached/wc stuff afaiui. Or I'm completely missing something?
> > =

> =

> OK. I think I'll just make a patch that adds a .gem_create_object helper
> that sets the map_cached flag. So drivers can opt-in.
> =

> > Yes, that would be my guess. DMA is usually non-coherent on Arm.
> =

> Can one of you give me some pointer to what you're looking at? For
> example, I grepped for use of vmap within lima and only found [1].
> That's a for memcpy with no DMA involved. There's got to be something
> I'm missing.
> =

> Best regards
> Thomas
> =

> [1]
> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/lima/lima_s=
ched.c#n391

$ git grep drm_gem_shmem_mmap

We also need correct access from userspace, otherwise the gpu is going to
be sad.
-Daniel
> =

> > =

> > Rob
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
