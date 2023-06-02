Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602B720B4C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D5710E646;
	Fri,  2 Jun 2023 21:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4003310E646
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:58:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BB7A685818;
 Fri,  2 Jun 2023 23:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685743136;
 bh=fvTQrZXixS0jEvU6mG1NZ89aYrCaMEvyL7CFaEKo/9c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GXAkt5WAekQxMu00FPcikIxpyVuvTmUDdLKNiPfMo8yvBjG8T39UPUBje8w33KD+x
 jemepmOOftZs9AqAFWgfKmFn0H34U1ABhQsX17xs5tVB1uLCybtHVReDRqcMmqtyHT
 8Ueq+LtUDVVNAh+lN3+Aj/Im0w0udr9hAgMBrLUpClzWSPWOfdYQJ7hYiwWdZmHmXP
 4aJDztsQ/vIX4ps1Amg+HMALnsjX9oax1I6EfvnhCfbUHOU9cNB15PFTMYm5pw63B7
 mrx9kqIcSRiclepuUoWQt0M6DgFF/bDsU6n74r0rKX1T1oGzNeORpHpydoB2akZkGf
 Z5aWf3XEqAnhg==
Message-ID: <4aa8b924-7e14-4647-ad8b-79a0b244257e@denx.de>
Date: Fri, 2 Jun 2023 23:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm: bridge: tc358767: increase PLL lock time delay
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230602191501.4138433-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/23 21:15, Lucas Stach wrote:
> From: David Jander <david@protonic.nl>
> 
> The PLL often fails to lock with this delay. The new value was
> determined by trial and error increasing the delay bit by bit
> until the error did not occurr anymore even after several tries.
> Then double that value was taken as the minimum delay to be safe.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 91f7cb56a654..46916ae30f8f 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -501,7 +501,7 @@ static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
>   		return ret;
>   
>   	/* Wait for PLL to lock: up to 2.09 ms, depending on refclk */
> -	usleep_range(3000, 6000);
> +	usleep_range(15000, 20000);

The comment above does not seem to match either value, please fix.

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
