Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CFC2D0B4
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3CF10E081;
	Mon,  3 Nov 2025 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="n1LDMBck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazhn15013063.outbound.protection.outlook.com
 [52.102.133.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB0A10E081
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfTeXHApOCt7w1GtCZ+ULQXGQi8RGhmiFluO3YIa5CSttuGgEE4yym7i9QjhtAj8xMj8tpQUlxaYW6LPSJZm8VPh4g7OLt3xDckm00/WAA8/SHh91GP7DmgxBmeHWIhrOcqWaLTG9Sw6L0RlgbBtrS5P/KVr5d3nLIdwL+R5A2D1odLlGVROpg8O4IA2c/N4fQClFy6rChDRlRl2WwXbi6QenFSZGHygAwqlQugoWEClfVVMVcSboAYPwxaoCBswTPL3BmYScLtjf41mRTLpYSXfMqOVXYCkQI6gh0eYqftz4LC6PgeSeg/H6JxXwunptLp/yh8amfLEQdxNf1Ovog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEy4F2Op4GIxCicUBgqc9jfQ8diBdGFb9ONQGT8Cet0=;
 b=SFuoJ7+OkKAP+oa0EaFfnrDWmlGUROzLhUMv0bUqZi1mNxrJ2Hw2K46MttdW43ljvKuCQQhtgxMFSTR2xGSBBFECPESeyJ/uDInqzFKzMv+ewBmVELBt6lJ4PnZJdWTF8w5L4XjSuoEo8K0wpoSi2kUpeBSL9uMzeDoObmelN+fFI1BStF8iRU2xM3ovutBO0Ft/1Gh+TslmeBEPjiq13GvK1SQGevuaEUpfJmMshHeOUBBtWPrdVATc3tH94uenHbncSPsZKF30pcJj52HtGTtVs390Vniy/W4g5pXUNPfU0+DsgBvVXxU0ZzTM3sGK9wOsteocqC/TMvg4aQi6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEy4F2Op4GIxCicUBgqc9jfQ8diBdGFb9ONQGT8Cet0=;
 b=n1LDMBck2uE5n5dFZiS5Pnm4MY/2NwLqpa2Kxkb1Nc1Pw0zAQJ/zlT6kWeuCsRvkNGsh2tqT3gbhlIouOz9Vo6MOKXDTLHJW56F7cnjlV6EyoB9zLtvJw6j3XGvZfPAi1e2oJhsqaRR3KoKwLQ0BFRZ7FbhQkojV4PmXMn1OvWg=
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by MN0PR10MB5982.namprd10.prod.outlook.com (2603:10b6:208:3ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 16:16:41 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:85:cafe::ec) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 16:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 16:16:39 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 10:16:33 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 10:16:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 10:16:32 -0600
Received: from [10.249.128.225] ([10.249.128.225])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A3GGRMf465222;
 Mon, 3 Nov 2025 10:16:28 -0600
Message-ID: <a921f0d9-b525-4cd0-9875-5d7cd2987419@ti.com>
Date: Mon, 3 Nov 2025 21:46:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v7 1/2] drm/tidss: Remove max_pclk_khz and
 min_pclk_khz from tidss display features
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251028033958.369100-1-s-jain1@ti.com>
 <20251028033958.369100-2-s-jain1@ti.com>
 <bdfcd6b8-6799-4e7e-913e-528df322436a@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <bdfcd6b8-6799-4e7e-913e-528df322436a@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|MN0PR10MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ff5254-ec4d-4d7d-c5f8-08de1af45eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|34020700016|36860700013|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVJQZ0ZIc3lNdDRTSnNESnQyOE5wbjFRZytoaXZUSURYbmVRWGhIaDhuTG9t?=
 =?utf-8?B?L0Mvbi9qSmR5cGkrYW5VUlRhNWVGK0l4cFExamhuOEJnWXlHWmZwamhmUC9C?=
 =?utf-8?B?eUk0WnRRMzFMUWdzb2FqeW5CZGZQcnh4c3VHNzFVVFJtR0YwbUVtSGhLN1ZO?=
 =?utf-8?B?aWI0MGtDTUZUTEswaS92ZCtuZEEwcndnSENIWnU4ZU1MdGVnY21Ia3lJazhU?=
 =?utf-8?B?SHFNaWZ1Ny9MLytzOWluRHliRVowa1I4enJZTzZKV2FmUlFLOFh3SEoxTDBX?=
 =?utf-8?B?dVZWT1hhRGhDZlV1Sk5GUjVibUwzWXAwcFpLMVRPd2lNVE53N0ZVdXVTK2Yr?=
 =?utf-8?B?VVVNdDhXaStxaGFXUXd0M056eWloUUNFN2hVckRuZU5ja3hnQmZDSmQ3eGU5?=
 =?utf-8?B?Y0EveE9UVitlc1A0MWJZWlNnVVo4ZlgyNmRlN1Z6U2Jmc1dVSlVONXYzRXdw?=
 =?utf-8?B?SzVjOFV3dUdXWVp6UkUvcEErQXFwTmhvKzlxazh6R2Vxc3RvajAzSFhwQUNz?=
 =?utf-8?B?TVBqNHIyVW82bjFkSlRmcU9jNEVsS3hsNXp1V2RiUmFLUC9SSG9JVThiMkVB?=
 =?utf-8?B?TytIWllzRmordUhWbW9oTm1xcjZ5NER0WnNDZlNuK1dtYjZxNW1TenRFY1FF?=
 =?utf-8?B?TG90Y0ovV1pkSi9oNVNGQzhuTzBDZ2ttTm53UEN6cDlEU0NRd0JuNFplU3Av?=
 =?utf-8?B?NmFMUE9jMWxrOGRkQ1pSNnNJRjdMRkRFMkY3dFVLT0RuZzV2VTN5ZG5vRXNT?=
 =?utf-8?B?eW9ZZVo5SnBDSWNDREtWbmdZZVNRQlMwTktKK0p1Z2tncGw4MmNoRGRVZHdZ?=
 =?utf-8?B?b3JnYzM0UWVvOExEWVE4T0VBYmJrK0tnWlkwR2pvT2E4ejNkT1ZhdUhCYVJJ?=
 =?utf-8?B?MG9LYnZyMmwzN21kTlQ2WlZiRXNDSUsya0hLclg4cDZSbWhCY2cvUnRpWDVx?=
 =?utf-8?B?dzc5VVZxTTlYMldMZGN6QngvRXk0UFoyWU5BRUpVOHpVOE1qQUtzTHVtNy9U?=
 =?utf-8?B?ZGpLU3U2UlZXeVM3Sisvb084Q1lOR2czbXBIQUErS1FyT09IQ3RkTEcrWjNt?=
 =?utf-8?B?UzMzcXZBQkU1alN1UzQ3bmNxeWN4NFViOWJnMi9xdG1NK1pBa2ZPU2pMMlNv?=
 =?utf-8?B?cldwbnVsSFg3MzkzbXJ5RERWcGZaRVlvUE5yQ3krcWxMQmszWXF6dTNwN1JE?=
 =?utf-8?B?dGhieENFUTRrQXU0MGtSeVM1cEJuME5mUnY4NEl1RnV2UE5uMFR1V1NNdmI5?=
 =?utf-8?B?eGowWnJ3MHZCMDdtNk8vcnV5cnNaZEtyTG5JQ3dyamxUQUJrY05vd2hSOFlH?=
 =?utf-8?B?ellrSFVjektra0crRWZtWTJQd05HbURwNnRKK1ZnbGszcHhKRXdSVHkwUnZ3?=
 =?utf-8?B?RE5qTDdaWjdFNzdybmJ5RlVoQnpIdVIwVDU1S1ZvK2FhUmxERmRRUk5ra3dO?=
 =?utf-8?B?SUNrZDdaYUdHRXNoTVlhZ29jVm1INWFYUDhjcHh6TUJjbW1jRmdGUUQzY0lI?=
 =?utf-8?B?ejVtL2h4QlV6R0NQd20yajJ6RGJ6aUpzUjAzTmxEdWRhdlBJVkR0MG5TNFFU?=
 =?utf-8?B?cy82ZER3VlNRUGF4bUQxTERxeUNjVE1Lem4zR1UyU1JDWjJYOE9pMkVCS3pv?=
 =?utf-8?B?YitTb3JDUFptNitERHhDVjlWRERuR2FSYVJtaFJJQjJjWEFZMm5DS3hnd0dh?=
 =?utf-8?B?aHFUdkhiSnRNSDdLbU9kdlhJU0ZDd3hZV2phazB5eVNDQktDd0Y2NThvUWlM?=
 =?utf-8?B?d1N4aFcvckMvM0F5Y05CcC9xTFFMT3cwbDloUEg0V3VQZlF3b21YSVBsMHBD?=
 =?utf-8?B?eXVtR1lKOGNvdDMzR1V1OHBLTVFocTZmd25mbFlrbzc3MXQrRzE5M091OUpG?=
 =?utf-8?B?dkhWWWl6RFhRaW1SZE03T3hTZnBOWHlmSURVZzJTeVFKNm05Wkd0a0dBUndX?=
 =?utf-8?B?Tk5LVm8zK0dTNjMzNVpEL01VbjVBcWtUc0w1UngrTjd3S1BmZy9EYUY5c1NE?=
 =?utf-8?B?bzNldlJ4OWlDajIzaFVHWnQ2M2svL2VBL29MeGx1byt3cTlYUVpkNzZXSklz?=
 =?utf-8?B?VUoydUpOSnNuWEF4UENFNytDc1FOdHV3R1A4ZTUzSmRxMTdtM0t5cGJqTGpB?=
 =?utf-8?Q?BYlUPoFX/N/LvnsjmYtzrODS8?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(34020700016)(36860700013)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 16:16:39.9440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ff5254-ec4d-4d7d-c5f8-08de1af45eee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5982
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

