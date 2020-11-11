Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA402AF0B5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 13:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6885C89DA4;
	Wed, 11 Nov 2020 12:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09A589DA4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 12:36:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABCa5hW058613;
 Wed, 11 Nov 2020 06:36:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605098165;
 bh=jZlmvwEMi8kn6+Z5HsjZATByRRO93RiscNhbEWmYCIY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cSVbO9Eg4y3Kw+kit/T26PbpZ23oddpLU113/5NYJItE7ntU/R0gwAbW9aWfpfIQw
 hKvorulAGr7nwZ/PygWGVlH+fYSpjR69G0S69S7MQc0SMhRBS1lDP54AJ0koDRv5zc
 UVxwsBODGY2Jmr6G28jl4KUCMPKXtJtPijGr9gvo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABCa5I0127832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 06:36:05 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 06:36:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 06:36:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABCa3Rk112340;
 Wed, 11 Nov 2020 06:36:03 -0600
Subject: Re: [PATCH v3 35/56] drm/omap: dsi: implement check timings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-36-tomi.valkeinen@ti.com>
 <20201109104756.GF6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4432ea22-cf95-d207-2f87-0e105429cba1@ti.com>
Date: Wed, 11 Nov 2020 14:36:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109104756.GF6029@pendragon.ideasonboard.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 12:47, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:12PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> Implement check timings, which will check if its possible to
> 
> s/its/it's/
> 
>> configure the clocks for the provided mode using the same code
>> as the set_config() hook.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c | 70 +++++++++++++++++++------------
>>  1 file changed, 44 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index a1a867a7d91d..f643321434e9 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -280,6 +280,11 @@ struct dsi_isr_tables {
>>  	struct dsi_isr_data isr_table_cio[DSI_MAX_NR_ISRS];
>>  };
>>  
>> +struct dsi_lp_clock_info {
>> +	unsigned long lp_clk;
>> +	u16 lp_clk_div;
>> +};
>> +
>>  struct dsi_clk_calc_ctx {
>>  	struct dsi_data *dsi;
>>  	struct dss_pll *pll;
>> @@ -294,16 +299,12 @@ struct dsi_clk_calc_ctx {
>>  
>>  	struct dss_pll_clock_info dsi_cinfo;
>>  	struct dispc_clock_info dispc_cinfo;
>> +	struct dsi_lp_clock_info user_lp_cinfo;
> 
> Any reason for the user_ prefix here ?

No, I'll drop it.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
