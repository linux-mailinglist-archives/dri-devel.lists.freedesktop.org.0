Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FA3D582E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4CE6F485;
	Mon, 26 Jul 2021 10:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4546EDB7;
 Mon, 26 Jul 2021 10:59:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212250197"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="212250197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="504853590"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:59:36 -0700
Date: Mon, 26 Jul 2021 06:59:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 18/30] drm/i915: remove explicit CNL handling from
 i915_irq.c
Message-ID: <YP6Vl2b0iBuQZSJi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-19-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-19-lucas.demarchi@intel.com>
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
 Jose Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:02PM -0700, Lucas De Marchi wrote:
> Remove special handling of PORT_F in i915_irq.c and only do it for
> DISPLAY_VER == 11.

oh! ignore my previous thought about removing the port F...

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/i915/i915_irq.c | 7 +++----
>  drivers/gpu/drm/i915/i915_reg.h | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index e2171bd2820e..17d336218b67 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2297,11 +2297,10 @@ static u32 gen8_de_port_aux_mask(struct drm_i915_private *dev_priv)
>  			GEN9_AUX_CHANNEL_C |
>  			GEN9_AUX_CHANNEL_D;
>  
> -	if (IS_CNL_WITH_PORT_F(dev_priv) || DISPLAY_VER(dev_priv) == 11)
> -		mask |= CNL_AUX_CHANNEL_F;
> -
> -	if (DISPLAY_VER(dev_priv) == 11)
> +	if (DISPLAY_VER(dev_priv) == 11) {
> +		mask |= ICL_AUX_CHANNEL_F;
>  		mask |= ICL_AUX_CHANNEL_E;
> +	}
>  
>  	return mask;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d198b1a2d4b5..fdc8fd424d36 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7945,7 +7945,7 @@ enum {
>  #define  DSI1_NON_TE			(1 << 31)
>  #define  DSI0_NON_TE			(1 << 30)
>  #define  ICL_AUX_CHANNEL_E		(1 << 29)
> -#define  CNL_AUX_CHANNEL_F		(1 << 28)
> +#define  ICL_AUX_CHANNEL_F		(1 << 28)
>  #define  GEN9_AUX_CHANNEL_D		(1 << 27)
>  #define  GEN9_AUX_CHANNEL_C		(1 << 26)
>  #define  GEN9_AUX_CHANNEL_B		(1 << 25)
> -- 
> 2.31.1
> 
