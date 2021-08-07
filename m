Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525763E367A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 19:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6953589CDF;
	Sat,  7 Aug 2021 17:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF3389CD4;
 Sat,  7 Aug 2021 17:20:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10069"; a="194110189"
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; d="scan'208";a="194110189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 10:20:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; d="scan'208";a="443741035"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 10:20:54 -0700
Date: Sat, 7 Aug 2021 17:20:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 0/4] Enable GuC submission by default on DG1
Message-ID: <20210807172053.GA108264@DUT151-ICLU.fm.intel.com>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
 <20210803172623.GA82856@DUT151-ICLU.fm.intel.com>
 <b20f28eb-9efc-3d4e-57fa-c52c255063a5@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b20f28eb-9efc-3d4e-57fa-c52c255063a5@shipmail.org>
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

On Fri, Aug 06, 2021 at 01:34:33PM +0200, Thomas Hellström (Intel) wrote:
> Hi,
> 
> On 8/3/21 7:26 PM, Matthew Brost wrote:
> > On Tue, Aug 03, 2021 at 02:15:13PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 3, 2021 at 6:53 AM Matthew Brost <matthew.brost@intel.com> wrote:
> > > > Minimum set of patches to enable GuC submission on DG1 and enable it by
> > > > default.
> > > > 
> > > > A little difficult to test as IGTs do not work with DG1 due to a bunch
> > > > of uAPI features being disabled (e.g. relocations, caching memory
> > > > options, etc...).
> > > Matt Auld has an igt series which fixes a lot of this stuff, would be
> > > good to do at least a Test-With run with that.
> > > 
> It looks like Maarten now merged Matt's series to IGT.

Great.

> 
> There is a series on IGT trybot with pending work to have some igt tests
> support relocations,
> 
> https://patchwork.freedesktop.org/series/92043/
>

Will take a look but at the moment we are blocked because SLPC won't
init on the DG1 in CI but it works just fine on all other parts I've
tried in RIL. We suspect the DG1 in CI is an early stepping and we may
be missing workarounds. Have a possible fix, just need to try it out. We
also might just want to replace the DG1 part in CI with a newer
stepping so we don't have to upstream WAs for non-shipping parts.

> One of the tests that have WIP fixes is gem_exec_whisper, and that
> particular test has historically shown occasional hangs with GuC submission
> on DG1 so it would be very desirable if we could make that test in
> particular work (I haven't verified that that's the case) reliably.
>

I just ran gem_exec_whisper on DG1, with GuC submission, and kernel
hacked to allow relocs. It passed for me. Only 1 run though so it is
possible there are still intermittent issues. We really need to get CI
up and running ASAP on all platforms where GuC submission is POR.
Perhaps on all gen11+ platforms as well because GuC submission is
supported and the more coverage we can get, the better.

> Also the following series:
> 
> https://patchwork.freedesktop.org/series/93455/

I'll check this series out too.

Matt

> 
> tries a bit harder to get some more tests running, squashing the above
> series on top of latest IGT.
> 
> Thanks,
> /Thomas
> 
> 
