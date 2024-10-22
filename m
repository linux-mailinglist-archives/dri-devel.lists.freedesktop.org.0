Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8019A9A5C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550410E5EA;
	Tue, 22 Oct 2024 07:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dS/0NBm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBCC10E5EA;
 Tue, 22 Oct 2024 07:00:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5LWw/ER0pvVPEnjppgTDY6nkzwX95DZEx06sXW3YaBDkwUJGu7XSMVQU15b+i2FJrkf6eB/+69kdRv8FpBgN/JrqrKo6k3205iRyhhW8n1odjD1Wd1OMCVNLmM9N/8+oKntbLjB8Ea+ATda65Gx0FdRwZiuCOSxy6e1chjKf+va7+XwxXeHZCpU5W2EThfX5KMbm7NDhTd2e+1nGtc/6qOYh020JwK+u4ETwdPPd7A9n+2seVQvaQxxgNYXIgHo1kGkkRc9b5JpBDe9mtdahpDNT9s//qAS81WqOcC5eR5k+/ceAxqQdqjyHQ0rnh2HTIfWn2zGbx+CwL2Fwg6+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WXPHZN9iKXs0h29LmWY7QWpZD9z9SVZi2WWqTPH9LQ=;
 b=wJecA1XR9swoTviBRlN5pzjJiZCBXTcelJ/MW+sqJ8ygQ1iHWlX+nv6zHkk3mT3uJENSX7yMjUkasPOtZ50sngEDUxKE/0ll+kh+x9iK5cLfZj+7tt9hWQXX4ZJU5X8MfO7MGcv2bg2xzWbmh1Pp0wCkA6kODQu6/FgKgaVTxLvC8Rxq1+QmSTWreBWoOMOoNx+wrBBzAxb1tUivF+6bnecWwaYM3Ey5QfDtoZxvrlcMmMWf/qKKbdUonVPOc6qB5LrvXGN4NjCwJ+Z6MYu1+fOBLnzVEekB12lC/upFsC/pPKoz7q6sfCFBecqOVIPHKlu1mYVWdzfQwqjiLNAAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WXPHZN9iKXs0h29LmWY7QWpZD9z9SVZi2WWqTPH9LQ=;
 b=dS/0NBm1FCn91nGgiWzYnS0+FtZdtd/WXSxIikF4Oo50rUKTAwhJ4tGxJWCSKIjH3+8MZJ/tuVv+YGtGorDLmPQg7YX1XPevpwpXFGRYN3M4TctAoVHaGNnDRXtfBeGXlH+axAzNYxXBkGX5aMoRoG+OpXZ9cWAkQPD/wNVlQ4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 07:00:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:00:21 +0000
