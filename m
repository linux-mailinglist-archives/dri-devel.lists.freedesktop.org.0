Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB403E98D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 21:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69096E1A8;
	Wed, 11 Aug 2021 19:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8486E1A8;
 Wed, 11 Aug 2021 19:34:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="276241668"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="276241668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 12:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="516913845"
Received: from gdthomps-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.76])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 12:34:21 -0700
Date: Wed, 11 Aug 2021 15:34:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juston Li <juston.li@intel.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, anshuman.gupta@intel.com, ramalingam.c@intel.com
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/hdcp: read RxInfo once when
 reading RepeaterAuth_Send_ReceiverID_List
Message-ID: <YRQmPJjT7SgGwXsX@intel.com>
References: <20210810235212.138721-1-juston.li@intel.com>
 <20210810235212.138721-3-juston.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810235212.138721-3-juston.li@intel.com>
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

On Tue, Aug 10, 2021 at 04:52:11PM -0700, Juston Li wrote:
> When reading RepeaterAuth_Send_ReceiverID_List, RxInfo is read by itself
> once to retrieve the DEVICE_COUNT to calculate the size of the
> ReceiverID list then read a second time as a part of reading ReceiverID
> list.
> 
> On some MST docking stations, RxInfo can only be read after the RxStatus
> READY bit is set otherwise the read will return -EIO. The spec states that
> the READY bit should be cleared as soon as RxInfo has been read.
> 
> In this case, the first RxInfo read succeeds but after the READY bit is
> cleared, the second read fails.
> 
> Fix it by reading RxInfo once and storing it before reading the rest of
> RepeaterAuth_Send_ReceiverID_List once we know the size.
> 
> Modify get_receiver_id_list_size() to read and store RxInfo in the
> message buffer and also parse DEVICE_COUNT so we know the size of
> RepeaterAuth_Send_ReceiverID_List.
> 
> Afterwards, retrieve the rest of the message at the offset for
> seq_num_V.
> 
> Changes in v4:
> - rebase and edit commit message
> 
> Changes in v3:
> - remove comment
> 
> Changes in v2:
> - remove unnecessary moving of drm_i915_private from patch 1
> 
> Signed-off-by: Juston Li <juston.li@intel.com>
> Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 30 ++++++++++----------
>  include/drm/drm_dp_helper.h                  |  2 +-
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 1d0096654776..526fd58b9b51 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -496,11 +496,10 @@ get_rxinfo_hdcp_1_dev_downstream(struct intel_digital_port *dig_port, bool *hdcp
>  }
>  
>  static
> -ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
> +ssize_t get_receiver_id_list_rx_info(struct intel_digital_port *dig_port, u32 *dev_cnt, u8 *byte)
>  {
> -	u8 rx_info[HDCP_2_2_RXINFO_LEN];
> -	u32 dev_cnt;
>  	ssize_t ret;
> +	u8 *rx_info = byte;
>  
>  	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
>  			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
> @@ -508,15 +507,11 @@ ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
>  	if (ret != HDCP_2_2_RXINFO_LEN)
>  		return ret >= 0 ? -EIO : ret;
>  
> -	dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
> +	*dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
>  		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
>  
> -	if (dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
> -		dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
> -
> -	ret = sizeof(struct hdcp2_rep_send_receiverid_list) -
> -		HDCP_2_2_RECEIVER_IDS_MAX_LEN +
> -		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
> +	if (*dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
> +		*dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
>  
>  	return ret;
>  }
> @@ -534,6 +529,7 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>  	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
>  	ktime_t msg_end = ktime_set(0, 0);
>  	bool msg_expired;
> +	u32 dev_cnt;
>  
>  	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
>  	if (!hdcp2_msg_data)
> @@ -546,17 +542,21 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
>  
>  	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
>  
> +	/* DP adaptation msgs has no msg_id */
> +	byte++;
> +
>  	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
> -		ret = get_receiver_id_list_size(dig_port);
> +		ret = get_receiver_id_list_rx_info(dig_port, &dev_cnt, byte);
>  		if (ret < 0)
>  			return ret;
>  
> -		size = ret;
> +		byte += ret;
> +		size = sizeof(struct hdcp2_rep_send_receiverid_list) -
> +		HDCP_2_2_RXINFO_LEN - HDCP_2_2_RECEIVER_IDS_MAX_LEN +
> +		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
>  	}
> -	bytes_to_recv = size - 1;
>  
> -	/* DP adaptation msgs has no msg_id */
> -	byte++;
> +	bytes_to_recv = size - 1;
>  
>  	while (bytes_to_recv) {
>  		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h

I was about to merge to drm-intel-next but then I noticed this..

So we need to cc Dave and Daniel here to get an ack from them.

> index 3f2715eb965f..7476e7c6d0be 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1413,7 +1413,7 @@ enum drm_dp_phy {
>  #define DP_HDCP_2_2_LC_INIT_OFFSET		DP_HDCP_2_2_REG_RN_OFFSET
>  #define DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET	DP_HDCP_2_2_REG_LPRIME_OFFSET
>  #define DP_HDCP_2_2_SKE_SEND_EKS_OFFSET		DP_HDCP_2_2_REG_EDKEY_KS_OFFSET
> -#define DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET	DP_HDCP_2_2_REG_RXINFO_OFFSET
> +#define DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET	DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET

I'm not familiar with this so I'm not sure if this should be a separated patch
or better explained in the commit message.

Dave/Daniel how do you prefer this?

>  #define DP_HDCP_2_2_REP_SEND_ACK_OFFSET		DP_HDCP_2_2_REG_V_OFFSET
>  #define DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET	DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET
>  #define DP_HDCP_2_2_REP_STREAM_READY_OFFSET	DP_HDCP_2_2_REG_MPRIME_OFFSET
> -- 
> 2.31.1
> 
