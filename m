Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF994DCC6D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBBE10E6CD;
	Thu, 17 Mar 2022 17:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D820510E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:27:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h15so8328294wrc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lOa+QRnoOsA4pzJa3atRx7kwZnzbt9HWzJ/pBnPiTi8=;
 b=jrTOhMVEtk+eP54/2uOyRAEPApEjQFrVQLITvQ2RE/5uAxo10wHFDbvq/2m1L59fAg
 BrHS6oN0YrnNWM05y1AulWvg289ays9wiZ76cloxJjsoBVc5Cdm+OWJMfF6uNT6Y2MAd
 FsbmoY6DlsBy4ChpcmpcyiDyx3zYvzRSGcCDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lOa+QRnoOsA4pzJa3atRx7kwZnzbt9HWzJ/pBnPiTi8=;
 b=2/r5dTjR9IJee2iS5iWLbNfNdXNonow44f237ojXWtfIIGDOQFQQNIqlCqPzwNsI3X
 cWyn9vDGrCeFSBUQhUK55/XMTSuUylwDj0x3BY0pU1v7HX/Q5lRhC6sFeWUMD2Cih2sq
 2G9Oz9SdP4ROvmgejxeC9lDBdwd21HKFuJc+maNkIZRmoFSTbWlvJOgDNlug8XClgjhj
 /WMg732dfMa3SiRBdwiPsgHpseJIklcRQuA3oWYUwlHVZJdEkNtAlHLM3DaVotKZYxSL
 SCh+IHqeDwqNjEc+utIUREMXH4RoW03v+hfeGoIBzDbHt6uvTzn+unVI1asf5fcJopyS
 FAPQ==
X-Gm-Message-State: AOAM533ivDyD3BRaio7TMf5BDToF36rQr4Q+hKMeEu1cNaLnGXROBZIg
 LWKoEVWSyf93b5EAek6cXdxx0Q==
X-Google-Smtp-Source: ABdhPJwEMPUjSH0jE4q7W0fbREu464WEL7O2O44FxpZzT5EU+0gtfCdDslb0D/l0y3HYVjuk3H9Lcw==
X-Received: by 2002:a05:6000:18a7:b0:203:72d1:9be5 with SMTP id
 b7-20020a05600018a700b0020372d19be5mr4888757wri.325.1647538020342; 
 Thu, 17 Mar 2022 10:27:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d6648000000b00203e64e3637sm2596849wrw.89.2022.03.17.10.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 10:26:59 -0700 (PDT)
Date: Thu, 17 Mar 2022 18:26:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YjNvYmcuDKiIneDx@phenom.ffwll.local>
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 08:40:51AM -0700, Rob Clark wrote:
> On Thu, Mar 17, 2022 at 2:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian König wrote:
> > > Am 16.03.22 um 16:36 schrieb Rob Clark:
> > > > [SNIP]
> > > > just one point of clarification.. in the msm and i915 case it is
> > > > purely for debugging and telemetry (ie. sending crash logs back to
> > > > distro for analysis if user has crash reporting enabled).. it isn't
> > > > used for triggering any action like killing app or compositor.
> > >
> > > By the way, how does msm it's memory management for the devcoredumps?
> >
> > GFP_NORECLAIM all the way. It's purely best effort.
> >
> > Note that the fancy new plan for i915 discrete gpu is to only support gpu
> > crash dumps on non-recoverable gpu contexts, i.e. those that do not
> > continue to the next batch when something bad happens. This is what vk
> > wants and also what iris now uses (we do context recovery in userspace in
> > all cases), and non-recoverable contexts greatly simplify the crash dump
> > gather: Only thing you need to gather is the register state from hw
> > (before you reset it), all the batchbuffer bo and indirect state bo (in
> > i915 you can mark which bo to capture in the CS ioctl) can be captured in
> > a worker later on. Which for non-recoverable context is no issue, since
> > subsequent batchbuffers won't trample over any of these things.
> 
> fwiw, we snapshot everything (cmdstream and bo's marked with dump
> flag, in addition to hw state) before resuming the GPU, so there is no
> danger of things being trampled.  After state is captured and GPU
> reset, we "replay" the submits that were written into the ringbuffer
> after the faulting submit.  GPU crashes should be a thing you don't
> need to try to optimize.

Not sure why you think we optimize anything here?

> (At some point, I'd like to use scheduler for the replay, and actually
> use drm_sched_stop()/etc.. but last time I looked there were still
> some sched bugs in that area which prevented me from deleting a bunch
> of code ;-))

Not sure about your hw, but at least on intel replaying tends to just
result in follow-on fun. And that holds even more so the more complex a
workload is. This is why vk just dies immediately and does not try to
replay anything, offloading it to the app. Same with arb robusteness.
Afaik it's really only media and classic gl which insist that the driver
stack somehow recover.

And recovering from a mess in userspace is a lot simpler than trying to
pull of the same magic in the kernel. Plus it also helps with a few of the
dma_fence rules, which is a nice bonus.
-Daniel

> 
> BR,
> -R
> 
> >
> > And that way you can record the crashdump (or at least the big pieces like
> > all the indirect state stuff) with GFP_KERNEL.
> >
> > msm probably gets it wrong since embedded drivers have much less shrinker
> > and generally no mmu notifiers going on :-)
> >
> > > I mean it is strictly forbidden to allocate any memory in the GPU reset
> > > path.
> > >
> > > > I would however *strongly* recommend devcoredump support in other GPU
> > > > drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> > > > to debug and fix a couple obscure issues that I was not able to
> > > > reproduce by myself.
> > >
> > > Yes, completely agree as well.
> >
> > +1
> >
> > Cheers, Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
