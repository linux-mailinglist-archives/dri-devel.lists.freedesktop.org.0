Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F76C51878
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B52B10E040;
	Wed, 12 Nov 2025 10:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NI8iF8lL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41DC10E1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwLlvYj16RF5SKGjwHhdNxFaQAhSdelMR4zH1TI8fE70mKzToPl6xbdEWvJUxm5EG83avmfQVnbiYG9y5Ubr1Ia3UEmlEpvWBkiww9ca8bVYsMg1OIuKpGJtsWOFhZ2QvywX7Ntqj1seCqkXqztLq3Zr6ucSogk2yk9CuLDqHOEjeN2Na1WcikndyVOqqNlT8TwxmpwvnMoJC0PQlF7sLlrn4a314Xf9iZ1NqU/N9B9/dfc3s8xHJ3Emr43CbCE59XLBGEXjNdOWfQuawWbzkrcD1jcQSND66+2Cmy2DQz/4xU3chGGnTUk7xOsG75lakxEa6QGa2RtOL3MjX9z/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfzyAAN7B0lzihRXdR9otvj7aD3JWia5OqIPuRqC0X4=;
 b=h3CIrqimQichOwV99yqnNXSuQYAHqzrgZXnrqeryRTF+7od/vJLMW1Z8kSJOJFx9HZAb7nbYtZKCycm/2Gwjprz4j0oAWBJn48dZwmnr11U2UqFMS+K1Rl0reCmHtN2JGqyRWGOEU06BRJpeB5IJr8caszpx0Xy5xRp54ood4UtIQqTO2v/vALRFRg2ZWjxsg7+q0aa2sjaGQ+IXSG/YEgNf9PkJggQ93I13b1KN+QvyOM1ZQJckp9zj3PdmwG48DhnNYQWO5OE1hOfML2bryV/2zqxK/IkVSfG5GI5Uf2k2YfCsR77Jqg/Yz4M3If/GGHQQ8rKEntx6rNYQLy5jhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfzyAAN7B0lzihRXdR9otvj7aD3JWia5OqIPuRqC0X4=;
 b=NI8iF8lLdQ3FzIbArcXvdz3xVQlG3iBoXIKX5KrrzrzPDxWBuKldD7OpbFJrPM3IGhoQ+aY5CULyB9Y7/zYKSs4g4PU8ExtrLkBb/pvB09x5m89VKDW2hahYjXEeHxo1LdDSszDnwFTI+KNkIVin8Csgi7BUQbrWn9sQdxQyjLU=
