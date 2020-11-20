Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9A2BAC26
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 15:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC15C6E8C0;
	Fri, 20 Nov 2020 14:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A876E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:50:38 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n11so8936526ota.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeI3XLfy7zjsuDZBUbVYM32ABWixxEmS/QJ4voVy8+M=;
 b=Welndezy4dnXpFm8GpZ1B4/WENLIZem76oGzDjBA8bl9Im0RCk48Vtk/XtBQ3ixymD
 NAtTANDJ+mxNFTtae9Q50S7AUx0MvB3XOPoW4vOeid9PwYauIP08FCgmHQSlnYGus5MH
 clyWTyGUOO6Aejjd9JbbqR1N6gjYt86iR1/zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeI3XLfy7zjsuDZBUbVYM32ABWixxEmS/QJ4voVy8+M=;
 b=ViQR7R1nEpGH8qn5TyOuhJozPgI80T9daR1S1di1PVRbjwdBiiucGajlh9yZypfOHT
 PHeuh6GYD9HSgnLphVX0E2WCMS0sn6J0JW0HeA/WTdrMx77+p+t13YWqcLcmqQhdF2vv
 /AmX5aqr0FPW8OxwmSlqNNvzQxUvu0YkW9cclY2c6N0YeJzWX64rlRUzfm1FhC0ow0Ep
 veTlR/EZZSak7AIO2L0uLt3UZr8QM58OFpFJ9Yb4CGCR4WfFwvZruPIA8fJF5Ckmd0hU
 284Dxy/61b02J0z5kK5F1WFMZXP1DkcfGh1znPO4Q4USsvQ/tm1Z0EC9ixbtUigFjylO
 wDuw==
X-Gm-Message-State: AOAM530RwH667ExBkIWCcMqLcIfn6u39uCRDIi68wxbKPMMAptdTMAkn
 H9cc78sPrTNg2owHVgD3E0lvOvOW054V3usc1p7e1Q==
X-Google-Smtp-Source: ABdhPJxcS7IFOWMbsT3luPnCBcXCxKmPhyxdlJw1ml257trqvITcFuPLWk+cqU2xmQJ7cvucBRcu6ZRbIj0N1C794sE=
X-Received: by 2002:a9d:27a5:: with SMTP id c34mr13608755otb.303.1605883837875; 
 Fri, 20 Nov 2020 06:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-2-maxime@cerno.tech>
 <20201113210240.GX401619@phenom.ffwll.local>
 <20201120133418.kllxy5nisjtb5jab@gilmour>
In-Reply-To: <20201120133418.kllxy5nisjtb5jab@gilmour>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Nov 2020 15:50:26 +0100
Message-ID: <CAKMK7uF0PP7Sok9phvM=P=upbjSHHQbw5dexfPEe_2qGFsEN8Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm: Introduce an atomic_commit_setup function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 2:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Daniel,
>
> Thanks for your review
>
> On Fri, Nov 13, 2020 at 10:02:40PM +0100, Daniel Vetter wrote:
> > > +    * is not used by the atomic helpers.
> > > +    *
> > > +    * This function is called at the end of
> > > +    * drm_atomic_helper_setup_commit(), so once the commit has been
> > > +    * properly setup across the generic DRM object states. It allows
> > > +    * drivers to do some additional commit tracking that isn't related to a
> > > +    * CRTC, plane or connector, typically a private object.
> > > +    *
> > > +    * This hook is optional.
> > > +    */
> > > +   int (*atomic_commit_setup)(struct drm_atomic_state *state);
> >
> > I think the kerneldoc for drm_private_obj should also explain when it is
> > necessary to use this, and when not:
> >
> > - when the private state is a tied to an existing drm object (drm_crtc,
> >   drm_plane or drm_crtc) and never moves, then sufficient synchronization
> >   is already guaranteed by that superior object. This could even hold
> >   when the private object can be e.g. reassigned between planes, but
> >   always stays on the same crtc.
> >
> > - if the private state object can be globally reassigned, then
> >   drm_crtc_commit synchronization points need to be set up in
> >   ->atomic_commit_setup and waited on as the first step in
> >   ->atomic_commit_tail
>
> Does the comment added on patch 2 sufficient for you, or would you
> extend it / make it clearer?

Lol stateless reviewer. Yeah I think the text there is good, but we
probably want to make sure there's links to all the other pieces in
all the places. So maybe replace "typically in a private object" with
"tracked in a struct drm_private_obj" so we get that link. And maybe a
note to look there for additional information.

Same in the other places. In generally I think you can never have too
many links in kerneldoc, since they're both useful in the generated
html, but also for navigating the code with cscope or similar (at
least here this works splendidly).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
