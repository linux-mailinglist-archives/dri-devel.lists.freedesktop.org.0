Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3F4733C1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314810E83C;
	Mon, 13 Dec 2021 18:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B71A10E80F;
 Mon, 13 Dec 2021 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639419409; x=1670955409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lF3eyOacuv6NU3Y/Ctvg/p1Nfy9aDZQOQDk7w8muoHs=;
 b=iNyY43WJWsUBDy/p0wnscgOccqI2L4ptC9IJfTb4JOqbRZW1c2Kw4WJ6
 E+zMghhPMrKCmAsWwqgm8TDC2/SK1rgJk6GuAEyzVrUuj0S8aPmoceStt
 fMUmJVwCjbkt8MpWiLsgDLtOUJj6gVO6CiEJDeizUlvRzAVAYamQ0U4ci
 sLR4yXjyCRXI1zhE1rI0Q3DoRwSACrBygvHlp0IHuLGDvQnxRnuzilLjT
 kQj73mYWS4FI0tG5R3W+xL0OOqgnwtuqRgjDD4ug2jvaMVzxewd7xYWD5
 btZxTdalZJTimtkduYaHxGijcffyY3pj1vyaZ1x+TS9ign9/P/JIJD7BB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299577138"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="299577138"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:16:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="464741168"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:16:48 -0800
Date: Mon, 13 Dec 2021 10:16:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH RESEND v7 12/12] drm/i915: Move the GGTT from i915
 private data to the GT
Message-ID: <20211213181647.GK2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211212152117.118428-1-andi.shyti@linux.intel.com>
 <20211212152117.118428-13-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212152117.118428-13-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 12, 2021 at 05:21:17PM +0200, Andi Shyti wrote:
> GGTT was available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Move the GGTT from i915 to gt and use to_gt() for accesssing the
> ggtt.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
...
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 14216cc471b1..02fc7641b82e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -69,7 +69,7 @@ enum intel_submission_method {
>  struct intel_gt {
>  	struct drm_i915_private *i915;
>  	struct intel_uncore *uncore;
> -	struct i915_ggtt *ggtt;
> +	struct i915_ggtt ggtt;
>  
>  	struct intel_uc uc;
>  

I'm not sure this is the direction we want to go.  Although it works for
the initial multi-tile support, there's some other stuff coming up soon
that will require two intel_gt's to share the same ggtt rather than
each having an independent one.


Matt

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
