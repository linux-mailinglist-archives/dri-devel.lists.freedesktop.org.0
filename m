Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C765473FC5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDFB10E676;
	Tue, 14 Dec 2021 09:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6A810E674;
 Tue, 14 Dec 2021 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639475154; x=1671011154;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=k+GztUpnafNBeCM7c+1FQlSIl9D0mH4rFNJCbdHjXZA=;
 b=c4SdffESI9yphEQgefPZzBqmUYwhqorqHhXX3xKXYKIS25jXIOCp6ecv
 Ql7jSsNhSGsOcHPHOv4qZqIy3W9WPZ+5zgpQTRELTqVgbhcIxEmfHV/gD
 G2S4lt3YxbNvpnAL6UvNAy1xgEBO/7ckgGaZGKPTSIxc67xDpyMjF+rsZ
 DpCXdnh5DIyi5fSRa/5oTJ5aD3arvqiO7CB9bgsTCdHlzE+eZBA1DpWKn
 5tTewJdKHflUCdX0JzEDfDuGvfoeXcyhiRTCfOm7FixXTc5rWXUr4r6fT
 hVrwcQkOb4x0UsnkdtVCnAEjA1+H7eyKdLj9Uye3NLzN/HtxKfFldvI8O Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219627273"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="219627273"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 01:45:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="604231479"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 01:45:52 -0800
Date: Tue, 14 Dec 2021 15:15:38 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] drm/i915: Sanity Check for device memory region
Message-ID: <20211214094538.GB31233@intel.com>
References: <20211208153404.27546-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211208153404.27546-1-ramalingam.c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On 2021-12-08 at 21:04:01 +0530, Ramalingam C wrote:
> Changes for introducing the quick test on the device memory range and
> also a test of detailed validation for each addr of the range with read
> and write.
> 
> Detailed testing is optionally enabled with a modparam i915.memtest=1
> 
> And third patch fixes the driver accessible stolen memory.
> 
> v2: Adding a wrapper for the memtest [Chris]
> v3: Handling a bisecting issue.

Thanks for the review. The changes are merged.

Ram.
> 
> Chris Wilson (3):
>   drm/i915: Exclude reserved stolen from driver use
>   drm/i915: Sanitycheck device iomem on probe
>   drm/i915: Test all device memory on probing
> 
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c |   3 +
>  drivers/gpu/drm/i915/i915_params.c         |   3 +
>  drivers/gpu/drm/i915/i915_params.h         |   1 +
>  drivers/gpu/drm/i915/intel_memory_region.c | 128 +++++++++++++++++++++
>  4 files changed, 135 insertions(+)
> 
> -- 
> 2.20.1
> 
