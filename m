Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954359FF19
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D692B9BA0;
	Wed, 24 Aug 2022 16:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 044A7B9B78
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:07:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91ED6106F;
 Wed, 24 Aug 2022 09:08:01 -0700 (PDT)
Received: from [10.57.15.180] (unknown [10.57.15.180])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 661923FAF5;
 Wed, 24 Aug 2022 09:07:56 -0700 (PDT)
Message-ID: <a279a697-6960-c517-8984-335aa207126a@arm.com>
Date: Wed, 24 Aug 2022 17:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/2] drm/rockchip: dw_hdmi: relax mode_valid hook
Content-Language: en-GB
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220822152017.1523679-1-s.hauer@pengutronix.de>
 <20220822152017.1523679-2-s.hauer@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220822152017.1523679-2-s.hauer@pengutronix.de>
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
Cc: linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-22 16:20, Sascha Hauer wrote:
> The driver checks if the pixel clock of the given mode matches an entry
> in the mpll config table. The frequencies in the mpll table are meant as
> a frequency range up to which the entry works, not as a frequency that
> must match the pixel clock. Return MODE_OK when the pixelclock is
> smaller than one of the mpll frequencies to allow for more display
> resolutions.

Has the issue been fixed that this table is also used to validate modes 
on RK3328, which doesn't even *have* the Synopsys phy? Last time I 
looked, that tended to lead to complete display breakage when the proper 
phy driver later decides it doesn't like a pixel clock that mode_valid 
already said was OK.

The more general concern is that these known-good clock rates are good, 
but others may not be even when nominally supported, which I suspect is 
the dirty secret of why it was implemented this way to begin with. I 
would really really love this patch so my RK3399 board can drive my 
1920x1200 monitor at native resolution, but on the other hand my RK3288 
box generates such a crap 154MHz clock for that mode that - unless 
that's been improved in the meantime too - patch #2 might be almost be 
considered a regression if it means such a setup would start defaulting 
to an unusably glitchy display instead of falling back to 1920x1080 
which does at least work perfectly (even if the slightly squished aspect 
ratio is ugly).

Thanks,
Robin.

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index c14f888938688..b6b662dabedc6 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -251,7 +251,7 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
>   	int i;
>   
>   	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
> -		if (pclk == mpll_cfg[i].mpixelclock) {
> +		if (pclk <= mpll_cfg[i].mpixelclock) {
>   			valid = true;
>   			break;
>   		}
