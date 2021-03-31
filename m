Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3234FF97
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476A89D60;
	Wed, 31 Mar 2021 11:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570989D60;
 Wed, 31 Mar 2021 11:38:19 +0000 (UTC)
IronPort-SDR: GxLYqGEqZb9d/7QnHZvSsdfUzucSDt/0PcOE9+d/jaNO2JO9Fw+V76OJgGO0vUMpnnbyaFxUfZ
 HH1lO3lhRdNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="212224310"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="212224310"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 04:38:18 -0700
IronPort-SDR: 5e/Azto5zXXn9RrTJ2BnMMvtfa53eJPVg+FJCtiWymLseEphBPjfyxwDh2X7F5lw3N48MQr3Y3
 5h+ZTurhSVwg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418634746"
Received: from ebilea-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.32.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 04:38:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nautiyal\, Ankit K" <ankit.k.nautiyal@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/hdcp: Add DP HDCP2.2 timeout
 to read entire msg
In-Reply-To: <c9d95f02-3a2b-4a01-6b19-2ce3c051ec9d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210324113012.7564-1-anshuman.gupta@intel.com>
 <20210324113012.7564-2-anshuman.gupta@intel.com>
 <c9d95f02-3a2b-4a01-6b19-2ce3c051ec9d@intel.com>
Date: Wed, 31 Mar 2021 14:38:12 +0300
Message-ID: <877dlno8nv.fsf@intel.com>
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
Cc: maarten.lankhorst@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Mar 2021, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> LGTM.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Both patches pushed to drm-intel-next with Maxime's irc ack.

BR,
Jani.


