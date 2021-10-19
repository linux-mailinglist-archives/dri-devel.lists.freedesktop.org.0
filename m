Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F75433571
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073736EB9B;
	Tue, 19 Oct 2021 12:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DBC6EB9B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:07:54 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id v77so4567522oie.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AhONZjvcNTIg94guK/DzJR75XzCllNFjoox0+yS5zW8=;
 b=CO7LZPPQdRqOxqCBa2agcQ63+j28oj7d0wtQo0Pkh9rpBvIvLEjV4up0gxDB9fy4e/
 qTTK2QuIcH5g9hIKOMLY7Nx5r3uwumsWOt51L35EaxVzdw2EObBIPHAzNWgrWxblTNXe
 +yb3cH/MezrZ91b2Rx2NfDLYO89riCMuJxT8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AhONZjvcNTIg94guK/DzJR75XzCllNFjoox0+yS5zW8=;
 b=pB4f+F3d+41S9tP4DmGKTjsxksVPcCXm1oo1hj4LAB45Ss8rBavKeLeTuRfUAKja23
 SiCuhYmI7VPt2QzXfXjlWSRvTvngXt8Hv2elyFlkFBdgD6wCVOzvgr6vqKPZMMAk/yEi
 zSYx6/W9yZC5zyEiKvp6dgknBt3hvJv63kQm5NWPrtxdV/MFJKtI+/zXjWLykGAKrhXv
 BH0zstBJsWI2CEIsoHWRGymeORS0mfNysGbJD3fqZ6+7iHdYxO4PneFLkInEYUAWwDHO
 KE1xYzuxjCZj8UTJr5JodZh8bhRoMmoah10G5HZcU+hRjHHtmU29KKEZJ8tv1BCWiXB1
 Sc5w==
X-Gm-Message-State: AOAM532oczeGp8uDPgLMZWcIlW83YQ0WkxMNAxvOscsqwDNOtYCJ5fH7
 XiOBxylgZ5/CwriCo1gch1fp45bWhQkio0KHK8LL4Q==
X-Google-Smtp-Source: ABdhPJxZhtwkn7cSdf8PSE/LjQ4mNeciAiZ9a1ezbzqQZoCioTRl8yiMvLbx0eCG/xDwUOKvlXBwxeeSYChAqUAvh6U=
X-Received: by 2002:a05:6808:118a:: with SMTP id
 j10mr3906393oil.101.1634645273540; 
 Tue, 19 Oct 2021 05:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210907024900.873850-1-marex@denx.de>
 <YTj/1EIdhQ3245VW@phenom.ffwll.local>
 <YWxi7oc56nKU2OzF@ravnborg.org> <9fe74edf-9606-9819-ad34-2195a6418ef9@denx.de>
In-Reply-To: <9fe74edf-9606-9819-ad34-2195a6418ef9@denx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Oct 2021 14:07:42 +0200
Message-ID: <CAKMK7uFF1sXojWQijMm4RksR-Oo4ZB-BpPc0hDOsH6mo9C+KKg@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
To: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Agner <stefan@agner.ch>
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

On Sun, Oct 17, 2021 at 10:05 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/21 7:52 PM, Sam Ravnborg wrote:
> > Hi Marek,
> >
> > On Wed, Sep 08, 2021 at 08:24:20PM +0200, Daniel Vetter wrote:
> >> On Tue, Sep 07, 2021 at 04:49:00AM +0200, Marek Vasut wrote:
> >>> The mxsfb->crtc.funcs may already be NULL when unloading the driver,
> >>> in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
> >>> mxsfb_unload() leads to NULL pointer dereference.
> >>>
> >>> Since all we care about is masking the IRQ and mxsfb->base is still
> >>> valid, just use that to clear and mask the IRQ.
> >>>
> >>> Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>> Cc: Daniel Abrecht <public@danielabrecht.ch>
> >>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>> Cc: Stefan Agner <stefan@agner.ch>
> >>
> >> You probably want a drm_atomic_helper_shutdown instead of trying to do all
> >> that manually. We've also added a bunch more devm and drmm_ functions to
> >> automate the cleanup a lot more here, e.g. your drm_mode_config_cleanup is
> >> in the wrong place.
> >
> > I have applied v2 of this patch today - but failed to see any response
> > in v2 to this comment from Daniel. Was it lost somehow?
>
> Hmmm, I'll investigate that ^ in the next round of mxsfb clean ups.

Yeah this was just a quick comment about how to do this cleanly, not
meant to hold up a bugfix or anything like that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
