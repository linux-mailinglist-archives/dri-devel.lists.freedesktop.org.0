Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263CA1E98B4
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 18:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D64089F99;
	Sun, 31 May 2020 16:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C289F99;
 Sun, 31 May 2020 16:01:49 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id y13so6898266eju.2;
 Sun, 31 May 2020 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C6Pcc0KCAqq6UnYDDdgdeBt1kbXH4HvttEs94ToLTKU=;
 b=uH91HHXPEQsuatgZeJhtxIV9ISRL6OUnl1+5+9aeUjbBFVxjp1Qy85TtGShtR0rZ69
 rQpFZ5wBUCv25a3eoy76VkpKA7c7VFBBO2hNLZST/wBBhxVDkIpo61XYHtC7PAByihCE
 fhsuM/n2S1qMDnVXwl07QOuqdAW0MAgdkHto4zbnakiO+k4UvF1+FcbXz2Ul7yTEuuuw
 KjhtsbdNml4E2A9YllFiqJRkHOiKWduSCidFivH1vrjza8tm9rHD0RKL9FeINh5nF/lQ
 zLRSpe8S355qiC+7ObRyeBdeJprehnd2nTLjydUKb5QPt4VylKmJD5K7x/hkkTz/jcll
 q1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C6Pcc0KCAqq6UnYDDdgdeBt1kbXH4HvttEs94ToLTKU=;
 b=GxoU4VweG5UUlxKntHEkodvnMhRXABXzD0YckGMokoQns9RqMwIs1WH9g/AYHWmneT
 g7tZpD9CP5fPgkD6v/VAUOpNDtjHCoX/2LJ5a4hAkDUFctoLMQULBt8aElxadPNsfq/P
 hMcskBkiS4KHOgGTC52+3nlIaRmtavBd1pQzhI/wcZ7QMBUp3+sMQQFaVGjdIjGgdIIf
 AZ7v3TIymJxdAZjqN4BQrXTDiLDsDmJwUWv751rWs0IDUi55jFY3M17LIl/QQD4E09TT
 FYbjm23sjaPOEG0YWezhI+y//x7YXpjsyL5Bkw5JysQoMowHd2FYWWCC5uAqDU3i4vnS
 fi9A==
X-Gm-Message-State: AOAM530k5Qrvpa49Pe8IpqQkq17K4nrBk+JNNKbUJ73UrSULU194f+W3
 ljD/OjKOfHiMoYxXbBXCZNiRhjNArZXF9rDj7A4=
X-Google-Smtp-Source: ABdhPJygcqGQpE4P+85CCBiCBLzq7mgmdy1ks9XHcNICHXdFdGYVlHXB/cFQV9l/NQncP++0NxMItcE6Qgp8da76C4Q=
X-Received: by 2002:a17:906:44f:: with SMTP id
 e15mr15309655eja.161.1590940907872; 
 Sun, 31 May 2020 09:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <20200514201117.465146-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 31 May 2020 09:02:11 -0700
Message-ID: <CAF6AEGskgFyDxX+MWF84Z53ATmVd3972py88Og=aLQFV0d7UPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 1:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
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
> - but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
>   vmap() around any object with ->pages set (so including imported
>   dma-buf).
>
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.
>
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vunmap is the wrong thing to do.
>
> v2: Rob said in review that we do indeed have a gap in get_vaddr() that
> needs to be plugged. But the users I've found aren't legit users on
> imported dma-buf, so we can just reject that.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..e70abd1cde43 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>         int ret = 0;
>
> +       if (obj->import_attach)
> +               return ERR_PTR(-ENODEV);
> +
>         mutex_lock(&msm_obj->lock);
>
>         if (WARN_ON(msm_obj->madv > madv)) {
> @@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
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
