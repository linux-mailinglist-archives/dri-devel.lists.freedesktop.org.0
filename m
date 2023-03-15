Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8E6BAD4C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FD010E991;
	Wed, 15 Mar 2023 10:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2510E991;
 Wed, 15 Mar 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678875309; x=1710411309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rmJrMBCDLfJET/OCfZDk2lk9cUIq2z0NoHpCnWGNLN4=;
 b=KZfJYh7n9OOnoZZiDOpz+pztD8CHPNbMsCBvoUXUKXDRGaCNwAzfORhv
 Z1Hb63zA4TytKrFonkWOtGgAOMuDmLHQ2+tsSbMtSV6WscRG2nRpK5pyi
 UIoLHFK6uizuRC5cIB//V35UobXRkyYJrVHm3XPusAkNcTbMpU71/HoHg
 IrIeWffGRE/Yu7HJwrOb8pn04cGJW1pO/Xc0gtg7TrLP0f0XW8ISvf9Y8
 vHGBMdVROCuuXHwplBhuZg1hiucsiOOuRMQmscQEJLpxFMcDdggiu50um
 NwrpNMlLrt76SJaZCiwEp8+QZJpBNF7xoLa7B2fF3B88SKgwCRpZ8iwIx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="337684892"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="337684892"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709630303"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="709630303"
Received: from mchanan-mobl.ger.corp.intel.com (HELO [10.213.222.39])
 ([10.213.222.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:15:04 -0700
Message-ID: <caf1095e-8237-c79e-e0fa-27022363ffb2@linux.intel.com>
Date: Wed, 15 Mar 2023 10:15:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 30/36] drm/i915/huc: use const struct bus_type pointers
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
 <20230313182918.1312597-30-gregkh@linuxfoundation.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230313182918.1312597-30-gregkh@linuxfoundation.org>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, rafael@kernel.org,
 intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/03/2023 18:29, Greg Kroah-Hartman wrote:
> The struct bus_type pointers in the functions
> intel_huc_register_gsc_notifier() and
> intel_huc_unregister_gsc_notifier() should be a const pointer, as the
> structure is not modified anywhere in the functions, and the pointer
> they are passed will be a const * in the near future.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Note, this is a patch that is a prepatory cleanup as part of a larger
> series of patches that is working on resolving some old driver core
> design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
> its own, but I'd prefer if I could take it through my driver-core tree
> so that the driver core changes can be taken through there for 6.4-rc1.

Sounds fine to me.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 4 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 410905da8e97..8b453bd7c953 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -183,7 +183,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
>   	return 0;
>   }
>   
> -void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus)
> +void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus)
>   {
>   	int ret;
>   
> @@ -200,7 +200,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
>   	}
>   }
>   
> -void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus)
> +void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus)
>   {
>   	if (!huc->delayed_load.nb.notifier_call)
>   		return;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 52db03620c60..05d4832f8461 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -51,8 +51,8 @@ int intel_huc_check_status(struct intel_huc *huc);
>   void intel_huc_update_auth_status(struct intel_huc *huc);
>   bool intel_huc_is_authenticated(struct intel_huc *huc);
>   
> -void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
> -void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
> +void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
> +void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
>   
>   static inline int intel_huc_sanitize(struct intel_huc *huc)
>   {
