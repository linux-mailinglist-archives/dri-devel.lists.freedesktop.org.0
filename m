Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF69C8D801
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7B310E7E4;
	Thu, 27 Nov 2025 09:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="bWM5mDy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB61D10E7E4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPQvPpvuag+5RWdjKgQe7LBKkhXbeFJa+UCH5IlyQv6HhVoKU4QRXq9MfPViH7N7E3zw3iY4bjgGcZl9T7gE2Ici8o7gCfMMpiQ3SO7MggiBl+b8I+YzDpcZe8CHDB2FIsjQVUJHSfaQKfsOp9djgssjfFZ1FT2XdPPj3VIZXMIPVzuqPjMnsD/ghmg7TejJTHS8A/Dmj+YhaauafeOWduM8V/NCxc44/LbwGqVx4NOq8C8PGL478EZHH/VYviKOueNYULiiSNo/7Q8uA3TaGSQsumdmhgJC//k4311xIHBFqUN775T1y6oLa5g/aWMGJbuM9PmQq/p+l0WPvhdAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzWrbS8HCFBNzdrH7XJav6UPfQOirz6N2HIxjH8/bsw=;
 b=IxadbkrQFXiALImSRNBJcEdGBKeKUkOve8pnYvu5fcVO28k4caBjh/r2SRmZLXLSm0fuFUy5fM0kKuUd0v1Fa35sfEZ0nYS3nwFLdaJCjg0UpQ8RjMIXXKHcq5z7YADWK6CHNSUzGnDNR883e1Ei1njCDnQJnRuuS/CpMtpc/nHyHnsPg+7GjqOBG1WBNyIXadVncMxsUQoMheYxekRNlAAB9U8a/FutOUupvOWZVL0Y7+UFCU/x9eK/w5+TihyCjFaCZjupkD/C/1nFjHyZ2ugjGc2BN9QreZyq+M3RL9Nwe5i6qgsJ51x7ciKTzMATNK0Cv5p0O39o16xskIyoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWrbS8HCFBNzdrH7XJav6UPfQOirz6N2HIxjH8/bsw=;
 b=bWM5mDy+6jueA476CIOZVkttTMZEYSLF26NKma5QEoR/5FmTtxVM5Drz53Zerh70xdprTWz0vEGlJUuppN9dzHqp/ztU4zkFSQ+YX94iHMOOM6ASsRoNNl8vY0Yfdx3SE0FxWX9oIf8cXjjBD05lRcwYmTEYpNSvA5GnWczY8/s=
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by PH7PR10MB6201.namprd10.prod.outlook.com (2603:10b6:510:1f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 09:21:48 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::88) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Thu,
 27 Nov 2025 09:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:21:48 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 27 Nov
 2025 03:21:43 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 27 Nov
 2025 03:21:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 27 Nov 2025 03:21:43 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AR9LbBL2697719;
 Thu, 27 Nov 2025 03:21:38 -0600
