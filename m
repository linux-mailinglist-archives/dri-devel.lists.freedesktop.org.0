Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2447BEA2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 12:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53010FFA1;
	Tue, 21 Dec 2021 11:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C6010FF9F;
 Tue, 21 Dec 2021 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640085088; x=1671621088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fffHfYxhXXTwpQ8pQKTv2TJik4OsDEfjYzyLCiAmWM0=;
 b=Bk55PxR9Qo/7oAUZxrWijY59IodJHn+cZbXXujw8zZmc94xW1IEAUdUV
 w9EhOfdwBXInczQmkISRieOs8FtUInC+St7Yj5b5md4m95Rr6P9PJ/joE
 KFmT+f4VTxaDa0Mxg3fKP1E2rm+ll0vTAwAgFb3vnyu3qMJywqSXy22iN
 STgDP3V/HQOZQ616ClNky1HQmNsWYQrWwIv7KE3VtLcKli6tq/y3IC5qX
 0tpgwDv05+lp0Jm4ohalXgsYrv62pF6pN8ZRoyCVrqQK1d4eVO0wsKcQi
 4acLmEoHtkLSEZkkVYok7rbdN1BmRP55mXFGYneYiOU9ed6KE6nv1SDBD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240329563"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="240329563"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:11:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="607029686"
Received: from pjordan-mobl.ger.corp.intel.com (HELO [10.252.23.37])
 ([10.252.23.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:11:25 -0800
Message-ID: <47327eb4-cf45-0681-d56f-bc877d40a424@intel.com>
Date: Tue, 21 Dec 2021 11:11:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 1/7] drm/i915: Avoid using the i915_fence_array when
 collecting dependencies
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
 <20211217145228.10987-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211217145228.10987-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/12/2021 14:52, Thomas Hellström wrote:
> Since the gt migration code was using only a single fence for
> dependencies, these were collected in a dma_fence_array. However, it
> turns out that it's illegal to use some dma_fences in a dma_fence_array,
> in particular other dma_fence_arrays and dma_fence_chains, and this
> causes trouble for us moving forward.
> 
> Have the gt migration code instead take a const struct i915_deps for
> dependencies. This means we can skip the dma_fence_array creation
> and instead pass the struct i915_deps instead to circumvent the
> problem.
> 
> v2:
> - Make the prev_deps() function static. (kernel test robot <lkp@intel.com>)
> - Update the struct i915_deps kerneldoc.
> 
> Fixes: 5652df829b3c ("drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be asynchronous")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
