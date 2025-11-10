Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4184C45E6B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9584B10E173;
	Mon, 10 Nov 2025 10:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="PYqRD8XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011035.outbound.protection.outlook.com
 [40.93.194.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312A310E173
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo0qEqnUU84vnVukiVX9zhJ8EqanvxClrtOnIs9yi7iiUZd/zsc17LGTZ6hCrXAVwudGyQfcNmPL6HgdoWUnzPMTVEURK1kbAJELuSaO2X8EdKRrJwdKr7WtiGtIEP96JZ/GdEhXtfAMAnA/UQvQ4L4MzW7im5tdA0xrXJkn+QwhXWlj4EE8XOgxJCGsgsDAY5puB7x/+FQ0/UWqL8vAmn676QgEHpwPJfkxGWHMRc5EMEjOpgHHz2WThiYzYHchVV0foxpXWcg7KD2p/25Fq9P/pl7oqF4m6sNq0skmCMRzlrE6M8/EDsjADmkDJFPPJFzBOrcRJrGtY46qwXNm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4W15p7EqUW1KYLNj+2vDKch75XkoOa2lrxI3zR1eWb4=;
 b=lZ+jsoR58MIhC8W6TlPyojQepnMe4sJRDugDyaSoQE8jKz1yTkxpP4F8alLVD+nG11MykbCPHdlAIaSbkwNURbyXdRqABrJkybhocYa4blxRlAsGgVis5NZ7qsa8cmCwHQ2QvEWgoD4iZuuvXAmpkSRjnBltH15pzadHrlZNT5c/wTii5QmpEZj7I/Ltgg3qnsr7q3eLK3Pbeh+j3U+hmsVuc55nKkIfzcWahycTV8+sa8Err0Q9JfZceSUouVHWsq2jgrAup1f5wnX+s86e2/iNlKSKYDG8tjrkMYHVClOKbH3/NlwlU8FL01yxbvp2QtTTIi7yBJtw5oM4PpsRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4W15p7EqUW1KYLNj+2vDKch75XkoOa2lrxI3zR1eWb4=;
 b=PYqRD8XTPvVWIeHHx9LkkedhT/ndbZZQdI14Xj8c0aYQ9erHDWimbeH+zfPwP3it6Mz8CjqiPPnpbkLGzfp5VxMyNFfcWewfI/x6qsr044BKNxTxXM++hI7ykds+NsYLWsBseTXtG0Xoxe+Xg8jB04jDfE/E6lRmXjMdwKfy0k4=
Received: from BN1PR14CA0017.namprd14.prod.outlook.com (2603:10b6:408:e3::22)
 by IA1PR10MB7333.namprd10.prod.outlook.com (2603:10b6:208:3fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 10:23:42 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::b5) by BN1PR14CA0017.outlook.office365.com
 (2603:10b6:408:e3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 10:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 10:23:41 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 04:23:38 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 04:23:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 04:23:38 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AAANVjC3251357;
 Mon, 10 Nov 2025 04:23:32 -0600
Message-ID: <9599e17c-96d5-448f-96a2-bbcfcc3657a2@ti.com>
Date: Mon, 10 Nov 2025 15:53:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: drm/bridge: Update reg-name list for
 cdns,mhdp8546 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <conor+dt@kernel.org>, <devarsht@ti.com>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>, <krzk+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <sjakhade@cadence.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>, <yamonkar@cadence.com>,
 <pthombar@cadence.com>
References: <20251107131535.1841393-1-h-shenoy@ti.com>
 <eb86cb58-6520-4a24-9e04-f10e2466fac6@kernel.org>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <eb86cb58-6520-4a24-9e04-f10e2466fac6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA1PR10MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6c8a4e-1daa-4ca7-323a-08de204338b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0tjOEwySmFoWE5WMzN1NmZ5ZG9xR0xNTVBmU0w4YkJhazlhNWMxVW9XbjR3?=
 =?utf-8?B?V2ZRTjJncHFhMm5OT2lpQ00xaHhCcDQvVk9pMHhUektWZDNDTVdLOXNHeTJl?=
 =?utf-8?B?WGw0K0FHV2lmZjljMFVsUU1ibExBWGVVYjFoSUdRMW4zYVBIa2UwbkJINlRQ?=
 =?utf-8?B?Q3QwWi8rV3BxenJmbWJybG5SYlZyZGt0VWpXOUNpUjYyU2VvQWFsZWF4b3l6?=
 =?utf-8?B?WlNVYURoM2phWjEzdlVQMi93ODhIcklWZW9XK2hjcTd2VFJSTTdJbWhPY0Nw?=
 =?utf-8?B?OXQ4T2l4UEt6ZS9aZks5L24zWEgxZURYOXFxTlQvTmlmTU5PL0F3VS9GNE5O?=
 =?utf-8?B?TnczUVQ1Z2JKYlFKdUlKR2V0b1BTSlNQMlRpSTZ0Q2VtYlpUVjlvcGhXRnhw?=
 =?utf-8?B?Qm40L3J4QXNZRlAwc2dEaS9EVTNzL2JhN0VocVBQSVhBbmlNUDhmRlJURmN1?=
 =?utf-8?B?WGlLN01MaGdlc3E2czk5bFBPWmt1Mk4wOHp2aFNhcWVmdTdzUDhlcmc4Umpn?=
 =?utf-8?B?VU1LMG53NjRPVEpuS0lWQVNNOTRBYkI4Q1ZPdGJrSVlEZk9xU1NPZ282dGRX?=
 =?utf-8?B?VHZVNnFGUU1raHFOZ3ZiNVJCYmw4bm02aVFTSzBqOFhKT0NsbTF1MXlxRnZX?=
 =?utf-8?B?dXBTQVZ1ZzczR1pIaURxQUhtejg5a2x5T2ErNUR6T1ZhaWpmUTVFSW54eUhU?=
 =?utf-8?B?djd3NDJwdWdwMVNhSUpab0gyekQ0NUtTZE0zcE9kaHZNdm9tNDhaYUx1SzJz?=
 =?utf-8?B?ZTg3VHVlTmV3cUc3K3FwVVUrVnYzOUo1UVRHK1hxQVBQME1tSmdjTEo2Z295?=
 =?utf-8?B?Z3VZa1I0VGoyczFzeHg4eFVNWEttZHFDSHZYM2U5Q1BzY3g1V2JiMHV6WUhn?=
 =?utf-8?B?L011OGV6aGZUWWxqM0doQVNmTkVhd1piTHVlM1JNd3JtM3RIOTRNcXF6YXVO?=
 =?utf-8?B?K0RDYjRENUxFWmJDQkJYNGgzS2NqOW16WXRwUEk3dk1YcklsSUd6RzRjRXE1?=
 =?utf-8?B?R2w0YlFSbi85N3Z0ZjZtazlkSE5xQUVNaXk1aS9peXAxV0tzb2t3UTdBeE5J?=
 =?utf-8?B?WUVuMDMyc2JOZmFBM2Rpa1l5WlpLdnE1a0x2SCtmS0h1QXBQcVJMOGlkZGha?=
 =?utf-8?B?M1ZtQnZrbFBjYnhQRjduOHNyT3B2ZVdla2dNcnljTXhNNW1KamVYVjFaeUI0?=
 =?utf-8?B?amxnajI0aVlCY3lFRFFKRXdNZERiZFpzWEIwR3EyWCtoaTZ1MHRoaitRQnFJ?=
 =?utf-8?B?Z2hSVXBqWGtsckVaK1JFQlJoNWVHWlVUY3hoMVV6b1NNTjdjNmZuNUNNVmFz?=
 =?utf-8?B?L1A1NmpUb040eFB5VVQ5cUJEdFVUQ25jMWRxUkJDUGJPblBKQmJEYXNIbnF2?=
 =?utf-8?B?OW1XZ0dyNjdWNlh3M25UZmFzSDNyU0VBZExwQzM2NlpDcUF1SlhkY3BINHFt?=
 =?utf-8?B?a1dPcTF2QWtzZElXTlRlM0pwaEJDbmtNdmVSREtaQ1M0dlVpeWhwUkxsZUg3?=
 =?utf-8?B?ekVxVlFVVXN0R3hLSUw0a2NyRFpncDJqcGprUG9HWnhDWlJLdWg3endQZ1NW?=
 =?utf-8?B?cUpPWHhUUzZOMHB1MjVHY3d3bm5EVzFyTEdzUWROMGVvQkEvQ2liVTJvNXNu?=
 =?utf-8?B?OE1ZVEFtaDRXdCtMUTVaOXFuTFRWbDB5QVMyNmZFYU1vK2tkSkZLQVJlNzNH?=
 =?utf-8?B?ajB2M003UllBRk01cXV3Y0dueWhoZUYzcnJyRTE1ci9zdlJFaHJkOTNuNTFr?=
 =?utf-8?B?UTUwbTlIMUxTelFkL2tkNW44M3pVZzJIaXk2WExWOGlQemNDaXJyc3JpSWlj?=
 =?utf-8?B?MVpTKzBnQ1FsK1hDMWFQdVZCTWdSNHlObWFFS1JMeXUyaWdFRVRiTHQyTFBP?=
 =?utf-8?B?dEk5MVA2UHpkTkMyRWNyWVloWVRpQ0Vrc09QQloxODRhcmxzc05sV05zcUtU?=
 =?utf-8?B?ekJxMDZFZnBxb3VRZFN0d3pWd1ZmNzNHY3Z2ZVZiUXBrczVkenNLS1E5TXFP?=
 =?utf-8?B?QXRZU2RSL1VuRk9KM0oyVWtnY3VIcTdjdkdhekxJMFU3emcyR0lJNjFwZ0Nr?=
 =?utf-8?B?c1hqd1VQM0tTQ0hDb0E4ZVZ0blRWREhVUTIyRXFTV2phdTFHWU5XVDR2Smov?=
 =?utf-8?Q?CcPN5UYzxu/kTTrjFlB2aGAfq?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 10:23:41.8464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6c8a4e-1daa-4ca7-323a-08de204338b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7333
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



On 07/11/25 18:57, Krzysztof Kozlowski wrote:
> On 07/11/2025 14:15, Harikrishna Shenoy wrote:
>> Remove j721e-intg register name from reg-name list for cdns,mhdp8546
>> compatible. The j721e-intg registers are specific to TI SoCs, so they
>> are not required for compatibles other than ti,j721e-mhdp8546.
>>
>> Move the register name constraints to the appropriate compatibility
>> sections to ensure the correct register names are used with each
>> compatible value.
>>
>> Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>
>> Links to some discussions pointing to need for a fixes patch:
>> https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
>> https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/
>>
>>   .../bindings/display/bridge/cdns,mhdp8546.yaml      | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e2..2fdb4f7108ed5 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -30,10 +30,6 @@ properties:
>>   
>>     reg-names:
>>       minItems: 1
>> -    items:
>> -      - const: mhdptx
>> -      - const: j721e-intg
>> -      - const: mhdptx-sapb
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -103,7 +99,10 @@ allOf:
>>             maxItems: 3
>>           reg-names:
>>             minItems: 2
>> -          maxItems: 3
>> +          items:
>> +            - const: mhdptx
>> +            - const: j721e-intg
>> +            - const: mhdptx-sapb
>>       else:
>>         properties:
>>           reg:
>> @@ -111,7 +110,9 @@ allOf:
>>             maxItems: 2
>>           reg-names:
>>             minItems: 1
>> -          maxItems: 2
>> +          items:
>> +            - const: mhdptx
>> +            - const: mhdptx-sapb
> 
> This does not match regs now. Look which entry is the second - it is
> always DSS_EDP0_INTG_CFG_VP
> Optional item should be the last, not the middle. That's why DT

Hi Krzysztof,

Thanks for the review, will update the reg-description for 
ti,j721e-mhdp8546 j721e-intg is mandatory and for cdns,mhdp8546 
j721e-intg is
not needed, will update and separate the reg description list according
to compatibles as well.

> maintainers ask (and it is even documented) to post complete bindings.
> Complete means all registers, entire address space.
>

I understand the need to post complete bindings, but this is a fixes 
patch which tries to address the concerns raised in previous 
discussions, not sure if it would be appropriate to add other register
in address space like DSC which have not been updated in binding?

Regards,
Hari

> Best regards,
> Krzysztof

