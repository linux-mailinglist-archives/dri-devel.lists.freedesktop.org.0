Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24E1FFDBA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 00:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDE36E459;
	Thu, 18 Jun 2020 22:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BEC6E459
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 22:09:28 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t132so4487378vst.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
 b=lVrFJvl5mDjocLA105kchQDYwRR/Mq9nlcXy/owwADieAZYgAuGsjK3xpftm0NXclu
 BDh1QPoJU1TPpXMWq0DmrgoRSIGzBPlrIy8he0In3LWP8m83XqE+r0HZadf/sXAFVj2e
 IayO8IVxHmcZK2mLywOzCBqLmikiRhPA0Z8ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
 b=QuGgI7Wm8VPPFc+/eyPjTCFw3P+or5WRZb9c/wacTSqAppyyBaGmYsGFpE7fKnEB5g
 aLTmGIbr/e39sVNOcX1L8hAc8ruHDNz4CiwlF74Y0Ao6lBop2bVJs6+p+00toLxNKbje
 aepcUZkG1cuErBEe+eut7c6k6+88wawlz5+3cpOAulLieBZjP0h2d+LNh2nZ3RTlTcF6
 xP7xH91P879gXuwMIl0vIBgSQ2w22D3e5ZZkeoUI1VCuEs66KOkaFaGZLWrGrT8abreJ
 0qp1z4ByzNmGOUl3t6WyOjhIEgN0oqKm9XJdnrVI7YC0YVzrIjLiUk6TbqiPRTf43PVd
 CTfg==
X-Gm-Message-State: AOAM533d3OpWdsTqrzPwbmieeuAyd11fqCqMFrTAZ/PNCQ0flZkG+lT3
 qbi+fbRYW/DRoHnDi7jZAGWnHK+iQo0=
X-Google-Smtp-Source: ABdhPJw8sxa5Yl3fIT/WgRKq7+z44j7txU8zbvGJodf/6c6gqLF+frxDNwQmuD0jffNbhA+OoRj20g==
X-Received: by 2002:a67:fd98:: with SMTP id k24mr5285126vsq.212.1592518166744; 
 Thu, 18 Jun 2020 15:09:26 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id b9sm494321vkb.50.2020.06.18.15.09.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id v25so2533888uau.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr501831uah.22.1592518164952;
 Thu, 18 Jun 2020 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jun 2020 15:09:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
To: Harigovindan P <harigovi@codeaurora.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 9, 2020 at 5:05 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.
>
> Add changes to force suspend on the runtime device during pm sleep.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Include bridge name in the commit message and
>         remove dependent patchwork link from the commit
>         text as bridge is independent of OEM(Stephen Boyd)
>
> Changes in v3:
>         - Updating changelog to explain the need for patch
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

I think this patch is good to go now (has both Stephen's and my
reviews).  I noticed that Neil landed my other patches to this driver
recently (thanks!) and wondered why he didn't land this one.  Then, I
realized that you didn't send it to him or the other bridge
maintainer.  :(  Have you tried running get_maintainer?

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/bridge/ti-sn65dsi86.c
Andrzej Hajda <a.hajda@samsung.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <narmstrong@baylibre.com> (maintainer:DRM DRIVERS FOR
BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM
DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@siol.net> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

In any case, unless someone has extra feedback on this patch I think
it's ready to land.

Neil: If you're willing to land this patch too, can you let
Harigovindan know if it needs to be re-sent with you in the "To:" list
or if you can find it on the dri-devel list?

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
