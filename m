Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72811C83628
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 06:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644610E00B;
	Tue, 25 Nov 2025 05:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ad9V5HZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013025.outbound.protection.outlook.com
 [40.93.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5A10E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 05:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um3e2J4rDNB6xI5kTw+ZzjIeZ6HcqlN7n4SBrZ47eGQBc0UJ/CHHnl6pGJ12lG3YuUsXEBFhVhTFhfoKnXv3UHvhVtQZJp4En0+hJShQoCgTGd2Xt4SZp86wV1Qapm9buSnfvzqjK8ceqhQik71ltc4Mk96DP16n4qWYdbf9XzmJh1NkuM6GzEThc2JCYarE2Axh81J1ZFCK+/6NBPA3LXWNSBiJrXUTeUQ3YwNMqen0doi+ELhdMTngt96Dn/NaAcpCkWVK2wxIbgKX+EWeQHhD1t0tD5fOakVSxwpHvFI+oLdxnbOY5EGL8bUbdsr4fNizmHPZUE2wbYWWfJj5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcMrHIwp4biII+y/pGm1Q9uNH7TWGMkwmtmy+6aUTAs=;
 b=xoA4FX3PmUCDiFZe97VsVf2nN9eeGSnj4OtuWrgb2GaeMSV2RxKCSQShWJTwjt6ao0QfX7CPE/iF+Po394AcdNjdHf8qHJ9HhdhCGdoJa/H/6foRiXIqhMsEoLaE+MHjLKTGBvXaN9rbqB3YeUdUgS/0mLcaYdRAgyzDm/BTyLhicaYIzN0r/e2IfWHlC0mIRuMNCrpO+yzexjacaNOq9/ZF1jwe1l8HRpVXohRYF0CFdDbb66eRmT6GKiUBXfxvJfeXDmvX0HFzkfAaTZDp8qJjarfQxLN/I27JiQ5XBMF1focSIAZxJaC1oUUl9v22cOG3Dj2XIu/IwPNTXOvYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcMrHIwp4biII+y/pGm1Q9uNH7TWGMkwmtmy+6aUTAs=;
 b=Ad9V5HZp03OrRjcFowUReIJvcFeICAfXnj4UDWAICcYy8F81KivR6/CrJW66MbX1ET4EqEVPVpWnVkqq39qji0StlSMDRIg795i9Ieg9RnAwRMzK5UMeACsANxG2X8olsW8taVJpzmTzhbbfnREh9uewOs2kI9Hb8IixqP2X6dU=
Received: from DM5PR08CA0035.namprd08.prod.outlook.com (2603:10b6:4:60::24) by
 DS7PR10MB5005.namprd10.prod.outlook.com (2603:10b6:5:3ac::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Tue, 25 Nov 2025 05:27:04 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::57) by DM5PR08CA0035.outlook.office365.com
 (2603:10b6:4:60::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 05:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 05:27:04 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 23:27:03 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 23:27:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 23:27:03 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AP5Qv503149183;
 Mon, 24 Nov 2025 23:26:57 -0600
Message-ID: <7161aa97-7ee3-4468-a53e-8158075aa0a9@ti.com>
Date: Tue, 25 Nov 2025 10:56:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: drm/bridge: Update reg-name and reg
 description list for cdns,mhdp8546 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <robh@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <airlied@gmail.com>, <andrzej.hajda@intel.com>, <conor+dt@kernel.org>,
 <devarsht@ti.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <s-jain1@ti.com>,
 <simona@ffwll.ch>, <sjakhade@cadence.com>, <tzimmermann@suse.de>,
 <u-kumar1@ti.com>, <yamonkar@cadence.com>, <pthombar@cadence.com>,
 <nm@ti.com>
References: <20251121123437.860390-1-h-shenoy@ti.com>
 <20251123-flying-sweet-raven-bf3571@kuoka>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <20251123-flying-sweet-raven-bf3571@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS7PR10MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4af4a8-59fc-4f51-3b80-08de2be344a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGw4ZTFJc3I4LzNoZXBkUlhXbUwwSitTVVNoNXBDUHVPMitwck1pLysrZDl2?=
 =?utf-8?B?TndUb3NnQWp1UzJmL3p3R3J0SDRLaUFPZ3RVUnk3TTl3SEV4UWYzUHRkK1NF?=
 =?utf-8?B?Y1BCZEZFQjBCMWZFQlZjYWpndzNJNzFzWmJFSWFaS2ZyVDdhRkF4aUptcDMy?=
 =?utf-8?B?UkdUK0NHam9WVTJnZ1N1TE1wRlJ5MndMOVdqdFdBNEVndXkwdytxL09jZHJm?=
 =?utf-8?B?ZHpYK09QR0MyMlBqZi82UUdxMU5HZXoyQVZHZnZBY0lGS2FTcDh0N0p1V1M2?=
 =?utf-8?B?MDNRNmJHL21HRkoyaDNDdFF1cDNrY01CSHFDL1l5dHJzVXB4TDhtS1cwa3NE?=
 =?utf-8?B?Ynh5eDlqZStxYTl5U1YzV0NiT1NnQlJWVVlxekluUG82Q1I0VUpxSGNJN1pP?=
 =?utf-8?B?NlF3OFpQbEs0UnRMUURxY0NZbGNJR0NueUUwQkdxTXZkeXNSU3pTVXRScU81?=
 =?utf-8?B?eVhVS1VlaUFPTVJuYUZIWXhMKzZhQkpNblBsVndZa1RTdENCWmFjSFJSWEps?=
 =?utf-8?B?cUtKMlU5R21vTk9OVWlVRnNQazN6eUpQNXJ4bzBzVDhJZ2FOQ3RvaTNqdjdM?=
 =?utf-8?B?K3ArbjZtSGNQSGV2ejBjZTlvbWdtMFpHVFJscWVPMVRZejh1UHJIWVhJMnUr?=
 =?utf-8?B?UUMrUHozYUFxU1NPV1pGd0Y3Qmx1RVZKUFg5WktuTk5HcDZwZFExVGhZcUgy?=
 =?utf-8?B?cnoyT09EcXhvUFVZMnZPaW9mN3Vsb1FrR3EwOG52SFR1UGtUSVd6UGwwM1JO?=
 =?utf-8?B?dG1JemVRbW8zUngxYUZDQUM2SUdJY3V0NHFmbWxyUnQ0cHdnU1k3Sk53bk45?=
 =?utf-8?B?S0phazhPTmo4MGNVaUkwVkMyTlZLc2k0ZndIaElVSFRIVE0zcGgra1UzbDJK?=
 =?utf-8?B?em9BSW9LVlBRNHBHVlEyaDJORElQeDdWdzNkc0gvbVpyOXluQTg3Yi9zR092?=
 =?utf-8?B?amNyOVpNVnhxZVZZb1RnclJTeEZBQkJDbUFsQkpLSnhwUjhjc0IvUERza2xp?=
 =?utf-8?B?UGJoekdTVktSK3lZNDVlZ1Vqd2NpRzU5R3FlaytiS05XcG95Ukg1VzFiTkJw?=
 =?utf-8?B?dmw3MTljSWNQaG8zOUFtbjJjQkg5ZnFpK3kySWFFRzczNWdoMGc5ZUZnRzFV?=
 =?utf-8?B?Z1RhaGRsanBCaXNoWDdEUmlOQktrclMweVppdjNHL2VVbk5BMWtpZWUzd25x?=
 =?utf-8?B?RnFCVUtHbGxSSCtITStXdHc3S21ZSHg2bXBadU14NllHU0MyOXlmZEpKcEFq?=
 =?utf-8?B?Y1d3ZHVRWlhkY3dHUFNVL016alluaG5qZ3hlYjc0cmlKc3NkK2J0Rmc1NzZv?=
 =?utf-8?B?bVFYOGZZT2dKaEdWRVB2OXhyUG8zaVpUS3RtdEF3TkFxQ0JLUXp3Q1ZweUt3?=
 =?utf-8?B?a09JczlmZHZUcDZiZmxEdVBlV3l4WFNvblhiSUphQjFsMjNORm9MWlNwa2Ru?=
 =?utf-8?B?ODB2SjRVZWgzWng0c0toM1NncjJhbDh6dHQ1WWNhcnRBbStRczNlbTJGa3pJ?=
 =?utf-8?B?Lzc0eWhPMTB5cUNSUXNPVlpwN1BoTVpKS0dzTk54NTByT2JSUlVBRzB0d09v?=
 =?utf-8?B?Qnc2RFVYeFFQNGlyRlpPbjBidmNVR08vNXpQd0kwU0FzeUc5VFQva05mNTZh?=
 =?utf-8?B?cTMzUWtHcmNDaDBpeUh2QkRmSWNvdmdaemRaazNqUTc1K3pscDZMZWRGSWh2?=
 =?utf-8?B?cVZDcDg4OWozZUlXbFNmeDAyZnZIY0l1OXpkcEtEcUFvUXdKR3hLWEkwRFpu?=
 =?utf-8?B?aWVFdWYxQkxQRDJLWkRQcEdvTHhCTU9CQWtNMlRJUmUxNVF5VDFQVm5QM3Zy?=
 =?utf-8?B?TmdBRGFmZUl3MUc2TWYxQ1FqQ0JjcEtWRThQeTUwbkRPanl6YWhBMnczUEFP?=
 =?utf-8?B?ZFF1dnZZRTQ3UmlRUytPdVg2U2diZlB5WWZwMWx0LzRNbS9TS09RWWszcDc0?=
 =?utf-8?B?b0o3UnQ0Zkh1T3hPRWp1WHczSGdjdk9ZZ1BMZmRpcFdpb0hOeHZMTVFiTkJ5?=
 =?utf-8?B?TlRZWlBRdXg5WDk4SnN3YjQ0ZzdVYUtwQ3RpNXFPU3h1cHR6c2tSb1hCUWZq?=
 =?utf-8?B?VmxOZnhhOTBhbWFxdnVZWGV2YnFZdktrT1h0aTVNWWR0TFRueVBEM1dCdzVa?=
 =?utf-8?Q?AboY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 05:27:04.1296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4af4a8-59fc-4f51-3b80-08de2be344a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5005
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



On 23/11/25 15:30, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:04:37PM +0530, Harikrishna Shenoy wrote:
>> Remove j721e-intg register name from reg-name list for cdns,mhdp8546
>> compatible. The j721e-integ registers are specific to TI SoCs, so they
>> are not required for compatibles other than ti,j721e-mhdp8546.
>>
>> Update reg and reg-names top level constraints with lists according
>> to compatibles.
>>
>> Move the register name constraints and reg description list to the
>> appropriate compatibility sections to ensure the correct register
>> names are used with each compatible value also adding the DSC register
>> to make bindings align with what the hardware supports.
>>
>> Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>
>> Links to some discussions pointing to need for a fixes patch:
>> https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
>> https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/
>>
>> Link to v2:
>> <https://lore.kernel.org/all/20251119122447.514729-1-h-shenoy@ti.com/>
>>
>> Changelog v2 --> v3:
>> -Add the reg description list and reg-name list in top level constraints
>> using oneOf for either of compatible.
>> Logs after testing some cases: https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9
>>
>> Link to v1:
>> <https://lore.kernel.org/all/20251107131535.1841393-1-h-shenoy@ti.com/>
>>
>> Changelog v1 --> v2:
>> -Update the reg description list for each compatible and add register space
>> for dsc to make the bindings reflect what hardware supports although
>> the driver doesn't support dsc yet.
>>
>> Note: j721e-integ are not optional registers for ti-compatible.
>>
>>   .../display/bridge/cdns,mhdp8546.yaml         | 85 ++++++++++++++-----
>>   1 file changed, 66 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e2..632595ef32f63 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -17,23 +17,45 @@ properties:
>>         - ti,j721e-mhdp8546
>>   
>>     reg:
>> -    minItems: 1
>> -    items:
>> -      - description:
>> -          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>> -          The AUX and PMA registers are not part of this range, they are instead
>> -          included in the associated PHY.
>> -      - description:
>> -          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>> -      - description:
>> -          Register block of mhdptx sapb registers.
>> +    oneOf:
>> +      - minItems: 2
>> +      - items:
> 
> This is wrong syntax. You created here a list, so you now allow
> anything with minItems 2.
Hi Krzysztof,

The list defined here restricts what lists are accepted, so for 
cdns,mhdp8546 compatible anything more than 3 items is rejected 
(example: 
https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9). 
Could you please help me with an
example where you think the bindings are incorrect?

> 
>> +          - description:
>> +              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>> +              The AUX and PMA registers are not part of this range, they are instead
>> +              included in the associated PHY.
>> +          - description:
>> +              Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>> +          - description:
>> +              Register block of mhdptx sapb registers.
>> +          - description:
>> +              Register block for mhdptx DSC encoder registers.
>> +
>> +      - minItems: 1
> 
> Actually anything with minItems 1... I asked for list of TWO, not FOUR,
> items. Or if syntax is getting to complicated, just min and maxItems.
> 
> 
>> +      - items:
>> +          - description:
>> +              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>> +              The AUX and PMA registers are not part of this range, they are instead
>> +              included in the associated PHY.
>> +          - description:
>> +              Register block of mhdptx sapb registers.
>> +          - description:
>> +              Register block for mhdptx DSC encoder registers.
>>   
>>     reg-names:
>> -    minItems: 1
>> -    items:
>> -      - const: mhdptx
>> -      - const: j721e-intg
>> -      - const: mhdptx-sapb
>> +    oneOf:
>> +      - minItems: 2
>> +      - items:
> 
> Also wrong.
> 
>> +          - const: mhdptx
>> +          - const: j721e-intg
>> +          - const: mhdptx-sapb
>> +          - const: dsc
>> +
>> +      - minItems: 1
>> +      - items:
>> +          - const: mhdptx
>> +          - const: mhdptx-sapb
>> +          - const: dsc
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -100,18 +122,43 @@ allOf:
>>         properties:
>>           reg:
>>             minItems: 2
>> -          maxItems: 3
> 
> Your commit msg says you "remove" but here you ADD one more item, thus
> growing this 3->4.
> 
> How remove can result in 3 becoming 4?
> 
Yes, remove is for j721e-intg for cdns,mhdp8546 compatible, and to make
bindings complete have added dsc reg-blocks, these changes reflects 
correct capabilities of hardware, have mentioned these in commit message 
as well.

Thanks.
> 
> Best regards,
> Krzysztof
> 

