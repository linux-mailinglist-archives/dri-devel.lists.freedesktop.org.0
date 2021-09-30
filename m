Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65ED41D64E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670386E3B7;
	Thu, 30 Sep 2021 09:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB636E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:26:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t8so8963970wri.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nyWAQCM8OTwxG8AtGUah8J4JArPTmx87Iul4NOLUBFU=;
 b=M4hpFo+m+hAGe35NDaiAYAc/uCb86Znr1ABugAdsBMiquZ/tGfA8aIMo6hSusAP5yf
 KBoIISi+gQuqbUkh4jZ+65kfVi67JxmaiHaXNrSsViDYFbKf5mugNcchDNAa7+dzFOTP
 wYSnn9XJQ7dZ1NWE3MX7Z8YlkRbytd3oQkf3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nyWAQCM8OTwxG8AtGUah8J4JArPTmx87Iul4NOLUBFU=;
 b=NBx3vuVTtruc1ICTAkC05q6YhaMN60dfxYLrn4bjqQAwwt6cEw9DZrIcTn9Cnb5QbU
 sW/0SxVIDQ/Z56Fae0/5yAP5erAm7NTUUoDEiXQCJ8ZQVPJ6JTvgAERMPw9gNPFdKzsY
 sgWm3yBGjPsoqTIXaXZDxTIX7AJVHx2hCviGC4AVqNsi8ie0f1UUI5b3kOk+6htJdclI
 da2svR+2kRJHgqivu641P/PRLzGt0Gx+0qUcXcmmSKGWe0jqeh7LqVKl4iSQmw80fW1N
 4vkx+cJg0J/1r1PVoPY4tKrHsZwLWgx/PqyMkHomNqVDdDWVdCYrbVrgDM1cqlq3Hsw8
 afnA==
X-Gm-Message-State: AOAM533Js/tJ3k8orQ3SJ1zRpnmgJjdOSQc9hYic08dbP5XA43KvrxWV
 Va1OQPChMiUykCFL+WQgIi+RQhQlWPdcmg==
X-Google-Smtp-Source: ABdhPJxe+MB5DFr8y/ZAxKCsJ8whCGAsRwNgPR2mbNR6jBLFUaMG9y/TtLM/KNfA32t/ouWm42Puvw==
X-Received: by 2002:adf:f207:: with SMTP id p7mr5070402wro.166.1632993974587; 
 Thu, 30 Sep 2021 02:26:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x21sm4205642wmc.14.2021.09.30.02.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:26:13 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:26:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <YVWCs3o8PNYFbFKJ@phenom.ffwll.local>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell>
 <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
 <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
 <20210923112300.0a40480d@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923112300.0a40480d@eldfell>
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

