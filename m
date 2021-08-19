Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5EF3F1F25
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 19:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2066E9BB;
	Thu, 19 Aug 2021 17:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630CB6E9B1;
 Thu, 19 Aug 2021 17:30:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="203757710"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="203757710"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 10:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="532597507"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 19 Aug 2021 10:30:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 20:30:30 +0300
Date: Thu, 19 Aug 2021 20:30:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, manasi.d.navare@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/17] drm/dp: add helper for extracting adjust 128b/132b
 TX FFE preset
Message-ID: <YR6VNnGfUcrYB1gn@intel.com>
References: <cover.1629310010.git.jani.nikula@intel.com>
 <b287d95f995cd48143e2e14fa21b431e0cd9ee78.1629310010.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b287d95f995cd48143e2e14fa21b431e0cd9ee78.1629310010.git.jani.nikula@intel.com>
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

On Wed, Aug 18, 2021 at 09:10:39PM +0300, Jani Nikula wrote:
> The DP 2.0 128b/132b channel coding uses TX FFE presets instead of
> vswing and pre-emphasis.
> 
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 14 ++++++++++++++
>  include/drm/drm_dp_helper.h     |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 9389f92cb944..2843238a78e6 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -130,6 +130,20 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
>  
> +/* DP 2.0 128b/132b */
> +u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
> +				   int lane)
> +{
> +	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
> +	int s = ((lane & 1) ?
> +		 DP_ADJUST_TX_FFE_PRESET_LANE1_SHIFT :
> +		 DP_ADJUST_TX_FFE_PRESET_LANE0_SHIFT);
> +	u8 l = dp_link_status(link_status, i);
> +
> +	return (l >> s) & 0xf;
> +}
> +EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
> +
>  u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>  					 unsigned int lane)
>  {
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index f3a61341011d..3ee0b3ffb8a5 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1494,6 +1494,8 @@ u8 drm_dp_get_adjust_request_voltage(const u8 link_status[DP_LINK_STATUS_SIZE],
>  				     int lane);
>  u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SIZE],
>  					  int lane);
> +u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
> +				   int lane);
>  u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>  					 unsigned int lane);
>  
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
