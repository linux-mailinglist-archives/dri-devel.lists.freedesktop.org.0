Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83842ADB108
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB3710E384;
	Mon, 16 Jun 2025 13:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WNvX2td6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4867010E37B;
 Mon, 16 Jun 2025 13:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1aycyNiwWOVa1jx9ASOpq/QOhHnWs+f6siOixDQEm1yhvVvviDalokARBVT8ce7xcUE2xrDymWQGc901pWug4/dmX043oBg6LC87Oyt3yVAqSjq6RQUqBJPfubCOqmFUfhWaRBSnrBpKVKMiDo7Rl9p70tYYmQY2U7hGdszA8UpxqA8ysGFMfeWwGfOX5xtH/Bd3SqkPUj4/c2mLmoo29m+PhEOE8+kiPcR83yOh7K40o99c09kxU36pJHdtDMb9MDq/o//ZMzwKdjsHxun2i6sQu/KEb4tIOK5tSNcWdWDzeHcE9Em8Kyf4iKUhBK2xKZg0RlxJqJ21WvlRNBvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1acNXpyh0w7xXgAP5UeD+E3sF5XYBM3FGYys0n/PAUE=;
 b=akAFL3TpN+LTyV0YbcF2ZghlvQNAuFFfLzlYiCd7hmbltemr2mu3yFSXLIDU9MBrRT60Dpnf2yRqzEkXz9lRsy3u0019zPo3Pmv5TeI1HdCjmhqobBxGtEhOMLBtMfNet2dlU5ufZQhs8IccVHB9IS4fE6lEcjNmY63rcSEM8GAGVPIY4rT1zbRVQsvG7sspakCGe3hudoH9ZUxb0dCrFrCsQ31DyDfclLa9bZvXHZG5n9LuPh2yIgIxxisgNaafBoPRQvCA60W95SV+A1t5vsDk43i8lAzFv2hknO29ONB0qmdgFirivpHMDDqUnQ2Yrw1CokHM/ciPnHYzhyIU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1acNXpyh0w7xXgAP5UeD+E3sF5XYBM3FGYys0n/PAUE=;
 b=WNvX2td6V5f+YO6nH9cU6SOgy3pYuGfEG3V/Gy9GFAOpdkg3NEdyb1msNzdfsNZDyu/1UlKJ1aKFrzpERSfmhFmF7/VawonDCxRXhAHca8aQyWFdcVuP4XVPFVTWxVj5omczXHt8i1GYFu7nmo5O+IniwCU0dY0kAag6nQ+IiiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 13:04:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 13:04:45 +0000
