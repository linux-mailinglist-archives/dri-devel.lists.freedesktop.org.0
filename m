Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BEA26F47
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452E10E316;
	Tue,  4 Feb 2025 10:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crzjgQuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E79710E315;
 Tue,  4 Feb 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738664711; x=1770200711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cU9CFBWqe8G66/6XKOMr9AJtbNBzOVz+b+envpG8uUY=;
 b=crzjgQuFvjyrRnAOn1IGQtYyGQwVCzo1ZnwhW3iZlkFsUW94bPm6azXw
 Dpj5woJ+zPu1QJfvpT3qWCumhgobCkfYkURuISe/I5TXaiqi9E60EaO05
 ecMTnLeZxykckQYU/8yXEQKeoPy97oPHC1STE7MzZKCQv6kOdxOccEDrg
 Ma4GoBZqB0BO60lRMDsNN9By7nRHtWvve+0BtaJBJLFUgBiZO6NPzjDFg
 U+8uNdXJdkL7f6QoBfoB4uszwr1q15AOhWMmSvQjmgSIIyvWxO3u+LwkJ
 JEfEWPkm8HVlHHJtcZBBGqCYkRMZZ2EcXwkpJHT4wUU3TMrXb7fY7pYaT A==;
X-CSE-ConnectionGUID: QHcwWufiRs2W2eBq87SvIQ==
X-CSE-MsgGUID: NsxK+GfIR0ScblgUAmeykw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39083506"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39083506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:25:11 -0800
X-CSE-ConnectionGUID: ywfTFjfPT3WwIvfaHWqPaw==
X-CSE-MsgGUID: rCWl4SR8QAav245iE90hmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115550566"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.129])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:25:08 -0800
Date: Tue, 4 Feb 2025 11:25:05 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
Message-ID: <Z6HrAYu-9o_9iJHe@ashyti-mobl2.lan>
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
 <Z5ekXVihQSDjxqQK@ashyti-mobl2.lan>
 <41833264-348a-443e-ba89-f559cc9114cb@intel.com>
 <Z6DEtCX-XzJE8cwm@ashyti-mobl2.lan>
 <0613d63c-d236-45e6-a610-97b6a36eee75@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0613d63c-d236-45e6-a610-97b6a36eee75@intel.com>
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

Hi,

> > Please, next time, do not remove the mailing and the other folks
> > you cc'ed.
> > 
> > I'm adding back the mailing list and Daniele who has commented
> > before.
> 
> Thanks, I also found my previous response click on "reply", not the "reply
> all".

no worries, happens :-)

> > > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
> > > > > Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> > > > > Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> > > > > Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> > > > > Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
> > > > 
> > > > There is an issue here, each fixes is introduced in different
> > > > kernel versions and they can't be mixed all together as it would
> > > > be impossible to backport them to the stable brances.
> > > > 
> > > > E.g.:
> > > > Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
> > > > Cc: <stable@vger.kernel.org> # v5.5+
> > > > 
> > > > Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> > > > Cc: <stable@vger.kernel.org> # v5.16+
> > > > 
> > > > Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> > > > Cc: <stable@vger.kernel.org> # v5.3+
> > > > 
> > > > Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> > > > Cc: <stable@vger.kernel.org> # v4.10+
> > > > 
> > > > Could you please split this patch in the four different patches
> > > > that address the four different fixes?
> > > Sure, will split it in next rev.
> > 
> > First of all we need to understand if those Fixes are really
> > needed or not. Daniele in his review has pointed out that...
> I agree with Daniele, these fixes is not needed.

yeah, with such a low reproduction rate, if it's not a
catastrofic failure the Fixes: tag is not really needed and
therefore you don't need to split the patch anymore.

Still we need to understand whether this patch really fixes the
issue.

Thanks,
Andi
