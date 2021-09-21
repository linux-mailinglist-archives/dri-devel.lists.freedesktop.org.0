Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD78F413289
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691996E94E;
	Tue, 21 Sep 2021 11:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02846E94E;
 Tue, 21 Sep 2021 11:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1rF85gkjylspxB48t8D6OnQbMz3qMo8Ref1yMEqDAgYAGE+8UVxnuJlLAgUnvajKuXWOeCaK9Fzgu4Mucf/ZFcUGChePS1dy6o7KkoVJosBtPU2gykAX2fZzmiePKDKOf5yBU1db50lEfBk4E9fsYINYnpy//r/5CV30qIWrWp3ybUNBqGlDnIIpIfAZFcIZpSXSsKsw+wO9eg4i/DGt84Lt+MhqKIwVGJiR0ZhLaSQ29gPp+1YpOkWR8gf+0JncL5zpej5N164B0XoTrx9VVL+kj2FRbd1b9IuNN+57BLdFq7OBmkoVyHBwLuJaw/6D9HKe7c8trP/QT9i/s8nJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gEM8FjwJd3zFw0XG4GyfIXfjf7oLlBXnan0xWK1GgPQ=;
 b=N4C1YzM2aFcyiEjrpNk9N1R4s5NhUQmuOvodOIJgfJe8FxNAHGImjUDSQA4Gqf2tk7dk3DKpEVajO5RMXmBSNn6im5kSENb4hJP209knuTvRw8L4QturBVxTQ2IGpBOHlLkzZyz3awkJ0+kSBZopoVf65U3aYnI1ZDa30yMLz0IiDXA3FjcmGuB0SJrR3Akq2Wsf1xDLrkKbBu6ZglZZ79rxJ8ah/7ilXIDZcAwCGAsfZJGaSXJHNLraY5y9J7yymO0q9feNsMR5Tk2aG2oeZI4N0Z9OT+APRDdHaJP7epWfOw1fO7gHzrkfxP7U/qaeYXt9yIjD8Qnc4v7LKcUqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEM8FjwJd3zFw0XG4GyfIXfjf7oLlBXnan0xWK1GgPQ=;
 b=QBYzE6bBUGvQ4MmWOE93z/YIc0uA/oaj21o02TGCsn9t3qI8XbaJ1mUps6GUrv46Pk7C3WdpPzG6J7pH5H1+fja9jh5N0WicAAeNAFa9T18lXGayHPeu+1D8f4Iy6PFqWDZHP9qb4FkFdrygUEAPsPW+mwB160Ur6jOdDRBiL/4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:29:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:29:34 +0000
