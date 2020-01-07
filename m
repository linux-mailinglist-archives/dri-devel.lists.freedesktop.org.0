Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544371321F3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 10:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE4F6E80B;
	Tue,  7 Jan 2020 09:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DEE6E80B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 09:11:47 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200107091145euoutp0230633e4fbe80401808519e055d5e2527~nj801obgP0351603516euoutp02v
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 09:11:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200107091145euoutp0230633e4fbe80401808519e055d5e2527~nj801obgP0351603516euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578388305;
 bh=ehqWwSoKCQoHC1lE91GDoZ7a0XVFmoykBNr0Hws72co=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=grSllVfUQLOB7q6mzkVlE3vxShUIp7OFaRNudoQxaOgimp0zCMZO1xn+Kx2PdRa+U
 NrqZ5EEyhlIwp+iYdz24DwpVmNtZhxaUYfVyzeI66WcVZdYwnFu96msUx/6yYvXkji
 5rKl7imgHiZ3F5jF0llmq/cMDUNRZ4Bz0imI8sJg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200107091145eucas1p15a4d89046fd51c9cad8824329567e63b~nj80g8nnh1700117001eucas1p1f;
 Tue,  7 Jan 2020 09:11:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 09.60.60698.15B441E5; Tue,  7
 Jan 2020 09:11:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200107091145eucas1p233a51ee33da45a0f0b2f8b75758d2c8d~nj80JwUkj2162121621eucas1p2a;
 Tue,  7 Jan 2020 09:11:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200107091145eusmtrp2b8f124bb7ed9f4e09a1b7f02d0e90856~nj80JA-Fg1968619686eusmtrp2V;
 Tue,  7 Jan 2020 09:11:45 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-80-5e144b51b756
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 01.D7.07950.15B441E5; Tue,  7
 Jan 2020 09:11:45 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107091144eusmtip146ceb4c7fa764fc7b7e4d709a12157ac~nj8zemt5f1210612106eusmtip1w;
 Tue,  7 Jan 2020 09:11:44 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/exynos: dsi: Fix bridge chain handling
To: Boris Brezillon <boris.brezillon@collabora.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Inki Dae
 <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Eric Anholt <eric@anholt.net>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3cf5afd7-9bdf-25ac-0683-2b72105681eb@samsung.com>
Date: Tue, 7 Jan 2020 10:11:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191227144124.210294-3-boris.brezillon@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfSyUcRzf757n7h6X0+Oc+U5KTrORyLT1LM1q+eNWf8RfrYx6yjMsh+68
 15aXkZfivBVH08ulRiivR2OccYlOHdrNvKT5g+ZiQomS81D++3w/n8/3+/l9th+BiYa59kR4
 ZAwjj6QjJDwB3ty7qj8ScE4cfLSyez81WqvnUv0D7zjU8PI8j+pMGUJUwaQSp0Z+zGJU39wI
 Ts1MfMSp96lzfCorX82ntLmBVEnhLO+UpTR1vpcnnTem86WacTWSlmWWcqVvlQaOdDJHx5Hm
 NlYhaee9QtyfuCQ4GcJEhMcxck/fK4KwWqMOi853TVi9/wxPRg+dspEFAeQxyBtI42YjASEi
 XyDINeoQOywhSC37tK18R1BrGkU7K4a8epwVniOoHinis4MJQdtSF2522ZBnQFPxeOuWmBzA
 YO3nBtcsYKQzrHTPbJ3ikV6QbcrmmbGQ9IXX+Zlbyzh5CPRlNXwztiWDYKO0icN6rKGvdHrT
 QxAWpB9UZ4nZk47QYirHWGwHo9MVHHMukCY+tLY18dln+0FJRzqHxTbwVde4zTvARuvOQhqC
 KX0Nnx3uIhhKLdku7QNj+l88czJGukJdmydLn4Y8YxdmpoG0AqPJmn2EFRQ0P9imhZCZIWLd
 LqDS1f6L7fpgwJRIotrVTLWrjmpXHdX/3EcIr0J2TKxCFsoovCOZeA8FLVPERoZ6XIuS1aPN
 v9b/R7esQR3rV7WIJJDEUqh0sAkWcek4RaJMi4DAJGKhm7s4WCQMoROTGHnUZXlsBKPQon0E
 LrETej+ZDRKRoXQMc51hohn5jsohLOyT0d6WSsdF0Z5F16JX7Rkaul5d0R1g3d6f4++dFFiN
 /e4ZL16ThZvqw8Tcbxd76vAkzbLHl+6nN8/Ga1rXDVnKhZSGjjsTt06srFkcLBaPHbCZdmgf
 xAUuqrHZgs8vnY77DHrcWCDUt63gfAJdaDekdRZfeJNn63y4PKHB3TCV2ynBFWG0lxsmV9B/
 AYyhs51nAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qB3iJxBgfms1rcWneO1eL0mVNM
 Fle+vmezONB4mdFi0v0JLBZXv79ktjj55iqLxYt7F1kszja9YbfonLiE3eJQX7TFjMkv2Rx4
 PJreH2PzeH+jld1jx90ljB6zO2ayepyYcInJ4373cSaPvi2rGD0O9E5mCeCI0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtYd+M4c8FEzYqf05ay
 NDDOVexi5OSQEDCRuNS/iQXEFhJYyijRcdEWIi4jcXJaAyuELSzx51oXWxcjF1DNa0aJZyfP
 gSWEBZwldsxfyAiSEBE4xyyx4kgHWIJZQFni2+EXjBAdFxklXncuZAZJsAkYSnS9BRnFycEr
 YCexcWIH2GoWARWJc7PXsoPYogKxEts3P2SGqBGUODnzCVANBwengIvE6k4RiPlmEvOgSpgF
 5CW2v50DZYtL3Hoyn2kCo9AsJN2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ
 +bmbGIFRvO3Yzy07GLveBR9iFOBgVOLhtZASjhNiTSwrrsw9xCjBwawkwqulIxInxJuSWFmV
 WpQfX1Sak1p8iNEU6LeJzFKiyfnABJNXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1
 tSC1CKaPiYNTqoHR95gLp4Yoc/fd6vhdpRU9U45Ya128/vKHVniZ4qaS4lOyJU9EpdNPP6vN
 UBH3XD/37jufz1dbZ19ZvIYteCNbc8XE5uYlzDNkZzMIFRdyOa/dNummuMtRLrXyHQopZto3
 dFVq9zZvf6n7yyTu0feX6fcrM1M/bbVebZD41VR7ctffNa198j5KLMUZiYZazEXFiQCFGEJa
 +AIAAA==
