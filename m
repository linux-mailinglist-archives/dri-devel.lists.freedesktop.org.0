Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55358430039
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 06:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66CE6E409;
	Sat, 16 Oct 2021 04:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C806E409
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 04:29:54 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so578092ote.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 21:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tWKskO0vijw6VuC0rGrJdOTxLE6Q7h7Z5id1uB71Ub4=;
 b=Rk85RaxBuxVymuxXyxLWPFircCV3/rKMH6JOaChfS0qNsWHQnzuTvGGaHZB6R09zFM
 GD2oypDdgT+pomlasK0sZ5YEKABmoKkk+HkiB39o9gQPNel7gD1i0/Mq9KK0mnUUAIPc
 MZq6fFdS0PfGbppfe/xACfqEwUoxzCFKqwjieGU8zjghMVogAYF1kXDLooaS3szSnL+L
 7kyvC5eFOSWe3mB622Dv04q4S9zPDQ1qDFsuGlkF1qs0rfzxaffGIacFM4BRQJ3XBncm
 wxs4eSqVWyyz8td3LPZVtVwf4Sq4jGMpV5uiNG09vYLzMpzhBjI6Q4nokTdHkkCR3JEE
 xTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tWKskO0vijw6VuC0rGrJdOTxLE6Q7h7Z5id1uB71Ub4=;
 b=fUTdUdMweh+rGPQO9FHEuiryTVgjD5kXjvjpKwDWWXh+/Ebh+7fzPb+hB4L+s92fNZ
 sOBkM2dQ+hb/QGL+7uYJkHAtD/iomU8XT7UrlFn4ODmpNLcLJy1lamNy+Q8z/WOXj9Tf
 hkSZikG8b8BmbtJMFrgzl7jx7tL/wywuDNaC8R7LGRs1YRv13t7kniCJaIx9mB+2ZzEg
 KcUDxy/SKewlLUfx+j0bUwzStfboZ/EdxhW5NHhHNzMCuCdfUI8xqOz9pSJncqj24n+f
 JBc7Z/0+20zIuntU+ZgA8FOR/CCGfmfjWANWLTkWI32HiiPVodhKQ+SwZIEnijFa5OCh
 /TEg==
X-Gm-Message-State: AOAM530mAl3EPsJrOr7gDSEPONb1BgArYMVI42JHHV4Fh3APSgc5nzWI
 b2cJKRRzizSJqMn8SQpNIKd2GA==
X-Google-Smtp-Source: ABdhPJxxzT/UupHz/CDgGh4KaDC4NFFD3W+tv0mE22iuqkP04VYM/x6FJj3Hdg7H47W9jZOeGKLz7w==
X-Received: by 2002:a9d:6c91:: with SMTP id c17mr11274169otr.114.1634358593948; 
 Fri, 15 Oct 2021 21:29:53 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:74c9:deff:fe1a:d52c])
 by smtp.gmail.com with ESMTPSA id w12sm1333538oop.19.2021.10.15.21.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 21:29:53 -0700 (PDT)
Date: Fri, 15 Oct 2021 23:29:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Only create debugfs for PRIMARY
 minor
Message-ID: <YWpVPshOT6k1MI2r@yoga>
References: <20211015231307.1784165-1-bjorn.andersson@linaro.org>
 <48f35ef1f90bc7c23599e98a5c1e2c09@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f35ef1f90bc7c23599e98a5c1e2c09@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 15 Oct 18:44 CDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-10-15 16:13, Bjorn Andersson wrote:
> > dpu_kms_debugfs_init() and hence dp_debug_get() gets invoked for each
> > minor being registered. But dp_debug_get() will allocate a new struct
> > dp_debug for each call and this will be associated as dp->debug.
> > 
> > As such dp_debug will create debugfs files in both the PRIMARY and the
> > RENDER minor's debugfs directory, but only the last reference will be
> > remembered.
> > 
> > The only use of this reference today is in the cleanup path in
> > dp_display_deinit_sub_modules() and the dp_debug_private object does
> > outlive the debugfs entries in either case, so there doesn't seem to be
> > any adverse effects of this, but per the code the current behavior is
> > unexpected, so change it to only create dp_debug for the PRIMARY minor.
> > 
> 
> If i understand correctly, today because of this, we get redundant debugfs
> nodes right?
> 
> /sys/kernel/debug/dri/<minor_x>/dp_debug
> /sys/kernel/debug/dri/<minor_y>/dp_debug
> 
> Both of these will hold the same information as they are for the same DP
> controller right?

That's correct, all the dp_debug debugfs files end up in both minors.

The problem is that dp->debug points to the dp_debug struct for one of
them, which afaict doesn't have any really bad effects today - unless
you try to clean up the dp_debug state, but that will clear out the
entire dri/<minor_y>...

> In that case, this is true even for the other DPU kms information too.
> 
> Why not move this check one level up to dpu_kms_debugfs_init?
> 

I was expecting that perhaps some of this information was
minor-specific, but if that isn't the case it sounds reasonable that we
should push this one step up.

Regards,
Bjorn

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 3aa67c53dbc0..06773b58bb60 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/component.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/delay.h>
> > +#include <drm/drm_file.h>
> >  #include <drm/drm_panel.h>
> > 
> >  #include "msm_drv.h"
> > @@ -1463,6 +1464,10 @@ void msm_dp_debugfs_init(struct msm_dp
> > *dp_display, struct drm_minor *minor)
> >  	dp = container_of(dp_display, struct dp_display_private, dp_display);
> >  	dev = &dp->pdev->dev;
> > 
> > +	/* Only create one set of debugfs per DP instance */
> > +	if (minor->type != DRM_MINOR_PRIMARY)
> > +		return;
> > +
> >  	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
> >  					dp->link, dp->dp_display.connector,
> >  					minor);
