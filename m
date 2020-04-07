Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9C1A0D61
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 14:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC86E84E;
	Tue,  7 Apr 2020 12:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD61D6E84E;
 Tue,  7 Apr 2020 12:13:58 +0000 (UTC)
IronPort-SDR: OUkSujmJdNFjtAl3BnNi//lZOXboYBtFq9om2EyhF64IYarjvxrZIqqqfJaB2ZFFZhmNlEccZl
 u00UjA+Irf6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 05:13:58 -0700
IronPort-SDR: h/8+O+CUY7oHbh71733W6VJALhDNLIwqJlTzpU5uVaCVRL0TtxjjjNPcCBbK2Q2pwETwwLq30l
 g3q+UQ8Mt9pg==
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; d="scan'208";a="397836710"
Received: from vogtstef-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.40.153])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 05:13:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5 14/16] drm/mst: Add support for
 QUERY_STREAM_ENCRYPTION_STATUS MST sideband message
In-Reply-To: <30ba4d27ca8e26413371a2e6f0e9b6d2cd9043f5.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200305201236.152307-1-sean@poorly.run>
 <20200305201236.152307-15-sean@poorly.run>
 <30ba4d27ca8e26413371a2e6f0e9b6d2cd9043f5.camel@redhat.com>
Date: Tue, 07 Apr 2020 15:13:53 +0300
Message-ID: <87mu7njxxa.fsf@intel.com>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Mar 2020, Lyude Paul <lyude@redhat.com> wrote:
> On Thu, 2020-03-05 at 15:12 -0500, Sean Paul wrote:
>> From: Sean Paul <seanpaul@chromium.org>
>> 
>> Used to query whether an MST stream is encrypted or not.
>> 
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> 
>> Link: 
>> https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-14-sean@poorly.run
>> #v4
>> 
>> Changes in v4:
>> -Added to the set
>> Changes in v5:
>> -None
>> ---
>>  drivers/gpu/drm/drm_dp_mst_topology.c | 117 ++++++++++++++++++++++++++
>>  include/drm/drm_dp_helper.h           |   3 +
>>  include/drm/drm_dp_mst_helper.h       |  44 ++++++++++
>>  3 files changed, 164 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index 6c62ad8f44142..5bba5aac86f31 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/i2c.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/random.h>
>>  #include <linux/sched.h>
>>  #include <linux/seq_file.h>
>>  
>> @@ -418,6 +419,22 @@ drm_dp_encode_sideband_req(const struct
>> drm_dp_sideband_msg_req_body *req,
>>  		memcpy(&buf[idx], req->u.i2c_write.bytes, req-
>> >u.i2c_write.num_bytes);
>>  		idx += req->u.i2c_write.num_bytes;
>>  		break;
>> +	case DP_QUERY_STREAM_ENC_STATUS: {
>> +		const struct drm_dp_query_stream_enc_status *msg;
>> +
>> +		msg = &req->u.enc_status;
>> +		buf[idx] = msg->stream_id;
>> +		idx++;
>> +		memcpy(&buf[idx], msg->client_id, sizeof(msg->client_id));
>> +		idx += sizeof(msg->client_id);
>> +		buf[idx] = 0;
>> +		buf[idx] |= msg->stream_event & GENMASK(1, 0);
>> +		buf[idx] |= msg->valid_stream_event ? BIT(2) : 0;
>> +		buf[idx] |= (msg->stream_behavior & GENMASK(1, 0)) << 3;
>> +		buf[idx] |= msg->valid_stream_behavior ? BIT(5) : 0;
>> +		idx++;
>> +		}
>> +		break;
>>  	}
>>  	raw->cur_len = idx;
>>  }
>> @@ -930,6 +947,34 @@ static bool
>> drm_dp_sideband_parse_power_updown_phy_ack(struct drm_dp_sideband_ms
>>  	return true;
>>  }
>>  
>> +static bool
>> +drm_dp_sideband_parse_query_stream_enc_status(
>> +				struct drm_dp_sideband_msg_rx *raw,
>> +				struct drm_dp_sideband_msg_reply_body *repmsg)
>> +{
>> +	struct drm_dp_query_stream_enc_status_ack_reply *reply;
>> +
>> +	reply = &repmsg->u.enc_status;
>> +
>> +	reply->stream_id = raw->msg[3];
>> +
>> +	reply->reply_signed = raw->msg[2] & BIT(0);
>> +
>> +	reply->hdcp_1x_device_present = raw->msg[2] & BIT(3);
>> +	reply->hdcp_2x_device_present = raw->msg[2] & BIT(4);
>> +
>> +	reply->query_capable_device_present = raw->msg[2] & BIT(5);
>> +	reply->legacy_device_present = raw->msg[2] & BIT(6);
>> +	reply->unauthorizable_device_present = raw->msg[2] & BIT(7);
>> +
>> +	reply->auth_completed = !!(raw->msg[1] & BIT(3));
>> +	reply->encryption_enabled = !!(raw->msg[1] & BIT(4));
>> +	reply->repeater_present = !!(raw->msg[1] & BIT(5));
>> +	reply->state = (raw->msg[1] & GENMASK(7, 6)) >> 6;
>> +
>> +	return true;
>> +}
>
> I don't mind terribly either way, but since you're already using the
> BIT/GENMASK() macros have you considered GET_BITFIELD()?

