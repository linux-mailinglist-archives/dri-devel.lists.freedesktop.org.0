Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573034895F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 07:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7FF6EB2D;
	Thu, 25 Mar 2021 06:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADF26EB2D;
 Thu, 25 Mar 2021 06:52:06 +0000 (UTC)
IronPort-SDR: e2ma6SVoqwuX6+IHif9wghjK3XnNSKydw2d9pX6v7BgAGWecfSRUlE7S+w3GxnuqZSzVbhKdbT
 y1y3sbaHLx2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188569682"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="188569682"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 23:52:05 -0700
IronPort-SDR: eJZ841xfwm1YDoaHeuOw7RJcJ+urEuo6vbSwsXYYz3o7KI9MFPxzZq3wKTlJXA8tXOQSmAJ/Bz
 K4lWgwfjM/mw==
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="415853286"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.213.103.45])
 ([10.213.103.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 23:52:03 -0700
Subject: Re: [PATCH v2 1/2] drm/i915/hdcp: Add DP HDCP2.2 timeout to read
 entire msg
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210324113012.7564-1-anshuman.gupta@intel.com>
 <20210324113012.7564-2-anshuman.gupta@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <c9d95f02-3a2b-4a01-6b19-2ce3c051ec9d@intel.com>
Date: Thu, 25 Mar 2021 12:21:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324113012.7564-2-anshuman.gupta@intel.com>
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
Cc: maarten.lankhorst@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 3/24/2021 5:00 PM, Anshuman Gupta wrote:
> As documented in HDCP 2.2 DP Errata spec transmitter should abort the
> authentication protocol in case transmitter has not received the
> entire {AKE_Send_Cert, AKE_Send_H_prime, AKE_Send_Paring_Info} msg
> within {110,7,5} miliseconds.
>
> Adding above msg timeout values and aborting the HDCP authentication
> in case it timedout to read entire msg.
>
> https://www.digital-cp.com/sites/default/files/HDCP%202_2_DisplayPort_Errata_v3_0.pdf
>
> v2:
> - Removed redundant variable msg_can_timedout. [Ankit]
>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
>   include/drm/drm_hdcp.h                       |  3 ++
>   2 files changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 40c516e90193..8bad4b3d34dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -294,37 +294,39 @@ struct hdcp2_dp_msg_data {
>   	bool msg_detectable;
>   	u32 timeout;
>   	u32 timeout2; /* Added for non_paired situation */
> +	/* Timeout to read entire msg */
> +	u32 msg_read_timeout;
>   };
>   
>   static const struct hdcp2_dp_msg_data hdcp2_dp_msg_data[] = {
> -	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0 },
> +	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0, 0},
>   	{ HDCP_2_2_AKE_SEND_CERT, DP_HDCP_2_2_AKE_SEND_CERT_OFFSET,
> -	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0 },
> +	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0, HDCP_2_2_DP_CERT_READ_TIMEOUT_MS},
>   	{ HDCP_2_2_AKE_NO_STORED_KM, DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET,
> -	  false, 0, 0 },
> +	  false, 0, 0, 0 },
>   	{ HDCP_2_2_AKE_STORED_KM, DP_HDCP_2_2_AKE_STORED_KM_OFFSET,
> -	  false, 0, 0 },
> +	  false, 0, 0, 0 },
>   	{ HDCP_2_2_AKE_SEND_HPRIME, DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET,
>   	  true, HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS,
> -	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS },
> +	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS, HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS},
>   	{ HDCP_2_2_AKE_SEND_PAIRING_INFO,
>   	  DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET, true,
> -	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0 },
> -	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0 },
> +	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0, HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS },
> +	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0, 0 },
>   	{ HDCP_2_2_LC_SEND_LPRIME, DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET,
> -	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0 },
> +	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0, 0 },
>   	{ HDCP_2_2_SKE_SEND_EKS, DP_HDCP_2_2_SKE_SEND_EKS_OFFSET, false,
> -	  0, 0 },
> +	  0, 0, 0 },
>   	{ HDCP_2_2_REP_SEND_RECVID_LIST,
>   	  DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET, true,
> -	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0 },
> +	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0, 0 },
>   	{ HDCP_2_2_REP_SEND_ACK, DP_HDCP_2_2_REP_SEND_ACK_OFFSET, false,
> -	  0, 0 },
> +	  0, 0, 0 },
>   	{ HDCP_2_2_REP_STREAM_MANAGE,
>   	  DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET, false,
> -	  0, 0 },
> +	  0, 0, 0},
>   	{ HDCP_2_2_REP_STREAM_READY, DP_HDCP_2_2_REP_STREAM_READY_OFFSET,
> -	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0 },
> +	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0, 0 },
>   /* local define to shovel this through the write_2_2 interface */
>   #define HDCP_2_2_ERRATA_DP_STREAM_TYPE	50
>   	{ HDCP_2_2_ERRATA_DP_STREAM_TYPE,
> @@ -513,6 +515,8 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>   	u8 *byte = buf;
>   	ssize_t ret, bytes_to_recv, len;
>   	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
> +	ktime_t msg_end;
> +	bool msg_expired;
>   
>   	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
>   	if (!hdcp2_msg_data)
> @@ -539,6 +543,11 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>   		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
>   		      DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_recv;
>   
> +		/* Entire msg read timeout since initiate of msg read */
> +		if (bytes_to_recv == size - 1 && hdcp2_msg_data->msg_read_timeout > 0)
> +			msg_end = ktime_add_ms(ktime_get_raw(),
> +					       hdcp2_msg_data->msg_read_timeout);
> +
>   		ret = drm_dp_dpcd_read(&dig_port->dp.aux, offset,
>   				       (void *)byte, len);
>   		if (ret < 0) {
> @@ -551,6 +560,16 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>   		byte += ret;
>   		offset += ret;
>   	}
> +
> +	if (hdcp2_msg_data->msg_read_timeout > 0) {
> +		msg_expired = ktime_after(ktime_get_raw(), msg_end);
> +		if (msg_expired) {
> +			drm_dbg_kms(&i915->drm, "msg_id %d, entire msg read timeout(mSec): %d\n",
> +				    msg_id, hdcp2_msg_data->msg_read_timeout);
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
>   	byte = buf;
>   	*byte = msg_id;
>   
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index ac22c246542a..2b165a0f434f 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -224,9 +224,12 @@ struct hdcp2_rep_stream_ready {
>   
>   /* HDCP2.2 TIMEOUTs in mSec */
>   #define HDCP_2_2_CERT_TIMEOUT_MS		100
> +#define HDCP_2_2_DP_CERT_READ_TIMEOUT_MS	110
>   #define HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS	1000
>   #define HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS	200
> +#define HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS	7
>   #define HDCP_2_2_PAIRING_TIMEOUT_MS		200
> +#define HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS	5
>   #define	HDCP_2_2_HDMI_LPRIME_TIMEOUT_MS		20
>   #define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		7
>   #define HDCP_2_2_RECVID_LIST_TIMEOUT_MS		3000
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
