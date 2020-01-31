Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC614EA35
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 10:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C289CF4;
	Fri, 31 Jan 2020 09:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A32F89CF4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:41:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:41:58 -0800
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="223088972"
Received: from bbiernac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:41:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH v4] drm/dp_mst: Fix W=1 warnings
In-Reply-To: <20200131093142.2074-1-benjamin.gaignard@st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200131093142.2074-1-benjamin.gaignard@st.com>
Date: Fri, 31 Jan 2020 11:42:03 +0200
Message-ID: <87v9os7yj8.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jan 2020, Benjamin Gaignard <benjamin.gaignard@st.com> wrote:
> Fix the warnings that show up with W=1.
> They are all about unused but set variables.
> If functions returns are not used anymore make them void.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 4:
> - do not touch crc4 unused variable in this patch
> CC: lyude@redhat.com
> CC: airlied@linux.ie
>  drivers/gpu/drm/drm_dp_mst_topology.c | 78 ++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 4104f15f4594..44a8731665e4 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1034,7 +1034,7 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
>  	}
>  }
>  
> -static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
> +static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
>  
> @@ -1044,17 +1044,14 @@ static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
>  	req.u.dpcd_write.num_bytes = num_bytes;
>  	req.u.dpcd_write.bytes = bytes;
>  	drm_dp_encode_sideband_req(&req, msg);
> -
> -	return 0;
>  }
>  
> -static int build_link_address(struct drm_dp_sideband_msg_tx *msg)
> +static void build_link_address(struct drm_dp_sideband_msg_tx *msg)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
>  
>  	req.req_type = DP_LINK_ADDRESS;
>  	drm_dp_encode_sideband_req(&req, msg);
> -	return 0;
>  }
>  
>  static int build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
> @@ -1077,7 +1074,7 @@ static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg, int por
>  	return 0;
>  }
>  
> -static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_num,
> +static void build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_num,
>  				  u8 vcpi, uint16_t pbn,
>  				  u8 number_sdp_streams,
>  				  u8 *sdp_stream_sink)

W=1 warning cleared, checkpatch warning on indentation introduced...?

BR,
Jani.