Subject: Re: [PATCH v4 03/14] drm/ttm: move ttm_tt_{add,clear}_mapping into
 amdgpu
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a93a36b6-d7b6-c2b3-51eb-46e44975e43c@amd.com>
Date: Tue, 21 Sep 2021 13:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921110121.3783395-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:29:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e05279cb-31f4-4dd4-d1b2-08d97cf3164e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-Microsoft-Antispam-PRVS: <BL0PR12MB48995DBEA99EECC3E058E9CE83A19@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16Y3HOZJ3ltznc0ihjfXbZvxMQD4eGEYkt1ADhRclZP58PPzAXbdrpZYdDr9+NkgaXD9SRd0y381Y6TwX7TW24xRstvdKF1g7R+1sr2EjWdMFXwRNIctnyWTG4mJCqBUHBedYJK+wkWanw/x5tOrWM6/ChfCgW7Zl7g5Nm9ffji6A56Wg8Yt3xcp8CNfNRXdaPs6vfe11nG7ZCMpr+mqgaSzGN235Ge+Fxx2RldySgCV1MvAa04r6I7m8FehB3+vCtnSO2eIYBDNeRVlgWfHGd8iyfeBpkj+Vmj8LlrDl/vawzOXtlkCGzLHGIcLLiFN+NmNLJSqEmfzHmfhsUXrfjDTWSY6pB7IoUPLjlSxnBLpl0Zh5Op2f5ovFzzWfMaLEM3OLVk9rNOfGx5+3I4qpf3hgjv4RhCNFn/9cUMoV0nUtYNYZGk2CbTC4rCAAaDr8ILyd0YyXFVTyYYCL0ThjkSzb4vjHCDnLsckWddLpOQxmsULhazinoJZy9EuIEWMyLUt6xxJNbFDFISaHT+o3++uSJ+TFfGoPonhn0J1r+lou/J4t8HER3MuxS0DjClih4u6dj+2n++T3o+CB+bjq5zurl+8cfPhA7n+xUqkNsbgnJY/ZXS03gDw9FTw2borH3l5j9q9ldloDkeDP4Wn9IC5R0VGWEsx0YdVbmqY6kdaDIzX3gKPWj5AkmFwW56/HKqmXjKSxekxyOeJwKfVi2FEyzYsDjOwgVQlIQi3XWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(6486002)(186003)(66574015)(38100700002)(6666004)(83380400001)(66946007)(8676002)(31686004)(31696002)(8936002)(2616005)(316002)(66476007)(66556008)(5660300002)(2906002)(36756003)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZoZC8wNUM5bE5IZ0x3WnRucFdmck81eDFjMFp1RzdkTXVRNmUwbmY5WlZV?=
 =?utf-8?B?dHMwMnYzeGwxV3dLOUFVZE80OTNrbzJTV09yY1gxY0pCMXV6eTBjNHFIV3oz?=
 =?utf-8?B?VlRQUTduQTBkSWpvTDUxNHhUNzhZUmxvUGNiNjFSRmxTaitPa1c5d0lXOStN?=
 =?utf-8?B?dTR6VHZGUnJYV05MSDBUZk13ZVhIbDB0SEowazJ0OGh4bG1BRnNFZEtBOHBn?=
 =?utf-8?B?eExIekpkUFgydGlHMGdkay9GaThYNnA1Wms0UVM0dHdaRmQrYVAzeElWNnpy?=
 =?utf-8?B?THd1Njl3NEc1eHpOSTVDUDRodlgyZVRhNU9aTTVJVytsalhVK1NaeEg4WGor?=
 =?utf-8?B?elVmOXlka2hvYjU0Vk01OTBKVGNUeTQ3UGZlVWpOZm9ucnV0dlYxMGM2UlZ6?=
 =?utf-8?B?TDgyN0tLYUlLMkdhRWpFSXRaVzJJcW9LUStoRWN5eG5na09qN09hbWpPRkIz?=
 =?utf-8?B?WmtXMityYXUrdEVSbDVoN3VYYzQ1OE5GaFRrMGpPekdPYkg0U3A5TlZxNkZ0?=
 =?utf-8?B?SmdoU05zT0xUY2VNeE83Ykl0Ylc3UitTUTRDeHc2L2Z1YW5UaTdiMjJHZENT?=
 =?utf-8?B?cjJXQjVGRVlzZTZ0dWFzdzUyUC9xZnp0TjZLQ1hzcG9sV25pRGZkTlk5WHMr?=
 =?utf-8?B?S2F6QkUxd0Irb2dvbTI1WFBCcXBkSVJQb0ZrbXVGSVFwSkRlY0NtV3JDNW1w?=
 =?utf-8?B?TURIcUtxMUZwalZjRjQ3WWtXWmxOVEkzZDZqamdLamJwTWY2aVVaYVRkMXlQ?=
 =?utf-8?B?OG1GdXEvbnJ1d29jODhKekVuTGEvNDVRY3VpV1JFQmlWMDRSandLeE91amhq?=
 =?utf-8?B?dkxlTnc3aFk4YTR6V2J5N2VWOUYwTWZpZkVEQWJKNlB5ak1BTVNtMm5yNW16?=
 =?utf-8?B?UCtYS3ZuemFnSVNjd2gvcGRna21tUWV1MU1wSThpbWNwQ1ZsUHRra0NSdUwz?=
 =?utf-8?B?U2ZMbzN2Tm1xVmQ5WEpGOEJnT0QzNFk5L2hHZHJ5K1J2bjNKT0Y5QkxQQ3pI?=
 =?utf-8?B?RFFwd3M1SkxaaDFyMXdwbDZpeHpabXA5NWtvVXpDSE1DaVZ2MU1sR2pyMGVh?=
 =?utf-8?B?TFJaelNHM1BKTDZBQ3lRN0JVeFhTZWxqZkxvMWVPK1YrdFdvNzZUM3k1SVhz?=
 =?utf-8?B?RXRNcXl5Nk5lMzlSbHFGa0JuSWo2T3Q0N3orNkVMMDc5dS9oSlN5bXoxWmN5?=
 =?utf-8?B?d0FMNTA0dlhrWld6WWh3djJHVTNrUW8wczJ1dkt1dXFwekpCdm5uVHN4YWxk?=
 =?utf-8?B?ajB2V1NwNDVKQ1RCKzdubGZpYzhqTHJnc0Mzak5uT0tEQmxlWEo5RVNpWUhB?=
 =?utf-8?B?QlU0NzF4MmZ5azBOc1hZczI0U25QbVFYa3ZITGwxQWQvRkdRK09pT3pNRkdm?=
 =?utf-8?B?YVZVT3dpSDdFT2FVbnY4b2tBRzFXa0FHTTN0YnNFenRNOVhjQkRhRS9jSjd4?=
 =?utf-8?B?SmZVUHZIeUIwaUI5TytsbUJFaGQrU3VDRU1lUlVobm5BQ21SWjlKNWVKT09E?=
 =?utf-8?B?QU9PUDlncC9jOGw1SkRFZzArUVI3S0dSWksrQmdIbFFqN3dUR3dRZU5RYnVW?=
 =?utf-8?B?OVVCOVFmeDhLbzgyQmgrUXhSSnQ1M2lhTVlGaWxWdW54c2pNMmZhQWg0Ymxh?=
 =?utf-8?B?ZmllSTI2QU50ampUN1JVNFF3Z0cvZXY2blhPSHp2WU02dVB2N29mbFlsb0N5?=
 =?utf-8?B?b2JrOU5jNk01Y2VCcXdySjdyeWFGTjF4M3NkdWhtRHBKdVRHd2dtV2JMUVdU?=
 =?utf-8?B?V2NhM25YN0thTVREa2JEQ2lNblAzdEZvT241dlU0emRJOFhhK1RZakJGWmpa?=
 =?utf-8?B?U2lNWCtSODE2VnNFWmhtZUlncUdVc3JRMnkxMFdXUUd1U1B3Z2xHSkp0cWE2?=
 =?utf-8?Q?Fns+HqH17p3ph?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05279cb-31f4-4dd4-d1b2-08d97cf3164e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:29:34.4266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6REpVb3zIR/FA2UWlIPZf4Rs/GUU/ZGb7aFGqI9KzJlzSK+hsTTBol7aY10PTJtq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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

