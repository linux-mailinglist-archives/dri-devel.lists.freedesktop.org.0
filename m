Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D76D0030
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C5210ED7B;
	Thu, 30 Mar 2023 09:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EDB10E029
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:51:23 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id p203so22681334ybb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680169882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UIbgOG+h3FIDF+Si9VD6Zwd1DkLvZs1s8HyCvFhZ9EY=;
 b=sIvdOknzxUYNAk4I6ea88QdgCUOqrLOBhfsopoNo72TjQSvr62pPA+qFgOBmBObhNQ
 1PiYmezYMMSy99UdDOt97wrNif94MO7BrEasdZG2OHRAFpAP12BH5FHEWNMRaohrN8pc
 3HpOqKEZsvG5TQA3EPMzKRABDsaCCdTO9c6HW17ugwV+mtVUImMPwRaTOsqHyATjya0O
 kXdSx5dPodiZUqDOJuJ9RCTjVxCvdI2Oc8o18aBY2k7CFfdPPBW+uQqMkQ2pz5M0FU/k
 bBX08oiVk2fSckkrwPhgQ7xLxSA1/5FxbxWlCwMWM9F3IA6pACWWb8eMBRUMXt/XAEOz
 WXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680169882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIbgOG+h3FIDF+Si9VD6Zwd1DkLvZs1s8HyCvFhZ9EY=;
 b=sbhVrKZm3REa+IvAa8+GASv0xpHlNOCynqEZhv4Yt7wBa2Jl6RrVA4EJAL4HNGraue
 hrnA+HpLsJ5kG4GYV5QLBTnuqwAQq9iHqxl+q2E5TC5Ql2MeiWq5dD8IVgbe6vc1HjUD
 8VGrjPNV+H9UFOku/ET7iHKUaI/2Nmf8PLiD2Hl0T15aJ9WJNuDkIuoSEwjRaeEsTmef
 XVZU5GdpskPkQzenC8dSnmkWHX4XPCR4z9qGBgqYfqeF+QNYj4rmVUNTq8HhPP8LfyAn
 GuD4xfHILbEPD+FX6Qe4UQOwMpKpv9Yi2o3wyIZWEc5Mg4nXyFEjZG5wGYGgnltid+Nh
 0TEg==
X-Gm-Message-State: AAQBX9eTWOk8R4oOOudYQtndgkLtsvf5Url3IXWwajmC6fgcU/mQcMew
 Q3qarknkUzwmsDxV03YtwgKAPh/Vg3bBhCLEYsJskA==
X-Google-Smtp-Source: AKy350aaiOzzm2r5w48FBnQYN8mcYV/XBLAtomsqXCbKsIiygpKHaym8tbpgh+vg7oUtg7IBqovmwJMlURVoqAEzW0A=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr14647883ybt.9.1680169882207; Thu, 30
 Mar 2023 02:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-2-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-2-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:51:11 +0300
Message-ID: <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm: Clear aperture ownership outside of fbdev
 code
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>  drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index aca48c868c14..5211140ec50b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -12,6 +12,7 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/sched/types.h>
>
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -411,6 +412,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         if (drm_firmware_drivers_only())
>                 return -ENODEV;
>
> +       /* the fw fb could be anywhere in memory */
> +       ret = drm_aperture_remove_framebuffers(false, drv);
> +       if (ret)
> +               return ret;
> +

I think it is not a good place to remove framebuffers. EFIFB might be
still alive and if we kick it out, it might be very hard to debug what
went wrong.
Could you please move it after component bind? Then we can be sure at
least that all subdevices are bound. I see that armada and sun4i call
it as late as possible, when no calls can fail.

>         ddev = drm_dev_alloc(drv, dev);
>         if (IS_ERR(ddev)) {
>                 DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index d26aa52217ce..fc7d0406a9f9 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -4,7 +4,6 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> -#include <drm/drm_aperture.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -154,11 +153,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>                 goto fail;
>         }
>
> -       /* the fw fb could be anywhere in memory */
> -       ret = drm_aperture_remove_framebuffers(false, dev->driver);
> -       if (ret)
> -               goto fini;
> -
>         ret = drm_fb_helper_initial_config(helper);
>         if (ret)
>                 goto fini;
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
