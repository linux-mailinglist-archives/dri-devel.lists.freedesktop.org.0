Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A524273F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45B897F5;
	Wed, 12 Aug 2020 09:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3501897F5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:12:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so1379515ljo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 02:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vjo4GNQ4fGgSjYKPEMNe40f8SYZUyMg2tYRBlbi285I=;
 b=ALHoOYQDJsiWySrTiy0EcrC1vYeWKjrf4Yo/a6OsGITV0ggrRvRuMiU3QQMPXpdtA/
 lGtqY+04OD9tUefPj0eCmp+0E/WkgXBZa5nbZ3F4jk1mACltKtZ/0Ub2qEMKwZVnk89s
 Y007Co4paTWiFKkSDPntwRgT3CyTQV59mFtGsI9CckVtn59vl/z3SESxnpm0MRo9KqBG
 GPFXOs7U7zCRiTE+QqyRM61Dh1iMJSJTvrw8JJBcARnrrtK8nRoYZgubO83N4zLn3lXJ
 n/ty4WM9nvrRjdVBnNPnysqTieaSGrAF4nrq9vx3aBOGfRrnaFfdc718tqlxOztBaOHR
 eddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vjo4GNQ4fGgSjYKPEMNe40f8SYZUyMg2tYRBlbi285I=;
 b=EU1S88G0s+TO8Ckv6Yd5v8/BqdUhukQzIeJ2ZmzlTkuzLC92mq87HXcEN1DSwuMHt/
 IgsFF4tbjJhdBJu1Gu59uRlPLCRNQY5ONZrAU+6UB2Y6yVgunuyQQs3iTQm6ocEAiGdp
 TDVm0Ubo/wdiq9Aw+C15lcuAGnVKF4ihuOLqHk6Jxobmj3tdrtlQLYtuXZj9NhcqdZwT
 cfXbzm8TfxhO/sR3flk14wJFV+3sdsvESXYprHRJh0Lg/XsDY/Mzp57Gf/y9u+/G0Oja
 xIwXvJJPEKmKLH4WLaXDMOU/EM56j9fuzToaSbZ9uBTqN/n+lCZl4ZLQb/lMiVTBiIv3
 SjqQ==
X-Gm-Message-State: AOAM530p58OcRL8aM53m+r2dGo+8BL8SGZ0Tqe0YyuYf2rQtpRD0ICWe
 i0XfiPasMYvLIJT2ypjfWaccCRRrfVx0z8OsdRpI5g==
X-Google-Smtp-Source: ABdhPJy50GBzthtr1vocSvg9rzI4fE2MfV2VtqAF1Zd0eQJ2WvmFw6acyhfpq+0ewvdT4jvwfSWwzisw/vy0C3lwNG8=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr5092421ljb.283.1597223558391; 
 Wed, 12 Aug 2020 02:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200808224322.1507713-1-linus.walleij@linaro.org>
 <20200810130449.GR2352366@phenom.ffwll.local>
 <CACRpkdb+CQxdd1gDbQCft8_AJjbX6b9c8sdmj1LXVByUE-mkpw@mail.gmail.com>
 <CAKMK7uEqCM_S3ckq0rTK0nky6gWaQFww5_BgUAWBZRQh-Ytsjg@mail.gmail.com>
In-Reply-To: <CAKMK7uEqCM_S3ckq0rTK0nky6gWaQFww5_BgUAWBZRQh-Ytsjg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Aug 2020 11:12:27 +0200
Message-ID: <CACRpkdaSXx+tj_ptHnSwFuf30=RDdnUyB=YfezB7SmLyeHUCpA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-notatek-nt35510: Fix MTP read init
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Stephan Gerhold <stephan@gerhold.net>, newbytee@protonmail.com,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 10:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> > BTW I need to merge v5.8 (final) into drm-misc-next so as to get
> > a smallish fix from the late -rc:s back. It is currently at v5.8-rc2.
> > Is that something you'd say I can be bold and attempt myself
> > of should I stay off it?
> >
> > I asked on dri-devel but didn't get any help there.
>
> Hm I also asked Maxime already for a backmerge, I guess it didn't
> happen yet. Maybe time for Maarten or Thomas to do it instead. Adding
> them all.

OK thanks.

> Usually maintainers should do this, least to avoid surprises and stuff
> when they do the next pull request. And yeah a quick ping on irc
> should be enough to make it happen.

It's vacation time on the northern hemisphere so we can cut them
some slack.

Thanks!
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
