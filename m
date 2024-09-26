Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09378987492
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2EA10EB4D;
	Thu, 26 Sep 2024 13:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YqEzHYfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8197510EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0YkOLBdKZPfDMgETgnoui0NM6t6zccBw9efxencYNckQt9PtS91U5bvaRToyWlGdoiOn7rjzI/asTjf07gqI1WbSXtpr8mCaxkrp3xkxZs4PMrM8SZS84eCc/yM0/PaPeaLcrJZT2q5mspfMjF5GdB2vmYu4Cs0vZKOmnCWrpJuetYEJMCarU3w7FPK0YMLHyWPY0/aXtLv0rhZG6ycVa737ArQVIPrSi09vp2UwyxxV/O3bN4B9KBwsGgOxtdsaLwhNmDnAgSHk+kDJk8pqxZPa/YRAqdMD5F94WCeM4IgX340SvodDGxKBJxTZDnz3p00vQW3VFfz7VIkhXsnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NFeyxWv6S4WCTwuw7D5Ej7TldaMiTAMiZBbqMbOzU0=;
 b=wikUh4b0R7i9Sk4VEbEZ99wKo/7rw/i2Yplww3GomELbWQmu++u7RFNQbaMe8N8fYZ+Hmi4qe9rTZNzj/QLRnNF8dUAMMQeTSbnT/EhYAd1L0WQZoIoPLWndSzo4nHdfbqxrUPuAtAFCqLEPaHKHAU9UrYPzOfMYl6iSFidz7DhzCMAmpFYHnjaaS+rVfaeBZ/gKr5PyAlMST7YQOEtaW2HsZyMGtWue4m3+NynQPeatNGuicWtqP8xPmnRW2q7JuPyE/A8eydqYuFGOUgMoclbbLAbqDvRu/yXwnKB5TT1UxHhvWT6ALG+55MeK6gBUaRaecqvg1GMh/xZPbRvDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NFeyxWv6S4WCTwuw7D5Ej7TldaMiTAMiZBbqMbOzU0=;
 b=YqEzHYfKpziJjAH3XkIpJutse2uzLvlGvcN9ULgYV8UW0KYjQef1l+DxouIbloLbitd37UgH3zaNUc9XMQOOWyfrFJjCUfS1/mbi3YPCci41qhECZb8tQ+V1ExdcErgEylyxUM9M9+/xEJBFKcbgQpNbXB0ZgUbRzOgg0mcjSto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 13:39:14 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 13:39:14 +0000
