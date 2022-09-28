Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD395ED188
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB22610E1CE;
	Wed, 28 Sep 2022 00:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9310E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:16:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6139084CBC;
 Wed, 28 Sep 2022 02:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664324215;
 bh=HNdkIBbJj0k0zpzg2qh8iWw67RPhJXRCY72enmGMIa0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EfWdOq1K7q2oafV7kLd0aBbFR9A11NUYmHazYZK7JDCWVVbYfWBkf6/K+h4mO6x9C
 q7NJ1peIzo/24EvK7CJPCP7minTbueCj/bUeg5Sj5SOkhjpCNVJqS3iPWR+oVfMWSt
 909Ai6lc+1xM4IDKBVeyiichBNp76DpctBD6VoxkG2/Im/SRdcy1LLgomBfTLtuUb8
 9tFvy2jtX68fRdt1FjuQSCxhi6pzT7CHy8d8mPkkTbCnbf7hwrTDI6ZjWSaXB9785H
 /VHXe6aViaEkHKSVwZqylrpcQLE0DH4f6JGzgzVgI1Fc6XYV7XMXmMXYAGcTIUs3CM
 FrhgkLpeQf78w==
Message-ID: <594e0470-f0b0-8c46-edb9-163bbcb5ecf1@denx.de>
Date: Wed, 28 Sep 2022 02:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/4] drm: lcdif: Add support for YUV planes
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-5-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220927233821.8007-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 01:38, Laurent Pinchart wrote:

Hi,

[...]

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index ba84b51598b3..a97a5f512aae 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c

[...]

> @@ -37,9 +38,10 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
>   {
>   	struct drm_device *drm = lcdif->drm;
>   	const u32 format = lcdif->crtc.primary->state->fb->format->format;
> +	bool in_yuv = false;
> +	bool out_yuv = false;
>   
> -	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> -
> +	/* HDMI output */

Should this comment really be here ? The IP can be connected to either 
LVDS serializer/DSI bridge/HDMI , it is not just HDMI output IP.

>   	switch (bus_format) {
>   	case MEDIA_BUS_FMT_RGB565_1X16:
>   		writel(DISP_PARA_LINE_PATTERN_RGB565,

[...]

Reviewed-by: Marek Vasut <marex@denx.de>
