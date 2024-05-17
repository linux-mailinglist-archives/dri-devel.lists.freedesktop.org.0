Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765468C8A40
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C2A10E2F1;
	Fri, 17 May 2024 16:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="32LCOHbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140210E2F1;
 Fri, 17 May 2024 16:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKy4wmYdQWBWcM4PXO5a3snbxzwwxuktntsqR1z32zONQ6lJAMgtsJLoBlIr4pgV3F0kDtLt22epkKetT2tF6Osp5G7gVw8tF2rP7wYNMhzigNs5/Xl+uWKNP4Duzs+V4iQP1Yarylwf2dY3zw+1hhfdkVLhGezuAJqwXBsGJqbCYAXPqj0D12nBgI+Tbzvco4WD4ukQo6BqYaLOdqxqVQIXAZcArOkED/J/TorJcrjjrEbI7ReqwlkCcYPO8ln/jSAb9HqjvJW2vFBbEWAoHW+eRCpSXuUFl2KJ2yLTM8DQ7f9AlbX/kyRFnTWv1oY7EHiNCwV06p4FzAymghqSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5eViJeHERLWZaYIrF01ZebkMGLcGCjSjpuB7iFXb9I=;
 b=EDcQA7PACMbEOnYqza0+Wlq1I96Gl3h2ecDyfxGAZ8/U/2oAMAwXpbuI0//WnS0lIK2Hs6VnSlf1ZIgaJvozlmG1GkyPOSpgUDzNfNLkULKqYTt09Baa4mt3ZyMx52nKtDXnMm6VzeqlFXwuL+tUJRPo3xgV7Plx/yW4f6iuqD2cj7V7VfTid3Aq8VQA3y48YRLgwZHVQfX5zlSl8fuvwobveIh+A5/6Pzpw4posqybbuWEL+fl5TUWzj5xVlHCE+LwDPPpSHuzLzBxGuuzItyTk2l0EbV/BScXeQx27YBiRAWqcmVMZRnfolbYsOl40/FzF/yeS/Jj+BD4aR3wK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5eViJeHERLWZaYIrF01ZebkMGLcGCjSjpuB7iFXb9I=;
 b=32LCOHbj8dPKOsgkaUGE+MvE/egIQlKSuKfGgB81eeJxzxU47eQmOmAhoNaYXVc6Dx0cIfQ7uDwY1AUyxbMjOIQBT3MY9wx8KDNDqv6AG87z+9txcGqGJNWGRrh0TmMaq/87q0xzJN/QHRKemIRzq/0nUmfWe1A8MEQNF5pHLrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by LV8PR12MB9419.namprd12.prod.outlook.com (2603:10b6:408:206::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 16:45:01 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 16:45:01 +0000
Message-ID: <da21e56a-f145-4045-b1db-45680ed9c8a1@amd.com>
Date: Fri, 17 May 2024 22:14:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/buddy: Fix the warn on's during force merge
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, Dave Airlie <airlied@gmail.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517143305.17894-1-Arunpravin.PaneerSelvam@amd.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240517143305.17894-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|LV8PR12MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 97439d12-58f5-467c-b034-08dc7690b1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVR3Z0ZKWTYwbWw1NTBQV3dOZ3Vjajk2S2FQZ3F5ZUJSYzdtdi9qTTJRdU9q?=
 =?utf-8?B?eU5hME8xc0pKMERVd1pWdjYwQ2J1RWFkUExxSThORzF2WUJZcnJ2L0RrZ0V5?=
 =?utf-8?B?V2xJV3FYNmtVZ1VPQkFtNzNyMHk1YStZMVd4Q1JHQ3FNWnkzeUg2WEVYNVVJ?=
 =?utf-8?B?ZWdOZ1h5cUFPM0J3ekhpVlNhYnJlblMyMWxpbmJaRURVZnFBR3RxVzZxTzdQ?=
 =?utf-8?B?RkwyYUdmN3dkdEFJS2l4N1E2aFBpenhqbjVwOXZDck9qRkNmOXVKb2lYQUpT?=
 =?utf-8?B?YW5LMmQyWjhRcm5GaTk2ZEFTdUVvcGdES0lGSjJPb0xxSFd2dHdzYmRtZkJ1?=
 =?utf-8?B?d3JTbi9ydlM0ZG1KRllyNm9XSUFZTlAyMFNud3JNanV3OEh6eXRaUEJ3TXRt?=
 =?utf-8?B?QjRUQWVGZ0s4YmxlT0FtQTlSRVBzUkhkaUliNHpoa1pZVUpHaFNLWUtsTWt2?=
 =?utf-8?B?K1pFVTRjM2FFUXUwOStCeHNJd2t6RDJqekxEZkYycWRSNVpqMEN2amcrcmkw?=
 =?utf-8?B?VHdTTDZ3N0VSN0RsaWh6b0NGSlF4RnNlRHhhbTJZVW5wWTUrMVEvRVJUbUxZ?=
 =?utf-8?B?VlI1LzlpTXlvbHJ5MVFaeGFQMVI5MnlGRjJqL1FjbTJUVnFKZDdZWXZocXp4?=
 =?utf-8?B?SnkrcVdQdnQwQ2swQTNKWk1GQnU1bmFtU3RRZ3NvZGVUUFFmdDlNMTdmZDRm?=
 =?utf-8?B?TUlBWndjZlRsZkpNWDlLTGdMR3VFVFlGRzFYWXNDUVdSV0ZUcEdOOXVTMzEv?=
 =?utf-8?B?R3FCUUJIaEUramc1QU5zR0llNSsyb0xsL2lTb2NzaWtuOUNxY2xoOEwyVDM5?=
 =?utf-8?B?L3JISjZkU0pQTlBjczF5cFlJUS9WemhPRXV0cVRFYjlZOTk1UC9Xa1FXTk9Z?=
 =?utf-8?B?amlROHZvR0ZVR2lUcUhsaTNEQ1l2ak1DalIvVVJRQ055Y3dwTkdFV3JJOVZn?=
 =?utf-8?B?QmlSV1dFRjJMMXIwUmJSUDlneVFFZDFlNzNFbjlweGFzdGluYXhSUWpyWGRM?=
 =?utf-8?B?dXFqMTJIdzNkZXN1SFN0MVQvYldGdWw5MGRuSlJKbGNWRTJTaEppQVA0Zk1y?=
 =?utf-8?B?T3ZKblByMmtmdHlFL0FNNHJDRXhZc0lqYTNDaC9ZczdEVjhwRGp6NzMzT3Rz?=
 =?utf-8?B?NU0vRWhDeDBQbUk0TlNVelUxYnRUTitNMHlKZEYzK2tUMnVZVGFTQXFOcW55?=
 =?utf-8?B?aVcwNmRBell0M3JVYmdRTDFzMTBpVTRocFRJY0ZOL0hSeS9tRUxOWG5PNzF6?=
 =?utf-8?B?RGo5aFdXODZ6WkNOK0FxNitHTFhpdWJDVSthcTRWbFU2YmxBSHdET3pGTzU0?=
 =?utf-8?B?OFl3RmIzeWMvQ2Yra29XcGJlb0NkekNVVFRpZ3NCa215RG5IbmM5b1I1Um5L?=
 =?utf-8?B?RTVOdzN6YlBzNi9iN3pZeCtML0hZRHNtQTQyNTJvRENRQ1MxV0F4TG4zTXNo?=
 =?utf-8?B?WTU0K0hMSFk2VjZlV002dEY3aWF2dWh2WGkzN2o5VXgzekpoOHZ3QXdyNFpa?=
 =?utf-8?B?MmRqYkxzK0ZNdWJHWWxwV2JNbkFBaEZJNitvcmtCaU81ZEp6NXZVdVZST1lS?=
 =?utf-8?B?QTcxNGRtLzBzQVNwYUt2M05mVitDVmNvd2VveklsSkMxZjlvakdtWTJUV2ZI?=
 =?utf-8?Q?yzZo3jQVgHfivuVYzF4cZbuhkM1Ld3uUKgNtqZwCyNmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlkYW5vWXNVRURSSFphVGpzWlRxVWdmM0NzZFdUVnQzMUJsMGxKVjF2TDA5?=
 =?utf-8?B?dFd2a09ZWTVxY0MxeTVWb05KMlZUWmR4Vzhmb0phTVlVaEYrM1BVVWIxNUVz?=
 =?utf-8?B?MEs2aFZGSFlnQ0ljNzlyTWNJaHNLL0NDYkttU3ZDSTR5dzBjcEJMZlRFNytN?=
 =?utf-8?B?M00xL1lwVmNVakdrUmVCQWpZbXIrVFVnTG5pSlJ4aVNCaE9sNjA0UkhUbDlK?=
 =?utf-8?B?Ry9BVGR1eVR6aExVNmhxN0R1bkt1OVpNTTFnRnd5STJEdC9FRE93VzV0R3ov?=
 =?utf-8?B?cENWVVQydXI3SndtZHpqcUtHd1d3Z282SEhjQXFhYjc3cEhUbzlKVFFyUkp6?=
 =?utf-8?B?MjhUY0ZQOHNtL29UZisxVGJCUy9mYmlycDBOTGZRdGxscUZnTWhyeG1TSjBC?=
 =?utf-8?B?T3JCNmJyb2U0bHRhSnovS0I1NGlxY1llNHBvTkIzZzVGbVpoSFI0MkxLQmpr?=
 =?utf-8?B?bW9tOHVvNWVxd1B1bFRZTHhXOWlxbFh0WVJiVHV2N1VKbGxIMGtXcUFTVUlw?=
 =?utf-8?B?eVhZQWgzSkZQV3BMR2pDSE9vOTdzOEJBeUc2SEFlY0hDczQ0SUQ4aVd3eEE4?=
 =?utf-8?B?Y3B2eEl6VWY0SndsK3dmQUxkZEVONzZ2bXVvdXo3dmdYSVhNK3VBckNRS2Ni?=
 =?utf-8?B?NzdVNjRMSGNJZ1pGcS9jcmx5U01BQXBLSm1TTFBaa3c0eGRiWG9oS2JVOVEy?=
 =?utf-8?B?dXpRa1ROTGVLM25rbWRMcU9heUdUSnEweWYwN1hJVHhvWjdvVG0zbFZ6ckZx?=
 =?utf-8?B?ekhaMFA4Yy9zTjRIZko5Rk0wL2VYMlFxYnlLUUlwcVlDRndqUi9GQWRRYmhn?=
 =?utf-8?B?eUJxMWo3Q2NoYlBwUlhkS0U4U1Y4YUI0dXdLV0MvQTF0dVFHL3k4MlptQWg5?=
 =?utf-8?B?SmQrbCswQjV2UmEzVXBWQ0ljaHNybVBTK3NFQnVnU0RvNERvTmVZS3ZsbXFx?=
 =?utf-8?B?b0FKbmxBN3pmcGVYMUpRMmR6Zjdhak8rOGtxTXdLWVRlRkVaaUM5QlJwbERG?=
 =?utf-8?B?RHY1UGVVTjA5bUN0UGM1MzIvSzRLUWNJelZVNWtBckhsVVdOQnVzT1hrRFRn?=
 =?utf-8?B?WGJ0dGd0RnhQc3dldTlmOHBXSHhmRXVSOXAwdXgyWWpBcjRJYmNPTlpick0v?=
 =?utf-8?B?N2lnWGlGWG1PeWZxbmFEZWtRV0hIOWp0TlYxTHYzbzFPZ1Z6bk1iWWNwNWRi?=
 =?utf-8?B?U0hHdEtiUjdkaEVYOHdJd0JaNGE5bG9DZlZUQ01tSjhUZDk3Y2czZ2ZQSVQ5?=
 =?utf-8?B?cTR1VUpDamlWN243NENRMVlJS25PRE9WZjJhSnZibVR4bjdPR2NCVk9LS3JU?=
 =?utf-8?B?WjNCUWpMRVJ4TDJtOVdWbEhvMHhMendoUndyaThBR3FOQmp6cW5yRjFPN09L?=
 =?utf-8?B?WDFsdnNWMDMxUXNxOVNjQUZQT2RoT0JrNkhhcE0zZTFJUlR5Yi9UV1FtNEVl?=
 =?utf-8?B?aTVLZWdINVFteXFSeUxJQkVzQzNxZDRYZkV6RWlxTWxXbnlTbFArSjd3Skl6?=
 =?utf-8?B?SW0zNHE2clVnblhuZEthd3Z1SHlDR29nTHJtb3FVN1VBNzBaQkNVZ05GS3hw?=
 =?utf-8?B?ZmZNMHM5ZDlhTGllNisydzE2bXNQaXlDYzUrSnFkTEJRZW00Y2o1c3B2cVVr?=
 =?utf-8?B?a2cveEhudzFoeExPOW5SZUJ3WkFCU0dXd1p4WWpNQTlmeDRSQVhVREU3UUZ1?=
 =?utf-8?B?eC94VjdCL09rTENzbzVOM0xxZmJ6VlBoUEJPK2traGJRSklpdk9zOUVWOHp0?=
 =?utf-8?B?ZlZ6elpJRWlzbmpsdTkzODZtSzUwai9INWZQcGcxcDEyMlF0eHB0RkpLc3c1?=
 =?utf-8?B?YnYwZFZibmZqdzloTmdxaU9BUTI3QmVNYmlPdm9tQUhVdFltbDhQcmNGWUxp?=
 =?utf-8?B?enRXRHZsbjcrSVQ0QUloWWk3aUh6ZHJBNHEyOHNsMW5KN0JRT29pZm0rTUxZ?=
 =?utf-8?B?Ujg5Q0ZNVjJoMXpNSGY5Z2RRdlBhMXorZ25sTWJ1ellUaXFVOFdrZUVNOTVi?=
 =?utf-8?B?NlRxWUs3cGlFRnR6MnE3T3ZuTm9RK00wTUtjWnFjL0Fpc3pJT2diT2pEQnY2?=
 =?utf-8?B?S2FHZFRpRnBCODRDc1NrY2R4anFpVXlFOWhPYW12NUpzUkF2Qk52TzdFTzFD?=
 =?utf-8?Q?07c/OE0+GZGIUe6r/+h8en5oq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97439d12-58f5-467c-b034-08dc7690b1da
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:45:01.4457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S129Anmeh4rBGsopfJQtZ7LHLhcsOkkKnsjYk4/Ywtw1wKP24HkkSLEsZpiF/LrBFZHm90fowKqOu+OgJxoNoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9419
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

Hi Dave,
Please help pull this patch into drm-next. This will fix any unnecessary
warnings in memory pressure situation.

Thanks for the help.

Regards,
Arun.

On 5/17/2024 8:03 PM, Arunpravin Paneer Selvam wrote:
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
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> Link: https://patchwork.kernel.org/project/dri-devel/patch/20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com/
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

