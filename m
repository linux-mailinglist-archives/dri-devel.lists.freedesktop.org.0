Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A5652F48
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CBC10E44E;
	Wed, 21 Dec 2022 10:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A89310E44C;
 Wed, 21 Dec 2022 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618098; x=1703154098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DTdR7zZgooUQ0H67TXLNrHJZaw686fxX2xoXCtDae9A=;
 b=flNvSl7geLAPGke2zLd/5oGPjE7+HV7GxNPGn6v0g70WG22UD2XQtuLl
 F9d3By/sRm5gKpFJ0WZu5LkPY82f7Qx+Sw2H3WZZzhVT71KlBQvHs3nll
 UE+ryprYsCXsw5QxZd0fWYfc6+SaNjEUW2ReGfHquhExOm2+assCxLUtD
 9y+7jGzJJp45iuedINKZ1/VWjpz+q2qIJ+jx7toOSm4zsC6Qoy4ua79Qo
 Gk0MLT2P0ZKVIFHfVCV2MYBdKdoHwwORx8Lsbrk8W6nEtdZuXjGmpYVzh
 5pj+HJUBY2oJQqi7P0l0S7BXJUcsgbWiLTLrMlrF1l6Q5TH2v4z24Yj+h w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078303"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078303"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:21:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681983601"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681983601"
Received: from jorgeblx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:21:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 1/1] drm/i915/pxp: Use drm_dbg if arb
 session failed due to fw version
In-Reply-To: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
Date: Wed, 21 Dec 2022 12:21:32 +0200
Message-ID: <87zgbh12hf.fsf@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Dec 2022, Alan Previn <alan.previn.teres.alexis@intel.com> wrote:
> If PXP arb-session is being attempted on older hardware SKUs or
> on hardware with older, unsupported, firmware versions, then don't
> report the failure with a drm_error. Instead, look specifically for
> the API-version error reply and drm_dbg that reply. In this case, the
> user-space will eventually get a -ENODEV for the protected context
> creation which is the correct behavior and we don't create unnecessary
> drm_error's in our dmesg (for what is unsupported platforms).
>
> Changes from prio revs:
>    v1 : - print incorrect version from input packet, not output.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h | 1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index c2f23394f9b8..aaa8187a0afb 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -17,6 +17,7 @@
>   */
>  enum pxp_status {
>  	PXP_STATUS_SUCCESS = 0x0,
> +	PXP_STATUS_ERROR_API_VERSION = 0x1002,
>  	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>  };
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d50354bfb993..9d084ed9cc50 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -298,6 +298,11 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>  
>  	if (ret)
>  		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
> +

Superfluous newline that someone's gonna send a patch later to
remove. Easier to just not add it.

BR,
Jani.

> +	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
> +		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
> +			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
> +			msg_in.header.command_id, msg_in.header.api_version);
>  	else if (msg_out.header.status != 0x0)
>  		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
>  			 msg_out.header.status);
>
> base-commit: cc44a1e87ea6b788868878295119398966f98a81

-- 
Jani Nikula, Intel Open Source Graphics Center
