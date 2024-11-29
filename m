Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0969DECA8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 21:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262E10E297;
	Fri, 29 Nov 2024 20:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhfUJvmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41010E297
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732911798; x=1764447798;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sI5j49vzcDPUFyQj2YhlpieYT2MYAcCchT3I0Jr+xSU=;
 b=mhfUJvmOT0GofypRsn7qgDUHkZ8hQTurRGF5MebwIDwej1widnUwNVKE
 PxzVqdat2ddMxuHfjKedSMReG6a5diL9Bd+CEzeEzicaGmQNHjhCgBazd
 U4ghPz+ZtHMBbrL8cWsX2zSWDxQm9uVNOunXE2KKFzy6iq31ZiBaYAFGV
 eSvIHswiDxT38SHwu2gMkEDs/FzEIcCjqYM1pFsdJ+ALh/JVgxEgYRm+7
 BaUEKFtJvJKNdM/BTnscThUcutgRmmANB2yr+2gZEsxdRi55Nlz34SSEc
 5mrUseHLlVlIo7577WXYChpzFoLytE5ifb5saZXRJ5NFXP43FUoJlhj41 w==;
X-CSE-ConnectionGUID: GABnVQGHT++aS0mUcniuBQ==
X-CSE-MsgGUID: YBDpqyjmQluoNSzV4f4kvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33012113"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33012113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:23:18 -0800
X-CSE-ConnectionGUID: C+18JYZ8QuijizHVbsBXsA==
X-CSE-MsgGUID: GrAGu0OJQkqKwBozr11s+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="97669432"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:23:17 -0800
Date: Fri, 29 Nov 2024 22:23:55 +0200
From: Imre Deak <imre.deak@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Cc: dri-devel@lists.freedesktop.org, lyude@redhat.com,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm RAD print
Message-ID: <Z0oi2-Uv2ZCGKOGZ@ideak-desk.fi.intel.com>
References: <20241127094938.3640463-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241127094938.3640463-1-Wayne.Lin@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 27, 2024 at 05:49:38PM +0800, Wayne Lin wrote:
> [Why]
> The RAD of sideband message printed today is incorrect.
> For RAD stored within MST branch
> - If MST branch LCT is 1, it's RAD array is untouched and remained as 0.
> - If MST branch LCT is larger than 1, usd nibble to store the up facing
>   port number in cascaded sequence as illustrated below:
> 
>   u8 RAD[0] = (LCT_2_UFP << 4) | LCT_3_UFP
>      RAD[1] = (LCT_4_UFP << 4) | LCT_5_UFP
>      ...
> 
> In drm_dp_mst_rad_to_str(), it wrongly to use BIT_MASK(4) to fetch the port
> number of one nibble.
> 
> [How]
> Adjust the code by:
> - RAD array items are valuable only for LCT >= 1.
> - Use 0xF as the mask to replace BIT_MASK(4)
> 
> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index f7c6b60629c2..152c60f1e80f 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -179,13 +179,13 @@ static int
>  drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
>  {
>  	int i;
> -	u8 unpacked_rad[16];
> +	u8 unpacked_rad[16] = {0};

The usual way is arr[16] = {};

>  
> -	for (i = 0; i < lct; i++) {
> +	for (i = 1; i < lct; i++) {
>  		if (i % 2)
> -			unpacked_rad[i] = rad[i / 2] >> 4;
> +			unpacked_rad[i] = rad[(i - 1) / 2] >> 4;
>  		else
> -			unpacked_rad[i] = rad[i / 2] & BIT_MASK(4);
> +			unpacked_rad[i] = rad[(i - 1) / 2] & 0xF;
>  	}

So unpacked_rad[0] will be always zero, which represents
drm_dp_mst_topology_mgr::mst_primary, but not actually stored in
drm_dp_mst_branch::rad[]. In each element of rad[] the nibbles are
ordered the most signifcant 4 bits first and the least significant 4
bits second. This could be documented at drm_dp_mst_branch::rad[] imo.

The fix looks ok to me:
Acked-by: Imre Deak <imre.deak@intel.com>

drm_dp_get_mst_branch_device() needs the same logic as above extracting
one element of RAD at a given index, so a helper for this could be added
and used in both places.

>  
>  	/* TODO: Eventually add something to printk so we can format the rad
> -- 
> 2.37.3
> 
