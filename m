Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D65530ECA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 15:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE310F8F6;
	Mon, 23 May 2022 13:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E4A10F8F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 13:15:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A1D983F63;
 Mon, 23 May 2022 15:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653311749;
 bh=4bFiDiaYlV9Jugn/YdDfC17knBmSNXCDe6+1UHpydFc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DEuBIwpTpbH22FAo2v/WBXqNyEfLjd0odQyr8u+WZ2c/D422aIKtfncYfpUgu+5Lt
 pvy+E2IEDwuB6wiX04e33SINQ2wGMGLdLD7Zh+pN/H3jGs/mjQpjWrTsKX40VlXGds
 Vz2pzwXDTm59S+xjldIuzCbtZnWprdD7ImkLGo21UBugzmxXr9Lr4XK7Z1xhzScuE0
 hNS0M/wusrot+Ssaqq7pvtv+VN1di0d5Wei0g0ABN7q6AzKo+SEn58REutF2NuB1H4
 U4um2LD9D0HfUS2uoEWeZYydtxUewmM6450Gc5s/cgtp1so0qYs/PegBKxKyxjdry3
 eoq4hUqT8W4yg==
Message-ID: <868d010c-9fca-3fac-7657-faaa2f271c14@denx.de>
Date: Mon, 23 May 2022 15:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] drm: bridge: icn6211: Adjust clock phase using
 SYS_CTRL_1
Content-Language: en-US
To: Jonathan Liu <net147@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220523130144.444225-1-net147@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220523130144.444225-1-net147@gmail.com>
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

On 5/23/22 15:01, Jonathan Liu wrote:
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
> V2: Use GENMASK and FIELD_PREP macros
> ---
>   drivers/gpu/drm/bridge/chipone-icn6211.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 47dea657a752..f1538fb5f8a9 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -9,6 +9,8 @@
>   #include <drm/drm_print.h>
>   #include <drm/drm_mipi_dsi.h>
>   
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
> @@ -26,6 +28,11 @@
>   #define PD_CTRL(n)		(0x0a + ((n) & 0x3)) /* 0..3 */
>   #define RST_CTRL(n)		(0x0e + ((n) & 0x1)) /* 0..1 */
>   #define SYS_CTRL(n)		(0x10 + ((n) & 0x7)) /* 0..4 */
> +#define SYS_CTRL_1_CLK_PHASE_MSK	GENMASK(5, 4)

This should be GENMASK(7, 6) , no ?
