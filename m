Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9642D707B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 07:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4576EC59;
	Fri, 11 Dec 2020 06:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B306EC57;
 Fri, 11 Dec 2020 06:58:59 +0000 (UTC)
IronPort-SDR: yJd5NSifnqt2rLYjRVC2DVzykf4eOvdPcO5LY38BKLPJ6jJUjijCpus12D+Z/EENZeFirX78Yp
 MsvlzsvjhrgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="173624969"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="173624969"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:58:59 -0800
IronPort-SDR: 8TWDQJuRCsio8JbCqx0caDRf7pNUXVa43ff1aZWfm7gtRZyTLXHpzJPy/3FRKMnmLKOxOua6vp
 5DjqitJsVUJA==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="440549871"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:58:56 -0800
Date: Fri, 11 Dec 2020 12:28:45 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v7 14/18] drm/i915/hdcp: MST streams support in hdcp
 port_data
Message-ID: <20201211065844.GD1297@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
 <20201210062640.11783-15-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210062640.11783-15-anshuman.gupta@intel.com>
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
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 uma.shankar@intel.com, seanpaul@chromium.org, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-10 at 11:56:36 +0530, Anshuman Gupta wrote:
> Add support for multiple mst stream in hdcp port data
> which will be used by RepeaterAuthStreamManage msg and
> HDCP 2.2 security f/w for m' validation.
> 
> Security f/w doesn't have any provision to mark the
> stream_type for each stream separately, it just take
> single input of stream_type while authenticating the
> port.
".. authenticating the port and applies the same stream type to all ports"
> So driver mark each stream_type with common
> highest supported content type for all streams in
> DP MST Topology.
> 
> Security f/w supports RepeaterAuthStreamManage msg and m'
You could add "though it is not mandatory"
> validation only once during port authentication and encryption.
> Ideally it should support dynamic update of content_type
> and should support RepeaterAuthStreamManage msg and m' validation
> whenever required.
> 
> v2:
> - Init the hdcp port data k for HDMI/DP SST stream.
> v3:
> - Cosmetic changes. [Uma]
> v4:
> - 's/port_auth/hdcp_port_auth'. [Ram]
> - Commit log improvement.
> v5:
> - Comment and commit log improvement. [Ram]
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   4 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 113 +++++++++++++++---
>  2 files changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b74c10c8b01c..b37a02a73de6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1502,10 +1502,12 @@ struct intel_digital_port {
>  	enum phy_fia tc_phy_fia;
>  	u8 tc_phy_fia_idx;
>  
> -	/* protects num_hdcp_streams reference count, hdcp_port_data */
> +	/* protects num_hdcp_streams reference count, hdcp_port_data and hdcp_auth_status */
>  	struct mutex hdcp_mutex;
>  	/* the number of pipes using HDCP signalling out of this port */
>  	unsigned int num_hdcp_streams;
> +	/* port HDCP auth status */
> +	bool hdcp_auth_status;
>  	/* HDCP port data need to pass to security f/w */
>  	struct hdcp_port_data hdcp_port_data;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 2bec26123a05..c21a6a6c545c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -26,6 +26,74 @@
>  #define KEY_LOAD_TRIES	5
>  #define HDCP2_LC_RETRY_CNT			3
>  
> +static int intel_conn_to_vcpi(struct intel_connector *connector)
> +{
> +	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
> +	return connector->port	? connector->port->vcpi.vcpi : 0;
> +}
> +
> +/*
> + * intel_hdcp_required_content_stream select most highest common possible HDCP
selects the most
> + * content_type for all streams in DP MST topology because security f/w doesn't
> + * have any provision to mark content_type for each stream separately, it marks
> + * all available streams with the content_type proivided at the time of port
> + * authentication. This may prohibit the userspace to use type1 content on
> + * HDCP 2.2 capable sink because of other sink are not capable of HDCP 2.2 in
> + * DP MST topology. Ideally security f/w should change its policy to mark
Though it is not compulsary, security fw should
> + * different content_type for different streams.
content types

with these addressed LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> + */
> +static int
> +intel_hdcp_required_content_stream(struct intel_digital_port *dig_port)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct intel_digital_port *conn_dig_port;
> +	struct intel_connector *connector;
> +	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
> +	bool enforce_type0 = false;
> +	int k;
> +
> +	if (dig_port->hdcp_auth_status)
> +		return 0;
> +
> +	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
> +	for_each_intel_connector_iter(connector, &conn_iter) {
> +		if (!intel_encoder_is_mst(intel_attached_encoder(connector)))
> +			continue;
> +
> +		conn_dig_port = intel_attached_dig_port(connector);
> +		if (conn_dig_port != dig_port)
> +			continue;
> +
> +		if (connector->base.status == connector_status_disconnected)
> +			continue;
> +
> +		if (!enforce_type0 && !intel_hdcp2_capable(connector))
> +			enforce_type0 = true;
> +
> +		data->streams[data->k].stream_id = intel_conn_to_vcpi(connector);
> +		data->k++;
> +
> +		/* if there is only one active stream */
> +		if (dig_port->dp.active_mst_links <= 1)
> +			break;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	if (drm_WARN_ON(&i915->drm, data->k > INTEL_NUM_PIPES(i915) || data->k == 0))
> +		return -EINVAL;
> +
> +	/*
> +	 * Apply common protection level across all streams in DP MST Topology.
> +	 * Use highest supported content type for all streams in DP MST Topology.
> +	 */
> +	for (k = 0; k < data->k; k++)
> +		data->streams[k].stream_type =
> +			enforce_type0 ? DRM_MODE_HDCP_CONTENT_TYPE0 : DRM_MODE_HDCP_CONTENT_TYPE1;
> +
> +	return 0;
> +}
> +
>  static
>  bool intel_hdcp_is_ksv_valid(u8 *ksv)
>  {
> @@ -1471,13 +1539,14 @@ static
>  int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	union {
>  		struct hdcp2_rep_stream_manage stream_manage;
>  		struct hdcp2_rep_stream_ready stream_ready;
>  	} msgs;
>  	const struct intel_hdcp_shim *shim = hdcp->shim;
> -	int ret;
> +	int ret, streams_size_delta, i;
>  
>  	if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
>  		return -ERANGE;
> @@ -1486,16 +1555,18 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  	msgs.stream_manage.msg_id = HDCP_2_2_REP_STREAM_MANAGE;
>  	drm_hdcp_cpu_to_be24(msgs.stream_manage.seq_num_m, hdcp->seq_num_m);
>  
> -	/* K no of streams is fixed as 1. Stored as big-endian. */
> -	msgs.stream_manage.k = cpu_to_be16(1);
> +	msgs.stream_manage.k = cpu_to_be16(data->k);
>  
> -	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
> -	msgs.stream_manage.streams[0].stream_id = 0;
> -	msgs.stream_manage.streams[0].stream_type = hdcp->content_type;
> +	for (i = 0; i < data->k; i++) {
> +		msgs.stream_manage.streams[i].stream_id = data->streams[i].stream_id;
> +		msgs.stream_manage.streams[i].stream_type = data->streams[i].stream_type;
> +	}
>  
> +	streams_size_delta = (HDCP_2_2_MAX_CONTENT_STREAMS_CNT - data->k) *
> +				sizeof(struct hdcp2_streamid_type);
>  	/* Send it to Repeater */
>  	ret = shim->write_2_2_msg(dig_port, &msgs.stream_manage,
> -				  sizeof(msgs.stream_manage));
> +				  sizeof(msgs.stream_manage) - streams_size_delta);
>  	if (ret < 0)
>  		goto out;
>  
> @@ -1504,8 +1575,7 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  	if (ret < 0)
>  		goto out;
>  
> -	dig_port->hdcp_port_data.seq_num_m = hdcp->seq_num_m;
> -	dig_port->hdcp_port_data.streams[0].stream_type = hdcp->content_type;
> +	data->seq_num_m = hdcp->seq_num_m;
>  
>  	ret = hdcp2_verify_mprime(connector, &msgs.stream_ready);
>  
> @@ -1666,6 +1736,7 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
>  						 port),
>  				    LINK_ENCRYPTION_STATUS,
>  				    HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
> +	dig_port->hdcp_auth_status = true;
>  
>  	return ret;
>  }
> @@ -1740,11 +1811,9 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> -	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
> -	struct intel_hdcp *hdcp = &connector->hdcp;
> -	int ret, i, tries = 3;
> +	int ret = 0, i, tries = 3;
>  
> -	for (i = 0; i < tries; i++) {
> +	for (i = 0; i < tries && !dig_port->hdcp_auth_status; i++) {
>  		ret = hdcp2_authenticate_sink(connector);
>  		if (!ret) {
>  			ret = hdcp2_propagate_stream_management_info(connector);
> @@ -1754,7 +1823,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  					    ret);
>  				break;
>  			}
> -			data->streams[0].stream_type = hdcp->content_type;
> +
>  			ret = hdcp2_authenticate_port(connector);
>  			if (!ret)
>  				break;
> @@ -1789,7 +1858,9 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  
>  static int _intel_hdcp2_enable(struct intel_connector *connector)
>  {
> +	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> +	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
>  
> @@ -1797,6 +1868,16 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
>  		    connector->base.name, connector->base.base.id,
>  		    hdcp->content_type);
>  
> +	/* Stream which requires encryption */
> +	if (!intel_encoder_is_mst(intel_attached_encoder(connector))) {
> +		data->k = 1;
> +		data->streams[0].stream_type = hdcp->content_type;
> +	} else {
> +		ret = intel_hdcp_required_content_stream(dig_port);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = hdcp2_authenticate_and_encrypt(connector);
>  	if (ret) {
>  		drm_dbg_kms(&i915->drm, "HDCP2 Type%d  Enabling Failed. (%d)\n",
> @@ -1814,7 +1895,9 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
>  
>  static int _intel_hdcp2_disable(struct intel_connector *connector)
>  {
> +	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> +	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
>  	int ret;
>  
>  	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
> @@ -1826,6 +1909,8 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
>  		drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
>  
>  	connector->hdcp.hdcp2_encrypted = false;
> +	dig_port->hdcp_auth_status = false;
> +	data->k = 0;
>  
>  	return ret;
>  }
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
