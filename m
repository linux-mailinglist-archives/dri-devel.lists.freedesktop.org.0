Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693FD3BAC99
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360C8997E;
	Sun,  4 Jul 2021 09:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FFD8997E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:53:44 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 906E1829E7;
 Sun,  4 Jul 2021 11:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625392422;
 bh=OrsxZs848qyo1rICgM/flgXE8C9aDjfEUbVNCSSpyp8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jBQufN1SCfe1FZ6LaMk86z6y1RQHc9sCVsCCtpv+95/8rpBktPjNUmCSJ+KNE0DFW
 yUE2DWQWihOQCIp9Q/fmPMAzkACfV5jz4qNgUw1nArttJoVCZCYlK7g5m+umKRDzP3
 iLd4T9gbJhOZoGfBn/VjNitlH6CqFA6wU39PXjesY3yz0fnmM3Iz1IjElI6fEfBJGA
 yxVdL8TlfYqL4OvlS3i7jXoEy+psORTIb4ej5ZldLl+yjAEoK8N5AR4LKQ5i4uUbQw
 Pj4ENz1PPWeo/3V8d6bezJ2p7JDFiXpe3TICPdrPSKR96+oW2gjoC/Ighwe8iEHLcT
 3jZn+zUvpWqXw==
Subject: Re: [PATCH] drm: mxsfb: Support 24-bit SPWG, JEIDA bus formats
To: Jagan Teki <jagan@amarulasolutions.com>, Stefan Agner <stefan@agner.ch>
References: <20210704093857.27961-1-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <bc7f2d6f-f47b-6099-b6d0-4bdd2728dc52@denx.de>
Date: Sun, 4 Jul 2021 11:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704093857.27961-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/21 11:38 AM, Jagan Teki wrote:
> 24-bit SPWG, JEIDA bus formats are considered as 24-bit
> bus widths for LCDC_CTRL register in mxsfb.
> 
> Add support for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 22cb749fc9bc..5657155f9633 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -85,6 +85,8 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
>   		ctrl |= CTRL_BUS_WIDTH_18;
>   		break;
>   	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:

On MX8MM/MN, the bus between LCDIF and DSIM is plain parallel bus, so 
this patch is wrong.

You want to pick
drm: mxsfb: Use bus_format from the nearest bridge if present
and then implement .atomic_get_input_bus_fmts on all your bridges. And 
only then you will get the correct MEDIA_BUS_FMT_RGB888_1X24 here.