On Thu, Sep 23, 2021 at 11:23:00AM +0300, Pekka Paalanen wrote:
> On Wed, 22 Sep 2021 11:21:16 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > Hi,
> > 
> > On 9/22/21 10:56 AM, Pekka Paalanen wrote:
> > > On Tue, 14 Sep 2021 15:45:21 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > >> On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote:  
> > >>> On Wed, 8 Sep 2021 18:27:09 +0200
> > >>> Daniel Vetter <daniel@ffwll.ch> wrote:
> > >>>     
> > >>>> On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:    
> > >>>>>
> > >>>>> On Tue, 7 Sep 2021 14:42:56 +0200
> > >>>>> Hans de Goede <hdegoede@redhat.com> wrote:
> > >>>>>      
> > >>>>>> Hi,
> > >>>>>>
> > >>>>>> On 9/7/21 12:07 PM, Pekka Paalanen wrote:      
> > >>>>>>> On Fri, 3 Sep 2021 21:08:21 +0200
> > >>>>>>> Dennis Filder <d.filder@web.de> wrote:
> > >>>>>>>      
> > >>>>>>>> Hans de Goede asked me to take a topic from a private discussion here.
> > >>>>>>>> I must also preface that I'm not a graphics person and my knowledge of
> > >>>>>>>> DRI/DRM is cursory at best.
> > >>>>>>>>
> > >>>>>>>> I initiated the conversation with de Goede after learning that the X
> > >>>>>>>> server now supports being started with an open DRM file descriptor
> > >>>>>>>> (this was added for Keith Packard's xlease project).  I wondered if
> > >>>>>>>> that could be used to smoothen the Plymouth->X transition somehow and
> > >>>>>>>> asked de Goede if there were any such plans.  He denied, but mentioned
> > >>>>>>>> that a new ioctl is in the works to prevent the kernel from wiping the
> > >>>>>>>> contents of a frame buffer after a device is closed, and that this
> > >>>>>>>> would help to keep transitions smooth.      
> > >>>>>>>
> > >>>>>>> Hi,
> > >>>>>>>
> > >>>>>>> I believe the kernel is not wiping anything on device close. If
> > >>>>>>> something in the KMS state is wiped, it originates in userspace:
> > >>>>>>>
> > >>>>>>> - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
> > >>>>>>>   output off, you need to be careful to "leak" your FB if you want a
> > >>>>>>>   smooth hand-over)      
> > >>>>>>
> > >>>>>> The "kernel is not wiping anything on device close" is not true,
> > >>>>>> when closing /dev/dri/card# any remaining FBs from the app closing
> > >>>>>> it will be dealt with as if they were RmFB-ed, causing the screen
> > >>>>>> to show what I call "the fallback fb", at least with the i915 driver.      
> > >>>>>
> > >>>>> No, that's not what should happen AFAIK.
> > >>>>>
> > >>>>> True, all FBs that are not referenced by active CRTCs or planes will
> > >>>>> get freed, since their refcount drops to zero, but those CRTCs and
> > >>>>> planes that are active will remain active and therefore keep their
> > >>>>> reference to the respective FBs and so the FBs remain until replaced or
> > >>>>> turned off explicitly (by e.g. fbcon if you switch to that rather than
> > >>>>> another userspace KMS client). I believe that is the whole reason why
> > >>>>> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
> > >>>>> would not have anything to scrape.
> > >>>>>
> > >>>>> danvet, what is the DRM core intention?      
> > >>>>
> > >>>> Historical accidents mostly. There's two things that foil easy
> > >>>> handover to the next compositor:
> > >>>> - RMFB instead of CLOSEFB semantics, especially when closing the
> > >>>> drmfd. This is uapi, so anything we change needs to be opt-in    
> > >>>
> > >>> What does this mean and refer to?
> > >>>
> > >>> Are you trying to say, that closing the DRM device fd (freeing the file
> > >>> description) causes an implicit RmFB on all the FBs tied to that DRM
> > >>> device file description?
> > >>>
> > >>> I never realised that before.    
> > >>
> > >> Yes, final close does iterate over fb and do an RMFB. Which is why we've
> > >> had this discussion whether closefb semantics should be an ADDFB2 flag at
> > >> creation time instead.  
> > > 
> > > Hi Daniel,
> > > 
> > > such flag would make sense to me.  
> > 
> > Hmm, I was thinking having a separate call to mark a FB to switch to
> > closefb semantics. But both plymouth (because of end of animation)
> > and GNOME (because a mostly empty gnome-shell needs to be rendered
> > to avoid leaking privacy sensitive info) will need to prepare a
> > special FB on exit anyways, so then an ADDFB2 flag would work fine.
> > 
> > I would be happy to work on the plymouth side of this, so that we
> > have at least one consumer of such a flag lined up for merging.
> 
> Right, but I'm thinking this from the other side: why would anyone
> deliberately *want* RmFB semantics on device close?
> 
> I can't think of any, and hence I would be inclined to assume that
> userspace would just switch to using closefb semantics for everything
> all the time.
> 
> Legacy userspace is one thing, but userspace that is updated to set
> closefb semantics will also be aware of what closefb means: it leaves
> the FBs up and CRTCs and planes enabled, if you leave them like that.
> So if they don't want that, they know they should not do that.
> 
> Asking in another way: why would the same program sometimes use RmFB
> semantics and sometimes closefb semantics? Even more so, why would one
> switch an FB from one to the other?
> 
> Hmm... to prevent leaking sensitive FBs on crash, perhaps? But you can
> do that decision at AddFB2 time, right? Maybe not, as you can't really
> force EGL to allocate a new buffer at will. Oh, but when EGL gives me a
> buffer that I know is safe to leave up, I also know that it is not up
> on any KMS plane (no front buffer rendering), so I can just RmFB and
> AddFB2 again. That's a bit of a detour though.
> 
> At least a separate ioctl on an FB would be more flexible than a flag
> at AddFB2.
> 
> Btw. what happens if I try to AddFB2 the same buffer twice?

drm_fb are just refcounted metadata containers. So you could have the same
underlying gem bo wrapped in 2 addfb, one with rmfb and one with closefb
semantics. Depending which one you're using on which crtc, the crtc might
be shut off or not when you close the drmfd.

It's a bit silly, but no problem for the kernel, so I think this is all
fine.

Real use-case of multiple drm_fb for the same underlying object is stuff
like XRGB vs ARGB or different modifiers (like with compression enabled or
compression metadata not up to date).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
