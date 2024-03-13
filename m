Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D687A549
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994D010EA9D;
	Wed, 13 Mar 2024 09:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2CGP3/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9A410E840;
 Wed, 13 Mar 2024 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710323601; x=1741859601;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MHm9FFtBz7Eh6MOhx4kKxazsP44RUIvwo8+ERZRUVmw=;
 b=i2CGP3/za5AN29FxTCKQDSok160K3hdnzH/TpyBi9oJNTQ9Yz2Iz+Tg4
 ZmLXD6ImT/PsLRGMMmNntIV26TCC2d1O7sy2lEaXxgnXipP34U71ibNPc
 R2CBIIlyLTbbZqctgazNDIZwqul3QWGomko4cIvi51GTkHk+DYxWgsya+
 aYDH1tZTPse5mh9qcKezWd/udaRhbTq391qFe7CM2JXh4CqPakPEtbMm1
 iJpIoH7aG1LPUFmFX+XgT+7Z62bRaLLWd8skn9/HEz6LVXCAw8t4EsSn/
 vO/txO/Zcs0T4nO+uUTd2CSm1gFLc1jlGS3Zqq2/KpawbudZilLV3EEHK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5201267"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5201267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:53:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16436868"
Received: from jbakowsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:53:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Imre Deak <imre.deak@intel.com>, Nirmoy
 Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: add intel_opregion_vbt_present() stub function
In-Reply-To: <20240313084735.3305424-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240313084735.3305424-1-arnd@kernel.org>
Date: Wed, 13 Mar 2024 11:53:14 +0200
Message-ID: <87bk7isbjp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 13 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added function is not available without CONFIG_ACPI, causing
> a build failure:
>
> drivers/gpu/drm/i915/display/intel_bios.c:3424:24: error: implicit declaration of function 'intel_opregion_vbt_present'; did you mean 'intel_opregion_asle_present'? [-Werror=implicit-function-declaration]
>
> Add an empty stub in the same place as the other stubs.
>
> Fixes: 9d9bb71f3e11 ("drm/i915: Extract opregion vbt presence check")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, but just applied the identical [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20240312115757.683584-1-jani.nikula@intel.com

> ---
>  drivers/gpu/drm/i915/display/intel_opregion.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
> index 63573c38d735..4b2b8e752632 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> @@ -120,6 +120,11 @@ intel_opregion_get_edid(struct intel_connector *connector)
>  	return NULL;
>  }
>  
> +static inline bool intel_opregion_vbt_present(struct drm_i915_private *i915)
> +{
> +	return false;
> +}
> +
>  static inline const void *
>  intel_opregion_get_vbt(struct drm_i915_private *i915, size_t *size)
>  {

-- 
Jani Nikula, Intel
