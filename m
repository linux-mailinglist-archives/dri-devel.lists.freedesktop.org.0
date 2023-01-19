Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C828673D47
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998F10E979;
	Thu, 19 Jan 2023 15:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F6610E979
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:17:56 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pIWfe-0000BA-C4; Thu, 19 Jan 2023 16:17:42 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pIWfW-0001oM-RK; Thu, 19 Jan 2023 16:17:34 +0100
Date: Thu, 19 Jan 2023 16:17:34 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v2 5/6] drm/rockchip: vop2: add support for the rgb
 output block
Message-ID: <20230119151734.GH24755@pengutronix.de>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
 <20230119143911.3793654-6-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119143911.3793654-6-michael.riesch@wolfvision.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Thu, Jan 19, 2023 at 03:39:10PM +0100, Michael Riesch wrote:
> The Rockchip VOP2 features an internal RGB output block, which can be
> attached to the video port 2 of the VOP2. Add support for this output
> block.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
> v2:
>  - move away from wrong assumption that the RGB block is always
>    connected to video port 2 -> check devicetree to find RGB block

Traces of that assumption are still in the commmit message.

> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> +static int vop2_find_rgb_encoder(struct vop2 *vop2)
> +{
> +	struct device_node *node = vop2->dev->of_node;
> +	struct device_node *endpoint;
> +	int i;
> +
> +	for (i = 0; i < vop2->data->nr_vps; i++) {
> +		endpoint = of_graph_get_endpoint_by_regs(node, i,
> +							 ROCKCHIP_VOP2_EP_RGB0);
> +		if (!endpoint)
> +			continue;
> +
> +		of_node_put(endpoint);
> +		return i;
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
>  	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
>  	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
> @@ -2698,11 +2721,29 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> +	ret = vop2_find_rgb_encoder(vop2);
> +	if (ret > 0) {

'0' seems to be a valid vp as well. Shouldn't this be ret >= 0?

> +		vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[ret].crtc,
> +					      vop2->drm, ret);
> +		if (IS_ERR(vop2->rgb)) {
> +			if (PTR_ERR(vop2->rgb) == -EPROBE_DEFER) {
> +				ret = PTR_ERR(vop2->rgb);
> +				goto err_crtcs;
> +			}
> +			vop2->rgb = NULL;
> +		}
> +	}
> +

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
