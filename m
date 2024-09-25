Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A862898594A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477D710E97D;
	Wed, 25 Sep 2024 11:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="liZeqAsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670F210E977
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:52:06 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so969487966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727265125; x=1727869925; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4lwbM1moqSYfv+5qScl5Wq7j7UG25Y0knsJfD+SsF5g=;
 b=liZeqAsLCNAlAQ7ptCzECWqQOhcgGwDvBZQx/2IhzwSFMb8FJZcLzms7dSTw7VXKUf
 b+j0mAqJ05elRKfm/CS7jNToiAv5Xi5BBs5/YFnPG1jdqZ7dX7+lN3DvujS1EcBkfjOy
 UeAimZvltaq6J4HvJK8B9u+Kq4Ss57jVKNaWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727265125; x=1727869925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lwbM1moqSYfv+5qScl5Wq7j7UG25Y0knsJfD+SsF5g=;
 b=X7JKVrA71T+EVvpSIsJkxwXGaOlScvzjDHXMFFCE/M26Ajas7kHW7cF/xLudRu/Mbw
 abypX4vQpTfVPWLuf1TP8/UaGhkXZU1H9Gy/vZcSkQ2D+bM3q0Z+DFkwRDy8lWOJHy0m
 So+Bm/CXqkRpBd4dLdzrItxtyCkCpgLkwxcR0xW7wE0n0APeOwJlCr5uSYCqiDMkQwJ1
 mYxMCvC1oXD2z/GMLz7FFt7DG77cjko+slu5XkelSan5jrMgD6IcssKtw2yWU+cIbdBd
 pgwYXpEm33OggrlHPTl7hT+AYe1esXIdFs7DB3F1SvFcX6y3YFE4tsYJQY4TU0wmaZfE
 uj5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrzGqJRCcfl8gGdOsEpSdxRdoiX82n6TUb5vNoEfqyK8XtWR2YwY2CU/zWCrJ+gPAnh0QMN3PjPvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/h4JBBudce/BXjzOyd2AnzZrht5OdiD8ouMzJF2y/UAId22OF
 pcB2q6bgD7V+lLTN9ttan5kiU1bAsKQ0U2jXANNL3ENRQEeiuxuU15J2/bqFmKM=
X-Google-Smtp-Source: AGHT+IGY+tCYKuqC9/Gzg84POK/qJtUX7MhFgwGDzkBxp7Yr3Ux1fiFQ7y+XNjpJFjR0QduqUeYGSw==
X-Received: by 2002:a17:907:d581:b0:a8d:2d2e:90e6 with SMTP id
 a640c23a62f3a-a93a066fdccmr191317366b.60.1727265124707; 
 Wed, 25 Sep 2024 04:52:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7911sm204828866b.172.2024.09.25.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:52:04 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:52:02 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Tue, Sep 24, 2024 at 08:09:38AM -0700, Guenter Roeck wrote:
> On 9/24/24 06:56, Maxime Ripard wrote:
> > On Tue, Sep 24, 2024 at 06:37:59AM GMT, Guenter Roeck wrote:
> > > On 9/24/24 04:54, Maxime Ripard wrote:
> > > > +Guenter
> > > > 
> > > > On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
> > > > > On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
> > > > > > The tests consistently trigger WARNs in drm_framebuffer code. I'm not
> > > > > > sure what the point is with type of belts and suspenders tests. The
> > > > > > warnings *are* the way to flag erroneous API usage.
> > > > > > 
> > > > > > Warnings in turn trigger failures in CI. Filtering the warnings are
> > > > > > error prone, and, crucially, would also filter actual errors in case the
> > > > > > kunit tests are not run.
> > > > > > 
> > > > > > I acknowledge there may be complex test cases where you'd end up
> > > > > > triggering warnings somewhere deep, but these are not it. These are
> > > > > > simple.
> > > > > > 
> > > > > > Revert the tests, back to the drawing board.
> > > > > 
> > > > > Yeah I think long-term we might want a kunit framework so that we can
> > > > > catch dmesg warnings we expect and test for those, without those warnings
> > > > > actually going to dmesg. Similar to how the lockdep tests also reroute
> > > > > locking validation, so that the expected positive tests don't wreak
> > > > > lockdep for real.
> > > > > 
> > > > > But until that exists, we can't have tests that splat in dmesg when they
> > > > > work as intended.
> > > > 
> 
> FWIW, that is arguable. More and more tests are added which do add such splats,
> and I don't see any hesitance by developers to adding more. So far I counted
> two alone in this commit window, and that does not include new splats from
> tests which I had already disabled. I simply disable those tests or don't
> enable them in the first place if they are new. I did the same with the drm
> unit tests due to the splats generated by the scaling unit tests, so any
> additional drm unit test splats don't make a difference for me since the
> tests are already disabled.

I think for at least drm the consensus is clear, we won't have kunit tests
that splat. Personally I really don't see the point of unit tests that are
somewhere between unecessarily hard or outright too much pain to deploy in
a test rig: Either you don't run them (not great), or you filter splats
and might filter too much (not great either) or you filter as little as
possible and fight false positives (also kinda suboptimal). Especially for
unit tests this stuff must be totally rock solid.

We've had similar discussions in the past around unit tests that wasted
too much cpu time with randomized combinatorial testing, and we've thrown
those out too from drm. Test hygiene matters.

Also this means if you see this stuff in drm unit tests (or related things
like dma-buf/fence), please report or send revert.

> > > > It should be pretty soon:
> > > > https://lore.kernel.org/dri-devel/20240403131936.787234-1-linux@roeck-us.net/
> > > > 
> > > > I'm not sure what happened to that series, but it looks like everybody
> > > > was mostly happy with it?
> > > > 
> > > 
> > > Major subsystem maintainers did not provide any feedback at all, and then
> > > there came the "it is not perfect enough" feedback, so I gave up on it.
> > 
> > Well, if that means anything, we're interested even in something
> > imperfect if it solves the above case :)
> > 
> 
> Maybe someone else is interested picking it up (and no need for credits).
> I am buried in work and don't have the time (nor, frankly, much interest)
> to revive it. Also, just for reference: The patch series touches a total
> of 8 architectures, and unless I missed some I only got feedback from two
> architecture maintainers. That doesn't include arm - I don't recall if it
> doesn't need changes or if I never got there.

This is great, somehow I missed it and much appreciated for the initial
version even if you can't push it further. Hopefully one of the folks
working on drm kunit tests will pick it up, it will be needed here.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
