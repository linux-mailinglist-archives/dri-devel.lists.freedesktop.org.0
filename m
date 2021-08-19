Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B403F1ED2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 19:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D6E6E9B7;
	Thu, 19 Aug 2021 17:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BBB6E9B7;
 Thu, 19 Aug 2021 17:16:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="196862939"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="196862939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 10:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="489780999"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 19 Aug 2021 10:16:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 20:16:26 +0300
Date: Thu, 19 Aug 2021 20:16:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH 2/4] drm/dp: use more of the extended receiver cap
Message-ID: <YR6R6oveiFbF8xmg@intel.com>
References: <cover.1628851334.git.jani.nikula@intel.com>
 <ab2ca82226fd954a61a5674cf0531508bd18cef7.1628851334.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab2ca82226fd954a61a5674cf0531508bd18cef7.1628851334.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 01:43:20PM +0300, Jani Nikula wrote:
> Extend the use of extended receiver cap at 0x2200 to cover
> MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation hides
> the DP 2.0 128b/132b channel encoding cap.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 9b2a2961fca8..9389f92cb944 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>  					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> -	u8 dpcd_ext[6];
> +	u8 dpcd_ext[DP_MAIN_LINK_CHANNEL_CODING + 1];

Why are we even reading less of this than the normal receiver caps?

>  	int ret;
>  
>  	/*
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
