Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03947C625D9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 06:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9110E183;
	Mon, 17 Nov 2025 05:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YOw3LApJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97B10E181
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGqQBBVn4QHSze01VvxGwkIgpebfNe0ngyPQIb/nEDbANTXEkHxXsTURiH1ZkyC3iS1XGDFAzRRTkXHSAEdHu5hOUJBtsoVD2optdlLiAmuS508SzOc1bqbpAeDaJyP+spZo+I8aG1OmfGnA+mc75uH9onL2tRzuN7jNDLHEaaL+ZdYcusDjaYlkxq6s+gFUJfn3SVrzCrKKUoqW/dBc9xyd0OoYSPjA4k6vHY5bzgIjCI0qZ979gG5PoWksm3tej6V/KS8FK8RJMV7NuhFcq1vyDGgJ/DaB6kSb21RYatxvgASRsgcA7xD4gNdxFxLGRCaMVGoENR2w81hIJr8joQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SZKH1pZQjkLTQoWEUrS5IF1k14V7HriKXA3JHUcKm4=;
 b=yhqlqqYXy6ze+RndedytIYfIDRAMYPlA5vpoT3l8os7CmErJxJjRivkPXdPyFeiN0mcWE9XWoa0SHTuHSPbK7I2k5Msny+yqN8SCYK4kyi7YrfspJdoqJ2kE0Fxv7wCSpslWt3FP+bVZuAXPjBI+g9k+6pcvHHvmWt1NB5ZeCK0rPgngR//2+0V5+0wtrPo4q6sn503oNuI54+O8LMT15/2kd6pRMUUtNCIeJ+GGVZzIEoPGjGwAiQZYs7pn9zjUfhnCgA1w1+uoQaHP1maxK/QVDjRntjG/Hx4My0TCCWRPAfqy3iOts4lvI0d8ncTGpU95bFaVPXGnm4laPH2aMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SZKH1pZQjkLTQoWEUrS5IF1k14V7HriKXA3JHUcKm4=;
 b=YOw3LApJzv3Xf3Fz3+7uUIUsZd/g174DU+OneU0D5Na4kmfxyTCF23HHdB1EPOjHJiqHf84dqMsf8JGJhhRbUm5xKKNIxQWgKvQRTI8oT5C80zVWSiCWCkw8Fkr2FKrrO0yBrebeuxonv+GsM2dRqNcSFPRlZRedgEtKL8Rdedo=
