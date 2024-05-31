Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4508D5D50
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8E10E047;
	Fri, 31 May 2024 08:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBw/Yiis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDEB10E047;
 Fri, 31 May 2024 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717145831; x=1748681831;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RMhOq0e80xkHIOos311ef0InQ1+OuX+zK7Yy4hvNt5I=;
 b=VBw/YiisbFl9FSKzgNr9+GyQ6MH8xst3qMt/aQjlhneoWcWSoCgoT0Qg
 HlJmfjHf+1RUFnvDjHqHS60vvbYtrkZxy4s1lsmAW/UOh8ORe0sW2/qlf
 NOzAgBNpOGPWbUr6oqI4eN8X14EIO4h0hlPJhQ8kqd2a29j9OzdNmTfPX
 8+6WeGk+Yr5TAFNDDZOto7ts0111zm4DbR6q2MOev0GIJbJ/wI6WXj0KH
 gMiloh4phzvUUATpX+3hmoQXN8AnYWB8WBFKcP0L+ITIdNHFqgLvRyvrh
 bqHndx4JlyjhQdF0dOhJlqVNzeyhVphatsot/4O0hemNAXKqVD8sxOTws g==;
X-CSE-ConnectionGUID: J2JS9qgZR9OEDchqkOV+Qw==
X-CSE-MsgGUID: zgNQsYCoTRy76JEpQ71clw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24802617"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="24802617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 01:57:10 -0700
X-CSE-ConnectionGUID: zlNN3HCQRCO/ESfZhJtDKA==
X-CSE-MsgGUID: um8Yq5J8TUGDJ2jy96E4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36583456"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 01:57:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sCy4O-0000000CQFP-07an; Fri, 31 May 2024 11:57:04 +0300
Date: Fri, 31 May 2024 11:57:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chia-I Wu <olvaffe@gmail.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
Message-ID: <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
References: <20240531053704.2009827-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531053704.2009827-1-olvaffe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
> We can skip children resources when the parent resource does not cover
> the range.
> 
> This should help vmf_insert_* users on x86, such as several DRM drivers.
> On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdgpu
> bo, the throughput goes from 5.1GB/s to 6.6GB/s.  perf report says
> 
>   34.69%--__do_fault
>   34.60%--amdgpu_gem_fault
>   34.00%--ttm_bo_vm_fault_reserved
>   32.95%--vmf_insert_pfn_prot
>   25.89%--track_pfn_insert
>   24.35%--lookup_memtype
>   21.77%--pat_pagerange_is_ram
>   20.80%--walk_system_ram_range
>   17.42%--find_next_iomem_res
> 
> before this change, and
> 
>   26.67%--__do_fault
>   26.57%--amdgpu_gem_fault
>   25.83%--ttm_bo_vm_fault_reserved
>   24.40%--vmf_insert_pfn_prot
>   14.30%--track_pfn_insert
>   12.20%--lookup_memtype
>   9.34%--pat_pagerange_is_ram
>   8.22%--walk_system_ram_range
>   5.09%--find_next_iomem_res
> 
> after.

Is there any documentation that explicitly says that the children resources
must not overlap parent's one? Do we have some test cases? (Either way they
needs to be added / expanded).

P.S> I'm not so sure about this change. It needs a thoroughly testing, esp.
in PCI case. Cc'ing to Ilpo.

-- 
With Best Regards,
Andy Shevchenko


