Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8B2C2DA7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 18:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24606E4C4;
	Tue, 24 Nov 2020 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1C6E4C1;
 Tue, 24 Nov 2020 17:02:47 +0000 (UTC)
IronPort-SDR: QLtwLLsi8CzIozUT8NLJInJtYK3ZAYEtIOZFHtnbZmmE2742PblW8azlKEbuIFg744E3rq1ZB7
 yLVzXqd84HLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151820433"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151820433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 09:02:34 -0800
IronPort-SDR: /Y7xMkCj3XpUsSRUMVEJmTHP2wnRGPBbmQobs3rlQ25QS7Z7AjIpax3CjNUpPEMYbJIR0Mcxpt
 n7PksJdzYJKA==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="313317568"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 09:02:32 -0800
Date: Tue, 24 Nov 2020 22:33:30 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v5 14/17] drm/i915/hdcp: Pass connector to check_2_2_link
Message-ID: <20201124170330.GC25919@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
 <20201111062051.11529-15-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111062051.11529-15-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-11 at 11:50:48 +0530, Anshuman Gupta wrote:
> This requires for HDCP 2.2 MST check link.
> As for DP/HDMI shims check_2_2_link retrieves the connector
> from dig_port, this is not sufficient or DP MST connector,
> there can be multiple DP MST topology connector associated
> with same dig_port.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 3 ++-
>  4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b93ecf4f21e3..d2c744b8b461 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -375,7 +375,8 @@ struct intel_hdcp_shim {
>  				  bool is_repeater, u8 type);
>  
>  	/* HDCP2.2 Link Integrity Check */
> -	int (*check_2_2_link)(struct intel_digital_port *dig_port);
> +	int (*check_2_2_link)(struct intel_digital_port *dig_port,
> +			      struct intel_connector *connector);
>  };
>  
>  struct intel_hdcp {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index f643d3af59bb..c094839d15d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -585,7 +585,8 @@ int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *dig_port,
>  }
>  
>  static
> -int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
> +int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port,
> +			      struct intel_connector *connector)
>  {
>  	u8 rx_status;
>  	int ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6a48110c7cd7..0c10afc42f01 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1942,7 +1942,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  		goto out;
>  	}
>  
> -	ret = hdcp->shim->check_2_2_link(dig_port);
> +	ret = hdcp->shim->check_2_2_link(dig_port, connector);
>  	if (ret == HDCP_LINK_PROTECTED) {
>  		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>  			intel_hdcp_update_value(connector,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 0788de04711b..bd0d91101464 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1734,7 +1734,8 @@ int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *dig_port,
>  }
>  
>  static
> -int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port)
> +int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
> +				struct intel_connector *connector)
>  {
>  	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
>  	int ret;
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
