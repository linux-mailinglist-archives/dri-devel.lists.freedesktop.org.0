Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A64C516A2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50A910E1D0;
	Wed, 12 Nov 2025 09:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="aBzXfrse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6565B10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HExXoUlxrW1OVPpa8mUUcyGAxhmymnbUXgrDh+1wNZMUVUD60FtvT+YgK3kJkOjgCyUUywvfqNczk18wb/xRjy0WofaTnTyb4B2M8Q31HyGISy900Lh4gq1FUG4qoMdSEjTPagTJk5x8fIwamRC+ZUqGOTcALdWrByt0f9lzUQW2K3Rt5ngH6B3gs5MpeMy54OvK8zobUsRIgMXPuqsBpjcxg4AMjhLoYnXOTjI/WUZGTSriJb6UAc+maCnYshVX2kpph84VSg2LVOUU6KfTQDefBfS1G4PUkJ3U6Q1ZDUc+7+R/amTQM0lHxKfY1lRWIHvaMLdmWgA4GF5OPXt0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbi5/SIQcM4J21biAgVKv2YxwGumt0laHhK59xByt3I=;
 b=UQukOhFBoit+24CEszRXWmOuiQD+w2BqZwjfTY4naIWOvmkBlguHJ2NPwrzT70hOC4Hh9hZv1PU6H3WSQxc5KZF2DLmm7cAzMBBuklgy9WVb8s9YBicKZQFJRAG6g3+z5dQ7CeYH6mm02lC0cf9ngWZlH5dQp9ckPbrMnl6qjwYJjwelDQlSqqMVv8/HXtbJaQbiThmuxuOOZHRsbXgojUiYNxdAagCkpW+CfCQRrT1KDbYLQypl0fupwQiymrwq2p0jakXNHp5XPEqb5Z+oGwUWHKF6NQ4Hy/lD8ipbteDU2pIZHMhQMpXYivCh5eFiVgXYrxpupgdlcWjAiiq6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbi5/SIQcM4J21biAgVKv2YxwGumt0laHhK59xByt3I=;
 b=aBzXfrsepog6HIzKEpYv9JeGiFauYoHCq4nH3Xg+LYxBLJOUMfdiV4J1KRtV9xCBHtXMTs9C/rW+gSyvKr4yQ8bDfBp2BwhfQYooGaRvkwHS9pk/R6bPWQCEIzmlTITfPS9vcETiRuXp/jyo4MEm+W1OxBvaDQXkX18DEE/+0iA=
