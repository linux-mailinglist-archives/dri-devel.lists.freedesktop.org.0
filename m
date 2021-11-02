Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732574437A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 22:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45351737F6;
	Tue,  2 Nov 2021 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70740737F6;
 Tue,  2 Nov 2021 21:08:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218276994"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="218276994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 14:08:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="500757180"
Received: from lvillalo-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.130])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 14:08:57 -0700
Date: Tue, 2 Nov 2021 22:08:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 05/10] drm/i915: Prepare for multiple gts
Message-ID: <YYGo5tfOevjL2UaV@intel.intel>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
 <20211029032817.3747750-6-matthew.d.roper@intel.com>
 <YYB0BdEcDqt2IUXi@intel.intel>
 <a1a70e75-2068-fa69-e307-456d031b25b1@linux.intel.com>
 <YYEgXz+hq8aBhmUJ@intel.intel>
 <8c2ec510-4e86-97f1-f0a9-872a2168455d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c2ec510-4e86-97f1-f0a9-872a2168455d@linux.intel.com>
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

> > > > [...]
> > > > 
> > > > >    static int
> > > > >    intel_gt_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
> > > > 
> > > > we don't actually need 'id', it's gt->info.id. It's introduced in
> > > > patch 3 with the value '0' but it's not needed.
> > > 
> > > I have a suspicion code got munged up over endless rebases and refactors.
> > > 
> > > This patch is the one which introduces the id member to gt->info. But it is not setting it, even though I suspect the intent was for intel_gt_tile_setup to do that.
> > > 
> > > Instead gt->info.id is only set to a valid value in last patch of this series inside intel_gt_probe_all:
> > > 
> > > +		gt->i915 = i915;
> > > +		gt->name = gtdef->name;
> > > +		gt->type = gtdef->type;
> > > +		gt->info.engine_mask = gtdef->engine_mask;
> > > +		gt->info.id = i;
> > > +
> > > +		drm_dbg(&i915->drm, "Setting up %s %u\n", gt->name, gt->info.id);
> > > +		ret = intel_gt_tile_setup(gt, i, phys_addr + gtdef->mapping_base);
> > > 
> > > And intel_gt_tile_setup then calls __intel_gt_init_early which assigns gt->i915 yet again.
> > > 
> > > So I'd say there is probably space to bring this all into a more streamlined flow, even more than what you suggest below.
> > 
> > yes, I noticed them!
> > 
> > Patch 3, 5 and 10 are very much connected with each other: 3
> > prepares for one tile, 5 prepares for multitile and 10 does the
> > multitile. While in between other patches are doing other things.
> > 
> > On top of some cleanups we could also rearrange the patches with
> > some squashing and reordering to have them a bit more linear and
> > also easier to review.
> 
> Yes. Maybe make intel_gt_tile_setup accept more arguments so it can be truly
> used to setup a gt?
> 
>   intel_gt_tile_setup(gt, id, name, type, engine_mask)
> 
> The usual thing where patch which adds something extends the prototype to
> include more stuff. If that applies here.
> 
> I know it is originally my patch but I don't have the time to rework it,
> much less the whole series, so usual dispensation to take over authorship if
> changes are large applies.

as no one is stepping forward, if you and Matt are OK, I can try
to venture in some refactoring of these three patches (3, 5 and
10).

Andi
