Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43366604E50
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFDA10EB31;
	Wed, 19 Oct 2022 17:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B891B10EB39
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 17:14:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29JHEPUt113785;
 Wed, 19 Oct 2022 12:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1666199665;
 bh=6Yk4ZgWU7L/RHOKUFCxLZUy3p8/nm2inHJmRmMRVoC8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vF6pJI+afFZ5TlfIqj3eJKDQ7QkQfYU8+MckbmeKpKyJMUjEoWVdYGNGyFvlWRKjl
 87vsXNEEBSMkd5rZyAywHvuU1LY0b46KFNuVWs7qqdfXDvb6VK/ji7AGaR702q28Mw
 FwQioz4T0Ix1wWv9vCiRlEGFCFPgQvjhcvXdgDm0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29JHEPVV003107
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Oct 2022 12:14:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 19
 Oct 2022 12:14:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 19 Oct 2022 12:14:24 -0500
Received: from [10.250.234.73] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29JHEJRe017688;
 Wed, 19 Oct 2022 12:14:20 -0500
Message-ID: <837bcf1d-e59f-5990-29e2-2b64d3dfaaa1@ti.com>
Date: Wed, 19 Oct 2022 22:44:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v5 5/6] drm/tidss: Add IO CTRL and Power support for
 OLDI TX in am625
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Rob Herring <robh+dt@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-6-a-bhatia1@ti.com>
 <708ae70e-dc1b-1079-8442-06cbea228e99@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <708ae70e-dc1b-1079-8442-06cbea228e99@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi

On 12-Oct-22 17:59, Tomi Valkeinen wrote:
> On 28/09/2022 20:52, Aradhya Bhatia wrote:
>> The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
>> the ctrl mmr registers that supported the OLDI TX power have become
>> different in AM625 SoC.
>>
>> Add IO CTRL support and control the OLDI TX power for AM625.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c      | 55 ++++++++++++++++++------
>>   drivers/gpu/drm/tidss/tidss_dispc_regs.h |  6 +++
>>   2 files changed, 49 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 88008ad39b55..68444e0cd8d7 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -921,21 +921,52 @@ int dispc_vp_bus_check(struct dispc_device 
>> *dispc, u32 hw_videoport,
>>   static void dispc_oldi_tx_power(struct dispc_device *dispc, bool power)
>>   {
>> -    u32 val = power ? 0 : OLDI_PWRDN_TX;
>> +    u32 val;
>>       if (WARN_ON(!dispc->oldi_io_ctrl))
>>           return;
>> -    regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
>> -               OLDI_PWRDN_TX, val);
>> -    regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
>> -               OLDI_PWRDN_TX, val);
>> -    regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
>> -               OLDI_PWRDN_TX, val);
>> -    regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
>> -               OLDI_PWRDN_TX, val);
>> -    regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
>> -               OLDI_PWRDN_TX, val);
>> +    if (dispc->feat->subrev == DISPC_AM65X) {
>> +        val = power ? 0 : OLDI_PWRDN_TX;
>> +
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
>> +                   OLDI_PWRDN_TX, val);
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
>> +                   OLDI_PWRDN_TX, val);
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
>> +                   OLDI_PWRDN_TX, val);
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
>> +                   OLDI_PWRDN_TX, val);
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
>> +                   OLDI_PWRDN_TX, val);
>> +
>> +    } else if (dispc->feat->subrev == DISPC_AM625) {
>> +        if (power) {
>> +            switch (dispc->oldi_mode) {
>> +            case OLDI_SINGLE_LINK_SINGLE_MODE:
>> +                /* Power down OLDI TX 1 */
>> +                val = OLDI1_PWRDN_TX;
>> +                break;
>> +
>> +            case OLDI_SINGLE_LINK_CLONE_MODE:
>> +            case OLDI_DUAL_LINK_MODE:
>> +                /* No Power down */
>> +                val = 0;
>> +                break;
>> +
>> +            default:
>> +                /* Power down both the OLDI TXes */
>> +                val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
>> +                break;
>> +            }
>> +        } else {
>> +            /* Power down both the OLDI TXes */
>> +            val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
>> +        }
> 
> Ugh, I hate power-down bits. So you "enable" it to disable it =). What's 
> the default value or the register here? Or will this always be called? 
> I.e. if we only use DPI, do we power down the OLDIs somewhere (or does 
> it matter)?
> 

The power bits are defaulted to keep the OLDI TXes powered off, and they
have to be turned ON.

This function is also called to power off the OLDI TXes, from
dispc_vp_unprepare. And that happens with "power" variable as false. So
the else condition above is indeed required.

You are right about the other scenario though. If DPI is only used, the
mode will be set to OLDI_MODE_OFF and in that case, the dispc_vp_prepare
function will NOT be called for the OLDI VP thereby rendering the
"default" clause of the switch statement, for powering down the OLDIs,
essentially useless. I just put it there because of convention.

>> +
>> +        regmap_update_bits(dispc->oldi_io_ctrl, OLDI_PD_CTRL,
>> +                   OLDI0_PWRDN_TX | OLDI1_PWRDN_TX, val);
>> +    }
>>   }
>>   static void dispc_set_num_datalines(struct dispc_device *dispc,
>> @@ -2831,7 +2862,7 @@ int dispc_init(struct tidss_device *tidss)
>>           dispc->vp_data[i].gamma_table = gamma_table;
>>       }
>> -    if (feat->subrev == DISPC_AM65X) {
>> +    if (feat->subrev == DISPC_AM65X || feat->subrev == DISPC_AM625) {
>>           r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
>>           if (r)
>>               return r;
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h 
>> b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
>> index 13feedfe5d6d..510bee70b3b8 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
>> @@ -238,6 +238,12 @@ enum dispc_common_regs {
>>   #define OLDI_DAT3_IO_CTRL            0x0C
>>   #define OLDI_CLK_IO_CTRL            0x10
>> +/* Only for AM625 OLDI TX */
>> +#define OLDI_PD_CTRL                0x100
>> +#define OLDI_LB_CTRL                0x104
>> +
>>   #define OLDI_PWRDN_TX                BIT(8)
>> +#define OLDI0_PWRDN_TX                BIT(0)
>> +#define OLDI1_PWRDN_TX                BIT(1)
> 
> Maybe these (the new and old ones) should be platform-prefixed. And 
> organized so that the register and its bits are together.
Okay, will do.


Regards
Aradhya
