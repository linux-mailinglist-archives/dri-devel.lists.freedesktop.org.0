Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425534874F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 04:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5F6EB29;
	Thu, 25 Mar 2021 03:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B44E6EB27;
 Thu, 25 Mar 2021 03:06:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id d191so354150wmd.2;
 Wed, 24 Mar 2021 20:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oySbYmye6jIKUciaeAkZ4sySteO4iHql6A2SWp7T94w=;
 b=UAkONL7luoby47dM236v3hYfKvsv+lqcrSXu2ByNSljJUiQWf20mb1nS+F09f3R9yo
 7e9CvJthyMGIyIcp4xi4jGBTeuDvCMQ6dy64FNKcOG3PQx8CIDdusP8mhn90xQhP6uZw
 w+IR8qx2/TOgtqgYRhSNM7Cx0G7pF6W+yLhv1KCCcxo4V1XD0+mANe7rxHTbo/zezcCP
 TGABEB4qdm8+HWWXXMT/XwGiBJ4V3ZctubOBnuudowgsfT/YVcu4b8rsfuB6tpZNZORe
 yAw6CFmq4UIfouXmidCVleScmWX2AdOxCFNcqjkSwYx+ITDYrwxTYZneAuPZDLvIdb84
 UjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oySbYmye6jIKUciaeAkZ4sySteO4iHql6A2SWp7T94w=;
 b=uJelydwsZc83uawcY7VqwYvIQR+o+9fxM1I+1R43svG5Of9pmr14uLqA6g+9vm0EVG
 cGhuwzMEmqFi06l9fpa/I/+PyQBrU34hNpzH5YSjEvAexwaejxCJWYF4JLQ18E/gmlAn
 /5C7VHqQSCVQydz3rOUaJ3dd47uJnV1i+0UQKIoeqoeYyfekXCAIPa/KgNyZ/541+Kpp
 z4/FdbMFwNTI1b8LegxWV7ff+q5wsc2XUlddnG2mENd3Lqq+D+Zfe/1PG2iIM5vurDH6
 HT3nvPF6TXF19C07rljWm2ntnZ9yZxhTnDZdPS6rsdwFs8c4Ra7i1D95FP7gXJVNCDBq
 YkFA==
X-Gm-Message-State: AOAM532YZqN1jG2w2XxJT8NYJLMtlmITkcpL/tOjdCmoZ3lcCWdDNaST
 r3Dh2aRo1yGhKElkNPhfjbX4lfbpmApWGk0Y4Tk=
X-Google-Smtp-Source: ABdhPJy/I1DzdvdDKq4xvQMv/1VPFBRSQ2vaL7eK81MXRPVKFT+Y8irZm8XPU0+PpbT+jhp+nISu2lYmKbqJCGMJvuo=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr5732029wma.94.1616641583948; 
 Wed, 24 Mar 2021 20:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
 <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
In-Reply-To: <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 24 Mar 2021 20:09:37 -0700
Message-ID: <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 6:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> > if GPU components have failed to bind, shutdown callback would fail with
> > the following backtrace. Add safeguard check to stop that oops from
> > happening and allow the board to reboot.
> [...]
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 94525ac76d4e..fd2ac54caf9f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
> >  static void msm_pdev_shutdown(struct platform_device *pdev)
> >  {
> >         struct drm_device *drm = platform_get_drvdata(pdev);
> > +       struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> > +
> > +       if (!priv || !priv->kms)
> > +               return;
> >
>
> I see a problem where if I don't get a backlight probing then my
> graphics card doesn't appear but this driver is still bound. I was
> hoping this patch would fix it but it doesn't. I have slab poisoning
> enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
> got all freed.
>
> I found that the 'drm' pointer here is pointing at junk. The
> msm_drm_init() function calls drm_dev_put() on the error path and that
> will destroy the drm pointer but it doesn't update this platform drivers
> drvdata. Do we need another patch that sets the drvdata to NULL on
> msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
> missed something and the drvdata has been set to NULL somewhere else
> upstream. I sort of doubt it though.

the hw that I guess you are running on should work pretty well w/
upstream kernel.. but I don't think there is any important delta
between upstream and the 5.4 based kernel that you are running that
would fix this..

so *probably* you are right..

BR,
-R

>
> ---8<----
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c842a270806d..895d74aa8834 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -577,6 +577,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         kfree(priv);
>  err_put_drm_dev:
>         drm_dev_put(ddev);
> +       platform_set_drvdata(pdev, NULL);
>         return ret;
>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
