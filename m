Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A5410080
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 23:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F8C6E06D;
	Fri, 17 Sep 2021 21:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C806E064
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 21:05:14 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id f6so13947930iox.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hYgcz2WmuoTKimNGZMC9XjOQ7lSec5qs3OosNYmK+Ok=;
 b=MAON7TiphB4V7pl4cblyJU4fCBNd3AtveOG2N9qog5RtSabP80L+gI+5W27tWQEYLK
 YvxUcBYeSvcJBT3VOHqcvtcl2yR2zxzhCXaRrDEpW3uWD+ac6AA5S7WHRFuVEyzyQGom
 qMxoopdTBnoIy53LkjdOG7U3iBmeF+WbFnj58NcCFjGcmDj0US9Aj5CLvjp4UlgJEzUD
 sRe+TgOi1lGjWJsBHO7J/tQRLOJhoEV0WYfMQci4h8eCOR15IdQdEu2t5kFFVeMq1Xo+
 T48/kki+hg31MvafHT2J/GJxN48aHiGWQuGcWTn5gGcE1IRjdxEeVAxWrFFhXxEteocl
 sUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hYgcz2WmuoTKimNGZMC9XjOQ7lSec5qs3OosNYmK+Ok=;
 b=zBJJR81hFSzWXom3j5PMWt1fQWZ2Hc92R63nLJ/Gf5Nt/IDZ2FEVJPlxS0DbnclUxn
 PD3eAcQstxhaEq+IiI4QWfZw1ymoUVfq+0qhuwFEw2LvylXsF7ihyx6ko77ZbrnT+GKD
 aMepHUEm+738+NGUfdi7bvTyy58sNMEZYc/d681iBQee/2tEzAyRgMEwITk0IYAZzukA
 R8piW/gOOOwfXPYDLTmgmtuCC1dHlPtmKri0pb15vQGuw5GGnOIEpUoP/g53I8iC78l+
 mO5m6VOLsH0fn/tbeLLuirYddLi+7BUmQtWtSH5PxYGIxnVDoMneTkYnvaeK1v8NG924
 W4eA==
X-Gm-Message-State: AOAM53271bLguJF410wcdc65x8gJBwcvSJf/VdXsxHM10tq6ONq3dTBV
 7cBiOzUGxWNyd2xZX6+x4ioywg==
X-Google-Smtp-Source: ABdhPJyVGXTAKtSUaIMT4jST+b54K6uGNImHSympt1CfZVSL4qvHFcKKnAOXl2UCKvZYN210dAx95g==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr9913779iok.36.1631912713480; 
 Fri, 17 Sep 2021 14:05:13 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a5sm4857356ilf.27.2021.09.17.14.05.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 14:05:13 -0700 (PDT)
Date: Fri, 17 Sep 2021 17:05:07 -0400
From: Sean Paul <sean@poorly.run>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 13/13] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Message-ID: <20210917210507.GR2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-14-sean@poorly.run>
 <CAE-0n52Gm6SsjUTEEOt-9LD9dGCb7pFf0OC_xKSnRxLy4PO_iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52Gm6SsjUTEEOt-9LD9dGCb7pFf0OC_xKSnRxLy4PO_iw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:00:25PM -0700, Stephen Boyd wrote:
> Quoting Sean Paul (2021-09-15 13:38:32)

/snip

> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> > index 2f6247e80e9d..de16fca8782a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/debugfs.h>
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_hdcp.h>
> >
> >  #include "dp_parser.h"
> >  #include "dp_catalog.h"
> > @@ -15,6 +16,7 @@
> >  #include "dp_ctrl.h"
> >  #include "dp_debug.h"
> >  #include "dp_display.h"
> > +#include "dp_hdcp.h"
> >
> >  #define DEBUG_NAME "msm_dp"
> >
> > @@ -24,6 +26,7 @@ struct dp_debug_private {
> >         struct dp_usbpd *usbpd;
> >         struct dp_link *link;
> >         struct dp_panel *panel;
> > +       struct dp_hdcp *hdcp;
> >         struct drm_connector **connector;
> >         struct device *dev;
> >         struct drm_device *drm_dev;
> > @@ -349,6 +352,38 @@ static int dp_test_active_open(struct inode *inode,
> >                         inode->i_private);
> >  }
> >
> > +static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,
> 
> Is this the API that userspace is going to use to set the key? Or a
> simple debug interface that's used to test this code out? I hope it's a
> debugging aid and not the normal flow given that it's through debugfs.
> 

