Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A3644ADB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1B310E06D;
	Tue,  6 Dec 2022 18:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0E10E33B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 18:09:23 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1443a16b71cso14868018fac.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 10:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CWev+jDg0dJZ3iRe8fmDv7sVMbP2pNiYIK+0iXz8Ozw=;
 b=gGQ4+B1AD0prkHHQTMEZSg0B+Po3EeECzMeGxLiglZQCMnadIghRxwxHWlMxquyKfM
 lZYGC0USPIpX+prT+vtaowDIjN0L6IDesiXaKcbI0I8Tf/Z5LyT4gabJEv7w2YrxbBxc
 nJedvuGElXiXAtWQ49k9akfBY7U9WtFgCQBOsm9B/E0SzOXZcYBq6tVQYi5feQ5RS90Y
 1W2VHnpMB1vz/6R4PSPHvA596hjbHdO/46l/DkU8+E0w9rIvWwzQ/U77GhiuIEEoy1iz
 d0xHLBpDdDsSdRW7StAyzBge8nQ6rho0G8KlYlfjVf2WzxzHKCi0pwRxnXGf7nOZRWlW
 2SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWev+jDg0dJZ3iRe8fmDv7sVMbP2pNiYIK+0iXz8Ozw=;
 b=yLI6UdhzaGwF/QdGRjyEukNNQrHXdfX0bWAgT/Q28PMoq42SZhToMEVTb0rVjH7GY4
 Xc0zCUx2Efa/oQgftH1pqeaq5aYiOdxWGzV0sBNZ2sJuRWyvqjTbwpS7yQpT2aP93AiZ
 2Fa8/GxTE94QDSUwITbAceXdGbU1SLAzoeSidO23sqJ0APM1Sbx18fnJpqGYxu8dgqSk
 kj3fd+5U+7lgHqye/LA79YWS1qzNR52e4Qy51RVDBAw6fJtIT4HU4fXA3HAhNOMr9GsH
 MZ3l/jH84qhIGCp/wkWPPy9puXSxpfuEI0T0IbMpxlDuoqGTPy4TvlyeQZRZnF5sC9DN
 5gjg==
X-Gm-Message-State: ANoB5pmoWbvT4AMjkEQX6+Km8XiA8KTjro1WIS02VyYFpxXuF5jg30LR
 9ZUbJVQ0qKxR/jPXoEkV3SwWAYpzE40SHIBB+x4=
X-Google-Smtp-Source: AA0mqf6iKPcyytwwVsEHd6kTCR7WtQHQnDpEAdLZZGz40NnxjMAO+4rIEjR8fUj3WHshRxS+nwOfEgXqCvw1ZdDfDiY=
X-Received: by 2002:a05:6870:e749:b0:144:5f0d:9fcb with SMTP id
 t9-20020a056870e74900b001445f0d9fcbmr8272974oak.38.1670350162551; Tue, 06 Dec
 2022 10:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20221130185748.357410-1-robdclark@gmail.com>
 <20221130185748.357410-2-robdclark@gmail.com>
 <3e9e157d-e740-ee5b-b8d3-07822b2c9a9b@collabora.com>
In-Reply-To: <3e9e157d-e740-ee5b-b8d3-07822b2c9a9b@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 6 Dec 2022 10:09:16 -0800
Message-ID: <CAF6AEGud11KEJvBY9J_TPahFOvo=C0VhG0An7nfNbsHXKbKC2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/shmem-helper: Remove errant put in error path
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 4, 2022 at 12:45 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 11/30/22 21:57, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > drm_gem_shmem_mmap() doesn't own this reference, resulting in the GEM
> > object getting prematurely freed leading to a later use-after-free.
> >
> > Link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
> > Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
> > Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 35138f8a375c..3b7b71391a4c 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -622,10 +622,8 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
> >       }
> >
> >       ret = drm_gem_shmem_get_pages(shmem);
> > -     if (ret) {
> > -             drm_gem_vm_close(vma);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> >       vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>
> AFAICS, the dmabuf mmaping code path needs a similar fix, isn't it?
>
> -               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> -               drm_gem_object_put(obj);
>                 vma->vm_private_data = NULL;
>
> -               return dma_buf_mmap(obj->dma_buf, vma, 0);
> +               ret = dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> +               if (!ret)
> +                       drm_gem_object_put(obj);
> +
> +               return ret;
>

Yes, it seems that way.. I wish the shmem helpers worked in a less
"special" way with regards to refcnting :-(

BR,
-R
