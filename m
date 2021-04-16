Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38623627C0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 20:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2606ECB8;
	Fri, 16 Apr 2021 18:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF426ECB8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 18:30:17 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id a21so15705798oib.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2URQPxDc6xW1AaRajqTpp369cvO98uJ1uS2r5+fbu3k=;
 b=bvGRbApMkBauGUNafe/fhcXAyutILbCc9hjQGaXx7Y/ch2K9GsqGKMPlGE8C+YQN/G
 WO9/tFzpbpG7buc8WnD3yg4kA2pbNAfOl5i9iiCic9ohQgHlA2cczv2atpvGoEoGyfGz
 nCmk+k2ijBj3kd6i5KA+nB4lBrk4UcrY3460U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2URQPxDc6xW1AaRajqTpp369cvO98uJ1uS2r5+fbu3k=;
 b=SQGfvN7c22rxASU6bcK5+8IQmKk9M0phLkjqzF1ItVkX5EGI18mEzNVSO/ylbjm7CT
 1J3+RZS4Pamuz53E/dUVM/34rW1uenv/q2vUlwn8SxtyVvFCV8k/URI19q9VcEs9CpQx
 vGG20/OCdCoIUTHL7frwEt70a27BPFCBGjpY50t9RLNVL5GPzNCZ5VlPInOMh6v6x8Iv
 eswy2lHeaEOx/p4wy8jw4P7MXfMQb8AwRKxocR+zySGqvcCI+1GseCQscS7XR1cScnN1
 Sm/5obUR3+6Nlc46gOWxDYRX2AyQwveh4DPDcR0fXef8oVZXSB0x6dch9AHx8/gsmAAb
 kz6A==
X-Gm-Message-State: AOAM531F6oiVF1+y/a8ioEiNP5MrjpeYob+LUVaaXsEY1/Orn/eBY1vY
 9sPxOWbxNOiLPbCRrWqC5ZWZ68G+vQYCr7PZ/EzoJA==
X-Google-Smtp-Source: ABdhPJxb+g8k8UtLxPTQIoGSCy7z9ew4ioxyVJ0PqTXAZcDjJdOEUwcZL52fZgJet2zQ8R1syVlj3BNmMPeyowrEYIM=
X-Received: by 2002:a05:6808:699:: with SMTP id
 k25mr2828361oig.101.1618597816597; 
 Fri, 16 Apr 2021 11:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210416125344.13550-1-tiwai@suse.de>
In-Reply-To: <20210416125344.13550-1-tiwai@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Apr 2021 20:30:05 +0200
Message-ID: <CAKMK7uH4Cc-nEAa3CcYTAtq8nh0HHTQNvGNZSZyzB7U-EWae2Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix fbcon blank on QEMU graphics drivers
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 2:53 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> Currently the DRM fbcon helper for console blank,
> drm_fb_helper_blank(), simply calls drm_fb_helper_dpms() and always
> returns zero, supposing the driver dealing with DPMS or atomic
> crtc->active flip to handle blanking the screen.  It works on most of
> devices, but broken on most of KVM/QEMU graphics: bochs, qxl and
> cirrus drivers just ignore crtc->active state change as blanking (or
> cirrus ignoring DPMS).  In practice, when you run like
>   % setterm --blank force
> on a VT console, the screen freezes without actually blanking.
>
> A simple fix for this problem would be not to rely on DPMS but let
> fbcon performs the generic blank code.  This can be achieved just by
> returning an error from drm_fb_helper_blank().
>
> In this patch, we add a flag, no_dpms_blank, to drm_fb_helper for
> indicating that the driver doesn't handle blank via DPMS or
> crtc->active flip.  When this flag is set, drm_fb_helper_blank()
> simply returns an error, so that fbcon falls back to its generic blank
> handler.  The flag is set to both bochs and qxl drivers in this patch,
> while cirrus is left untouched as it's declared as to-be-deprecated.
>
> Link: https://lore.kernel.org/dri-devel/20170726205636.19144-1-tiwai@suse.de/
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1095700
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Uh we're supposed to fix these drivers to actually blank (scan out
black, worst case), not paper over it in higher levels. Atomic kms is
meant to be a somewhat useful abstraction. So now fbcon blanks, but
your desktop still just freezes.

> ---
>
> Here I whip a dead horse again, revisiting the long-standing issue
> stated in the previous patch set in 2017:
>   https://lore.kernel.org/dri-devel/20170726205636.19144-1-tiwai@suse.de/
>
> I thought to refresh the previous patch set at first, but it seems
> invalid for the atomic modeset case.  And for the atomic, it's even
> more difficult to propagate the return from the bottom to up.
> So I ended up with this approach as it's much simpler.

Yeah that's because atomic assume you can at least blank your screen to black.
-Daniel

> But if there is any better way (even simpler or more robust), I'd
> happily rewrite, too.
>
> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 3 +++
>  drivers/gpu/drm/drm_fb_helper.c   | 5 +++++
>  drivers/gpu/drm/qxl/qxl_drv.c     | 3 +++
>  include/drm/drm_fb_helper.h       | 8 ++++++++
>  4 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index b469624fe40d..816899a266ff 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -132,6 +132,9 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>                 goto err_unload;
>
>         drm_fbdev_generic_setup(dev, 32);
> +       if (dev->fb_helper)
> +               dev->fb_helper->no_dpms_blank = true;
> +
>         return ret;
>
>  err_unload:
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index f6baa2046124..b892f02ff2f1 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -332,9 +332,14 @@ static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
>   */
>  int drm_fb_helper_blank(int blank, struct fb_info *info)
>  {
> +       struct drm_fb_helper *fb_helper = info->par;
> +
>         if (oops_in_progress)
>                 return -EBUSY;
>
> +       if (fb_helper->no_dpms_blank)
> +               return -EINVAL;
> +
>         switch (blank) {
>         /* Display: On; HSync: On, VSync: On */
>         case FB_BLANK_UNBLANK:
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 1864467f1063..58ecfaeed7c1 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -120,6 +120,9 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                 goto modeset_cleanup;
>
>         drm_fbdev_generic_setup(&qdev->ddev, 32);
> +       if (qdev->fb_helper)
> +               qdev->fb_helper->no_dpms_blank = true;
> +
>         return 0;
>
>  modeset_cleanup:
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 3b273f9ca39a..151be4219c32 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -176,6 +176,14 @@ struct drm_fb_helper {
>          */
>         bool deferred_setup;
>
> +       /**
> +        * @no_dpms_blank:
> +        *
> +        * A flag indicating that the driver doesn't support blanking.
> +        * Then fbcon core code falls back to its generic handler.
> +        */
> +       bool no_dpms_blank;
> +
>         /**
>          * @preferred_bpp:
>          *
> --
> 2.26.2
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
