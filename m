Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FFD3020B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68F10E86C;
	Fri, 16 Jan 2026 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="c4Of1yM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazhn15010018.outbound.protection.outlook.com [52.102.128.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848F10E86D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgyOPTtQEWXMZwIXdg+9YsHQ57/UBopGw75ToTo4xBNRz2KY/8X23Xypd6oSO7JtZ0DhFtMoJNtM4Hd5Q+VzERCFYC6mLqlr4albC1Hl1EMK02pc08CJ+X252nh3XYWcgdW48R9LGxLL7GL6lZfo1UCuHndR0I164hfwKtuXEYcaXAZrMY+r44raYcc3mMuuOe1knjLDAbl/kN2Q3cfeMkVdkGtA2IBTuPONbOA9tK4EWDb/LHhEnFgL5dH1KsZbVlzFuUKzooufqn9t2VVKS7od+0WYJfDVpboDNmb9JtxmZuh1wJjKSsYWLiX7gtA+rzzB/niLPriD/6Y6oCPrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aK5TgZ5WSjyOxblFFPSix1E2znRUMaWhmDhiMm8f+o=;
 b=n4Vq1mLHMSvKB46nGfnB6Cr7rm3+SqMQoRn6VMpT2LoE6YQv1Gs4nxlsq79tSYc+5EnIEGKzBT39kiMsfAOMTpaRji2xe5EyzlPRVfJqNX80eqJrZZMjiwYw6V6T+o2nxMc1Vk3ZupBPSSmRalbKcF6fTnVGNEWlSJ3yJwYfXqESqqQOJyVsYwes808oOYkTUwzBbUOeKO/7DtookgS2g5s4vOIfFi61z5F/e1+p860zg69BuYPG9ZOvenJBdfTG7nKGacCWKbBm2vxwISimB7qfzL3JbSyoxr9hFGfma3zjVBk9nwdT1Ykzi2jqF7e9U5jfQ5MlUqb2CISyYd7KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aK5TgZ5WSjyOxblFFPSix1E2znRUMaWhmDhiMm8f+o=;
 b=c4Of1yM/oRPM6F3BqkpOEiZoOuWhuCfjFxRpVasM7e5vgehVHgUp60KvJ1bxDIad3S9iPupI9yzXCHkw1OuSycRSZPCg/O7vtaBx+oAh89lf0xf7TddnFcEWId8kZJvwf7SetMDdLZizCSQ2VqkQHvwEXlro/XXWVPDrilX3RYc=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:10:00 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::8) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 11:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Fri, 16 Jan 2026 11:09:59 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:09:59 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:09:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 05:09:59 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GB9pWB3048911;
 Fri, 16 Jan 2026 05:09:52 -0600
