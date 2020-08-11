Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3757242173
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8991C6E842;
	Tue, 11 Aug 2020 20:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EAC6E842
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:58:19 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id y30so15777ooj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtEDO1t2zy+1zeaF2RQV/qclEsl4EO9kMLrrOS4Xuyo=;
 b=VinKTHFlUuh6PVvQo6OpNkDDqVPQdc2yBaViMfBBxGPLi3QLsH3oYsQPlR8Hfj6AU/
 0XaTAaj+9MYV0r5f+ocNUl69jFFjFiZxXNhIlcvOWbxVH5B2ULj5O1RudqEu2nbaKmXb
 Hxe/Rv9NndJ8g0mIuZ55/o46XVTGl+HefYw2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtEDO1t2zy+1zeaF2RQV/qclEsl4EO9kMLrrOS4Xuyo=;
 b=YpwlA0Rsc5xHNyuH/+ZN5nUSV7aYBdsozvag4heL82ZGcGTAW72st6lTC1yylxkojy
 iQl8anaYTqN46pkpRpAGuTtePTZlcVAhfk3eKB0q6RncfSczFJTo6QqL78fgZhHOYwbr
 u7KKH2/vP1Zdfgv6MS7Imu8sz1x49aQk3F8/hGJgNssw3zJftSh+wyagtCUmxskQOS/C
 B/W/LZ99w7cuotLLikorimoBwJ1v1pIKpv/GYARUqeBsXHXq6oGS7nvLCqmG++Lt1JDP
 tItrrRFfSfLPYzfo05o4mb1ip58+YGLIGDaf0WPjwPUqgQMNeIi6kg6iDZEwTc7jASYp
 Qexw==
X-Gm-Message-State: AOAM533D9JTRMQxUSKO5Ukj3FUCmMqHka/kJLi9Xyu04vMovdV34AMzZ
 u2hdQW29NHCsVm+ThxtUtF+CISyd8G9DSLLakYU2Qw==
X-Google-Smtp-Source: ABdhPJyGtSRmxl0WxU9e6qBkMiA7XKEKfC8frV3ubadYcivwTCTe07ov2HUl8VZIMzasuiicNLZ8uhuOKOGb3+4kaRI=
X-Received: by 2002:a4a:9e05:: with SMTP id t5mr6911907ook.89.1597179498827;
 Tue, 11 Aug 2020 13:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200808224322.1507713-1-linus.walleij@linaro.org>
 <20200810130449.GR2352366@phenom.ffwll.local>
 <CACRpkdb+CQxdd1gDbQCft8_AJjbX6b9c8sdmj1LXVByUE-mkpw@mail.gmail.com>
In-Reply-To: <CACRpkdb+CQxdd1gDbQCft8_AJjbX6b9c8sdmj1LXVByUE-mkpw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Aug 2020 22:58:07 +0200
Message-ID: <CAKMK7uEqCM_S3ckq0rTK0nky6gWaQFww5_BgUAWBZRQh-Ytsjg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-notatek-nt35510: Fix MTP read init
To: Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: newbytee@protonmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 10:24 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 10, 2020 at 3:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sun, Aug 09, 2020 at 12:43:22AM +0200, Linus Walleij wrote:
> > > In order to successfully read ID of the MTP panel the
> > > panel MTP control page must be unlocked. Previously
> > > this wasn't encountered because in the setup with this
> > > panel the power wasn't ever really dropped. When power
> > > gets dropped from the panel, MTP needs to be unlocked.
> > >
> > > Cc: newbytee@protonmail.com
> > > Cc: Stephan Gerhold <stephan@gerhold.net>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > I guess this needs to be merged together with the mcde changes, or things
> > break?
>
> Yes this should be merged first.
>
> > Either way looks reasonable. Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Thanks!
>
> BTW I need to merge v5.8 (final) into drm-misc-next so as to get
> a smallish fix from the late -rc:s back. It is currently at v5.8-rc2.
> Is that something you'd say I can be bold and attempt myself
> of should I stay off it?
>
> I asked on dri-devel but didn't get any help there.

Hm I also asked Maxime already for a backmerge, I guess it didn't
happen yet. Maybe time for Maarten or Thomas to do it instead. Adding
them all.

Usually maintainers should do this, least to avoid surprises and stuff
when they do the next pull request. And yeah a quick ping on irc
should be enough to make it happen.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
