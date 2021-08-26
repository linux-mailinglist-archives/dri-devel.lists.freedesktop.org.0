Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30873F8FA5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26CE6E8B5;
	Thu, 26 Aug 2021 20:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534106E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 20:29:47 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id b10so5395653ioq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
 b=T54Mvt1OkOwZKZVC8yB84osFcFFszP3nEEnPGks9V+7ttcd8WE2PBRj6Ot7p1qMdsW
 VSv9mCMx7aofBcB6mNmnGZjZWadQh+ektzlJapxEgZg2Dng9mfsIUQW/K8eCyu+Z58Nf
 zby4pVnJ8OIKewOqb1HUFgKHhglU2C+pPtqcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
 b=EZFE8OhGQut9bRrfosR7uiYuby942/Vq24bwXZnmivnFPXgT6dw/NC4GMuZFnYspcD
 pZdK5e+iJMgRBnkZJUSgHWcGStv+ZncFbDTT4i5ewKSg8s3wl0a1emas3DX60xiiMg0S
 V1D3h4BvQUZmBqfWh5QwYUdAyE2qBN9dRjdTAhGylBC2Avh/rmX3O7RaDuH1f5TttjCQ
 md2ngh4RaCE/2TbKL2wm7ndD2CADL/SWqqjYD9nxaIXvdEiV1JXY4zAjSV+kR9Hh1WY8
 E70dTJay+59y019ZUqXddddUl9sIi++IYcFF02BvJ6eo2Z71emcWIZutlaboy6BgyQda
 X/Rg==
X-Gm-Message-State: AOAM5328zFD1sr5mpBwO314mG0n1tyURjDOJslcZoKrkapwhqS6RW0SA
 vUrBPTXQH/XKi+nLWvus6wH0YJGi8WCF4w==
X-Google-Smtp-Source: ABdhPJyt8logYPSF1CgKdChoDZ8mchbgX9ANOGtihzauNAd8n+pbUtuaM+fhTg6l5KWKBiq56HhR4g==
X-Received: by 2002:a6b:5a1a:: with SMTP id o26mr4535005iob.40.1630009786463; 
 Thu, 26 Aug 2021 13:29:46 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id b12sm2253066ilo.44.2021.08.26.13.29.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id v2so4547302ilg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr4099123ilr.269.1630009785168; 
 Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Aug 2021 13:29:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> +       if (rc == -ENODEV)
> +               rc = 0;
> +       else if (rc)
> +               DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> +
> +       return rc;

So rather than storing the drm_panel, I suggest that you actually wrap
it with a "panel_bridge". Follow the ideas from commit 4e5763f03e10
("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge") and the fix
in commit c7782443a889 ("drm/bridge: ti-sn65dsi86: Avoid creating
multiple connectors").

If you do that then actually a bunch of your patch becomes
unnecessary. You basically just have to attach the "next" bridge in
the right place and you're good, right?

-Doug
