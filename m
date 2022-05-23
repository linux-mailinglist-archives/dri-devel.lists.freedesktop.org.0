Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C7530E8A
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 13:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934DD10E224;
	Mon, 23 May 2022 11:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ACA10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 11:10:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 313D08339D;
 Mon, 23 May 2022 13:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653304250;
 bh=nRiRc7Dueyw5FIeQTaN0+RLtcGtI/n2M9x0zqG6o9Ro=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=x4gPTSZFAd4tKvxanyOYYdfboXxe9BAIrWTUkxEBzGB5X3ydGrf5pwXkbm/7qIv+K
 Eh2q5Oy3ST3Hcwn2BGGweXmCbpqruc0/pYrNSaC2gzCWs8uBx4Ebn+7dEBhncmuhpl
 siI7q5BUCYzX6FZkYR6SjKfiN95TRUfI9EuqCG2tdPGAlvr6ZUkp3BK/ZKeKGj+lEd
 3RAt3j7lAg0kYG5VP1vHst6E68+wPLCsDQBDsVsatN9Zx6xwdTSsxzCYG8OGiqR54I
 Gq13G7lktMzGuQGghCIBU2RqD55NhaKTSwtP2XCiX5U1Sy8NHLircHwuoqRizX6k31
 EjDykvxsH2F7w==
Message-ID: <76fc56d9-9ad9-a906-79bc-d88d2e2d62f6@denx.de>
Date: Mon, 23 May 2022 13:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm: bridge: icn6211: Adjust clock phase using SYS_CTRL_1
Content-Language: en-US
To: Jonathan Liu <net147@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220523023801.410050-1-net147@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220523023801.410050-1-net147@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/22 04:38, Jonathan Liu wrote:
> The code from [1] sets SYS_CTRL_1 to different values depending on the
> desired clock phase (0, 1/4, 1/2 or 3/4). A clock phase of 0 aligns the
> positive edge of the clock with the pixel data while other values delay
> the clock by a fraction of the clock period. A clock phase of 1/2 aligns
> the negative edge of the clock with the pixel data.
> 
> The driver currently hard codes SYS_CTRL_1 to 0x88 which corresponds to
> aligning the positive edge of the clock with the pixel data. This won't
> work correctly for panels that require aligning the negative edge of the
> clock with the pixel data.
> 
> Adjust the clock phase to 0 if DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE is
> present in bus_flags, otherwise adjust the clock phase to 1/2 as
> appropriate for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.
> 
> [1] https://github.com/tdjastrzebski/ICN6211-Configurator
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   drivers/gpu/drm/bridge/chipone-icn6211.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 47dea657a752..df0290059aa3 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -57,6 +57,10 @@
>   #define BIST_CHESS_XY_H		0x30
>   #define BIST_FRAME_TIME_L	0x31
>   #define BIST_FRAME_TIME_H	0x32
> +#define CLK_PHASE_0		0x88
> +#define CLK_PHASE_1_4		0x98
> +#define CLK_PHASE_1_2		0xa8
> +#define CLK_PHASE_3_4		0xb8
>   #define FIFO_MAX_ADDR_LOW	0x33
>   #define SYNC_EVENT_DLY		0x34
>   #define HSW_MIN			0x35
> @@ -414,7 +418,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>   	chipone_configure_pll(icn, mode);
>   
>   	chipone_writeb(icn, SYS_CTRL(0), 0x40);
> -	chipone_writeb(icn, SYS_CTRL(1), 0x88);
> +
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> +		chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_0);
> +	else
> +		chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_1_2);

Shouldn't both be "chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_0 | 0x8); 
and chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_1_2 | 0x8); respectively 
? I recall you mentioned that only the top two bits indicate the clock 
polarity , so the bottom 6 bits are something else ?

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks
