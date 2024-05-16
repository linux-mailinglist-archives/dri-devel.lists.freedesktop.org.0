Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0198C74FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 13:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AB010EC6E;
	Thu, 16 May 2024 11:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="V3QLOFjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E48A10EC6E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:07:52 +0000 (UTC)
X-Envelope-To: victor.liu@nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715857670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFIHxeP9M+LmvRKzSaSABRLWtsMlPkWTGAKIdrDLly8=;
 b=V3QLOFjnOS2kYE0zTuy6tvxGcsj+0CGXSiyOwMide0cs2H/kJ3N+C3vkmgNKLYb7vSVlHb
 +3PRTkyVw38DzQoLmy4x4uo1w1lBkyRRu5eu4/tPRFcQ1VqMjuYhq6sM8GS89k2jNwZtkW
 IvSks78CXOkxPEbRNmexG96GxdpIX90=
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: andrzej.hajda@intel.com
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: biju.das.jz@bp.renesas.com
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: u.kleine-koenig@pengutronix.de
X-Envelope-To: aford173@gmail.com
X-Envelope-To: jani.nikula@intel.com
X-Envelope-To: bli@bang-olufsen.dk
Message-ID: <0ae84b3c-9935-4cb5-9ed5-3fc87a416857@linux.dev>
Date: Thu, 16 May 2024 19:07:43 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 biju.das.jz@bp.renesas.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@pengutronix.de, aford173@gmail.com, jani.nikula@intel.com,
 bli@bang-olufsen.dk
References: <20240516101006.2388767-1-victor.liu@nxp.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240516101006.2388767-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/16/24 18:10, Liu Ying wrote:
> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> no interrupt requested at all.
> 
> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> a few times, but adv7511_irq_process() happens to refuse to handle
> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> 
> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> handling from adv7511_irq_process().
> 
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 6089b0bb9321..2074fa3c1b7b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>   		return ret;
>   
>   	/* If there is no IRQ to handle, exit indicating no IRQ data */
> -	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> +	if (adv7511->i2c_main->irq &&

Maybe you could use 'if (process_hpd)' here.

> +	    !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>   	    !(irq1 & ADV7511_INT1_DDC_ERROR))
>   		return -ENODATA;
>   

-- 
Best regards
Sui
