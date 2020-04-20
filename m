Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701B1B043A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 10:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E626E45C;
	Mon, 20 Apr 2020 08:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465638982D;
 Mon, 20 Apr 2020 08:21:49 +0000 (UTC)
IronPort-SDR: 14PXteEBDjzJTrf9pViiMTxjXkZsCESEv2fF/bVc0g1Smw3WfLvzSDukHVcv00HHwM+UVDbIXB
 MwJr3Gah9B0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:21:48 -0700
IronPort-SDR: VftcpKwtEeA3P5jAsD0qeY0JUB3b0ewMhuRIXm8KrqnlVNM9jTn3h1VsNeDUl2x/j132iy1XLW
 c5WLlUsKUUCA==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="429041855"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.46.49])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:21:45 -0700
MIME-Version: 1.0
In-Reply-To: <20200420052419.GA40250@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
 <20200414061312.GA90768@sultan-box.localdomain>
 <158685263618.16269.9317893477736764675@build.alporthouse.com>
 <20200414144309.GB2082@sultan-box.localdomain>
 <20200420052419.GA40250@sultan-box.localdomain>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 20 Apr 2020 11:21:42 +0300
Message-ID: <158737090265.8380.6644489879531344891@jlahtine-desk.ger.corp.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sultan Alsawaf (2020-04-20 08:24:19)
> Chris,
> 
> Could you please look at this in earnest? This is a real bug that crashes my
> laptop without any kind of provocation. It is undeniably a bug in i915, and I've
> clearly described it in my patch. If you dont like the patch, I'm open to any
> suggestions you have for an alternative solution. My goal here is to make i915
> better, but it's difficult when communication only goes one way.

Hi Sultan,

The patch Chris pointed out was not part of 5.4 release. The commit
message describes that it fixes the functions to be tolerant to
running simultaneously. In doing that zeroing of ring->vaddr is
removed so the test to do mdelay(1) and "ring->vaddr = NULL;" is
not correct.

I think you might have used the wrong git command for checking the
patch history:

$ git describe a266bf420060
v5.4-rc7-1996-ga266bf420060 # after -rc7 tag

$ git describe --contains a266bf420060
v5.6-rc1~34^2~21^2~326 # included in v5.6-rc1

And git log to double check:

$ git log --format=oneline kernel.org/stable/linux-5.4.y --grep="drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint"
$ git log --format=oneline kernel.org/stable/linux-5.5.y --grep="drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint"
0725d9a31869e6c80630e99da366ede2848295cc drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint
$ git log --format=oneline kernel.org/stable/linux-5.6.y --grep="drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint"
a754012b9f2323a5d640da7eb7b095ac3b8cd012 drm/i915/execlists: Leave resetting ring to intel_ring
0725d9a31869e6c80630e99da366ede2848295cc drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint
a266bf42006004306dd48a9082c35dfbff153307 drm/i915/gt: Make intel_ring_unpin() safe for concurrent pint

So it seems that the patch got pulled into v5.6 and has been backported
to v5.5 but not v5.4.

Could you try applying the patch to 5.4 and seeing if the problem
persists?

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
