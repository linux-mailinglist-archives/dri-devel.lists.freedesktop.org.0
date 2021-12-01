Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D3464E53
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546326FB64;
	Wed,  1 Dec 2021 12:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806996FB64;
 Wed,  1 Dec 2021 12:58:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="217144618"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="217144618"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 04:58:53 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="500243037"
Received: from bagbokpo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.172])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 04:58:51 -0800
Date: Wed, 1 Dec 2021 14:58:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 2/2] drm/i915: Use to_root_gt() to refer
 to the root tile
Message-ID: <YadxiCDyw270mR1Q@intel.intel>
References: <20211128110926.2569-1-andi.shyti@linux.intel.com>
 <20211128110926.2569-3-andi.shyti@linux.intel.com>
 <20211130210730.wbuy3znor6jel3cc@ldmartin-desk2>
 <YaaohLkiuWsPSqWq@intel.intel>
 <20211201003808.isoxka2qpccetl5w@ldmartin-desk2>
 <2476fd01-b5a1-7958-45c9-2fa9a29fda9b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2476fd01-b5a1-7958-45c9-2fa9a29fda9b@intel.com>
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
Cc: =?utf-8?Q?Michal=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

> >> fist of all thanks for taking a look at this, I was eagerly
> >> waiting for reviewers.
> >>
> >> On Tue, Nov 30, 2021 at 01:07:30PM -0800, Lucas De Marchi wrote:
> >>> On Sun, Nov 28, 2021 at 01:09:26PM +0200, Andi Shyti wrote:
> >>> > Starting from a patch from Matt to_root_gt() returns the
> >>> > reference to the root tile in order to abstract the root tile
> >>> > from th callers.
> >>> >
> >>> > Being the root tile identified as tile '0', embed the id in the
> >>> > name so that i915->gt becomes i915->gt0.
> >>> >
> >>> > The renaming has been mostly done with the following command and
> >>> > some manual fixes.
> >>> >
> >>> > sed -i -e sed -i 's/\&i915\->gt\./\&to_root_gt(i915)\->/g' \
> >>> >     -e sed -i 's/\&dev_priv\->gt\./\&to_root_gt(dev_priv)\->/g' \
> >>> >     -e 's/\&dev_priv\->gt/to_root_gt(dev_priv)/g' \
> >>> >     -e 's/\&i915\->gt/to_root_gt(i915)/g' \
> >>> >     -e 's/dev_priv\->gt\./to_root_gt(dev_priv)\->/g' \
> >>> >     -e 's/i915\->gt\./to_root_gt(i915)\->/g' \
> >>> >     `find drivers/gpu/drm/i915/ -name *.[ch]`
> >>> >
> >>> > Two small changes have been added to this commit:
> >>> >
> >>> > 1. intel_reset_gpu() in intel_display.c retreives the gt from
> >>> >    to_scanout_gt()
> >>> > 2. in set_scheduler_caps() the gt is taken from the engine and
> >>> >    not from i915.
> >>>
> >>> Ideally the non-automatic changes should be in separate patches, before
> >>> the ones that can be done by automation. Because then it becomes easier
> >>> to apply the final result without conflicts.
> >>
> >> OK
> >>
> >>> This is quite a big diff to merge in one go. Looking at the pending
> >>> patches from Michal however I see he had similar changes, split in
> >>> sensible chunks..  Could you split your version like that? at least
> >>> gt/gem and display would be good to have separate. Or sync with Michal
> >>> on how to proceed with these versions Here are his patches:
> >>>
> >>>     drm/i915: Remove i915->ggtt
> >>>     drm/i915: Use to_gt() helper for GGTT accesses
> >>>     drm/i915: Use to_gt() helper
> >>>     drm/i915/gvt: Use to_gt() helper
> >>>     drm/i915/gem: Use to_gt() helper
> >>>     drm/i915/gt: Use to_gt() helper
> >>>     drm/i915/display: Use to_gt() helper
> >>>     drm/i915: Introduce to_gt() helper
> >>
> >> I understand... will follow this approach.
> >>
> >>> This first patch also removed the `struct intel_gt *gt = to_gt(pool)`,
> >>> that would otherwise be a leftover in
> >>> drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> >>
> >> One difference from Michal patch is that I am not using the
> >> wrapper
> >>
> >>  to_gt(...)
> >>
> >> but
> >>
> >>  to_root_gt(...)
> >>
> >> which was introduced by Matt. To me sounds more meaningful as it
> >> specifies that we are really looking for the root tile and not
> >> any tile.
> > 
> > yes, I think it makes sense, too.  Michal, any comment?  I think you
> > also had other plans to get the root gt by another helper... ?
> 
> The main rationale to use generic "to_gt()" helper name in all existing
> i915->gt cases in (other) Michal patches was that on some upcoming
> configs we want to distinguish between "primary" and "root" tile and use
> "to_root_gt()" helper only when referring to the root tile as described
> in Bspec:52416.
> 
> Note that since current code baseline is still "single" tile, you can't
> tell whether all of these functions really expects special "root" tile
> or just "any" tile.

this series is indeed preparatory for the multitile and making it
to_gt() now it will require to replace it with to_root_gt()
later.

The idea is that a GT is root even if it's alone. The next patch
after this will be the actual multitile.[*]

In this particular patch I am even renaming i915->gt to i915->gt0
to underline the difference.

> Thus to avoid confusion or mistakes I would suggest to keep simple name
> "to_gt()" as in most cases usages of this helper it will likely be
> replaced with iterator from for_each_gt loop and any remaining usages
> will just mean "primary" tile or replaced with explicit "to_root_gt()"
> if really needed.

Knowing what's about to come, I do not see this as a good reason
to have to_gt() as a mid step. Right?

Andi

[*] https://patchwork.freedesktop.org/patch/464475/?series=97352&rev=1
