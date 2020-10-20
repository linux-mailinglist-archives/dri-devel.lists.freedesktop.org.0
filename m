Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FA2936D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78F36EC2D;
	Tue, 20 Oct 2020 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067CD6EC25;
 Tue, 20 Oct 2020 08:31:42 +0000 (UTC)
IronPort-SDR: ukq/57yAbgpgtCFbkKIEcwh0TpkcvoffdUzP+n/Af+I+LU2QDcdrwKimHCzzZnoHVgFLmIjUCX
 PXP1HmV3MSng==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167264824"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="167264824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 01:31:42 -0700
IronPort-SDR: Q/H0jtXXPreY10qwP2dH4ZXwYIc9USGefjFXQFiJ1a9T4Dv4bqAzwDFdma+VoOr9ChlCaC0Ptl
 847ymHAmUBDA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="347780032"
Received: from bneville-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.252.6.14])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 01:31:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 09/13] drm/i915/hdcp: mst streams support in
 hdcp port_data
In-Reply-To: <20201019102041.26178-1-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201014045252.13608-10-anshuman.gupta@intel.com>
 <20201019102041.26178-1-anshuman.gupta@intel.com>
Date: Tue, 20 Oct 2020 11:31:37 +0300
Message-ID: <878sc19u3a.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Add support for multiple mst stream in hdcp port data
> which will be used by RepeaterAuthStreamManage msg and
> HDCP 2.2 security f/w for m' validation.
>
> v2:
> Init the hdcp port data k for HDMI/DP SST strem.
>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 92 ++++++++++++++++---
>  drivers/misc/mei/hdcp/mei_hdcp.c              |  3 +-
>  include/drm/drm_hdcp.h                        |  8 +-

...

> diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
> index 9ae9669e46ea..b10d266fb60a 100644
> --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> +++ b/drivers/misc/mei/hdcp/mei_hdcp.c
> @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device *dev,
>  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
>  	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
>  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> -	verify_mprime_in->header.buffer_len =
> -			WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> +	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(struct hdcp_cmd_header);
>  
>  	verify_mprime_in->port.integrated_port_type = data->port_type;
>  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index fe58dbb46962..c8a37bb406b2 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -101,11 +101,11 @@
>  
>  /* Following Macros take a byte at a time for bit(s) masking */
>  /*
> - * TODO: This has to be changed for DP MST, as multiple stream on
> - * same port is possible.
> - * For HDCP2.2 on HDMI and DP SST this value is always 1.
> + * TODO: This is based upon actual H/W  MST streams capacity.
> + *
> + * This is should be moved out to platform specific header.
>   */
> -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
> +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>  #define HDCP_2_2_RXCAPS_LEN			3
>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))

These two hunk should probably be separate changes... would be easier to
record the changes (as they're not mentioned in the commit message at
all!) and the acks from other maintainers.

Cc: Tomas.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
