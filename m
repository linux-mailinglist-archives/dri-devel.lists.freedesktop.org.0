Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F3458FAD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534F6E14C;
	Mon, 22 Nov 2021 13:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2376E14F;
 Mon, 22 Nov 2021 13:47:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="295595544"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="295595544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:47:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="674065992"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:47:32 -0800
Date: Mon, 22 Nov 2021 19:18:17 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Tilak Tangudu <tilak.tangudu@intel.com>
Subject: Re: [PATCH v3] drm/i915/rpm: Enable runtime pm autosuspend by default
Message-ID: <20211122134816.GA30494@intel.com>
References: <20211116155238.3226516-1-tilak.tangudu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211116155238.3226516-1-tilak.tangudu@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: ville.syrjala@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jon.ewins@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-16 at 21:22:38 +0530, Tilak Tangudu wrote:
> v1: Enable runtime pm autosuspend by default for Gen12
> and later versions.
> 
> v2: Enable runtime pm autosuspend by default for all
> platforms(Syrjala Ville)
> 
> v3: Change commit message(Nikula Jani)
It would require to reorder the commit log, version log
need to move after commit message.
Thanks,
Anshuman.
> Let's enable runtime pm autosuspend by default everywhere.
> So, we can allow D3hot and bigger power savings on idle scenarios.
> 
> But at this time let's not touch the autosuspend_delay time,
> what caused some regression on our previous attempt.
> 
> Also, the latest identified issue on GuC PM has been fixed by
> commit 1a52faed3131 ("drm/i915/guc: Take GT PM ref when deregistering
> context")
> 
> Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 0d85f3c5c526..22dab36afcb6 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -590,6 +590,9 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
>  		pm_runtime_use_autosuspend(kdev);
>  	}
>  
> +	/* Enable by default */
> +	pm_runtime_allow(kdev);
> +
>  	/*
>  	 * The core calls the driver load handler with an RPM reference held.
>  	 * We drop that here and will reacquire it during unloading in
> -- 
> 2.25.1
> 
