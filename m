Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB11F77BA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 14:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495AA6E956;
	Fri, 12 Jun 2020 12:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB3C6E956
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:11:08 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id z145so1877536ooa.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmrIgfpI+n8LQE4tu10UZBR9goUoOLlBFbRNH8T/Lpg=;
 b=AFDZs7y/BEfsJ3DEvAd7ed1uFJG3P5hPjDxQ9L23VU4bGw/CT2CmYHuC4HDi+jyYrM
 n4O2usUUmYSCTk8PKZejbzC6/NYoKncziwuQDmX1WOS9L2mPsTLQBzTy1MP4cO3KprdY
 f9Ok+TEQTqAee9rWsTqretjbQ9tAnhqV22jJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmrIgfpI+n8LQE4tu10UZBR9goUoOLlBFbRNH8T/Lpg=;
 b=JeHF8UriM8Xrz079MmDagRKcu7lN4ceuho/gTIetekaEP1XxylQzK/HUB8bKAAJVwa
 MVFh5ZGMU2oI7xlE6KZjmkMr6ElvSbcujjJ177La2PeMv0BxJxqQ7/fra1rqU7Dpdjyc
 IqP6wm3LO/riyLPXil2swUpKXhmJgNmd2I4UN7ZIA2M2lvv0hJ/Liidj0kJKKXgEvCsU
 B128OXsABYtK+HHhyWNMGnlXxF8z8zEv/U5y9t1PawEY/MwgrhO0if7h+o4vd1IShHb+
 FoTbfKBGxdePFHhiHfHv5qzml2UGcibx12iRgJbNxTzf4h3W2w02yxbu5BL9/6BheMpj
 OsSg==
X-Gm-Message-State: AOAM531XEb2Ut5NmYccLw9SEUgq280b79QbkG3ud4cUVLsH8/zvdyyDv
 Z9ZgOg5PDGoC9NqMNHI+kKwnMC1azbj66ZGPcl9Swg==
X-Google-Smtp-Source: ABdhPJy341ckNdjktYB6egjOeCWmAnE80iH3GjnkEGFbFq7I2cr1O68lDq4rjuGU4tD8OfJM1vSUFmZ22bQmK1VaxkU=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr10246068oob.28.1591963868049; 
 Fri, 12 Jun 2020 05:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
 <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
In-Reply-To: <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 12 Jun 2020 14:10:56 +0200
Message-ID: <CAKMK7uE6g8TF7vvaWK=PK1ryQBZrEM5XS07_JEhyrwtkU=A13A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 12:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Jun 12, 2020 at 11:47:55AM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 12.06.20 um 03:36 schrieb Gurchetan Singh:
> > > This is useful for the next patch.  Also, should we only unmap the
> > > amount entries that we mapped with the dma-api?
> >
> > It looks like you're moving virtio code into shmem.
>
> Well, not really.
>
> virtio has -- for historical reasons -- the oddity that it may or may
> not need to dma_map resources, depending on device configuration.
> Initially virtio went with "it's just a vm, lets simply operate on
> physical ram addresses".  That shortcut turned out to be a bad idea
> later on, especially with the arrival of iommu emulation support in
> qemu.  But we couldn't just scratch it for backward compatibility
> reasons.  See virtio_has_iommu_quirk().
>
> This just allows to enable/disable dma_map, I guess to fix some fallout
> from recent shmem helper changes (Gurchetan, that kind of stuff should
> be mentioned in cover letter and commit messages).
>
> I'm not sure virtio actually needs that patch though.  I *think* doing
> the dma_map+dma_unmap unconditionally, but then ignore the result in
> case we don't need it should work.  And it shouldn't be a horrible
> performance hit either, in case we don't have a (virtual) iommu in the
> VM dma mapping is essentially a nop ...

Yeah that sounds a lot more like a clean solution, instead of adding
random flags and stuff all over helpers for each edge-case. The
sgtable still has the struct pages, so just picking the right one in
virtio code seems a lot cleaner separation of concerns.
-Daniel

>
> take care,
>   Gerd
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