On 03-11-2025 13:34, Tomi Valkeinen wrote:
> Hi,
> 
> On 28/10/2025 05:39, Swamil Jain wrote:
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
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 85 ++++++++++-------------------
>>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
>>   2 files changed, 30 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index d0b191c470ca..07731b02490f 100644
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
>> @@ -1333,33 +1299,53 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
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
>> +static int check_pixel_clock(struct dispc_device *dispc,
>> +			     u32 hw_videoport, unsigned long clock)
>> +{
>> +	unsigned long round_clock;
>> +
>> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>> +	/*
>> +	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
>> +	 * use the same 5% check here.
>> +	 */
>> +	if (dispc_pclk_diff(clock, round_clock) > 5)
>> +		return -EINVAL;
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
>> +		return MODE_CLOCK_HIGH;
>> +
> 
> I think it's better to just inline check_pixel_clock here, it's just a
> few lines. Also, returning MODE_CLOCK_HIGH is not correct. I see other
> drivers using MODE_NOCLOCK or MODE_CLOCK_RANGE.
> 
Thanks for the suggestions Tomi. I will use MODE_CLOCK_RANGE instead of 
MODE_CLOCK_HIGH and will update check_pixel_clock() as you mentioned.

Regards,
Swamil> Other than that:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>   Tomi
> 
>>   	/* TODO: add interlace support */
>>   	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>   		return MODE_NO_INTERLACE;
>> @@ -1423,17 +1409,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
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

