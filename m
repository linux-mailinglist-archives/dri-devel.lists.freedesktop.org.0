Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBC3B1B30
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7E16E8DF;
	Wed, 23 Jun 2021 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38D96E8DF;
 Wed, 23 Jun 2021 13:32:55 +0000 (UTC)
IronPort-SDR: kWOxupNWW7w9z3Zzi+2yY56gHuPYWw2fUFgf8WC05kccYMIFS/gpIKAk6yCezjk7ERMEQnRBf+
 jAGWZ0tGhADw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207302690"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207302690"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:32:54 -0700
IronPort-SDR: MZAyvz92FB+Ky5dMtmwO5aDPs3Fp7yYn718A1KBwYaxGZ8pdV6dIATjt0TI6QrXOz3ZAhKRIgs
 N2xmHZxuCvUA==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="639452806"
Received: from bkuncer-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:32:53 -0700
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <62c8a7a3-dcdd-ec6d-a976-7203e406d364@linux.intel.com>
Date: Wed, 23 Jun 2021 15:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210623112637.266855-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/21 1:26 PM, Matthew Auld wrote:
> The min_page_size is only needed for pages inserted into the GTT, and
> for our paging structures we only need at most 4K bytes, so simply
> ignore the min_page_size restrictions here, otherwise we might see some
> severe overallocation on some devices.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 084ea65d59c0..61e8a8c25374 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -16,7 +16,7 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
>   {
>   	struct drm_i915_gem_object *obj;
>   
> -	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
> +	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);

So is this memory always required to be size aligned? or should it say 
sz, PAGE_SIZE?

/Thomas