Received: from SN6PR04CA0088.namprd04.prod.outlook.com (2603:10b6:805:f2::29)
 by CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 10:00:29 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::6a) by SN6PR04CA0088.outlook.office365.com
 (2603:10b6:805:f2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 10:00:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 10:00:29 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:00:28 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:00:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 04:00:28 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACA0NOV2468286;
 Wed, 12 Nov 2025 04:00:24 -0600
Message-ID: <d0ab6151-3ac7-4366-bdae-0b3c58518fb9@ti.com>
Date: Wed, 12 Nov 2025 15:30:23 +0530
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
 <864e6b80-2287-4473-afb8-c1ba29613067@ti.com>
 <8f8b63cb-6ea4-4620-afec-5f4f228eb743@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <8f8b63cb-6ea4-4620-afec-5f4f228eb743@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CO1PR10MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bee8580-97b4-47cb-75c9-08de21d24f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNqUVRpZVgyUTlIVldhT3M2RlZyV3A5N0h2K2EzaVl0NjJSQVhYODhzTzNv?=
 =?utf-8?B?OEFMOVlOdFZhYWp2bm9rTGxFRDMrREVjNXh2YlRGMzRaeldCaEszQ1JTNHlO?=
 =?utf-8?B?ejc3RWNnVitudTAzYmp6VHplczZPNmFuNXVIdlo2YnpwbEZoMzJWTmpIclR0?=
 =?utf-8?B?T3VTYWRzNGQ0c3FVZWxPVEdaQUk5NEk2TWRjQXNqVzZob0hBT2wxYU1DTkhV?=
 =?utf-8?B?VGp5MHdUTGlZSUVlNTRIQjRPbER0K2xnWmtHZkRMUE5KN1VZRnVIaTh4Kysv?=
 =?utf-8?B?VlR3SjdSU29xOFNsMXFsS0hRNFExK2hXRUtnNXlsMmpOaUFzNDFxaTBNVVNh?=
 =?utf-8?B?T0tzTzFRV2NoRVJnUTlVdGtJWU5QN2IxNGJ4QUE2aEl6YVpKRExxOEJ1cWxD?=
 =?utf-8?B?UlpYa2VCQlZsNTJxckplc3Z6YXRCQlNhckhiK0tnUVRWMzlqbG1rNGxnWld0?=
 =?utf-8?B?QkNtQ3I4TWExakhZbnlabzVnSXNHT1J2OEJwZzJkcTlMVW1Jb1lLY01nT21x?=
 =?utf-8?B?Lzk0cmRHSDF0YkNkUElYaml1cEl6dU82K1hCL0hkTFlGakZQK1FEcFBOMi9q?=
 =?utf-8?B?VUZIUzBwWGc2aitieTU5ZkF0RXAzUUdwQUU4UENxVWhnRnVDVXZCbGkzM2RY?=
 =?utf-8?B?NHBDUGhKWnJ2dTQ4aDhLWTN0R2xzRFRleFpWNm5pWWxxeUd4Y1BHNzhwZmY3?=
 =?utf-8?B?cG5xdk5KZTNEenBxRUdJY1NCZEpCdUhsWWIwaHV4OGY1ZHlJV0lTRGlUTkQ2?=
 =?utf-8?B?TExzcEVGWmdLdmM0VTFCOU4rU2IrT0NhbFhSajArNzFMZnJPM3JScXVIRVJk?=
 =?utf-8?B?N0gxRlVSOXF0TmdZVlhrZ3ZFTXBkSEROR1NsQmEzWnZtdkw1S1hxUWFPdzRX?=
 =?utf-8?B?N3k5VVM0YytwNWg3WExVUjNWbXJQWVBWZnBQZWsvNklUaHFEWC8vSlNIaVdq?=
 =?utf-8?B?amZNSXhWUkhkYnFabGs1WU1UWlkyZTRsVGxoL2xpWTQ1Z0MwNTg2dGFLNG9z?=
 =?utf-8?B?QnkzMXRLUXlBcVBFcHhmempwQTEzTjBRNlpmY1h5ZGg1M2djQ2lVeGtBTXJu?=
 =?utf-8?B?YndwOE1YVzlHeENkYlpNWDNkQURyaVhoSGpQQys2dWVZbGpmMnE4ODY3cWZq?=
 =?utf-8?B?ZEtGaGlCVGlnK3F6cFgyWU5PMkd0aUUzWEVISXdOUXlZRFpLVWNMN1FqZ01P?=
 =?utf-8?B?Y0JDUEJlMDh5NlBiVkxtMVlhNGNINHZaZUoyUGpORVpjNHM0d0pHQmJZM3h0?=
 =?utf-8?B?aU5tZkpwejhJRlF6LzI5cEMwa2NpSTFGSVdvY0YySzlRdGFyai8xTWN3WlRZ?=
 =?utf-8?B?VTJvOWNCemM1a3FGdStnWmI2MDQ5em1zQ3I4MHo1UkhoOS90dDZ5eExoUDdj?=
 =?utf-8?B?NVlxSThDb0dVZmNvRFdCNFBHRWVVWUYxc1pEdlQvcTl5eFBvOWdlc2pnWFhT?=
 =?utf-8?B?c3ltNSt0U1FPSVNTdnVXbERwM1VPdksxRHhBY0pVZGt1akYvVEZlUzd2Qi9K?=
 =?utf-8?B?SjEzK2ZwY3FTdDRucnA5WXNWMFR4eXNzZjVhUFFjM3JEcm8rRXVYeGUvMitw?=
 =?utf-8?B?ZUFqVmp5N2NlT3Bad09aUjJ2cTF6NC94ZmF0MUthVWsyeE85TmJlR3FBNVJv?=
 =?utf-8?B?OE4ybGE1djJwZXpiQk1rZFE3WnAwMXVBSkZRcjBqaUxhZTFxNkhVRS9KcXpx?=
 =?utf-8?B?djBWY0JPcVBXSHZkMlp0cVBrVU9jVkJneU1mNXJOQ05VVVhTSEp3VDFlK2Ro?=
 =?utf-8?B?S3p3RVZCZXFMRm9YZEZiTWFuVlorampjUmI3bUFNck0xcG1lZHNxb1NpWnc3?=
 =?utf-8?B?TEpwUDZlSWsvTlJnQVJPZGoreDdVTXNtK0lyTEVvMmM3ZHlOZDVVdU84YmNv?=
 =?utf-8?B?QlY3ZDRnejN0MGhXS3NhMXlFSzJJUWpjbTNzOEVHbklLcE1ueDNuNEYzYVcx?=
 =?utf-8?B?SEpNVHFpRUM0cVp6RTFEYVVJSmFwOWloTFMyWGsxbTkxNTNqb1hjMmlGUjR1?=
 =?utf-8?B?UE00MlZnUXJlazl6ei9BWmEzaWtMeXpGa0VMUFloaHNibHY0bEh6SGF5VHZT?=
 =?utf-8?B?K2V0ZE8xVXBGV1k4bHlYbUR2SUxtQXVFdk4rVFo4M2Y0NlMvNWxtMVZpdlRS?=
 =?utf-8?Q?ArXkNJ+kmsSfd3qufetESvRrQ?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:00:29.2804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bee8580-97b4-47cb-75c9-08de21d24f78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4769
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

On 11/12/25 15:21, Tomi Valkeinen wrote:
> Hi,
> 
> On 12/11/2025 11:43, Swamil Jain wrote:
>> Hi Tomi,
>>
>> On 11/12/25 15:10, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 04/11/2025 17:14, Swamil Jain wrote:
>>>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>>>
>>>> The TIDSS hardware does not have independent maximum or minimum pixel
>>>> clock limits for each video port. Instead, these limits are determined
>>>> by the SoC's clock architecture. Previously, this constraint was
>>>> modeled using the 'max_pclk_khz' and 'min_pclk_khz' fields in
>>>> 'dispc_features', but this approach is static and does not account for
>>>> the dynamic behavior of PLLs.
>>>>
>>>> This patch removes the 'max_pclk_khz' and 'min_pclk_khz' fields from
>>>> 'dispc_features'. The correct way to check if a requested mode's pixel
>>>> clock is supported is by using 'clk_round_rate()' in the 'mode_valid()'
>>>> hook. If the best frequency match for the mode clock falls within the
>>>> supported tolerance, it is approved. TIDSS supports a 5% pixel clock
>>>> tolerance, which is now reflected in the validation logic.
>>>>
>>>> This change allows existing DSS-compatible drivers to be reused across
>>>> SoCs that only differ in their pixel clock characteristics. The
>>>> validation uses 'clk_round_rate()' for each mode, which may introduce
>>>> additional delay (about 3.5 ms for 30 modes), but this is generally
>>>> negligible. Users desiring faster validation may bypass these calls
>>>> selectively, for example, checking only the highest resolution mode,
>>>> as shown here[1].
>>>>
>>>> [1]: https://lore.kernel.org/all/20250704094851.182131-3-j-
>>>> choudhary@ti.com/
>>>>
>>>> Tested-by: Michael Walle <mwalle@kernel.org>
>>>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>>> ---
>>>>    drivers/gpu/drm/tidss/tidss_dispc.c | 86 +++++++++++------------------
>>>>    drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
>>>>    2 files changed, 31 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/
>>>> tidss/tidss_dispc.c
>>>> index d0b191c470ca..b11880178cba 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> @@ -57,12 +57,6 @@ static const u16
>>>> tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>    };
>>>>      const struct dispc_features dispc_k2g_feats = {
>>>> -    .min_pclk_khz = 4375,
>>>> -
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_DPI] = 150000,
>>>> -    },
>>>> -
>>>>        /*
>>>>         * XXX According TRM the RGB input buffer width up to 2560 should
>>>>         *     work on 3 taps, but in practice it only works up to 1280.
>>>> @@ -145,11 +139,6 @@ static const u16
>>>> tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>    };
>>>>      const struct dispc_features dispc_am65x_feats = {
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_DPI] = 165000,
>>>> -        [DISPC_VP_OLDI_AM65X] = 165000,
>>>> -    },
>>>> -
>>>>        .scaling = {
>>>>            .in_width_max_5tap_rgb = 1280,
>>>>            .in_width_max_3tap_rgb = 2560,
>>>> @@ -245,11 +234,6 @@ static const u16
>>>> tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>    };
>>>>      const struct dispc_features dispc_j721e_feats = {
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_DPI] = 170000,
>>>> -        [DISPC_VP_INTERNAL] = 600000,
>>>> -    },
>>>> -
>>>>        .scaling = {
>>>>            .in_width_max_5tap_rgb = 2048,
>>>>            .in_width_max_3tap_rgb = 4096,
>>>> @@ -316,11 +300,6 @@ const struct dispc_features dispc_j721e_feats = {
>>>>    };
>>>>      const struct dispc_features dispc_am625_feats = {
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_DPI] = 165000,
>>>> -        [DISPC_VP_INTERNAL] = 170000,
>>>> -    },
>>>> -
>>>>        .scaling = {
>>>>            .in_width_max_5tap_rgb = 1280,
>>>>            .in_width_max_3tap_rgb = 2560,
>>>> @@ -377,15 +356,6 @@ const struct dispc_features dispc_am625_feats = {
>>>>    };
>>>>      const struct dispc_features dispc_am62a7_feats = {
>>>> -    /*
>>>> -     * if the code reaches dispc_mode_valid with VP1,
>>>> -     * it should return MODE_BAD.
>>>> -     */
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_TIED_OFF] = 0,
>>>> -        [DISPC_VP_DPI] = 165000,
>>>> -    },
>>>> -
>>>>        .scaling = {
>>>>            .in_width_max_5tap_rgb = 1280,
>>>>            .in_width_max_3tap_rgb = 2560,
>>>> @@ -442,10 +412,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>>>    };
>>>>      const struct dispc_features dispc_am62l_feats = {
>>>> -    .max_pclk_khz = {
>>>> -        [DISPC_VP_DPI] = 165000,
>>>> -    },
>>>> -
>>>>        .subrev = DISPC_AM62L,
>>>>          .common = "common",
>>>> @@ -1333,33 +1299,54 @@ static void dispc_vp_set_default_color(struct
>>>> dispc_device *dispc,
>>>>                DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>>>    }
>>>>    +/*
>>>> + * Calculate the percentage difference between the requested pixel
>>>> clock rate
>>>> + * and the effective rate resulting from calculating the clock
>>>> divider value.
>>>> + */
>>>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long
>>>> real_rate)
>>>> +{
>>>> +    int r = rate / 100, rr = real_rate / 100;
>>>> +
>>>> +    return (unsigned int)(abs(((rr - r) * 100) / r));
>>>> +}
>>>> +
>>>> +static inline int check_pixel_clock(struct dispc_device *dispc,
>>>> +                 u32 hw_videoport, unsigned long clock)
>>>> +{
>>>
>>> Ah... Sorry, I was quite unclear in my comment to v7. I did not mean
>>> mark it as inline. I meant "move it inline", i.e. move this code into
>>> the dispc_vp_mode_valid function. This is just a few lines, and having
>>> it in a separate function makes it a bit more difficult to understand
>>> what are all the checks done in dispc_vp_mode_valid().
>>>
>>> I can do that change when applying the patches, if that's ok for you.
>>>
>>
>> Thanks Tomi, please do the required changes.
> 
> Actually, now that I was about to do the change, I realized the next
> patch adds an if check here. So maybe it's better to keep it as a
> separate function. I'll just drop the "inline".

Yeah, I think we can move it inline and accordingly modify the next 
patch also. But I think having a separate function makes it clear that 
we are skipping check for VPs with external clocking and we are having a 
similar check within the bridge driver. Please drop the "inline". Thanks 
for the re-work.

Regards,
Swamil

> 
>   Tomi
> 
>>
>> Regards,
>> Swamil
>>
>>>    Tomi
>>>
>>>> +    unsigned long round_clock;
>>>> +
>>>> +    round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>>>> +    /*
>>>> +     * To keep the check consistent with dispc_vp_set_clk_rate(), we
>>>> +     * use the same 5% check here.
>>>> +     */
>>>> +    if (dispc_pclk_diff(clock, round_clock) > 5)
>>>> +        return -EINVAL;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>>>                         u32 hw_videoport,
>>>>                         const struct drm_display_mode *mode)
>>>>    {
>>>>        u32 hsw, hfp, hbp, vsw, vfp, vbp;
>>>>        enum dispc_vp_bus_type bus_type;
>>>> -    int max_pclk;
>>>>          bus_type = dispc->feat->vp_bus_type[hw_videoport];
>>>>    -    max_pclk = dispc->feat->max_pclk_khz[bus_type];
>>>> -
>>>> -    if (WARN_ON(max_pclk == 0))
>>>> +    if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
>>>>            return MODE_BAD;
>>>>    -    if (mode->clock < dispc->feat->min_pclk_khz)
>>>> -        return MODE_CLOCK_LOW;
>>>> -
>>>> -    if (mode->clock > max_pclk)
>>>> -        return MODE_CLOCK_HIGH;
>>>> -
>>>>        if (mode->hdisplay > 4096)
>>>>            return MODE_BAD;
>>>>          if (mode->vdisplay > 4096)
>>>>            return MODE_BAD;
>>>>    +    if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>>>> +        return MODE_CLOCK_RANGE;
>>>> +
>>>>        /* TODO: add interlace support */
>>>>        if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>>>            return MODE_NO_INTERLACE;
>>>> @@ -1423,17 +1410,6 @@ void dispc_vp_disable_clk(struct dispc_device
>>>> *dispc, u32 hw_videoport)
>>>>        clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
>>>>    }
>>>>    -/*
>>>> - * Calculate the percentage difference between the requested pixel
>>>> clock rate
>>>> - * and the effective rate resulting from calculating the clock
>>>> divider value.
>>>> - */
>>>> -unsigned int dispc_pclk_diff(unsigned long rate, unsigned long
>>>> real_rate)
>>>> -{
>>>> -    int r = rate / 100, rr = real_rate / 100;
>>>> -
>>>> -    return (unsigned int)(abs(((rr - r) * 100) / r));
>>>> -}
>>>> -
>>>>    int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32
>>>> hw_videoport,
>>>>                  unsigned long rate)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/
>>>> tidss/tidss_dispc.h
>>>> index 60c1b400eb89..42279312dcc1 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>>>> @@ -77,9 +77,6 @@ enum dispc_dss_subrevision {
>>>>    };
>>>>      struct dispc_features {
>>>> -    int min_pclk_khz;
>>>> -    int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>>>> -
>>>>        struct dispc_features_scaling scaling;
>>>>          enum dispc_dss_subrevision subrev;
>>>
>>
> 

