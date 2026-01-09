Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D80D0769A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 07:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1D10E7EC;
	Fri,  9 Jan 2026 06:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="hZRr3tfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazhn15011023.outbound.protection.outlook.com [52.102.137.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8F10E7EC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 06:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1HKg5lxFkTk1wuEmVIUCW31hSCofJgIoMsMMy1QIWaO7mkbXOnXxXjKdYN/x5uksSSUwlWZw3ez4AJw+EseZRtmUwo1ZfKY1Z/EVmWtqUMXHSev7dnecICNK/WvrWzm58ThaPY3sh6yErcPgjtrPH+nheusUZ6YQ6QzFQ9ozPBo1TT1ksmqon3H0qjtpDIUeWu9uhyINKkLQJjA8BHEqCPpM2M6Rp0zwkEqmo25sS8WDyDrtB7EfxfajFxBf22uKm05GQ0XrgcLgDKs2UiXfpls0UVVWY0rA3icaHqtQ2t/azy3CEvYz5CltaEp55li1ZFH8uhBaeGMEvJY8HBuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mK5DFiGq0DlkN/yhYev6sSPqqfuDUBU1DdB+RcIJZg=;
 b=rjo9cpf1vBBDMugRMV61SlkBp1ftGBrOe/pJ7kIiow+G6PMmUXcluXnFayEIwqtpArZsiwglDNBvWoOOh+nRvxhNunLIy552jHYDXGwZJDHsfbDpruvVtO/RzXuBEyksaT+AuuQ/Otno/DBPVih59n3r+dtnniDyl+8j1PijvY5XCy7hBTHfSJCZ79V0C/Q0CAT+zYmS7WgI73S3motigVK8V974oBxS/iYjlFDZdn3HKY5C3vcV3QGJMDTqrCqEm+DehTMI2BRoodpLitINReoBBTs+j0HvnKq0HMIrXqSDZaDGsswWFrcbHs73qUhxSDwiLrTKKCdk3MrfFIUozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mK5DFiGq0DlkN/yhYev6sSPqqfuDUBU1DdB+RcIJZg=;
 b=hZRr3tfuGsiaZ4mljIvGXdSIf1epaZ0j03juaCl0U4nOpXy+Q+GRidtclA+zXM00w5qEC84xGyzr4yZe+l2A5M6A5j+B5DZPYFLqkUXnAxAyM+gFFrgsBg0x9YZadGp/kbjQO59YMr1L5YGJltBQaCPyfg0qsBJ5/gfio5hJuq4=
