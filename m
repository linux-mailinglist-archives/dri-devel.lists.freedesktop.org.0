Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67152A8305
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B666EDAC;
	Thu,  5 Nov 2020 16:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43EE6EDAC;
 Thu,  5 Nov 2020 16:06:34 +0000 (UTC)
IronPort-SDR: r/k8TRbuo8AZaKTXtd4mTg9b5F1Dl5fmQGLsApOrIZj1QrQIdO8olEQk4joMrgVvcZ3kRkI/mA
 219WpEwSktPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187315921"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="187315921"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:06:33 -0800
IronPort-SDR: EqPF3dvwKv8chaind/tqDCt0+eWn46OEOXgczqol3J2F/WSqTL1cgy7Ic7vbOkXiKiA4ur/nov
 1Jtr45Uo1zoQ==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="337280203"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:06:30 -0800
Date: Thu, 5 Nov 2020 21:37:13 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 10/16] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
Message-ID: <20201105160712.GI3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-11-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-11-anshuman.gupta@intel.com>
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
 Tomas Winkler <tomas.winkler@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 22:12:02 +0530, Anshuman Gupta wrote:
> Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
> It is based upon the actual number of MST streams and size
> of wired_cmd_repeater_auth_stream_req_in.
> Excluding the size of hdcp_cmd_header.
> 
> v2:
> hdcp_cmd_header size annotation nitpick. [Tomas]
> 
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Acked-by: Tomas Winkler <tomas.winkler@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
> index 9ae9669e46ea..3506a3534294 100644
> --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> +++ b/drivers/misc/mei/hdcp/mei_hdcp.c
> @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device *dev,
>  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
>  	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
>  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> -	verify_mprime_in->header.buffer_len =
> -			WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> +	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(verify_mprime_in->header);
since only this packet is varying in size we need to calculate in
runtime.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  
>  	verify_mprime_in->port.integrated_port_type = data->port_type;
>  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