X-CMS-MailID: 20200107091145eucas1p233a51ee33da45a0f0b2f8b75758d2c8d
X-Msg-Generator: CA
X-RootMTR: 20191227144135eucas1p15c431ece1d12d133f2f30d725ca2df8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191227144135eucas1p15c431ece1d12d133f2f30d725ca2df8d
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20191227144135eucas1p15c431ece1d12d133f2f30d725ca2df8d@eucas1p1.samsung.com>
 <20191227144124.210294-3-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Sorry, for the late reply, I've just got back from my prolonged Chrismas 
holidays.

On 27.12.2019 15:41, Boris Brezillon wrote:
> Commit 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked
> list") patched the bridge chain logic to use a double-linked list instead
> of a single-linked list. This change induced changes to the Exynos driver
> which was manually resetting the encoder->bridge element to NULL to
> control the enable/disable sequence of the bridge chain. During this
> conversion, 2 bugs were introduced:
>
> 1/ list_splice() was used to move chain elements to our own internal
>     chain, but list_splice() does not reset the source list to an empty
>     state, leading to unexpected bridge hook calls when
>     drm_bridge_chain_xxx() helpers were called by the core. Replacing
>     the list_splice() call by list_splice_init() fixes this problem.
>
> 2/ drm_bridge_chain_xxx() helpers operate on the
>     bridge->encoder->bridge_chain list, which is now empty. When the
>     helper uses list_for_each_entry_reverse() we end up with no operation
>     done which is not what we want. But that's even worse when the helper
>     uses list_for_each_entry_from(), because in that case we end up in
>     an infinite loop searching for the list head element which is no
>     longer encoder->bridge_chain but exynos_dsi->bridge_chain. To address
>     that problem we stop using the bridge chain helpers and call the
>     hooks directly.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Works fine on Exynos5250-based Arndale board.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Hello Marek,
>
> I'm perfectly fine applying your patch instead of this one if you prefer
> to restrict the logic to a single bridge per chain. I just sent this
> patch in case your okay with the slightly different version I propose
> here.
>
> Let me know what you want to do.

I'm fine with your approach.

> Regards,
>
> Boris
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 29 ++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 3955f84dc893..33628d85edad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1378,6 +1378,7 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   static void exynos_dsi_enable(struct drm_encoder *encoder)
>   {
>   	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct drm_bridge *iter;
>   	int ret;
>   
>   	if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1391,7 +1392,11 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   		if (ret < 0)
>   			goto err_put_sync;
>   	} else {
> -		drm_bridge_chain_pre_enable(dsi->out_bridge);
> +		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
> +					    chain_node) {
> +			if (iter->funcs->pre_enable)
> +				iter->funcs->pre_enable(iter);
> +		}
>   	}
>   
>   	exynos_dsi_set_display_mode(dsi);
> @@ -1402,7 +1407,10 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   		if (ret < 0)
>   			goto err_display_disable;
>   	} else {
> -		drm_bridge_chain_enable(dsi->out_bridge);
> +		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> +			if (iter->funcs->enable)
> +				iter->funcs->enable(iter);
> +		}
>   	}
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> @@ -1420,6 +1428,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   static void exynos_dsi_disable(struct drm_encoder *encoder)
>   {
>   	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct drm_bridge *iter;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
> @@ -1427,10 +1436,20 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
>   	drm_panel_disable(dsi->panel);
> -	drm_bridge_chain_disable(dsi->out_bridge);
> +
> +	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->disable)
> +			iter->funcs->disable(iter);
> +	}
> +
>   	exynos_dsi_set_display_enable(dsi, false);
>   	drm_panel_unprepare(dsi->panel);
> -	drm_bridge_chain_post_disable(dsi->out_bridge);
> +
> +	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->post_disable)
> +			iter->funcs->post_disable(iter);
> +	}
> +
>   	dsi->state &= ~DSIM_STATE_ENABLED;
>   	pm_runtime_put_sync(dsi->dev);
>   }
> @@ -1523,7 +1542,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	if (out_bridge) {
>   		drm_bridge_attach(encoder, out_bridge, NULL);
>   		dsi->out_bridge = out_bridge;
> -		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
> +		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>   	} else {
>   		int ret = exynos_dsi_create_connector(encoder);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
