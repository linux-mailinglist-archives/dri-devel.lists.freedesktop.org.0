Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACB63A403
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 10:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1010E2B6;
	Mon, 28 Nov 2022 09:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3C210E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 09:03:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1oza2v-0003CB-QM; Mon, 28 Nov 2022 10:03:25 +0100
Message-ID: <49cee522-261f-da9e-6869-60e68da3e0f2@pengutronix.de>
Date: Mon, 28 Nov 2022 10:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH linux-next] drm/imx: Use device_match_of_node()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
References: <202211171511333735699@zte.com.cn>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <202211171511333735699@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
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
Cc: kernel@pengutronix.de, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 17.11.22 08:11, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with device_match_of_node().

device_match_of_node() exists so a pointer to the function can be passed
to class/driver_find_device. I see no reason to call it directly.

I don't think you should pursue any patches, where you do this
transformation even if they pass a compile test unlike the patch here.

Thanks,
Ahmad

> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index e060fa6cbcb9..2e4f5af894b0 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -182,7 +182,7 @@ static int compare_of(struct device *dev, void *data)
>  	if (strcmp(dev->driver->name, "imx-ipuv3-crtc") == 0) {
>  		struct ipu_client_platformdata *pdata = dev->platform_data;
> 
> -		return pdata->of_node == np;
> +		return device_match_of_node(pdata, np);
>  	}
> 
>  	/* Special case for LDB, one device for two channels */
> @@ -191,7 +191,7 @@ static int compare_of(struct device *dev, void *data)
>  		of_node_put(np);
>  	}
> 
> -	return dev->of_node == np;
> +	return device_match_of_node(dev, np);
>  }
> 
>  static int imx_drm_bind(struct device *dev)

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

