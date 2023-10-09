Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6537BEB26
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2910E2E3;
	Mon,  9 Oct 2023 20:02:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4B10E11A;
 Mon,  9 Oct 2023 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881773; x=1728417773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GTuv2kRinaCves6MI4W7BYJ13ER8xytThDbDIZ8joGQ=;
 b=Yb6wgrcshiKNe4NLWSPXPi0TDmCL3vB6JV5bNJKK59vfrro8yjO5VqDa
 FlrnrLfApCymadk1sgHdtIQmVqaAo7KDf6kbsvO1v8ivu+qzAXbi69ZUq
 yemiBNKJA9Or1DX8FzEJqI4q4HNHyZdzcEdN11A8RdFDiDtJhbAkb1xnd
 lunQ3mNg+HoBPYg00cOe4/h3pNVTosinENajj3fVeRyJM4szielvAO10W
 lX+SKIMjX+DWAwoUP/XFrgDSneZ7gxhTFpgCl0pvw7CfymfmhHZIJP780
 cb4AYjEdNVY0ntIyX3RQXlUKyTlepwqQo0JHzhP0uRpJsEaqgGdJRs5SR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364525220"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="364525220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084439860"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084439860"
Received: from ibrahim2-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.42.185])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:02:47 -0700
Date: Mon, 9 Oct 2023 22:02:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: More use of GT specific
 print helpers
Message-ID: <ZSRcYYZrwZ+fatQv@ashyti-mobl2.lan>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-2-John.C.Harrison@Intel.com>
 <ZSRZjS6YOrOcIEoY@ashyti-mobl2.lan>
 <5246139b-427e-4264-b21b-4562f55bbc45@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5246139b-427e-4264-b21b-4562f55bbc45@intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

...

> > >   	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
> > > -		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out of range", intf_id);
> > > +		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
> > >   		return;
> > >   	}
> > >   	if (!HAS_HECI_GSC(gt->i915)) {
> > > -		drm_warn_once(&gt->i915->drm, "GSC irq: not supported");
> > > +		gt_warn_once(gt, "GSC irq: not supported");
> > >   		return;
> > >   	}
> > > @@ -300,7 +301,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
> > >   	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
> > >   	if (ret)
> > > -		drm_err_ratelimited(&gt->i915->drm, "error handling GSC irq: %d\n", ret);
> > > +		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
> > >   }
> > >   void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> > > index 55a336a9ff061..7fdc78c79273e 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> > > @@ -16,6 +16,9 @@
> > >   #define gt_warn(_gt, _fmt, ...) \
> > >   	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> > > +#define gt_warn_once(_gt, _fmt, ...) \
> > > +	drm_warn_once(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> > > +
> > I would add the gt_warn_once() part in a different patch.
> But this is the patch that uses it. You should not add dead code. The only
> exception being if it is something large and complex that needs to be added
> in stages for ease of code review. But this really doesn't count as large or
> complex!

I wouldn't call it dead code if it's used right after... you
could also put all the *_warn_* changes in different patch.

Anyway, I don't have a strong opinion for such a straight forward
patch, so that I'm fine with it as it is:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
