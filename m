Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDA8C8785
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AE110EED7;
	Fri, 17 May 2024 13:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="utpQkopu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D850810EED5;
 Fri, 17 May 2024 13:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUBbPJYOlWsPt4NR9cAFc3mrbo2zq71Ui4zi/V2ULMCQJ/P6rctPOlcXge4TvOHoljPoF9fZAaFzRD+icToFmu9mg1zJFmyNXZ7W2bNcLjHx0ioeG+uSippRudM66SGv7MU/ui04jnkEgUjpofLVydCBLDuMMaZ+6rqJRAB6+nuSNYfsPjUFa0c5///BVI99ioxWobwudn0OiSdsaLLH4CkY3RRqZSGeRcozMWszRiw4pyRyT28Q8kFmg8XqVwFKhRGMz/rGqOvxNp5HQH3oJvXOA3Xru51LGTRH/siZVG5xrenb733kjfq65sSBOiz0R71QBQvi92lFboYxodCT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWVbRcUWVf2DacWtGLKPeCRWhOHNrHjAyasEQJmXq38=;
 b=eb6ATBrSE4g1mqVxxewgi4z1ajRNoamhbR1/AQzJm4P66fM/IysKIwbQcAVcdL2bQ0pBZSrdO6IzVZ+LBmsNX16xua36hvfRKdI96j6cjLf5CVnlvxfW1JG/6fuoojresbAWNO4WfAPCRUsHvK2eIYENaQMLsVSCYW6ngcw+dh946hCHa3Kc4/iJEFV8YIEZD76sQ9pX1kSm5I7IaihwfebkRwFvXJAYdItUEXElNTr23cXXVNdGBlP/p/TXmJMx4dtWSBm8EfeazbBqr7y0SxAgvAxjABDjGs0MGtOjY159pytcelYFhHeHsWVkB0digXa8Tu+Yc5J9p7gpm7uCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWVbRcUWVf2DacWtGLKPeCRWhOHNrHjAyasEQJmXq38=;
 b=utpQkopuDwdLyio+CXOC6vieK6dV/oRGEmWXp71ybO2rjn3IWNXFLbVXc+HW+4dJ+H8alaByLycL64rshUdKwzZcTimyJH1djezHTPU2NjcPhKYvoIdy4wxwGTm2SQDJ0be3vPUFOKIzSSrClGILoGolPNDQLT7rqvTSSRX2vvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.58; Fri, 17 May
 2024 13:53:59 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 13:53:53 +0000