Message-ID: <93f99003-f534-4e1e-985d-6dc64e469abb@amd.com>
Date: Tue, 22 Oct 2024 09:00:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/amdgpu: make drm-memory-* report resident
 memory
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, tvrtko.ursulin@igalia.com
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-3-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241018133308.889-3-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d504fd5-1f21-4a6d-81c7-08dcf26731b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czJ4cG1aVGdiRHVQOUZwbTBpbVFwT0RUbnE3enNNcHk4THFoRUFPbFZxZHFw?=
 =?utf-8?B?cGpHcFMvaXcvNEpQK3ZOK1VxLzVTak1nSW0wL3JMd0wzWFZmTytYVXYrL2dm?=
 =?utf-8?B?TlAzK2IzckNGeHloS0dXMG1XdXo3bkxmcHBLUE0zNGs3VDRWajdDNHBtcXIr?=
 =?utf-8?B?RzYwLzgvZXArMjQwcFU5bkgzd2N6b0xXb1RQTTJEaWNybkRYZFpwL3ZJNWlV?=
 =?utf-8?B?djREMUI0ZFZwZDQ3cDNpSE5IWDVValhNKy9rWHczSHh4UnFPYTkrOFhKeVBa?=
 =?utf-8?B?clRDazg0SE5KbmxiYjVGb3VPY1Ixd0NkVkFJVnA4SzhEZlA0NXRNOGZmRy9i?=
 =?utf-8?B?MFp3RTI3OElFWFI0dDBlZzRHdU5Ka0hYbkFXbW51OFZaOXpTeXNrYjZFb0hJ?=
 =?utf-8?B?Y1dFRFhQRVVLT3BpME9ocFVKZGY4YldMc0gvTkVodE1BUlU2ZEUvaE9KYUlq?=
 =?utf-8?B?ZlBuWm56L0VqWTVtUU9JLzJ1Q3NxVWxiTmllTE1CRUIzZzFvbEJuZThmU0Ir?=
 =?utf-8?B?clAraHVvV0lzRmZMVEk2QzFjV0FTaDhTL1BwUjJxd3dpUUZCM016cGcvdlNa?=
 =?utf-8?B?cUh4V09xK01lUDQxemN6d2YyM2huY0NJbldRRVJaVVNRWDVBMlpIWHJFNGdY?=
 =?utf-8?B?OEthMFVZMUJCQmtGNVIrUVVPdWo0Wm1qN2FDRzBhc2E5QVFKaXdkcVdiOE5S?=
 =?utf-8?B?NlhmUlN4aHVqUldXUUNXQnl5TmE5aHg4LzF4R0RmZnJvSEw2R0JwdzV2dTBq?=
 =?utf-8?B?a005TldBVm9ITmhXYTV5b2xJSzlQSUdybW9EeERla29kSjZWUTNmRzVxWDZ0?=
 =?utf-8?B?dzJGT240SmwrUUlTTjlLRTJ1czAvb29YeHBPTnNaM0FLdmxtOWMyN0EySUpq?=
 =?utf-8?B?bnpBOUg4SHJYME90OXhReUV3L0N1SEZEQitxc2pNWGZEVWFiNTBGYnUxNEVh?=
 =?utf-8?B?elhYNXg4OFIrOFZFNStTbStWUmdYRzNsOVlwbXJnV1pCOFFrUjJFUkZIanRS?=
 =?utf-8?B?NG16TFhqNS9laHpta3ozaCsxNDVhbmtJd2F6dWt5WnQyY3RMUHpWOUdkZnRJ?=
 =?utf-8?B?Z1BOQWpMVDZTenRMdzBlL0wrWWlrTElOL29uN3R2UEtyd1ZRR1h6SlVOT0Qv?=
 =?utf-8?B?YklSVmZJcGFzdkhRKy9yMmdRRFBQTGM0SEtkMDFyZ3VhbTdSblJmSHN4Vjgv?=
 =?utf-8?B?Mk1ZRUE4dEsxZkFNdStGSGpUNUhPcVl3R1ZIa3Zkam5aTitzT3NNWVk0cWFQ?=
 =?utf-8?B?LzUrQUYrekxTR1BZcWlOQlNmSEl1NHlaTGRCajUvWW4xanpvUk1vS2N0cGVp?=
 =?utf-8?B?ME9lbFJRU2tCWk9GWGJ3V0c3Wk41ak53ZEk1eVE0TDhTTnBtWmF2bU5NcWdx?=
 =?utf-8?B?MUFLQWhnUTl5M01uYTBPN1Z2UHlZRlFTY2VJdDZZZ1B5QXZPd1R4Tmcyb1My?=
 =?utf-8?B?Wm50NmdYN3hwMmZ1a0IrU1pnZE1TU1pnTHpxYzBkN3AwblQrSnk3ZzBYQjZO?=
 =?utf-8?B?YTJkS3lyWXN6UVV3TnBJN2R2UGJxYlNqM0R4azUyeE9qUUQzU3ppbU9rMUdw?=
 =?utf-8?B?c3UybEdGMVA2SVd1OHVabG43dWhzLzNJMWl0VmpyTTZENHo3Nkw2ZVlZaFJL?=
 =?utf-8?B?dDR2dVhVNExjeDBwem1hTTBaV2ZVdCtVdDNadDcwR3VYTWU5cmNZSy9IL1Yw?=
 =?utf-8?B?M3UvcXpWVHZTWkU5QmpWR2t6Rm56c25icmgrUEJneXR4Mm9heFBKaTNLeWVN?=
 =?utf-8?Q?lv/YPhPHx46vclnCT9GPoY5OLQNBSrIoCXLi0au?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWFJR2dGZlM2eG5vM29wWTBmQnU2TmNtYndsRElDcFU4WGxTMDE3R1FSZXZ5?=
 =?utf-8?B?cndLc1FhRXpEd2lkY0hTL1pBZ09ZQk5vVlF3T0JicjRnTHBvc1owbFFYZita?=
 =?utf-8?B?Y3NrbEUwMWxPa2lCekpFUzJTV0x2KzZuN0hiNHJtZVc5Z1Jxc0ZSUTFYdkRH?=
 =?utf-8?B?YVVEMit1aTBmWTJDdkVSVEdNY05BUnhrL05zeXdrTFJtMEV5b2t5V04yelZ4?=
 =?utf-8?B?dmY2TXVRakVqT3kvejNCSXdYREFHY2J4dXNQZVlCWUVHK1kvYis2U3NJSkEv?=
 =?utf-8?B?OXducW1VNGJkYjZzNG9DMEM0cFprYlBqV3oxNzBZNGN1cDB5QUdPSmovKzdq?=
 =?utf-8?B?MXhKT3JCS3RrY3Q4TktoSlQ4RnZ6TCtMckpQckNpS1pXNkhjR1NWTjdndXFv?=
 =?utf-8?B?ZjZNL2tFRE43SFR2N2ZwUk5aMDFJK0YwRFk5K3MxZ1AxblRmalkrUERuQ0lm?=
 =?utf-8?B?SHpRb2tjUk5nMTQwb3dIWkZQdTZ4eU5hczVQWEZocS9kOU9oYzZUS3M4MDVl?=
 =?utf-8?B?U2VGNnE4MmZYVkIxLytOdXFsWndML1h6enF4OFJUd0RwRnpoZm13aXl2RUhW?=
 =?utf-8?B?SmVvVHNQZUVSYTNhSTdLZTc0OC9OY1dDTGhOcjdiRTZrNEVSMWVBTWtJQUEv?=
 =?utf-8?B?RXYwb29VK2pXdzFtaWlHYnRDOE4wbURVUTdwVDcvU3IzZ0xIYVlXT01veGxa?=
 =?utf-8?B?QzhhUklqYVA0b2hxNmpZY3R5ckx6ejlhSnEvZm9zVXZpREdHNjBpTzhCOFY4?=
 =?utf-8?B?bFVBTXN6eE1vUk9ubUhwcVAxS29mbFN5SWdCekZVc2xzcC90QlZKR0dSVTN2?=
 =?utf-8?B?RVFGcm94ZmxqVi9YdjRGVTh6RXdFRnEvNDR4ZnlsSmVKcmJRZHNZeGFlVnhx?=
 =?utf-8?B?QU5WdWI3QzE3bzY1RXZIMytTeGM3aXV0NlNITHFnUjNZVEZUMlNWOU5HNzR5?=
 =?utf-8?B?SS9TNU10SmVIS3VSTitNaGllM2Q2eDU0ekx2ZUhOVHBzQ3VuMmxqeXBmMkw3?=
 =?utf-8?B?U0MrQ0VtbzNpaWZlMzRYWkg1c0dhQkpIbW5TWUtYTHlFWXp5N3B3YjgrY0JK?=
 =?utf-8?B?dDJjck5XL3dHbzhCaTEySDU4ZTRtMnVIdldHeGw4K1NBTlE5ZFBFQ3J6dWJa?=
 =?utf-8?B?MDZjWDNHN0lXbVl3NTVLdVdvUTJiTW1UNGU2ZHNCekxJNEJzNXFVNEt4OGEv?=
 =?utf-8?B?MHNDbU9vNnk2TXlTZFMvUEJ2aUlSTGRWQzNRVmhoaWx5KzBxRkdVVHdqb0F5?=
 =?utf-8?B?NjVkU2NhTDlzdlMzRHJOVUNXYjE5bk9sNTh0bkNJOWsvalh6Ni83aEVBelpl?=
 =?utf-8?B?RzMyc2UrNmZWaEpQUDZpUERIVU1wczF0R25tY2VxekY2bDBlMDZkOG0yQnZD?=
 =?utf-8?B?MExzejNhMUhJUlM5eDV3dndYczVrNjFsQzBCOHM5NGR1Uk1tZmkxMmh5TkVD?=
 =?utf-8?B?bXpnL2tES25Ba2MxanBVL1JCaEp2U1VNMHluandTbW01VEVCdGpCem9sM0Ji?=
 =?utf-8?B?R041SjRRMmZmVUtsbTZxOHNxcDY0bUhwUU5YWjBxYURtMFA3V2RVcTdkYi91?=
 =?utf-8?B?RlpRTDBhYXZ3SHEzaldzM1dEbXNibzczL3FVZ3ZMNVpqNmVndWpsWDBzQWJT?=
 =?utf-8?B?dlZDY3ZEWEI3VlFIRGdyNDB5akkyWjN5WSszbHBVd2ZtNktZM1p3MmdkWFVs?=
 =?utf-8?B?NGZhUWlvSGR6R2h2M0tHMExGak1GY3ArblRzZmV4Mkl1WlpzT29GWDlkeFZE?=
 =?utf-8?B?cERWbVhsZ2lZNmlJeGY2azhIM2tyMGlBVEk4L3VtQnRMM001UWVQMkZ2ZFBm?=
 =?utf-8?B?NXJpYktMdFRiVHova3ovQnE3RGxuMWpZVWlSdzl1MGtCRGVFMm5MMnVweTNi?=
 =?utf-8?B?aTdRVjlOeG8wZ2tzRmFhQWFtYzgrSkFpUFJnaHI4TnJXanFoNllnQk1ibmgx?=
 =?utf-8?B?bXVYMEpaSklYU0tMVG9DTVpOQ2RYVEYvMGhNWDVCS3hvREt2a3JUdllSR3NW?=
 =?utf-8?B?R0NJTjdRdDQvN0k2aTNPVVA5NjY0NzRJL3ZYLzJMcU5qYkpvQktzOStWclZX?=
 =?utf-8?B?R2lIbi9EOHExck1ESzdkcXlHQmZISitic2xqbmM5VUhtNmN1aVgzemk5eTlC?=
 =?utf-8?Q?ksX+LpNGUo28//cqlsTVddAZM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d504fd5-1f21-4a6d-81c7-08dcf26731b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:00:21.1283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kMnQ8IwK3JCviVYfzhAaBeJjWqQlfgCUJE6Gac3RkXW4lFdEtugozwEBogEM3/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

