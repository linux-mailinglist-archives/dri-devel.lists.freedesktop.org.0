Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68301CA324
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 07:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CD66EA7A;
	Fri,  8 May 2020 05:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635D6EA7A;
 Fri,  8 May 2020 05:58:14 +0000 (UTC)
IronPort-SDR: ri4TXbM/fKN0NpFExXBR/gQSFhYuLW7H8v8aNHKqAo7VNwVxmiszhwwdGn5xwZOZ6B9Y4AVSki
 q1NgpRNnSmeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 22:58:14 -0700
IronPort-SDR: 5SVCFbji2owjB96pBTMnlrN5O/37HsZkaE4XJYOK1zNC4DWYhbPnQBdk2+EgdOkzPzVjlpFtqG
 UzQdWrq+8vLQ==
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="435566274"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.15.24])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 22:58:11 -0700
MIME-Version: 1.0
In-Reply-To: <CAPM=9tyhj+KNDFdw1nk0GASwfY5dwq2kAcxQ4oSHMt2BNyycVw@mail.gmail.com>
References: <20200507153600.314454-1-jason@jlekstrand.net>
 <158886626795.20858.1870213936656066157@build.alporthouse.com>
 <CAPM=9tyhj+KNDFdw1nk0GASwfY5dwq2kAcxQ4oSHMt2BNyycVw@mail.gmail.com>
Subject: Re: [PATCH] RFC: i915: Drop relocation support on Gen12+
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Dave Airlie <airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 08 May 2020 08:58:08 +0300
Message-ID: <158891748855.5249.8585589207741654136@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dave Airlie (2020-05-07 21:27:27)
> On Fri, 8 May 2020 at 01:44, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Quoting Jason Ekstrand (2020-05-07 16:36:00)
> > > The Vulkan driver in Mesa for Intel hardware never uses relocations if
> > > it's running on a version of i915 that supports at least softpin which
> > > all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12 is
> > > only supported by iris which never uses relocations.  The older i965
> > > driver in Mesa does use relocations but it only supports Intel hardware
> > > through Gen11 and has been deprecated for all hardware Gen9+. The entire
> > > relocation UAPI and related infrastructure, therefore, doesn't have any
> > > open-source userspace consumer starting with Gen12.
> > >
> > > Rejecting relocations starting with Gen12 has the benefit that we don't
> > > have to bother supporting it on platforms with local memory.  Given how
> > > much CPU touching of memory is required for relocations, not having to
> > > do so on platforms where not all memory is directly CPU-accessible
> > > carries significant advantages.
> >
> > You are not supplying them, the kernel is not checking them [as they
> > don't exist], so there is no material benefit. The only question is
> > maintainability.
> >
> > How confident are you that you will never use them and rewrite the
> > media-driver? The code exists, will be tested, and can just as easily
> > expire with the rest of execbuffer2.
> 
> From an upstream POV I say hell yes, if the hw isn't generally available yet,
> and the media-driver/intel-compute-runtime people are warned in advance,
> 
> I'm all in on ripping it out for new GENs.

There have been discussions with our media driver team about eliminating
any relocations, but today they are still being used. They have started
partially using soft-pinning, which is a great first step to that
direction.

The compute driver does not rely on relocations, they use soft-pinning
everywhere and explicitly manage the address space.

Be assured that I'm also in favor of eliminating relocations (just like
execbuffer2, userptr and couple other things), just that we still need
to have a functional stack before they can be dropped for new hardware.

Like Chris mentioned, enough optimization have been put in the code so
that there is zero impact from the relocations to the exclusively
soft-pinning drivers. So the sole benefit would be being able to drop
the relocations code in the future when the Gen11 hardware has gone
exctinct and that is a worthy goal, too.

But for now the feature is still needed for Gen12, so forcefully
disabling it is untimely.

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
