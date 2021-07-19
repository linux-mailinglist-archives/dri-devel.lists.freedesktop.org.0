Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D53CCF7B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BBF89F6E;
	Mon, 19 Jul 2021 08:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67289F6E;
 Mon, 19 Jul 2021 08:56:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="210743360"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="210743360"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 01:56:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="631838700"
Received: from mtlovett-mobl.ger.corp.intel.com (HELO [10.213.196.244])
 ([10.213.196.244])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 01:56:01 -0700
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Call i915_globals_exit() after
 i915_pmu_exit()
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210716224758.2162003-1-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1d62696c-4864-68c4-bce5-690d575f0db7@linux.intel.com>
Date: Mon, 19 Jul 2021 09:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716224758.2162003-1-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


Noticed PMU being mentioned..

On 16/07/2021 23:47, Jason Ekstrand wrote:
> We should tear down in the opposite order we set up.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 537f9c84a427 ("drm/i915/pmu: Fix CPU hotplug with multiple GPUs")

1)
You can use 'dim fixes <sha>' to get you the correct cc list when using 
the fixes tag. But:

2)
Fixes tag looks like should be removed to avoid potential needless 
backporting since I can't see that there is any inter-dependency between 
i915_pmu_exit and i915_globals_exit, hence nothing is getting fixes 
really, just tidying of the order.

With fixes removed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/i915_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 67696d7522718..50ed93b03e582 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1244,8 +1244,8 @@ static void __exit i915_exit(void)
>   
>   	i915_perf_sysctl_unregister();
>   	pci_unregister_driver(&i915_pci_driver);
> -	i915_globals_exit();
>   	i915_pmu_exit();
> +	i915_globals_exit();
>   }
>   
>   module_init(i915_init);
> 
