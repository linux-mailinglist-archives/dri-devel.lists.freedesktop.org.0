Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC1294229
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 20:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12C66ED11;
	Tue, 20 Oct 2020 18:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901D6E1DE;
 Tue, 20 Oct 2020 18:32:53 +0000 (UTC)
IronPort-SDR: H1rXi39z+BjMRix7vYCdlsKlV6ok9VSYA8JDrUOfdnpXkxxfChkwrsrmRLsEMMux9d7Ym94cM2
 xh9xdGcxG2Aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167349535"
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="167349535"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 11:32:52 -0700
IronPort-SDR: O+ao1XLyMqF7meys6cFitEnpTLQsHk8SCt/qvldyRR9Xg2LCNO1ABynvkHNNm00OuRdH+EdxGm
 ggCv6hxUTT6Q==
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="533180686"
Received: from bneville-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.252.6.14])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 11:32:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
In-Reply-To: <20201020133906.23710-10-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
 <20201020133906.23710-10-anshuman.gupta@intel.com>
Date: Tue, 20 Oct 2020 21:32:46 +0300
Message-ID: <87tuuo929d.fsf@intel.com>
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
 juston.li@intel.com, Anshuman Gupta <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
> It is based upon the actual number of MST streams and size
> of wired_cmd_repeater_auth_stream_req_in.
> Excluding the size of hdcp_cmd_header.
>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Tomas, ack to merge this via drm-intel?

Thanks,
Jani.

> ---
>  drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
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

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
