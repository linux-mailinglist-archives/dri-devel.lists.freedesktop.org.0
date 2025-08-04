Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D996CB1A16B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 14:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CAE10E1E0;
	Mon,  4 Aug 2025 12:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MArvm4Y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1210E1E0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 12:29:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250804122945euoutp02438a907698d22ca6f89463fee5cda2a7~YkC7kgiv92203622036euoutp02p
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 12:29:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250804122945euoutp02438a907698d22ca6f89463fee5cda2a7~YkC7kgiv92203622036euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1754310585;
 bh=gjGB41TXtm7EJnthNQJ5AzH/mdp0g+a0I4A+4VD5ihE=;
 h=Date:Subject:To:From:In-Reply-To:References:From;
 b=MArvm4Y87fkENJBZC/LP2iohmrSOnPIjL3Xi68nTih/jFnnezyqn6v9PvbEqpa25e
 hMD8EGUIB2A7NtKhNGKA2lpEC6yYFU6bBr0r3s8Cg5B32AI8SrLHRlchXrjIjZLxNw
 o1GWtKKqC5fgT4HJ9lp/wK6FEKDR5aTHI6kpchlI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250804122945eucas1p2078d2152e2306b4b5fea70c11d6408e0~YkC7GTraK0290002900eucas1p2B;
 Mon,  4 Aug 2025 12:29:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250804122943eusmtip25bc1a12bb6a7913207f8a655cad8e263~YkC5rdxV30364903649eusmtip2Q;
 Mon,  4 Aug 2025 12:29:43 +0000 (GMT)
Message-ID: <e0121a48-1a69-453b-b58b-8e282956165b@samsung.com>
Date: Mon, 4 Aug 2025 14:29:43 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix potential double-free in
 TE GPIO handling
To: Miaoqian Lin <linmq006@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250804122418.104360-1-linmq006@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250804122945eucas1p2078d2152e2306b4b5fea70c11d6408e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250804122429eucas1p29db20ca392de43a1d6c113dcd4b1b47d
X-EPHeader: CA
X-CMS-RootMailID: 20250804122429eucas1p29db20ca392de43a1d6c113dcd4b1b47d
References: <CGME20250804122429eucas1p29db20ca392de43a1d6c113dcd4b1b47d@eucas1p2.samsung.com>
 <20250804122418.104360-1-linmq006@gmail.com>
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

On 04.08.2025 14:24, Miaoqian Lin wrote:
> The devm_gpiod_get_optional() function uses device-managed resources that
> are automatically cleaned up. The
> gpiod_put() calls in both the error path of samsung_dsim_register_te_irq()
> and in samsung_dsim_unregister_te_irq() are redundant and may lead to
> double-free when the device is removed.
>
> Fixes: e7447128ca4a ("drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index bccc88d25948..6ffaee6b7738 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1691,7 +1691,6 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
>   				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
>   	if (ret) {
>   		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
> -		gpiod_put(dsi->te_gpio);
>   		return ret;
>   	}
>   
> @@ -1790,10 +1789,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   
>   static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
>   {
> -	if (dsi->te_gpio) {
> +	if (dsi->te_gpio)
>   		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
> -		gpiod_put(dsi->te_gpio);
> -	}
>   }
>   
>   static int samsung_dsim_host_detach(struct mipi_dsi_host *host,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

