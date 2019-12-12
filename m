Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36311D3CE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 18:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA7A6E0A0;
	Thu, 12 Dec 2019 17:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4CD6E067;
 Thu, 12 Dec 2019 17:27:08 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 09:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="204035372"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
 by orsmga007.jf.intel.com with ESMTP; 12 Dec 2019 09:27:07 -0800
Date: Thu, 12 Dec 2019 09:27:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915/bios: fix off by one in parse_generic_dtd()
Message-ID: <20191212172707.GF85422@mdroper-desk1.amr.corp.intel.com>
References: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Jani Nikula <jani.nikula@intel.com>, kernel-janitors@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 12:11:30PM +0300, Dan Carpenter wrote:
> The "num_dtd" variable is the number of elements in the
> generic_dtd->dtd[] array so the > needs to be >= to prevent reading one
> element beyond the end of the array.
> 
> Fixes: 33ef6d4fd8df ("drm/i915/vbt: Handle generic DTD block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 1aeecdd02293..d1e27ee86e53 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -338,7 +338,7 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
>  
>  	num_dtd = (get_blocksize(generic_dtd) -
>  		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
> -	if (dev_priv->vbt.panel_type > num_dtd) {
> +	if (dev_priv->vbt.panel_type >= num_dtd) {
>  		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
>  			  dev_priv->vbt.panel_type, num_dtd);
>  		return;
> -- 
> 2.11.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
