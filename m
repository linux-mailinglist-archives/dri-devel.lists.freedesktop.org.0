Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1B63C9D8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027F710E39A;
	Tue, 29 Nov 2022 20:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E954710E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 20:47:53 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso9964190otn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7xFa82HHkehFEIoR/Gvkhv4ncrmYE6/UZyj0GoMKVNs=;
 b=d1+z9RcqxsHEvdxF2ZYD59XFcpNXwDtddi5ygpvFvjFqveifOzw1yesVKXP90PIEXW
 vV0OUhM439fDEhWTu061JQMjD+ULlcdCd0eRZxdqaN46i55hu207zyuTCzPCf9W2KJ1I
 4igj5TwC95XFIgbcpZxSHJPoyiqpzZmIW2FwrrWLSJJjE7U2daJ1ELd2AWJGORYxKSIX
 q9vNN4x0G8G2xMHlI6yIBuu74gBTJJzwpQ6DqkMLmhFRI3tcJe0Vmi4QLAlDHqfPUABd
 GmKPgFQ/UIppjYYAhxnS76U8SksKPHRnqcfLMCorJzF1XHTyuLskCmUNztdNOWI0lK/k
 kX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xFa82HHkehFEIoR/Gvkhv4ncrmYE6/UZyj0GoMKVNs=;
 b=JJoH/DOtxc/PgVfl3FZFVh6jOaejyXFNFfREUnPiPGHZQK7BM9Lduhh3b9PHLsQPfs
 QmXGv3789fM3yGy86sV8dOgp/IdBZ/aA2mtGSmL5+YP+NaJabYSMNkRDr03PEk0CBhre
 Iee9QdjoBG3ONAg0KGTevdThlldKC/vpnCjzqLvgXqbFx37rJJEzcuF9WV47CeaIOsXT
 fj5nQpvOMn1zR4U05yG3Lwqk5SqFQLYQ8pxMa2mEovYZczhaZqPc9pADRJ3R8T9jwkfY
 aRH2qMy3zWJ1+HDydiVMjbqf6FeQ247g8SZOZvm4nWktjrq2B2J02TX5O8gpew6ArOaj
 QEkw==
X-Gm-Message-State: ANoB5plcCI8U91tK4YvDjhvoVjjpGNEqjuXcVuYpR5t7HNkDH2UKEAUI
 F8oUmyMthy9BpCEemh9dkLMPQT10fwFDLVrGKYY=
X-Google-Smtp-Source: AA0mqf7xZMHsvKm3f3uDkSaG1qhhOp+y9VRfZiKgNKTiUdmmZM1boduAXuI5yJAsEVJrBoh/UZc3lt0Bov57xOliipE=
X-Received: by 2002:a9d:75d5:0:b0:667:7361:7db5 with SMTP id
 c21-20020a9d75d5000000b0066773617db5mr22095916otl.22.1669754873144; Tue, 29
 Nov 2022 12:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20221129200242.298120-3-robdclark@gmail.com>
 <20221129203205.GA2132357@roeck-us.net>
In-Reply-To: <20221129203205.GA2132357@roeck-us.net>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Nov 2022 12:47:42 -0800
Message-ID: <CAF6AEGuK4jv25cQ4p-rrytx9Qn4JZdRRfkVJn9T3nf7vJmG5VQ@mail.gmail.com>
Subject: Re: [2/2] drm/shmem-helper: Avoid vm_open error paths
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 12:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Nov 29, 2022 at 12:02:42PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > vm_open() is not allowed to fail.  Fortunately we are guaranteed that
> > the pages are already pinned, and only need to increment the refcnt.  So
> > just increment it directly.
>
> I don't know anything about drm or gem, but I am wondering _how_
> this would be guaranteed. Would it be through the pin function ?
> Just wondering, because that function does not seem to be mandatory.

We've pinned the pages already in mmap.. vm->open() is perhaps not the
best name for the callback function, but it is called for copying an
existing vma into a new process (and for some other cases which do not
apply here because VM_DONTEXPAND).

(Other drivers pin pages in the fault handler, where there is actually
potential to return an error, but that change was a bit more like
re-writing shmem helper ;-))

BR,
-R

> >
> > Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 110a9eac2af8..9885ba64127f 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -571,12 +571,20 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> >  {
> >       struct drm_gem_object *obj = vma->vm_private_data;
> >       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > -     int ret;
> >
> >       WARN_ON(shmem->base.import_attach);
> >
> > -     ret = drm_gem_shmem_get_pages(shmem);
> > -     WARN_ON_ONCE(ret != 0);
> > +     mutex_lock(&shmem->pages_lock);
> > +
> > +     /*
> > +      * We should have already pinned the pages, vm_open() just grabs
>
> should or guaranteed ? This sounds a bit weaker than the commit
> description.
>
> > +      * an additional reference for the new mm the vma is getting
> > +      * copied into.
> > +      */
> > +     WARN_ON_ONCE(!shmem->pages_use_count);
> > +
> > +     shmem->pages_use_count++;
> > +     mutex_unlock(&shmem->pages_lock);
>
> The previous code, in that situation, would not increment pages_use_count,
> and it would not set not set shmem->pages. Hopefully, it would not try to
> do anything with the pages it was unable to get. The new code assumes that
> shmem->pages is valid even if pages_use_count is 0, while at the same time
> taking into account that this can possibly happen (or the WARN_ON_ONCE
> would not be needed).
>
> Again, I don't know anything about gem and drm, but it seems to me that
> there might now be a severe problem later on if the WARN_ON_ONCE()
> ever triggers.
>
> Thanks,
> Guenter
>
> >
> >       drm_gem_vm_open(vma);
> >  }
