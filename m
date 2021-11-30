Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C970463FB1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 22:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8689F75;
	Tue, 30 Nov 2021 21:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3700B6E0BE;
 Tue, 30 Nov 2021 21:08:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="299710458"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="299710458"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 13:08:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="676992720"
Received: from astamour-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.16.69])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 13:08:17 -0800
Date: Tue, 30 Nov 2021 13:07:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 2/2] drm/i915: Use to_root_gt() to refer to the root
 tile
Message-ID: <20211130210730.wbuy3znor6jel3cc@ldmartin-desk2>
References: <20211128110926.2569-1-andi.shyti@linux.intel.com>
 <20211128110926.2569-3-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211128110926.2569-3-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Michal=C5=82Winiarski?= <michal.winiarski@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 28, 2021 at 01:09:26PM +0200, Andi Shyti wrote:
>Starting from a patch from Matt to_root_gt() returns the
>reference to the root tile in order to abstract the root tile
>from th callers.
>
>Being the root tile identified as tile '0', embed the id in the
>name so that i915->gt becomes i915->gt0.
>
>The renaming has been mostly done with the following command and
>some manual fixes.
>
>sed -i -e sed -i 's/\&i915\->gt\./\&to_root_gt(i915)\->/g' \
>	-e sed -i 's/\&dev_priv\->gt\./\&to_root_gt(dev_priv)\->/g' \
>	-e 's/\&dev_priv\->gt/to_root_gt(dev_priv)/g' \
>	-e 's/\&i915\->gt/to_root_gt(i915)/g' \
>	-e 's/dev_priv\->gt\./to_root_gt(dev_priv)\->/g' \
>	-e 's/i915\->gt\./to_root_gt(i915)\->/g' \
>	`find drivers/gpu/drm/i915/ -name *.[ch]`
>
>Two small changes have been added to this commit:
>
> 1. intel_reset_gpu() in intel_display.c retreives the gt from
>    to_scanout_gt()
> 2. in set_scheduler_caps() the gt is taken from the engine and
>    not from i915.

Ideally the non-automatic changes should be in separate patches, before
the ones that can be done by automation. Because then it becomes easier
to apply the final result without conflicts.

This is quite a big diff to merge in one go. Looking at the pending
patches from Michal however I see he had similar changes, split in
sensible chunks..  Could you split your version like that? at least
gt/gem and display would be good to have separate. Or sync with Michal
on how to proceed with these versions Here are his patches:

	drm/i915: Remove i915->ggtt
	drm/i915: Use to_gt() helper for GGTT accesses
	drm/i915: Use to_gt() helper
	drm/i915/gvt: Use to_gt() helper
	drm/i915/gem: Use to_gt() helper
	drm/i915/gt: Use to_gt() helper
	drm/i915/display: Use to_gt() helper
	drm/i915: Introduce to_gt() helper

This first patch also removed the `struct intel_gt *gt = to_gt(pool)`,
that would otherwise be a leftover in drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c

thanks
Lucas De Marchi