Received: from BL1PR13CA0382.namprd13.prod.outlook.com (2603:10b6:208:2c0::27)
 by CY8PR10MB6490.namprd10.prod.outlook.com (2603:10b6:930:5e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Wed, 12 Nov
 2025 09:43:38 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::ba) by BL1PR13CA0382.outlook.office365.com
 (2603:10b6:208:2c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 09:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 09:43:37 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 03:43:28 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 03:43:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 03:43:28 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC9hNXr2447356;
 Wed, 12 Nov 2025 03:43:24 -0600
Message-ID: <864e6b80-2287-4473-afb8-c1ba29613067@ti.com>
Date: Wed, 12 Nov 2025 15:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] drm/tidss: Remove max_pclk_khz and min_pclk_khz
 from tidss display features
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251104151422.307162-1-s-jain1@ti.com>
 <20251104151422.307162-2-s-jain1@ti.com>
 <5fc8eb00-9ecc-494b-8bf3-6239d2a7e1ab@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <5fc8eb00-9ecc-494b-8bf3-6239d2a7e1ab@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CY8PR10MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ff35bc-01b5-4c9d-a7af-08de21cff474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmtHODQzVUJqeE1GWGwzOGlHTDE0WFN4ZjlFbGRXeitkbjFEMXBLVjl6Z092?=
 =?utf-8?B?VXpXZDZ2OWNJSkJYaTQyajRFeXZGSTUzc2VCUy9SVGY5QjNmQ29kSVFtMjBV?=
 =?utf-8?B?QUlSSzhnR1FLS1RvYkN5TkZvWkZkdzAwUVRwMTM0alJwN0JPcnBMeWFlV0Fn?=
 =?utf-8?B?a01Tb2JEUGV4V0RlK0d6K3dZeG5jc2RJSEM3Vmc1M2F5NU5KcWYwTGhiKzFl?=
 =?utf-8?B?Si8yS1FDemdzenRxb3IzcVRsaStobjMyWmd2Y3VPclc5Y0FPVmlKdUkxem4y?=
 =?utf-8?B?bjB6Qk55UVVzYldKQmpRM1dOd3RVbmZQZ1VQbHdEdytjWlFrQXM4L3ZTRDJJ?=
 =?utf-8?B?OVFvOFFBZ3hsdHd2YVN5L3lEcEJZZVRrK1NKcERhMVZieFRLVDcwZmlleVZO?=
 =?utf-8?B?dlc5eFRodVZSWXNDTXdRdlVtbSt5c28zOCt5aU8rYWZnWUlDbVlMUlZJSW0r?=
 =?utf-8?B?bkVlclBUUFlSbEozTkt6VVhyTFdORUY5b2l0VEdKeUJHR005aEhCQ2lnajVY?=
 =?utf-8?B?Ty9sWjZNNmJ6bHJBcmRiU29IblFOSlRrS0JFMDFUT3lKb3FLTUxxOFp1NGhE?=
 =?utf-8?B?TjIxMlcvdHJ2Q2JSdkZta3VwaWtxZXcrMzNBb3lvREFrYi9ZMjNwMDdKeURl?=
 =?utf-8?B?TkttRnRYTFY5RCswMmFTUDBZWmQ3a2JiQVV2Y2p1elI3WGl1WURJQmMxeS9q?=
 =?utf-8?B?NTlORktqbHRPTXpvVmlaUFBNMHpCYnV0cDZld2J6WTJBTDhkd2lWdHNmWlZ4?=
 =?utf-8?B?WDV6ZmprNmVSRHRkTE1lNytVR1VENHh0OHhYR2dKT1B2cS9aODQwWmxBV294?=
 =?utf-8?B?eEdyd2dueFFrSFhKSFg0QnZRcWhZOW12YmpQMjUyUnRWbjdpUUx4SGhqZCtm?=
 =?utf-8?B?R1ltT21kWVlOUnB5d1NsWXRzd29OMzFCL2Z2VWYycXVxZlMzZ1pMTmJuUWZ4?=
 =?utf-8?B?eUV2QXExNVh5NmRrL1d5S1I3NWlDdVV5RlU3NEJoUGFwM2t6VmlVZVVlSDRL?=
 =?utf-8?B?NThNT3craUdWQkh5RzJxdzl1dlVpNm1RSzhVYnFFVEZPWUFZODBIVFNNZmpj?=
 =?utf-8?B?UnJVM2J3dVRGUEtCSmtwRkQ5d3NrZHcwRXZUemNHRC94bEpQTit3cGdzODhH?=
 =?utf-8?B?TklOZTVTM280VmN0eTRuMnZnY1NRQlpNV01BaHlRaWFpRXhVTlNUTnpnbjl3?=
 =?utf-8?B?dEVkVjVXd0dGUUxUNVY3ZHplZEVYVVJlQ0JRbk5qcEZWOHlyVzhNR2UvNnBv?=
 =?utf-8?B?WHp4QlRZbVloS0NNL1czb2pTQVRabXhvbjVlZWVJNjVPTE83ZHlJckFOZE5W?=
 =?utf-8?B?KzFlNGdEV25xaGtIYVFuU2Q0WkZ0anVNYnExQVJaRldPd1Y1bEoyMFpTWlRP?=
 =?utf-8?B?VUJ3dENSQU1SNnBTVGlkUi8yNVB0STVaSDJ4cWZpU1hJMjVkbjFlMThZSlFp?=
 =?utf-8?B?cithZ1JqM2dnYkw2RjU0TlJsMGlLSFY4NEdZbGNpc1lpclJjNHZoUkFRbXI2?=
 =?utf-8?B?YlVFMy9HQmZiTkt4ZUJxUHU5dGRRaVVyYXBTQ2xFb0k3cXgvVG16enprOFFH?=
 =?utf-8?B?R3A5a2R0NFdRMGkzYmNkcndHRWZZTXUxcWJHNHpqejk4S08xMUlUbTVsTGEv?=
 =?utf-8?B?MEFFYmloMm11REZOZmJkaUNaQ3ErZW1adnBPMmpYbUt6U1Y4VmF1bEF3VFhr?=
 =?utf-8?B?UXhsVW9oZmtSRXJsM1FpQTRmeWpBRkdyeXdUWW1nVzZHTmdkS0lWR3JEZXZG?=
 =?utf-8?B?V0xLem1KdC93Y3ZSdkdWeGZ0TnhSazNScWdBUmlKbnNXMDJNaFozMysyYVFX?=
 =?utf-8?B?NzR1WENsbkRBSGluU01XU1phazhmaHErcXJnMGVhMzRyQTNJNU1pNUtwUkM2?=
 =?utf-8?B?amxuYS9TME52NXZUQS9JTTduME1EeUNVOWx1enRablVNQkpFQUEwUlVvSkN6?=
 =?utf-8?B?N1R5WFVsWlR3UEE4Ukhkd0hSTW5LQXZwcGRlbnBqeURmTUlhQW4xMDgvRG1I?=
 =?utf-8?B?Qno2VUg1MTFheTlia1dRRzR4RDN3S0ZsQmltRXZERTNPcHE5eHhjTGlxcG1K?=
 =?utf-8?B?K1o2Q1pqZTNZTkpSTkRONk43QWdGRkFiYW1mYlQrSGsrR3Q1WDVQSFBJa2xV?=
 =?utf-8?Q?1ScaWvfdpy8eI4FL5W9oulQcz?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 09:43:37.5685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ff35bc-01b5-4c9d-a7af-08de21cff474
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6490
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

