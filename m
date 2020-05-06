Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAA1C6ECD
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB296E857;
	Wed,  6 May 2020 10:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2CC6E857
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:58:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so2071360wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XIpJDQwQSUdpzgjGGOmvSE6I9y4ziHKJ6xP+CFVZNTE=;
 b=Luhn0OQj9MSZNFShFX51KPmTGGM0htOEDDDioapjOdb+6Xlhlu/MB6nrWv6pwffr2j
 IAehMkPtzEnMd94e2EuQbKpUWcr5J/KWpOfXEm4BiYrGmzhK2fZQr1uFlQLqQksZIxsf
 sD/cRfDtaH4maX7PWiqOj5w96QtVTjRcQdQr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XIpJDQwQSUdpzgjGGOmvSE6I9y4ziHKJ6xP+CFVZNTE=;
 b=oahnkiGH/ffdg/zizmgBoj2hbaz/a5DqMNWXkWOu3S4UEUXyqqXA2rkx/3lg4OSwq1
 d8937FPQWfh5P0FCcy0QwMAuJAey78kq4YrJuBkP6ng9pHtNyqOJNxS9n5pNGz5lHjta
 kwTUKgPKcQbYcdUmf2YRA0VKTUYZ6N/UvA7O2ES1Yv+yM39m4sMVcV8FK4BEJCpctYer
 wn5DSgBUdAzNFSXrJH9kEvDJzCu/zp6LGS58as9DZa1ocXDxvWY+6I5uOMDY0rXdL0hF
 LvZF92L1UpVikS+s1r+4ZELbh24N7xlvBdcu1bbUrnNFEifOeO879ywcgHKIgIGeWqse
 W+xA==
X-Gm-Message-State: AGi0PuZiJHd5RkHIr4jMx5mEG2hy5a0gwLUIyctJjENCVZhQPwOVH+V8
 VYVfJ5mT04Xrf4mrxJmPiKDEyQ==
X-Google-Smtp-Source: APiQypJmh7JfscWLEkkgsleWiupFQIfOvsJS4pbmXLt2TAifhNFh0fji/otf/YnI5kCzXXBOQZKboA==
X-Received: by 2002:a7b:cb88:: with SMTP id m8mr3740635wmi.103.1588762692902; 
 Wed, 06 May 2020 03:58:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b23sm205230wmb.26.2020.05.06.03.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:58:11 -0700 (PDT)
Date: Wed, 6 May 2020 12:58:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
Message-ID: <20200506105809.GX10381@phenom.ffwll.local>
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
 <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
 <20200504153129.GM10381@phenom.ffwll.local>
 <ade08354-36c3-1084-e74a-37c5292aa39c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ade08354-36c3-1084-e74a-37c5292aa39c@suse.de>
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

On Wed, May 06, 2020 at 10:06:15AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 04.05.20 um 17:31 schrieb Daniel Vetter:
> > On Mon, May 04, 2020 at 02:07:22PM +0200, Thomas Zimmermann wrote:
> >> Hi Emil
> >>
> >> Am 01.05.20 um 15:20 schrieb Emil Velikov:
> >>> Hi Thomas,
> >>>
> >>> Couple of fly-by ideas/suggestions.
> >>>
> >>> On Thu, 30 Apr 2020 at 10:13, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>>>
> >>>> Suspending failed because there's no mode if the CRTC is being
> >>>> disabled. Early-out in this case. This fixes runtime PM for ast.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> ---
> >>>>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
> >>>>  1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/as=
t_mode.c
> >>>> index 7a9f20a2fd303..089b7d9a0cf3f 100644
> >>>> --- a/drivers/gpu/drm/ast/ast_mode.c
> >>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >>>> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct d=
rm_crtc *crtc,
> >>>>                 return -EINVAL;
> >>> Unrelated:
> >>> This feels quite dirty. If AST1180 does not support atomic modeset
> >>> simply remove the DRIVER_ATOMIC bit.
> >>> You can do that at runtime, via drm_device::driver_features in say,
> >>> ast_detect_chip()?
> >>
> >> The line you commented on dates back to non-atomic modesetting, but I
> >> don't know what the story behind AST1180 is. It is explicitly disabled
> >> in the list of PCI IDs, but the driver has plenty of code for it. It
> >> looks as if the chip can only do pageflipping with a pre-set video mod=
e.
> >>
> >> As it is right now, the AST1180 code could probably be deleted entirel=
y.
> >>
> >>>
> >>> The drm_driver::driver_features is immutable, or it ought to be.
> >>>
> >>>>         }
> >>>>
> >>>> +       if (!state->enable)
> >>>> +               return 0; /* no checks required if CRTC is being dis=
abled */
> >>>> +
> >>> I cannot think of a reason why a driver would need to perform
> >>> crtc_atomic_check, if the crtc is being disabled.
> >>> Can you spot any? If not, this should be better served in core, which
> >>> calls this callback.
> >>> Correct?
> >> Ast is a bit of a special case, because it tests the incoming mode
> >> against a list of re-defined modes. With the crtc being disabled, the
> >> incoming mode is 0 in all fields. Obviously that's not a valid mode, a=
nd
> >> we need that additional test here.
> >>
> >> In the general case, I'd see 'crtc check' as part of the larger atomic
> >> infrastructure. I can imagine that configurations require the CRTC to =
be
> >> enabled before other HW blocks work. So a driver might have a reason to
> >> run crtc's check even for disabled crtcs (at least to verify that the
> >> crtc is not disabled). I don't think this can be handled in the core e=
asily.
> > =

> > Jumping out of ->atomic_check callbacks when stuff is all off is fairly
> > standard pattern. So much standard that I'm kinda wondering whether we
> > shouldn't just make it the default in atomic helpers - so many drivers
> > forget to do it and break in funny ways.
> =

> If there comes a driver that really must handle the 'disable case' in
> its check handler, such a change would be hard to revert. Removing the
> check from the DRM core could regress drivers that depend on the new
> semantics.

Yeah I know, that's why I don't want to push this into helpers (it
wouldn't ever be in core code). But it surely is tempting, because we have
tons of bugs in this area. I've made a patch series a while ago that only
cleaned up some of the minor confusion between plane_state->crtc and
plane_state->fb (they're only set together or neither). Losing choice
either way :-/
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> HTH
> >>> -Emil
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>>
> >>
> >> -- =

> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> > =

> > =

> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

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





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
