Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5412A28B8C1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 15:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CEB6E102;
	Mon, 12 Oct 2020 13:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEE46E102
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 13:55:18 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id o184so473682ooo.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4XvQFKNEkt211Ddxr8h8Ob2c6lT1Af7mIzouIsn+tc=;
 b=BjbgXQCqdibxCfuJG/fI5cLmEeuYSW4cX3/7pruaGDdoLksnm6hZ3NvQ11nzRoJoSK
 WcquupXTXrJD8xiFOfYsaHqBQP0iwfLSrJqEEXsqQqa1WAexjOYPn/L8GEanf+jXjF4T
 a92ZliDJbbHuu0NAn4xrAUDrSSqVuSgN7zFo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4XvQFKNEkt211Ddxr8h8Ob2c6lT1Af7mIzouIsn+tc=;
 b=KpBtqND8Y4Y2kdxtbBGp6xbvYjVLhrC+e6gf0Jqe1wCm+/5t8vGldSgh9+B0pvwN/S
 2XYtimgy4IZpYNr8oB09FGwNPIWi4QSYbaO9m8R2MWOhWXj2ifhbVK75XaPlEBGA7It+
 DT5GJ+YY7y71ktmMy/7tdnX8yjbTCUrBYFRAm085x9SFpKfVSv1nPkfFt2V4KRhMe9fy
 F0RanAASzLxNsI52czfXrxjAfdo9t2GxkrR4bUB5jtxOEXK+k4tvzmrTVXb7uxks3hbp
 DGIFz8Ikb0YgMvwpkVx6s/dEuqCZOT/HklqhG/GRspRcoZ1lQPQJdBUilRE9UvGkdRHt
 piYg==
X-Gm-Message-State: AOAM532/2u1oaOFA+1rUD8Ez3sH+KDjHKlsExBOQdm3lOhsIYesYU/n5
 8RS+TfTBrjBzgGfeWAqhSmYmFM/+bZW40LLj6gc7gEL/VoXu6g==
X-Google-Smtp-Source: ABdhPJzInRvPcsIcigexkBlG16TdFhi6B6+mJolGDf9v28qaXFyXkcxzdHhPl0n81LXhpZRiJAWCDNgEbJXup/MAjWU=
X-Received: by 2002:a4a:c011:: with SMTP id v17mr18463716oop.89.1602510917966; 
 Mon, 12 Oct 2020 06:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201009102132.22770-1-chris@chris-wilson.co.uk>
 <CAKMK7uG51_t9988vTen2rK+gbwwjN0tLphpVhMd2nbsFTNi+GQ@mail.gmail.com>
 <160249974352.30484.764236348954464063@build.alporthouse.com>
In-Reply-To: <160249974352.30484.764236348954464063@build.alporthouse.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 12 Oct 2020 15:55:07 +0200
Message-ID: <CAKMK7uForN39MQ-1EsD5-TNfHG4=jXSMPR70T6QY0BhMQGVrRw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Replace vgem_object_funcs with the
 common drm shmem helper
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 12:49 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Daniel Vetter (2020-10-09 17:16:06)
> > On Fri, Oct 9, 2020 at 12:21 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > vgem is a minimalistic driver that provides shmemfs objects to
> > > userspace that may then be used as an in-memory surface and transported
> > > across dma-buf to other drivers. Since it's introduction,
> > > drm_gem_shmem_helper now provides the same shmemfs facilities and so we
> > > can trim vgem to wrap the helper.
> > >
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  drivers/gpu/drm/Kconfig         |   1 +
> > >  drivers/gpu/drm/vgem/vgem_drv.c | 281 ++------------------------------
> > >  drivers/gpu/drm/vgem/vgem_drv.h |  11 --
> > >  3 files changed, 13 insertions(+), 280 deletions(-)
> >
> > Nice diffstat :-)
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Unfortunately I had to drop the drm_gem_prime_mmap() since the existing
> expectation is that we hand the faulthandler off to shmemfs so we can
> release the module while the memory is exported.

That sounds like a broken igt. Once we have refcounting for
outstanding dma_fence/buf or anything else we'll block unloading of
the module (not unbinding of the driver). Which one is that?

> The other issue happens
> to be for arch/x86 where just setting PAT=WC on the PTE does not flush
> the cache for that page, and the CPU will preferentially use the cache.
> That has caught us out more than once.

Ah, the old disappointment around wc and dma-api on x86 I guess :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
