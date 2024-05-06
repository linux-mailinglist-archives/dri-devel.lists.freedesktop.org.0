Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6907B8BCEB0
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9D210E540;
	Mon,  6 May 2024 13:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FRwrBzX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6083710EB35
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:04:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34f562474e8so112351f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715000658; x=1715605458; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TpY5juFC9/2h3IllLozCQclxenslAgiAvRFE52A5+lk=;
 b=FRwrBzX5nVJYNVHQFtRn9BvstcyEwqBx6x71ekAUlmzpBpwimZ5gQxA08CQWxfXXS5
 cN1CiXZkbH3KJfND8RPytpNtUadC05tz48JxwwSRRNRXWlw1klFAfDuZAIip3jrUqK5H
 dXltjmbPYRofh4zfX7OfqLEOpZpDJGUIOfCg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715000658; x=1715605458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TpY5juFC9/2h3IllLozCQclxenslAgiAvRFE52A5+lk=;
 b=tx4CWUJaCg8qjyc2Din7Rc+5EVQMK4cI0RGLlaNgdT0xB1VUwMYaqDlE4ZgVttpNrl
 iJm05Kmq+V7gYK0s8cuOYSs9UuB4hx0RLXftwTuBArJN9SUF3n/tpkzc6BnqoXYOKKok
 pZqIAk7utJe9gdCPJooZ2ewr7riuoDNllgBY+8q+xCfmoFYE6ddJCIuo9VJ8DnywyWXe
 j5Qai3AilO3ZiWzbWGp0oa9jHO1BmUrm2O7AvLXQXEbc/w/KSKLq2Csf8FdB1ApUzDG8
 TvGqjQ1lW6JTUaWt/TdbKvlyw0d0Z3ga0g67WKe8e4CMvhHcNuGb8pCOPr+mSVeJmZ9a
 3g1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX17Xfxfdd4HBzbx6gspVcvnCCBIuV0mCKN2xayDBGY6pK8NyfWqDDhUQYPhxK9SuR5wE03nZr2+heorFNFjWgIjPo86RXBUlIaVFDT0iM0
X-Gm-Message-State: AOJu0YzewK0ZOtnbm9I/VeoWuB6XocFqWLGki21/25s6YbmQtTM9zLLo
 M6/y48bm0BLAvcfftOmbDTLzcV3RzxP+d/EZ/LtZ0OTtHL3xtNNe5ss8mZ4wUerLo+TnokMWvJv
 O
X-Google-Smtp-Source: AGHT+IGOaWi7SzfgsOkS8r1Zr6sga0//V8GgtXmX5LZ0L9rBJin2PA219cnmjbThganM8Ol4XBS8fA==
X-Received: by 2002:a05:600c:46cf:b0:41a:bb50:92bb with SMTP id
 q15-20020a05600c46cf00b0041abb5092bbmr7329818wmo.0.1715000658352; 
 Mon, 06 May 2024 06:04:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d4dc6000000b0034ea98a5660sm6351227wru.54.2024.05.06.06.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:04:17 -0700 (PDT)
Date: Mon, 6 May 2024 15:04:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZjjVT-iZvsKrmoaW@phenom.ffwll.local>
References: <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
 <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw0w4fY3+fHV4kx8oGUvSM3vzH4KXKFDxg_aqBq4duSsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tw0w4fY3+fHV4kx8oGUvSM3vzH4KXKFDxg_aqBq4duSsA@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Sat, May 04, 2024 at 11:03:03AM +1000, Dave Airlie wrote:
> > Let me know if this understanding is correct.
> >
> > Or what would you like to do in such situation?
> >
> > >
> > > Not sure how it is really a good idea.
> > >
> > > Adaptive locality of memory is still an unsolved problem in Linux,
> > > sadly.
> > >
> > > > > However, the migration stuff should really not be in the driver
> > > > > either. That should be core DRM logic to manage that. It is so
> > > > > convoluted and full of policy that all the drivers should be working
> > > > > in the same way.
> > > >
> > > > Completely agreed. Moving migration infrastructures to DRM is part
> > > > of our plan. We want to first prove of concept with xekmd driver,
> > > > then move helpers, infrastructures to DRM. Driver should be as easy
> > > > as implementation a few callback functions for device specific page
> > > > table programming and device migration, and calling some DRM common
> > > > functions during gpu page fault.
> > >
> > > You'd be better to start out this way so people can look at and
> > > understand the core code on its own merits.
> >
> > The two steps way were agreed with DRM maintainers, see here:  https://lore.kernel.org/dri-devel/SA1PR11MB6991045CC69EC8E1C576A715925F2@SA1PR11MB6991.namprd11.prod.outlook.com/, bullet 4)
> 
> After this discussion and the other cross-device HMM stuff I think we
> should probably push more for common up-front, I think doing this in a
> driver without considering the bigger picture might not end up
> extractable, and then I fear the developers will just move onto other
> things due to management pressure to land features over correctness.
> 
> I think we have enough people on the list that can review this stuff,
> and even if the common code ends up being a little xe specific,
> iterating it will be easier outside the driver, as we can clearly
> demark what is inside and outside.

tldr; Yeah concurring.

I think like with the gpu vma stuff we should at least aim for the core
data structures, and more importantly, the locking design and how it
interacts with core mm services to be common code.

I read through amdkfd and I think that one is warning enough that this
area is one of these cases where going with common code aggressively is
much better. Because it will be buggy in terribly "how do we get out of
this design corner again ever?" ways no matter what. But with common code
there will at least be all of dri-devel and hopefully some mm folks
involved in sorting things out.

Most other areas it's indeed better to explore the design space with a few
drivers before going with common code, at the cost of having some really
terrible driver code in upstream. But here the cost of some really bad
design in drivers is just too expensive imo.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
