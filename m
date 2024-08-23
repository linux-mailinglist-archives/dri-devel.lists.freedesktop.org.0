Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968195CABC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 12:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E02210E494;
	Fri, 23 Aug 2024 10:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Q695rhya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAEE10E494
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 10:46:48 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id hRoUsL4HOzHoQhRoUsTS08; Fri, 23 Aug 2024 12:46:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724410006;
 bh=M+BJHoqbevs+877BilSmYJZwm2Wj3hyd0gs95c8CmS8=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Q695rhyaBTCa8GxEUvcbWDnTM+h61/+qeGfRPaskg25Rmw3+MPFnHIXrEEKIENaPg
 plIuyFymEP3Jv4vPVizYLBwaRBW+jzBeASP7/nlnkpkbYu1vP8JVUY+uilslZ+M2Xq
 K7/Rby9SyhmGKEczNXRpJpcBJVTtu353UW1rhZXCSja80MtYtDf33PrKLirykyytCl
 5a3gY/F/G59CSPrJ+JgjLfh210d3fWSx0aJ4WSy8XcdbuJK+bvmfMCtNb7Skudf7RC
 mMKNXknhM2YyGDTKam4yub8cdwekmw7m19YjJ2jfAsQzlv+4B0pvIXa2JZzyWqtHKd
 JqWM25hr7IA0Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 23 Aug 2024 12:46:46 +0200
X-ME-IP: 90.11.132.44
Message-ID: <a4d23c3a-9791-4d2b-9853-9c9b27460db5@wanadoo.fr>
Date: Fri, 23 Aug 2024 12:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/5] drm/mediatek: Fix missing of_node_put() for
 mtk_drm_get_all_drm_priv()
To: Jinjie Ruan <ruanjinjie@huawei.com>, hjc@rock-chips.com, heiko@sntech.de, 
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzk@kernel.org, jic23@kernel.org
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-3-ruanjinjie@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240823092053.3170445-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 23/08/2024 à 11:20, Jinjie Ruan a écrit :
> In mtk_drm_get_all_drm_priv(), break in for_each_child_of_node() should
> call of_node_put() to avoid child node resource leak, use
> for_each_child_of_node_scoped() to fix it.
> 
> And avoid the need for manual cleanup of_node_put() in early exits
> from the loop for another one.
> 
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 77b50c56c124..41aff0183cbd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -371,12 +371,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   	struct mtk_drm_private *temp_drm_priv;
>   	struct device_node *phandle = dev->parent->of_node;
>   	const struct of_device_id *of_id;
> -	struct device_node *node;
>   	struct device *drm_dev;
>   	unsigned int cnt = 0;
>   	int i, j;
>   
> -	for_each_child_of_node(phandle->parent, node) {
> +	for_each_child_of_node_scoped(phandle->parent, node) {
>   		struct platform_device *pdev;
>   
>   		of_id = of_match_node(mtk_drm_of_ids, node);
> @@ -828,7 +827,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	struct device_node *phandle = dev->parent->of_node;
>   	const struct of_device_id *of_id;
>   	struct mtk_drm_private *private;
> -	struct device_node *node;
>   	struct component_match *match = NULL;
>   	struct platform_device *ovl_adaptor;
>   	int ret;
> @@ -869,7 +867,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Iterate over sibling DISP function blocks */
> -	for_each_child_of_node(phandle->parent, node) {
> +	for_each_child_of_node_scoped(phandle->parent, node) {
>   		const struct of_device_id *of_id;
>   		enum mtk_ddp_comp_type comp_type;
>   		int comp_id;
> @@ -933,10 +931,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   		}
>   
>   		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
> -		if (ret) {
> -			of_node_put(node);
> +		if (ret)
>   			goto err_node;

Hi,

I've seen on another thread that is was not sure that scoped versions 
and gotos played well together.

It was asked to check more in details and confirm that it was safe 
before applying the patch.

I've not followed the discussion, so I just point it out, in case it helps.

I'll try to give it a look in the coming days.


CJ

> -		}
>   	}
>   
>   	if (!private->mutex_node) {