Message-ID: <1cc5e036-12b6-4b0d-9393-21bbb0dd3f48@ti.com>
Date: Fri, 16 Jan 2026 16:39:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>, <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
 <34759368-6b0f-421f-81dd-20006ee19a1b@kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <34759368-6b0f-421f-81dd-20006ee19a1b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2c2eea-1b20-47ef-cc7d-08de54efca42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|34020700016|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytUWjVneHppRjFJMjNIMmdNTXBCWnh5RGUzRm4xMVVrWGdjTnVTM043VG1H?=
 =?utf-8?B?TlhkSFZxUDE1VWdKaHhGY1VucWZnWk8rYVVkRGhabS83QWRSdit2eS9xZU8w?=
 =?utf-8?B?WTJCcVJoUUM5Mm4yTlBJcFhPcVRuaklDZGpQQkg5RWJKd1ZucU1CZ3hXMUdk?=
 =?utf-8?B?MmFueDVWSkdxVFc4VExEc0Ira1JFUjdZeTZPM3lKRnI3cEZNcys5OEpBelZ2?=
 =?utf-8?B?bEw5amtOZXkyTlRIdzNKblp6YjdJNzgzRUI5T2tFanQvTG1YTmFPN3V3cmVB?=
 =?utf-8?B?WnI1ZHJhTldXUTRGS2I2MVNYQ2hqUGZtNVZYOUsyclNDMGNFcjM4bExnQVJp?=
 =?utf-8?B?Ny8zWmJHeU9uUy9FNks5bUpSRWlrdEhldlhVMU00WFRlVloxU1pYRFJocjBi?=
 =?utf-8?B?eWExMHFSemk4QXNpRTlCYWgzTDFMR2NGNktaY2R4K3h1TFhGQXdzMDhSYnA3?=
 =?utf-8?B?Sm1wZXp6U1VTdXg1NDJPUG92OWN2Z3ErQStXOEVkZWxUdHdNdGdNa0dJdnpp?=
 =?utf-8?B?dHNoN2lsa1BpTE1qSDAzSHFkTnBXczltTXBuNHdnOUk4enBTcVo0TG45YWhy?=
 =?utf-8?B?K0hGS0o2MC9ZM2lUc2o4UmR3Z0xNeVVIVCtIWEs0OS9nZ1ZaRjVpOFdRRGlT?=
 =?utf-8?B?Y1NRZ0x5QjNPSGd0L2ZkWkdDeTFKNTc1N3FwMGNHZ3d1ekxrWEptRjVkZGVl?=
 =?utf-8?B?aUpoZWYyNEVHN2t0cFpxcHcwcE1IK0dHakhKWFhNNXNjRXVDZDA3NlBUdURO?=
 =?utf-8?B?YUhnalJkWkcrSURjZUYzb1hab3Y0NGVSV0N3dGRvUmd4QjhEeUM5UTNmTy9k?=
 =?utf-8?B?dkdOUG4wTmJmVTYvVkxVUkZQRDA5MXBtUmdXdUhZM2R3VmUrZ3phbktBZjJG?=
 =?utf-8?B?bDgwc0g2RFMwUGNsVy9zTnpuS1hMaTMrd3JYYTM0QjZvNjN1UDlRYk9IejZC?=
 =?utf-8?B?US9xUFV5eFB3S3NiV1g0YlVWZG5ZeW42ckpPcXFoN09jbWdnOHlYbXg0cmNH?=
 =?utf-8?B?aGJkejZiQ3c2WmFsRmpvTlBpSU04KzhjSkk4YWxYZ3dJWTdDOU9vanFYM2gx?=
 =?utf-8?B?dmtyYjdOS1RBNEp0MVNIaGltMlUyTWk3SDNSZkxJMzErcWE5Q0RzSlZWaC84?=
 =?utf-8?B?TjhSRmVwWDdTcXR3eS8xTUF5enIrVm0rQi9tS2owSE4wa3JJZWh1VWNpREhD?=
 =?utf-8?B?akErUzJXenExdlJTY3JWcExCVC8rR05ZWEFpWFZqbno3Y2JUZTRUOG8xeFJR?=
 =?utf-8?B?dlhIQkdrVFlaRTB1RjBRSjhpQ21lUHcxblBYK21FR08xekFDSHJ5aUhWa0w5?=
 =?utf-8?B?MVNJZmVPcWZCZ0pmWEhZNkJBaUJKV3FrTWlvZWRnTHhrZjlicjQ1eTNKSzZH?=
 =?utf-8?B?WThXd2JpbFlDSG5ZVUsrcVJYRWhLZEpQSVNXQkx4T2duamRWWjNsNXZEdDR4?=
 =?utf-8?B?dXRwNTFaNlhUcmNHbzI3OG1BWmZUQWh4TCszRFZrdzJhcE9uZURSUlpnOXFI?=
 =?utf-8?B?UXVheWRVblhRZjREb3V1NWMyWTdXbjB2TGhwRTUweVZPWXcyNEttenNVQzM4?=
 =?utf-8?B?azNCQjg1Q2FnK0lBakhsQXNxTmc3RXVOVGZ2UkxySXRvYmM2U2NNaFVtWkxJ?=
 =?utf-8?B?bFJ5bG04VXZxWnNlZGJ5TFJiYU94VGdvajJ3TCs3ZzlDbVVvVjh3Vm5kYTFi?=
 =?utf-8?B?bk5OUnlWUkJ1SlpGK2NhS2kzZmtpZTBQb28yeFNqTVNPZzUxclJEc1B3akVa?=
 =?utf-8?B?TnJaUFNuWFF4NGZnYUhPYW5UazF3TXdKYkRaOVJMWEZhcWkrRXFvZU5tWktZ?=
 =?utf-8?B?UU9DTU9xeHQ4MGNQNHo3OVBpSlR3L0MydE9oOFQwTUFFUmQxY2ZzZlRHRklj?=
 =?utf-8?B?VE4zYlppalpTOTlZdDdKYlNJRHNOQlU5bVhzUmV6b3Q3QVJ4TVMwTXNZSDls?=
 =?utf-8?B?ekJTNGxaK3o4SjMweExkU3lGaDR3TEZZVjRIeGZYbVF4ZFhpR2RVMWY4blNq?=
 =?utf-8?B?ZzQwUXRJcmovYVRvN2NEMWFJN2hQRTcxS0RDOHlBbDNWYnh4M293K3ZJYml6?=
 =?utf-8?B?RVMvcEJLbUZra3hKUmdPb05ZbmpmOXhBU0phMFNVVC8xeTJ3T21sRkdNZnB6?=
 =?utf-8?B?ZjZ2clgzVEJvQVlscHM5aGJ3NDFnYkVBOHE3UVVHYUxQNFZjWGRPbWt5aXZK?=
 =?utf-8?B?Ni9yUGJWUEpVWG1TRkRwSWpLczVkYllTVVViclZMZDZMV201V3ZPa2FrTjBm?=
 =?utf-8?B?YmFDbDBMZFM0TDhWNDBxRzJ6dGFBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(34020700016)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:09:59.9232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2c2eea-1b20-47ef-cc7d-08de54efca42
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
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