>
> On 3/24/2021 5:00 PM, Anshuman Gupta wrote:
>> As documented in HDCP 2.2 DP Errata spec transmitter should abort the
>> authentication protocol in case transmitter has not received the
>> entire {AKE_Send_Cert, AKE_Send_H_prime, AKE_Send_Paring_Info} msg
>> within {110,7,5} miliseconds.
>>
>> Adding above msg timeout values and aborting the HDCP authentication
>> in case it timedout to read entire msg.
>>
>> https://www.digital-cp.com/sites/default/files/HDCP%202_2_DisplayPort_Errata_v3_0.pdf
>>
>> v2:
>> - Removed redundant variable msg_can_timedout. [Ankit]
>>
>> Cc: Ramalingam C <ramalingam.c@intel.com>
>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
>>   include/drm/drm_hdcp.h                       |  3 ++
>>   2 files changed, 35 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> index 40c516e90193..8bad4b3d34dd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> @@ -294,37 +294,39 @@ struct hdcp2_dp_msg_data {
>>   	bool msg_detectable;
>>   	u32 timeout;
>>   	u32 timeout2; /* Added for non_paired situation */
>> +	/* Timeout to read entire msg */
>> +	u32 msg_read_timeout;
>>   };
>>   
>>   static const struct hdcp2_dp_msg_data hdcp2_dp_msg_data[] = {
>> -	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0 },
>> +	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0, 0},
>>   	{ HDCP_2_2_AKE_SEND_CERT, DP_HDCP_2_2_AKE_SEND_CERT_OFFSET,
>> -	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0 },
>> +	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0, HDCP_2_2_DP_CERT_READ_TIMEOUT_MS},
>>   	{ HDCP_2_2_AKE_NO_STORED_KM, DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET,
>> -	  false, 0, 0 },
>> +	  false, 0, 0, 0 },
>>   	{ HDCP_2_2_AKE_STORED_KM, DP_HDCP_2_2_AKE_STORED_KM_OFFSET,
>> -	  false, 0, 0 },
>> +	  false, 0, 0, 0 },
>>   	{ HDCP_2_2_AKE_SEND_HPRIME, DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET,
>>   	  true, HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS,
>> -	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS },
>> +	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS, HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS},
>>   	{ HDCP_2_2_AKE_SEND_PAIRING_INFO,
>>   	  DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET, true,
>> -	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0 },
>> -	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0 },
>> +	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0, HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS },
>> +	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0, 0 },
>>   	{ HDCP_2_2_LC_SEND_LPRIME, DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET,
>> -	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0 },
>> +	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0, 0 },
>>   	{ HDCP_2_2_SKE_SEND_EKS, DP_HDCP_2_2_SKE_SEND_EKS_OFFSET, false,
>> -	  0, 0 },
>> +	  0, 0, 0 },
>>   	{ HDCP_2_2_REP_SEND_RECVID_LIST,
>>   	  DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET, true,
>> -	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0 },
>> +	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0, 0 },
>>   	{ HDCP_2_2_REP_SEND_ACK, DP_HDCP_2_2_REP_SEND_ACK_OFFSET, false,
>> -	  0, 0 },
>> +	  0, 0, 0 },
>>   	{ HDCP_2_2_REP_STREAM_MANAGE,
>>   	  DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET, false,
>> -	  0, 0 },
>> +	  0, 0, 0},
>>   	{ HDCP_2_2_REP_STREAM_READY, DP_HDCP_2_2_REP_STREAM_READY_OFFSET,
>> -	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0 },
>> +	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0, 0 },
>>   /* local define to shovel this through the write_2_2 interface */
>>   #define HDCP_2_2_ERRATA_DP_STREAM_TYPE	50
>>   	{ HDCP_2_2_ERRATA_DP_STREAM_TYPE,
>> @@ -513,6 +515,8 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>>   	u8 *byte = buf;
>>   	ssize_t ret, bytes_to_recv, len;
>>   	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
>> +	ktime_t msg_end;
>> +	bool msg_expired;
>>   
>>   	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
>>   	if (!hdcp2_msg_data)
>> @@ -539,6 +543,11 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>>   		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
>>   		      DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_recv;
>>   
>> +		/* Entire msg read timeout since initiate of msg read */
>> +		if (bytes_to_recv == size - 1 && hdcp2_msg_data->msg_read_timeout > 0)
>> +			msg_end = ktime_add_ms(ktime_get_raw(),
>> +					       hdcp2_msg_data->msg_read_timeout);
>> +
>>   		ret = drm_dp_dpcd_read(&dig_port->dp.aux, offset,
>>   				       (void *)byte, len);
>>   		if (ret < 0) {
>> @@ -551,6 +560,16 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>>   		byte += ret;
>>   		offset += ret;
>>   	}
>> +
>> +	if (hdcp2_msg_data->msg_read_timeout > 0) {
>> +		msg_expired = ktime_after(ktime_get_raw(), msg_end);
>> +		if (msg_expired) {
>> +			drm_dbg_kms(&i915->drm, "msg_id %d, entire msg read timeout(mSec): %d\n",
>> +				    msg_id, hdcp2_msg_data->msg_read_timeout);
>> +			return -ETIMEDOUT;
>> +		}
>> +	}
>> +
>>   	byte = buf;
>>   	*byte = msg_id;
>>   
>> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
>> index ac22c246542a..2b165a0f434f 100644
>> --- a/include/drm/drm_hdcp.h
>> +++ b/include/drm/drm_hdcp.h
>> @@ -224,9 +224,12 @@ struct hdcp2_rep_stream_ready {
>>   
>>   /* HDCP2.2 TIMEOUTs in mSec */
>>   #define HDCP_2_2_CERT_TIMEOUT_MS		100
>> +#define HDCP_2_2_DP_CERT_READ_TIMEOUT_MS	110
>>   #define HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS	1000
>>   #define HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS	200
>> +#define HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS	7
>>   #define HDCP_2_2_PAIRING_TIMEOUT_MS		200
>> +#define HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS	5
>>   #define	HDCP_2_2_HDMI_LPRIME_TIMEOUT_MS		20
>>   #define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		7
>>   #define HDCP_2_2_RECVID_LIST_TIMEOUT_MS		3000
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
