Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2736EEAC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962F26F3FB;
	Thu, 29 Apr 2021 17:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7266F3FA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:14:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so148545wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ajSsHKNDfAVymEMJqR7ymQUX9YPKW+a1e9VmpgXluJQ=;
 b=lIOzAAmYLhP0pRWITkkfcUlWWQ8LaLokYdC8+ffMWHGz4La0qdP5YYT4kknaYtlylm
 t8DmV3dNclZckq9jOlyjIR6GXHyyMso23DUPuLQNe5k+2/6RVdQM30pnhtgtd76bVNT4
 Dy2OBsNJMG/qDb6+ECgU9xQuAPwzfUgHfYljI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ajSsHKNDfAVymEMJqR7ymQUX9YPKW+a1e9VmpgXluJQ=;
 b=QVVlS41noVxMLV015rAstqdnFc6lu5MpLWJjUdTHfqjDHbxNudd0QP1uyBEFfoKGVf
 Nk2M1qsuLtktcf0jyMAmgfrArA2jvXa10zam6pcIhf/1Y5cmKe2LjiHOKeaXf0tqWONS
 AESbBBxWoNJ0ey1s1FgygiRTPMWvjn53shas8UR5cZfBzxXMQJvWdXxoEDJWCK1z4bje
 UmTR6BXrPkN/ppImP3JnBMZzgw6yYDLBnjSu+jZAji0XmyFE0rVyT8VlxUcDiWvHwEcO
 WTP0s2rWdxgIgCUyIQ9p9onLp4Lli/hzxYimyvO/L4PXk+Ukq+Kx3IBObw+nKYoKB/aD
 uSYQ==
X-Gm-Message-State: AOAM531L6plNScYV4uNYTCC8DQzt/t+qqOpUlQA9cOr7kanllT5VBpR7
 eCCz49TFKqZA66nLxC6cImybig==
X-Google-Smtp-Source: ABdhPJwblmiMexgOUPvvzUBmVsVohdyAPzQ4enULEwTvHimn0bVZntX/GEFJfixDEXzLIrkPjjT0fQ==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr11609002wmc.91.1619716475549; 
 Thu, 29 Apr 2021 10:14:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g10sm9349381wmq.25.2021.04.29.10.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:14:35 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:14:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 08/21] drm/i915/gem: Disallow bonding of virtual engines
Message-ID: <YIrpeUcEJYK6X2eO@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <CAOFGe979BEBSSw_0oqGRADHWZJAg4c=iyr3FiJB5oxno+YM+uw@mail.gmail.com>
 <YIqjhXiIuKc1Hw8r@phenom.ffwll.local>
 <CAOFGe96NnkV-ChcxU9txxOy2dnVjhKrm5Q6E=BDkQCV7cUFB-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe96NnkV-ChcxU9txxOy2dnVjhKrm5Q6E=BDkQCV7cUFB-g@mail.gmail.com>
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

On Thu, Apr 29, 2021 at 11:02:27AM -0500, Jason Ekstrand wrote:
> On Thu, Apr 29, 2021 at 7:16 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Apr 28, 2021 at 01:58:17PM -0500, Jason Ekstrand wrote:
> > > On Wed, Apr 28, 2021 at 12:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > >
> > > > On Wed, Apr 28, 2021 at 5:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, Apr 27, 2021 at 08:51:08AM -0500, Jason Ekstrand wrote:
> > > > > > I sent a v2 of this patch because it turns out I deleted a bit too
> > > > > > much code.  This function in particular, has to stay, unfortunately.
> > > > > > When a batch is submitted with a SUBMIT_FENCE, this is used to push
> > > > > > the work onto a different engine than than the one it's supposed to
> > > > > > run in parallel with.  This means we can't dead-code this function or
> > > > > > the bond_execution function pointer and related stuff.
> > > > >
> > > > > Uh that's disappointing, since if I understand your point correctly, the
> > > > > sibling engines should all be singletons, not load balancing virtual ones.
> > > > > So there really should not be any need to pick the right one at execution
> > > > > time.
> > > >
> > > > The media driver itself seems to work fine if I delete all the code.
> > > > It's just an IGT testcase that blows up.  I'll do more digging to see
> > > > if I can better isolate why.
> > >
> > > I did more digging and I figured out why this test hangs.  The test
> > > looks at an engine class where there's more than one of that class
> > > (currently only vcs) and creates a context where engine[0] is all of
> > > the engines of that class bonded together and engine[1-N] is each of
> > > those engines individually.  It then tests that you can submit a batch
> > > to one of the individual engines and then submit with
> > > EXEC_FENCE_SUBMIT to the balanced engine and the kernel will sort it
> > > out.  This doesn't seem like a use-case we care about.
> > >
> > > If we cared about anything, I would expect it to be submitting to two
> > > balanced contexts and expecting "pick any two" behavior.  But that's
> > > not what the test is testing for.
> >
> > Yeah ditch it.
> >
> > Instead make sure that the bonded setparam/ctx validation makes sure that
> > 1) no virtual engines are used
> > 2) no engine used twice
> > 3) anything else stupid you can come up with that we should make sure is
> > blocked.
> 
> I've re-introduced the deletion and I'll add nuking that test to my
> IGT series.  I did it as a separate patch as the FENCE_SUBMIT logic
> and the bonding are somewhat separate concerns.
> 
> As far as validation goes, I don't think we need any more for this
> case.  You used FENCE_SUBMIT and didn't properly isolate things such
> that the two run on different engines.  Not our problem.

Oh I just meant validating the bonded ctx extension thing. Not validating
submit fence, that's rather hopeless since it really allows anything you
can think of, by design.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
