Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CDD25E64
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4811F10E1B2;
	Thu, 15 Jan 2026 16:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="lrFq4Nmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazhn15012042.outbound.protection.outlook.com [52.102.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3953710E1B2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4mCwyD3Kd85XWv774qS5CmBx2s49+OO21kKbGoJNqtThw0azyg/L6y1EP+mtdHSOm4gLlqAO2NSPMnjhvGk5aF/KYhPD7+4JLv9p31py9MbDYOG7ZVZ402SSAnGUI9B0yjXSHB6ARRiP2iawRSTNbiHwXAzkFLM2yaKcKJvSyliiNnEFua4n3sRoA3wBnYMVOVPBtU8CoJ0JKrkOaKNQ9Ky/Q3KJoaNOkumRyx6f7YLqfnmb03P3FYLQsriFB1cVLnMvv109xgzRBssLBGE4AawvCkbaRhwU0HfiNTjn3ddzPmAq9EKoemFgb8cxgWn4SdyVFoMEhg7zw6YKJpDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqSL8NGmkm32UPlvQz81t6nBAWrZ1dvDKUMTDJXonw4=;
 b=tJYMsXO1tf1W6SE/5FS9YB2f1hvTmI8UYCWL7z2eDWkE9RSPHyAYWCSzHGnFrzIWghMn1dIYGrOdnuLAVKRJo8HJ2V6j9gAD9oW9BrdYZo1cMT1U2ODZU4Qwju/j+yKOYGc2/tcmcX1rGaWW1sG0cAOV5A5iHGyNPRW53m1Fvou1M5sKmYJIUrbk1bDkBnRu5fZQ6nq8qfUUK9ILlx+FeSasxhd3a6ldlUIWs97kIDH2LGZW7W9vUvY4XWgxoqxV2j+59Y8d7GBCjQ2Hw2HSjhz2p7F5Fs09qDvJyuL5mJ0txqoF0vlSvysvUwCASdHMYwFeAHBS3HT/lt3gp+/Y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqSL8NGmkm32UPlvQz81t6nBAWrZ1dvDKUMTDJXonw4=;
 b=lrFq4Nmh4SfNXuMRRZMJn/QMaLP2EPbn/VdU4p5MtH86hLrLXBxqymCKXZc/Sdw5nxJC6LFXNrQYTymAKnWBLfP0u6vIIp3LUD/OoBcqIhaCiYGA/N9wW5iKadOz1bumv9hzqHk2V0U9vSMBuwf9HlOyC8klOcTe2hJQ+B6x4QI=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by SJ5PPF4B54CB2EB.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::79e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:54:51 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::c8) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 16:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:54:48 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:54:48 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:54:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:54:47 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FGsgOK1743798;
 Thu, 15 Jan 2026 10:54:42 -0600