Hi Krzysztof,

On 1/16/26 15:57, Krzysztof Kozlowski wrote:
> On 16/01/2026 10:54, Swamil Jain wrote:
>> TI's AM62P SoC contains two instances of the TI Keystone Display
>> SubSystem (DSS), each with two video ports and two video planes. These
>> instances support up to three independent video streams through OLDI,
>> DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
>> transmitters OLDI0 and OLDI1.
>>
>> DSS0 (first instance) supports:
>>   - With respect to OLDI Tx interfaces, DSS0 instance can either drive
>>     both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
>>     mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
>>     utilized by DSS1 or left unused.
>>   - DPI output from video port 2.
>>
>> DSS1 (second instance) supports:
>>   - With respect to OLDI Tx interfaces, DSS1 instance can only drive
>>     OLDI1 Tx given DSS0 is not utilizing that as described above.
>>   - DSI controller output from video port 2.
>>
>> The two OLDI transmitters can be configured in clone mode to drive a
>> pair of identical OLDI single-link displays. DPI outputs from
>> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
>> DPI output at a time.
>>
>> Add the compatible string "ti,am62p-dss" and update related
>> description accordingly.
>>
>> AM62P has different power domains for DSS and OLDI compared to other
>> Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
>> OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 38fcee91211e..b1cec5383160 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -24,6 +24,19 @@ description: |
>>     DPI signals are also routed internally to DSI Tx controller present within the
>>     SoC. Due to clocking limitations only one of the interface i.e. either DSI or
>>     DPI can be used at once.
>> +  The AM62P has two instances of TI Keystone Display SubSystem, each with two
>> +  video ports and two video planes. These instances can support up to 3
>> +  independent video streams through OLDI, DPI, and DSI interfaces.
>> +  DSS0 (first instance) supports:
>> +    - Two OLDI TXes on video port 1, configurable in dual-link or
>> +      single link clone mode
>> +    - DPI output on video port 2
>> +  DSS1 (second instance) supports:
>> +    - One OLDI TX on video port 1 (single-link mode only)
>> +    - DSI controller output on video port 2
>> +  The two OLDI TXes can be configured in clone mode to drive a pair of
>> +  identical OLDI single-link displays. DPI outputs from DSS0 VP2, DSS1 VP1,
>> +  and DSS1 VP2 are muxed, allowing only one DPI output at a time.
>>   
>>   properties:
>>     compatible:
>> @@ -31,6 +44,7 @@ properties:
>>         - ti,am625-dss
>>         - ti,am62a7-dss
>>         - ti,am62l-dss
>> +      - ti,am62p-dss
>>         - ti,am65x-dss
>>   
>>     reg:
>> @@ -81,8 +95,13 @@ properties:
>>       maxItems: 1
>>   
>>     power-domains:
>> -    maxItems: 1
>> -    description: phandle to the associated power domain
>> +    minItems: 1
>> +    description:
>> +      phandle to the associated power domain(s).
>> +    items:
>> +      - description: DSS controller power domain
>> +      - description: OLDI0 power domain
>> +      - description: OLDI1 power domain
> 
> No, I already rejected this.

Isn't it better to add items to the top level and have a min/max
constraint for different compatibles? For newer compatibles we will
have to again add items description if we go with your approach?

> 
> 
> This is not how review works. Look:
> 
> 1. You wrote patch on 7th Jan.
> 2. I replied ONE DAY LATER.
> 3. You waited one week to give reply.
> 4. Then two days later you send new version not waiting for my reply.
> 
> If you have one week to reply, then so do I.
> 
> NAK, go to v3 and implement comments.

Sorry, we weren't aligned then.

Regards,
Swamil.

> 
>>   
>>     dma-coherent: true
>>   
>> @@ -196,6 +215,20 @@ allOf:
>>                 properties:
>>                   endpoint@1: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am62p-dss
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 3
> 
> That's pointless. It's already 3.
> 
> Best regards,
> Krzysztof

