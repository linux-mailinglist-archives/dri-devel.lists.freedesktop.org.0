Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D93D583B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 13:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323C16EB6D;
	Mon, 26 Jul 2021 11:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C916E28A;
 Mon, 26 Jul 2021 11:06:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="209093596"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="209093596"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:06:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="661812683"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:06:28 -0700
Date: Mon, 26 Jul 2021 07:06:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 10/30] drm/i915/display: remove explicit CNL
 handling from intel_dmc.c
Message-ID: <YP6XM9STx7oRQQIE@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-11-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-11-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:54PM -0700, Lucas De Marchi wrote:
> Remove DMC firmware for CNL.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>

We need to remove the binary from linux-firmware.git as well

> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 9895fd957df9..3c3c6cb5c0df 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -70,11 +70,6 @@ MODULE_FIRMWARE(TGL_DMC_PATH);
>  #define ICL_DMC_MAX_FW_SIZE		0x6000
>  MODULE_FIRMWARE(ICL_DMC_PATH);
>  
> -#define CNL_DMC_PATH			DMC_PATH(cnl, 1, 07)
> -#define CNL_DMC_VERSION_REQUIRED	DMC_VERSION(1, 7)
> -#define CNL_DMC_MAX_FW_SIZE		GLK_DMC_MAX_FW_SIZE
> -MODULE_FIRMWARE(CNL_DMC_PATH);
> -
>  #define GLK_DMC_PATH			DMC_PATH(glk, 1, 04)
>  #define GLK_DMC_VERSION_REQUIRED	DMC_VERSION(1, 4)
>  #define GLK_DMC_MAX_FW_SIZE		0x4000
> @@ -718,10 +713,6 @@ void intel_dmc_ucode_init(struct drm_i915_private *dev_priv)
>  		dmc->fw_path = ICL_DMC_PATH;
>  		dmc->required_version = ICL_DMC_VERSION_REQUIRED;
>  		dmc->max_fw_size = ICL_DMC_MAX_FW_SIZE;
> -	} else if (IS_CANNONLAKE(dev_priv)) {
> -		dmc->fw_path = CNL_DMC_PATH;
> -		dmc->required_version = CNL_DMC_VERSION_REQUIRED;
> -		dmc->max_fw_size = CNL_DMC_MAX_FW_SIZE;
>  	} else if (IS_GEMINILAKE(dev_priv)) {
>  		dmc->fw_path = GLK_DMC_PATH;
>  		dmc->required_version = GLK_DMC_VERSION_REQUIRED;
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
