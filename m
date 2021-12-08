Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4346D2B8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 12:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981D56F50B;
	Wed,  8 Dec 2021 11:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251B6F50B;
 Wed,  8 Dec 2021 11:50:01 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 8so1939420qtx.5;
 Wed, 08 Dec 2021 03:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2si1KDpnDvXk+ubJlzHUYkLWexjktnm9IfArHYCIY20=;
 b=FMpLzdZDAwaije8OvqV60lgcdd9zJ7F7vAU6pGP0NNnMxXF7AHfCnxf0nK7ru47E7k
 Pi6aVW7MgLZCfDdopmy4dSUu9CXk3rGf6pvlBhri2vNoeLMg0xl/KrvFkte+oH1Y1GVW
 M0BkcwYA/DdCqKIp4yYxy75vbtEB4tYB86QaLfJpW8A9JAZBUkGY/jbbPOuIq8L16gUh
 vJX1FHoMxCh1WEwMhISfDmme/kmEXX0zBqC38hd9tWkI1rqD+4Hwangl3cW4ItgH0kJe
 SSFbW0xQOXfxYxGCUeDmOgNCQGSSIPQWScib2yyh3aNm9ZR6bZAYU8oThtBVYWth6f2A
 j/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2si1KDpnDvXk+ubJlzHUYkLWexjktnm9IfArHYCIY20=;
 b=o6nhp8P+l3G7ax4FSe1iNOJxmfThzWXwwzillchYqaxuHhJLMeSMcOgpip5+CdLR51
 5g7hgu0yPmzsOol+ng2DOZqu9oiqAoyYOmNl90CvCYJmXGbr6hncgJ27X9T1dvXW/XRc
 nVwD5HIX3Dee4M68JNkBBBObiQF5FMTXipHQbNFMeoghofFJJ9PbAzPYENoiON8nyCSh
 PV9CQ8iFrFzd67+9pbAG1mZ2ttAL2ue4s+4moqtbO4t2ZALV65UDQfF7vQbp8sr9FJfU
 70Ky8scBp5VNL1BCPrDlRA20Lj0yabgJ0kDjGa2QDPctHRBob9jog9gppVnT+S7mulGc
 XQBQ==
X-Gm-Message-State: AOAM530AVAXyMdiUoXdBPZO10SA9xCkXcz5aiD5iydXNfADLbaQ3FS0V
 uuwEaLSvw9Av/KPlgbUxgJyyNAPP39kOfmHu8LJlUiGcuik=
X-Google-Smtp-Source: ABdhPJwjYipiY+PO3ReQNDi4HUarMm844S+TyjHSz52TVGZF3w2PFbus2+DICnaU7iJNUgphTxAMtO6DUX5GU3+KMks=
X-Received: by 2002:ac8:7d07:: with SMTP id g7mr6993990qtb.364.1638964200328; 
 Wed, 08 Dec 2021 03:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-10-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-10-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Dec 2021 11:49:33 +0000
Message-ID: <CAM0jSHNwB1Vtcv7owM8rEEXiTJEpuhYAf8j6i9f5xx8LH9kcig@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/16] drm/i915: Ensure i915_vma tests do
 not get -ENOSPC with the locking changes.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Now that we require locking to evict, multiple vmas from the same object
> might not be evicted. This is expected and required, because execbuf will
> move to short-term pinning by using the lock only. This will cause these
> tests to fail, because they create a ton of vma's for the same object.
>
> Unbind manually to prevent spurious -ENOSPC in those mock tests.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Hmm, do we need this? It looks like we should be able to handle such
scenarios, with already locked objects sharing the same dma-resv? Or
is something else going on here?

> ---
>  drivers/gpu/drm/i915/selftests/i915_vma.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index 1f10fe36619b..5c5809dfe9b2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -691,7 +691,11 @@ static int igt_vma_rotate_remap(void *arg)
>                                         }
>
>                                         i915_vma_unpin(vma);
> -
> +                                       err = i915_vma_unbind(vma);
> +                                       if (err) {
> +                                               pr_err("Unbinding returned %i\n", err);
> +                                               goto out_object;
> +                                       }
>                                         cond_resched();
>                                 }
>                         }
> @@ -848,6 +852,11 @@ static int igt_vma_partial(void *arg)
>
>                                 i915_vma_unpin(vma);
>                                 nvma++;
> +                               err = i915_vma_unbind(vma);
> +                               if (err) {
> +                                       pr_err("Unbinding returned %i\n", err);
> +                                       goto out_object;
> +                               }
>
>                                 cond_resched();
>                         }
> @@ -882,6 +891,12 @@ static int igt_vma_partial(void *arg)
>
>                 i915_vma_unpin(vma);
>
> +               err = i915_vma_unbind(vma);
> +               if (err) {
> +                       pr_err("Unbinding returned %i\n", err);
> +                       goto out_object;
> +               }
> +
>                 count = 0;
>                 list_for_each_entry(vma, &obj->vma.list, obj_link)
>                         count++;
> --
> 2.34.0
>
