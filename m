Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745FC3BA448
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9C86E11A;
	Fri,  2 Jul 2021 19:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2526E11A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:12:48 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2327980098;
 Fri,  2 Jul 2021 21:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625253166;
 bh=kBJjHGnY+bvKhbCOqxqeN8yDhZs7b2P9wgFhhObcueE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Md+ztX/YkdHhUzRJPnO5x+W9d/xxyz2Ua/NAYgbD4ZCG/Idr9E02nboT+4jp4yaeO
 dI0YmjSJeQFASF2lIKIXl5C1toFo9keWGIRT0sSID01FuD00LlT3hsFGirmsRkz0WZ
 RIz/Gkfj/QqxIExcilPbakcia93LW9qqbTPx9CBxeSkaEhBrMt5Cbn14h32HWDcl8N
 gGIfClvaORVP2QUc0hTX/2/c8Z+Z3Pj7yLymhWU340ylTYdmvxFDuGMCXU2O2yY2qh
 4M3qK7nXu29VZV5xmn8ocEJEFs/9yuS8etmnqZ2mSHIasvRI9NeQo1hVUsdgO575cR
 g6OjbSOWo5rnQ==
Subject: Re: [PATCH] drm: mxsfb: Enable recovery on underflow
From: Marek Vasut <marex@denx.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210620224701.189289-1-marex@denx.de>
 <YNCCgCWA8KdkS/df@pendragon.ideasonboard.com>
 <6326d213-548c-0c80-5e35-cd7a76dacade@denx.de>
Message-ID: <07e32619-242a-5fc8-dfe3-607adc61699a@denx.de>
Date: Fri, 2 Jul 2021 21:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6326d213-548c-0c80-5e35-cd7a76dacade@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 7/1/21 12:49 AM, Marek Vasut wrote:
> On 6/21/21 2:13 PM, Laurent Pinchart wrote:
>> Hi Marek,
>>
>> Thank you for the patch.
>>
>> On Mon, Jun 21, 2021 at 12:47:01AM +0200, Marek Vasut wrote:
>>> There is some sort of corner case behavior of the controller,
>>> which could rarely be triggered at least on i.MX6SX connected
>>> to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
>>> bridged 1920x1080 panel (and likely on other setups too), where
>>> the image on the panel shifts to the right and wraps around.
>>> This happens either when the controller is enabled on boot or
>>> even later during run time. The condition does not correct
>>> itself automatically, i.e. the display image remains shifted.
>>>
>>> It seems this problem is known and is due to sporadic underflows
>>> of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
>>> IRQs, neither of the IRQs trigger and neither IRQ status bit is
>>> asserted when this condition occurs.
>>>
>>> All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
>>> bit, which is described in the reference manual since i.MX23 as
>>> "
>>>    Set this bit to enable the LCDIF block to recover in the next
>>>    field/frame if there was an underflow in the current field/frame.
>>> "
>>> Enable this bit to mitigate the sporadic underflows.
>>>
>>> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Daniel Abrecht <public@danielabrecht.ch>
>>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Stefan Agner <stefan@agner.ch>
>>> ---
>>>   drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 29 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>>>   2 files changed, 30 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c 
>>> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> index 300e7bab0f43..01e0f525360f 100644
>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> @@ -115,6 +115,35 @@ static void mxsfb_enable_controller(struct 
>>> mxsfb_drm_private *mxsfb)
>>>       reg |= VDCTRL4_SYNC_SIGNALS_ON;
>>>       writel(reg, mxsfb->base + LCDC_VDCTRL4);
>>> +    /*
>>> +     * Enable recovery on underflow.
>>> +     *
>>> +     * There is some sort of corner case behavior of the controller,
>>> +     * which could rarely be triggered at least on i.MX6SX connected
>>> +     * to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
>>> +     * bridged 1920x1080 panel (and likely on other setups too), where
>>> +     * the image on the panel shifts to the right and wraps around.
>>> +     * This happens either when the controller is enabled on boot or
>>> +     * even later during run time. The condition does not correct
>>> +     * itself automatically, i.e. the display image remains shifted.
>>> +     *
>>> +     * It seems this problem is known and is due to sporadic underflows
>>> +     * of the LCDIF FIFO. While the LCDIF IP does have 
>>> underflow/overflow
>>> +     * IRQs, neither of the IRQs trigger and neither IRQ status bit is
>>> +     * asserted when this condition occurs.
>>> +     *
>>> +     * All known revisions of the LCDIF IP have CTRL1 
>>> RECOVER_ON_UNDERFLOW
>>> +     * bit, which is described in the reference manual since i.MX23 as
>>> +     * "
>>> +     *   Set this bit to enable the LCDIF block to recover in the next
>>> +     *   field/frame if there was an underflow in the current 
>>> field/frame.
>>> +     * "
>>> +     * Enable this bit to mitigate the sporadic underflows.
>>> +     */
>>> +    reg = readl(mxsfb->base + LCDC_CTRL1);
>>> +    reg |= CTRL1_RECOVER_ON_UNDERFLOW;
>>> +    writel(reg, mxsfb->base + LCDC_CTRL1);
>>
>> Looks good to me. Thanks for the detailed explanation.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> So who do I CC to pick it? Robert ? There are a few more mxsfb fixes 
> which are RB'd and would be nice if they were picked too.

+CC Daniel, can those RB'd mxsfb patches be picked ?
