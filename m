Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B778B66A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 19:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6B10E2F3;
	Mon, 28 Aug 2023 17:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5817B10E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 17:28:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EF175AA;
 Mon, 28 Aug 2023 19:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693243612;
 bh=eJNgE5A2Oc+9HepIe/SpnMELLL/klKBosOpPUS0JGNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5wqfKislpr+uUXmhUgG/zFj+1evrnIt2E54qcPYPhXFYYyNxpd1eR3UbVvd325Ab
 ofJMbso5w/WwdRX20NwtygidpX44Pv2TkqPym+vbda1IaniriWZt7aTQPe0lyn23xC
 e1zevjRQw8hiWufyUsPvL6PeEY+MmZw/opni4d30=
Date: Mon, 28 Aug 2023 20:28:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Subject: Re: [PATCH] drm/bridge: imx: fix potential NULL pointer dereference
 in imx8qxp_ldb_parse_dt_companion()
Message-ID: <20230828172822.GE14596@pendragon.ideasonboard.com>
References: <tencent_026E4B04ACDCE341411EF54862F8C6AB1605@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_026E4B04ACDCE341411EF54862F8C6AB1605@qq.com>
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, andrzej.hajda@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhang,

Thank you for the patch.

On Tue, Aug 29, 2023 at 12:55:01AM +0800, Zhang Shurong wrote:
> of_match_device() may fail and returns a NULL pointer.

How can it return a NULL pointer here ?

> Fix this by checking the return value of of_match_device().
> 
> Fixes: 3818715f62b4 ("drm/bridge: imx: Add LDB support for i.MX8qxp")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index 7984da9c0a35..d272f35c8eac 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -488,6 +488,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
>  	 * string.
>  	 */
>  	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match)
> +		return -ENODEV;
>  	if (!of_device_is_compatible(companion, match->compatible)) {
>  		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
>  		ret = -ENXIO;

-- 
Regards,

Laurent Pinchart
