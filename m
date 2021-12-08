Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386146CED1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 09:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977BC6EB7D;
	Wed,  8 Dec 2021 08:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2B36EA15;
 Wed,  8 Dec 2021 08:25:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236522367"
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="236522367"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:25:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="515669584"
Received: from amgotede-mobl1.ger.corp.intel.com (HELO [10.213.194.97])
 ([10.213.194.97])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:25:14 -0800
Message-ID: <f1acb427-efca-c58c-d0fb-f50c046ef53b@linux.intel.com>
Date: Wed, 8 Dec 2021 08:25:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: make GuC FW a requirement for
 Gen12 and beyond devices
Content-Language: en-US
To: Adrian Larumbe <adrian.larumbe@collabora.com>, daniel@ffwll.ch,
 ramalingam.c@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211207175301.321119-1-adrian.larumbe@collabora.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211207175301.321119-1-adrian.larumbe@collabora.com>
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
Cc: daniels@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/12/2021 17:53, Adrian Larumbe wrote:
> Beginning with DG2, all successive devices will require GuC FW to be
> present and loaded at probe() time. This change alters error handling in
> the FW init and load functions so that the driver's probe() function will
> fail if GuC could not be loaded.
> 
> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 20 ++++++++++++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h |  4 ++--
>   drivers/gpu/drm/i915/i915_gem.c       |  7 ++++++-
>   3 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 7660eba893fa..8b0778b6d9ab 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -277,14 +277,19 @@ static void guc_disable_communication(struct intel_guc *guc)
>   	drm_dbg(&i915->drm, "GuC communication disabled\n");
>   }
>   
> -static void __uc_fetch_firmwares(struct intel_uc *uc)
> +static int __uc_fetch_firmwares(struct intel_uc *uc)
>   {
> +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   	int err;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>   
>   	err = intel_uc_fw_fetch(&uc->guc.fw);
>   	if (err) {
> +		/* GuC is mandatory on Gen12 and beyond */
> +		if (GRAPHICS_VER(i915) >= 12)
> +			return err;
> +

Is it DG2 or Gen12, latter starts from Tigerlake?

Regards,

Tvrtko

>   		/* Make sure we transition out of transient "SELECTED" state */
>   		if (intel_uc_wants_huc(uc)) {
>   			drm_dbg(&uc_to_gt(uc)->i915->drm,
> @@ -293,11 +298,13 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
>   
> -		return;
> +		return 0;
>   	}
>   
>   	if (intel_uc_wants_huc(uc))
>   		intel_uc_fw_fetch(&uc->huc.fw);
> +
> +	return 0;
>   }
>   
>   static void __uc_cleanup_firmwares(struct intel_uc *uc)
> @@ -308,14 +315,19 @@ static void __uc_cleanup_firmwares(struct intel_uc *uc)
>   
>   static int __uc_init(struct intel_uc *uc)
>   {
> +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   	struct intel_guc *guc = &uc->guc;
>   	struct intel_huc *huc = &uc->huc;
>   	int ret;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>   
> -	if (!intel_uc_uses_guc(uc))
> -		return 0;
> +	if (!intel_uc_uses_guc(uc)) {
> +		if (GRAPHICS_VER(i915) >= 12)
> +			return -EINVAL;
> +		else
> +			return 0;
> +	}
>   
>   	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 866b462821c0..3bcd781447bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -17,7 +17,7 @@ struct intel_uc;
>   
>   struct intel_uc_ops {
>   	int (*sanitize)(struct intel_uc *uc);
> -	void (*init_fw)(struct intel_uc *uc);
> +	int (*init_fw)(struct intel_uc *uc);
>   	void (*fini_fw)(struct intel_uc *uc);
>   	int (*init)(struct intel_uc *uc);
>   	void (*fini)(struct intel_uc *uc);
> @@ -104,7 +104,7 @@ static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
>   	return _RET; \
>   }
>   intel_uc_ops_function(sanitize, sanitize, int, 0);
> -intel_uc_ops_function(fetch_firmwares, init_fw, void, );
> +intel_uc_ops_function(fetch_firmwares, init_fw, int, 0);
>   intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>   intel_uc_ops_function(init, init, int, 0);
>   intel_uc_ops_function(fini, fini, void, );
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 527228d4da7e..7f8204af6826 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1049,7 +1049,12 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	intel_uc_fetch_firmwares(&dev_priv->gt.uc);
> +	ret = intel_uc_fetch_firmwares(&dev_priv->gt.uc);
> +	if (ret) {
> +		i915_probe_error(dev_priv, "Failed to fetch firmware\n");
> +		return ret;
> +	}
> +
>   	intel_wopcm_init(&dev_priv->wopcm);
>   
>   	ret = i915_init_ggtt(dev_priv);
> 
