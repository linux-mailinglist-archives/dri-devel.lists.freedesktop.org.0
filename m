Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949EAC2D0D9
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA8C10E10B;
	Mon,  3 Nov 2025 16:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="JEi4t0pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazhn15012047.outbound.protection.outlook.com
 [52.102.140.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181210E10B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njJJQ+WcUofK7S0zhc3NsmKRV50s1hYLpfsjoFGiP8ylmsR99GVCuiPZZz8ctQJ4wP1Y5fagmVjI9pIUGW23eQbh1XzIiuPeulrQWOa5qeGffbeYPfh4dhjbyL42DkWdOHqZXwdEpmp2/vOwyJDXjU6zXlEuKgUSuXdc8Or5FxyFKGYBD4Td5vYlqEaty7Z1oBlQE/ACGdfBAxgFXanZQ0AP8WQKv6xr/MqnvjU5BX+nLOtSiVEsZdeZc9zQFJzDYEEF2Cfpj5qmSeGlCs5rJVKpcYYO0TIxnXK3r/kpAjFgcFYigM/czup2wSLp/2PkuHIMBX5XLk2P1jN9TM1iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzQRfpcxJNHR8SE5mOfxjtVbnDZhPUNKomziJiBPbyk=;
 b=QOvoQ/dCMukJZOEnsd5MaYzkWc4bR2wD2EG6eyWUxjgr8vWBkCoKTBrQQh8Vrr48cUOhGu96bb3sqn7bMpuBXLeyCrXv26K8Q0YuUQ749R9rdsJl4Iu/xyI2BZuijHKzHRT7lLBykDHJQAqwZy66lMO8XuEw4CojpKRE1NsebtP+j29b2cWC54reRmAEVEEGxw6yLhGdDUY1ydACpFMI+f6wcesBIi/Pi6E5wpPXWcHCwgPK6SLzCldji6yyG9ZcPvvFGDwuI1L5AfMi9PfyysWF+BLaYOjtweQpcYXOSq622GaHFT+SuJf+sMSJV171sRmyUzif5PzHDg2PZ0NM8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzQRfpcxJNHR8SE5mOfxjtVbnDZhPUNKomziJiBPbyk=;
 b=JEi4t0puYHhslog71OAZKVpe/YNfMhaOPrGeTpYHbpCByF6zbCxwBe1N0Sf+DGqDTGmzOMiG9XvdLvXLo+aKucXSiIqOtUxJ1jJbdamCrPLt+NfQVFYCNzfRc76/umXrCrHf8KEbBiuuXzBSgB0VQ3lyDGYpI4U85Hcn6tjPjn4=
Received: from BYAPR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:74::29)
 by SN7PR10MB7076.namprd10.prod.outlook.com (2603:10b6:806:329::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 16:18:16 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::87) by BYAPR05CA0052.outlook.office365.com
 (2603:10b6:a03:74::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 16:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 16:18:14 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 10:18:11 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 10:18:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 10:18:11 -0600
Received: from [10.249.128.225] ([10.249.128.225])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A3GI6Hj411107;
 Mon, 3 Nov 2025 10:18:07 -0600
Message-ID: <486f2a39-90bd-493f-89ad-4f7060fc8158@ti.com>
Date: Mon, 3 Nov 2025 21:48:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v7 2/2] drm/tidss: Move OLDI mode validation to
 OLDI bridge mode_valid hook
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251028033958.369100-1-s-jain1@ti.com>
 <20251028033958.369100-3-s-jain1@ti.com>
 <5c080bb8-2745-4765-abc4-2a46ca40916b@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <5c080bb8-2745-4765-abc4-2a46ca40916b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SN7PR10MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 1015e645-38ee-4626-9a50-08de1af4977f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|34020700016|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHBxZFdGaStBbzVmeXI2WnJ2L0VDNW84RUIrM3E1VEpGUk9Tc2ZFVTJOcDBh?=
 =?utf-8?B?bS9oMnZLNDByMnErR1ZqVmRUNDQ1bXBQSGtlQ2R2Ulo5cEFNaExISTIrSmRT?=
 =?utf-8?B?TDFMeEZBL0xZT0Rhc0pCQnNSV2NzWjdBVnhLR3VDMHN3QUM0MlpwSU5iKzg1?=
 =?utf-8?B?M0dTUjB2UWRpMlVOcFE1d2l1NVVPTkprRDArR3pTL283TlQrS2pwblBxNXZ5?=
 =?utf-8?B?SU41cWFxVk5USEdaa2ZqWEs5ZjFtMDdsUmw1NHRGMDI1ck8veUEyVytIV0lN?=
 =?utf-8?B?YmxHb1k1MnpwSGdTTGVMR1k5RTdOdUkwRHZ6R01uZG13STBEVlRRWjUwaUFZ?=
 =?utf-8?B?V1A3T1NzbEYrOGMvY2pLS3hCcXFNeUlCVlMyMDNDZkNobHcwazY1ZFFoMUg1?=
 =?utf-8?B?cEhYVno5RnpKdEh3OHNnMDQxRVBwRHhUMjNiUUZ3NzhGMnJmYXptcC9OS3Z2?=
 =?utf-8?B?ZnZJZnN6dytJd3BUT2liRGF0V0ZvVG9zSXZ6NzRtdUhtRVh1RU80OWpzeTZV?=
 =?utf-8?B?ZlJLRlRKTmpxWHJPOWFuNUZiK0NUVHNxbXVrejVsTkdWMW1xK0twSUV5ckI1?=
 =?utf-8?B?WnlFOTRacVlOMnBtSDZjSWJ6MFMwR01FaUxobEZNOWhvTE42UEF4U1pSNDB2?=
 =?utf-8?B?ZVZ6dHByb2M1YTAyaGdrTXpWRzR6WkFCZXBKOUZpa2oyZmpGUEh2RjREZFRu?=
 =?utf-8?B?VE5nOGw5UHpuWWNDMFhUZ1VnNnBzQkVFZ2liM2ZLcTVNZGVGV1FNbUpIaEYx?=
 =?utf-8?B?czk4WkZFMTB0NXJrSW9CTHVnRmJxQW56YWZtQ0QzUzM2N1VuT1VLZmd1eVpG?=
 =?utf-8?B?enlQdWFFdUtTWXdGM3g0MTdxL3pxMS9hYmNHaWdLd1ZiY0NGOFpPTmRkYk5K?=
 =?utf-8?B?TUc0MWExclArOHVEOFdtRnhKZ2RWT3RFMXI2eHVOS1NIVXdjVE51bEJYanZY?=
 =?utf-8?B?M1NFd2NIdTNiQ2lUcHRrN3FOQmFrR2lQcVV4STZaZCtCZW9tS1dJU2JKYU1L?=
 =?utf-8?B?eWhoclA0dDFKbVV1TmVnVExEMjg2NDZTajdsL3lPOG0vaXZETUI0REpNcDE5?=
 =?utf-8?B?a091dTlRSWdTT0NIMDN2OUk4d2RyV1FuMWRpalR6VUVIejNCS1hZaEdCSU9i?=
 =?utf-8?B?RW1LVzk5WG54NGVxa25zczZQNG5QUER3YnNJNTlnKzRQS29ZbWJjdk5zbnI0?=
 =?utf-8?B?UXd4OWpsZzUvMGlWY2lLNGNzTCtyWjBGUVZtSkRpME40SGFpY2pCeFo1MC9o?=
 =?utf-8?B?bXVpOTBYYXM0TWVWeTNzK3N5dEZuand1bllQWmtaRGxRVFY0a3liNWxxNEo3?=
 =?utf-8?B?Si9FbHdvamJjSnJud1AydzMvRHRnVjFxMTFLUktTNld6T1hHV0FhcFN5VzZv?=
 =?utf-8?B?bzA4K3hOL0tSNStldjFhRmg2T29BR2I5WnJWTGZFUXppQWNCeWVIaG5jYk83?=
 =?utf-8?B?WTdDVkFBN1JQNVRMaG9PVVlRanlWRktHbUhueDdMMHRGbjh4cFB4VkJlb1Nx?=
 =?utf-8?B?UExOcHpEcWs5YkxtdGsrbWk5SlpPNmZZcVJFZWdHSndZRW9oZUpzL3NwVVhT?=
 =?utf-8?B?ZThZMWFSYWJFWTJ6V0tFMWk5Wm16S0IySnhiU1JxSDlFKzJRb3F1bEZGazJh?=
 =?utf-8?B?VmhFZmpDRGhaV2EwcE9JWjE5WGwxVU1oYnR0SGlDa2kvQlg0Wmw5cnlUWHA4?=
 =?utf-8?B?aXQzREEwUmdYUzlmVE9oTTRRNnp5bVF2eFE2dkhyTmNycXMxQ050T1hwQnF1?=
 =?utf-8?B?LzhEOEQ4WG8rWHIvL0ZodVRxMnBvcDZRLzM2TzRma0I3MDRUaW9EaU1JU282?=
 =?utf-8?B?UjdONGZ1WjU1UHJtSVhOU0VZdUpTVVhuV2s5OTIySGFqOWhWUStwWnVjaFRP?=
 =?utf-8?B?TE1zVEc1a2pCK2prWHZYbUZIWTlEdmtsQWF0Nm5BOUhOdWZCbjUydWpXcVhN?=
 =?utf-8?B?QXRMNEwwU3VjalR4dTVMVkdFdUJzaGJDUXJvRnJjSzNEMWx6UEIwckdKb3Ra?=
 =?utf-8?B?RGpNLzkyTXZDZ1lyRVJ3em4wa09xQlMvVm9jNUNtb2lleWkvTi85VVZIODZP?=
 =?utf-8?B?Y1RpSjVVc09tdjZ4TXlNdkhqeGtJZXN3V2dmZVpBNDJKRThsYlYrajlJRkNJ?=
 =?utf-8?Q?Y9Os8ZP4fPo/B6yNWLOlm4RMS?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(34020700016)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 16:18:14.8098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1015e645-38ee-4626-9a50-08de1af4977f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7076
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

