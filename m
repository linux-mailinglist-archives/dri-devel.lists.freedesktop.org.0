Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFD3E0E54
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 08:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219EC6E20C;
	Thu,  5 Aug 2021 06:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3056E1E0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 06:29:10 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A51E51D;
 Thu,  5 Aug 2021 08:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628144948;
 bh=3z9Q2Z8apmPEse6MdhNZZZOwcN0SulirRoID4GuS7dQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=baK7HzMnEv8loa6OzQG/f2+dCC8Pi1mPaNFIYUIaNV120AIJOhV29Fp7ig1qmut14
 PgDkeesg76vGrBoGo/5EPu+bHGpDDWOatg8dEeL1vXS26jb8MSV3Y6IUU0Lj7Rf1Px
 fT+ie9XYABgPFGvo2F8ai5rQ9Mc+jG5+NL42ZndE=
Subject: Re: [PATCH v2 2/9] drm/omap: Cast pointer to integer without
 generating warning
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <071cfe80-2274-b016-7546-13778a2639ef@ideasonboard.com>
Date: Thu, 5 Aug 2021 09:29:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 31/07/2021 04:39, Laurent Pinchart wrote:
> On 64-bit platforms, the compiler complains that casting a void pointer
> to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
> to fix this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index f86e20578143..c05d3975cb31 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	priv->dss->mgr_ops_priv = priv;
>   
>   	soc = soc_device_match(omapdrm_soc_devices);
> -	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> +	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
>   	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
>   
>   	mutex_init(&priv->list_lock);
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
