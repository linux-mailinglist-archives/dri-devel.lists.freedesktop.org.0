Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B91207CD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1C36E584;
	Mon, 16 Dec 2019 14:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 14:00:50 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170596E584
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:00:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191216135429euoutp018c1e5b53f174f76f797548c6575ceb84~g3nZlC5q41277812778euoutp018
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:54:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191216135429euoutp018c1e5b53f174f76f797548c6575ceb84~g3nZlC5q41277812778euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576504469;
 bh=rVs6lcbfb4ZKreUTB93l96Ha+e/BI6/rSLMkHIfBuvE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=klqpv8Dg6GbNgrrai8M2nH5T7pkZYH54vuvo/5aBKe4JkKNDyX29kpdTLB4+Re+k0
 aKV6MX64za/3laBukMo2xxFNHN5OePFt3w4wEJ1YB+hWuTRhY600V0Iz0JQZM7bygG
 wQNNzyIN3jOMNxO2kuGmC6cV8MXy6vGCb+YGQ0YI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191216135429eucas1p1a2ccc4e372fd7080c6f8aaa0f2d5b34f~g3nZO-_FH3095630956eucas1p12;
 Mon, 16 Dec 2019 13:54:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 84.E0.61286.59C87FD5; Mon, 16
 Dec 2019 13:54:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191216135428eucas1p14e60602673b6974b30c2c5c1ce3afa7e~g3nYryuLn3095230952eucas1p16;
 Mon, 16 Dec 2019 13:54:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191216135428eusmtrp29ab3ab3a9c6c7b28e60499670033f9ff~g3nYq-7Pt2793427934eusmtrp2r;
 Mon, 16 Dec 2019 13:54:28 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-90-5df78c95f587
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BF.9B.07950.49C87FD5; Mon, 16
 Dec 2019 13:54:28 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191216135427eusmtip18a91989c3bca47ca378a2463420930a4~g3nX6fTyc3234532345eusmtip1A;
 Mon, 16 Dec 2019 13:54:27 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
