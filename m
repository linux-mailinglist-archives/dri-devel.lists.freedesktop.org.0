Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A78D2985
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C000710E8F9;
	Wed, 29 May 2024 00:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rkavKJ8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F2310EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:41:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3431B9CA;
 Wed, 29 May 2024 02:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716943256;
 bh=Jzvg0gaDh077syTl3HB0M/PZNo1+VAja2QmyQX3maLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkavKJ8Mi52QiNM+H/7vfuobrkjZ4hAccZi3QOF9QOFGLi8CZi7VgPmS0KNW4EW6z
 tfdMCa6bzpsG7MlEZtv9DL4rEZmzZALPg7gTKRBpm4Y740kYSCaAoePBzW+PQD33LX
 wSPAZkSbPLby3N2So84A2SXA1iMfrfcuiHeRrNIw=
Date: Wed, 29 May 2024 03:40:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <20240529004047.GB1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:32PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 9d550f5697fa8..e9683e613d520 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>  	 */
>  	if (!parent) {
>  		/*
> -		 * Avoid warnings in of_graph_get_next_endpoint()
> +		 * Avoid warnings in for_each_endpoint_of_node()
>  		 * if the device doesn't have any graph connections
>  		 */
>  		if (!of_graph_is_present(node))
> @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>  	}
>  
>  	/* Iterate through each output port to discover topology */
> -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> +	for_each_endpoint_of_node(parent, ep) {
>  		/*
>  		 * Legacy binding mixes input/output ports under the
>  		 * same parent. So, skip the input ports if we are dealing

I think there's a bug below. The loop contains

		ret = of_coresight_parse_endpoint(dev, ep, pdata);
		if (ret)
			return ret;

which leaks the reference to ep. This is not introduced by this patch,
so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
