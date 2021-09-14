Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2E40AF79
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CDC89F06;
	Tue, 14 Sep 2021 13:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C77089F06
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:45:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m9so20361549wrb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q88PHoVb5jvhEfJnS/DCAVr7Ruy8cemNefYxYmwyLPg=;
 b=VtLFTNghM0LZuPJF89yYY0uOgmTI/iJzJV6UIhyHRpZYR1rfLWohpNmulB7/jFURw/
 fNpb5b3YzTDm/WVsPpqQGQ03HVGqsu0BXwMu6j7bxvC8mrjnATLp7oeXU5KGeWVry+6A
 3H/aC7uJEjy7ovV5YJxdZec7n4JdbIJzqZMoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q88PHoVb5jvhEfJnS/DCAVr7Ruy8cemNefYxYmwyLPg=;
 b=gjcSa2RvuxT8kl5TfGHAT73GrKmRyWcsVCvOn42NVVkjwW/2XPWsL9Tcl1JOZHjV1k
 oDb2M2KiZH1xFFlm34888Hc7ZwJjsaimCggvIx5fT62zSnuEQmusGMg+pKg+rALKLAVz
 894uUyC+gO1+oavIiVffTbmeJTU7gkwpX2bCVwlHcCaPvPMhTdeennPoArgOVz+52ylp
 O94Wb8Nkdl/HQW3Fv1X7q9dlB5JK+SdmbeU6G5zE3s7z9+PWdZo+vlofDNrYrz6CRqBX
 mvzF+9fwfQ7wftBBHuyU7mUFuTxEPSos8mdC4Q9WkJ1ZAsB9zi9O6qOF5L2+XTi/kyve
 t48g==
X-Gm-Message-State: AOAM533DMvG2XFg3m6WUoqvUxYbAMEXXkuB4O8oo9NI/0A9TCqUWHx4G
 88bDMQR1luB5RPsUiICv1lk9kg==
X-Google-Smtp-Source: ABdhPJyq3Ugx3TTf5dB/kirmHu9/SKZVJmwF+NgKj8J2HtRd4EzCe+4a5EW0VSVxBxZZhlp9UzwJOw==
X-Received: by 2002:adf:d239:: with SMTP id k25mr9868206wrh.383.1631627124049; 
 Tue, 14 Sep 2021 06:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l3sm1170307wms.4.2021.09.14.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:45:23 -0700 (PDT)
