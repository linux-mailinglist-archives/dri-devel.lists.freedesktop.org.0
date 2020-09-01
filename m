Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D92258B97
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 11:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A266E835;
	Tue,  1 Sep 2020 09:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C0D6E835
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 09:31:24 +0000 (UTC)
IronPort-SDR: n99q6DsJZsPR3dZTg8JeGJ+G3bggr8sCNmusAOtD594VAI9W/sXgVsk+/zfNgXlEPLdHs4tvDd
 L/yOaayyFjHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221362656"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="221362656"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 02:31:23 -0700
IronPort-SDR: RqSVLiw9qETRT6Gh2XJn1KfmSOca1/BnR6hMR3+0aIkTMBITSqT3qEufK96iVz8N0/FpOy0Sfa
 N9NWZ+gGm1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="340965119"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 01 Sep 2020 02:31:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 12:31:20 +0300
Date: Tue, 1 Sep 2020 12:31:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam McNally <sammc@chromium.org>
Subject: Re: [PATCH] drm/dp_mst: Support remote i2c writes
Message-ID: <20200901093120.GD6112@intel.com>
References: <20200727160225.1.I4e95a534de051551cd143e6cb83d4c5a9b0ad1cd@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727160225.1.I4e95a534de051551cd143e6cb83d4c5a9b0ad1cd@changeid>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 04:03:37PM +1000, Sam McNally wrote:
> For DP MST outputs, the i2c device currently only supports transfers
> that can be implemented using remote i2c reads. Such transfers must
> consist of zero or more write transactions followed by one read
> transaction. DDC/CI commands require standalone write transactions and
> hence aren't supported.
> =

> Since each remote i2c write is handled as a separate transfer, remote
> i2c writes can support transfers consisting of write transactions, where
> all but the last have I2C_M_STOP set. According to the DDC/CI 1.1
> standard, DDC/CI commands only require a single write or read
> transaction in a transfer, so this is sufficient.
> =

> For i2c transfers meeting the above criteria, generate and send a remote
> i2c write message for each transaction. Add the trivial remote i2c write
> reply parsing support so remote i2c write acks bubble up correctly.

Looks great.

For good measure I bounced this to intel-gfx so we got
the CI to check it. Seems to have passed.

Amended with
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/37
and pushed to drm-misc-next. Thanks!

> =

> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> =

>  drivers/gpu/drm/drm_dp_mst_topology.c | 106 ++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 09b32289497e..1ac874e4e7a1 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -961,6 +961,8 @@ static bool drm_dp_sideband_parse_reply(struct drm_dp=
_sideband_msg_rx *raw,
>  		return drm_dp_sideband_parse_remote_dpcd_write(raw, msg);
>  	case DP_REMOTE_I2C_READ:
>  		return drm_dp_sideband_parse_remote_i2c_read_ack(raw, msg);
> +	case DP_REMOTE_I2C_WRITE:
> +		return true; /* since there's nothing to parse */
>  	case DP_ENUM_PATH_RESOURCES:
>  		return drm_dp_sideband_parse_enum_path_resources_ack(raw, msg);
>  	case DP_ALLOCATE_PAYLOAD:
> @@ -5326,29 +5328,29 @@ static bool remote_i2c_read_ok(const struct i2c_m=
sg msgs[], int num)
>  		msgs[num - 1].len <=3D 0xff;
>  }
>  =

