Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C392D21DB53
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7ED6E29E;
	Mon, 13 Jul 2020 16:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2186E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:12:23 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 18so9918047otv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iHretuVBgWEZCPDhdk1RcvMcqHYBpQqZI0aEcmBy1ek=;
 b=NDvo8spd4V+73UX7OwyRvb25Tq8QpIhB3HqCIKaKNr1bPoJEIG+XUGIcjbvRZaIagC
 37n8bWe7KRZYaPlMGKuFKrIq3dXYGrRK+XOgjKqwTqYmszR/jVWYxOLBMPsaK/4VLJcu
 OzR8O7oNIPLtP77OgZGWGu4Q+oKW0xAdRX24M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHretuVBgWEZCPDhdk1RcvMcqHYBpQqZI0aEcmBy1ek=;
 b=jiqz8BbkiSUXza4k8C7R9ePokqXFUdwKR1yc4nOmk3Vn+Uu3KQmnbfw1eF8GEwwRIc
 RwEtLOec9BI4RN5LRlYrNpQ1o6vyP5j+jQ/ZAvKFrXM1rVM5x0B9/pauVyOArPWbIyKC
 MOMxV4BJgXokaEue4DqcktT3qi+UZrmfmhHbCSk3LCCF54V72Uvbar4vABpmCh4D6Szy
 cUDUFHnvJ442h0ISMAlWhCPzrNjWnS0EKG73j2itbz8K03mIo7s11fCLrXNUbPNEHICd
 82/DZyzTb5xQmq+3MychnOXFaZDW6Hjhiyoy9KNVlLa8ASTswAXHqVbrwsRsdOAYRA8m
 xpkg==
X-Gm-Message-State: AOAM532uGcu0zWZOcgU5Tfev04SJNeJBy+vSZShrUMH4hGSIsmORNHhx
 jb26/3OKzp2GpX6Ycrpx9HgCB06RDnZZKThxXvMydw==
X-Google-Smtp-Source: ABdhPJxKeHaBnJlGswsRj8LZ7F+Pgu+isrM3HKnAXqRE993M3cPj7rC+nTko97kH9caMpxBvUP4aJnpKQY4ONOcyyEg=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr247637otr.303.1594656742300; 
 Mon, 13 Jul 2020 09:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
 <20200710115240.GI2571@kadam>
In-Reply-To: <20200710115240.GI2571@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 13 Jul 2020 18:12:11 +0200
Message-ID: <CAKMK7uE1idHW4msihsBSbo8aWf602gqT-Z_BCR-gSJCRfugu=w@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Rob Clark <robdclark@chromium.org>, security@kernel.org,
 Dave Airlie <airlied@linux.ie>, butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Thomas, who's the main author for vram helpers.
-Daniel

On Fri, Jul 10, 2020 at 1:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 10, 2020 at 04:24:03PM +0800, butt3rflyh4ck wrote:
> > I report a bug (in linux-5.8.0-rc4) found by syzkaller.
> >
> > kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.8.0-rc4.config
> >
> > I test the reproducer and crash too.
> >
> > In the drm_em_vram_t() function,  ttm_bo_init() function call
>          ^^^^^^^^^^^^^
> This a typo.  The function name is drm_gem_vram_init().
>
> > ttm_bo_init_reserved(),
> > the ttm_bo_init_reserved() function  call ttm_bo_put(), it will free
> > gbo->bo that is struct ttm_buffer_object.
> >
> > then, goto the err_drm_gem_object_release lable,
> > drm_gem_object_release() function will free gbo->bo.base, so cause use
> > after free.
> >
>
> There is a third free in drm_gem_vram_create().  This is a triple free
> bug.  The correct place to free this is in drm_gem_vram_create() because
> that's where it was allocated.
>
> This code is quite subtle so I'm not going to attempt to fix it because
> I can't test it.
>
> regards,
> dan carpenter
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
