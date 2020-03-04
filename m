Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED8178B0F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD36EAB0;
	Wed,  4 Mar 2020 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE36EAB0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 07:02:16 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024727Hk057260;
 Wed, 4 Mar 2020 01:02:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583305327;
 bh=/sdwpCqTUZFavpH1kRSnLCFnO4op/esuZHRYq+Iq+X8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fC0csCuu0zHZMFhFyq0jA0spS0AztZNRxQuON64RjMv6CuQZar1hytSGEJJBq2cv/
 /GYBRN7ndqo30X9Nxc5UCiVE1ISS6SgAukrgss6u4hIcgbt/1ZjYSDkbvuUqIp0z2K
 JxGflDHxMkRpF8g05fdPTaoXnnLSlGnZUpQ4mTvI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0247277f082080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Mar 2020 01:02:07 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 01:02:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 01:02:06 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0247238d003010;
 Wed, 4 Mar 2020 01:02:03 -0600
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
To: Tony Lindgren <tony@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
 <20200303151349.GQ37466@atomide.com> <20200303154953.GT37466@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <59df1bda-eee0-32f5-76c0-510a708fefd1@ti.com>
Date: Wed, 4 Mar 2020 09:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303154953.GT37466@atomide.com>
Content-Language: en-US
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2020 17:49, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200303 15:14]:
>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
>>> On 24/02/2020 21:12, Tony Lindgren wrote:
>>>> +	if (sysc_soc->soc == SOC_3430) {
>>>> +		/* Clear DSS_SDI_CONTROL */
>>>> +		sysc_write(ddata, dispc_offset + 0x44, 0);
>>>> +
>>>> +		/* Clear DSS_PLL_CONTROL */
>>>> +		sysc_write(ddata, dispc_offset + 0x48, 0);
>>>
>>> These are not dispc registers, but dss registers.
>>
>> Ouch. Thanks for catching this, will include in the fix.
>>
>>>> +	}
>>>> +
>>>> +	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
>>>> +	sysc_write(ddata, dispc_offset + 0x40, 0);
>>>
>>> Same here.
> 
> Below is a fix using dispc offset for dss registers.
> 
> Regards,
> 
> Tony
> 
> 8< ----------------------
>  From tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Tue, 3 Mar 2020 07:17:43 -0800
> Subject: [PATCH] bus: ti-sysc: Fix wrong offset for display subsystem
>   reset quirk
> 
> Commit 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset
> quirk") added support for DSS reset, but is using dispc offset also for
> DSS also registers as reported by Tomi Valkeinen <tomi.valkeinen@ti.com>.
> Also, we're not using dispc_offset for dispc IRQSTATUS register so let's
> fix that too.
> 
> Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1566,7 +1566,7 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
>   		return;
>   
>   	/* Clear IRQSTATUS */
> -	sysc_write(ddata, 0x1000 + 0x18, irq_mask);
> +	sysc_write(ddata, dispc_offset + 0x18, irq_mask);
>   
>   	/* Disable outputs */
>   	val = sysc_quirk_dispc(ddata, dispc_offset, true);
> @@ -1580,14 +1580,14 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
>   
>   	if (sysc_soc->soc == SOC_3430) {
>   		/* Clear DSS_SDI_CONTROL */
> -		sysc_write(ddata, dispc_offset + 0x44, 0);
> +		sysc_write(ddata, 0x44, 0);
>   
>   		/* Clear DSS_PLL_CONTROL */
> -		sysc_write(ddata, dispc_offset + 0x48, 0);
> +		sysc_write(ddata, 0x48, 0);
>   	}
>   
>   	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
> -	sysc_write(ddata, dispc_offset + 0x40, 0);
> +	sysc_write(ddata, 0x40, 0);
>   }
>   
>   /* 1-wire needs module's internal clocks enabled for reset */
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