Received: from BN1PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:e0::15)
 by DS4PPF67D158296.namprd10.prod.outlook.com (2603:10b6:f:fc00::d23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:42:08 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::a6) by BN1PR10CA0010.outlook.office365.com
 (2603:10b6:408:e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 06:42:07 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 00:42:06 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 00:42:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 00:42:06 -0600
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6096fwS63691113;
 Fri, 9 Jan 2026 00:41:59 -0600
Message-ID: <1bde67c9-8265-48f3-8da2-a736e09e69e4@ti.com>
Date: Fri, 9 Jan 2026 12:11:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Harikrishna Shenoy
 <a0512644@ti.com>
CC: "Raghavendra, Vignesh" <vigneshr@ti.com>, Harikrishna Shenoy
 <h-shenoy@ti.com>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nm@ti.com>, <kristo@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <s-jain1@ti.com>, <u-kumar1@ti.com>,
 Andrew Davis <afd@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
 <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
 <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
 <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
 <k5llnrrvc72stluvlbvzireqn6jq3h6dan7valuim4rty77mfg@gfv7drdyms2q>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <k5llnrrvc72stluvlbvzireqn6jq3h6dan7valuim4rty77mfg@gfv7drdyms2q>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DS4PPF67D158296:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e38ab7-2f0a-4c4c-c245-08de4f4a35b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|34020700016|376014|7416014|82310400026|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVhPcDA4cXdsN3pydUptSVhCUjFnN1lJcVRKa3FqQUZxRHVuZHJiYnFuZlA4?=
 =?utf-8?B?Slo5TTQzdlJSMTU3enMrc1AzanRIVzVIWHlMbWMzUVNwV3U4c3RHVHNLMWlP?=
 =?utf-8?B?WmZsRU1lRVdSc1VvZzBuWmRaRHVMK1ZKSFIzSnpMa2hMeWVhMlpPOENKM1Jv?=
 =?utf-8?B?U0NNNmd4d2E0RmowU3h1SDg1cjJBMFJUcVBENjRnYnMySUprVzQ2dDNMWWgr?=
 =?utf-8?B?RVZpai9WRDF5ZnRtMTFWZ0JnNnpxUnBnVVR1aGs3bkYzeWlPeEhjamQ0SHB1?=
 =?utf-8?B?TFFtZFRFVjFsMjJmREdWRVVZMm4xZnJOK05UbFpYZlp2V1ZibGlUTW5qZ0hq?=
 =?utf-8?B?bGpNYVFZUDNBTHR0Uk1JTCtlK29XSEVXbi9oVGtONjlCSzQ3a0hjamJsVFBk?=
 =?utf-8?B?VUtwQytXQ1lPODVZanA4OVhtQmtvRTkrWDAzSlczVjFkRHdGYk5lRHZ2WVNQ?=
 =?utf-8?B?bU15L3Vub3NNeGdDazFTM2tKbGxNS1JNUW5LeDM1Zml1bVRiVXpCcXBvS0FB?=
 =?utf-8?B?Q25yUk1IUHRsUGdLYm5hODFWOUoxUHVCTDRkNENLdDg2ZmRxZTFHVmxTcEtx?=
 =?utf-8?B?NHc0bEp0M1BaTjN1RnliTkZ5YlZzUmQ0TzJFK3o5MVNPNmpHbUpEZTBpNmhC?=
 =?utf-8?B?Z2NNQzlMMGFzSDY4QWp5ME9OTjVid2tyRkVHcEVrcmw4YkliaFFNYUV5YVVl?=
 =?utf-8?B?dGNWaVdEcUp4Nmtvb1lTYm42Smg0M0g4N1RFQ3pBdTJ0SFFxcTQxVTFUVGhn?=
 =?utf-8?B?TU1scUlETmt0UmdmSHNJZEJ0NzRLdGxkRUhZQW9KeGcrR2RpcVFGOXRTT0F3?=
 =?utf-8?B?MTEyaHFWajhxNDhnMzJGZkZZaGxjM0JGYkYyLzRMZTlKL1BDZ2lXYzJScEpm?=
 =?utf-8?B?dzVmNFU3NjFDZnZCcmhKUEJDNHo1Mk9ueFBhWDB6TkhieTBpVGlUU1NMajRn?=
 =?utf-8?B?NUFZVWZVUytiK1ZPQmIrQVYxelVHelg3ZmZwVjM5aHhLcC9KaVJXN2E4QzEw?=
 =?utf-8?B?TTJhcmtiaVF3dS9JRlNlL2RwZ1N4QlVwb1F6Z3BZTjZSSWx1MHZ2NForYU1u?=
 =?utf-8?B?cFFKRVdGZDBZczA4MGtudXRveHpZMFVUMzBiRUZ1Mk80Nk1Ub2x0NXVZazdw?=
 =?utf-8?B?R1hoY2RZRVpEWEdYcmJJNHhVZHN1WTcyc2dVU3RuUU0wOWxZVmNmM0pIelNI?=
 =?utf-8?B?UGZhK0x3WHBtemE4NUdQbnA3a2dLcDdQMU1jVGp1N1VZLzNZYmp4WTNNcHd5?=
 =?utf-8?B?aXdFamhlVFdXb0s1azVyaXNRckJPQ0RORmdyMW56Ukc0VDl1aTZmVlFuK1pZ?=
 =?utf-8?B?Sk9kSGRhOFM2clJRcDQyYytpU3R4M1Z6OUxRby8rODRQRFRkMGpGWm9pY1dH?=
 =?utf-8?B?LzRYcXFLdXdzejc5aU9DNW8yS3NraS8rd29JWmpHN1M3V3QxNVVXQnZ2VlpU?=
 =?utf-8?B?MjJJcFE4YVBwbldNMmczd2h0cjBjU3A1UWJyc2t4Z1ZwNGMvcDlLd0JuZmkr?=
 =?utf-8?B?WXIyakUySUM2ZmM5bXVReElYeUxDVFQ0NCtROGVGcFdBZC9mZVQ5QVlNb0pq?=
 =?utf-8?B?WWU4SzZzOHppVG5OWVJKN3VHeXlNQ25rWTFWTFFMK2xCMi9hRDc1TFlBSE9S?=
 =?utf-8?B?T2VydHI2NWJlKy9XdWtFR3hsOUszS25MY0I2RDhEOGZLOXpZTHM2cndrR0lY?=
 =?utf-8?B?cGsvdGZ0NWE0Qm02ckVsU0VUNjV0V2R1aGhCSlI4UFpta1RnUk1rN1VETTdt?=
 =?utf-8?B?b3ZqckQwMFIyenN0STZSYldLS281bWdtM042a2dMdU80TkZMeXZjUTBRRWtm?=
 =?utf-8?B?RlNGRm80eVJBYXpDNkJXL2cyc2JSUWl1dkdsYW0zVlZxSlYvQmt3Qm1DemUy?=
 =?utf-8?B?aHNSWFpXVUlPNFV6OUljcDUyM0Q3dFF0RStnbzZzd3JpT2ZiZU5rY29OcElp?=
 =?utf-8?B?a2dzRzdrUzFZMFZzSUFlVzBkd0I2YW56VUZQN09WZUNkdUY1MnJXUkthV1dM?=
 =?utf-8?Q?scxkEV4Txx53/2LkH8X2a11g0/Sio8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(34020700016)(376014)(7416014)(82310400026)(13003099007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:42:07.9126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e38ab7-2f0a-4c4c-c245-08de4f4a35b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF67D158296
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

Hi Dmitry,

On 21/08/25 16:16, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 10:33:43AM +0530, Harikrishna Shenoy wrote:
>>
>> On 8/20/25 15:34, Raghavendra, Vignesh wrote:
>>>
>>> On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
>>>> On 8/19/25 06:54, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
>>>>>> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>>>>>>
>>>>>> [0]:https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>>>>>>
>>>>>> Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>>>>>> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>>>>>> simple.yaml
>>>>>> index 1ac1f0219079..65f486f2bc9d 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>>>>> @@ -268,6 +268,8 @@ properties:
>>>>>>           - rocktech,rk070er9427
>>>>>>             # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>>>>>>           - rocktech,rk043fn48h
>>>>>> +        # Raspberry, 7" dsi panel
>>>>>> +      - rpi,7inch-dsi
>>>>> It's powertip,ph800480t013-idf02

I think there is waveshare based 7inch version too [6].

>>>> Could you please point to any documentation for this?
>>> Git log would point you to it:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc
>>
>> Timing patterns we use differ from powertip,ph800480t013-idf02.
>>
>> Link:
>>
>> https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2
>>
>> https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9
>>
>> So I think, separate compatible needs to be added.
> 
> Then please identify the panel that is actually being used. RaspberryPi
> isn't a panel vendor.
> 

These are the version 1 raspberry pi display panels [0], to what I 
understand there are multiple vendors e.g waveshare [1], df-robot [2] 
producing these panels with same branding name as "Raspberry PI display" 
and as tested at my end both work fine with exact same timings too as 
referenced from RPi kernel fork tree [7]. I am more in favor of having a 
common binding here similar to what was done for version 2 ilitek 
controller based raspberry pi display panels [3] which use below 
compatibles:

raspberrypi,dsi-5inch
raspberrypi,dsi-7inch

Similar to this, version 1 displays too have 5 inch [4] and 7 inch [5] 
versions, so isn't it fair to have similar compatibles for version 1 
raspberry panels as well ?

Also to what I understand neither version 1 nor version 2 panels have 
full datasheet available, so timings are coming mainly from the 
raspberry pi's linux kernel fork.

[0] :
https://www.raspberrypi.com/documentation/accessories/display.html

[1] :
https://www.crazypi.com/5INCH-DSI-RASPBERRY-PI-TOUCH-DISPLAY-INDIA?srsltid=AfmBOorV_Ehvx-SV5REvbga9loUfCEAktXPWLg6ZghHdW2Qf7ClMGQWF

https://www.waveshare.com/wiki/5inch_HDMI_LCD?srsltid=AfmBOor8kd-K1b5cxTP9ojDOO42obVJyab6SJzc-55uqnrFGv2zUmowe

[2]:
https://robu.in/product/dfrobot-5-800x480-ips-touchscreen-with-optical-bonding-compatible-with-raspberry-pi-4b-3b-3b/?gad_source=1&gad_campaignid=17416544847&gbraid=0AAAAADvLFWdKkaTxqsUSVBiF_p2H_zMRM&gclid=Cj0KCQiAyP3KBhD9ARIsAAJLnnZJfXfpZEI6GBQIQUYIj14jPElQqhexEyRni4n9VvRcpzYQ3AUTXxUaAqyTEALw_wcB

[3]
https://lore.kernel.org/all/20250904205743.186177-1-marek.vasut+renesas@mailbox.org/
https://www.raspberrypi.com/products/touch-display-2/?resellerType=industry

[4]
https://robu.in/product/waveshare-5inch-capacitive-touch-display-for-raspberry-pi-dsi-interface-800x480/?gad_source=1&gad_campaignid=17416544847&gbraid=0AAAAADvLFWdKkaTxqsUSVBiF_p2H_zMRM&gclid=Cj0KCQiAyP3KBhD9ARIsAAJLnnbDCNmutkZo93f6dTfo5aAwqCWQpYPhaE1MkUekYdmNNih6BW1411EaAlXuEALw_wcB

[5]
https://robocraze.com/products/waveshare-7inch-capacitive-touch-display-for-raspberry-pi-dsi-interface-800x-480?variant=47338361979104&country=IN&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&campaignid=22271813913&adgroupid=&keyword=&device=c&gad_source=1&gad_campaignid=22271815110&gbraid=0AAAAADgHQvY8QWzvch_lWTffUWAcAu8eG&gclid=Cj0KCQiAyP3KBhD9ARIsAAJLnnYq9neCRwbd7XwAvfE9fbN_EZV-IlKWiSaWyZ3_lAKM0w6_3N8m5yYaAo2wEALw_wcB

[6] 
https://robocraze.com/products/waveshare-7inch-capacitive-touch-display-for-raspberry-pi-dsi-interface-800x-480?variant=47338361979104&country=IN&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&campaignid=22271813913&adgroupid=&keyword=&device=c&gad_source=1&gad_campaignid=22271815110&gbraid=0AAAAADgHQvY8QWzvch_lWTffUWAcAu8eG&gclid=Cj0KCQiAyP3KBhD9ARIsAAJLnnYq9neCRwbd7XwAvfE9fbN_EZV-IlKWiSaWyZ3_lAKM0w6_3N8m5yYaAo2wEALw_wcB

[7] https://github.com/raspberrypi/linux/


Regards
Devarsh

>>
>>>>>>             # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>>>>>>           - samsung,ltl101al01
>>>>>>             # Samsung Electronics 10.1" WSVGA TFT LCD panel
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
> 