Date: Tue, 14 Sep 2021 15:45:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <YUCncex3woPlAhI6@phenom.ffwll.local>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909103703.09a573e4@eldfell>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote:
> On Wed, 8 Sep 2021 18:27:09 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Tue, 7 Sep 2021 14:42:56 +0200
> > > Hans de Goede <hdegoede@redhat.com> wrote:
> > >  
> > > > Hi,
> > > >
> > > > On 9/7/21 12:07 PM, Pekka Paalanen wrote:  
> > > > > On Fri, 3 Sep 2021 21:08:21 +0200
> > > > > Dennis Filder <d.filder@web.de> wrote:
> > > > >  
> > > > >> Hans de Goede asked me to take a topic from a private discussion here.
> > > > >> I must also preface that I'm not a graphics person and my knowledge of
> > > > >> DRI/DRM is cursory at best.
> > > > >>
> > > > >> I initiated the conversation with de Goede after learning that the X
> > > > >> server now supports being started with an open DRM file descriptor
> > > > >> (this was added for Keith Packard's xlease project).  I wondered if
> > > > >> that could be used to smoothen the Plymouth->X transition somehow and
> > > > >> asked de Goede if there were any such plans.  He denied, but mentioned
> > > > >> that a new ioctl is in the works to prevent the kernel from wiping the
> > > > >> contents of a frame buffer after a device is closed, and that this
> > > > >> would help to keep transitions smooth.  
> > > > >
> > > > > Hi,
> > > > >
> > > > > I believe the kernel is not wiping anything on device close. If
> > > > > something in the KMS state is wiped, it originates in userspace:
> > > > >
> > > > > - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
> > > > >   output off, you need to be careful to "leak" your FB if you want a
> > > > >   smooth hand-over)  
> > > >
> > > > The "kernel is not wiping anything on device close" is not true,
> > > > when closing /dev/dri/card# any remaining FBs from the app closing
> > > > it will be dealt with as if they were RmFB-ed, causing the screen
> > > > to show what I call "the fallback fb", at least with the i915 driver.  
> > >
> > > No, that's not what should happen AFAIK.
> > >
> > > True, all FBs that are not referenced by active CRTCs or planes will
> > > get freed, since their refcount drops to zero, but those CRTCs and
> > > planes that are active will remain active and therefore keep their
> > > reference to the respective FBs and so the FBs remain until replaced or
> > > turned off explicitly (by e.g. fbcon if you switch to that rather than
> > > another userspace KMS client). I believe that is the whole reason why
> > > e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
> > > would not have anything to scrape.
> > >
> > > danvet, what is the DRM core intention?  
> > 
> > Historical accidents mostly. There's two things that foil easy
> > handover to the next compositor:
> > - RMFB instead of CLOSEFB semantics, especially when closing the
> > drmfd. This is uapi, so anything we change needs to be opt-in
> 
> What does this mean and refer to?
> 
> Are you trying to say, that closing the DRM device fd (freeing the file
> description) causes an implicit RmFB on all the FBs tied to that DRM
> device file description?
> 
> I never realised that before.

Yes, final close does iterate over fb and do an RMFB. Which is why we've
had this discussion whether closefb semantics should be an ADDFB2 flag at
creation time instead.

> > - Forced fbdev restore on final close of all drm fd. This is only
> > prevented if there's a drm master left around (systemd-logind can keep
> > that instead of forcing the compositor to survive until the other has
> > taken over, which it needs to do anyway to prevent the drm master
> > handover from going sideways). This can be fixed by simply disabling
> > fbdev completely, which you really want to do anyway. Again it's uabi,
> > people will complain if we break this I think.
> 
> Do you mean that it is not enough to leave the tty in KD_GRAPHICS mode
> to stop fbcon/fbdev from taking over?

Nope. You need an open drm master.

This is because we do actually support /dev/fb clients rendering in
KD_GRAPHICS mode for backwards compat with the fbdev subsystem.

> Is it really fbdev on its own rather than fbcon (poking at fbdev) that
> will change the KMS state?
> 
> That is, it's not enough to disable fbcon?

fbcon doesn't disable fbdev, and the only way to block fbdev is to have a
drm master around.

I guess we could try and make this smarter by creating some kind of weak
master status for fbdev, but only when either fbcon or fbdev is opened.
Maybe this would help?

fbdev already keep track of this open count, so wouldn't be too onerous to
wire that up into drm_client.

The problem there is then that not yet all drivers use the drm_client
stuff for fbdev emulation, so you'd need to either convert more, or hack
up a few more things to make this consistent.

> > > Or am I confused because display servers do not tend to close the DRM
> > > device fd on switch-out but Plymouth does (too early)?  
> > 
> > Yeah, that stops both forced restore/disable from kicking in.
> 
> Which "that"?

that = open drm master. Open drm master alwasy wins agains fbdev/fbcon,
and with latest patches it's guaranteed to be race free.

> > > If so, why can't Plymouth keep the device open longer and quit only
> > > when the hand-off is complete? Not quitting too early would be a
> > > prerequisite for any explicit hand-off protocol as well.  
> > 
> > With closefb semantics and fbdev disabled plymouth could quit early,
> > and things still work.
> 
> What is "closefb semantics"?

closefb semantics = no forced plane/crtc disable, active plane keeps a
drm_fb reference

rmfb semantics = forced plane/crtc disable, the drm_fb is guaranteed to be
forcefully removed from the system

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