ITYM FIELD_PREP() and FIELD_GET().

Side note, for i915 registers we ended up in trouble with the types
assumed by the various macros, and ended up with REG_BIT(),
REG_GENMASK(), REG_FIELD_PREP(), and REG_FIELD_GET() wrappers for our
specifically u32 needs. All in i915_reg.h.

BR,
Jani.


>
>> +
>>  static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
>>  					struct drm_dp_sideband_msg_reply_body
>> *msg)
>>  {
>> @@ -964,6 +1009,8 @@ static bool drm_dp_sideband_parse_reply(struct
>> drm_dp_sideband_msg_rx *raw,
>>  		return drm_dp_sideband_parse_power_updown_phy_ack(raw, msg);
>>  	case DP_CLEAR_PAYLOAD_ID_TABLE:
>>  		return true; /* since there's nothing to parse */
>> +	case DP_QUERY_STREAM_ENC_STATUS:
>> +		return drm_dp_sideband_parse_query_stream_enc_status(raw,
>> msg);
>>  	default:
>>  		DRM_ERROR("Got unknown reply 0x%02x (%s)\n", msg->req_type,
>>  			  drm_dp_mst_req_type_str(msg->req_type));
>> @@ -1115,6 +1162,25 @@ static void build_power_updown_phy(struct
>> drm_dp_sideband_msg_tx *msg,
>>  	msg->path_msg = true;
>>  }
>>  
>> +static int
>> +build_query_stream_enc_status(struct drm_dp_sideband_msg_tx *msg, u8
>> stream_id,
>> +			      u8 *q_id)
>> +{
>> +	struct drm_dp_sideband_msg_req_body req;
>> +
>> +	req.req_type = DP_QUERY_STREAM_ENC_STATUS;
>> +	req.u.enc_status.stream_id = stream_id;
>> +	memcpy(req.u.enc_status.client_id, q_id,
>> +	       sizeof(req.u.enc_status.client_id));
>> +	req.u.enc_status.stream_event = 0;
>> +	req.u.enc_status.valid_stream_event = false;
>> +	req.u.enc_status.stream_behavior = 0;
>> +	req.u.enc_status.valid_stream_behavior = false;
>> +
>> +	drm_dp_encode_sideband_req(&req, msg);
>> +	return 0;
>> +}
>> +
>>  static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr
>> *mgr,
>>  					struct drm_dp_vcpi *vcpi)
>>  {
>> @@ -3151,6 +3217,57 @@ int drm_dp_send_power_updown_phy(struct
>> drm_dp_mst_topology_mgr *mgr,
>>  }
>>  EXPORT_SYMBOL(drm_dp_send_power_updown_phy);
>>  
>> +int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr
>> *mgr,
>> +		struct drm_dp_mst_port *port,
>> +		struct drm_dp_query_stream_enc_status_ack_reply *status)
>> +{
>> +	struct drm_dp_sideband_msg_tx *txmsg;
>> +	u8 nonce[7];
>> +	int len, ret;
>> +
>> +	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
>> +	if (!txmsg)
>> +		return -ENOMEM;
>> +
>> +	port = drm_dp_mst_topology_get_port_validated(mgr, port);
>> +	if (!port) {
>> +		ret = -EINVAL;
>> +		goto out_get_port;
>> +	}
>> +
>> +	get_random_bytes(nonce, sizeof(nonce));
>> +
>> +	/*
>> +	 * "Source device targets the QUERY_STREAM_ENCRYPTION_STATUS message
>> +	 *  transaction at the MST Branch device directly connected to the
>> +	 *  Source"
>> +	 */
>> +	txmsg->dst = mgr->mst_primary;
>> +
>> +	len = build_query_stream_enc_status(txmsg, port->vcpi.vcpi, nonce);
>> +
>> +	drm_dp_queue_down_tx(mgr, txmsg);
>> +
>> +	ret = drm_dp_mst_wait_tx_reply(mgr->mst_primary, txmsg);
>> +	if (ret < 0) {
>> +		goto out;
>> +	} else if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
>> +		DRM_DEBUG_KMS("query encryption status nak received\n");
>> +		ret = -ENXIO;
>> +		goto out;
>> +	}
>> +
>> +	ret = 0;
>> +	memcpy(status, &txmsg->reply.u.enc_status, sizeof(*status));
>> +
>> +out:
>> +	drm_dp_mst_topology_put_port(port);
>> +out_get_port:
>> +	kfree(txmsg);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
>> +
>>  static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
>>  				       int id,
>>  				       struct drm_dp_payload *payload)
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index c6119e4c169ae..31b6b10b55014 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -1099,6 +1099,9 @@
>>  #define DP_POWER_DOWN_PHY		0x25
>>  #define DP_SINK_EVENT_NOTIFY		0x30
>>  #define DP_QUERY_STREAM_ENC_STATUS	0x38
>> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_NO_EXIST	0
>> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_INACTIVE	1
>> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_ACTIVE	2
>>  
>>  /* DP 1.2 MST sideband reply types */
>>  #define DP_SIDEBAND_REPLY_ACK		0x00
>> diff --git a/include/drm/drm_dp_mst_helper.h
>> b/include/drm/drm_dp_mst_helper.h
>> index 5483f888712ad..baf3405df44d8 100644
>> --- a/include/drm/drm_dp_mst_helper.h
>> +++ b/include/drm/drm_dp_mst_helper.h
>> @@ -305,6 +305,34 @@ struct drm_dp_remote_i2c_write_ack_reply {
>>  	u8 port_number;
>>  };
>>  
>> +struct drm_dp_query_stream_enc_status_ack_reply {
>> +	/* Bit[23:16]- Stream Id */
>> +	u8 stream_id;
>> +
>> +	/* Bit[15]- Signed */
>> +	bool reply_signed;
>> +
>> +	/* Bit[10:8]- Stream Output Sink Type */
>> +	bool unauthorizable_device_present;
>> +	bool legacy_device_present;
>> +	bool query_capable_device_present;
>> +
>> +	/* Bit[12:11]- Stream Output CP Type */
>> +	bool hdcp_1x_device_present;
>> +	bool hdcp_2x_device_present;
>> +
>> +	/* Bit[4]- Stream Authentication */
>> +	bool auth_completed;
>> +
>> +	/* Bit[3]- Stream Encryption */
>> +	bool encryption_enabled;
>> +
>> +	/* Bit[2]- Stream Repeater Function Present */
>> +	bool repeater_present;
>> +
>> +	/* Bit[1:0]- Stream State */
>> +	u8 state;
>> +};
>
> I really like your comments :)
>
> Anyway-this all looks mostly perfect! The only thing is you forgot to add an
> encode/decode selftest for this into drivers/gpu/drm/selftests/test-
> drm_dp_mst_helper.c (we'll eventually use this once we actually have some
> selftests to test various hub behavior)
>>  
>>  struct drm_dp_sideband_msg_rx {
>>  	u8 chunk[48];
>> @@ -378,6 +406,15 @@ struct drm_dp_remote_i2c_write {
>>  	u8 *bytes;
>>  };
>>  
>> +struct drm_dp_query_stream_enc_status {
>> +	u8 stream_id;
>> +	u8 client_id[7];	/* 56-bit nonce */
>> +	u8 stream_event;
>> +	bool valid_stream_event;
>> +	u8 stream_behavior;
>> +	u8 valid_stream_behavior;
>> +};
>> +
>>  /* this covers ENUM_RESOURCES, POWER_DOWN_PHY, POWER_UP_PHY */
>>  struct drm_dp_port_number_req {
>>  	u8 port_number;
>> @@ -426,6 +463,8 @@ struct drm_dp_sideband_msg_req_body {
>>  
>>  		struct drm_dp_remote_i2c_read i2c_read;
>>  		struct drm_dp_remote_i2c_write i2c_write;
>> +
>> +		struct drm_dp_query_stream_enc_status enc_status;
>>  	} u;
>>  };
>>  
>> @@ -448,6 +487,8 @@ struct drm_dp_sideband_msg_reply_body {
>>  		struct drm_dp_remote_i2c_read_ack_reply remote_i2c_read_ack;
>>  		struct drm_dp_remote_i2c_read_nak_reply remote_i2c_read_nack;
>>  		struct drm_dp_remote_i2c_write_ack_reply remote_i2c_write_ack;
>> +
>> +		struct drm_dp_query_stream_enc_status_ack_reply enc_status;
>>  	} u;
>>  };
>>  
>> @@ -804,6 +845,9 @@ drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state
>> *state,
>>  				 struct drm_dp_mst_port *port);
>>  int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
>>  				 struct drm_dp_mst_port *port, bool power_up);
>> +int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr
>> *mgr,
>> +		struct drm_dp_mst_port *port,
>> +		struct drm_dp_query_stream_enc_status_ack_reply *status);
>>  int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
>>  
>>  void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
