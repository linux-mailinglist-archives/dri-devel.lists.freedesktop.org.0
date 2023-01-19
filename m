Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34433674F12
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AFC10EA81;
	Fri, 20 Jan 2023 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923310E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:38:59 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 384D57EC;
 Thu, 19 Jan 2023 09:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674117538;
 bh=DeiHX1qNbCKawlrBL7AbCC2x+6+M3rF4fH3NawDfTNs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H4af+7Zu21Ff10xfIqRiUEiXZ+Q6l8zJKFt1q5YrFpdrutqC9nRtjqIrZGJN94vzV
 XXd17SwIoEiQE006TYEQjgbajPSlxXmrxT931qmARD1Xl7zZ631p5r/r3chNIg0VQr
 A+krJlQc4g3W1gvjYT4lDMJq9OxAFhwy8r0EWQ2k=
Message-ID: <664db873-6bdf-c3d3-cc69-bca5521e29a7@ideasonboard.com>
Date: Thu, 19 Jan 2023 10:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hfQy9zp9WKluq/@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hfQy9zp9WKluq/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 23:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:50PM +0200, Tomi Valkeinen wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> Reset LVDS using the reset control as CPG reset/release is required in
>> H/W manual sequence.
> 
> s@H/W@the hardware@
> 
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: Rewrite the patch description]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/Kconfig     |  1 +
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>> index a8f862c68b4f..151e400b996d 100644
>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>> @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
>>   	select DRM_PANEL
>>   	select OF_FLATTREE
>>   	select OF_OVERLAY
>> +	select RESET_CONTROLLER
>>   
>>   config DRM_RCAR_USE_MIPI_DSI
>>   	bool "R-Car DU MIPI DSI Encoder Support"
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 81a060c2fe3f..674b727cdaa2 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/sys_soc.h>
>>   
>> @@ -60,6 +61,7 @@ struct rcar_lvds_device_info {
>>   struct rcar_lvds {
>>   	struct device *dev;
>>   	const struct rcar_lvds_device_info *info;
>> +	struct reset_control *rstc;
>>   
>>   	struct drm_bridge bridge;
>>   
>> @@ -316,6 +318,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>>   
>>   	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>>   
>> +	reset_control_deassert(lvds->rstc);
> 
> Can this fail ? Same in __rcar_lvds_atomic_enable().

Yes. Too hasty in picking a patch from the BSP =).

>> +
>>   	ret = clk_prepare_enable(lvds->clocks.mod);
> 
> It would be nice to switch this driver to runtime PM and move reset and
> clock handling to the suspend/resume handlers. A candidate for a future
> patch.

I have the runtime PM patch in my work branch, but on top. I'll pick 
that into this series, before adding the reset control. Makes error 
handling a bit simpler.

>>   	if (ret < 0)
> 
> Missing reset_control_assert(). Same in other error paths if applicable,
> here and in __rcar_lvds_atomic_enable().

Yep.

  Tomi

