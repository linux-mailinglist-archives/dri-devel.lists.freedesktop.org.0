Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F66969643
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058F310E434;
	Tue,  3 Sep 2024 07:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ITiu+lhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000AF10E433;
 Tue,  3 Sep 2024 07:57:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RD1um6qm5QVF/vC8vDbPk+rQ3eVqXCaMTlqHxT59VQAMtyAI/0X6BEOZGMz++GW2cRH56p+HOJXCCBvKTCqJHvRgP/sgDps9Zw1Lzn5mc29OJSShx2doUh1uk3FGLSeSz9LyXnWxCB6ag+o2vo9lWCo71/+YwOWtanyVQnLu/dvlmbGNdexG+N/W4BurRydRBbku0OtqJdfUS73hZZhcr2tbUlmkqtjOiXpFTR/iLuGPNGs/DVDhRwLhFeqAtXqVTO1KEZjLLQx9d5PPJaCw8bV/n1JsDGqSTPhR7pCY+iopWJaCx7HeYj4dElwPV7uNbFmvMvNGkpX43aWQefAiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPbbxM5++1p2Zcjrx720bL2KDFvO3EOw2X2MR2bLTlY=;
 b=LCUvK20oXZFX8buNYlGiyd1U7AHNJcAIubuvDS6UlP0fEOQgAho1mjptjWJTbZev0mkZBy19gcOa/KstcT4pFNBvYc1PM8JkAgKc/D3eGwjaawjAHgfqHD34pPZ0pJkUzlANXxbE/GFfk4Jzct3WzK7DpryTBHhTTWUpQBWzYZnoMg4kMtwROcar0AivHzM37EDkxcbs1fgb+RefFVU6jnW5Bla2M7QuD3EJxpJi369Ieh3VZI67kTF03sVLBb1D/VU/oxCWEZ7ydP0Ujio7vN7G1p0Yi+4ULGq/KwAPQh2CwrqBQPmJgpLXmb+0XPFri3gPJRBDoOAe5NECaT3BZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPbbxM5++1p2Zcjrx720bL2KDFvO3EOw2X2MR2bLTlY=;
 b=ITiu+lhioRV7Bq7imMeshDI448NQtdZhCboLtmNZs6Tv8TtoRxTCx9pCUl0vKibvOcsz+4Lf91no18XBuV5yqvEBBY5yi1TzxDl0TWve50QuoY8t5yBfJfm/A4708akAS8McODmzglBzUwpX5/1FWQ20wKChugpF5e4elBjpgXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 07:57:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:57:06 +0000
