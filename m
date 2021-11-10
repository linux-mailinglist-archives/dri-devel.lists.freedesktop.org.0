Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E044C052
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 12:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685566E4CA;
	Wed, 10 Nov 2021 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304EC6E4CA;
 Wed, 10 Nov 2021 11:46:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232498285"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232498285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="470352364"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 10 Nov 2021 03:46:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 13:46:46 +0200
Date: Wed, 10 Nov 2021 13:46:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tilak Tangudu <tilak.tangudu@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/rpm: Enable runtime pm
 autosuspend by default
Message-ID: <YYuxJs0dAYvZAL3+@intel.com>
References: <20211110052926.2881092-1-tilak.tangudu@intel.com>
 <20211110052926.2881092-2-tilak.tangudu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110052926.2881092-2-tilak.tangudu@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 10:59:26AM +0530, Tilak Tangudu wrote:
> Enable runtime pm autosuspend by default for gen12 and
> later versions.
> 
> Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index eaf7688f517d..ef75f24288ef 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -600,6 +600,10 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
>  		pm_runtime_use_autosuspend(kdev);
>  	}
>  
> +	/* XXX: Enable by default only for newer platforms for now */
> +	if (GRAPHICS_VER(i915) >= 12)
> +		pm_runtime_allow(kdev);

If we change some default then we should just do it across the board.
There is nothing special about tgl+.

> +
>  	/*
>  	 * The core calls the driver load handler with an RPM reference held.
>  	 * We drop that here and will reacquire it during unloading in
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
