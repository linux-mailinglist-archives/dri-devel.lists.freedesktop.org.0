Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83361C3E81
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 17:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2270D898EE;
	Mon,  4 May 2020 15:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367D898A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 15:31:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d15so21491161wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Lj8tleZyJl0d6ugHp9mrsQPp9NiYwJ2kT0RzHwMXEYE=;
 b=fwSFHj0zj6YzGFItB2v0UziM5Km6S81pSkMec3FmPXp1xpI0/LXycMAzZrf4ZdBiBr
 HVYHqsUSmLS8BnrwZ3GjLXm33zhNRcMY3V337vmGxqk1iH7sakdx5FUZSRroYPqA+5iJ
 XhiJBTfrLKUyAaMBVq4fTWJiD5xDBKVx0ykqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Lj8tleZyJl0d6ugHp9mrsQPp9NiYwJ2kT0RzHwMXEYE=;
 b=Ni8EPqoZaL4VM6W/jgXCbsj5jiryipopam7Gn2NpTPCnFG29Sgcmsrgr1adRKw42IN
 xMTjvU13nLkB8fzq8eQS/lEau0CfKpvlJ15PnkF3KhzL95zIDM3PoB7tT+ad5jYDmfXW
 mCrLD+MprW4LP4V5Vx8zTCrXoGDBUbExVjUjhcgW8qiduEukOwBYrKsIKtwxO3uCTx6t
 2IJ9Sq4HsTyZQFa2nZDr60vp63WfNigP+NTQhJsIri0msVswZWB2dDVqS3pK0doASVCe
 NYdVS5zXTsvqOx0zIQeqJb/Jqq8K8EK68xWa+EN441WuIJryU3eOCEktC6sECG/whDqA
 9yVw==
X-Gm-Message-State: AGi0PuZQ+5Il8j+EpKeZvFJADSmIQT0N2ZezNgFqj8bEf4T+/s5hGD+S
 dsG0+ZdE5BjGbW1GwIG3Ag/T1A==
X-Google-Smtp-Source: APiQypLIV3gxY9zv0C63Q32q4T+FtlBRaY+3jBLC46gMOMquuiN4oNglGnUX/GuD+6wNR7hbPDoZaA==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr20894469wrs.90.1588606292484; 
 Mon, 04 May 2020 08:31:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v131sm15165035wmb.19.2020.05.04.08.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:31:31 -0700 (PDT)
Date: Mon, 4 May 2020 17:31:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
Message-ID: <20200504153129.GM10381@phenom.ffwll.local>
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
 <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: cogarre@gmail.com, Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 02:07:22PM +0200, Thomas Zimmermann wrote:
> Hi Emil
> =

> Am 01.05.20 um 15:20 schrieb Emil Velikov:
> > Hi Thomas,
> > =

> > Couple of fly-by ideas/suggestions.
> > =

> > On Thu, 30 Apr 2020 at 10:13, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >>
> >> Suspending failed because there's no mode if the CRTC is being
> >> disabled. Early-out in this case. This fixes runtime PM for ast.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
> >> index 7a9f20a2fd303..089b7d9a0cf3f 100644
> >> --- a/drivers/gpu/drm/ast/ast_mode.c
> >> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
> >>                 return -EINVAL;
> > Unrelated:
> > This feels quite dirty. If AST1180 does not support atomic modeset
> > simply remove the DRIVER_ATOMIC bit.
> > You can do that at runtime, via drm_device::driver_features in say,
> > ast_detect_chip()?
> =

> The line you commented on dates back to non-atomic modesetting, but I
> don't know what the story behind AST1180 is. It is explicitly disabled
> in the list of PCI IDs, but the driver has plenty of code for it. It
> looks as if the chip can only do pageflipping with a pre-set video mode.
> =

> As it is right now, the AST1180 code could probably be deleted entirely.
> =

> > =

> > The drm_driver::driver_features is immutable, or it ought to be.
> > =

> >>         }
> >>
> >> +       if (!state->enable)
> >> +               return 0; /* no checks required if CRTC is being disab=
led */
> >> +
> > I cannot think of a reason why a driver would need to perform
> > crtc_atomic_check, if the crtc is being disabled.
> > Can you spot any? If not, this should be better served in core, which
> > calls this callback.
> > Correct?
> Ast is a bit of a special case, because it tests the incoming mode
> against a list of re-defined modes. With the crtc being disabled, the
> incoming mode is 0 in all fields. Obviously that's not a valid mode, and
> we need that additional test here.
> =

> In the general case, I'd see 'crtc check' as part of the larger atomic
> infrastructure. I can imagine that configurations require the CRTC to be
> enabled before other HW blocks work. So a driver might have a reason to
> run crtc's check even for disabled crtcs (at least to verify that the
> crtc is not disabled). I don't think this can be handled in the core easi=
ly.

Jumping out of ->atomic_check callbacks when stuff is all off is fairly
standard pattern. So much standard that I'm kinda wondering whether we
shouldn't just make it the default in atomic helpers - so many drivers
forget to do it and break in funny ways.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > HTH
> > -Emil
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
