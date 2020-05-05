Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3E1C5886
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1032897BC;
	Tue,  5 May 2020 14:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C05895D7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:16:20 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id f7so521087vkl.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvFNh353Z3Z9fWtO12abpbS3cED+bzhQQuWsdCLcFUk=;
 b=HmXEPizAhbHCgJH4S2AKiGZWH8Dc5c0+vleB9oKlWyTUT6sKURnZgD1KIsY6wzSfku
 cGFXvnDJSc8vVd561go7azcWRZ05rgPFmh+qdUyPtiIM8Lx3zmJtO6FgUOLkwgUYhokc
 LXtmgHe1mQn8YM3dyRPC1DtMgGvnD/s4VhxtwBkG2Tt8FxpNUq2Ln+DQKcnkRwd6tyxs
 ZrV9phEkuT1Xn9PrNyHpULXTvaY7ChyYnbmthoIvGXJbUd0Jg64dbNl1YU8JUstIeoQI
 dpggZ+sHxu5w717oz1RbTu8xO+v3A0Gy4Wt4FuFT0ewhsfGaEN75263qSwTEzfduBwW6
 JLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvFNh353Z3Z9fWtO12abpbS3cED+bzhQQuWsdCLcFUk=;
 b=CtnCyyj0FedVLDSvw0eH9mBAUL3yXLzmprtS1ur38rlwBDjQPm9spDpGc/agWc5Kct
 aNfAOZ7HJ64aLW50avJ0Vylcq+w2tuUs4jVy4zyMgC/qZSuA/h9fVK+xKoBkbYdAMThQ
 sGxKjZ1QH73f/+zcj+MfzwvvnQcBIxw01QRzJ2F9+J3aynqgChgL/Z3SgHeuhcqT7AiT
 tPBO4sxGrNQyiJqGIktWrZmAFMuOzDqowbpN49oJoB3k40WP9ZXjoW5o1mwvtUqfwJzn
 sgiKX7UDei4teHotdiiXtKvoMwfFpxFhpbSMVxwa1IfzR1XwGs2mtqXgK7fQQieawvCy
 oeYA==
X-Gm-Message-State: AGi0PuaCuKwlaW81EtlIAn9DpnlonSvICgL7YXkJ5PO2/1Eh5kBDX31e
 Yx/iOlDfYDuuG0MOS87u+DK61zKkRjI84t9mArA=
X-Google-Smtp-Source: APiQypKioCbK3/31VPrkssKO/XsWaSBNsfVEA4IawsrqXNH6VIxTIFeRGBWeeBpCIEarTXgpqkSd7e4wL1BkcJIeGmg=
X-Received: by 2002:a05:6122:12a:: with SMTP id
 a10mr2623760vko.51.1588688179986; 
 Tue, 05 May 2020 07:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
 <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
In-Reply-To: <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 5 May 2020 15:13:53 +0100
Message-ID: <CACvgo51KJtmqiJDi120p2rL3-m9-vNdA2KdUbFjaQ9H07C_ktA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: cogarre@gmail.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 May 2020 at 13:07, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Emil
>
> Am 01.05.20 um 15:20 schrieb Emil Velikov:
> > Hi Thomas,
> >
> > Couple of fly-by ideas/suggestions.
> >
> > On Thu, 30 Apr 2020 at 10:13, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Suspending failed because there's no mode if the CRTC is being
> >> disabled. Early-out in this case. This fixes runtime PM for ast.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> >> index 7a9f20a2fd303..089b7d9a0cf3f 100644
> >> --- a/drivers/gpu/drm/ast/ast_mode.c
> >> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
> >>                 return -EINVAL;
> > Unrelated:
> > This feels quite dirty. If AST1180 does not support atomic modeset
> > simply remove the DRIVER_ATOMIC bit.
> > You can do that at runtime, via drm_device::driver_features in say,
> > ast_detect_chip()?
>
> The line you commented on dates back to non-atomic modesetting, but I
> don't know what the story behind AST1180 is. It is explicitly disabled
> in the list of PCI IDs, but the driver has plenty of code for it. It
> looks as if the chip can only do pageflipping with a pre-set video mode.
>
> As it is right now, the AST1180 code could probably be deleted entirely.
>
No modeset support at all? Ouch.

Removing is one option a shorter/simpler one will be to expose zero connectors.
So any crazy^W brave soul can reinstate AST1180 support.

In either way - it's something for another day/series.

> >
> > The drm_driver::driver_features is immutable, or it ought to be.
> >
> >>         }
> >>
> >> +       if (!state->enable)
> >> +               return 0; /* no checks required if CRTC is being disabled */
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
>
> In the general case, I'd see 'crtc check' as part of the larger atomic
> infrastructure. I can imagine that configurations require the CRTC to be
> enabled before other HW blocks work. So a driver might have a reason to
> run crtc's check even for disabled crtcs (at least to verify that the
> crtc is not disabled). I don't think this can be handled in the core easily.
>
Ack, makes sense.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