Date: Mon, 16 Dec 2019 14:54:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203141515.3597631-5-boris.brezillon@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRiGec85O+dsOTlNwyeLikWF0Zd98ULfUHB+Vpg/qlGrTlvktDa1
 DCKbzmyapGLqEiuZqMsyrUxtRZq5ljnStMyIDK3wY1hWLM2ynU6W/673fu6H+7nhZUlVCh3K
 HoqOFYzR2ig1raCqm0Y8i3PSfZplg4UBuOu6R4aTUtfh5qdPCFzvdBH4UqNfav82ROMOXx+J
 3YMdFL7pSZfhFvMgg89m2hlc/LKVwA0Zu3B3xWFsudfI4NKR2wjnZffReKSukNqo4ssLyxE/
 1Glh+O6ccYKveWNHfK3tDcNfTM2X8VWOszT/+Hwbwb9NcxG8/UIHzWfcciD+wblsiv9SNWur
 cqdi7QEh6lC8YFy6fq9C3zNaQx1xZKPjPcmnyUR0I96K5CxwK2HMV0eIrOJKEbwz661I4eev
 CKo/v2CkxxcEH3x3qYmNUksdI22UIHg/EimZvAgqbfdl4iCIiwT3WOIfU7Cfe8bzkGgiuZ8U
 pP0Y+5NHc+Fg9VppkZXceuixJpIiU9w8yEq76l9m2WmcBlJL9JJlKrjzeylRlnNboHF0uyiT
 3Gy44y0gJQ6Brt5LhBgFnJMFd0YSLR29GSyNH/9yEPS7bjESz4Tx2omFJH99zzVGeqQjeG4W
 rxZda+Chq1UmJpNcGFTULZXkTVDsPE2LMnCB0OmdKh0RCFnVuaQkKyE1RSW554PNdf1fbP2z
 NvI8UtsmNbNNqmObVMf2P/cyohwoRIgzGXSCKTxaOLbEpDWY4qJ1S/bHGKqQ/3c2/3IN16Bv
 bfsaEMcidYASYn0alUwbb0owNCBgSXWwsmaOX1Ie0CacEIwxe4xxUYKpAc1gKXWIckVRn0bF
 6bSxwmFBOCIYJ6YEKw9NRJWBfS06u31K10LHieln5K25ZVfSgsmwg8mZTsXAnZ+yHRFhmYX1
 A3aNbvdce9aGhIj49k9nXvWvdW+jnfrkpg1Dc6LMnkUFL8q8y7vKv7cP5d6/2rRK+BhT8jil
 9235gp3H5EdPDQtFUwaGe+2GgOTVJ8Mt5kdfx7pLO19vKssZ7VRTJr02fCFpNGl/Axeuwg+Z
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsVy+t/xu7pTer7HGlyeqW5xa905VovmDluL
 02dOMVkc3HOcyWL+EaDQla/v2Syufn/JbHHyzVUWi83nelgtzja9YbfonLiE3WLp9YtMFof6
 oi0erM+2aN17hN1ixc+tjBYzJr9ks/i5ax6Lg5DHmnlrGD3e32hl93gw9T+Tx467Sxg9ds66
 y+4xu2Mmq8emVZ1sHicmXGLyuN99nMljybSrbB59W1Yxehzonczi8XmTXABvlJ5NUX5pSapC
 Rn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G4187WApWTWaseNzS
 yNzAuKGsi5GTQ0LARGJF6y72LkYuDiGBpYwSWy7MZYFIyEicnNbACmELS/y51sUGUfSaUWLh
 lX1MIAlhgTCJk38a2EFsESD77aWVLCBFzAL/WSRunuthgui4zCjx8+EqsLFsAoYSXW9BRnFy
 8ArYSTzuamAGsVkEVCUmda8GmyQqECvxfeUnRogaQYmTM58A9XJwcAq4Shz5FQQSZhYwk5i3
 +SEzhC0vsf3tHChbXOLWk/lMExiFZiHpnoWkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0u
 zUvXS87P3cQITBjbjv3csoOx613wIUYBDkYlHl6Jku+xQqyJZcWVuYcYJTiYlUR4dygAhXhT
 EiurUovy44tKc1KLDzGaAv02kVlKNDkfmMzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
 pGanphakFsH0MXFwSjUwdjTaexu84AhSLzmXx5gQvfO5ZdtPi6AVKqnfdb5GXPP66dtt+VKW
 yy3j0iveM4uNLkeJB+XJGrEKHkkMnGRj7Lz/9MduFd39vtJb9I5vELjy/WUfU49XRP+/S6va
 L5bsygt17d4R5Bjb/zJcqvfVXv/LMptPVFg3T/tWdmxOoEiQoVuUc78SS3FGoqEWc1FxIgDp
 ZKIxLgMAAA==
X-CMS-MailID: 20191216135428eucas1p14e60602673b6974b30c2c5c1ce3afa7e
X-Msg-Generator: CA
X-RootMTR: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 03.12.2019 15:15, Boris Brezillon wrote:
> So that each element in the chain can easily access its predecessor.
> This will be needed to support bus format negotiation between elements
> of the bridge chain.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've noticed that this patch got merged to linux-next as commit 
05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of 
Samsung Exynos5250-based Arndale board. Booting stops after following 
messages:

[drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
[drm] Cannot find any crtc or sizes
[drm] Cannot find any crtc or sizes
[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0

I will try to debug this and provide more information soon.

> ---
> Changes in v4:
> * Simplify the drm_bridge_attach() logic
> * Fix list iteration bugs
> * Patch VC4 and Exynos DSI drivers to match core changes
> * Add R-bs
>
> Changes in v3:
> * None
>
> Changes in v2:
> * Adjust things to the "dummy encoder bridge" change (patch 2 in this
>    series)
> ---
>   drivers/gpu/drm/drm_bridge.c            | 171 +++++++++++++++---------
>   drivers/gpu/drm/drm_encoder.c           |  16 +--
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c |   5 +-
>   drivers/gpu/drm/vc4/vc4_dsi.c           |  10 +-
>   include/drm/drm_bridge.h                |  12 +-
>   include/drm/drm_encoder.h               |   7 +-
>   6 files changed, 143 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 54c874493c57..b6517b4fa3d1 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -55,7 +55,7 @@
>    * just provide additional hooks to get the desired output at the end of the
>    * encoder chain.
>    *
> - * Bridges can also be chained up using the &drm_bridge.next pointer.
> + * Bridges can also be chained up using the &drm_bridge.chain_node field.
>    *
>    * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
>    */
> @@ -128,20 +128,21 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   	bridge->dev = encoder->dev;
>   	bridge->encoder = encoder;
>   
> +	if (previous)
> +		list_add(&bridge->chain_node, &previous->chain_node);
> +	else
> +		list_add(&bridge->chain_node, &encoder->bridge_chain);
> +
>   	if (bridge->funcs->attach) {
>   		ret = bridge->funcs->attach(bridge);
>   		if (ret < 0) {
> +			list_del(&bridge->chain_node);
>   			bridge->dev = NULL;
>   			bridge->encoder = NULL;
>   			return ret;
>   		}
>   	}
>   
> -	if (previous)
> -		previous->next = bridge;
> -	else
> -		encoder->bridge = bridge;
> -
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_bridge_attach);
> @@ -157,6 +158,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>   	if (bridge->funcs->detach)
>   		bridge->funcs->detach(bridge);
>   
> +	list_del(&bridge->chain_node);
>   	bridge->dev = NULL;
>   }
>   
> @@ -190,18 +192,21 @@ bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>   				 const struct drm_display_mode *mode,
>   				 struct drm_display_mode *adjusted_mode)
>   {
> -	bool ret = true;
> +	struct drm_encoder *encoder;
>   
>   	if (!bridge)
>   		return true;
>   
> -	if (bridge->funcs->mode_fixup)
> -		ret = bridge->funcs->mode_fixup(bridge, mode, adjusted_mode);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (!bridge->funcs->mode_fixup)
> +			continue;
>   
> -	ret = ret && drm_bridge_chain_mode_fixup(bridge->next, mode,
> -						 adjusted_mode);
> +		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
> +			return false;
> +	}
>   
> -	return ret;
> +	return true;
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
>   
> @@ -224,18 +229,24 @@ enum drm_mode_status
>   drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>   			    const struct drm_display_mode *mode)
>   {
> -	enum drm_mode_status ret = MODE_OK;
> +	struct drm_encoder *encoder;
>   
>   	if (!bridge)
> -		return ret;
> +		return MODE_OK;
>   
> -	if (bridge->funcs->mode_valid)
> -		ret = bridge->funcs->mode_valid(bridge, mode);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		enum drm_mode_status ret;
> +
> +		if (!bridge->funcs->mode_valid)
> +			continue;
>   
> -	if (ret != MODE_OK)
> -		return ret;
> +		ret = bridge->funcs->mode_valid(bridge, mode);
> +		if (ret != MODE_OK)
> +			return ret;
> +	}
>   
> -	return drm_bridge_chain_mode_valid(bridge->next, mode);
> +	return MODE_OK;
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>   
> @@ -251,13 +262,20 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>    */
>   void drm_bridge_chain_disable(struct drm_bridge *bridge)
>   {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>   	if (!bridge)
>   		return;
>   
> -	drm_bridge_chain_disable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->disable)
> +			iter->funcs->disable(iter);
>   
> -	if (bridge->funcs->disable)
> -		bridge->funcs->disable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_disable);
>   
> @@ -274,13 +292,16 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
>    */
>   void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>   {
> +	struct drm_encoder *encoder;
> +
>   	if (!bridge)
>   		return;
>   
> -	if (bridge->funcs->post_disable)
> -		bridge->funcs->post_disable(bridge);
> -
> -	drm_bridge_chain_post_disable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->post_disable)
> +			bridge->funcs->post_disable(bridge);
> +	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>   
> @@ -300,13 +321,16 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>   			       const struct drm_display_mode *mode,
>   			       const struct drm_display_mode *adjusted_mode)
>   {
> +	struct drm_encoder *encoder;
> +
>   	if (!bridge)
>   		return;
>   
> -	if (bridge->funcs->mode_set)
> -		bridge->funcs->mode_set(bridge, mode, adjusted_mode);
> -
> -	drm_bridge_chain_mode_set(bridge->next, mode, adjusted_mode);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->mode_set)
> +			bridge->funcs->mode_set(bridge, mode, adjusted_mode);
> +	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>   
> @@ -323,13 +347,17 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>    */
>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>   {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>   	if (!bridge)
>   		return;
>   
> -	drm_bridge_chain_pre_enable(bridge->next);
> -
> -	if (bridge->funcs->pre_enable)
> -		bridge->funcs->pre_enable(bridge);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
> +	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>   
> @@ -345,13 +373,16 @@ EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>    */
>   void drm_bridge_chain_enable(struct drm_bridge *bridge)
>   {
> +	struct drm_encoder *encoder;
> +
>   	if (!bridge)
>   		return;
>   
> -	if (bridge->funcs->enable)
> -		bridge->funcs->enable(bridge);
> -
> -	drm_bridge_chain_enable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->enable)
> +			bridge->funcs->enable(bridge);
> +	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_enable);
>   
> @@ -370,15 +401,22 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
>   void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>   				     struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>   	if (!bridge)
>   		return;
>   
> -	drm_atomic_bridge_chain_disable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->atomic_disable)
> +			iter->funcs->atomic_disable(iter, state);
> +		else if (iter->funcs->disable)
> +			iter->funcs->disable(iter);
>   
> -	if (bridge->funcs->atomic_disable)
> -		bridge->funcs->atomic_disable(bridge, state);
> -	else if (bridge->funcs->disable)
> -		bridge->funcs->disable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>   }
>   EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>   
> @@ -398,15 +436,18 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>   void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>   					  struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder;
> +
>   	if (!bridge)
>   		return;
>   
> -	if (bridge->funcs->atomic_post_disable)
> -		bridge->funcs->atomic_post_disable(bridge, state);
> -	else if (bridge->funcs->post_disable)
> -		bridge->funcs->post_disable(bridge);
> -
> -	drm_atomic_bridge_chain_post_disable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->atomic_post_disable)
> +			bridge->funcs->atomic_post_disable(bridge, state);
> +		else if (bridge->funcs->post_disable)
> +			bridge->funcs->post_disable(bridge);
> +	}
>   }
>   EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>   
> @@ -426,15 +467,22 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>   void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>   					struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>   	if (!bridge)
>   		return;
>   
> -	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->atomic_pre_enable)
> +			iter->funcs->atomic_pre_enable(iter, state);
> +		else if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
>   
> -	if (bridge->funcs->atomic_pre_enable)
> -		bridge->funcs->atomic_pre_enable(bridge, state);
> -	else if (bridge->funcs->pre_enable)
> -		bridge->funcs->pre_enable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>   }
>   EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>   
> @@ -453,15 +501,18 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>   void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>   				    struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder;
> +
>   	if (!bridge)
>   		return;
>   
> -	if (bridge->funcs->atomic_enable)
> -		bridge->funcs->atomic_enable(bridge, state);
> -	else if (bridge->funcs->enable)
> -		bridge->funcs->enable(bridge);
> -
> -	drm_atomic_bridge_chain_enable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->atomic_enable)
> +			bridge->funcs->atomic_enable(bridge, state);
> +		else if (bridge->funcs->enable)
> +			bridge->funcs->enable(bridge);
> +	}
>   }
>   EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>   
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index a2cc7e7241a9..e555281f43d4 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -140,6 +140,7 @@ int drm_encoder_init(struct drm_device *dev,
>   		goto out_put;
>   	}
>   
> +	INIT_LIST_HEAD(&encoder->bridge_chain);
>   	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
>   	encoder->index = dev->mode_config.num_encoder++;
>   
> @@ -160,23 +161,16 @@ EXPORT_SYMBOL(drm_encoder_init);
>   void drm_encoder_cleanup(struct drm_encoder *encoder)
>   {
>   	struct drm_device *dev = encoder->dev;
> +	struct drm_bridge *bridge, *next;
>   
>   	/* Note that the encoder_list is considered to be static; should we
>   	 * remove the drm_encoder at runtime we would have to decrement all
>   	 * the indices on the drm_encoder after us in the encoder_list.
>   	 */
>   
> -	if (encoder->bridge) {
> -		struct drm_bridge *bridge;
> -		struct drm_bridge *next;
> -
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		while (bridge) {
> -			next = drm_bridge_get_next_bridge(bridge);
> -			drm_bridge_detach(bridge);
> -			bridge = next;
> -		}
> -	}
> +	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
> +				 chain_node)
> +		drm_bridge_detach(bridge);
>   
>   	drm_mode_object_unregister(dev, &encoder->base);
>   	kfree(encoder->name);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d984097704b8..7de82e22252a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -255,6 +255,7 @@ struct exynos_dsi {
>   	struct mipi_dsi_host dsi_host;
>   	struct drm_connector connector;
>   	struct drm_panel *panel;
> +	struct list_head bridge_chain;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
>   
> @@ -1522,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	if (out_bridge) {
>   		drm_bridge_attach(encoder, out_bridge, NULL);
>   		dsi->out_bridge = out_bridge;
> -		encoder->bridge = NULL;
> +		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
>   	} else {
>   		int ret = exynos_dsi_create_connector(encoder);
>   
> @@ -1588,6 +1589,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   		if (dsi->out_bridge->funcs->detach)
>   			dsi->out_bridge->funcs->detach(dsi->out_bridge);
>   		dsi->out_bridge = NULL;
> +		INIT_LIST_HEAD(&dsi->bridge_chain);
>   	}
>   
>   	if (drm->mode_config.poll_enabled)
> @@ -1735,6 +1737,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	init_completion(&dsi->completed);
>   	spin_lock_init(&dsi->transfer_lock);
>   	INIT_LIST_HEAD(&dsi->transfer_list);
> +	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	dsi->dsi_host.ops = &exynos_dsi_ops;
>   	dsi->dsi_host.dev = dev;
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index ff81b54ea281..6c5b80ad6154 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -499,6 +499,7 @@ struct vc4_dsi {
>   	struct mipi_dsi_host dsi_host;
>   	struct drm_encoder *encoder;
>   	struct drm_bridge *bridge;
> +	struct list_head bridge_chain;
>   
>   	void __iomem *regs;
>   
> @@ -1460,6 +1461,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   				       GFP_KERNEL);
>   	if (!vc4_dsi_encoder)
>   		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&dsi->bridge_chain);
>   	vc4_dsi_encoder->base.type = VC4_ENCODER_TYPE_DSI1;
>   	vc4_dsi_encoder->dsi = dsi;
>   	dsi->encoder = &vc4_dsi_encoder->base.base;
> @@ -1610,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   	 * from our driver, since we need to sequence them within the
>   	 * encoder's enable/disable paths.
>   	 */
> -	dsi->encoder->bridge = NULL;
> +	list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>   
>   	if (dsi->port == 0)
>   		vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
> @@ -1632,6 +1635,11 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>   	if (dsi->bridge)
>   		pm_runtime_disable(dev);
>   
> +	/*
> +	 * Restore the bridge_chain so the bridge detach procedure can happen
> +	 * normally.
> +	 */
> +	list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>   	vc4_dsi_encoder_destroy(dsi->encoder);
>   
>   	if (dsi->port == 1)
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bd78c256b1ed..c118726469ee 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -384,8 +384,8 @@ struct drm_bridge {
>   	struct drm_device *dev;
>   	/** @encoder: encoder to which this bridge is connected */
>   	struct drm_encoder *encoder;
> -	/** @next: the next bridge in the encoder chain */
> -	struct drm_bridge *next;
> +	/** @chain_node: used to form a bridge chain */
> +	struct list_head chain_node;
>   #ifdef CONFIG_OF
>   	/** @of_node: device node pointer to the bridge */
>   	struct device_node *of_node;
> @@ -420,7 +420,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   static inline struct drm_bridge *
>   drm_bridge_get_next_bridge(struct drm_bridge *bridge)
>   {
> -	return bridge->next;
> +	if (list_is_last(&bridge->chain_node, &bridge->encoder->bridge_chain))
> +		return NULL;
> +
> +	return list_next_entry(bridge, chain_node);
>   }
>   
>   /**
> @@ -434,7 +437,8 @@ drm_bridge_get_next_bridge(struct drm_bridge *bridge)
>   static inline struct drm_bridge *
>   drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>   {
> -	return encoder->bridge;
> +	return list_first_entry_or_null(&encoder->bridge_chain,
> +					struct drm_bridge, chain_node);
>   }
>   
>   bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index f06164f44efe..5623994b6e9e 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -172,7 +172,12 @@ struct drm_encoder {
>   	 * &drm_connector_state.crtc.
>   	 */
>   	struct drm_crtc *crtc;
> -	struct drm_bridge *bridge;
> +
> +	/**
> +	 * @bridge_chain: Bridges attached to this encoder.
> +	 */
> +	struct list_head bridge_chain;
> +
>   	const struct drm_encoder_funcs *funcs;
>   	const struct drm_encoder_helper_funcs *helper_private;
>   };

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
