Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94D68D503
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 12:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5E710E074;
	Tue,  7 Feb 2023 11:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xvfrqvdb.outbound-mail.sendgrid.net
 (xvfrqvdb.outbound-mail.sendgrid.net [168.245.72.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB0210E074
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=HenSMTrgrLKplahvcFifYdl9RBoK9/xvCtUuvoh3/VA=;
 b=cff0ebB4AliNsBNAS1MHiES4piW7wS94irZwQFOzlQm61xOz2rhHOf1tiZoPdT7BeAD1
 b+5vp6+SfC6IUyggBjSvMK2RKwrsDjDPzH8AxlglM7ftGfN5Sndq/KkB/BJG+MuvcaIbtm
 PrAJc6Hqy3Llvt+znPpEnrarlY9KU0w163U2HC0HwpshOztRKle5xtwB52gXrE3g6f+3h6
 WDw2k5+Mgj266F8vKCGXWs+MeVOX6HuTFAELyUFWIr2y96ITd1t2ByHeubGxyw8a74T6h2
 yhmygi/Yx69BjOhGsvt0lBvL5Ebi2NT9V7Hjf2Cxhg29TIv8vayoynBkDm9CoYRA==
Received: by filterdrecv-557d69979-492mf with SMTP id
 filterdrecv-557d69979-492mf-1-63E22F85-12A
 2023-02-07 11:01:26.136761726 +0000 UTC m=+7041333.050952024
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-canary-0 (SG)
 with ESMTP id z0wMd4_PSK2AY2B5rCg9wQ
 Tue, 07 Feb 2023 11:01:25.718 +0000 (UTC)
Message-ID: <0bec1f06-9fad-60ad-19eb-3d54135031f7@kwiboo.se>
Date: Tue, 07 Feb 2023 11:01:26 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 4/4] drm/rockchip: dw_hdmi: discard modes with
 unachievable pixelclocks
Content-Language: en-US
References: <20230207084452.1069656-1-s.hauer@pengutronix.de>
 <20230207084452.1069656-5-s.hauer@pengutronix.de>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230207084452.1069656-5-s.hauer@pengutronix.de>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hxKYDk3Ndxut4dHrI?=
 =?us-ascii?Q?uunN5BgBTdaYVpq6jUWEiTITcxjpRSSL7mu7WcP?=
 =?us-ascii?Q?=2FTUdEwxOt7yXJphabgNF=2FKgQ3c4IrxHfqldSGi6?=
 =?us-ascii?Q?+J3R4ugjETLP+qK0AoOusqYP8LuiMxVGTzADx2D?=
 =?us-ascii?Q?qbnQiHPRueaGWUfM8RfEdHIzvFvIFp991wGe=2FMj?=
 =?us-ascii?Q?ogLEOzDnpN+JwtgIiojQQ=3D=3D?=
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Type: text/plain; charset=us-ascii
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

On 2023-02-07 09:44, Sascha Hauer wrote:
> The Rockchip PLL drivers are currently table based and support only
> the most common pixelclocks. Discard all modes we cannot achieve
> at all. Normally the desired pixelclocks have an exact match in the
> PLL driver, nevertheless allow for a 0.1% error just in case.
> 
> Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
> Tested-by: Dan Johansen <strit@manjaro.org>
> Link: https://lore.kernel.org/r/20230118132213.2911418-4-s.hauer@pengutronix.de
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index feba6b9becd6c..725952811752b 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -256,10 +256,14 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>  {
>  	struct rockchip_hdmi *hdmi = data;
>  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
> -	int pclk = mode->clock * 1000;
> +	int rpclk, pclk = mode->clock * 1000;
>  	bool exact_match = hdmi->plat_data->phy_force_vendor;
>  	int i;
>  
> +	rpclk = clk_round_rate(hdmi->ref_clk, pclk);
> +	if (abs(rpclk - pclk) > pclk / 1000)
> +		return MODE_NOCLOCK;

The ref_clk is optional and rk3228/rk3328 dts do not supply a ref or vpll clock.

Regards,
Jonas

> +
>  	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
>  		/*
>  		 * For vendor specific phys force an exact match of the pixelclock

