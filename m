Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1131CA5F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 13:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957996E1B6;
	Tue, 16 Feb 2021 12:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89146E02E;
 Tue, 16 Feb 2021 12:07:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23880339-1500050 for multiple; Tue, 16 Feb 2021 12:07:53 +0000
MIME-Version: 1.0
In-Reply-To: <SA2PR11MB5068A706257864219AF6F727AE879@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
 <161295390650.6673.18431407043692596805@build.alporthouse.com>
 <SA2PR11MB50685BFD01D8C6318437AD59AE889@SA2PR11MB5068.namprd11.prod.outlook.com>
 <161339279139.27357.6733884217281880617@build.alporthouse.com>
 <SA2PR11MB5068A706257864219AF6F727AE879@SA2PR11MB5068.namprd11.prod.outlook.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for
 corner cases
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Ram Moon,
 AnandX" <anandx.ram.moon@intel.com>, "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Tue, 16 Feb 2021 12:07:52 +0000
Message-ID: <161347727279.8311.12908365328271939168@build.alporthouse.com>
User-Agent: alot/0.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Ram Moon, AnandX (2021-02-16 12:05:23)
> Hi Chris,
> 
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Chris Wilson
> Sent: Monday, February 15, 2021 6:10 PM
> To: Auld, Matthew <matthew.auld@intel.com>; Ram Moon, AnandX <anandx.ram.moon@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for corner cases
> 
> Quoting Ram Moon, AnandX (2021-02-15 12:29:17)
> > Hi Chris,
> > 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of 
> > Chris Wilson
> > Sent: Wednesday, February 10, 2021 4:15 PM
> > To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; Jani Nikula 
> > <jani.nikula@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>; 
> > Surendrakumar Upadhyay, TejaskumarX 
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko 
> > <tvrtko.ursulin@intel.com>; dri-devel@lists.freedesktop.org; 
> > intel-gfx@lists.freedesktop.org
> > Cc: Ram Moon, AnandX <anandx.ram.moon@intel.com>
> > Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object 
> > size for corner cases
> > 
> > Quoting Anand Moon (2021-02-10 07:59:29)
> > > Add check for object size to return appropriate error -E2BIG or 
> > > -EINVAL to avoid WARM_ON and successful return for some testcase.
> > 
> > No. You miss the point of having those warnings. We need to inspect the code to remove the last remaining "int pagenum", and then we can remove the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for users, only for us to motivate us into finally fixing the code.
> > -Chris
> > 
> > Yes, I got your point these check are meant to catch up integer overflow.
> > 
> > I have check with the IGT testcase case  _gem_create_ and 
> > _gem_userptr_blits_ which fails pass size *-1ull << 32*  left shift 
> > and *0~* which leads to integer overflow ie  _negative_ size passed to create  i915_gem_create via ioctl  this leads to GM_WARN_ON.
> > 
> > Can we drop these testcase so that we don't break the kernel ?
> 
> The kernel rejects the ioctl with the expected errno. We leave a warning purely for the benefit of CI, only when compiled for debugging and not by default, so that we have a persistent reminder to do the code review.
> What's broken?
> -Chris
> 
> All though the testcase return with appropriate error we observe kernel taint see below.

Which is an intentional taint added for CI so that we get a warning and
a visible bug so that we can allocate resources to _fix_ the underlying
problems in the code.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