Message-ID: <2faa3873-9d17-4f48-8d19-85a22f970aad@amd.com>
Date: Tue, 3 Sep 2024 09:57:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ttm: Move pinned objects off LRU lists when
 pinning
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
 <20240902154159.78871-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240902154159.78871-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: c1911da9-f32c-4918-cdc2-08dccbee014e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1lPVDk3V2NSK1IyT2Z1ZitETXpsSzFreUtiNEQ5bUtRS1BFYUM3QUl0RkdE?=
 =?utf-8?B?N25XMVZXOU5HUzRxclFMS1FDQkJ1R0wrUURFYkpteUJFQU9xQ09lWnhyOXNa?=
 =?utf-8?B?OWhZMW1vanBmYjZHUEJQUUtxdEVoalgyZ0ZDK3R4Q2R5WlkyYUxTMkRTb2w0?=
 =?utf-8?B?Ykl1OXhnak5hY25Gdk5CV3B1N0tWZnlpek1uSW4vSktUYXpWOTlTRmk1aHUw?=
 =?utf-8?B?WHZHelpjSnNzOVlsR1JmcWh3a3FBT0xaM0gxYjBndGEvNzcyMUtOS3lTMHMv?=
 =?utf-8?B?TXhRblBVdE5aS0FBWHpQRHhMYnFlcjNJUHR6cDlqaDBYV2dIM0NhN21wa0p4?=
 =?utf-8?B?K290V0VmbEh5RFQ3NmlDTXBtWkUybDc3bjJ5MXBIU2NWY3M4bjVhQVVKNktj?=
 =?utf-8?B?Zm5jYnFkYTVOZEg2ZEFsVWhFa0kwUy9KRmVoWmRJVkVBU25TaFRxNWx4REsw?=
 =?utf-8?B?V3haaVJlblk0Q2J4aDZDT0Y0YVFlc1Uvc05uZVRva1VoYThIRGZMUVAxSFZ1?=
 =?utf-8?B?QjNDcEFtU1ROZWZJbW1FdW9kSmVhTWdnd0dCQ1ZlMVJPbGx2OFYvWkgwaDJn?=
 =?utf-8?B?YWxrS0MvaTcwWXg0WkRCSVBSeVMya0MvSnNiQ0NCc01iaXNYWVhrRE5nTS9t?=
 =?utf-8?B?MFBKRXovb3FPU2xpWXZsRmlpQ2Y0OGJRNTdLMHk4a1k4Y0VtUDJpUVgvTDRV?=
 =?utf-8?B?ZkN5Q3VPdmtBekNqUjlTNzZId0dhUTFRY2tseHZkZDUrbk1LMWgyV1hVVmRr?=
 =?utf-8?B?Njdtb3ArL2FENmZaSGxnQVRKOGxuaE5vUmpjNXdBSGN2Wi9LQzlnV0p6cDRY?=
 =?utf-8?B?VFZjNFh4RWROWEJDLzJaV3l3V3hIZHNDVWNwVEdvMzdoUXpNcHVpeUVmRXgr?=
 =?utf-8?B?SjB6cGJadmpxdWhCV05IZitzWUViY25HRkxmQUxZSHhHSE9odTcxZUVWVXBz?=
 =?utf-8?B?eXd6TFIzYkNrblVDVVVPM2Vjc2Uvb3dweUx1cDlCUXdLY0Eybks5N21VR3o1?=
 =?utf-8?B?aVFBWk44QnVmbXB6RU9ROS9BYjI3OGx2Y0VKd2syU2dlc0EyTm9tKzd1cDE5?=
 =?utf-8?B?cThSY2E3TWxPUjhic1FPVCs1N1VxTlQ4N215eWV5TEJXY2pCTTBHOHdVSmI3?=
 =?utf-8?B?SURGV3RZZXp1WGZETjc4d3lucCtmcU4vR1NCV1RlYlh1NGVTOFh1QjZ2bHpu?=
 =?utf-8?B?RGFHL1NDZ2RXWll6TXVuelJrQ1MySSttUnU4SlhJVUJteS8vMFU0S2VwcUVn?=
 =?utf-8?B?ZS9CZmI5aG9UTGQ0VEkvblpZaWhQV2RrTmQ4ZzlUeEpKNlJEZGt0b1c4YktH?=
 =?utf-8?B?WmNHT01hcWZzNHJvb2ZNVGo4SXR2M2dhZ1NpYWM4dEY3ODFVeFBPUzFnNmEy?=
 =?utf-8?B?NEdreW1NRHZNc0Y4TkVKTkh6MWVBZitNSHdBZ2dSSFdBYXlUeEd2ampycnBv?=
 =?utf-8?B?L21aU05CSjMrZHRxZFV4RUJUTEJlN3gwUEN6aTFGOWhISTJrWkI5NHVucndK?=
 =?utf-8?B?LzRJYWpMWDhOelBzQmdxTnBkeTdMRlJTMWpRYy95QjZ1NXIvOS9GTTZUTmJQ?=
 =?utf-8?B?UGllUVQ5ZFdjbVJxOUNNbDVNRE11citHcmZnMnJOREh4cHhIMjVsS0k2bWVn?=
 =?utf-8?B?NTRCL29uYWh0Y0tPZWFoTUwwRmx5QTBzRnNUQWdmRk85Sm50Q2hPWDcyZ1hX?=
 =?utf-8?B?aHdMcU5RN3d2K3dVSWJPNlRCR3B5VkJZY3RMZTNEVUJkR1p3S3NBUStsc01q?=
 =?utf-8?B?SmttRDRlZ0NURkdBemhuSEQ0N2t3SHpIb1pVM09JUkRUNHo3TG53VGtUVnJH?=
 =?utf-8?B?R0NURzN6RVN6VlVQUXhkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0V4bFI4cTRpSUl5YXdKZ1BkamxhUStWOHhOajdNaDdTOE5NQjZKMi9KZ0Zx?=
 =?utf-8?B?cWYyOUNRNW0vR3U4eDJmZW9xZ2daOHZFb2orOVh0amxRKzcrSEswcjY1MUtD?=
 =?utf-8?B?aTV2a2ZOYVFVVjUwVjZWYUt0ZHh5ejNsV29zSm95NUl6ZW16OHdPbm1BRWJt?=
 =?utf-8?B?cmNhV0JVeVlPcUtDNlFiZ2I3YmpRM3dieDd1aGJYUUwxWUYzQ05Wd3lGSlNr?=
 =?utf-8?B?YUdIQ25KRUl1bldiRXVkOTlYY2N6VHVqd0xLMkZINk4xUW05S2hPcG9QaDFD?=
 =?utf-8?B?ZnZyL0VNL2pZbkxMSitwbk01Qmx5L05BUVZycjdGd0FtNDNCMDJDLzc0dWY1?=
 =?utf-8?B?d0NUVkV5TXI1RG9uWFJJY2QvdkEwSmd6NUE1clBFbFR3VldjVlQreUt2VGdi?=
 =?utf-8?B?WkhFNmFtbTUyWTBlalVMYnJVNkx3SUEvTzY0Y3AzVXpWSmdiZmRsdXdZVnFv?=
 =?utf-8?B?SW5xSDgxV0ZhS1NLeVE4SXRmd2pvRDZ2NC9ra1FuQm1qeTdoRG9ETE53dVRq?=
 =?utf-8?B?cUV2TjhCWHRnbmpGcU1iZ3FCL2FvandWQitCV3ROdjdNRWhqQzNycFdWc0g4?=
 =?utf-8?B?MUZvT1FQUy9JaFFyNWRqV0d5WWVKdnVENElnZVBGNGZYdFkzdVFxTzd6ZVpy?=
 =?utf-8?B?VWVoeWdPTEFYWlc1d2lOa1lzWW9wZ0ljdDVSS1dhOUNNZVJVMm9YNklvY1RK?=
 =?utf-8?B?ZnY0YXJRUE9idDZrQTNYOXB0VFIveVJ4UGJ3M0M1U1JVWjZnQW5NTHp1eWc1?=
 =?utf-8?B?NlcwN0VhVjBlSlpTdkV6RTd4N3lXcS9vNEkyNDRqMkNoamQ5S3V3cVYyNENU?=
 =?utf-8?B?a0ZtaitXK2tkNXlVZklDZXVaUTMzVGV6dGQrcFE5cnVoanNWWjNQdlQwd1NJ?=
 =?utf-8?B?OUxzNm4vWkRoUDFHRlUwVWt6TlJ5bXE0bTdtTTcxWFpRTTNhQ2tiNzk3aVdu?=
 =?utf-8?B?R3E4b2txdU9mTXUyeEpuL0RCbXcvd05pemNBNlpISXNVV29XMTQvYlUvT2lH?=
 =?utf-8?B?Rys3R1RUaXZrTE9UVVBUSW9iLzNadmNNYjE1emNQMllvNXJNYXoyekplYjNS?=
 =?utf-8?B?N25vdEZFdmF6RS94RzkreVhDbDBqeElqbVdrQ2gzMVJnTUJhWm5TbERMRzJ5?=
 =?utf-8?B?RmIrVXNtU1paNnV5a0U4SzU0SGJVK3FhQzI2eTVZTnNTaVRMLytJaExKcmFx?=
 =?utf-8?B?VUZsQUtQcjIzUWVBdmZ2UWFqZWxkdmR2ckMxN1FYOW03emEzdG9tMHVnVWlT?=
 =?utf-8?B?bFIxcXJ1Z1hhTDBMVWtralVpMHhMNnM3bGNhZlptUHFXUVZ1NTFNNVlkTlZa?=
 =?utf-8?B?K3dLekRmd2tjUFpvYnRQREdiUkV1RGxsZnovVjhIaVVSK3ByUG4xelFTNEpy?=
 =?utf-8?B?bVhIc2IxTTM0dG1mcStCczUycDl4Ukc3SEJFZDUzT2V6OFA0Q295TDRJdmtS?=
 =?utf-8?B?UGZkMDl1RmV4c1FXTVF4MUxvZ0xqNFNjZWRCbi9aSnZCa2NDbUhNK1RlY1RU?=
 =?utf-8?B?ZkN6Yk0zWmIyTjVxUUZIeVMvVEtxdTdnZ0hMbnNBb01wWXpQamZ0QUNXVzli?=
 =?utf-8?B?dDlkY3VHclBCVFZwcy9CeUtQeWNhU3JIMU13UUNjQ0ZkOW1MQzdDOGgrMHpt?=
 =?utf-8?B?aXFBNUh2MmJBNytPVlNmdEhLTXd2clVaL1NNU1o0UGlxdW5PY1NVcVNTUzBs?=
 =?utf-8?B?V2g3VU5MQkprUHZxbUR6WTJpNkd4dVNDR09aNW9CaUwzanJ4VlB6QzRRZmRI?=
 =?utf-8?B?Mis2a2pxeHBLVElFMnRVQ3VBanNWOW5iQkpWcmExYmh5VEhHMmpNM1k3SEhU?=
 =?utf-8?B?L0lYZnBMM3hXMDhweFdIZnNpWHl4VTVUbFk5akJucHlYZnZMWnBYUlNJQlJK?=
 =?utf-8?B?Z3M5L1g1NEF0K0J5Rk1henJ0Nng1SUJtZ1FOVzZuS2d1ZmlKdUdRYzlTQktR?=
 =?utf-8?B?bzVqQm04TVZrektIZHVsS2ZjSjVWdXFhaUd0OC9YNXBZVkVlM3NKQjRBV2xn?=
 =?utf-8?B?UnpYdnZ1dGRkMVZlRTVKaXJGT2R1NHRJV2lOUnJVUkNwQVMyRG5ZT0FZUzht?=
 =?utf-8?B?NTdmaWJjR3hLM0x4clk0NVgxcHd3TFFwUTFkOVBUNHVyaXNvNExZM1d1OGZs?=
 =?utf-8?Q?feA479KbNbcawbKQk5FYQQek/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1911da9-f32c-4918-cdc2-08dccbee014e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:57:06.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Yz0UlRiTgW2quJFlvIz7JvwGY87tpuq+TtP/SFBTlm0qispKsipTxncbSET5aTm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127
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

Am 02.09.24 um 17:41 schrieb Thomas Hellström:
> The ttm_bo_pin() and ttm_bo_unpin() functions weren't moving their
> resources off the LRU list to the unevictable list.
>
> Make sure that happens so that pinned objects don't accidently linger
> on the LRU lists, and also make sure to move them back once they
> are unpinned.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I really can't figure out why we removed that. Anyway Reviewed-by: 
Christian König <christian.koenig@amd.com> for now.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index d244566a7e48..057a65f51969 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -592,9 +592,10 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
>   	dma_resv_assert_held(bo->base.resv);
>   	WARN_ON_ONCE(!kref_read(&bo->kref));
>   	spin_lock(&bo->bdev->lru_lock);
> -	if (bo->resource)
> +	if (!bo->pin_count++ && bo->resource) {
>   		ttm_resource_del_bulk_move(bo->resource, bo);
> -	++bo->pin_count;
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +	}
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_bo_pin);
> @@ -613,9 +614,10 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>   		return;
>   
>   	spin_lock(&bo->bdev->lru_lock);
> -	--bo->pin_count;
> -	if (bo->resource)
> +	if (!--bo->pin_count && bo->resource) {
>   		ttm_resource_add_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +	}
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_bo_unpin);

