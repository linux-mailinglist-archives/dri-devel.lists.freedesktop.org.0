Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14265442C7E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 12:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAD26FCAB;
	Tue,  2 Nov 2021 11:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AED6FCAB;
 Tue,  2 Nov 2021 11:26:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="254847704"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="254847704"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 04:26:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="489074553"
Received: from dcamposb-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.214.217])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 04:26:25 -0700
Date: Tue, 2 Nov 2021 12:26:23 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 05/10] drm/i915: Prepare for multiple gts
Message-ID: <YYEgXz+hq8aBhmUJ@intel.intel>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
 <20211029032817.3747750-6-matthew.d.roper@intel.com>
 <YYB0BdEcDqt2IUXi@intel.intel>
 <a1a70e75-2068-fa69-e307-456d031b25b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1a70e75-2068-fa69-e307-456d031b25b1@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > [...]
> > 
> > >   static int
> > >   intel_gt_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
> > 
> > we don't actually need 'id', it's gt->info.id. It's introduced in
> > patch 3 with the value '0' but it's not needed.
> 
> I have a suspicion code got munged up over endless rebases and refactors.
> 
> This patch is the one which introduces the id member to gt->info. But it is not setting it, even though I suspect the intent was for intel_gt_tile_setup to do that.
> 
> Instead gt->info.id is only set to a valid value in last patch of this series inside intel_gt_probe_all:
> 
> +		gt->i915 = i915;
> +		gt->name = gtdef->name;
> +		gt->type = gtdef->type;
> +		gt->info.engine_mask = gtdef->engine_mask;
> +		gt->info.id = i;
> +
> +		drm_dbg(&i915->drm, "Setting up %s %u\n", gt->name, gt->info.id);
> +		ret = intel_gt_tile_setup(gt, i, phys_addr + gtdef->mapping_base);
> 
> And intel_gt_tile_setup then calls __intel_gt_init_early which assigns gt->i915 yet again.
> 
> So I'd say there is probably space to bring this all into a more streamlined flow, even more than what you suggest below.

yes, I noticed them!

Patch 3, 5 and 10 are very much connected with each other: 3
prepares for one tile, 5 prepares for multitile and 10 does the
multitile. While in between other patches are doing other things.

On top of some cleanups we could also rearrange the patches with
some squashing and reordering to have them a bit more linear and
also easier to review.

Andi