Received: from BYAPR07CA0067.namprd07.prod.outlook.com (2603:10b6:a03:60::44)
 by BN0PR10MB5063.namprd10.prod.outlook.com (2603:10b6:408:126::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 05:10:45 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::b3) by BYAPR07CA0067.outlook.office365.com
 (2603:10b6:a03:60::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 05:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:10:43 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:10:41 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:10:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 16 Nov 2025 23:10:40 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH5AZq11909410;
 Sun, 16 Nov 2025 23:10:36 -0600
Message-ID: <97ed4be2-c9ab-4829-9886-683a183337cd@ti.com>
Date: Mon, 17 Nov 2025 10:40:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,am65x-dss: Add am62p dss
 compatible
To: Conor Dooley <conor@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>
References: <20251114064336.3683731-1-s-jain1@ti.com>
 <20251114064336.3683731-2-s-jain1@ti.com>
 <20251114-vanilla-pork-f3854bd230f2@spud>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251114-vanilla-pork-f3854bd230f2@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|BN0PR10MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: b51d22e1-4c2c-4b06-0b54-08de2597a8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2tjc3N0b2RWRGdHbkVqZ2w4K0pwL3lZWndQeWlpNnNiM2FvY09GSWh4RE54?=
 =?utf-8?B?a3YzQTRqMXhtaXBIM3dGUW5CbVg4ZGV0OVRNZUV1YVJpZWFQaHljczVLcTU0?=
 =?utf-8?B?ZGxhVVpocWpnb1I2eDJEMng3RzQvTFJYSndLOXhETE1oVHB1WmVKaFZDSTVP?=
 =?utf-8?B?WUc2TldJYWUwS3BMVDFiRkFCeWhhQ3BHTC9yVGZTV1UrbkpJeTZkZmVPMzQ4?=
 =?utf-8?B?NmM1NVJGYmQ3VWxkMWxpdllmaU1vZVI4c1VUa2RpQjdiQTkrMHY2THk4UWg4?=
 =?utf-8?B?WFZjMXZRVmtBREpNdlAwbENVL1lSY2xnK1MxYSsyQ1QwRDhEYUJhU2ZTYndk?=
 =?utf-8?B?aHBueEJVQXpmTVlHNmNlajhkakFFZC91bXVZWndjUXRIN2o1eEVBbjdBMkhR?=
 =?utf-8?B?dGtYSjVrWUdlUHEydEZXUEtseWFhRWx6VHV4akRvclFwSVBUeXNlWmpXVC9j?=
 =?utf-8?B?ZVo0V25pbFYwK1dHbTZJNjNZSFdBc1F2NlNjQ2RxT2xFOXg5RXRyUEJ5QUFJ?=
 =?utf-8?B?NkZsZ052eERRT1F2bTN2WURib0FrdzZSRWNSenJiUXllUFFLRXQ3MGY3eUky?=
 =?utf-8?B?R1Jmb01rZ0V5eWZBL0R6UzZ1TmlZd203aWFOZlV0dWR3dUtJRld5TitBaVdn?=
 =?utf-8?B?K1QrdVJNeEtaNG9oNytJNExWRGk5SHN5UlhnTDE1Sm9RR0dkMnQ4Ry96VUo5?=
 =?utf-8?B?YjBlM1lIakNoNU5yTkhoRWlvY1dBVWtmYzBKNnR4WFBCNjRmY3ljOUFVZ2N2?=
 =?utf-8?B?aVNIbjVSYlZxRjJlTEd3bFJRNE84UjZoY0FPMWFvU1BHSEpSMS9VWCt4OTY0?=
 =?utf-8?B?RmJyT2ducnExR2RPT1ovRTRxRlRHb1FOYXNsYzNmdkVLajFyWmo4L3lISVFQ?=
 =?utf-8?B?SExzYUtQK3EwWTd6RVN6bG56UUgvKzZtU1BzOXFxMGFjcmNkWHRDWmNWRm1j?=
 =?utf-8?B?eEczYU42ZVowcWlpeEsyaEhpTHhYRWdidFVJN1VKb0Fpd2k2V25yNlNmeGlI?=
 =?utf-8?B?akNvVEl4dTVkOFpCTzJZWFdZUHNxOGduT3UxZmpzSzh1NWZtTGtEUFFaZWNt?=
 =?utf-8?B?WXJucHBtL3JOYlJPcVMzK3hNL1hQcWpPZmpTSVFtcllOZzVSZTQyQ1FnTjJ1?=
 =?utf-8?B?TXhVTm9UY2lWK1I2bk1BSVFCd3Z0OVpMYm5YZGVxTkVwNWxRYmtBSFYway80?=
 =?utf-8?B?SFkzM29qNTV1aHc1UmREeTNMWHVqTGdrQmxNa1JhNE45ZlBRUktTNmo0cko3?=
 =?utf-8?B?RGgrS2cyS2pPRU0rK2EwUlFCdG9lMXFWcVNxbEIxYmRiczN5eFQ2YnBacWhR?=
 =?utf-8?B?NFVmTDByMmUvMjJSL0pUYWpDRW0yeDdZVEY2RElBMlB3OUNVZmRzQWxsQlhZ?=
 =?utf-8?B?eWFLVDc0QkpYa2IyVFlCa21hbWR2VVdFS3phelNFRE1zK1oyMmJ5VnJpOGZR?=
 =?utf-8?B?QkZ3Tmc4WlIvVmtOcVRZM01kVjQ1OHBCWklQeFQ0L1Q1NHUrYlhoZitINzFL?=
 =?utf-8?B?ZkRLcUpYcjRsTTBhYWhwT1pCWm5jSVRqZnN6YndEMFJ6K0cxZkpEMy9xNVp0?=
 =?utf-8?B?QUZmN0VBV3RSRnJ1TkdDK21OUFd2MWZ3ZnB6eS9nZXljUFdlbHJ5dXRGbHpp?=
 =?utf-8?B?Ym4yMU90d1A1S0Z5VG83Y0ZMRGJ3TDZoWHhCcXl1NnRUYkEzYW52M0M2VGk4?=
 =?utf-8?B?U085bDg5NlpYS0ZoQkNlOWU3dEloYmxTZmtONTk2Q2xVcmFZZFRhUUxmSTkz?=
 =?utf-8?B?RURTaWJxYzdiSzhhbjR1TmhNZmg3TXlVajJBNmkwc3JwZi9SQktaYWtTemRC?=
 =?utf-8?B?dXd1ODZYYktVYkhEellFTUpuZUFSSkMvSnhDUDY1enhmSXY3UWVFSlRhczRy?=
 =?utf-8?B?UkJEY1prOWF5REFKd09xRFFHUWtmQS9TUG9Oa2k4bSs3ZTYxTURydHYrMzM5?=
 =?utf-8?B?ZWFxT0REM3JYd291VVNVOUczZDVIWm1zYS9CWDRzRW9JWWUrUU5yWkQreVJG?=
 =?utf-8?B?YnJxakJRcE5sTXRrY1Z6R0FwWWd6YzBoWndqakYxVU56aXgzdWxjT0dUMmwz?=
 =?utf-8?B?YkwyWC9BdWV1OUVRNGs2WkJ1WVd1clJnTXpwUVZmeVFpdklDYThnVGV1SjRB?=
 =?utf-8?Q?KZ1g=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:10:43.1397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51d22e1-4c2c-4b06-0b54-08de2597a8a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5063
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

Hi Conor,

On 11/14/25 23:28, Conor Dooley wrote:
> On Fri, Nov 14, 2025 at 12:13:34PM +0530, Swamil Jain wrote:
>> TI's AM62P SoC contains two instances of the TI Keystone Display
>> SubSystem (DSS), each with two video ports and two video planes. These
>> instances support up to three independent video streams through OLDI,
>> DPI, and DSI interfaces.
>>
>> DSS0 (first instance) supports:
>>   - Two OLDI transmitters on video port 1, configurable in dual-link or
>>     single-link mode.
>>   - DPI output on video port 2.
>>
>> DSS1 (second instance) supports:
>>   - One OLDI transmitter on video port 1 (single-link mode only).
>>   - DSI controller output on video port 2.
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
>> Keystone SoCs. Therefore, add 'minItems' and set to 1 and update the
>> 'maxItems' field in the power-domains property to 3 for the
>> "ti,am62p-dss" compatible entry to reflect this hardware difference.
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 127 +++++++++++++++++-
>>   1 file changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 361e9cae6896..8bd188e7f09b 100644
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
>> @@ -81,7 +95,8 @@ properties:
>>       maxItems: 1
>>   
>>     power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 3
>>       description: phandle to the associated power domain
>>   
>>     dma-coherent:
>> @@ -347,3 +362,113 @@ examples:
> 
> I don't think you need a new 15 line example to add 2 power domains when
> everything else remains the same.

Sure, added it for reference, yeah, I also think it is not required. Ok, 
will drop this example.

> 
> Please also restrict the power domains by compatible. I'm not sure
> reading this binding if the new device can function with 1 power domain,
> but your binding permits that as well as not being clear that other
> devices only need one.

Ack, will restrict the power domains by compatible.

Regards,
Swamil.

> 
> pw-bot: changes-requested
> 
> Cheers,
> Conor.
> 
>>               };
>>           };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>> +
>> +    dss0: dss@30200000 {
>> +        compatible = "ti,am62p-dss";
>> +        reg = <0x30200000 0x1000>, /* common */
>> +              <0x30202000 0x1000>, /* vidl1 */
>> +              <0x30206000 0x1000>, /* vid */
>> +              <0x30207000 0x1000>, /* ovr1 */
>> +              <0x30208000 0x1000>, /* ovr2 */
>> +              <0x3020a000 0x1000>, /* vp1: Used for OLDI */
>> +              <0x3020b000 0x1000>, /* vp2: Used as DPI Out */
>> +              <0x30201000 0x1000>; /* common1 */
>> +        reg-names = "common", "vidl1", "vid",
>> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
>> +        power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>,
>> +                        <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>,
>> +                        <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>;
>> +        clocks = <&k3_clks 186 6>,
>> +                 <&dss0_vp1_clk>,
>> +                 <&k3_clks 186 2>;
>> +        clock-names = "fck", "vp1", "vp2";
>> +        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        oldi-transmitters {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            oldi0_am62p: oldi@0 {
>> +                reg = <0>;
>> +                clocks = <&k3_clks 186 0>;
>> +                clock-names = "serial";
>> +                ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        oldi0_am62p_in: endpoint {
>> +                            remote-endpoint = <&dpi0_am62p_out0>;
>> +                        };
>> +                    };
>> +
>> +                    port@1 {
>> +                        reg = <1>;
>> +                        oldi0_am62p_out: endpoint {
>> +                            remote-endpoint = <&panel0_in>;
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +
>> +            oldi1_am62p: oldi@1 {
>> +                reg = <1>;
>> +                clocks = <&k3_clks 186 0>;
>> +                clock-names = "serial";
>> +                ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        oldi1_am62p_in: endpoint {
>> +                            remote-endpoint = <&dpi0_am62p_out1>;
>> +                        };
>> +                    };
>> +
>> +                    port@1 {
>> +                        reg = <1>;
>> +                        oldi1_am62p_out: endpoint {
>> +                            remote-endpoint = <&panel1_in>;
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                reg = <0>;
>> +                dpi0_am62p_out0: endpoint@0 {
>> +                    reg = <0>;
>> +                    remote-endpoint = <&oldi0_am62p_in>;
>> +                };
>> +                dpi0_am62p_out1: endpoint@1 {
>> +                    reg = <1>;
>> +                    remote-endpoint = <&oldi1_am62p_in>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dpi1_am62p_out: endpoint {
>> +                    remote-endpoint = <&dpi_bridge>;
>> +                };
>> +            };
>> +        };
>> +    };

