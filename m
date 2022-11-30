Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FA63D12C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CED10E41B;
	Wed, 30 Nov 2022 08:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971FE10E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 08:56:17 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A59955A;
 Wed, 30 Nov 2022 09:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669798576;
 bh=P+QWGX/RuFzHin2xHy5lZrSKi8lf7M6oOuqsIDQL71s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iinw8v1TZlf82C3F6KLpPTT4awQuoJ0TuhLJB+QL6FKLdSXFIxK1AAJfK1BulEGl9
 4Oi61qc1iN5g5eRa/GgwWr6uEHjK/fkZMgx8hl8VaNsyDSQsAmyE8qTqbePGTohuHA
 2rz7x3iKC9LrXNJzAZIqwcLgsnflmdmESBHqeoJY=
Message-ID: <58cff9e3-2488-5119-40ba-070ae930906d@ideasonboard.com>
Date: Wed, 30 Nov 2022 10:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Fix issue with phy init
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org
References: <20221115083918.23192-1-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221115083918.23192-1-r-ravikumar@ti.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, jpawar@cadence.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, sjakhade@cadence.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/11/2022 10:39, Rahul T R wrote:
> Phy is not being initialized after suspend resume. Fix this by setting
> phy_initialized flag to false in suspend callback
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   drivers/gpu/drm/bridge/cdns-dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 20bece84ff8c..1a988f53424a 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -1187,6 +1187,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>   	clk_disable_unprepare(dsi->dsi_p_clk);
>   	reset_control_assert(dsi->dsi_p_rst);
>   	dsi->link_initialized = false;
> +	dsi->phy_initialized = false;
>   	return 0;
>   }
>   

I'm not familiar with the IP, but the code related to enable/disable 
looks a bit odd.

Why does cdns_dsi_bridge_enable() do:
	cdns_dsi_hs_init(dsi);
	cdns_dsi_init_link(dsi);
but then in cdns_dsi_bridge_pre_enable():
	cdns_dsi_init_link(dsi);
	cdns_dsi_hs_init(dsi);

Doesn't the order matter? Why are the same functions called in both places?

cdns_dsi_hs_init() seems to do enabling, like locking the PLL. But 
there's no counterpart, hs_uninit(). I see cdns_dsi_bridge_disable() 
doing some clearing of the registers, so perhaps that's where the 
disabling happens. But cdns_dsi_hs_init() is called from the pre-enable, 
and post-disable doesn't do anything else but pm_runtime_put().

More or less the same comments apply to cdns_dsi_init_link(), but it's a 
bit worse as it's also called in cdns_dsi_transfer(), and then there's 
no uninit counterpart that I can see.

Well, maybe both functions are only doing configuration, not enabling 
this as such, and so it's fine to just turn off the IP without any 
uninit step. If that's the case, then probably this patch is fine.

  Tomi

