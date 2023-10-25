Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1B7D6FCF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F410E68E;
	Wed, 25 Oct 2023 14:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351410E5C4;
 Wed, 25 Oct 2023 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698245639; x=1729781639;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iSRy6ZL3+KZJXUWU/0mDQYEKBgxxXobmWWaSzwQqEG4=;
 b=lzD7a8xbdYgiVGzOggALLcil8HV+ijgGz6YZxzxId1XkpOIEwD/wS7yb
 kjzhhXStjL8cYdYVPzRuc73X8HKRRI4avtvKmFJo3Oz5DxK+IeODyeVYV
 /Vp8r3zMB2C1blXwTaD8lMC5w+hk55RXlfqR6fNv7gqPU7AUftAhG9EWA
 PncwM5x6IZGpZjOnnO2jYUYPe0JJVjGCy5Ud83hzN3xXRvUjCNwL2s4ST
 q9mX6iEix6Kx4Vmj1lNXy8sjLP1t4fFlCEaff0Jax9Jibwk62//rtoMz5
 7Df4WEO4X6DhSji9RJpP7WvV4tkqPGAY++lEDEPjV7zhZufNRJ0A9m2jx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8878293"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8878293"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829245315"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="829245315"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:53:55 -0700
Date: Wed, 25 Oct 2023 16:53:52 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/5] drm/i915/guc: Create the
 guc_to_i915() wrapper
Message-ID: <ZTksAJBWT191vAEX@ashyti-mobl2.lan>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
 <20231025143515.254468-2-andi.shyti@linux.intel.com>
 <35cd748f-1944-cc0f-bbd2-b1cd04ca44f0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35cd748f-1944-cc0f-bbd2-b1cd04ca44f0@linux.intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

> > +static inline struct drm_i915_private *guc_to_i915(struct intel_guc *guc)
> > +{
> > +	return guc_to_gt(guc)->i915;
> > +}
> > +
> 
> We don't want inline functions in headers files[1]. Otherwise the series
> looks fine to me:

the reason for that patch is that we were including the
i915_drv.h just for that inline function and we were doing it
inside the gt/.

In this patch I am not changing any header dependency.

I guess the original idea from Matt was to have a generic network
of intel_gt_needs_wa_xxx(), but it didn't develop further.

> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks,
Andi
