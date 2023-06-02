Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9103720B4E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F133910E656;
	Fri,  2 Jun 2023 21:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADE810E64A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:59:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0A4A686040;
 Fri,  2 Jun 2023 23:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685743137;
 bh=EaN85ZVsneH7dv49ug/uBRDwJKKpOobLyXOT6xTfdmI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VNFW6S5WdcFvpOpK4p74KuBQm6UP6FIohKWNtp6gbd6WAo+aOTf07q/NSa5Rray8U
 0TlW0Nt/Qv04bNrK/k45Ap25epqROf9Qh4zGRiO8djXGQGubjnFPBJMgjrLmIkHI8x
 Se6oPkc9BVtxx+8ilCH+Fik3w0d/v0K7LwiJZGG34I4YASX9l8AJZORTskLKFDm6py
 JiRXjdwDO9rf/3e1Lu2E+1c0s/ksoGM3DzHhc5DELxBljVdR53y/zLdSHjMNervNsY
 soZqITXhUkHY1KNdmYtF9O5WmSLSqxsAS21NAzF4AZ+INUZQ2Ap7/T7a8TXe5WFG0J
 B0IftQwIxtnQw==
Message-ID: <70962376-c7f1-1adc-37e4-55fa33055ae9@denx.de>
Date: Fri, 2 Jun 2023 23:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm: bridge: tc358767: give VSDELAY some positive
 value
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
 <20230602191501.4138433-2-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230602191501.4138433-2-l.stach@pengutronix.de>
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
> The documentation is not clear about how this delay works.
> Empirical tests have shown that with a VSDELAY of 0, the first
> scanline is not properly formatted in the output stream when
> DSI->DP mode is used. The calculation spreadsheets from Toshiba
> seem to always make this value equal to the HFP + 10 for DSI->DP
> use-case. For DSI->DPI this value should be > 2 and for DPI->DP
> it seems to always be 0x64.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 46916ae30f8f..9f2c67b4a488 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -817,7 +817,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
>   	 * sync signals
>   	 */
>   	ret = regmap_write(tc->regmap, VPCTRL0,
> -			   FIELD_PREP(VSDELAY, 0) |
> +			   FIELD_PREP(VSDELAY, right_margin + 10) |
>   			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
>   	if (ret)
>   		return ret;

Aren't you running into a problem due to VS timing misconfiguration on 
the scanout engine or DSI serializer side ? The VSDELAY seems to 
increase the length of VSYNC active . Which DSI bus mode do you use, 
sync events/pulses/burst ?
