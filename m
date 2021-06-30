Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0A3B8A98
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 00:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DA46EA8C;
	Wed, 30 Jun 2021 22:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B286EA8C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 22:49:06 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 15468831D4;
 Thu,  1 Jul 2021 00:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625093343;
 bh=P9GoBMnasqQdt0sVPBC95QnShX6GIQNuUJcPq54Negs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C39tuFKWkVa0Vk2gWN/+h/CHar/TYYiubgFbuYAttuRD7eFt+SjRp6yAXjsKBHHPG
 PPDHCsEaeb+5W9fLi8h6/meEv5rytVc5bfGh9DxfS2/kRX0mZfMVd0gJdvvIzrIwpx
 6dbJWFPPzDMlu+vQpB2b2FndyMkwNi5/lQO+HzMDrhHs3rzEXdulTRfrZc6NbfJTfk
 CULkiOJot0Co4DGBDql/CsHsmIHNg542oo/xQRJ6z+2iSkERRerRRtIIFyJaCK4vcp
 Kr8AMR3ke75FHxhIR2dR4hKbgTEE1q7SVuiIJ+Ld1a/CqsRgOlrIGIv2SDGFQcgdeC
 D9MemEMYDqm2g==
Subject: Re: [PATCH] drm: mxsfb: Enable recovery on underflow
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210620224701.189289-1-marex@denx.de>
 <YNCCgCWA8KdkS/df@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6326d213-548c-0c80-5e35-cd7a76dacade@denx.de>
Date: Thu, 1 Jul 2021 00:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNCCgCWA8KdkS/df@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: ch@denx.de, Robert Foss <robert.foss@linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Abrecht <public@danielabrecht.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/21 2:13 PM, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Mon, Jun 21, 2021 at 12:47:01AM +0200, Marek Vasut wrote:
>> There is some sort of corner case behavior of the controller,
>> which could rarely be triggered at least on i.MX6SX connected
>> to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
>> bridged 1920x1080 panel (and likely on other setups too), where
>> the image on the panel shifts to the right and wraps around.
>> This happens either when the controller is enabled on boot or
>> even later during run time. The condition does not correct
>> itself automatically, i.e. the display image remains shifted.
>>
>> It seems this problem is known and is due to sporadic underflows
>> of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
>> IRQs, neither of the IRQs trigger and neither IRQ status bit is
>> asserted when this condition occurs.
>>
>> All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
>> bit, which is described in the reference manual since i.MX23 as
>> "
>>    Set this bit to enable the LCDIF block to recover in the next
>>    field/frame if there was an underflow in the current field/frame.
>> "
>> Enable this bit to mitigate the sporadic underflows.
>>
>> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Daniel Abrecht <public@danielabrecht.ch>
>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Stefan Agner <stefan@agner.ch>
>> ---
>>   drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 29 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> index 300e7bab0f43..01e0f525360f 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> @@ -115,6 +115,35 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
>>   	reg |= VDCTRL4_SYNC_SIGNALS_ON;
>>   	writel(reg, mxsfb->base + LCDC_VDCTRL4);
>>   
>> +	/*
>> +	 * Enable recovery on underflow.
>> +	 *
>> +	 * There is some sort of corner case behavior of the controller,
>> +	 * which could rarely be triggered at least on i.MX6SX connected
>> +	 * to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
>> +	 * bridged 1920x1080 panel (and likely on other setups too), where
>> +	 * the image on the panel shifts to the right and wraps around.
>> +	 * This happens either when the controller is enabled on boot or
>> +	 * even later during run time. The condition does not correct
>> +	 * itself automatically, i.e. the display image remains shifted.
>> +	 *
>> +	 * It seems this problem is known and is due to sporadic underflows
>> +	 * of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
>> +	 * IRQs, neither of the IRQs trigger and neither IRQ status bit is
>> +	 * asserted when this condition occurs.
>> +	 *
>> +	 * All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
>> +	 * bit, which is described in the reference manual since i.MX23 as
>> +	 * "
>> +	 *   Set this bit to enable the LCDIF block to recover in the next
>> +	 *   field/frame if there was an underflow in the current field/frame.
>> +	 * "
>> +	 * Enable this bit to mitigate the sporadic underflows.
>> +	 */
>> +	reg = readl(mxsfb->base + LCDC_CTRL1);
>> +	reg |= CTRL1_RECOVER_ON_UNDERFLOW;
>> +	writel(reg, mxsfb->base + LCDC_CTRL1);
> 
> Looks good to me. Thanks for the detailed explanation.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

So who do I CC to pick it? Robert ? There are a few more mxsfb fixes 
which are RB'd and would be nice if they were picked too.
