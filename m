Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF296A7698
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 23:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2209510E354;
	Wed,  1 Mar 2023 22:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5547D10E34B;
 Wed,  1 Mar 2023 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677708302; x=1709244302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eBYkepXUVU7jZdkvY+k3jBNLwkK/zqgKE6EixnCAEMk=;
 b=DxlosDEy/BGLyEw2m9zKFKifLpmOkk9B7fjyZwAny9LuUrBAIKUAnDEv
 8n+ljtz86Zr5KNyjJZ961Pj3i6XJuA/iugZ1Y7ELRtrzFg95ZopB0OOkf
 C0qzYqdhjc6N6uiTm5mRoJJLpGs+Qg184iD25SKL0Yfwgplx1vY91znZ+
 4/iBamFgibM6QBUAjkbD5aIO0+30jfnfKhu+JFXqHgnjrPLVdtqR3SM0V
 cvgV4ROtCS/pPEJ0WVONB4iwHBXaaBjfRFeqUIyA4EBb/q8SnQiZ4yzgx
 6/A2AQnCS2TMgglOfBidwcWgNLdbqvWPx2Eg0xk3PvdMJMEi44a4/Sqvs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336824496"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="336824496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 14:05:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="676930892"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="676930892"
Received: from lababeix-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.45.14])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 14:04:56 -0800
Date: Wed, 1 Mar 2023 23:04:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Message-ID: <Y//MBlKu0epVr8Yh@ashyti-mobl2.lan>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
 <20230301110258.2140955-2-andi.shyti@linux.intel.com>
 <DM4PR11MB5971C15BE57E870387F7C1EA87AD9@DM4PR11MB5971.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5971C15BE57E870387F7C1EA87AD9@DM4PR11MB5971.namprd11.prod.outlook.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi@etezian.org>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I am not sure if Tiles is appropriate usage here. Since MTL does not have the concept of tiles.
> Shouldn't we be using gt instead of tile in our usage?
> 
> With s/tile/gt/g,
> Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com> 

yes, GT is preferred to tile, generally. Thanks for the review, I
will change the commit log according to your comment.

Thanks!
Andi

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Andi
> > Shyti
> > Sent: Wednesday, March 1, 2023 3:03 AM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Andi Shyti
> > <andi@etezian.org>; Patelczyk, Maciej <maciej.patelczyk@intel.com>; Andi
> > Shyti <andi.shyti@linux.intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
> > 
> > To support multi-GT configurations, we need to generate
> > independent debug files for each GT.
> > 
> > To achieve this create a separate directory for each GT under the
> > debugfs directory. For instance, in a system with two tiles, the
> > debugfs structure would look like this:
> > 
> > /sys/kernel/debug/dri
> >                   └── 0
> >                       ├── gt0
> >                       │   ├── drpc
> >                       │   ├── engines
> >                       │   ├── forcewake
> >                       │   ├── frequency
> >                       │   └── rps_boost
> >                       └── gt1
> >                       :   ├── drpc
> >                       :   ├── engines
> >                       :   ├── forcewake
> >                           ├── frequency
> >                           └── rps_boost
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 4 +++-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 2 ++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 5 ++++-
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c | 2 ++
> >  4 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > index 5fc2df01aa0df..4dc23b8d3aa2d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > @@ -83,11 +83,13 @@ static void gt_debugfs_register(struct intel_gt *gt,
> > struct dentry *root)
> >  void intel_gt_debugfs_register(struct intel_gt *gt)
> >  {
> >  	struct dentry *root;
> > +	char gtname[4];
> > 
> >  	if (!gt->i915->drm.primary->debugfs_root)
> >  		return;
> > 
> > -	root = debugfs_create_dir("gt", gt->i915->drm.primary->debugfs_root);
> > +	snprintf(gtname, sizeof(gtname), "gt%u", gt->info.id);
> > +	root = debugfs_create_dir(gtname, gt->i915->drm.primary-
> > >debugfs_root);
> >  	if (IS_ERR(root))
> >  		return;
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index bb4dfe707a7d0..e46aac1a41e6d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -42,6 +42,8 @@ struct intel_guc {
> >  	/** @capture: the error-state-capture module's data and objects */
> >  	struct intel_guc_state_capture *capture;
> > 
> > +	struct dentry *dbgfs_node;
> > +
> >  	/** @sched_engine: Global engine used to submit requests to GuC */
> >  	struct i915_sched_engine *sched_engine;
> >  	/**
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > index 195db8c9d4200..55bc8b55fbc05 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > @@ -542,8 +542,11 @@ static int guc_log_relay_create(struct intel_guc_log
> > *log)
> >  	 */
> >  	n_subbufs = 8;
> > 
> > +	if (!guc->dbgfs_node)
> > +		return -ENOENT;
> > +
> >  	guc_log_relay_chan = relay_open("guc_log",
> > -					i915->drm.primary->debugfs_root,
> > +					guc->dbgfs_node,
> >  					subbuf_size, n_subbufs,
> >  					&relay_callbacks, i915);
> >  	if (!guc_log_relay_chan) {
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> > b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> > index 284d6fbc2d08c..2f93cc4e408a8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> > @@ -54,6 +54,8 @@ void intel_uc_debugfs_register(struct intel_uc *uc, struct
> > dentry *gt_root)
> >  	if (IS_ERR(root))
> >  		return;
> > 
> > +	uc->guc.dbgfs_node = root;
> > +
> >  	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), uc);
> > 
> >  	intel_guc_debugfs_register(&uc->guc, root);
> > --
> > 2.39.1
> 
