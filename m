Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DE377F3A
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78876E43D;
	Mon, 10 May 2021 09:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8DA6E09F;
 Mon, 10 May 2021 09:17:41 +0000 (UTC)
IronPort-SDR: 5Q/OMVQ0Z48o9SbmhUaqBe6GVxhdOJ/1GugmS7x1Hyo4mpG1RD2pE8kWJl7+PN9u6D2W1CvCVo
 F+l73GIMRT5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="260417040"
X-IronPort-AV: E=Sophos;i="5.82,286,1613462400"; d="scan'208";a="260417040"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 02:17:40 -0700
IronPort-SDR: XAyWbyjvDAdzpa53tYh5XlG8UucgMEBOTmKN61/sYNXWqMYFZxIH7RvPbXpvteE1yEQvScAa91
 RuWAqqY4eT1g==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="536313992"
Received: from agriffin-mobl1.ger.corp.intel.com (HELO [10.213.193.195])
 ([10.213.193.195])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 02:17:39 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/stolen: shuffle around
 init_memory_region
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210507095948.384230-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <41dd4d70-1bc9-c414-d0ed-e5502ef83038@linux.intel.com>
Date: Mon, 10 May 2021 10:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507095948.384230-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/05/2021 10:59, Matthew Auld wrote:
> We generally want to first call i915_gem_object_init_memory_region()
> before calling into get_pages(), since this sets up various bits of
> state which might be needed there. Currently for stolen this doesn't
> matter much, but it might in the future, and at the very least this
> makes things consistent with the other backends.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 293f640faa0a..b5553fc3ac4d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -657,9 +657,11 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
>   	if (WARN_ON(!i915_gem_object_trylock(obj)))
>   		return -EBUSY;
>   
> +	i915_gem_object_init_memory_region(obj, mem);
> +
>   	err = i915_gem_object_pin_pages(obj);
> -	if (!err)
> -		i915_gem_object_init_memory_region(obj, mem);
> +	if (err)
> +		i915_gem_object_release_memory_region(obj);
>   	i915_gem_object_unlock(obj);
>   
>   	return err;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