Message-ID: <71a45812-3a56-4a92-a22a-18010a089ea1@amd.com>
Date: Mon, 16 Jun 2025 15:04:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ttm: Use a struct for the common part of struct
 ttm_lru_walk and struct ttm_bo_lru_cursor.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
 <20250613151824.178650-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613151824.178650-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b215acc-09d2-4faa-88c2-08ddacd65dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3BRbHptQUE4NUlQcnoxTjB4Yk1Xdm85SlJWaEdUb0JDUnEzcDBRWFFSQjBT?=
 =?utf-8?B?dHEyY2NXVWw2dVcwd0dGbURpMTNEN214ZmhTYW5scmpBR0U1MzJqRWcwajlo?=
 =?utf-8?B?NnJkUTVPMVV6K0orR3lXMUdteDNXSVY5V2p0ZEFGODN1cFVtV1c3elQxZUJ2?=
 =?utf-8?B?MFBCME5jeUJnWjl0OWdkYXVROWFXM1hxeTc0TkVONjU0VTNqM0xhR0JnV0I5?=
 =?utf-8?B?dzBiZ3ZNcUJpVlZ5ZEpaU2tlQ3BzZEdwbHpZNkUycGhzTHlQSnN5UFZ6c3dV?=
 =?utf-8?B?RHF4Z0ZuMDZ0dWxOcEc0NmZ0Vy9EZzBUSmxkYzhYcWVQa1F5OVlRUzZlSTZ1?=
 =?utf-8?B?c01lalYrc3FzTWxHVEZzSjY2VGNqNW9DcDFSbDNleE1KQ1hnVG92OFRwekg4?=
 =?utf-8?B?ZHIwTVdxSy9KaCtsL3Bub0hxZjRyOUNKcy9YL1JxeEx6T0srYWk0SUI3WFlj?=
 =?utf-8?B?dTQxZWxETWxTYzBnclJoYmZCMTJaamRqYUJ5K0RPMEU4dWRlNW96Z0k0bk5U?=
 =?utf-8?B?UmY2SW5aM1h3MXhodUhwek11TGxRSDBDYUVEYmFiekRvcDQvZERhQjRlVWVw?=
 =?utf-8?B?YzhKcDVrUHNFZTcvUXdrak5UdEtYbUpSZHljakJWaDFwOTlqSllVaWdBZWw1?=
 =?utf-8?B?MDlyYmEyVm1ML0Z3SzFibXV3TVhoVWV2b3UzL3BhOWE2MEN5a2JreEZJUGFU?=
 =?utf-8?B?QnZ1WXJidXdtY2ZMV3pKQ01aTjdHbTlveHhZcy9oRHdLN2sxZC81Zm1nK3Uy?=
 =?utf-8?B?dnNONjNqZGsrdStRR21jOWMzcFlkMFB3dEhUdHFSS2tqS2hWbDJjSWlzTUZC?=
 =?utf-8?B?OTJpeENpNGRmaEd4WTlNTGhJVkxhK01hRkYwK2h6Y2liYlVzSXFLN1dVSlhY?=
 =?utf-8?B?TDIzdU91Qy9TSklNS0ZibkMwUG5JZ3ByUThBREVrSCtkbDAzVjVqUWNJMXhp?=
 =?utf-8?B?NFNoUWF1VW9UWTRhd3Iwa2dHUzhoeHRERDBzNGU4REd0bm5uTU9zdGRWcGJ0?=
 =?utf-8?B?RXhMbEczQ2lneUhTTVNZK0Jlc0V3UmRQbldOUnJ2WDlHNk9QSStwNWpIcGdH?=
 =?utf-8?B?eU1iVU1zOWN1YzdMU3F1ZTVFUDFjbitaUkxLTzh1VGo2UXBndW5teS9SVWxW?=
 =?utf-8?B?VDFFNW9hZVUxU1NRclFoOFZONVhUVUxBbUF4R3NLR3ZlNmVTdzhaWUMzT3Br?=
 =?utf-8?B?K1lud0ZuT3NRUDdlZXVDcGpZd1JZR094ZVdPMnExREY3OW5WdnFLUERWaUc4?=
 =?utf-8?B?Y3IzU1pDUm45cEFpRzFxWTdUNDJYTGhOckFBZjhUaVB3NHlOKzhha1BQOHFD?=
 =?utf-8?B?MTd6TkY0Q1A1c3dLUGxTa0tPQ3RaR0lUbUNueGUzWmtGU0VwTllhdW13STdQ?=
 =?utf-8?B?NW4vS0krczd6ZkxGejJhM2dzZ2JxUnYyZC9UU1ZmYUdiWkh3ZG0ybE55WnJS?=
 =?utf-8?B?dWlUT3RyRUQySDdRSFd1UjVrYVIraHFWOXFsRUI3MWwzWXBmWERxOGZBT0sv?=
 =?utf-8?B?RTlFOVc1Y0NSOVhFaFhoWWZSY3ZNelJReFdoMFRuY1hocmZmNGpseENqd0Jh?=
 =?utf-8?B?ZDFHSDc5bVJWNHduSFlhMk9uUkxSZlBxNjdwQm1DRkFTSklxam9DVkZldEV0?=
 =?utf-8?B?VFlWMldTbGxCTURpcnp3Q2JUaWpFSk4rc3dCdjE3ejVPK0pnOFgvclZoaFNT?=
 =?utf-8?B?OGg0UVVVb1BKekc5UEpLVXVjZU03b2swUnRiWHdGNFN5TUNoVkYwUlZyY1lR?=
 =?utf-8?B?NENSZ3ZEcmZ0MDVaWUFuT3Q4QmE0NkpEL2h5YmlMVFBoVkFWYTI3Wm1BNzJu?=
 =?utf-8?B?eG4zNnI1Tjdsa0FLbndvd2wvVVd6L04yZDllbHEvOHI2TEV5UWNQY1VMbzNL?=
 =?utf-8?B?T3BIaVpLME0xR1IyTVhJeUZkcGlpWVJ0c1BYK29pRWhFRmdTcHF3UjI1NWd6?=
 =?utf-8?Q?WDNaQDf/qc8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9lQWFuczdpYnlXWUR6RDFsazIxWGdBWXY0Z2UvNUEySm82bEhOaFJzVDQ5?=
 =?utf-8?B?cjNCUk9GTXhTNS9yWjI4QWY1ZDRkbEFuWkxtb0RrSW12Y2VFQkpJUVhvTHlL?=
 =?utf-8?B?eXYxK05wcVphOWZjMXM0S21HU1BPQ0g3eExIT1BmTUhBWlRDb21XdEZpalpl?=
 =?utf-8?B?MU9abjFybk54dHZCRnJGd2ExS0FuVVI1ZGM5YkZ0c2M2bGFaenRIT1pQbGZj?=
 =?utf-8?B?UjZNZTlDT0tuMzNtWmpBeDhGSHVlYXkxUW5xSENHZHlqQnk4ay9YWTZYbGx2?=
 =?utf-8?B?VjV2ajMvQnlQSmhIdUdrTmgzd2J4aG5jOEQzZTg4RC9pZkUrNXFEdkRwbFFB?=
 =?utf-8?B?NEVqU2lCZ05WbWtsU0RkeWdmSWZKZVB2TzZHU29yaW1Uc1NRaFFkd1F0V3JI?=
 =?utf-8?B?MUMzMzZ1YnpuRXU4SFJleERBeVg4WGRjUUNsNHRucE03eGtVcEs1enhPTTJo?=
 =?utf-8?B?eXM3YmFXMk1XNnNDZ1EzdmZFeExMR2s4eHhKUTdLTUFXRUI0bGhrSkNrTlhY?=
 =?utf-8?B?K0dpSEpLS1p5bUhieVZHajZmd040OFk0eC8xbGhoSVp2NEpzV0tPZ21zL1BN?=
 =?utf-8?B?VjM2MzZ4Y0tyZnFtR0pSYjdWMU9aZUVSK05pcGNIRFR4L2RxdVFvWlhkVmVT?=
 =?utf-8?B?Rm5DNVc4Z3d0elVzNHBaV3A5VExXaFROUGZ3a204Z2FISFFOTWZleUZnNGoz?=
 =?utf-8?B?ZVBqN3JSeE9ZNldVSjVZMnFmbVd6L0hWRjNxMjNWNDN4Zk83cGhGb0I2V3JC?=
 =?utf-8?B?UnkrTStTcklYMllTbnNndGhrd3I0ZzJlRCsxRG1lT3ViTFJXT1lCVlBGOFZw?=
 =?utf-8?B?TW9MVUZydWFPcGxpSE1OSjc2Mm1uUWZPelhzcFdVUkxSZkR1QUdZZndKRVRh?=
 =?utf-8?B?YWsrTGIrSjF5ZGRZZk1ORzk2K1p3N3FwWE9HcEZ0ZG1PTkF2TU5KUXphQUdI?=
 =?utf-8?B?MU1wODZuQW9PTHJUVlI1NDJKekRvR1ZFNWR0UWRPWXBBMlJsN01oN2lBNlp4?=
 =?utf-8?B?cncwNTZWZXY2YzBJQW1nc3l2bFJPMVZZTGdjUi9tM3VjSC80MWlLRklzbFNs?=
 =?utf-8?B?Q1pVQzIzUnUwR2hGdEtnYzc0RGhHTlg4RkUwd2lCUDI1OFBpTVhCeVBXRlVh?=
 =?utf-8?B?czRUZVVDUVQrQTMwWlVWQ0NUTVQ3Vk9xdzlDM0I2UTJEUGQrS2FhRnlxcThn?=
 =?utf-8?B?dDlYY2Y3Qnh4YVVoc0Zkcm9pWlpHQk1odko3YjFDeVBCdThWbnovRFphWVFq?=
 =?utf-8?B?MVVZU2IwZzllVHM1Yk84WFNseXNkcjMrZ1N5YWgvdEJPdnc0Q3ZiM29tZDV2?=
 =?utf-8?B?ZmtUTkxFU3U3aTc0b3ZuQjI2MW9CTDZncld5dzJkMmVZc1RTUCs3Z2RPN2VC?=
 =?utf-8?B?WnZ2YWhoTVZsNEd0L1RsVkJrYy8wdytId0dxSFRVS2RmSlU1OC9WSFlrN0sz?=
 =?utf-8?B?V0NJSS83V3pDY1c3Z0tJZGJtdUY1djBKVmFmS2dDZlJiMWF5UEN3OEJ5Slhh?=
 =?utf-8?B?cjA1YnVIUzIybjNkZmhvN0tGKy82elJQUlV4cWNDbTN5cjhtbEMyOGF0cExv?=
 =?utf-8?B?NGZ0YVg0ckN5NzF4R0pYcHV1NkJ3dkhzK3laY3hmSmZGSlphcjI5SDdEbG1H?=
 =?utf-8?B?S3dnbEhsd0VTZ3ZzajBnS3MzdTJodGxtYndlbHF1Zm1sK3ZJaXJuUzJNVUg0?=
 =?utf-8?B?ZUhhSGpaQmJaTXJVK0o3MGhLUEdlUmpiSUc5aUlzYTZsdnJUblh5VThhSVZj?=
 =?utf-8?B?NmJjQ2VZeE0wVDFVTnhqelNEODJSS2ZBOFJsVDRZRm43TVRCRDkxUXdOK011?=
 =?utf-8?B?TTBOaHBQc2haRG5SckJDYldNZjlwVVl1aXFrcHY0ZWRtZjZ3U21mOFVPU2Fh?=
 =?utf-8?B?NXZMTGhaVW41eWJ4RStTY3pJOWpNWGxKdll4Q05UUlJkUUdLQm5aUlc4QW1k?=
 =?utf-8?B?bXJyTXB0U2RaRkFtN05ZVi9CSnh5QTlGT1I0Nmo4R2VTK1RsUWhCdjhhMGZ4?=
 =?utf-8?B?Q2tUV0hDT0pkZTlnNjFaMjZ5YlpNU2YvS0dLQmliZTFrNDI5STl6YlVObXZY?=
 =?utf-8?B?ZUtkSGpWVWt2K0svSUtZRzRHOS9QblJoeEVBT25MclgxWC9vdGtoMmdFSktG?=
 =?utf-8?Q?fnoIqAIfhWjSN26eVPVtMJyna?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b215acc-09d2-4faa-88c2-08ddacd65dbb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:04:45.4618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hd4U733aUI1WjWuvfoAXsUDTWhSkEuiQ8iBo4uV2Nc3GijGsL0VeDSDINUo6aTkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952
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

