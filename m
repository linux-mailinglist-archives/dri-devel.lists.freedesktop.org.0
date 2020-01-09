Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3C135056
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 01:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AAF6E35F;
	Thu,  9 Jan 2020 00:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480F06E35F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 00:15:46 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ipLUC-0003nJ-TJ; Thu, 09 Jan 2020 01:15:40 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tobias Schramm <t.schramm@manjaro.org>
Subject: Re: [PATCH 1/1] drm/rockchip: fix integer type used for storing dp
 data rate and lane count
Date: Thu, 09 Jan 2020 01:15:40 +0100
Message-ID: <2028959.b8b8FNkPgY@diego>
In-Reply-To: <20200108223949.355975-2-t.schramm@manjaro.org>
References: <20200108223949.355975-1-t.schramm@manjaro.org>
 <20200108223949.355975-2-t.schramm@manjaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 8. Januar 2020, 23:39:49 CET schrieb Tobias Schramm:
> commit 2589c4025f13 ("drm/rockchip: Avoid drm_dp_link helpers") changes
> the type of variables used to store the display port data rate and
> number of lanes to u8. However u8 is not sufficient to store the link
> data rate of the display port.
> This commit reverts the type of both the number of lanes and the data
> rate to unsigned int.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> index 83c4586665b4..806cb0b08982 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> @@ -94,8 +94,8 @@ struct cdn_dp_device {
>  	struct video_info video_info;
>  	struct cdn_dp_port *port[MAX_PHY];
>  	u8 ports;
> -	u8 max_lanes;
> -	u8 max_rate;
> +	unsigned int max_lanes;

although I would think u8 should be enough for max_lanes?
There shouldn't be be more than 255 dp lanes?


Heiko

> +	unsigned int max_rate;
>  	u8 lanes;
>  	int active_port;
>  
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
