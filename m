Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32B71077F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448DC10E80B;
	Thu, 25 May 2023 08:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5710E80B;
 Thu, 25 May 2023 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685003592; x=1716539592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eD8q5gLj0eiJelC5PcGJjCTwUkSnkPU1oZXcQsEa+d8=;
 b=GetT2zij82DTKtvNAF8uWHDIIOnMZKxhQhHCzagw07cxDjGEsyPhSiZx
 68eb9jtADs+kmQII1HkbqViyCnC5KFN4Gidi7jMKM1W4zT4f4rNv0IgEK
 khNxVvLMMj2czBJqgVNeQKyIS+Od8LgV2xULbsRv0LGuiqUI2KvMoEnXD
 zC7eNYisUL5J/qBcaw8kkPgQxcJuQL9+81JcbRLrZiZLBEx/KkUJ1ow1T
 d/amiOoWsHOT4aT2x2wdjKJx7imQyb7cDyk9D3566ipGDgRez8g4sT/DZ
 ICPqXoGLdrXc1ribpCBu3szk41thT0BuZO2rQGQLUJrB1EU60xyrUCMt0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440184799"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="440184799"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879022910"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="879022910"
Received: from moiraric-mobl.ger.corp.intel.com (HELO [10.213.234.103])
 ([10.213.234.103])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:33:09 -0700
Message-ID: <78124d6f-7f46-afbe-d320-9dad77082f3b@linux.intel.com>
Date: Thu, 25 May 2023 09:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230524200255.443021-1-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230524200255.443021-1-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 21:02, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This series introduce a new extension for GEM_CREATE,
> 1. end support for set caching ioctl [PATCH 1/2]
> 2. add set_pat extension for gem_create [PATCH 2/2]
> 
> v2: drop one patch that was merged separately
>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
> v3: rebased on https://patchwork.freedesktop.org/series/117082/
> v4: fix missing unlock introduced in v3, and
>      solve a rebase conflict
> v5: replace obj->cache_level with pat_set_by_user,
>      fix i915_cache_level_str() for legacy platforms.
> v6: rebased on https://patchwork.freedesktop.org/series/117480/
> v7: rebased on https://patchwork.freedesktop.org/series/117528/
> v8: dropped the two dependent patches that has been merged
>      separately. Add IGT link and Tested-by (MESA).
> v9: addressing comments (Andi)
> v10: acked-by and tested-by MESA
> v11: drop "end support for set caching ioctl" (merged)
>       remove tools/include/uapi/drm/i915_drm.h
> v12: drop Bspec reference in comment. add to commit message instead
> 
> Fei Yang (1):
>    drm/i915: Allow user to set cache at BO creation
> 
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
> 

Do you also have a Test-with: run against the new IGT somewhere?

Regards,

Tvrtko
