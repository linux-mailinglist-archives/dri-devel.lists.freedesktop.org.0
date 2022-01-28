Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D0A49FA49
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 14:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C6A10EE5C;
	Fri, 28 Jan 2022 13:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A56E410EE5C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 13:04:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE9DA11D4;
 Fri, 28 Jan 2022 05:04:18 -0800 (PST)
Received: from [10.57.68.47] (unknown [10.57.68.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4173F766;
 Fri, 28 Jan 2022 05:04:13 -0800 (PST)
Message-ID: <29deffd6-aac4-f085-bcd5-f5a2d02784a8@arm.com>
Date: Fri, 28 Jan 2022 13:04:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
Content-Language: en-GB
To: Yong Wu <yong.wu@mediatek.com>, dri-devel@lists.freedesktop.org
References: <20220128081101.27837-1-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220128081101.27837-1-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-28 08:11, Yong Wu wrote:
[...]
> diff --git a/include/linux/component.h b/include/linux/component.h
> index 16de18f473d7..5a7468ea827c 100644
> --- a/include/linux/component.h
> +++ b/include/linux/component.h
> @@ -2,6 +2,8 @@
>   #ifndef COMPONENT_H
>   #define COMPONENT_H
>   
> +#include <linux/device.h>
> +#include <linux/of.h>
>   #include <linux/stddef.h>
>   
>   
> @@ -82,6 +84,22 @@ struct component_master_ops {
>   	void (*unbind)(struct device *master);
>   };
>   
> +/* A set common helpers for compare/release functions */
> +static inline int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}

Note that this is effectively just device_match_of_node(), although I 
guess there is an argument that having a nice consistent set of 
component_match API helpers might be worth more than a tiny code saving 
by borrowing one from a different API.

Either way, however, I don't think there's any good argument for 
instantiating separate copies of these functions in every driver that 
uses them. If they're used as callbacks then they can't actually be 
inlined anyway, so they may as well be exported from component.c as 
normal so that the code really is shared (plus then there's nice 
symmetry with the aforementioned device_match API helpers too).

Thanks,
Robin.

> +static inline void release_of(struct device *dev, void *data)
> +{
> +	of_node_put(data);
> +}
> +
> +static inline int compare_dev(struct device *dev, void *data)
> +{
> +	return dev == data;
> +}
> +
>   void component_master_del(struct device *,
>   	const struct component_master_ops *);
>   
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index eff200a07d9f..992132cbfb9f 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -4417,16 +4417,6 @@ static const struct component_master_ops wcd938x_comp_ops = {
>   	.unbind = wcd938x_unbind,
>   };
>   
> -static int wcd938x_compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
> -static void wcd938x_release_of(struct device *dev, void *data)
> -{
> -	of_node_put(data);
> -}
> -
>   static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>   					struct device *dev,
>   					struct component_match **matchptr)
> @@ -4442,8 +4432,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>   	}
>   
>   	of_node_get(wcd938x->rxnode);
> -	component_match_add_release(dev, matchptr, wcd938x_release_of,
> -				    wcd938x_compare_of,	wcd938x->rxnode);
> +	component_match_add_release(dev, matchptr, release_of, compare_of, wcd938x->rxnode);
>   
>   	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
>   	if (!wcd938x->txnode) {
> @@ -4451,8 +4440,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>   		return -ENODEV;
>   	}
>   	of_node_get(wcd938x->txnode);
> -	component_match_add_release(dev, matchptr, wcd938x_release_of,
> -				    wcd938x_compare_of,	wcd938x->txnode);
> +	component_match_add_release(dev, matchptr, release_of, compare_of, wcd938x->txnode);
>   	return 0;
>   }
>   
