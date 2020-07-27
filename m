Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E822F91E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B3089E65;
	Mon, 27 Jul 2020 19:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47889E65
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 19:32:57 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id z23so3362327ood.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 12:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ETs2U16dncoJaBw8eN+4tA+CAu6TySMWsZrptH76Wk=;
 b=HXJ1Fvv8NEqid/NwrEv5F5ax5w5wgu6e51tF7nZSkJnm2Sz7teOJzWGv1sK9bsOvBW
 qjrbnP4XLpkYHA0I8xx4T7Rnw8PlWFdZtWj+s0CcVJaItVLpnN9H+QORM89er09Wxv8F
 4GbJw+AYRsQtefrUl/nQifaNeqkGKmVzT5FTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ETs2U16dncoJaBw8eN+4tA+CAu6TySMWsZrptH76Wk=;
 b=tojAvsDzHAHBOqszGQQWuq+oVa81O8G10RwVFtWlpGwsH+0RMeO1MelzPEi3OWJEHJ
 R3uOSD6y076HTJbAAqwh2kkaEv+h0WhGK4w87qJsPd34JbJH8xqgLcFPmG8moJuYxuGw
 n12li8GirfvAftQllIDFEABnCyoXbMiNRBrAu88ay+h60Luk0WT+Zo870bq4tLi3Tqig
 AW7erFHHGUMYORLnc3/77MRxXdXKiO58fj9jpoEdlAUjenHxjYE/jCUVDCmC3X/lfO4b
 WtTbqZE3Q8IsZYmQuiwP+gPz21DuNL1IXo8i7BsrNItxYbBO2XPudKG1gvijn7c3Rdpx
 MTbQ==
X-Gm-Message-State: AOAM532S/ySo7rfnfCj5rSeKhQLsfKfY+mIru7l1eL9p3ljALUrWw6h1
 aYFJCeGFqGNCQ3ciEsyL/9ZVX4rSvF/ibZXVgGlTVQ==
X-Google-Smtp-Source: ABdhPJzIAgj5nNNhI/dMaqBJVapbHeMP3vhaPhVGgW8+zYd2O7m0Yzdx5AXpKBrMDoULF93Z/kpPOHO8Rh//wmbgim4=
X-Received: by 2002:a4a:4949:: with SMTP id z70mr19062313ooa.85.1595878376847; 
 Mon, 27 Jul 2020 12:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200723172119.17649-1-chris@chris-wilson.co.uk>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 Jul 2020 21:32:45 +0200
Message-ID: <CAKMK7uFt5ViekqBPqdBbJWN4FhfxvF57K58VW8hAZGZwjRDz0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: Restore driver.preclose() for all to use
To: Chris Wilson <chris@chris-wilson.co.uk>, Dave Airlie <airlied@redhat.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>, CQ Tang <cq.tang@intel.com>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 7:21 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> An unfortunate sequence of events, but it turns out there is a valid
> usecase for being able to free/decouple the driver objects before they
> are freed by the DRM core. In particular, if we have a pointer into a
> drm core object from inside a driver object, that pointer needs to be
> nerfed *before* it is freed so that concurrent access (e.g. debugfs)
> does not following the dangling pointer.
>
> The legacy marker was adding in the code movement from drp_fops.c to
> drm_file.c

I might fumble a lot, but not this one:

commit 45c3d213a400c952ab7119f394c5293bb6877e6b
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon May 8 10:26:33 2017 +0200

    drm: Nerf the preclose callback for modern drivers

Also looking at the debugfs hook that has some rather adventurous
stuff going on I think, feels a bit like a kitchensink with batteries
included. If that's really all needed I'd say iterate the contexts by
first going over files, then the ctx (which arent shared anyway) and
the problem should also be gone.
-Daniel

> References: 9acdac68bcdc ("drm: rename drm_fops.c to drm_file.c")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
> Cc: CQ Tang <cq.tang@intel.com>
> Cc: <stable@vger.kernel.org> # v4.12+
> ---
>  drivers/gpu/drm/drm_file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 0ac4566ae3f4..7b4258d6f7cc 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -258,8 +258,7 @@ void drm_file_free(struct drm_file *file)
>                   (long)old_encode_dev(file->minor->kdev->devt),
>                   atomic_read(&dev->open_count));
>
> -       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
> -           dev->driver->preclose)
> +       if (dev->driver->preclose)
>                 dev->driver->preclose(dev, file);
>
>         if (drm_core_check_feature(dev, DRIVER_LEGACY))
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
