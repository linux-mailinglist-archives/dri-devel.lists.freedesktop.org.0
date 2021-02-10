Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F7316B1A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E146ECAE;
	Wed, 10 Feb 2021 16:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FC46ECAE;
 Wed, 10 Feb 2021 16:24:18 +0000 (UTC)
IronPort-SDR: H8yMpIieU2p7XzfQ2jH3dXnOEpZevMuJXeORFqBu0MqFDNBD3YnKnoMzkMTGTfbkfL0jN4+oZx
 upVBAS0zglmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179545781"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="179545781"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 08:24:17 -0800
IronPort-SDR: wQgi5rluJWOBsUZxP8xYweKhxeacPW9tp3GQi0ISOZnP7YD4XplB8/xoZ3dimr3kwFkFJzc0bk
 z29igeMS1tRA==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="421104356"
Received: from ienunogu-mobl1.amr.corp.intel.com (HELO [10.254.96.230])
 ([10.254.96.230])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 08:24:17 -0800
Subject: Re: [PATCH] drm/i915/adl_s: Add gmbus pin mapping
To: Anand Moon <anandx.ram.moon@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210210115441.6703-1-anandx.ram.moon@intel.com>
From: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <1d8a1fa5-0d74-abd7-983f-b597c4307bd5@intel.com>
Date: Wed, 10 Feb 2021 08:24:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210115441.6703-1-anandx.ram.moon@intel.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/21 3:54 AM, Anand Moon wrote:
> Add table to map the GMBUS pin pairs to GPIO registers and port to DDC
> mapping for ADL_S as per below Bspec.

Has this patch been tested on an ADLS system? Upstream CI AFAIK doesn't have
support for ADL-S. Also comments below..

> 
> Bspec:20124, 53597.
> 
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 0c952e1d720e..58b8e42d4f90 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -52,6 +52,14 @@ static const struct gmbus_pin gmbus_pins[] = {
>  	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
>  };
>  
> +static const struct gmbus_pin gmbus_pins_adls[] = {
> +	[GMBUS_PIN_1_BXT] = { "edp", GPIOA },

I am pretty sure that GMBUS_PIN_1_BXT should map to GPIOB(1) and not GPIOA(0) like what we have for ICP.

> +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOD },
> +	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOE },
> +	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOF },
> +	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOG },
> +};
> +
>  static const struct gmbus_pin gmbus_pins_bdw[] = {
>  	[GMBUS_PIN_VGADDC] = { "vga", GPIOA },
>  	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
> @@ -101,7 +109,9 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {
>  static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
>  					     unsigned int pin)
>  {
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)

This check should be converted to IS_ALDERLAKE_S(dev_priv) instead of PCH check for PCH_ADP.
Unfortunately, we are reusing PCH_ADP for ADLS and ADLP which have different mappings but the same ADP PCH.
This will break ADLP. 

The PCH_ADP check for ADLS in intel_bios.c will also be changed in the ADLP patches
that are going to be submitted upstream.

So might as well do the correct thing now and change this to IS_ALDERLAKE_S(dev_priv).

> +		return &gmbus_pins_adls[pin];
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		return &gmbus_pins_dg1[pin];
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		return &gmbus_pins_icp[pin];
> @@ -122,7 +132,9 @@ bool intel_gmbus_is_valid_pin(struct drm_i915_private *dev_priv,
>  {
>  	unsigned int size;
>  
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)

See comment above. Change to IS_ALDERLAKE_S(dev_priv)

Aditya Swarup

> +		size = ARRAY_SIZE(gmbus_pins_adls);
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		size = ARRAY_SIZE(gmbus_pins_dg1);
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		size = ARRAY_SIZE(gmbus_pins_icp);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