> @@ -1093,10 +1090,9 @@ static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_n
>  		   number_sdp_streams);
>  	drm_dp_encode_sideband_req(&req, msg);
>  	msg->path_msg = true;
> -	return 0;
>  }
>  
> -static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
> +static void build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
>  				  int port_num, bool power_up)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
> @@ -1109,7 +1105,6 @@ static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
>  	req.u.port_num.port_number = port_num;
>  	drm_dp_encode_sideband_req(&req, msg);
>  	msg->path_msg = true;
> -	return 0;
>  }
>  
>  static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *mgr,
> @@ -2054,25 +2049,20 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
>  
>  static void drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
>  {
> -	int ret;
> -
>  	memcpy(mstb->guid, guid, 16);
>  
>  	if (!drm_dp_validate_guid(mstb->mgr, mstb->guid)) {
>  		if (mstb->port_parent) {
> -			ret = drm_dp_send_dpcd_write(
> -					mstb->mgr,
> -					mstb->port_parent,
> -					DP_GUID,
> -					16,
> -					mstb->guid);
> +			drm_dp_send_dpcd_write(mstb->mgr,
> +					       mstb->port_parent,
> +					       DP_GUID,
> +					       16,
> +					       mstb->guid);
>  		} else {
> -
> -			ret = drm_dp_dpcd_write(
> -					mstb->mgr->aux,
> -					DP_GUID,
> -					mstb->guid,
> -					16);
> +			drm_dp_dpcd_write(mstb->mgr->aux,
> +					  DP_GUID,
> +					  mstb->guid,
> +					  16);
>  		}
>  	}
>  }
> @@ -2595,7 +2585,7 @@ static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
>  	return false;
>  }
>  
> -static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes)
> +static void build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
>  
> @@ -2604,8 +2594,6 @@ static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
>  	req.u.dpcd_read.dpcd_address = offset;
>  	req.u.dpcd_read.num_bytes = num_bytes;
>  	drm_dp_encode_sideband_req(&req, msg);
> -
> -	return 0;
>  }
>  
>  static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
> @@ -2828,7 +2816,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
>  	struct drm_dp_sideband_msg_tx *txmsg;
>  	struct drm_dp_link_address_ack_reply *reply;
>  	struct drm_dp_mst_port *port, *tmp;
> -	int i, len, ret, port_mask = 0;
> +	int i, ret, port_mask = 0;
>  	bool changed = false;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> @@ -2836,7 +2824,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
>  		return -ENOMEM;
>  
>  	txmsg->dst = mstb;
> -	len = build_link_address(txmsg);
> +	build_link_address(txmsg);
>  
>  	mstb->link_address_sent = true;
>  	drm_dp_queue_down_tx(mgr, txmsg);
> @@ -2898,14 +2886,14 @@ void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
>  					struct drm_dp_mst_branch *mstb)
>  {
>  	struct drm_dp_sideband_msg_tx *txmsg;
> -	int len, ret;
> +	int ret;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
>  	if (!txmsg)
>  		return;
>  
>  	txmsg->dst = mstb;
> -	len = build_clear_payload_id_table(txmsg);
> +	build_clear_payload_id_table(txmsg);
>  
>  	drm_dp_queue_down_tx(mgr, txmsg);
>  
> @@ -2923,7 +2911,6 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
>  {
>  	struct drm_dp_enum_path_resources_ack_reply *path_res;
>  	struct drm_dp_sideband_msg_tx *txmsg;
> -	int len;
>  	int ret;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> @@ -2931,7 +2918,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
>  		return -ENOMEM;
>  
>  	txmsg->dst = mstb;
> -	len = build_enum_path_resources(txmsg, port->port_num);
> +	build_enum_path_resources(txmsg, port->port_num);
>  
>  	drm_dp_queue_down_tx(mgr, txmsg);
>  
> @@ -3014,7 +3001,7 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
>  {
>  	struct drm_dp_sideband_msg_tx *txmsg;
>  	struct drm_dp_mst_branch *mstb;
> -	int len, ret, port_num;
> +	int ret, port_num;
>  	u8 sinks[DRM_DP_MAX_SDP_STREAMS];
>  	int i;
>  
> @@ -3039,9 +3026,9 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
>  		sinks[i] = i;
>  
>  	txmsg->dst = mstb;
> -	len = build_allocate_payload(txmsg, port_num,
> -				     id,
> -				     pbn, port->num_sdp_streams, sinks);
> +	build_allocate_payload(txmsg, port_num,
> +			       id,
> +			       pbn, port->num_sdp_streams, sinks);
>  
>  	drm_dp_queue_down_tx(mgr, txmsg);
>  
> @@ -3070,7 +3057,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port, bool power_up)
>  {
>  	struct drm_dp_sideband_msg_tx *txmsg;
> -	int len, ret;
> +	int ret;
>  
>  	port = drm_dp_mst_topology_get_port_validated(mgr, port);
>  	if (!port)
> @@ -3083,7 +3070,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
>  	}
>  
>  	txmsg->dst = port->parent;
> -	len = build_power_updown_phy(txmsg, port->port_num, power_up);
> +	build_power_updown_phy(txmsg, port->port_num, power_up);
>  	drm_dp_queue_down_tx(mgr, txmsg);
>  
>  	ret = drm_dp_mst_wait_tx_reply(port->parent, txmsg);
> @@ -3305,7 +3292,6 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port,
>  				 int offset, int size, u8 *bytes)
>  {
> -	int len;
>  	int ret = 0;
>  	struct drm_dp_sideband_msg_tx *txmsg;
>  	struct drm_dp_mst_branch *mstb;
> @@ -3320,7 +3306,7 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  		goto fail_put;
>  	}
>  
> -	len = build_dpcd_read(txmsg, port->port_num, offset, size);
> +	build_dpcd_read(txmsg, port->port_num, offset, size);
>  	txmsg->dst = port->parent;
>  
>  	drm_dp_queue_down_tx(mgr, txmsg);
> @@ -3358,7 +3344,6 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
>  				  struct drm_dp_mst_port *port,
>  				  int offset, int size, u8 *bytes)
>  {
> -	int len;
>  	int ret;
>  	struct drm_dp_sideband_msg_tx *txmsg;
>  	struct drm_dp_mst_branch *mstb;
> @@ -3373,7 +3358,7 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
>  		goto fail_put;
>  	}
>  
> -	len = build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
> +	build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
>  	txmsg->dst = mstb;
>  
>  	drm_dp_queue_down_tx(mgr, txmsg);
> @@ -4529,17 +4514,16 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  	mutex_lock(&mgr->lock);
>  	if (mgr->mst_primary) {
>  		u8 buf[DP_PAYLOAD_TABLE_SIZE];
> -		int ret;
>  
> -		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
> +		drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
>  		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
> -		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
> +		drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
>  		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
> -		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
> +		drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
>  		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
>  
>  		/* dump the standard OUI branch header */
> -		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
> +		drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
>  		seq_printf(m, "branch oui: %*phN devid: ", 3, buf);
>  		for (i = 0x3; i < 0x8 && buf[i]; i++)
>  			seq_printf(m, "%c", buf[i]);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