Message-ID: <b8e3d087-271a-476d-986f-ad3f08231136@ti.com>
Date: Thu, 15 Jan 2026 22:24:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>
References: <20260107174525.1702585-1-s-jain1@ti.com>
 <20260107174525.1702585-2-s-jain1@ti.com>
 <20260108-expert-whippet-of-downpour-ba277f@quoll>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260108-expert-whippet-of-downpour-ba277f@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SJ5PPF4B54CB2EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eea95e8-c1cf-468c-7964-08de5456cb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|34020700016|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjBMM2ZrQTBvdngvcWZyZmViSVZyVkFCTlY1bnpabXVxWDBYQmxubmNKN3JT?=
 =?utf-8?B?bExrOWsrSVN5R1pPMzFTTkdEMGQ5ZnBmMWtuajBQd083Z2N2TE4yeDltV3RE?=
 =?utf-8?B?b0xUaXlENDNkWndCdm9oL05PVWJmVFpYM0RzOVM4QThsQjVub3dMUXlteUU3?=
 =?utf-8?B?cmJvdTZwYUZDM1hWcWt3ckN1VG9tOExDSElTRXYzbllvNnFaY0NFWFVvRm5j?=
 =?utf-8?B?d3lpWTRXSnRiQU84bVUwVDhxRGZ5S1ZwU2VOcmRQekNvS1dvdVNNc1NpNHh1?=
 =?utf-8?B?dVY2cTh6OEVZT0JnMlJpelBKbmZwWUFGSTcxcFlMMjhQbTEwQjVHdE0zUmMy?=
 =?utf-8?B?NkFPcENtZnFWVi9HSkdNS2ptOFhzVWUvcDBQS2dRUW16ays0T0VzZG1LVHFk?=
 =?utf-8?B?L3NQMTIyK0hwdDJETEdOTHNvczVFQzdaQTlHTU9aeWpMMEJ3MWtOT05jYmxR?=
 =?utf-8?B?aUM5Ym8rTDE0WjJtVFFmSzBVL0pydS9oTkdIU3NsNUhpMTVENGVKdjY5YnZj?=
 =?utf-8?B?bHJML2ROeHJCTWJBaXJ5OW1ObTF0ZVhzUHZqdXJoU2l4a1JaRFE5b3drVURy?=
 =?utf-8?B?b3ltV29YQjhIblRBVG1VTXBnVnFtWGk4amRISmJkY3Z2NDF5RHhBeHo5Umto?=
 =?utf-8?B?REp4d1VPNlNJcXdGSEYvc0NNek9DM3M5dzZRZURNMjBxQUM4bXRRMmxyRHJK?=
 =?utf-8?B?aEJReVl5cU56ZERINnpkSTJIRTFrR0FsNFdtOEEwV2FSMitaWVNtYysxNUlW?=
 =?utf-8?B?L1ZJU2dHY255cFFreDZpT1hyYUhrVXVaNGNUaW5xMDJKbXVsckNaQ3dGUGUy?=
 =?utf-8?B?VVBBb3p5aC9zaTlIc2lwSjh4bDlMOXNpVDFzblhiVW5ic0V0VVJ2VUlVNmN1?=
 =?utf-8?B?UkxRUUoyZnYrTnIwZjRuVzF1QjcvRUVPOGxnckhqbnJYZjZQaGptcmtManhM?=
 =?utf-8?B?MjJ4MFNaaTIwTHcybW5sSXRQbGpwaDRodXhFQnhDb3JsOVJoTFVOSTd2ajlY?=
 =?utf-8?B?ZkMvMWFKYnF2clI5aWFKUk1pckNyeG1Gb2ZiRjBGTGJadHUvS3RsNFA4UFZk?=
 =?utf-8?B?SW80eGo1MDVSbE5Iejhxb2tISUZvVTgxZkRqN082a1pSRnlaL3FOUGVVUEJu?=
 =?utf-8?B?MzYzcjN4VzBLQXVLc1QxY3NDaHBmM2FiUExES3lvdDMySFZBYzg3allFZUFs?=
 =?utf-8?B?aFFEZVhEcndMck5VYkVPTWdPalFUWnBvdUtmaHVoYmlESzFkZlJycmhTVUJ0?=
 =?utf-8?B?VjFCcWhUa3o1VFpMUVovZFMyL0FTWTFlL044RTNBT2RuVHoxYUVvMzJmQ0tZ?=
 =?utf-8?B?dFFQSEdtU0J6MmpOVjNWTTZXd0Vtb3F5d1Ntb1FqdVhzd2s1V3I1bytQMk42?=
 =?utf-8?B?RklLMHgxYjJKaU9tSVRyTVYwc29oSkR2UzhBbWs4VEpWQUNXNWcraWtBd2FX?=
 =?utf-8?B?MHVLR2FlcEQ1TnFCdE9pQkRQd1NUanN2cmg0Mm55YmphNkN1UlMvckFuUGVq?=
 =?utf-8?B?ZUpHZTRSaWEybmxONjZiMlJJanZKM3p6b1ZlR0k5R3dJeExxQk5LbUtWK2hL?=
 =?utf-8?B?amJ6eTVLZFpSbnRZU25SVllaM2J3UDBmalB5dkFnLzJCamRGRDBpcitJT0Zu?=
 =?utf-8?B?ZkVQNDNEaUlNQXFaOXdyTTkvL2tyWjQ1OU1OQ2hWelV5emxiTURDeEp5RmRQ?=
 =?utf-8?B?RXJqejQ2Y1RET1cvUHYxVjBtYnlKVkxIdEVlS3lBNFpGTVhCMUF5YVFneE9p?=
 =?utf-8?B?SmM5d2N4WVJXdEJ1d2RIaDhuSFUzTUp1VHZ0M003REFmUk1qQkpTZXBkTjdv?=
 =?utf-8?B?Z2ZvYXBQTnNLa3NDY2dLOWVhNjMvOVhDYzA4YUFXanE2ZWRqRk1NUVFBblNi?=
 =?utf-8?B?NkFublVDMzdXcCtpZUY3QkQzSTB1RmIvSDV4OVNXSmRFNGJHdUpWVzN2azhH?=
 =?utf-8?B?QkEvRG8xTGxPYWpMeWpaQVJQWmh3aHY1NnhyYUlmaHdQNDF4eFltMHliSUxs?=
 =?utf-8?B?cEU0WWlZb0luRUJjMnZXQVZtR2hyRGlpbGRBR05FeGgzWG9VWERjaXpoVlBT?=
 =?utf-8?B?Y3ViRjRpbFE3OFZRZkNsOFgraFNaaDNQQ2RRaW9OQVAzeDVid2JPWlNYVytk?=
 =?utf-8?B?OTE2ZDI2QUZqWGlkbm9iazE5dFZxY2w1azh4WUNTVlRRcW1rYm9jUjNVYSta?=
 =?utf-8?B?ejJpZm9mZmlZbzY1LzNWNXhtTElYRUFIQ2c3UkZKakJEUmd0ZVdMTkhSb1Zt?=
 =?utf-8?B?VDBUb0ZxS01FV3JVWVlDNm4vWGR3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(34020700016)(82310400026)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:54:48.9264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eea95e8-c1cf-468c-7964-08de5456cb75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4B54CB2EB
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

