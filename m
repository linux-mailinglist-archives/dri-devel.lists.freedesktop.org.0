Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE95838F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 08:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055F959FA;
	Thu, 28 Jul 2022 06:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEBB1132F2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 06:46:20 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B61216D4;
 Thu, 28 Jul 2022 08:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1658990779;
 bh=6tsI1MnO9HDLFqseRpRktO0za1aD8wvp2v09jWiF6II=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=CdCPksdCuSNA6VkWAPH5XiG8rFu3KgdIRDZ3OTkUwIYrSYYGNWvJuiunamWRepYq/
 zgbUk66YZlPXqJLmIWRIh3VE+xaYa9M5J7wcQ1xn2pKSEcuoBA2vNoH9IunaUupGVI
 poLka3YxsyCfjcvjgnnLZjOdgg3q1g2faFbOdhoI=
Message-ID: <c72e64b5-fbf0-0605-1d50-5b1f9b99eacf@ideasonboard.com>
Date: Thu, 28 Jul 2022 09:46:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-9-a-bhatia1@ti.com>
 <83df99ee-1304-121f-97e6-85ca416aef1f@ideasonboard.com>
In-Reply-To: <83df99ee-1304-121f-97e6-85ca416aef1f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2022 16:22, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/07/2022 11:08, Aradhya Bhatia wrote:
>> The AM625 DSS peripheral supports 2 OLDI TXes which can work to enable 2
>> duplicated displays of smaller resolutions or enable a single Dual-Link
>> display with a higher resolution (1920x1200).
>>
>> Configure the necessary register to enable the different modes.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 44 +++++++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 0b9689453ee8..28cb61259471 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -1021,8 +1021,8 @@ static void dispc_enable_oldi(struct 
>> dispc_device *dispc, u32 hw_videoport,
>>       int count = 0;
>>       /*
>> -     * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
>> -     * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
>> +     * For the moment MASTERSLAVE, and SRC bits of 
>> DISPC_VP_DSS_OLDI_CFG are
>> +     * set statically to 0.
>>        */
>>       if (fmt->data_width == 24)
>> @@ -1039,7 +1039,45 @@ static void dispc_enable_oldi(struct 
>> dispc_device *dispc, u32 hw_videoport,
>>       oldi_cfg |= BIT(0); /* ENABLE */
>> -    dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>> oldi_cfg);
>> +    /*
>> +     * As per all the current implementations of DSS, the OLDI TXes 
>> are present only on
>> +     * hw_videoport = 0 (OLDI TX 0). However, the config register for 
>> 2nd OLDI TX (OLDI TX 1)
>> +     * is present in the address space of hw_videoport = 1. Hence, 
>> using "hw_videoport + 1" to
>> +     * configure OLDI TX 1.
>> +     */
>> +
>> +    switch (dispc->oldi_mode) {
>> +    case OLDI_MODE_OFF:
>> +        oldi_cfg &= ~BIT(0); /* DISABLE */
>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>> oldi_cfg);
>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>> +        break;
>> +
>> +    case OLDI_SINGLE_LINK_SINGLE_MODE_0:
>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>> oldi_cfg);
>> +        break;
>> +
>> +    case OLDI_SINGLE_LINK_SINGLE_MODE_1:
>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>> +        break;
>> +
>> +    case OLDI_SINGLE_LINK_DUPLICATE_MODE:
>> +        oldi_cfg |= BIT(5); /* DUPLICATE MODE */
>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>> oldi_cfg);
>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>> +        break;
>> +
>> +    case OLDI_DUAL_LINK:
>> +        oldi_cfg |= BIT(11); /* DUALMODESYNC */
>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>> oldi_cfg);
>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>> +        break;
>> +
>> +    default:
>> +        dev_warn(dispc->dev, "%s: Incorrect oldi mode. Returning.\n",
>> +             __func__);
>> +        return;
>> +    }
>>       while (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)) &&
>>              count < 10000)
> 
> This feels a bit hacky:
> 
> - The function is dispc_enable_oldi, but the above code also disables 
> oldi. We have code in dispc_vp_unprepare() which disables OLDI at the 
> moment.
> 
> - The function takes hw_videoport as a parameter, and is designed to 
> work on that videoport. The above operates on two videoports. Isn't the 
> function also called for hw_videoport +1, which would result in reg 
> writes to hw_videoport + 2?
> 
> - No matching code in dispc_vp_unprepare
> 
> Obviously the duplicate mode (I presume that's "cloning") and the dual 
> link complicate things here, and I have to say I haven't worked with 
> such setups. But I think somehow this should be restructured so that 
> common configuration (common to the OLDIs) is done somewhere else.
> 
> I would guess that there are other drivers that support cloning and dual 
> mode. Did you have a look how they handle things?

Oh, I see now... There's just one dss video port for OLDI, the same as 
in am65x, but that single video port is now connected to two OLDI TXes. 
And thus this function will only be called for the single video port.

But... The registers for the second OLDI are part of the second video 
port (DPI) register block?

  Tomi
