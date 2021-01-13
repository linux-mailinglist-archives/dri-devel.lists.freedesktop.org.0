Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2352F5D78
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A416E138;
	Thu, 14 Jan 2021 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3063C89259
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:23:10 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id b3so1960604pft.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=WGQke6zLtAv2uygLrV72K2fh5rxYEfT4Z5bBr6us6zY=;
 b=GJamghzOgKRi6utXXwuDtzHOkAu2Z4OLQceAsd+a656nZEdDzGd1MbCXgrXzVxggk5
 J81AlFPqw/YnRpvHiMXESmZOmirpd4Q+2zAZGxFpEFm5rZ2QTQHqkaW/KtB1+CJAESo7
 3GL3+pyz3IJBgxWo1tt4XncPohFynFLlT1X7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=WGQke6zLtAv2uygLrV72K2fh5rxYEfT4Z5bBr6us6zY=;
 b=Cot94rcW6EjSrWYy+1WjFvLdM8BGorNFEjaF+kRZLiWLPj+qWJDV+sv56UrYNJrmfI
 wiWFKbxrjmKH5R6WKzNoSheTvQgl5h+QetuPnKR2OLqBJlTyNUFsqX0Voa5YCbQmwLE9
 hA+L1ge07AZ02gtDOfQzlL/U77CrJtdXEIWXAqomEdJ7v5hk+HXhsa3HVR6PsXLwYItp
 UxuaUjH/Nstar42VwN2FmX0CxfOjYe0l6IIvq7xkGKSTYnnV56/2paG0TYwo+GQyNAwd
 sGpDC3jJ7y1yR4/vAVRCxzLAeXJbaYx82zwsoOia6X61kcUnnvAVDOuJc2vkasD81YY1
 pelQ==
X-Gm-Message-State: AOAM533VXUJLXrgmhH1A4bEQ32zBR1ujGjJvZpIl3oCeMLyCz09gi60R
 jHugSViUV6iqyzo86680rS+WsrJ9LyvHVA==
X-Google-Smtp-Source: ABdhPJwUyxpvweLYeLkKvIIGRSlxt5wm3sy5MANlUgFTrlD92c4nskgH/ugzEIpRdVCdfTcbf33UIw==
X-Received: by 2002:a65:648c:: with SMTP id e12mr3735220pgv.123.1610569389573; 
 Wed, 13 Jan 2021 12:23:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id ay21sm3725318pjb.1.2021.01.13.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:23:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e7e1e5f8808fc35a3bed9e6291c76460@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
 <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
 <e7e1e5f8808fc35a3bed9e6291c76460@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd
 handler
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Wed, 13 Jan 2021 12:23:07 -0800
Message-ID: <161056938760.3661239.7140156995833982843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-01-13 09:48:25)
> On 2021-01-11 11:54, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-01-07 12:30:25)
> >> There is HPD unplug interrupts missed at scenario of an irq_hpd
> >> followed by unplug interrupts with around 10 ms in between.
> >> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
> >> irq_hpd handler should not issues either aux or sw reset to avoid
> >> following unplug interrupt be cleared accidentally.
> > 
> > So the problem is that we're resetting the DP aux phy in the middle of
> > the HPD state machine transitioning states?
> > 
> yes, after reset aux, hw clear pending hpd interrupts
> >> 
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index 44f0c57..9c0ce98 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct 
> >> dp_catalog *dp_catalog)
> >>         return 0;
> >>  }
> >> 
> >> +/**
> >> + * dp_catalog_aux_reset() - reset AUX controller
> >> + *
> >> + * @aux: DP catalog structure
> >> + *
> >> + * return: void
> >> + *
> >> + * This function reset AUX controller
> >> + *
> >> + * NOTE: reset AUX controller will also clear any pending HPD related 
> >> interrupts
> >> + *
> >> + */
> >>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
> >>  {
> >>         u32 aux_ctrl;
> >> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog 
> >> *dp_catalog,
> >>         return 0;
> >>  }
> >> 
> >> +/**
> >> + * dp_catalog_ctrl_reset() - reset DP controller
> >> + *
> >> + * @aux: DP catalog structure
> > 
> > It's called dp_catalog though.
> registers access are through dp_catalog_xxxx

Agreed. The variable is not called 'aux' though, it's called
'dp_catalog'.

> > 
> >> + *
> >> + * return: void
> >> + *
> >> + * This function reset DP controller
> > 
> > resets the
> > 
> >> + *
> >> + * NOTE: reset DP controller will also clear any pending HPD related 
> >> interrupts
> >> + *
> >> + */
> >>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)

Right here.

> >>  {
> >>         u32 sw_reset;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
> >> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index e3462f5..f96c415 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct 
> >> dp_ctrl_private *ctrl,
> >>          * transitioned to PUSH_IDLE. In order to start transmitting
> >>          * a link training pattern, we have to first do soft reset.
> >>          */
> >> -       dp_catalog_ctrl_reset(ctrl->catalog);
> >> +       if (*training_step != DP_TRAINING_NONE)
> > 
> > Can we check for the positive value instead? i.e.
> > DP_TRAINING_1/DP_TRAINING_2
> > 

Any answer?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
