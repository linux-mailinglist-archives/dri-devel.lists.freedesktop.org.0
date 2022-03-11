Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121634D60B4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 12:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04B10E8F8;
	Fri, 11 Mar 2022 11:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E07D10E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 11:36:15 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 75b78978-a12f-11ec-9faa-0050568c148b;
 Fri, 11 Mar 2022 11:36:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6F2BC194B58;
 Fri, 11 Mar 2022 12:36:13 +0100 (CET)
Date: Fri, 11 Mar 2022 12:36:09 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix not correct get property
 counts
Message-ID: <Yis0KXVqZokrkoP7@ravnborg.org>
References: <20220311103525.1431890-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311103525.1431890-1-xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 mliu@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin.

On Fri, Mar 11, 2022 at 06:35:25PM +0800, Xin Ji wrote:
> The property length which returns from "of_get_property", it means array
> bytes count if the property has prefix as "/bits/ 8". The driver should
> call function "of_property_read_u8_array" to get correct array value.
> 
> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> V1 -> V2: Fix Sam comment, use of_property_read_u8_array to get array
> value
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c6a9a02ed762..628cbf769141 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1598,8 +1598,8 @@ static int anx7625_get_swing_setting(struct device *dev,
>  			num_regs = DP_TX_SWING_REG_CNT;
>  
>  		pdata->dp_lane0_swing_reg_cnt = num_regs;
> -		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> -					   pdata->lane0_reg_data, num_regs);
> +		of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
> +					  pdata->lane0_reg_data, num_regs);

The current implementation do a two step approach. First is find the
number of elements and then read the elements.
The number of elements is only used to limit what is read.

I suggest to use:

of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
			  pdata->lane0_reg_data, DP_TX_SWING_REG_CNT);

Then you a guaranteed to read at maximum DP_TX_SWING_REG_CNT entries.
And as the number of elements is not stored anywhere that should be fine.

This looks simpler and matches what we for example do in
drivers/gpu/drm/arm/malidp_drv.c - the only user in gpu/ of
of_property_read_u8_array().


	Sam
