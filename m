Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB48C9BFC
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748D910E038;
	Mon, 20 May 2024 11:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="L+IExyoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6DF10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:11:22 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716203479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTAHXovdMrNnDX5CNIwPDo86fcFlzz9zi6EnBgBKmYI=;
 b=L+IExyoCRf2audl+y/F/pxSEby+KilHy6ybQ/3eRbsJoKvj+RfSH97i+B5mHHq+8wdGhHH
 W+/LctJSgWUC1aQJ+dqn2RKySgnLqbfBmfUvTgOux5aH1N9tUkB3yBsoCE7B9stC7UtMRo
 famdbdf2KGjdOnrMEBs2FN5PxCGhMzA=
X-Envelope-To: victor.liu@nxp.com
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
X-Envelope-To: u.kleine-koenig@pengutronix.de
X-Envelope-To: aford173@gmail.com
X-Envelope-To: jani.nikula@intel.com
X-Envelope-To: bli@bang-olufsen.dk
Message-ID: <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
Date: Mon, 20 May 2024 19:11:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de,
 aford173@gmail.com, jani.nikula@intel.com, bli@bang-olufsen.dk
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
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

On 5/20/24 06:11, Dmitry Baryshkov wrote:
> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
>> no interrupt requested at all.
>>
>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
>> a few times, but adv7511_irq_process() happens to refuse to handle
>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
>>
>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
>> handling from adv7511_irq_process().
>>
>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 6089b0bb9321..2074fa3c1b7b 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>   		return ret;
>>   
>>   	/* If there is no IRQ to handle, exit indicating no IRQ data */
>> -	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>> +	if (adv7511->i2c_main->irq &&
>> +	    !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>   	    !(irq1 & ADV7511_INT1_DDC_ERROR))
>>   		return -ENODATA;
> 
> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> instead. WDYT?
> 

I think this is may deserve another patch.

-- 
Best regards
Sui
