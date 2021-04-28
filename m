Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AF36D569
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 12:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46836EB08;
	Wed, 28 Apr 2021 10:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE146EB07
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:05:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z6so1110653wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ak0GS7Zz2HK1tQiSaR6y4KZgfRU/bog+4Klh4afe48=;
 b=ih+dCK6ZRqNdbWQPJdHUu2OoeHDTHub27aa3fjKVbgXXPbZwofktN32SIM3avxTfhh
 EXFEeQU5ZLMZ2VDsx18shduQhWTFpp3cOlyt2cIZ4X66zDC6tPfIqSyRcKgj3mBktkzd
 Zfadz5s08mk6Q/wY6bRLXpH+SJS4YurJs1EZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ak0GS7Zz2HK1tQiSaR6y4KZgfRU/bog+4Klh4afe48=;
 b=lxu38J/4xNNw0QwmhVnoqYQkuuyGNq7T+bmp405co3EhfhC+oP+aFheea3IDWSzcme
 rz/fbUJ74Bmn09dGPKgOejR/4PD5dQmdoOf1sco1SGJCLjlnw1p7upyMA3+ufmJSikz0
 8fRo5HWo2CTd/663l2Ac60AhmW3W8AdoScLbdFPFx/D2tfzyczZ0ypZZ4wOkL4WA/1p9
 fwuyiBDzLtOPx1DZV3b9OmWSfs4dmGSaq1E6YTgu7HIlkP/bbs7cA+GVTadKUPHL7LOC
 eH16tkBeounogxGTcSeGrTHnalY9i+SUZiYQlmJK2pz5zeUQYmdMoTliqNZC/KkCkWaJ
 csow==
X-Gm-Message-State: AOAM531YqqNGSl6kMPXgGKA5HpVxkCrJwmqEld1ByGKYEMnad8w3bDBj
 NYNZNdred4nr6Pk3ONGh6YBabQ==
X-Google-Smtp-Source: ABdhPJwCbTin9v4kqTMiQcB75Owjm4KgJbiuVrCEjDCBeARSl9+LsgCjWMcNBqkPX0ztTde1kTDQqg==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr35496956wrh.68.1619604350391; 
 Wed, 28 Apr 2021 03:05:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j13sm9761262wrd.81.2021.04.28.03.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:05:49 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:05:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIkzewghZOdMXwfi@phenom.ffwll.local>
References: <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 02:01:20PM -0400, Alex Deucher wrote:
> On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > > > Ok. So that would only make the following use cases broken for now:
> > > >
> > > > - amd render -> external gpu
> > > > - amd video encode -> network device
> > >
> > > FWIW, "only" breaking amd render -> external gpu will make us pretty
> > > unhappy
> >
> > I concur. I have quite a few users with a multi-GPU setup involving
> > AMD hardware.
> >
> > Note, if this brokenness can't be avoided, I'd prefer a to get a clear
> > error, and not bad results on screen because nothing is synchronized
> > anymore.
> 
> It's an upcoming requirement for windows[1], so you are likely to
> start seeing this across all GPU vendors that support windows.  I
> think the timing depends on how quickly the legacy hardware support
> sticks around for each vendor.

Yeah but hw scheduling doesn't mean the hw has to be constructed to not
support isolating the ringbuffer at all.

E.g. even if the hw loses the bit to put the ringbuffer outside of the
userspace gpu vm, if you have pagetables I'm seriously hoping you have r/o
pte flags. Otherwise the entire "share address space with cpu side,
seamlessly" thing is out of the window.

And with that r/o bit on the ringbuffer you can once more force submit
through kernel space, and all the legacy dma_fence based stuff keeps
working. And we don't have to invent some horrendous userspace fence based
implicit sync mechanism in the kernel, but can instead do this transition
properly with drm_syncobj timeline explicit sync and protocol reving.

At least I think you'd have to work extra hard to create a gpu which
cannot possibly be intercepted by the kernel, even when it's designed to
support userspace direct submit only.

Or are your hw engineers more creative here and we're screwed?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