Am 18.10.24 um 15:33 schrieb Yunxiang Li:
> The old behavior reports the resident memory usage for this key and the
> documentation say so as well. However this was accidentally changed to
> include buffers that was evicted.
>
> Fixes: a2529f67e2ed ("drm/amdgpu: Use drm_print_memory_stats helper from fdinfo")
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 7 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 1 -
>   3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 00a4ab082459f..8281dd45faaa0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -33,6 +33,7 @@
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_vm.h"
> @@ -95,11 +96,11 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	/* Legacy amdgpu keys, alias to drm-resident-memory-: */
>   	drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].total/1024UL);
> +		   stats[TTM_PL_VRAM].drm.resident/1024UL);
>   	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
> -		   stats[TTM_PL_TT].total/1024UL);
> +		   stats[TTM_PL_TT].drm.resident/1024UL);
>   	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
> -		   stats[TTM_PL_SYSTEM].total/1024UL);
> +		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
>   
>   	/* Amdgpu specific memory accounting keys: */
>   	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 045222b6bd049..2a53e72f3964f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1223,7 +1223,6 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>   
>   	/* DRM stats common fields: */
>   
> -	stats[type].total += size;
>   	if (drm_gem_object_is_shared_for_memory_stats(obj))
>   		stats[type].drm.shared += size;
>   	else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 7260349917ef0..a5653f474f85c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -142,7 +142,6 @@ struct amdgpu_bo_vm {
>   struct amdgpu_mem_stats {
>   	struct drm_memory_stats drm;
>   
> -	uint64_t total;
>   	uint64_t visible;
>   	uint64_t evicted;
>   	uint64_t evicted_visible;

