Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8DB2C0285
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 10:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5F6899BE;
	Mon, 23 Nov 2020 09:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53A899E6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 09:51:37 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id a130so10930367oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 01:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=728drbmfpSOfgNwr2SHggiRFvZplFRXowT2/IwDi3MA=;
 b=aZmfbQS5bOq7GKshLqmpzvbj9JqRIZg+SQ6+JXjk006NODOiJvOc9K0ThqI9EeJ0Ss
 kpJ3Oixwd4FyEweXjrMI69FfahUjsSmqhl/Zka8+LwLsuPsscTUQelh8K9iGVNQHqIdA
 7JL/fyCgL4PV8RyQ5VxsFOKao6chb6kp6twMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=728drbmfpSOfgNwr2SHggiRFvZplFRXowT2/IwDi3MA=;
 b=kdD44NNUa0STah/sAYOHN/XMKd8VsqPI7jjUZYMxfJl4tyKEu+Ejh98FzOLqKR3Ftw
 ANfJBD9yjs1EbSCe/iWeNrj62Btw6r9uosrvH7AA+QS7jRpixQPTnzfVIqSPeqTLsuZ3
 ABCsBQgaU/SvRTj+YfE+H2VWspYhKNruqBCbpXXJo/pvSG2cVzqrqGAcQ3mV2v2yL0FY
 kJ3Tk8doGOX7FTz8nflq2iMnwbGWh7zWMJhhPGcbp2dEOHmWfaezKW6V58jCiqtRMi/q
 7w/0AOxCe5Fi6EbOW0rjKxAxg+3xxxW9EA+ZLGLCBtP0SfWrK70X7A8Q+NbbED+mNDo7
 sawg==
X-Gm-Message-State: AOAM5328WBsw7r1UzBQeEV005kI5WW9lx5RS9sk2SEiN4Y9A3sh3Q94w
 b2h1nRZnhQsRv5Q8IYD1LgDL3hbh5fFO3IfkSyFA/g==
X-Google-Smtp-Source: ABdhPJz66bLEmQYNG5dQJaXv0p24rXXX0adIcxsC4vA3n6gZsVDrskubfwiQzARt62M0gUBQfr2zgbuk5o/zH1ExS14=
X-Received: by 2002:aca:1713:: with SMTP id j19mr13385242oii.101.1606125097243; 
 Mon, 23 Nov 2020 01:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20201120152338.1203257-1-ccr@tnsp.org>
In-Reply-To: <20201120152338.1203257-1-ccr@tnsp.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 23 Nov 2020 10:51:25 +0100
Message-ID: <CAKMK7uGDY+aLP-yYwyW5t-usUK3XM-oU9ZLHm1_jU0BTjJUN+g@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix relocations applying logic and a
 double-free
To: Matti Hamalainen <ccr@tnsp.org>
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 4:23 PM Matti Hamalainen <ccr@tnsp.org> wrote:
>
> Commit 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl") included
> a logic-bug which results in the relocations not actually getting
> applied at all as the call to nouveau_gem_pushbuf_reloc_apply() is
> never reached. This causes a regression with graphical corruption,
> triggered when relocations need to be done (for example after a
> suspend/resume cycle.)
>
> Fix by setting *apply_relocs value only if there were more than 0
> relocations.
>
> Additionally, the never reached code had a leftover u_free() call,
> which, after fixing the logic, now got called and resulted in a
> double-free. Fix by removing one u_free(), moving the other
> and adding check for errors.
>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matti Hamalainen <ccr@tnsp.org>
> Fixes: 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/11

Link: is for the mailing list submission of the patch itself (to link
the git log to the mailing list discussions), this should be
References: or similar. Aside from this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ben, I'm assuming you'll push this through your tree.
-Daniel


> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 549bc67feabb..c2051380d18c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -558,8 +558,10 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
>                         NV_PRINTK(err, cli, "validating bo list\n");
>                 validate_fini(op, chan, NULL, NULL);
>                 return ret;
> +       } else if (ret > 0) {
> +               *apply_relocs = true;
>         }
> -       *apply_relocs = ret;
> +
>         return 0;
>  }
>
> @@ -662,7 +664,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>                 nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
>         }
>
> -       u_free(reloc);
>         return ret;
>  }
>
> @@ -872,9 +873,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>                                 break;
>                         }
>                 }
> -               u_free(reloc);
>         }
>  out_prevalid:
> +       if (!IS_ERR(reloc))
> +               u_free(reloc);
>         u_free(bo);
>         u_free(push);
>
>
> base-commit: 3494d58865ad4a47611dbb427b214cc5227fa5eb
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