> -/* I2C device */
> -static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter, struct i2c_m=
sg *msgs,
> -			       int num)
> +static bool remote_i2c_write_ok(const struct i2c_msg msgs[], int num)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num - 1; i++) {
> +		if (msgs[i].flags & I2C_M_RD || !(msgs[i].flags & I2C_M_STOP) ||
> +		    msgs[i].len > 0xff)
> +			return false;
> +	}
> +
> +	return !(msgs[num - 1].flags & I2C_M_RD) && msgs[num - 1].len <=3D 0xff;
> +}
> +
> +static int drm_dp_mst_i2c_read(struct drm_dp_mst_branch *mstb,
> +			       struct drm_dp_mst_port *port,
> +			       struct i2c_msg *msgs, int num)
>  {
> -	struct drm_dp_aux *aux =3D adapter->algo_data;
> -	struct drm_dp_mst_port *port =3D container_of(aux, struct drm_dp_mst_po=
rt, aux);
> -	struct drm_dp_mst_branch *mstb;
>  	struct drm_dp_mst_topology_mgr *mgr =3D port->mgr;
>  	unsigned int i;
>  	struct drm_dp_sideband_msg_req_body msg;
>  	struct drm_dp_sideband_msg_tx *txmsg =3D NULL;
>  	int ret;
>  =

> -	mstb =3D drm_dp_mst_topology_get_mstb_validated(mgr, port->parent);
> -	if (!mstb)
> -		return -EREMOTEIO;
> -
> -	if (!remote_i2c_read_ok(msgs, num)) {
> -		DRM_DEBUG_KMS("Unsupported I2C transaction for MST device\n");
> -		ret =3D -EIO;
> -		goto out;
> -	}
> -
>  	memset(&msg, 0, sizeof(msg));
>  	msg.req_type =3D DP_REMOTE_I2C_READ;
>  	msg.u.i2c_read.num_transactions =3D num - 1;
> @@ -5389,6 +5391,78 @@ static int drm_dp_mst_i2c_xfer(struct i2c_adapter =
*adapter, struct i2c_msg *msgs
>  	}
>  out:
>  	kfree(txmsg);
> +	return ret;
> +}
> +
> +static int drm_dp_mst_i2c_write(struct drm_dp_mst_branch *mstb,
> +				struct drm_dp_mst_port *port,
> +				struct i2c_msg *msgs, int num)
> +{
> +	struct drm_dp_mst_topology_mgr *mgr =3D port->mgr;
> +	unsigned int i;
> +	struct drm_dp_sideband_msg_req_body msg;
> +	struct drm_dp_sideband_msg_tx *txmsg =3D NULL;
> +	int ret;
> +
> +	txmsg =3D kzalloc(sizeof(*txmsg), GFP_KERNEL);
> +	if (!txmsg) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +	for (i =3D 0; i < num; i++) {
> +		memset(&msg, 0, sizeof(msg));
> +		msg.req_type =3D DP_REMOTE_I2C_WRITE;
> +		msg.u.i2c_write.port_number =3D port->port_num;
> +		msg.u.i2c_write.write_i2c_device_id =3D msgs[i].addr;
> +		msg.u.i2c_write.num_bytes =3D msgs[i].len;
> +		msg.u.i2c_write.bytes =3D msgs[i].buf;
> +
> +		memset(txmsg, 0, sizeof(*txmsg));
> +		txmsg->dst =3D mstb;
> +
> +		drm_dp_encode_sideband_req(&msg, txmsg);
> +		drm_dp_queue_down_tx(mgr, txmsg);
> +
> +		ret =3D drm_dp_mst_wait_tx_reply(mstb, txmsg);
> +		if (ret > 0) {
> +			if (txmsg->reply.reply_type =3D=3D DP_SIDEBAND_REPLY_NAK) {
> +				ret =3D -EREMOTEIO;
> +				goto out;
> +			}
> +		} else {
> +			goto out;
> +		}
> +	}
> +	ret =3D num;
> +out:
> +	kfree(txmsg);
> +	return ret;
> +}
> +
> +/* I2C device */
> +static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	struct drm_dp_aux *aux =3D adapter->algo_data;
> +	struct drm_dp_mst_port *port =3D
> +		container_of(aux, struct drm_dp_mst_port, aux);
> +	struct drm_dp_mst_branch *mstb;
> +	struct drm_dp_mst_topology_mgr *mgr =3D port->mgr;
> +	int ret;
> +
> +	mstb =3D drm_dp_mst_topology_get_mstb_validated(mgr, port->parent);
> +	if (!mstb)
> +		return -EREMOTEIO;
> +
> +	if (remote_i2c_read_ok(msgs, num)) {
> +		ret =3D drm_dp_mst_i2c_read(mstb, port, msgs, num);
> +	} else if (remote_i2c_write_ok(msgs, num)) {
> +		ret =3D drm_dp_mst_i2c_write(mstb, port, msgs, num);
> +	} else {
> +		DRM_DEBUG_KMS("Unsupported I2C transaction for MST device\n");
> +		ret =3D -EIO;
> +	}
> +
>  	drm_dp_mst_topology_put_mstb(mstb);
>  	return ret;
>  }
> -- =

> 2.28.0.rc0.142.g3c755180ce-goog
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
