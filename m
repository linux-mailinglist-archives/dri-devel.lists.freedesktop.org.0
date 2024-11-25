Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4A9D8412
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 12:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498910E285;
	Mon, 25 Nov 2024 11:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mZRHJVA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D713910E285
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:08:07 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 354996B5;
 Mon, 25 Nov 2024 12:07:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1732532864;
 bh=eKZ3NTtyLru4te3bIet0CwHqjzzmKZtcG0wMs7PZ2w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mZRHJVA8sseG1Gmr8AcwOpOyshbXvvaqxf0Yh506PLb3LA18dn1vl5Y8eceumjrGo
 ItYh9QbNdeMUqkJqaEPgnJI+MGOR9lTz2hfP8O2vqyoOZ5njFbSFdpcdFWzjMeMgt5
 +pcBTndCDtjCIrzid62CfAwnB6yCoNNfF9rdpMhg=
Message-ID: <798adbca-7384-4c94-915d-f2cf0710b4e7@ideasonboard.com>
Date: Mon, 25 Nov 2024 13:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/tidss: Fix issue in irq handling causing
 irq-flood issue
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Cormier <jcormier@criticallink.com>, Bin Liu <b-liu@ti.com>,
 stable@vger.kernel.org
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
 <e2828b26-8ee9-4140-a377-647f5ae12e2f@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <e2828b26-8ee9-4140-a377-647f5ae12e2f@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 24/11/2024 19:18, Aradhya Bhatia wrote:
> Hi Tomi, Devarsh,
> 
> On 10/21/24 19:37, Tomi Valkeinen wrote:
>> It has been observed that sometimes DSS will trigger an interrupt and
>> the top level interrupt (DISPC_IRQSTATUS) is not zero, but the VP and
>> VID level interrupt-statuses are zero.
> 
> Does this mean that there was a legitimate interrupt that potentially
> went unrecognized? Or that there was a, for the lack of a better word,
> fake interrupt trigger that doesn't need handling but just clearing?

I don't have an answer to that. I haven't been able to trigger this 
issue, and I guess it's difficult to say for certain in any case.

My guess is that it's some kind of race issue either in the HW or the 
combination of HW+SW.

>> As the top level irqstatus is supposed to tell whether we have VP/VID
>> interrupts, the thinking of the driver authors was that this particular
>> case could never happen. Thus the driver only clears the DISPC_IRQSTATUS
>> bits which has corresponding interrupts in VP/VID status. So when this
>> issue happens, the driver will not clear DISPC_IRQSTATUS, and we get an
>> interrupt flood.
>>
>> It is unclear why the issue happens. It could be a race issue in the
>> driver, but no such race has been found. It could also be an issue with
>> the HW. However a similar case can be easily triggered by manually
>> writing to DISPC_IRQSTATUS_RAW. This will forcibly set a bit in the
>> DISPC_IRQSTATUS and trigger an interrupt, and as the driver never clears
>> the bit, we get an interrupt flood.
>>
>> To fix the issue, always clear DISPC_IRQSTATUS. The concern with this
>> solution is that if the top level irqstatus is the one that triggers the
>> interrupt, always clearing DISPC_IRQSTATUS might leave some interrupts
>> unhandled if VP/VID interrupt statuses have bits set. However, testing
>> shows that if any of the irqstatuses is set (i.e. even if
>> DISPC_IRQSTATUS == 0, but a VID irqstatus has a bit set), we will get an
>> interrupt.
> 
> Does this mean if VID/VP irqstatus has been set right around the time
> the equivalent DISPC_IRQSTATUS bit is being cleared, the equivalent
> DISPC_IRQSTATUS bit is going to get set again, and make the driver
> handle the event as we expect it to?

(If I recall right) no, DISPC_IRQSTATUS won't be set. But it doesn't 
matter, the interrupt will be triggered anyway, and the driver will 
handle the interrupt.

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Co-developed-by: Bin Liu <b-liu@ti.com>
>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> Co-developed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
>> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
>> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
>> Cc: stable@vger.kernel.org
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
>>   1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 1ad711f8d2a8..f81111067578 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -780,24 +780,20 @@ static
>>   void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
>>   {
>>   	unsigned int i;
>> -	u32 top_clear = 0;
>>   
>>   	for (i = 0; i < dispc->feat->num_vps; ++i) {
>> -		if (clearmask & DSS_IRQ_VP_MASK(i)) {
>> +		if (clearmask & DSS_IRQ_VP_MASK(i))
>>   			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
>> -			top_clear |= BIT(i);
>> -		}
>>   	}
>>   	for (i = 0; i < dispc->feat->num_planes; ++i) {
>> -		if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
>> +		if (clearmask & DSS_IRQ_PLANE_MASK(i))
>>   			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
>> -			top_clear |= BIT(4 + i);
>> -		}
>>   	}
> 
> nit: Maybe these for-loop braces could be dropped as well.

I like to have braces if there are multiple lines under it.

> Otherwise, LGTM,
> 
> Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Thanks!

  Tomi