On 03-11-2025 13:35, Tomi Valkeinen wrote:
> Hi,
> 
> On 28/10/2025 05:39, Swamil Jain wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> After integrating OLDI support[0], it is necessary to identify which VP
>> instances use OLDI, since the OLDI driver owns the video port clock
>> (as a serial clock). Clock operations on these VPs must be delegated to
>> the OLDI driver, not handled by the TIDSS driver. This issue also
>> emerged in upstream discussions when DSI-related clock management was
>> attempted in the TIDSS driver[1].
>>
>> To address this, add an 'is_ext_vp_clk' array to the 'tidss_device'
>> structure, marking a VP as 'true' during 'tidss_oldi_init()' and as
>> 'false' during 'tidss_oldi_deinit()'. TIDSS then uses 'is_ext_vp_clk'
>> to skip clock validation checks in 'dispc_vp_mode_valid()' for VPs
>> under OLDI control.
>>
>> Since OLDI uses the DSS VP clock directly as a serial interface and
>> manages its own rate, mode validation should be implemented in the OLDI
>> bridge's 'mode_valid' hook. This patch adds that logic, ensuring proper
>> delegation and avoiding spurious clock handling in the TIDSS driver.
>>
>> [0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
>> [1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>> Tested-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c |  2 ++
>>   drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
>>   drivers/gpu/drm/tidss/tidss_oldi.c  | 21 +++++++++++++++++++++
>>   3 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 07731b02490f..0c3337a7b163 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -1315,6 +1315,8 @@ static int check_pixel_clock(struct dispc_device *dispc,
>>   {
>>   	unsigned long round_clock;
>>   
>> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
>> +		return 0;
> 
> Add empty line here. Also, add a short comment what this check is about.
> 
>>   	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>>   	/*
>>   	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>> index 84454a4855d1..e1c1f41d8b4b 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -24,6 +24,8 @@ struct tidss_device {
>>   
>>   	const struct dispc_features *feat;
>>   	struct dispc_device *dispc;
>> +	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
>> +
>>   
>>   	unsigned int num_crtcs;
>>   	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 7688251beba2..d1a5fdac93ff 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -309,6 +309,24 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>   	return input_fmts;
>>   }
>>   
>> +static enum drm_mode_status
>> +tidss_oldi_mode_valid(struct drm_bridge *bridge,
>> +		      const struct drm_display_info *info,
>> +		      const struct drm_display_mode *mode)
>> +{
>> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
>> +	unsigned long round_clock;
>> +
>> +	round_clock = clk_round_rate(oldi->serial, mode->clock * 7 * 1000);
>> +	/*
>> +	 * To keep the check consistent with dispc_vp_set_clk_rate(),
>> +	 * we use the same 5% check here.
>> +	 */
>> +	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
>> +		return -EINVAL;
> 
> Add an empty line here.
Sure, will add and respin. Thanks for reviewing.

Regards,
Swamil>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>> +	return 0;
>> +}
>> +
>>   static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
>>   	.attach	= tidss_oldi_bridge_attach,
>>   	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
>> @@ -317,6 +335,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
>>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>> +	.mode_valid = tidss_oldi_mode_valid,
>>   };
>>   
>>   static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
>> @@ -430,6 +449,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
>>   	for (int i = 0; i < tidss->num_oldis; i++) {
>>   		if (tidss->oldis[i]) {
>>   			drm_bridge_remove(&tidss->oldis[i]->bridge);
>> +			tidss->is_ext_vp_clk[tidss->oldis[i]->parent_vp] = false;
>>   			tidss->oldis[i] = NULL;
>>   		}
>>   	}
>> @@ -580,6 +600,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>   		oldi->bridge.timings = &default_tidss_oldi_timings;
>>   
>>   		tidss->oldis[tidss->num_oldis++] = oldi;
>> +		tidss->is_ext_vp_clk[oldi->parent_vp] = true;
>>   		oldi->tidss = tidss;
>>   
>>   		drm_bridge_add(&oldi->bridge);
> 