On 6/13/25 17:18, Thomas Hellström wrote:
> Let the locking functions take the new struct ttm_lru_walk_arg
> as argument in order for them to be easily used from both
> types of walk.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

We could even clean that up further I think, but for now Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      | 24 ++++++++++++++----------
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 26 ++++++++++++++------------
>  include/drm/ttm/ttm_bo.h          | 23 ++++++++++++++---------
>  3 files changed, 42 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0f874f1e2526..eca486dff976 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -525,11 +525,11 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>  		return 0;
>  
>  	if (bo->deleted) {
> -		lret = ttm_bo_wait_ctx(bo, walk->ctx);
> +		lret = ttm_bo_wait_ctx(bo, walk->arg.ctx);
>  		if (!lret)
>  			ttm_bo_cleanup_memtype_use(bo);
>  	} else {
> -		lret = ttm_bo_evict(bo, walk->ctx);
> +		lret = ttm_bo_evict(bo, walk->arg.ctx);
>  	}
>  
>  	if (lret)
> @@ -565,8 +565,10 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  	struct ttm_bo_evict_walk evict_walk = {
>  		.walk = {
>  			.ops = &ttm_evict_walk_ops,
> -			.ctx = ctx,
> -			.ticket = ticket,
> +			.arg = {
> +				.ctx = ctx,
> +				.ticket = ticket,
> +			}
>  		},
>  		.place = place,
>  		.evictor = evictor,
> @@ -575,7 +577,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  	};
>  	s64 lret;
>  
> -	evict_walk.walk.trylock_only = true;
> +	evict_walk.walk.arg.trylock_only = true;
>  	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>  
>  	/* One more attempt if we hit low limit? */
> @@ -589,12 +591,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  	/* Reset low limit */
>  	evict_walk.try_low = evict_walk.hit_low = false;
>  	/* If ticket-locking, repeat while making progress. */
> -	evict_walk.walk.trylock_only = false;
> +	evict_walk.walk.arg.trylock_only = false;
>  
>  retry:
>  	do {
>  		/* The walk may clear the evict_walk.walk.ticket field */
> -		evict_walk.walk.ticket = ticket;
> +		evict_walk.walk.arg.ticket = ticket;
>  		evict_walk.evicted = 0;
>  		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>  	} while (!lret && evict_walk.evicted);
> @@ -1105,7 +1107,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  	struct ttm_place place = {.mem_type = bo->resource->mem_type};
>  	struct ttm_bo_swapout_walk *swapout_walk =
>  		container_of(walk, typeof(*swapout_walk), walk);
> -	struct ttm_operation_ctx *ctx = walk->ctx;
> +	struct ttm_operation_ctx *ctx = walk->arg.ctx;
>  	s64 ret;
>  
>  	/*
> @@ -1216,8 +1218,10 @@ s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  	struct ttm_bo_swapout_walk swapout_walk = {
>  		.walk = {
>  			.ops = &ttm_swap_ops,
> -			.ctx = ctx,
> -			.trylock_only = true,
> +			.arg = {
> +				.ctx = ctx,
> +				.trylock_only = true,
> +			},
>  		},
>  		.gfp_flags = gfp_flags,
>  	};
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index b78365dc1fed..600145cdeb9c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -771,10 +771,12 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	return ret;
>  }
>  
> -static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
> +static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
>  				 struct ttm_buffer_object *bo,
>  				 bool *needs_unlock)
>  {
> +	struct ttm_operation_ctx *ctx = arg->ctx;
> +
>  	*needs_unlock = false;
>  
>  	if (dma_resv_trylock(bo->base.resv)) {
> @@ -790,17 +792,17 @@ static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
>  	return false;
>  }
>  
> -static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
> +static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
>  				   struct ttm_buffer_object *bo,
>  				   bool *needs_unlock)
>  {
>  	struct dma_resv *resv = bo->base.resv;
>  	int ret;
>  
> -	if (walk->ctx->interruptible)
> -		ret = dma_resv_lock_interruptible(resv, walk->ticket);
> +	if (arg->ctx->interruptible)
> +		ret = dma_resv_lock_interruptible(resv, arg->ticket);
>  	else
> -		ret = dma_resv_lock(resv, walk->ticket);
> +		ret = dma_resv_lock(resv, arg->ticket);
>  
>  	if (!ret) {
>  		*needs_unlock = true;
> @@ -810,7 +812,7 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
>  		 * after waiting for the ticketlock, revert back to
>  		 * trylocking for this walk.
>  		 */
> -		walk->ticket = NULL;
> +		arg->ticket = NULL;
>  	} else if (ret == -EDEADLK) {
>  		/* Caller needs to exit the ww transaction. */
>  		ret = -ENOSPC;
> @@ -877,10 +879,10 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  		 * since if we do it the other way around, and the trylock fails,
>  		 * we need to drop the lru lock to put the bo.
>  		 */
> -		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
> +		if (ttm_lru_walk_trylock(&walk->arg, bo, &bo_needs_unlock))
>  			bo_locked = true;
> -		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
> -			 walk->trylock_only)
> +		else if (!walk->arg.ticket || walk->arg.ctx->no_wait_gpu ||
> +			 walk->arg.trylock_only)
>  			continue;
>  
>  		if (!ttm_bo_get_unless_zero(bo)) {
> @@ -893,7 +895,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  		lret = 0;
>  		if (!bo_locked)
> -			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
> +			lret = ttm_lru_walk_ticketlock(&walk->arg, bo, &bo_needs_unlock);
>  
>  		/*
>  		 * Note that in between the release of the lru lock and the
> @@ -970,7 +972,7 @@ ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
>  {
>  	memset(curs, 0, sizeof(*curs));
>  	ttm_resource_cursor_init(&curs->res_curs, man);
> -	curs->ctx = ctx;
> +	curs->arg.ctx = ctx;
>  
>  	return curs;
>  }
> @@ -981,7 +983,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
>  {
>  	struct ttm_buffer_object *bo = res->bo;
>  
> -	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
> +	if (!ttm_lru_walk_trylock(&curs->arg, bo, &curs->needs_unlock))
>  		return NULL;
>  
>  	if (!ttm_bo_get_unless_zero(bo)) {
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8ad6e2713625..4e52283e5db1 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -207,11 +207,9 @@ struct ttm_lru_walk_ops {
>  };
>  
>  /**
> - * struct ttm_lru_walk - Structure describing a LRU walk.
> + * struct ttm_lru_walk_arg - Common part for the variants of BO LRU walk.
>   */
> -struct ttm_lru_walk {
> -	/** @ops: Pointer to the ops structure. */
> -	const struct ttm_lru_walk_ops *ops;
> +struct ttm_lru_walk_arg {
>  	/** @ctx: Pointer to the struct ttm_operation_ctx. */
>  	struct ttm_operation_ctx *ctx;
>  	/** @ticket: The struct ww_acquire_ctx if any. */
> @@ -219,6 +217,16 @@ struct ttm_lru_walk {
>  	/** @trylock_only: Only use trylock for locking. */
>  	bool trylock_only;
>  };
> +	
> +/**
> + * struct ttm_lru_walk - Structure describing a LRU walk.
> + */
> +struct ttm_lru_walk {
> +	/** @ops: Pointer to the ops structure. */
> +	const struct ttm_lru_walk_ops *ops;
> +	/** @arg: Common bo LRU walk arguments. */
> +	struct ttm_lru_walk_arg arg;
> +};
>  
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target);
> @@ -466,11 +474,6 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  struct ttm_bo_lru_cursor {
>  	/** @res_curs: Embedded struct ttm_resource_cursor. */
>  	struct ttm_resource_cursor res_curs;
> -	/**
> -	 * @ctx: The struct ttm_operation_ctx used while looping.
> -	 * governs the locking mode.
> -	 */
> -	struct ttm_operation_ctx *ctx;
>  	/**
>  	 * @bo: Buffer object pointer if a buffer object is refcounted,
>  	 * NULL otherwise.
> @@ -481,6 +484,8 @@ struct ttm_bo_lru_cursor {
>  	 * unlock before the next iteration or after loop exit.
>  	 */
>  	bool needs_unlock;
> +	/** @arg: Common BO LRU walk arguments. */
> +	struct ttm_lru_walk_arg arg;
>  };
>  
>  void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);

