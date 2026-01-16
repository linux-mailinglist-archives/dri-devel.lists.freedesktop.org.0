Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB654D2F45B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE3610E851;
	Fri, 16 Jan 2026 10:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Wq/G00Xw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazhn15012041.outbound.protection.outlook.com [52.102.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEB910E851
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8NScFay8JbYT6vFkJWtuoywiNA3D+z96OAyWtKq6MtpbXsf/3bmHIlZ0mfoCw/Oc4biwsvPpfYXL6XuoI4pGe0Zsr3lb5dmFUUmxWq0q9xXfJYcG7NGwUbebs4xgjn0hwCnrq9giITwFQ6lpEI4w7zHsTekuxIdfhtvTy19wfNVq9zLuEsxoI5V7tq8WTHdq6ydwhvja7b9+TQMoo49geJCvn9xly+UOR4sxGVJMMP6MvtQNxiaUwU+BZHFPgDBT9dMSUPAtgZkuyNf0AuiRa1Ici0jSdqZKnJlf7Cn3/ajXnvj2H3xw4tJyP8ZHRz0sOmi8kDDIryJDXh0N3l9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgm7qoW++vIl0+blIUEQEsBMkwBLveJwArPFcW5Bntw=;
 b=ZgXCY9jQvOVA4L+dTGy1a0jSUA/KcZzP2df7YgFNpH7Ltm4EG1F2SdEPUVgm6yNOZGKAL1CftgIsbusqcKC8ms2cVo24AAUEIi4K9xygUeQ86MyRXFBhTnSfQtIvXNm3Ero4EUDjispmTTcHJHKdcHg4ubaApkS3zx/Bn6s0sUDc0SaoNu1BEtrTSX+JLvbqcqTOfiFtu2JuzMeCZIeBAcJl20H8Rx5mDTjOPg4H5UFa11GKPuf1bymF7JQ1iQ23q+8MEuPZc/guPLPkVl20UCcpVRCc2emXz7eoTZFNmT8APF8H6cBpmn6g201Jx9qP1vFd2+a2GCr6YLD+bjBWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgm7qoW++vIl0+blIUEQEsBMkwBLveJwArPFcW5Bntw=;
 b=Wq/G00XwRey78IxLHeHMWVcHRI20jLLRrVspTG5PGdhOY8sU20fce++Cxv8NJMBO/8IITcMeqHSGWjEw8IG6vyqMhgx/TwkuFeMzQlV949n1HgZalpQq3neCi4dydFjBwLcpvGWaBS8YajrHdhQF16cVpo7Db1cPbNRk2fHUSJU=
Received: from SA0PR11CA0027.namprd11.prod.outlook.com (2603:10b6:806:d3::32)
 by SJ2PR10MB7857.namprd10.prod.outlook.com (2603:10b6:a03:56f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 10:08:32 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::f6) by SA0PR11CA0027.outlook.office365.com
 (2603:10b6:806:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 10:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:08:30 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:08:27 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:08:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:08:27 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GA8J243112234;
 Fri, 16 Jan 2026 04:08:20 -0600
Message-ID: <e0bbd4ab-86ec-42e6-829a-21229ed1292f@ti.com>
Date: Fri, 16 Jan 2026 15:38:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Michael Walle <mwalle@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
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
 <DFO8ZDZM41FK.28NIFO8J4E74C@kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <DFO8ZDZM41FK.28NIFO8J4E74C@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ2PR10MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: b8be3e39-342e-4ac1-b2b6-08de54e73333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|7416014|1800799024|376014|36860700013|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bytCWElLaERDUHVYQStFNVNHZkFRUHFRUXdyWGc5aFVUTklMallsZkU0Tmxx?=
 =?utf-8?B?TVdNUzFBSEpaQzc4Rzh6L3UzT2g2aE5CaHE1cWRPbTcrcWVaTGJhZlVqcTRU?=
 =?utf-8?B?eXZmaVVFN3NKc0lFejVOKytsSmxKTUE2NTVwMkt3Rnlob1M0Q0FjZnQzQ3lv?=
 =?utf-8?B?ZVBJZVpYSGJiQjFmZHFxMjdRUDk2ajZQUmFmNkJVWWtqTmE2K0x1K2RtcnNt?=
 =?utf-8?B?djZlQnRjTWlyMEtqb29CUEFzM0RqN2xHVFdFVm1JNFVFOUg5aE90NEVTSEt5?=
 =?utf-8?B?ZXR6WHNxL1E1UFRzSGkrcSttZWV6cnFHWC9SblkvSSsyenFKWHJZaG1VeWND?=
 =?utf-8?B?REVXeGJwK2JBWWNpTHY5bElFZjVqT3pRZ2ZQaHhBdC83aVVtZGd6WUtXYXdp?=
 =?utf-8?B?emV6RnhIaHlUcGU2RzlYOVYwVmc3bTlMaWZudW9aU0h1VHVNTXIyQXRheDNR?=
 =?utf-8?B?eWpJSks3a203NE9UM0lBNXM1L0ZFYUQzQ3pYQlNuL1lyZ2U2bFZLcWVhWHZO?=
 =?utf-8?B?cU9kdE5GQ1dIV0VwWlpYdWhBSjVNRFF2cGlHWDJrVzJGTmRRNGw0bmp5Zmt6?=
 =?utf-8?B?K0MrUjBROTU3SjFZUHpZMHIrbVBFdVpFWmlSeHRlVThsRWI1M2JJV3B0a1Ja?=
 =?utf-8?B?Z25OMkVpVXV3QkhTUjVuNEo2cVZZazdYbmMwWXJvR1QvdEVNYkxyRzNoOTVT?=
 =?utf-8?B?SW5QKzlNNUhSTTIyTkcyc285Uk10TXVVeG0yOXRweW1jTjhBajAxMWV6RGJ1?=
 =?utf-8?B?bHM4T2IvMDhIU1hUc1VLRlRQZHFkVnhCQm1JRDB1OUxKZnVJaWllK1g2WnpD?=
 =?utf-8?B?eWw0OC9IL2lYWHNkejRYQnV0Qy9Wd1ZRNHhXUXU1ZlJjcERoN2dRVFNyK0dR?=
 =?utf-8?B?ank1TExUdk9FUWlSTGc5MGFKU1NPMHlLZlZrUU0zSzVYdDU0L2pSWWNDVk8r?=
 =?utf-8?B?cjhTcnpoZ01MSnd5LzNBY1pXWEh6VUtLcmtWN1BGRjBIQVQ1UkRveDVSWXhT?=
 =?utf-8?B?MEIyTzdMTmZrSS9aaTllZ0pNZHBRakF3ekU0Q0d4SE9WVzBoSUFFSGZERktD?=
 =?utf-8?B?NTRxYzJ0QWpZVG5NeFJrY054cW1NWTd4ZEY4VlA2WnVVS1k0VUV1OGpob2FJ?=
 =?utf-8?B?VkhNTk56YVZtZ2dodnVyQk5sSm9aTWlYYnNRTVJ2bWF2MXdzNzhsV1BoQ2w2?=
 =?utf-8?B?TGdXUVhsUktERktTbXVHeXR3NkpJc2FvYVJzSDFzVFFUTWw4UmFNUTZIby9k?=
 =?utf-8?B?NmZtb1F4bHRwTnRmYktBQjRxSTBVY2VoSmxhZEZOcS9mbTVnZVUwV2xnSlla?=
 =?utf-8?B?bVVGYjAveGFVMVUxcDVUUmhoVEJDSDZRdDd0dVZCbEFKV3ErNWEvaFI4L0tX?=
 =?utf-8?B?L0ZMUUpYVVZrVU1rZDVjejYyQnlrb044TDZaWGduMVM5TjQ1dWtzTi9XWGc0?=
 =?utf-8?B?cjc0bHlLU1I0T1I0Y2I0Uk9acys3LytJbFlqUzNCeHR3TjFFbDNQSGdWT3Uw?=
 =?utf-8?B?TlBVdWl2YmNybFRiRmFCQU10U0lZYnZOZ0ppaEVlQlc2VUpoc3VWR0J6N0ZR?=
 =?utf-8?B?eFh1alhzbVVjUkUxL2hOSVJPeXJKaGRMaElhc3V1UTg2bFN3emhjMUdSZWtP?=
 =?utf-8?B?dDdnMFNlT2F2alhvWVZWMmsrSkNLbkpnbHZPSERaM1N2UmJJbkFQbUVJS1FP?=
 =?utf-8?B?TVhDY0NMemwyMHo0SEowTWJQWm5IdjVXbXE1aE8yT0s0R1F2anh2cjIyMEN3?=
 =?utf-8?B?OVhta1pUdDJmbnRVZkNERjlFU2Q2dERqRlVuNlI4VDVzaDFaYjErME9NMC8z?=
 =?utf-8?B?OUN6ZlBubzF5d1FMYitvUTM2L2dueThhSUZhVk5mMDdjYVMxTDJzQk1JYVo0?=
 =?utf-8?B?eGlVRnZMd21OUlJaWXQ0cTc1WENxcnV1dFRPYlhnNnVmT3dob1NnK2pFYlpY?=
 =?utf-8?B?UDE1dXJrdzlnd1h5eVRvM0lDWUZZQkxLaURDWHNZU04vSHhNenhMbmREc2xR?=
 =?utf-8?B?bVFheGxLTHB2dTc4dGFvK2l3TlNraVZYLzBtenNKeHU4eWVEcFVxVkFGWHB4?=
 =?utf-8?B?YlUvdHNRbkM3ekg4RFhwcW11NVd1Zk9GYm9YRFFOZEQrZjlGUFVkSm5BV21H?=
 =?utf-8?B?OEtsTm1odElQZVdCOWt2VlVnMXRMeThQL0tuYnZWVko0SC9DUzkzZVNpYSsx?=
 =?utf-8?B?cEFsd1J5UmRaeE12ZTVMdW11YU9KVHJxNm5KZkRuWlVCaXFQQ1lNM1F5bVlF?=
 =?utf-8?B?VkMyNlFaaE1mbTVlcWg0UzZ0Uk1RPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(34020700016)(7416014)(1800799024)(376014)(36860700013)(82310400026)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:08:30.5727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8be3e39-342e-4ac1-b2b6-08de54e73333
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7857
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

Hi Michael,

On 1/14/26 16:11, Michael Walle wrote:
> Hi,
> 
> On Thu Jan 8, 2026 at 9:51 AM CET, Krzysztof Kozlowski wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: ti,am62p-dss
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          minItems: 1
>>> +          maxItems: 3
>>
>> This is still not constrained enough. You need to define the items
>> instead. I still do not understand why number of power domains is
>> flexible.
> 
> So looking at the downstream devicetree, there is one power domain
> for each OLDI and for the DSS itself. Thus, in the am62p case, there
> are two DSS as described above, so DSS0 has a power domain for dss0
> and two power domains for the OLDI transmitters. The same for dss1
> but with just one OLDI transmitter.
> 
> So I don't know why there is minItems: 1 because it's either 2 or 3.

One can use DSS power-domain only, if they don't want to use OLDI0 or OLDI1.

> 
> What about the following:
> 
> ..
>    - if:
>        properties:
>          compatible:
>            contains:
>              const: ti,am62p-dss
>      then:
>        properties:
>          power-domains:
>            minItems: 2
>            items:
>              - description: DSS controller
>              - description: OLDI0 transmitter
>              - description: OLDI1 transmitter
>      else:
>        properties:
>          power-domains:
>            maxItems: 1
> 
> -michael

Using the following:
..
   power-domains:
     minItems: 1
     description:
       phandle to the associated power domain(s).
     items:
       - description: DSS controller power domain
       - description: OLDI0 power domain
       - description: OLDI1 power domain

And using constraints for "ti,am62p-dss" and other compatibles 
separately. Please check v4[1].

[1]: https://lore.kernel.org/all/20260116095406.2544565-2-s-jain1@ti.com/

Regards,
Swamil.