Message-ID: <3455070b-13d9-4e51-826b-e256ed899344@amd.com>
Date: Fri, 17 May 2024 19:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/buddy: Fix the warn on's during force merge
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c07d0fd-cfb5-4f00-3223-08dc7678c9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHlPMlk0dEJSMkpQUnVFRzFZN3VkT0tyaFB1TU1pQmo4YUZBVjZMYW9YUXRj?=
 =?utf-8?B?MVZZTEtKSlE3RXIxQzBuNFJDS1ZuMjBkWTkwZC9jcFVhRFFZZS82c1IrTnps?=
 =?utf-8?B?VG95cUpWa2ltNktJRmZ3QlF5eDZrSEhRS1NOdFdDM3VOTERZeFFRS2VVOG9w?=
 =?utf-8?B?MDRkMU5BNGpXZzk2VkE2U2JQQ0lqMzlGZ2NGUExvOXh4dW9KWHhETVBoRDVQ?=
 =?utf-8?B?dFZjdlZEclhpVmtLNmhoQ29ST0VtUk4rVnhVRFlObVlYb01CM2FVbEVsUU9i?=
 =?utf-8?B?NTc2SThNL0lXNjFyb0paeFVLc3M0ekpXSTlOYWZvYWRLSVYzYmJ5c2Q2TTky?=
 =?utf-8?B?b1RySzQyNTIySnV1RmtoanJtOXMxSExCK3BqSlJVaVZZY0NqUmZ4Uk1xZkQx?=
 =?utf-8?B?dnRlL2I0YUZZRjRuRm5RM1QzSjU3bldIb0FBQ3JEY0ZiMHduZmlINCt2YkZp?=
 =?utf-8?B?SzllTUNtbkRxY01ORVlPbHo0V3dSNXE3enR5bnJXQnlpM0pyOCthSDZ3K20z?=
 =?utf-8?B?TzBjVTZxZVZaYkZjbmlpMkNmVmM3RUVCSXNTbmphZU5iTVR0bnNjRDRZL0R4?=
 =?utf-8?B?ZjZOMFNuUDFIQlJPaW5BZFQrVGdQRXp1Z1FYUW9aeVd2bVV6cHdZSjUrZllv?=
 =?utf-8?B?dEFMSzJDS2hvVGJCUUt3OUhtZlh2VkNvZzhjVkF1aGRsV3E2WGZIaVp4MGVt?=
 =?utf-8?B?V3VWY2UwWmtYb0ZWcGxpVHRINkxEcHFwQkVmQ3pwbGQvYk80clNlcXpyRWN4?=
 =?utf-8?B?bC85d1RWVk9PVjdma1hiVkRuYndQZ2ozaC9nQ1duWmxMdkl2TEI4clhyMjdS?=
 =?utf-8?B?WDYraUhEQlp2RzRqRWlzNk9tcVVuVTMwUEVuMWF3Nm9DTERoNUdKT0lPejFp?=
 =?utf-8?B?ekpBSVQvajM4b09FNEJqWndZYmRKdWl0Y05qZ0RyK0JCMExiVzVwK0JWTWJq?=
 =?utf-8?B?TnZJRzQvQmpuK3FsZXF6RDhjaXhmTUhYZWJHN2xucGpuR0k0THBaVHdtYXdP?=
 =?utf-8?B?OG5ranVzRnB4bUdqV2FtVXpRZ2hINTNNcDVpcC8zYjZ1ZkxqelNSaVA1V29r?=
 =?utf-8?B?Wm10L2FnNE5qSHUrNWZpVU9VZHZkdmM1U1FFOXhqanVQVld3RExjL29aNjU2?=
 =?utf-8?B?SWR6S2EvaCtmQ1ZheGk5b09URVpSVHBFSUUxT0hUN1FNK3VCaFZhSWFPT1Np?=
 =?utf-8?B?dzU4VDlxZ2RDWnpCR1k2NXJSY1phTWpkV0c2SnNQbnV3RFF6MDVlbC9zYnlu?=
 =?utf-8?B?K2dhdVg2ajN5WDBKMzlFbmcxNnpqTWVHK0QxemM1SksvUzM3eWpCR2pkTitn?=
 =?utf-8?B?NitBeXF6ZzRiaWQ2ZU5nbXJGczhsSVpVc0kvNlF6eG0wZGdRejh6VHhRQWUr?=
 =?utf-8?B?Rk81cjNZNlIyQ3BpVGx1eW1BMEU4MGNYVHc2K3NqZ29ZNUNoMWVxWjdxRVov?=
 =?utf-8?B?SXB5MzhEWk5kRzVpaHpWMmVEV0tGYUlNeEZaQ1hTUkt4bWFqaGFZQW9LdEs3?=
 =?utf-8?B?c0JXdjRlSnhSOVgzMklhVncvS1NlZ2VkTWdMZnc4dk1qZ254aXlReFErUDFG?=
 =?utf-8?B?enNyemR3Z1dab09FYXU3Y0VLV3hxWXZWN0lTcVlqVUxCN0FPcGdvSnNwNUFY?=
 =?utf-8?B?aW5DazA3UlNxYmU5c3BXK0JXVmlNVmNMN205L1FVNEpaY08weW9ENGkybklo?=
 =?utf-8?B?OTcvZEFHNHRmdE16MSt0WjZ3S1V4SDRBNHB2NWdhZGJGREJBN25FbWl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2REejh0TlBMQXhERkp4K2xhZW1zdTZuL292bENoNlJpZkp3cjAyd2FwTTRs?=
 =?utf-8?B?TEtVSTFoRFB1TkIySHpJeTNDR3FvK1RlRVlxMFBsSFlBV0VFS2I5NlMzSE53?=
 =?utf-8?B?TVVmVXlCeTNoUEZIaWszNS9rL0twaHd3UG9hZDd1dHBqaDhmYk5Cam9XOGdN?=
 =?utf-8?B?RVc5L2Vzd2VRWVRuZXRyQ0VrVktQM0I3QUp6czJCRC9JNmI2YnhlVGI4Tm85?=
 =?utf-8?B?d0dJbVRYTGFXYkRPUXg1TkhBV3FwZ2xLeDRvN1dpZDcvb01QSVJpWkxYUU02?=
 =?utf-8?B?YUdpQUNwTUYyOVArL29HU2NHY0dTMU83V3VOSjFxWGV6anBKaXBteFIwcVM2?=
 =?utf-8?B?Y2U5WndxOUlhS1NhcFZzTzExM2NEUFpYaS9WWnByeURiYWdzSUV4bXN5UkhD?=
 =?utf-8?B?cTFJV2cyNUlITDNGeWM3Vmx4R2ZzUlBCYmQyRFRXbURrNHpnMmlXZThERnd6?=
 =?utf-8?B?c29LTFpCZkxMTVM4V1A3WWZOQmN4ZkFqYWdlS0VxQVJ5V3hkazVDSzkzSWJk?=
 =?utf-8?B?NGF0ZzNoRWY3K3Z0WUZxMGVQcG4zeDNmbU1oVHprMDBvNEEvRzVHM005dkJw?=
 =?utf-8?B?Y0lFSG53L0N0a2F3Uzg2c3BLWE1EeHp3bzA1Qk9NOVBUNS9Hak5qK1liMjVs?=
 =?utf-8?B?ZVAvQW5JZklvUEV1dklWOFBMZk8rNytweDJhb1JuUzdWQld6RGpXcUtsUFRM?=
 =?utf-8?B?cFE1SE41eTArTmwyTnFtMUFnNFg1aW1wM0U3ZURIc1lYcXY5N29VYWJFNDV2?=
 =?utf-8?B?RjFhMFZ3TDZVY0xkQlVWYm5aK1YreXB5aEd4alVTSS81NFZsKytaK1RRaDJy?=
 =?utf-8?B?enNuZHJyU0Y2b05NRGg2Rkg3NkNpTWhld3k1NlJEK1RISTB3RGxhOVcyZXpW?=
 =?utf-8?B?VXJyL1dlcjBHUEpJMThXMklMNHU1NkhJZlZvN1BYM3JCZVh0TlFudHVFV2JB?=
 =?utf-8?B?L0hVT0xsUWFjcVpnUFJpbTdrRWlJK0t1RDJxZkVJVGhZelc3eUJJbmhleDJl?=
 =?utf-8?B?R01LUkNqZzNLLy9mMVVwTU1DUVJXQW9pU0Q0YlhIYVhHY0pOQ1ZiZjNqemZH?=
 =?utf-8?B?U2F5VkM0WGlmTkxRbzhUaVVpVENUeWVzcVRZdU5HRUFEVVdqS0hZaGRhZVdZ?=
 =?utf-8?B?SzJUS0xNQ2JPM3lFSjNMd2ZPTmJtaWFRUm4vcDhlVGI4cjgzM3RpTktyUUY0?=
 =?utf-8?B?VTl5SmhIdkN3U0szYlNDcVZ0QVk3Zm4rcEY2dkgwSGpCL0hpMDJRT0VhUUJ5?=
 =?utf-8?B?U3dpUXVSbExRUEw1c2RqNFRaaU5OVmR5SVlrak5yRS9QNTlyNnpQaG0zbTJx?=
 =?utf-8?B?MXlVelExTnQ0K2NwNUJvazBSb3kvOW5Ddk5uODJtbTBBb3RlN2RhVERXQktY?=
 =?utf-8?B?WGZDVm9abjdQOUU5RHpFcVJSYmlBeURZYkhneUE1Y0lhNDZNNnUvaitwdGVP?=
 =?utf-8?B?d0dKUDI5eFp2RXJ4a0tWSDdNS0JRSW9STHVSTEdEbDJzVlBqcExrQXFMM0M5?=
 =?utf-8?B?N3NwRWdTK3RlOU5weDZWVVVWT2RMRjc2SUpTNUxMamR5eElRV0piZmc2Rndh?=
 =?utf-8?B?UWFVZWJBVFRlWHJxU2VuK0ZQNGtyRW1jWUVJVEM0T0JXSHpvU1Q4UENQcy9q?=
 =?utf-8?B?bi9acytSWEhhL0plYWdtbjZQRFdtSFNPbTBEQkY2TjRZV3BYMWtIb0JUOWhl?=
 =?utf-8?B?bitBemZOTHkzZThzMHJPTk14dmFaSkpzakN5NkhIOHpwUlg4bUdzWndraEth?=
 =?utf-8?B?YlNWd0MzT1NEMnEyUEhjTmRkRHRHR1k4eHR0TVo2Uk53N2ViR21aOG1tTnZw?=
 =?utf-8?B?MUtJZWEzVForNUtadnFuNndnbEE5NXdnS2JXLzBMWTl4QjRpb2dLY3ZvZUI0?=
 =?utf-8?B?QnBUQVZlQ2plYkVqVDRISlBlUmx5SGtVb1JIS0E4azVjVWVhQXZMY1laVW1n?=
 =?utf-8?B?WFpIU2gvRXNYdTEydHFNZVdCdG85QWVsVkREUm1jcy9jWUtXOXNSR0MyeDZ6?=
 =?utf-8?B?MXdpTnhhYWl5T3lkOFRQNGxyWVVRTDVMS0l2eHNXRUI0WUZnUjhEN05ieTZF?=
 =?utf-8?B?aUliR0Fodm9sdDY0SVowdmM0R1o0OEhrTTA4TmdlWnphbkVMdjVvK1VSaTVI?=
 =?utf-8?Q?R9DBnMLhwQb7lOjP9ullJ5hkq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c07d0fd-cfb5-4f00-3223-08dc7678c9c3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 13:53:53.5731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgj9b5pJynHpYTyLGIMBgSsgv+Uf3ASwe8T23AjhminoYeO6i2exfw1ydWWxn28qUNlJ3HrNneb8Hajf610hww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
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

Hi Matthew,
This fixes the problem.

Regards,
Arun.

On 5/17/2024 7:20 PM, Arunpravin Paneer Selvam wrote:
> Move the fallback and block incompatible checks
> above, so that we dont unnecessarily split the blocks
> and leaving the unmerged. This resolves the unnecessary
> warn on's thrown during force_merge call.
>
> v2:(Matthew)
>    - Move the fallback and block incompatible checks above
>      the contains check.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> ---
>   drivers/gpu/drm/drm_buddy.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 1daf778cf6fa..94f8c34fc293 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -524,11 +524,11 @@ __alloc_range_bias(struct drm_buddy *mm,
>   				continue;
>   		}
>   
> +		if (!fallback && block_incompatible(block, flags))
> +			continue;
> +
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> -			if (!fallback && block_incompatible(block, flags))
> -				continue;
> -
>   			/*
>   			 * Find the free block within the range.
>   			 */

