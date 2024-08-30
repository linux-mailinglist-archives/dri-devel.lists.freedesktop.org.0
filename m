Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30AA965E00
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 12:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FB110E91B;
	Fri, 30 Aug 2024 10:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9rR7XLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923D10E02E;
 Fri, 30 Aug 2024 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725012590; x=1756548590;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FzMa+eg/u0N2bA81VF6JqGFTQMH4Pfg9V/uEtl8jY1A=;
 b=N9rR7XLvOcPtpKVQcU9ZBVtmw+Ik177RfFDMWCXVfZyPagiIyK1S6qWq
 mrqj7VzQCLys/2WAdly7TNSzBgzen9iaUYLDk3RvXAVTZwQgGFMlWSsLB
 xzbTsRbLWWA5G9h9FShdQ1pw1HhEuY1JoX2QydLgXJZ7bu9IPeWJ/oh2u
 O5cxQo9aKUjRNs8IhKVXInEdiBJGVkrLSp4xDnXS0p876c1VoQde3hKVy
 ChMW54mJUAfIz/pvOM0CivmNVp1/ZBR8hha5G0Ce73ay4kvlKFTkNTtOo
 nKhXERLPyeBe0/eWI+5fRrY8h4QgqNyzr+swBejjlOrmkxUGVMIlzJGWH Q==;
X-CSE-ConnectionGUID: RJjtcGA7Tji3aJJW/TXrfQ==
X-CSE-MsgGUID: 3cJUEDsYRhW3rnceGTjIQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34807949"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="34807949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:09:49 -0700
X-CSE-ConnectionGUID: 67tJoTq6SES1jZ0EDqxrAg==
X-CSE-MsgGUID: 63oM2osqQhmr/2HRT7N4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64200927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.161])
 ([10.245.245.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:09:46 -0700
Message-ID: <f1ee5ce0-39dc-4c1d-a587-7326df879dee@intel.com>
Date: Fri, 30 Aug 2024 11:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Invalidate media_gt TLBs in PT code
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/08/2024 18:01, Matthew Brost wrote:
> Testing on LNL has shown media GT's TLBs need to be invalidated via the
> GuC, update PT code appropriately.
> 
> v2:
>   - Do dma_fence_get before first call of invalidation_fence_init (Himal)
>   - No need to check for valid chain fence (Himal)
> v3:
>   - Use dma-fence-array
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
