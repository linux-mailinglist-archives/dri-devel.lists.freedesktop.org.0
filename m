Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D085BEDC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ABC10E47E;
	Tue, 20 Feb 2024 14:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtQIJzBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B7010E47B;
 Tue, 20 Feb 2024 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708439672; x=1739975672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f3O+4m4HaBjm0z8H1sKrXMCClwRO1cpcmSYTOrXl0eA=;
 b=TtQIJzBn/3+ppWHf9ANqUUSV9IbyLXqMyy3JnVZUG/DosRsuxhpoGGQH
 L2Tl8a4wa2WAZvdNprBquJyA5I4r8Zg+DmEtqpIqs0Y7sCckiH++7edzF
 QF3w4ltU8dbeEOi5XJdkhy7mj23lWqAyLVxsBqfyLmsAcm0XEkYpn+Hu7
 O7fagSgqwWVkcv8RwxzNYaJ062R5rVV1jB5aKo1xI2aQOk2VwnpJR6Tt7
 8TCdm9oOvAi7eEC+zMFEIFFHA0Odd6XgYYBkDxZbEnoCyjNoMzQyJxHR7
 Jo4geIG8qvPWLUhGykRgWlEtXCKg20pzZn8mFAf3HgvcAOoxxBTSPWO5n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2684590"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2684590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4756361"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:34:29 -0800
Date: Tue, 20 Feb 2024 15:34:26 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 0/2] Disable automatic load CCS load balancing
Message-ID: <ZdS4clVznjgskl1d@ashyti-mobl2.lan>
References: <20240220142034.257370-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220142034.257370-1-andi.shyti@linux.intel.com>
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

Please, ignore, I sent V1 again.

Sorry about the noise!

Andi

On Tue, Feb 20, 2024 at 03:20:32PM +0100, Andi Shyti wrote:
> Hi,
> 
> this series does basically two things:
> 
> 1. Disables automatic load balancing as adviced by the hardware
>    workaround.
> 
> 2. Forces the sharing of the load submitted to CCS among all the
>    CCS available (as of now only DG2 has more than one CCS). This
>    way the user, when sending a query, will see only one CCS
>    available.
> 
> Andi
> 
> Andi Shyti (2):
>   drm/i915/gt: Disable HW load balancing for CCS
>   drm/i915/gt: Set default CCS mode '1'
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 +++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  6 ++++++
>  drivers/gpu/drm/i915/i915_drv.h             | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/i915_query.c           |  5 +++--
>  5 files changed, 40 insertions(+), 2 deletions(-)
> 
> -- 
> 2.43.0
