Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8400E1977E1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 11:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41903895E2;
	Mon, 30 Mar 2020 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA7895E2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 09:29:49 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id u20so10347016oic.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 02:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmauOj49DDXX626y1U2a9QlVW6ANI93/yL8Ngv7ohNs=;
 b=C/EMLoOC+ddc6KAWTj/b8oAEMhscShA0lSY0EKCDOXpB7E+FzCx6HjzZWxcoY0AvNv
 QQEL+VunNWX4RcaHHl9IyRbaLJKFxgdzPtZiRnMMIgmpefXAkae1faAP/nO2UVRvl5UQ
 dYqTQnA7nR3F+6tsDCxkVM/iLZfR7LC5ISxng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmauOj49DDXX626y1U2a9QlVW6ANI93/yL8Ngv7ohNs=;
 b=hEuQBsOE8NnbSO5RRXmqlJQrmN8h/UxAzWoMLtBdg5nVkr/VINmPjALZKV0hybutF8
 w1qCIcBU6x0WAAlATPJFNzDfxmuneO2ZgQMHAYS79nrzj0QjuIZJjscFnLnN5rVTDmqm
 xW+NMGtUtakkCKdiS37MIQAF/uuw86vnQgI3EQ7xuzd7rgjtRmVMUHmuMrKRiDaiTean
 0aknqsA8C9whP0BXKFuZ0act9TjXP+25Vj8lw0NaZQWgaynRkILvtQRWhhn/r2LhokbL
 SkX+5SmJSxOxWlN0Tit4dgTQaZycq9x1yK6wfuPMSvf+Qpp5X1ZI9SFVkHEQTUgAukGP
 g17A==
X-Gm-Message-State: ANhLgQ0QF/TzXCo+Jtp3GQhulV3QPao0SkVUlSN5+CcYKcmJrG9qCJvo
 KwXpz+CJm6EnirQfREJFj2MRaBoIA8yE8rjoTjfrsBJw
X-Google-Smtp-Source: ADFU+vssjzCBneGMXDRtmKQyjD+cAne4esNJJ4qCwnvdpwSk8OhF2yHZqaeuahvO6jymNqRMKU95syBf6bSjwga6wdE=
X-Received: by 2002:a54:4189:: with SMTP id 9mr7084574oiy.128.1585560588256;
 Mon, 30 Mar 2020 02:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 30 Mar 2020 11:29:37 +0200
Message-ID: <CAKMK7uE6zwAJ-vff8G=d744-y0ZPTP8h5ONJsmkgU7s-p=ir4w@mail.gmail.com>
Subject: Re: [PATCH] drm/managed: Fix off-by-one in warning
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ok 0day people uploaded the tree they tested (from patches) now, I
confirmed it's indeed this line that's blowing up.
-Daniel

On Sat, Mar 28, 2020 at 5:24 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I'm thinking this is the warning that fired in the 0day report, but I
> can't double-check yet since 0day didn't upload its source tree
> anywhere I can check. And all the drivers I can easily test don't use
> drm_dev_alloc anymore ...
>
> Also if I'm correct supreme amounts of bad luck because usually kslap
> (for bigger structures) gives us something quite a bit bigger than
> what we asked for.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4955241ceb4c..9cebfe370a65 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -139,8 +139,7 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
>  {
>         WARN_ON(dev->managed.final_kfree);
>         WARN_ON(dev < (struct drm_device *) container);
> -       WARN_ON(dev + 1 >=
> -               (struct drm_device *) (container + ksize(container)));
> +       WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
>         dev->managed.final_kfree = container;
>  }
>  EXPORT_SYMBOL(drmm_add_final_kfree);
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
