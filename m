Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B04C40FD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AD110E770;
	Fri, 25 Feb 2022 09:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532BD10E76C;
 Fri, 25 Feb 2022 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645780318; x=1677316318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cjA3HLMn0MXdDb/gXukOEsMXh5dRqhgoKbD/zCus6Ns=;
 b=J6gHbT8Lj3PkUc2TzwFJK85SIgFHwg+TNs0irItLHjbLW9A2UslGgZJ3
 sMiG8w0aOC6S2cG3PwSYGcmNlIqLd/kWV003qGYJKpSs7InJp5BNjJAnY
 gss3gXI2QbEvzCBKGI9f7+jqh1oGpzWLSeUG6J75wXMwAqtEgIrs9Kntc
 Rg0rSNRrETCgQVQBkRROmlbyrmXv1afAwzFgBSF1aMFpumXnSlXRW0FJG
 bSIhex0TAQZkEOSV1r3Ici0mWyQpSzlPDQv7GxunbQURG822ILBkJBdJI
 6EJ6EHEXZ/tOykKfN6+WLPAT9t2xIRuEKv7I5l4UQyNu4NRxs6z+mkwRA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="235967926"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="235967926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 01:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="533507468"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 25 Feb 2022 01:11:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Feb 2022 11:11:53 +0200
Date: Fri, 25 Feb 2022 11:11:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH v6 1/2] drm/vrr: Set VRR capable prop only if it is
 attached to connector
Message-ID: <YhidWUrEFNFtZBXo@intel.com>
References: <20220225013055.9282-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225013055.9282-1-manasi.d.navare@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 05:30:54PM -0800, Manasi Navare wrote:
> VRR capable property is not attached by default to the connector
> It is attached only if VRR is supported.
> So if the driver tries to call drm core set prop function without
> it being attached that causes NULL dereference.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2f..76a8c707c34b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2330,6 +2330,9 @@ EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
>  void drm_connector_set_vrr_capable_property(
>  		struct drm_connector *connector, bool capable)
>  {
> +	if (!connector->vrr_capable_property)
> +		return;
> +
>  	drm_object_property_set_value(&connector->base,
>  				      connector->vrr_capable_property,
>  				      capable);
> -- 
> 2.19.1

-- 
Ville Syrjälä
Intel