At the moment, generic UAPI is not useful beyond msm-based CrOS devices, which
is not really a burden upstream should be carrying. On other platforms
(including qc-based Android devices), the key injection is done in HW. As such,
I'm tempted to kick key injection UAPI down the road.

Once I finish the userspace client in CrOS, I can upload the UAPI for folks to
comment on.

/snip

> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > index 8b47cdabb67e..421268e47f30 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.h

> > +static int dp_hdcp_load_keys(struct drm_connector *connector)
> > +{
> > +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> > +       struct dp_hdcp_key *key;
> > +       int i, ret = 0;
> > +
> > +       mutex_lock(&hdcp->key_lock);
> > +
> > +       key = hdcp->key;
> > +
> > +       if (!key->valid) {
> > +               ret = -ENOENT;
> > +               goto out;
> > +       }
> > +
> > +       dp_hdcp_write_dp(hdcp, DP_HDCP_SW_LOWER_AKSV, key->ksv.words[0]);
> > +       dp_hdcp_write_dp(hdcp, DP_HDCP_SW_UPPER_AKSV, key->ksv.words[1]);
> > +
> > +       for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> > +               dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_LSB(i),
> > +                                  key->keys[i].words[0]);
> > +               dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_MSB(i),
> > +                                  key->keys[i].words[1]);
> > +       }
> > +
> > +       dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
> > +       wmb();
> 
> What are the wmb()s for? Can you add a comment indicating what we're
> trying to fix by having them?
> 

I think these were left over from testing (when things weren't working for me).
Will remove in the next version, thanks for catching!

/snip

> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 0519dd3ac3c3..75a163b0b5af 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c

/snip

> > @@ -55,6 +55,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
> >  {
> >         struct dp_io *io = &parser->io;
> >
> > +       msm_dss_iounmap(&io->hdcp_tz);
> > +       msm_dss_iounmap(&io->hdcp_key);
> >         msm_dss_iounmap(&io->dp_controller);
> >  }
> >
> > @@ -64,10 +66,20 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
> >         struct platform_device *pdev = parser->pdev;
> >         struct dp_io *io = &parser->io;
> >
> > -       rc = msm_dss_ioremap(pdev, &io->dp_controller);
> > -       if (rc) {
> > -               DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> > +       rc = msm_dss_ioremap(pdev, &io->dp_controller, 0);
> > +       if (rc)
> >                 goto err;
> > +
> > +       rc = msm_dss_ioremap(pdev, &io->hdcp_key, 1);
> > +       if (rc) {
> > +               io->hdcp_key.base = NULL;
> > +               io->hdcp_key.len = 0;
> > +       }
> > +
> > +       rc = msm_dss_ioremap(pdev, &io->hdcp_tz, 2);
> > +       if (rc) {
> > +               io->hdcp_tz.base = NULL;
> > +               io->hdcp_tz.len = 0;
> 
> Bjorn is trying to split the single io region apart into 4 different
> regions[1]. This would add two more io regions. Maybe this should come
> after those patches and be indexed later? I worry about needing to add
> more register properties later on though. Maybe a better approach would
> be to make them mandatory for certain compatible strings instead.

Thanks for the heads up, I'll look into adding a compatible string.

All your other comments will be addressed in v3.

Sean

> 
> [1] https://lore.kernel.org/r/20210825222557.1499104-6-bjorn.andersson@linaro.org
> 
> >         }
> >
> >         io->phy = devm_phy_get(&pdev->dev, "dp");

-- 
Sean Paul, Software Engineer, Google / Chromium OS
