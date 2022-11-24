Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF99637502
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278F910E6BD;
	Thu, 24 Nov 2022 09:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF60A10E6D7;
 Thu, 24 Nov 2022 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669281632; x=1700817632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j2nWagqxkQh8mJJLXXa1TjyjbspCWouq0kbFW7L0tN4=;
 b=JP4Oz+5FS+dZ1Y9yZUAEJ7qLBO+oRvagVOAD8n15km5TWIjymB/atS4i
 OUp6tVRxDiuEDgEZMaFzZ0CeWBJ/Vfiu0KYtX1ArzU7A9UWXMPxPOHBqJ
 cq7qM2gPFxqxjTcOqw+7N65yCZ9Q/63E5f0lDQD8uzRsXNcmtT8yo46S3
 EW9cg72mZBo2eE8qXIVCZhs0bTwUO5HBU6xmFT+OOlcGE1mlO+UNYIJGw
 46ujWkwqK0LIRTqfMW6GE0vn4RskC1LJax8EyJKAUDi+4EocNZCUT3sRz
 6YAAMCWoAojPm3l56NV9o3Hd/enzTmtK5B4e4gGAqAsYBMDy+rkDMwxzZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="294646181"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="294646181"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 01:20:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="592847100"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="592847100"
Received: from schardon-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 01:20:28 -0800
Date: Thu, 24 Nov 2022 10:20:26 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915: Introduce guard pages to
 i915_vma
Message-ID: <Y383WsBu5csVpi+w@ashyti-mobl2.lan>
References: <20221122185737.96459-1-andi.shyti@linux.intel.com>
 <20221122185737.96459-3-andi.shyti@linux.intel.com>
 <a579e9a5-0bd4-d439-3193-64dc52e05997@linux.intel.com>
 <Y35sXXLiAmwulDRU@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35sXXLiAmwulDRU@ashyti-mobl2.lan>
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
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > @@ -768,6 +768,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> > >   	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
> > >   	GEM_BUG_ON(!is_power_of_2(alignment));
> > > +	guard = vma->guard; /* retain guard across rebinds */
> > > +	guard = ALIGN(guard, alignment);
> > 
> > Why does guard area needs the same alignment as the requested mapping? What about the fact on 32-bit builds guard is 32-bit and alignment u64?
> 
> I guess this just to round up/down guard to something, not
> necessarily to that alignment.
> 
> Shall I remove it?

or we could just add a comment to explain that this is just to do
some rounding in order to avoid weird values of guard.

Andi
