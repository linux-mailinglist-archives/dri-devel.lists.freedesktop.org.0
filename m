Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1836EA31
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382DC6EE86;
	Thu, 29 Apr 2021 12:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660DA6EE85
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:16:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so60964wmv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t/3lBFugAZfPxScEd0M7U4gV+okH/cRVvr29rWLjXr8=;
 b=QJp3t4N0dhhh0UAq3eMbh6LhjilqWhpaDDlheFXK6lw472UxonVcST8/8meK5ZnrfP
 ophyMwrl06cAF27hbSf9zFTEzg4sfWe7AK1wVGpDBZXyqcuPLcocWFnA/8Qxs27bekIJ
 S7+DMDXny29W3vwgtoWWPaWNnq3+Sd2gRwMD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t/3lBFugAZfPxScEd0M7U4gV+okH/cRVvr29rWLjXr8=;
 b=CsEgu5MhuGa5EjPo5Jz1oyd+r4scJVkWnMlMB8PYHE6oB7AWnC+NZTutMvUg384CO/
 M9odUvdFlAvHp9USJC88ucDrbiAMjiDHzJea1c3dzI8OCjrS9yEfbmXKsJHBrQRg0Z9g
 nil2N6tknYH/8GU8vCQ4cDMYFCj4/9L4gjdUFANn+dI7Y4J2rhAR81cAoZcX1KNkvB9c
 ALL9pTjL0OM8gapJ8Rd0An1NzXJ1AZmyWMi5z4g9ddAEtnw6W0aAuhfEHAqe64h8tPXc
 RQhgKyFxWqj2felJMyu1F0OjVrwLXtxTLwk0957kaWpYn7stA7C56geOLLkAe+ylBGob
 MSlQ==
X-Gm-Message-State: AOAM532TMhLbXVyvayZIBy7tYc+MXt1MoiBrGDWPw99OTHxfvA3TEhny
 4lMBNtLh1OcBhRpLJ1VYcTDJpg==
X-Google-Smtp-Source: ABdhPJz+mfmrJ2AnYQzj8rOscVaWD6P8zUhLl/2gpnFkHf/Ml/3YHL9t3o41liu0S13zHMYzJNgong==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr12305235wmf.167.1619698568093; 
 Thu, 29 Apr 2021 05:16:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3598645wma.45.2021.04.29.05.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:16:07 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:16:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 08/21] drm/i915/gem: Disallow bonding of virtual engines
Message-ID: <YIqjhXiIuKc1Hw8r@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <CAOFGe979BEBSSw_0oqGRADHWZJAg4c=iyr3FiJB5oxno+YM+uw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe979BEBSSw_0oqGRADHWZJAg4c=iyr3FiJB5oxno+YM+uw@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 01:58:17PM -0500, Jason Ekstrand wrote:
> On Wed, Apr 28, 2021 at 12:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Wed, Apr 28, 2021 at 5:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Apr 27, 2021 at 08:51:08AM -0500, Jason Ekstrand wrote:
> > > > I sent a v2 of this patch because it turns out I deleted a bit too
> > > > much code.  This function in particular, has to stay, unfortunately.
> > > > When a batch is submitted with a SUBMIT_FENCE, this is used to push
> > > > the work onto a different engine than than the one it's supposed to
> > > > run in parallel with.  This means we can't dead-code this function or
> > > > the bond_execution function pointer and related stuff.
> > >
> > > Uh that's disappointing, since if I understand your point correctly, the
> > > sibling engines should all be singletons, not load balancing virtual ones.
> > > So there really should not be any need to pick the right one at execution
> > > time.
> >
> > The media driver itself seems to work fine if I delete all the code.
> > It's just an IGT testcase that blows up.  I'll do more digging to see
> > if I can better isolate why.
> 
> I did more digging and I figured out why this test hangs.  The test
> looks at an engine class where there's more than one of that class
> (currently only vcs) and creates a context where engine[0] is all of
> the engines of that class bonded together and engine[1-N] is each of
> those engines individually.  It then tests that you can submit a batch
> to one of the individual engines and then submit with
> EXEC_FENCE_SUBMIT to the balanced engine and the kernel will sort it
> out.  This doesn't seem like a use-case we care about.
> 
> If we cared about anything, I would expect it to be submitting to two
> balanced contexts and expecting "pick any two" behavior.  But that's
> not what the test is testing for.

Yeah ditch it.

Instead make sure that the bonded setparam/ctx validation makes sure that
1) no virtual engines are used
2) no engine used twice
3) anything else stupid you can come up with that we should make sure is
blocked.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