Message-ID: <4c0879cf-d738-4651-8a06-6da0bf2c2c9b@amd.com>
Date: Thu, 26 Sep 2024 09:39:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Print bad EDID notices only once
To: Andi Kleen <ak@linux.intel.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20240926133253.2623342-1-ak@linux.intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240926133253.2623342-1-ak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0033.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::46) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 63708c2f-d7da-4572-536f-08dcde309c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTJwVk5sZXN1YlBpQ1ovSC9rN2JHNjk4TFFUalFLSy96Mjh5ejN4U01qUjN5?=
 =?utf-8?B?NVVJdG1jUkVYOG9rNzhVL3RNRlFEZjJ1UnM0SS8yT0ROb0ZnTTBaWVZIS3FJ?=
 =?utf-8?B?QWY3cDZkeEErS1VCblNBZHYzWm1xckJHdTNzMG9sRzdTSXhkUHFaTnVwSGIy?=
 =?utf-8?B?QmlocFhQUUM0bGZrakZEckdKOWt0UXlMYXZjUmI5V2xDaE5RdnZzek9Vb21v?=
 =?utf-8?B?M3FMZWF5QldCOFdsUzhnQ2prMWNsdU51UU9ZNXJTaGRzTURKUHlweFJsOWlj?=
 =?utf-8?B?YkJydkxHSlZVY0VhamVEWFBhV0hBOWZZSVpVd0Z1by9BTzM0dkZCNjdTbTNM?=
 =?utf-8?B?YUxhZHg4VDI2Z0tKWU9QV3FaZzR2RERCVC9BbEliQkpvVERUVHAxSW1vUUh1?=
 =?utf-8?B?TmlaZVJMbEc2dlo1Qi9Qc3dRVDNSREtnbmxUTFE3ZWE3OWNtNnY5Y3M1eGcz?=
 =?utf-8?B?T0lVNVdhSTZVUmFlUkFiSk1YSzVScE82MncvU1V2L1Y3eVQrYndXcHAzSDRj?=
 =?utf-8?B?TlRpSC9TcUVFRW1EYS8vdW9qcmtrNDM0QmxFL1IxN004eW1SZWFCaDJRRHBS?=
 =?utf-8?B?UzNKNkJQR3Z2M1dkWHEzWDd0WXI5NC9kaGhVak9wajhPWXhJZ0Nrd0hxenhn?=
 =?utf-8?B?WWZ0eE9CR0N6T0p4WFZoNE05Uy96aUViTDQxVVhjVGR1MjlZSE9oREE0V05a?=
 =?utf-8?B?UGtSUTk3b3FTU0JWRnJQVkFmL1BWS0dreW5ySHJwbHlGMG10T0lsM0t3bW5X?=
 =?utf-8?B?QytHMzVJL0NOUGZlWjkwRFFjR3pQMkxHYW55dC90WWprYnhRM2JSUmhSZmxN?=
 =?utf-8?B?ZkY3VkhHc3NORkNvRFJweXBRY0FVeGQybjQ0QVE4Z2lzQUludHlkQklzdm95?=
 =?utf-8?B?N2M4NDZYWGMwbDN1VVZ0aGVtUVo0enJ6OUgybHZBM2Y4Zjl6czJHR1FSNndQ?=
 =?utf-8?B?cnFqYkZEZnoxd0gzeUVJTmNIOWczWVN2alNBSG44czY0Qk1CZCtYbEFqT2pi?=
 =?utf-8?B?K2ZJM1V4bWxkUUpLc2dsaVF6MlNURmhFK2dmUEdtbXVxYXJnSkg0YUFKWk5I?=
 =?utf-8?B?TGlhUUYrVmcrdTJidnZoaElrU29hNUd2bG9QTHptQWUyMk85ZndQLzM1UTBC?=
 =?utf-8?B?UkR4U0UzTVdicWpRRlI5Sk9pRkJOS3lvb3krY1dQdFhKYzhrZVVaRjRTTDFL?=
 =?utf-8?B?L2ZZdlVaQ2YyUmpNVzhueU01elQvQWNxL2ZvMFFham82MzhQRldtZDZVRGV4?=
 =?utf-8?B?R3dBbXdhcGR2THdnbXhQOGpUMzNtWE5obE5rS3FvQVlEcmwxRnJMME93UEo2?=
 =?utf-8?B?eUJhYmNvRlZJZVdSbnljRGJ1QVN1VGVpNHA1S2hoNDgva0lBOTBjRDA4Rzlq?=
 =?utf-8?B?N1o5MHd2OFMxaFdiVUdjV0NRdnBHdmkwVXBTaWdBUzMxbUc4VkJwT0pHMW1J?=
 =?utf-8?B?SHo3WEJFZTVIVEtSMlJLY0lZaVZGU2o3NkFodmMrZ2R6Q2RyejFqMkxKVHpm?=
 =?utf-8?B?WlM5SFB4OUtaNXhHTm9hVnNHcEswV24wWENsdlF2bmRTVHpVN05uTDNodEpt?=
 =?utf-8?B?Qyt1S01yY0hvZjNVV1l2akpqcFg3L2lTckpNazRqcHM3MWV2SFlvSEdMSzEx?=
 =?utf-8?B?aitvTG01aFBHUTFoa1R6Wk9kV05mdHRoQzRGSWljaFlPUEdvRUpGV0lGTHBT?=
 =?utf-8?B?SDBsZll1MnNJdGtiOWxpRnZyMjlqd25YdGdiQ2YyS2VtYU5RWU5ycGcvZGkz?=
 =?utf-8?B?Vi8wOFJWWVdBWEp6NWlzUDZpTGJhU0xsTVNWd2Y2eXllT1FtOWw4UWVlSGVD?=
 =?utf-8?B?Y1VWdWhwbmdoV09QUnlYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0NMMGhkOFpjTWp5RUhWc1JOL1dabGtZNUFqdTd5clN5WlZGSUQ3OG1sS0h3?=
 =?utf-8?B?QVVsS0FMRDBaV29nSWl6dmc3dVNjMXpnVFg4dFFDSGRsR1pqNVU0UERPL3BL?=
 =?utf-8?B?MFo2SEJTYzlrdGw5eFBOcTBlZmhFY1VXVjdmakdXeXlNSjZqdUszYXgrU2Iw?=
 =?utf-8?B?VXExV2NtUWlkSkdibjhjb3JCMDhLSFU4RE5UV2JaTlVRenFKT1Zwa3UvZnZT?=
 =?utf-8?B?YUU0M3pqSDFkMDAwMUsxRCs1K1dkdkNmejltUmg2UUNGZjZOendZMm1PSXZB?=
 =?utf-8?B?ejhMOEF4Mno4ZjZyYktiTDh3M3BJYXo0RTd6SzFhSFRIOU55TnRrN2NuQVh5?=
 =?utf-8?B?Sms5ek4yeWhqWjRqalNBWUpYdVlYdGh5cWh4SlA2c2hvMTBXRHBISWJQVGNy?=
 =?utf-8?B?Z0RQVEhPOWk0emR2eHErdFpzQm5sd0hyYkxVUTA0MEpZMWU2bzNjRnRNUEJ4?=
 =?utf-8?B?Um8rNVI3dERDbnR0VlZyTlZuTVVzVHlUQ21adWtYTHUrajdIK3laQ2ovRWxk?=
 =?utf-8?B?RTFrK0ZjOWwzVllFTXpHanA5QXc4MXNYd1c2R0pHRVBncjBQYUZlTWFOSUlV?=
 =?utf-8?B?NksyK25QVnVscTlmU2VqczdURHFUVkJVVFN1cjMrRXgrMkxzT0phVW9Ha0V4?=
 =?utf-8?B?M0pTZXd6M2g2WmIzV09TZnZIcEo1NWNTVWxvaVVZOVFuN3RVL29jTmtUTysv?=
 =?utf-8?B?dmRpVjk4Rm5HM3dHUlU4YSthVnVUV3BuTk95d0lFVlJRb3I4elVFSVR3T1Nt?=
 =?utf-8?B?UWY3YzlyVmxMNUtPNkxlWmwyL1JyekREb2tYY3BSRmtrWGpVdGxOU2FyWmxG?=
 =?utf-8?B?cllmd1VJZzhrbWV3M09yMnVzZEVtOXp5S0tLZnJTUWdVelhnVitWRkNJTjcz?=
 =?utf-8?B?eUdibks1eUd4bEdaYldFRExPZ3BaYkVsYXZMcHVtc25qdkxGeHJBejZiVFVm?=
 =?utf-8?B?Zzh5LzRseUdmS3QrUHNubk5RWTJ5cUErNk5vTnZKTmdvMk4rK2xIVUVBWmJT?=
 =?utf-8?B?eHYydGZvQjJEN1QvWEU0bFd5RlRlYm03ekorbEJjYmVnS1JMVTFRUzhwR0E2?=
 =?utf-8?B?RjZjVkxORmNneTlDckJEQjFzK3VNa3ZML2lkY1FCazc4UHlJR01BWDBtTlJq?=
 =?utf-8?B?dWRiRk4wdzNwM1F3RXU5bnN5ZnplZGVyY3g0bm5vbUdaTkREblRnWSs3SVNm?=
 =?utf-8?B?R3lMMTBaTHhPYWxKK0R2SThteTlWZXk1R2UyQlQ5dVA3VGxCR3NsN0NjWUx3?=
 =?utf-8?B?c3p6eTBRK0REMWNNRHBuWkRlbE5UZkZYMWlXRGpIYXdacFgwdHNSNjBRR1Zo?=
 =?utf-8?B?MWxicS83azBTUzZlSDgyZ2xKWlBaTWxYK1RmL3k4L2FXb2lGN2I5Q1lKaTJq?=
 =?utf-8?B?QUdiYWVkMjk0dzBXdFYyaUJhVGNpYUZwT3lSWmxzS2lLWmF5cHFYZHlab2dj?=
 =?utf-8?B?TnNkNHBCaHFCSEdiYmkxQnVhMUNaZVMvL1Y0Um5KMkZvckJJeTc2RmJqQlZK?=
 =?utf-8?B?R3ozV0dZUVlDc05YRFQ2ekRadU9kL2IvSmdjYVhhM09qYVc1aUJwWmp1K0tp?=
 =?utf-8?B?VHc1WUxZcFd2UlY0QWd6VXBoUGhFMXZMNCtYS1cyYk81SnRnZ0VqTElaVFdF?=
 =?utf-8?B?S2V5SU5ZL2dwZHFldjIrV2xwS0dhZ285Ykl5dnE5VlphQVBIYjZrdFpFbjMr?=
 =?utf-8?B?UDBLRXdNRWhBbnZ3UTdtQjB4RVhML2tZVHdWUXRNQzhwcXlMc2lESWxvTUky?=
 =?utf-8?B?N1VmNU5nMFJBV1hmS3FJa3Ztam9SMzJ3NGtIVzVnbjdlOU5aVjdReWd4UWds?=
 =?utf-8?B?Q3Bmb2FpbTN4ZXNTYVRhVHpicHlHbHRsM1A3SEhVL3ZOVE5YZUhsdituQkNY?=
 =?utf-8?B?ZktVR2dGL01WK0JKYllIcmZtcmhTMFdaYXZ3ZzlpV3pud0F0T3BHUUptdGdR?=
 =?utf-8?B?Q1MrQWFGWmlRY3VKSzUxNEIxcGFrYUpONHQ3MGdTQjNWeUx0QmZXbUx5WUdo?=
 =?utf-8?B?NlprUlFnRlYybnRNeHJ0NmRCRkhCRkVMNVFIcy8rQ09YeWNYQXFpTlZDRjRL?=
 =?utf-8?B?UW9waktLemRiS3dBb1Q3RjRhV0RaT0VyRmJ1QXZaNjhjMjQyVE01SlpTSDd2?=
 =?utf-8?Q?O+bTvvBIt9jsHQehBkRjoYkSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63708c2f-d7da-4572-536f-08dcde309c89
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 13:39:14.6780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGArFbXybc4vue90PDgH7pzUVc2PdbPok+D39YstlZ8cmfAeTg+MNLjxxCZKzCOAf8tPSSYPiaadatZEmxOixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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

