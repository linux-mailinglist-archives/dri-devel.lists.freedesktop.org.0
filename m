Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3F6E5A22
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D209010E2F7;
	Tue, 18 Apr 2023 07:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6C810E0CA;
 Tue, 18 Apr 2023 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681801882; x=1713337882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wbJDA6ModVSKNfZcAbsVKDgTdA+Ck/fVWU83zclCYSw=;
 b=fPfjDX7Z3Kyzm9wLCkAaSxtpPG/nmDishJoQ8IVGmIirCnE4mQrpA0f8
 pJfnQntL47BgfVLjHzsUkpqINRY6tfitP3TFBgZTGwu8SMKX+XOYhB8mI
 PjNpMfX7P06ooBMGCVYottRi2DNGxA4pZNLD2QJAsQc+xpI+SpZ0RUD1Q
 Q72Ak9z7ndbWepwBsAzbUgsYP3MU30JVdvy+3ozI/2NV+7ZpBSlrh4ctm
 W4FxqNqK6dmJoS7OMLrd5rU0aYthCsxb6K0RfhctaOrOiTEUKqN+gtRZv
 1T20ic7gReHwwJWtvvraUvYYqv1rGIRy7+PxtjxnPzvM7bH5T90XfcO2V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347846158"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="347846158"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668389711"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="668389711"
Received: from ashfaqur-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.178])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:11:18 -0700
Date: Tue, 18 Apr 2023 09:10:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Provide sysfs for
 efficient freq
Message-ID: <ZD5CfXz+1CHcsfe4@ashyti-mobl2.lan>
References: <20230418000915.3489494-1-vinay.belgaumkar@intel.com>
 <ZD306iP1tDnekIn0@ashyti-mobl2.lan>
 <1b1a439b-d5ec-5079-ba35-846cae91e776@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1a439b-d5ec-5079-ba35-846cae91e776@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

On Mon, Apr 17, 2023 at 11:04:31PM -0700, Belgaumkar, Vinay wrote:
> 
> On 4/17/2023 6:39 PM, Andi Shyti wrote:
> > Hi Vinay,
> > 
> > Looks good, just few minor comments below,
> > 
> > [...]
> > 
> > > @@ -267,13 +267,11 @@ static int run_test(struct intel_gt *gt, int test_type)
> > >   	}
> > >   	/*
> > > -	 * Set min frequency to RPn so that we can test the whole
> > > -	 * range of RPn-RP0. This also turns off efficient freq
> > > -	 * usage and makes results more predictable.
> > > +	 * Turn off efficient freq so RPn/RP0 ranges are obeyed
> > >   	 */
> > > -	err = slpc_set_min_freq(slpc, slpc->min_freq);
> > > +	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
> > >   	if (err) {
> > > -		pr_err("Unable to update min freq!");
> > > +		pr_err("Unable to turn off efficient freq!");
> > drm_err()? or gt_err()? As we are here we can use a proper
> > printing.
> > 
> > How is this change related to the scope of this patch?
> The selftest was relying on setting min freq < RP1 to disable efficient
> freq, now that we have an interface, the test should use that (former method
> will not work). Should this be a separate patch?

I would have placed it in a separate patch. But I'm not strong
with it, up to you.

Thanks,
Andi
