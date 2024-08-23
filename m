Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456495CBAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 13:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2314910E030;
	Fri, 23 Aug 2024 11:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1018 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 11:49:14 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FE310E030
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 11:49:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WqyWm6gp2z6K5qM;
 Fri, 23 Aug 2024 19:29:08 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 44505140447;
 Fri, 23 Aug 2024 19:32:13 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:32:04 +0100
Date: Fri, 23 Aug 2024 12:32:03 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
CC: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
Subject: Re: [PATCH -next 1/5] drm/rockchip: Use
 for_each_child_of_node_scoped()
Message-ID: <20240823123203.00002aac@Huawei.com>
In-Reply-To: <20240823092053.3170445-2-ruanjinjie@huawei.com>
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-2-ruanjinjie@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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

On Fri, 23 Aug 2024 17:20:49 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

There is more to do here, and looking at the code, I'm far from
sure it isn't releasing references it never had.

> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 9a01aa450741..f5b3f18794dd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -548,7 +548,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	struct device_node *remote = NULL;
> -	struct device_node  *port, *endpoint;

Odd extra space before *port in original. Clean that up whilst here.


> +	struct device_node  *port;

Use __free(device_node) for *port as well.

So where the current asignment is.
	struct device_node *port = of_graph_get_port_by_id(dev->of_node, 1);

>  	int ret = 0, child_count = 0;
>  	const char *name;
>  	u32 endpoint_id = 0;
> @@ -560,15 +560,13 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  			      "can't found port point, please init lvds panel port!\n");
>  		return -EINVAL;
>  	}
> -	for_each_child_of_node(port, endpoint) {
> +	for_each_child_of_node_scoped(port, endpoint) {
>  		child_count++;
>  		of_property_read_u32(endpoint, "reg", &endpoint_id);
>  		ret = drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
>  						  &lvds->panel, &lvds->bridge);
> -		if (!ret) {
> -			of_node_put(endpoint);
> +		if (!ret)
>  			break;

This then can simply be
			return dev_err_probe(dev, ret,
					     "failed to find pannel and bridge node\n");
> -		}

Various other paths become direct returns as well.

>  	}

The later code with remote looks suspect as not obvious who got the reference that
is being put but assuming that is correct, it's another possible place for __free based
cleanup.


>  	if (!child_count) {
>  		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");