Message-ID: <dd6820fc-0537-4daa-8dba-4589c80d5f67@ti.com>
Date: Thu, 27 Nov 2025 14:51:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>
References: <20251125165942.2586341-1-s-jain1@ti.com>
 <20251125165942.2586341-2-s-jain1@ti.com>
 <20251127-quizzical-mussel-of-discourse-bfeaab@kuoka>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251127-quizzical-mussel-of-discourse-bfeaab@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|PH7PR10MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f373723-3126-4a1c-f7c4-08de2d966459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVlLWms5V0dzTjMrS2pXU2hPVDhjYVBsaEFOMzN6dDdqbWE0YmJRRVJrMDN3?=
 =?utf-8?B?K0FQY05EeVJ6eDIrcDE5SG45bVVkTG9xOXViMStXYzl0aU5HVkpFalpVUXBr?=
 =?utf-8?B?cWloeEtoMWo1bGpidHllbE5kdzFaeVAwSm80MDVKRjYrcXdjZVA3bk8wR3dl?=
 =?utf-8?B?WDlXODkzZTJIS3NjNWtpYStaTi9HQ05ScFVQRzR6ZUgzS3Z5ZTVJeE96Yis0?=
 =?utf-8?B?U21KQ0NwRDRwdDMrMmRUWkl5a1VuVnBnVnR6NTdZQkRxUkdHOWpSZVMxb05C?=
 =?utf-8?B?UDd6OUVXOTY2dUxVQjJneVFXdEpqLzJBVW93bnFpV1I3QmVOV0V0ZkxJZVMz?=
 =?utf-8?B?YWI4RmtiUE51MlJEU2lLdFdOWTRMNWpER0RHTE1mRk9mVWxOY0VBakZxL2w3?=
 =?utf-8?B?bGh6VkRQSW8ydDhUT3l5aUF5QXlscnpZaXRNL0hhbWlQTTB6VS85b0p6UVoz?=
 =?utf-8?B?NTV3SGtlRlRVNjk5L0tUUHZUdmM4Q25EREZmSkI4MW96cUF3dVBBQzhxcVh3?=
 =?utf-8?B?N2NUNmRzUHVod0xsalliRS9UT2lzSEJYYUdDR29xOTVPWjNsRGo1VEJpb3Bx?=
 =?utf-8?B?Z0RPL09ick5OMmttNThlZHdFYktReWh1WEZDUmpMR3gzR0w0SUVranlvWTR6?=
 =?utf-8?B?cEVPeUJlaE1MdnhmYUhBVHQvem55U1c4RE1CdWkwUFlKTkVhNkgyUDNjQWpa?=
 =?utf-8?B?eGxjNHJDOGZRVDZrMldkTE9kUGY3RlBoand5TnQydlIvbVlrVGlGSmFtNHpF?=
 =?utf-8?B?a0FjOWczNlpmV2tCNFJoaW4ycjdibGRoRXc5c0JGc3dlbmRIVjJDcnVBSENH?=
 =?utf-8?B?bm5aZCtpTEdRZFdpa0ZJTFdMM1FuUUZpTTBxVFQ3THpOMXQ5NTVwRnM2Nmlz?=
 =?utf-8?B?MURlVkwxd3RnNzBuYmxCMVlLdzBUc05hOGZMN001WGo2QUhiNTZyMnVlWlM4?=
 =?utf-8?B?Nm9adEZHOTlGN0llRm1kZ1pXdnlMakttOXh1ajk3K0F6Mm5HOG11MjdjWHR5?=
 =?utf-8?B?MXYrSTVqTnNETjhCUWdUNFFqT2tOY0V5ZEV6S2RNOWVtY0p5WW8vdEdUMVFQ?=
 =?utf-8?B?aDNSd2Z2ak00RHVWQzA0d1JuWFFiaUU4STNva250STF2TlFndFRDdjRCWE41?=
 =?utf-8?B?aERFeDdaa21sc2xFM3dDZDc3Y2JIcVo5dzdxckN4TU5CRWdiWE1WNkJuTkcv?=
 =?utf-8?B?QUM0M2dJQ0hBOVV3UHptS09NRXNJRndWOVNES2MvNVl4cnpMYW5WNjVrZUR4?=
 =?utf-8?B?aGF0aGNuUU5UZ0phTGZuN1JENHM0ZnRTY3lZeWRzRzR0SHMxRjlBdFM3R0Er?=
 =?utf-8?B?YVFuaTByU0lyUDlPMHZwTVg2NHo4WGVaV0dmN0FycnFqQ1oyVTRBb0RtOWly?=
 =?utf-8?B?S1NiRThTSHhJRDI4V2RrNGFNakh5VmdRYnIrWk9NQTd3NWtpbGdQU3VDcXl3?=
 =?utf-8?B?WEROZGZ0bisrQit3V1lGK21ia1lRTnpvZXJUUlFHbWZBazFYdDdEd0JFUndC?=
 =?utf-8?B?T1F5bG1Eb3E0RGp1MGE1MTFnQjJLMTcyTDltYmd5enFJVmJpbGlMVk1qREpt?=
 =?utf-8?B?S0ZNWWl5WjRuajlybDc4M3kxYlBZdVFrOFVTNFRHQ3Zra01QbGZuU1RENVpw?=
 =?utf-8?B?eE0rN0VpUnBhRkZTVjNEM1ZubFRrbzd0OEdNVmtKc0l6enhBZnNnU3o0TkxE?=
 =?utf-8?B?dlh0Nk1zaTg0amg1VzhmaEg5SnVkQ01GNGw3dzVNQnpzbHRlMGlaQ3hkdGxj?=
 =?utf-8?B?ZHdweDVFN0IvMWd1MGVrTTNLT0V2VVM5aE5pUFdockRneWF5RjIrV3B2RWxS?=
 =?utf-8?B?a0oySVZBMDNzSFdRNGFMNjZ3R25idlUzZExQZStPWXZkK2lPcldZbDIxeEhV?=
 =?utf-8?B?WjBGMzFUN3hzQ0p3UGRHNXJRNGIvbTArYXhsUm1KM1Z3KzFSOUYrNXRnZE1E?=
 =?utf-8?B?QkpnZVAzWmwyNmVYSExSRUtUS3gvY2NTcjdHcEZWQnhNT05QUzhoSzlCZ1lT?=
 =?utf-8?B?ZTJNQnhDY3pRT1VJUE1BQ3p1ck5tVGxwOGh2ZXdXbUdjQlowYTk0MWkyWVVI?=
 =?utf-8?B?Tm8yeTViYk9oYVQyZ1NyWHB3cElaaW00K0hONkVxOEpFaEd0MmFiTlhGUExX?=
 =?utf-8?Q?Okhs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:21:48.4140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f373723-3126-4a1c-f7c4-08de2d966459
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6201
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



On 11/27/25 13:15, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 10:29:40PM +0530, Swamil Jain wrote:
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
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 361e9cae6896..3945ae048b8f 100644
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
>> @@ -197,6 +211,17 @@ allOf:
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
> This is conflicting with top-level constraints. You need to update these
> and then narrow each variants. See also writing schema (Property Schema
> chapter).

Thanks Krzysztof, will update it in the next revision.

Regards,
Swamil

> 
> Best regards,
> Krzysztof
> 

