Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794F18AE74
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4C06E105;
	Thu, 19 Mar 2020 08:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172626E105
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:40:04 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k18so1861354oib.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACN5TXHytCQ9oPIhIdCfNcH/pNHuSSltZdjJw7+EaRg=;
 b=A7NboF2/Hz8lWvoBTGeYPrQgAwRxBjdgXIJR/1akF0SZVx5wIQu0CN/7CL80GXNQmg
 4rmVYRb0lYTdlQaiJRmDTsoYiGLCBJ+IDGv1Lp33jY1utb0+pr9jXvzBwAbmqtuCuxtb
 rbnTIa/mG4eu6te9zzbxaeRET942OOWKDEDgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACN5TXHytCQ9oPIhIdCfNcH/pNHuSSltZdjJw7+EaRg=;
 b=couJgYC0jYUNMU/64tr60lNfN+I4c/9irro+kDWei6Qz6CuQDKsS1SED/g1EuPAzHQ
 dh3fbrhfv155HxdEZ97/qSw5gJj8xQIxyieh4/3fB/rBI0s+wqJQMRvEa5dCiruUYxgm
 bdErkvneObVGffNmIOw3Br4Kw2TMq8wNqwZIjkVqRszVfbjZbW8cS4cjP9wiWnxt34+W
 dsM1J+m2rjYi6Z40YBogp0AHJr7XpJjYXmWh7061ULRs1BNJ5sl+ZLlrMjPf12/k1kEQ
 2yIhFY485Ko48Zw7JrGakdYzDBJFpeNtfa2uXESabeVOdZJxVcLERsmABv5v6DaXeobI
 Yd+A==
X-Gm-Message-State: ANhLgQ0qO4RdtYxlF7AHmG1XwrdzzVh8hfICL0UWa5str3qd2BgEmNz3
 Iwrimg5Dvo4uZDEUL0yXUlBmgNLcelz+6DxewjvS1Q==
X-Google-Smtp-Source: ADFU+vt3ZzgRUF2QVHwIZ2Dg+soGlY7nM/mYmDu2kjCnCgsthelSdzxb44Mh83yzZ1MJ1ma3yWffDCZUEBGsisIAZiA=
X-Received: by 2002:aca:be08:: with SMTP id o8mr1404601oif.101.1584607203202; 
 Thu, 19 Mar 2020 01:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200313084152.2734-1-kraxel@redhat.com>
 <20200317164941.GP2363188@phenom.ffwll.local>
 <20200318064211.rg5s4sgrnqhht3f4@sirius.home.kraxel.org>
In-Reply-To: <20200318064211.rg5s4sgrnqhht3f4@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Mar 2020 09:39:52 +0100
Message-ID: <CAKMK7uE52i2_BhFoH0timOG_jUQP3OThA+wUWoMx6tfH9mMT6w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 marmarek@invisiblethingslab.com, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 7:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Mar 17, 2020 at 05:49:41PM +0100, Daniel Vetter wrote:
> > On Fri, Mar 13, 2020 at 09:41:52AM +0100, Gerd Hoffmann wrote:
> > > Shutdown of firmware framebuffer has a bunch of problems.  Because
> > > of this the framebuffer region might still be reserved even after
> > > drm_fb_helper_remove_conflicting_pci_framebuffers() returned.
> >
> > Is that still the fbdev lifetime fun where the cleanup might be delayed if
> > the char device node is still open?
>
> Yes.

In that case I think a FIXME comment that this should be upgraded
again to a full error once fbdev unloading is fixed should be added.
With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess you might want a cc: stable on this too?
-Daniel

>
> cheers,
>   Gerd
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