On 9/26/24 09:32, Andi Kleen wrote:
> I have an old monitor that reports a zero EDID block, which results in a
> warning message. This happens on every screen save cycle, and maybe in
> some other situations, and over time the whole kernel log gets filled
> with these redundant messages. Printing it only once should be
> sufficient.
> 
> Mark all the bad EDID notices as _once.
> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..d6b47bdcd5d7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1916,10 +1916,10 @@ static void edid_block_status_print(enum edid_block_status status,
>   		pr_debug("EDID block %d pointer is NULL\n", block_num);
>   		break;
>   	case EDID_BLOCK_ZERO:
> -		pr_notice("EDID block %d is all zeroes\n", block_num);
> +		pr_notice_once("EDID block %d is all zeroes\n", block_num);

It may be a good opportunity to switch these over to drm_notice_once()
instead.

Hamza

>   		break;
>   	case EDID_BLOCK_HEADER_CORRUPT:
> -		pr_notice("EDID has corrupt header\n");
> +		pr_notice_once("EDID has corrupt header\n");
>   		break;
>   	case EDID_BLOCK_HEADER_REPAIR:
>   		pr_debug("EDID corrupt header needs repair\n");
> @@ -1933,13 +1933,13 @@ static void edid_block_status_print(enum edid_block_status status,
>   				 block_num, edid_block_tag(block),
>   				 edid_block_compute_checksum(block));
>   		} else {
> -			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
> +			pr_notice_once("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
>   				  block_num, edid_block_tag(block),
>   				  edid_block_compute_checksum(block));
>   		}
>   		break;
>   	case EDID_BLOCK_VERSION:
> -		pr_notice("EDID has major version %d, instead of 1\n",
> +		pr_notice_once("EDID has major version %d, instead of 1\n",
>   			  block->version);
>   		break;
>   	default:
-- 
Hamza