Am 21.09.21 um 13:01 schrieb Matthew Auld:
> Now that setting page->index shouldn't be needed anymore, we are just
> left with setting page->mapping, and here it looks like amdgpu is the
> only user, where pointing the page->mapping at the dev_mapping is used
> to verify that the pages do indeed belong to the device, if userspace
> later tries to touch them.
>
> v2(Christian):
>    - Drop the functions altogether and just inline modifying
>      the page->mapping
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 ++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_tt.c            | 25 -------------------------
>   2 files changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 820fcb24231f..438377a89aa3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1119,6 +1119,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
> +	pgoff_t i;
> +	int ret;
>   
>   	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
>   	if (gtt->userptr) {
> @@ -1131,7 +1133,14 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>   		return 0;
>   
> -	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> +	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ttm->num_pages; ++i)
> +		ttm->pages[i]->mapping = bdev->dev_mapping;
> +
> +	return 0;
>   }
>   
>   /*
> @@ -1145,6 +1154,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   {
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>   	struct amdgpu_device *adev;
> +	pgoff_t i;
>   
>   	amdgpu_ttm_backend_unbind(bdev, ttm);
>   
> @@ -1158,6 +1168,9 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>   		return;
>   
> +	for (i = 0; i < ttm->num_pages; ++i)
> +		ttm->pages[i]->mapping = NULL;
> +
>   	adev = amdgpu_ttm_adev(bdev);
>   	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 1cc04c224988..980ecb079b2c 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -289,17 +289,6 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   	return ret;
>   }
>   
> -static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
> -{
> -	pgoff_t i;
> -
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -		return;
> -
> -	for (i = 0; i < ttm->num_pages; ++i)
> -		ttm->pages[i]->mapping = bdev->dev_mapping;
> -}
> -
>   int ttm_tt_populate(struct ttm_device *bdev,
>   		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   {
> @@ -336,7 +325,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ret)
>   		goto error;
>   
> -	ttm_tt_add_mapping(bdev, ttm);
>   	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>   	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>   		ret = ttm_tt_swapin(ttm);
> @@ -359,24 +347,11 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   }
>   EXPORT_SYMBOL(ttm_tt_populate);
>   
> -static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
> -{
> -	pgoff_t i;
> -	struct page **page = ttm->pages;
> -
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -		return;
> -
> -	for (i = 0; i < ttm->num_pages; ++i)
> -		(*page)->mapping = NULL;
> -}
> -
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	if (!ttm_tt_is_populated(ttm))
>   		return;
>   
> -	ttm_tt_clear_mapping(ttm);
>   	if (bdev->funcs->ttm_tt_unpopulate)
>   		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>   	else

