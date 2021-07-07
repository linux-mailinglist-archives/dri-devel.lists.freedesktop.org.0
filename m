Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187893BEB9D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E0E6E043;
	Wed,  7 Jul 2021 15:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFAD6E043;
 Wed,  7 Jul 2021 15:53:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="206317064"
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="206317064"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:53:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="560311660"
Received: from spendela-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.41.163])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:53:22 -0700
Date: Wed, 7 Jul 2021 08:53:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 03/53] drm/i915: Fork DG1 interrupt handler
Message-ID: <20210707155321.7eocn3bwjz6j4www@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-4-matthew.d.roper@intel.com>
 <CAKMK7uH4+WgjJ12uYd+3Jb+0fcUtPDhy3R2HLsMQhYF1uHcMow@mail.gmail.com>
 <20210706224827.lv6sjchfl735vzkf@ldmartin-desk2>
 <CAKMK7uEEkhDzTP=AWYqM1Do_qkmS_vUiefRqPkUnuFspWD=e_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKMK7uEEkhDzTP=AWYqM1Do_qkmS_vUiefRqPkUnuFspWD=e_g@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 09:39:03AM +0200, Daniel Vetter wrote:
>On Wed, Jul 7, 2021 at 12:48 AM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>> On Fri, Jul 02, 2021 at 11:21:10AM +0200, Daniel Vetter wrote:
>> >On Thu, Jul 1, 2021 at 10:26 PM Matt Roper <matthew.d.roper@intel.com> wrote:
>> >>
>> >> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> >>
>> >> The current interrupt handler is getting increasingly complicated and
>> >> Xe_HP changes will bring even more complexity.  Let's split off a new
>> >> interrupt handler starting with DG1 (i.e., when the master tile
>> >> interrupt register was added to the design) and use that as the basis
>> >> for the new Xe_HP changes.
>> >>
>> >> Now that we track the hardware IP's release number as well as the
>> >> version number, we can also properly define DG1 has version "12.10" and
>> >> replace the has_master_unit_irq feature flag with an IP version test.
>> >>
>> >> Bspec: 50875
>> >> Cc: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
>> >> Cc: Stuart Summers <stuart.summers@intel.com>
>> >> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> >> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >
>> >So I know DG1 upstream is decidedly non-smooth, but basic
>> >infrastructure we've had since forever ...
>> >
>> >Why was this prep work not upstreamed earlier with some benign commit
>> >message that doesn't mention DG2? There's zero DG2 stuff in here, this
>> >could have landed months/years ago even. Bringing this up since right
>> >this moment we have an internal chat about trees diverging a bit much.
>>
>> history isn't linear and this commit, the way it is now, didn't exist 1
>> month ago, so your timescale is misleading. has_master_unit_irq was what
>> we thought we would need to share as much code as possible.
>>
>> The biggest reason to fork the irq handler is actually not DG1 nor DG2,
>> but XEHPSDV and without those changes it would basically be a 95% copy
>> of the gen11 handler... for someone not looking to what is in the
>> pipeline, it can be a perfect argument to "consolidate these into a
>> single handler".
>
>At least in the past we've done tons of upstream refactor prep for
>exactly just these "prep for future platform" reasons. Everyone
>understand that's necessary and generally trusts us we're not just
>moving code for fun. But then 1-2 years ago we just kinda stopped
>pushing prep work to upstream because everyone got way too busy with
>other things, and now we're paying the price.

we both know this is not the only reason and looking to the people in Cc
here my impression is you're preaching to the choir. Because the people
in Cc here either moved to other teams before there was something
working related to irq to share or continued to do prep work in upstream
as much as they can. 

Lucas De Marchi

>I mean even if the reason to fork it is a platform we can't even talk
>about, the fork patch should go upstream way ahead so that there's
>less patches in internal. Ideally platform enabling is zero code
>shuffling, 100% just plugging code into existing neat places.
>-Daniel
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