Hi Tomi,

On 11/12/25 15:10, Tomi Valkeinen wrote:
> Hi,
> 
> On 04/11/2025 17:14, Swamil Jain wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> The TIDSS hardware does not have independent maximum or minimum pixel
>> clock limits for each video port. Instead, these limits are determined
>> by the SoC's clock architecture. Previously, this constraint was
>> modeled using the 'max_pclk_khz' and 'min_pclk_khz' fields in
>> 'dispc_features', but this approach is static and does not account for
>> the dynamic behavior of PLLs.
>>
>> This patch removes the 'max_pclk_khz' and 'min_pclk_khz' fields from
>> 'dispc_features'. The correct way to check if a requested mode's pixel
>> clock is supported is by using 'clk_round_rate()' in the 'mode_valid()'
>> hook. If the best frequency match for the mode clock falls within the
>> supported tolerance, it is approved. TIDSS supports a 5% pixel clock
>> tolerance, which is now reflected in the validation logic.
>>
>> This change allows existing DSS-compatible drivers to be reused across
>> SoCs that only differ in their pixel clock characteristics. The
>> validation uses 'clk_round_rate()' for each mode, which may introduce
>> additional delay (about 3.5 ms for 30 modes), but this is generally
>> negligible. Users desiring faster validation may bypass these calls
>> selectively, for example, checking only the highest resolution mode,
>> as shown here[1].
>>
>> [1]: https://lore.kernel.org/all/20250704094851.182131-3-j-choudhary@ti.com/
>>
>> Tested-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 86 +++++++++++------------------
>>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
>>   2 files changed, 31 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index d0b191c470ca..b11880178cba 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -57,12 +57,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   };
>>   
>>   const struct dispc_features dispc_k2g_feats = {
>> -	.min_pclk_khz = 4375,
>> -
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 150000,
>> -	},
>> -
>>   	/*
>>   	 * XXX According TRM the RGB input buffer width up to 2560 should
>>   	 *     work on 3 taps, but in practice it only works up to 1280.
>> @@ -145,11 +139,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   };
>>   
>>   const struct dispc_features dispc_am65x_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -		[DISPC_VP_OLDI_AM65X] = 165000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -245,11 +234,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>   };
>>   
>>   const struct dispc_features dispc_j721e_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 170000,
>> -		[DISPC_VP_INTERNAL] = 600000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 2048,
>>   		.in_width_max_3tap_rgb = 4096,
>> @@ -316,11 +300,6 @@ const struct dispc_features dispc_j721e_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am625_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -		[DISPC_VP_INTERNAL] = 170000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -377,15 +356,6 @@ const struct dispc_features dispc_am625_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am62a7_feats = {
>> -	/*
>> -	 * if the code reaches dispc_mode_valid with VP1,
>> -	 * it should return MODE_BAD.
>> -	 */
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_TIED_OFF] = 0,
>> -		[DISPC_VP_DPI] = 165000,
>> -	},
>> -
>>   	.scaling = {
>>   		.in_width_max_5tap_rgb = 1280,
>>   		.in_width_max_3tap_rgb = 2560,
>> @@ -442,10 +412,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>   };
>>   
>>   const struct dispc_features dispc_am62l_feats = {
>> -	.max_pclk_khz = {
>> -		[DISPC_VP_DPI] = 165000,
>> -	},
>> -
>>   	.subrev = DISPC_AM62L,
>>   
>>   	.common = "common",
>> @@ -1333,33 +1299,54 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
>>   			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>   }
>>   
>> +/*
>> + * Calculate the percentage difference between the requested pixel clock rate
>> + * and the effective rate resulting from calculating the clock divider value.
>> + */
>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>> +{
>> +	int r = rate / 100, rr = real_rate / 100;
>> +
>> +	return (unsigned int)(abs(((rr - r) * 100) / r));
>> +}
>> +
>> +static inline int check_pixel_clock(struct dispc_device *dispc,
>> +			     u32 hw_videoport, unsigned long clock)
>> +{
> 
> Ah... Sorry, I was quite unclear in my comment to v7. I did not mean
> mark it as inline. I meant "move it inline", i.e. move this code into
> the dispc_vp_mode_valid function. This is just a few lines, and having
> it in a separate function makes it a bit more difficult to understand
> what are all the checks done in dispc_vp_mode_valid().
> 
> I can do that change when applying the patches, if that's ok for you.
> 

Thanks Tomi, please do the required changes.

Regards,
Swamil

>   Tomi
> 
>> +	unsigned long round_clock;
>> +
>> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>> +	/*
>> +	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
>> +	 * use the same 5% check here.
>> +	 */
>> +	if (dispc_pclk_diff(clock, round_clock) > 5)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>>   enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>   					 u32 hw_videoport,
>>   					 const struct drm_display_mode *mode)
>>   {
>>   	u32 hsw, hfp, hbp, vsw, vfp, vbp;
>>   	enum dispc_vp_bus_type bus_type;
>> -	int max_pclk;
>>   
>>   	bus_type = dispc->feat->vp_bus_type[hw_videoport];
>>   
>> -	max_pclk = dispc->feat->max_pclk_khz[bus_type];
>> -
>> -	if (WARN_ON(max_pclk == 0))
>> +	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
>>   		return MODE_BAD;
>>   
>> -	if (mode->clock < dispc->feat->min_pclk_khz)
>> -		return MODE_CLOCK_LOW;
>> -
>> -	if (mode->clock > max_pclk)
>> -		return MODE_CLOCK_HIGH;
>> -
>>   	if (mode->hdisplay > 4096)
>>   		return MODE_BAD;
>>   
>>   	if (mode->vdisplay > 4096)
>>   		return MODE_BAD;
>>   
>> +	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>> +		return MODE_CLOCK_RANGE;
>> +
>>   	/* TODO: add interlace support */
>>   	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>   		return MODE_NO_INTERLACE;
>> @@ -1423,17 +1410,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
>>   	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
>>   }
>>   
>> -/*
>> - * Calculate the percentage difference between the requested pixel clock rate
>> - * and the effective rate resulting from calculating the clock divider value.
>> - */
>> -unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>> -{
>> -	int r = rate / 100, rr = real_rate / 100;
>> -
>> -	return (unsigned int)(abs(((rr - r) * 100) / r));
>> -}
>> -
>>   int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>>   			  unsigned long rate)
>>   {
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>> index 60c1b400eb89..42279312dcc1 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>> @@ -77,9 +77,6 @@ enum dispc_dss_subrevision {
>>   };
>>   
>>   struct dispc_features {
>> -	int min_pclk_khz;
>> -	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>> -
>>   	struct dispc_features_scaling scaling;
>>   
>>   	enum dispc_dss_subrevision subrev;
> 