On 1/8/26 14:21, Krzysztof Kozlowski wrote:
> On Wed, Jan 07, 2026 at 11:15:23PM +0530, Swamil Jain wrote:
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
>> Keystone SoCs. Therefore, add 'minItems' and set to 1 and 'maxItems'
>> field in the power-domains property to 3 for the "ti,am62p-dss"
>> compatible entry to reflect this hardware difference.
> 
> Last sentence is redundant. You are again explain repeating the diff
> which is pointless, but did not explain WHY you think 2 power domains is
> correct.
> 

Will explain properly in the commit message why 2 power domains are 
correct in v4.

>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 33 ++++++++++++++++++-
>>   1 file changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 38fcee91211e..e74e710934fc 100644
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
>>     dma-coherent: true
>> @@ -196,6 +211,22 @@ allOf:
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
>> +          minItems: 1
>> +          maxItems: 3
> 
> This is still not constrained enough. You need to define the items
> instead. I still do not understand why number of power domains is
> flexible.

Planning to add:
```
power-domains:
   minItems: 1
   description:
     phandle to the associated power domain(s).
   items:
     - description: DSS controller power domain
     - description: OLDI0 power domain
     - description: OLDI1 power domain
```

There can be up to 3 power-domains in a DSS instance on AM62P SoC.
Please check the Technical Reference Manual for AM62P SoC[0].
On page 542 it is mentioned LPSC_main_dss0 has a partial dependence
on LPSC_main_oldi0 and LPSC_main_oldi1, and, similarly for
LPSC_main_dss1 there is a partial dependence on LPSC_main_oldi1.
This mean if you are only enabling DSS0 Video port 1 for HDMI output
only you need not mention other power-domains and similarly for DSS1
if you need OLDI1 output you need to use DSS1 and OLDI1 power-domains.
So, we can use up to 3 power-domains depending on the use-case.

[0]: https://www.ti.com/lit/ug/spruj83c/spruj83c.pdf
> 
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          minItems: 1
> 
> You can drop this one.
> 

Yeah, sure will drop this in v4.

>> +          maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg

Regards,
Swamil.
