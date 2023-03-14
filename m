Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449586B9BDB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28FF10E80B;
	Tue, 14 Mar 2023 16:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907210E188;
 Tue, 14 Mar 2023 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678812086; x=1710348086;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Kavj2ZC1tyLBPrTUaz3HxM6qfeVURMkk0MyVlbxYicg=;
 b=THoyKBy975J0oUXlHFT6/h5x4hc2cJsQXvX5ShBWqAevukEVvnAOAL1O
 cXTbRLow1f0vWwqM9yDAxAVxviEMgpxvqbRTfI5wjlxEPgEQvvjSkudch
 5GMIMHOlt9NO2S7mRdJgneod8aX0coYEe6/BJLOPOP8SB3sx00uFlxfKs
 W2eWAfj61hRzQF8Af3s7cvP/hKmzaXHSJ/aEVPdM3tWSH5jVZcFghYhKw
 7czzrWUpLTP6Wto4NuU/IL3DkbujVafhDaiTxPHCV9G+amT8sjWhQOQS3
 QSB7Yni8Vwt62NDgab6YSN6g6OZEven0LejQTGaU2Fkm1uHzfLhHaCQrl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402345869"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="402345869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768163491"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="768163491"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:41:22 -0700
Date: Tue, 14 Mar 2023 18:41:18 +0200
From: Imre Deak <imre.deak@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/i915/opregion: add missing intel_opregion_cleanup()
 dummy
Message-ID: <ZBCjrsFd7PkWnBm/@ideak-desk.fi.intel.com>
References: <20230314162523.631652-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314162523.631652-1-arnd@kernel.org>
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
Reply-To: imre.deak@intel.com
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 05:25:18PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When ACPI is disabled, i915 fails to build because of a missing
> declaration:

Hi Arnd,

thanks for catching this, I sent the same after the lkp note about the
build failure:

https://lore.kernel.org/intel-gfx/3238742c-0c57-b8cf-11fe-fd4a57979049@linux.intel.com/T/#me164308b49e975efb8d760e07a5ec9f4489916b9

--Imre

> 
> drivers/gpu/drm/i915/i915_driver.c: In function 'i915_driver_hw_probe':
> drivers/gpu/drm/i915/i915_driver.c:556:9: error: implicit declaration of function 'intel_opregion_cleanup'; did you mean 'intel_opregion_setup'? [-Werror=implicit-function-declaration]
>   556 |         intel_opregion_cleanup(dev_priv);
> 
> Add another empty dummy helper next to intel_opregion_setup().
> 
> Fixes: 3e226e4a2180 ("drm/i915/opregion: Cleanup opregion after errors during driver loading")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/display/intel_opregion.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
> index 181eb3e9abbf..fd2ea8ef0fa2 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> @@ -86,6 +86,10 @@ static inline int intel_opregion_setup(struct drm_i915_private *dev_priv)
>  	return 0;
>  }
>  
> +static inline void intel_opregion_cleanup(struct drm_i915_private *i915)
> +{
> +}
> +
>  static inline void intel_opregion_register(struct drm_i915_private *dev_priv)
>  {
>  }
> -- 
> 2.39.2
> 
