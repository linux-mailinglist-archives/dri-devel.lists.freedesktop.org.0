Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EA4060E8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 02:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A016E948;
	Fri, 10 Sep 2021 00:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3896E946;
 Fri, 10 Sep 2021 00:22:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="220981092"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="220981092"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:21:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="581114965"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:21:57 -0700
Date: Thu, 9 Sep 2021 17:16:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915/guc: Connect the number of
 guc_ids to debugfs
Message-ID: <20210910001655.GA14694@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-4-matthew.brost@intel.com>
 <bc10d3be-2294-5fae-4055-999e61180015@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc10d3be-2294-5fae-4055-999e61180015@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 09, 2021 at 03:16:22PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > For testing purposes it may make sense to reduce the number of guc_ids
> > available to be allocated. Add debugfs support for setting the number of
> > guc_ids.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> It 'may make sense'? Is there an actual IGT/selftest test that uses this and
> needs to in order to not take several hours to run or something? Seems wrong
> to be adding a debugfs interface for something that would only be used for
> testing by internal developers who can quite easy just edit a define in the
> code to simplify their testing.
> 

Had an IGT (gem_exec_parallel) to toggle this to hit certain conditions
that are very hard to hit (guc_id exhaustion) but this was we punted
this problem to the user. Now we likely don't need that test and it is
probably ok to just drop this patch.

Matt

> John.
> 
> 
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 31 +++++++++++++++++++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 +-
> >   2 files changed, 33 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > index 887c8c8f35db..b88d343ee432 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> > @@ -71,12 +71,43 @@ static bool intel_eval_slpc_support(void *data)
> >   	return intel_guc_slpc_is_used(guc);
> >   }
> > +static int guc_num_id_get(void *data, u64 *val)
> > +{
> > +	struct intel_guc *guc = data;
> > +
> > +	if (!intel_guc_submission_is_used(guc))
> > +		return -ENODEV;
> > +
> > +	*val = guc->num_guc_ids;
> > +
> > +	return 0;
> > +}
> > +
> > +static int guc_num_id_set(void *data, u64 val)
> > +{
> > +	struct intel_guc *guc = data;
> > +
> > +	if (!intel_guc_submission_is_used(guc))
> > +		return -ENODEV;
> > +
> > +	if (val > guc->max_guc_ids)
> > +		val = guc->max_guc_ids;
> > +	else if (val < 256)
> > +		val = 256;
> > +
> > +	guc->num_guc_ids = val;
> > +
> > +	return 0;
> > +}
> > +DEFINE_SIMPLE_ATTRIBUTE(guc_num_id_fops, guc_num_id_get, guc_num_id_set, "%lld\n");
> > +
> >   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
> >   {
> >   	static const struct debugfs_gt_file files[] = {
> >   		{ "guc_info", &guc_info_fops, NULL },
> >   		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
> >   		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
> > +		{ "guc_num_id", &guc_num_id_fops, NULL },
> >   	};
> >   	if (!intel_guc_is_supported(guc))
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 8235e49bb347..68742b612692 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2716,7 +2716,8 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> >   	if (unlikely(desc_idx >= guc->max_guc_ids)) {
> >   		drm_err(&guc_to_gt(guc)->i915->drm,
> > -			"Invalid desc_idx %u", desc_idx);
> > +			"Invalid desc_idx %u, max %u",
> > +			desc_idx, guc->max_guc_ids);
> >   		return NULL;
> >   	}
> 
