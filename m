Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4B7CDC84
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828A10E0DF;
	Wed, 18 Oct 2023 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC29710E0DF;
 Wed, 18 Oct 2023 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697634041; x=1729170041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lPc2zuJMiNVfsti6czd8IBCBiARsc41XEWOSVk+Sau0=;
 b=ZWyhDv3mBhAmnQ4ssI4jcrsyOxVuBnfJ4WlR1DebDVl1M377AOJHWvIG
 14OiLaPA5YaZO0xbgwIwfTIRJSLfwoE/sPUpAxnneKPXd5YlZcQ+z22Ue
 hhy+8E6ZHLmVu01khhM4rwGCkRpEy1rYzOg6qp5Dms++yDeyG3yZvlSpy
 +gdFUcEpuxUeY1X0EuEoHqVWKO922cvnIa2Rq8F9MrP/9PV36FlyWNhlo
 qPw5RW4hgqo7tUd/0yVTdQp4+eMJnXEf4TFm0nBRx5S/39jGOVfdwIMKp
 5LSfvsh68I3vEnn8iJ2xfPJJOeyeyE/UqCSDE42HQ9gu2stOvjIY4vlze g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472232542"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="472232542"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="4369992"
Received: from nurfahan-mobl3.gar.corp.intel.com (HELO intel.com)
 ([10.213.159.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:59:26 -0700
Date: Wed, 18 Oct 2023 15:00:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZS/W6obrW/g8WuS4@ashyti-mobl2.lan>
References: <20231018093815.1349-1-nirmoy.das@intel.com>
 <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
 <36c0e644-4013-f2f8-a0a7-9b9c3d8423c9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c0e644-4013-f2f8-a0a7-9b9c3d8423c9@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

> > > gen8_ggtt_invalidate() is only needed for limited set of platforms
> > > where GGTT is mapped as WC. This was added as way to fix WC based GGTT in
> > > commit 0f9b91c754b7 ("drm/i915: flush system agent TLBs on SNB") and
> > > there are no reference in HW docs that forces us to use this on non-WC
> > > backed GGTT.
> > > 
> > > This can also cause unwanted side-effects on XE_HP platforms where
> > > GFX_FLSH_CNTL_GEN6 is not valid anymore.
> > > 
> > > v2: Add a func to detect wc ggtt detection (Ville)
> > > v3: Improve commit log and add reference commit (Daniel)
> > > 
> > > Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> > I'm wondering if this is the right Fixes, though. Should this
> > rather be:
> > 
> > Fixes: 6266992cf105 ("drm/i915/gt: remove GRAPHICS_VER == 10")
> 
> Hard to find a real Fixes for this. I just want to backport this to dg2
> where we can have unwanted side-effects.

yes, this piece of code has moved around enough so to make it
diffuclt to track its origin.

I think the one I found should be the correct one, but the dg2
force probe removeal can also become a placeholder for DG2 fixes.

I won't complain.

Andi
