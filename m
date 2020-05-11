Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB691CDECD
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A926E2B6;
	Mon, 11 May 2020 15:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41666E2B6;
 Mon, 11 May 2020 15:24:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b91so4085362edf.3;
 Mon, 11 May 2020 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9317Vp/mszqVVBYRgEelwHdsJRXESTytWCCgkQudO74=;
 b=Q4G0tAo9CeWVb+SHnkl46B1fwIT5ihxOZ6OBdQCeZEPNGXcoo3CSrPNQsEksAzREUE
 uImG4BUtxLhbMWdgdLGMGk1UiZfFNqgdSNjB+supI5LJJh79Rlqifn2xB2dbTFOXgYCM
 GvrlnqkVrt6GaNL3fld51mgBS04p0CBTYOps1tN/TLvk7TCdskbk/WcTy3hatGLidXIS
 9ElEOMBFTWSk574tdNLSyj6qkgAk5/r80ivj8HxlYswKT7kTxUm/WUQLUOXuJ72aUOC6
 6MkKbRrc7Bkc6xLKQOAfftxQFacR+buQsC7cu0um5nqIdrdWMqWkHvbW8XB81zA8y8qY
 ZdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9317Vp/mszqVVBYRgEelwHdsJRXESTytWCCgkQudO74=;
 b=Ytda18dalX1I+FCGKUc9eG9itLsNexbeb9tdybB7vyyYx7qMy/rMTbjrfybxvfIQoz
 sXoAx0I00XmeRk5y/pLloFGh9PJ/kd5kIYK6M5hG9g0RwSXqNnaA0ipgGryU4wm0fhvV
 DO3Qn1oOWUqDhBgSQeOmrVBZo2fnWcutOTRUte+WqQIoyfP9o4BiympYfpJnbp//TYDR
 J8whvO7amG7CFI5hzjSfrTht8UkULiryaHcXghsQzepPq9ifLbsSnDIKABSbNSib2VOe
 tjyWGnIQ1FxqBf0DJb20mZMuXrxNT15BE8845qM1HjDlt1MSqutBMSog9R5CjIUmTK3U
 k4LA==
X-Gm-Message-State: AGi0PuZOi07B7jH3z99Qz4aet+CAV3AUm9vJmbQRb2dBzbRpOZBXxOtX
 dmgUODZkWF2yQjbdXpUrtqEbDyFYNmZX7H/On7A+noz0n6w=
X-Google-Smtp-Source: APiQypJUQvBwsX+YG54scmGefg56nBH96yZ4D/VzDhxG8kq6a9xVR40OsUOkXH/KvA+YLpjekFJ/pvniszknIGWSkjI=
X-Received: by 2002:a50:9eac:: with SMTP id a41mr13810164edf.120.1589210670396; 
 Mon, 11 May 2020 08:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 May 2020 08:24:17 -0700
Message-ID: <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I honestly don't exactly understand what's going on here, but the
> current code is wrong for sure: It calls dma_buf_vunmap without ever
> calling dma_buf_vmap.
>
> What I'm not sure about is whether the WARN_ON is correct:
> - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
>   a pretty neat layering violation of how you shouldn't peek behind
>   the curtain of the dma-buf exporter, but par for course. Note that
>   all the nice new helpers don't (and we should probably have a bit a
>   warning about this in the kerneldoc).
>
> - but then in the get_vaddr() in msm_gem.c, and that seems to happily
>   wrap a vmap() around any object with ->pages set (so including
>   imported dma-buf)
>
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.

fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
by default, and restricted to sudo).. it really only exists to
simplify poking at fw.

There could be vmap's in the msm_gem_submit path, however.  If we
don't, we should probably just disallow using an imported dma-buf as
cmdstream.. I don't think there is any sane reason to permit that.  We
should probably also disallow get_vaddr() on imported buffers.

BR,
-R

>
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vmap is the wrong thing to do.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..3305a457960e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>         put_iova(obj);
>
>         if (obj->import_attach) {
> -               if (msm_obj->vaddr)
> -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> +               WARN_ON(msm_obj->vaddr);
>
>                 /* Don't drop the pages for imported dmabuf, as they are not
>                  * ours, just free the array we allocated:
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
