Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB1933823
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 09:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BAC10E9DE;
	Wed, 17 Jul 2024 07:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="NKmuhs5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3320110E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:41:52 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721202111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kdghzpYTLountuHMAHm85KxWPtE0BOZWLjcep8l9Ec=;
 b=NKmuhs5moRNzolDxH6jfC+IhJtKWryK3UlICMzWitzYON8ZOS1+42mUBhSfuY0AbCbJ4Oc
 UjjjqpfDcIYqHOONIL+P7Iwd6oslAisgion7C+hTm2sIB049cFVLLDw3yVi6c8JLCkya2J
 eh0G3aYQc9ZmlRdlzfqevWHEgXsce6r07/5MruObGFYL0195icUk60j/lC2X9JPZrmnie/
 x11wGANJO7n86hgZJrDgQGItTz/V5nB8c2eqpmAvWggPoKlDWI7OpovGBmrOrXJReG2zdR
 zjojh08uX5ZyhceBZL1JUVSzXIU03NGAPgrUh9agaJ6EybPqPIHJHWQ2reWLcQ==
Date: Wed, 17 Jul 2024 09:41:50 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: dsi: Reset ISP1 DPHY before powering it on
In-Reply-To: <pb477qi34clwdvrdrdparff5jvl6emdje3aswpylovejh2wx3q@vzwju366kkji>
References: <6e0ce232acfe952970e9b37402fe08a3678aa43a.1721196758.git.dsimic@manjaro.org>
 <e79cbc94804e93464be62e7731def4fa@manjaro.org>
 <pb477qi34clwdvrdrdparff5jvl6emdje3aswpylovejh2wx3q@vzwju366kkji>
Message-ID: <287caa145232a310c0e40a8b761bcd9a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Ondrej,

On 2024-07-17 09:32, Ondřej Jirman wrote:
> On Wed, Jul 17, 2024 at 08:48:29AM GMT, Dragan Simic wrote:
>> Hello all,
>> 
>> On 2024-07-17 08:29, Dragan Simic wrote:
>> > From: Ondrej Jirman <megi@xff.cz>
>> >
>> > After a suspend and resume cycle, ISP1 stops receiving data, as observed
>> > on the Pine64 PinePhone Pro, which is based on the Rockchip RK3399 SoC.
>> > Re-initializing DPHY during the PHY power-on, if the SoC variant
>> > supports
>> > initialization, fixes this issue.
>> >
>> > [ dsimic: Added more details to the commit summary and description ]
>> >
>> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
>> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> > ---
>> >  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> > b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> > index 4cc8ed8f4fbd..9ad48c6dfac3 100644
>> > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> > @@ -1240,6 +1240,14 @@ static int dw_mipi_dsi_dphy_power_on(struct phy
>> > *phy)
>> >  		goto err_phy_cfg_clk;
>> >  	}
>> >
>> > +	if (dsi->cdata->dphy_rx_init) {
>> > +		ret = dsi->cdata->dphy_rx_init(phy);
>> > +		if (ret < 0) {
>> > +			DRM_DEV_ERROR(dsi->dev, "hardware-specific phy init failed: %d\n",
>> > ret);
>> > +			goto err_pwr_on;
>> > +		}
>> > +	}
>> > +
>> >  	/* do soc-variant specific init */
>> >  	if (dsi->cdata->dphy_rx_power_on) {
>> >  		ret = dsi->cdata->dphy_rx_power_on(phy);
>> 
>> After thinking a bit more about this patch in its original form [1]
>> that's preserved above, I think it would be better to move the
>> additional DPHY initialization to dw_mipi_dsi_rockchip_resume(),
>> because that function seems to be the right place for such fixes.
>> 
>> Please, let me know your thoughts.
> 
> That also works (see attachment) to fix the original issue in the 
> commit
> message, but if you keep the stream on across suspend/resume it does 
> halt so
> it's not a complete solution either.

Great, thanks for the attached patch.  I assume that you already have
a patch that performs the other required operations on suspend and 
resume,
i.e. stops the stream and restarts it?

How about dropping my "handled" variant of your patch and having you
submit the patch you sent as attachment, and the additional patch you
described as also needed?

>> [1] 
>> https://megous.com/git/linux/commit/?h=orange-pi-6.9&id=ed7992f668a1e529719ee6847ca114f9b67efacb
