Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633624B55A6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8C610E1D0;
	Mon, 14 Feb 2022 16:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3DB10E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9x/A5WlRhTrZ08pE/8IO3bKLfrWFcCAgjyJn9TtKdw/58rRPXKIps6pf4v2Xv674Fn8qIxMS5W6TFPICzuNWMN3LL7c5dJW39gUxaxaeipJipR+kjmCgJ5wT2WIN9BbdGCSGw0t2caOiuT5ub3EyAiglDp6rF/zAjhQV9rQJGBrO1dasyNSGLyokY/RFD8S/L7gw66/nOShBzDvr9X5RpUmAi/PTIh3WHLQKUjFuDSM1c7jaRqQyqcc0CtBZNDfTcK9VIu+4Y92OMmD0waeHuyPcDtbnXhsM3RwatU2nz73Cbm/oQdvmkbKumlczy2TaVwLdlmuOMPTqiW6/ncoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joKWd5uEEQVK9Y5NnXDsx49K7vgxeDsMH2fGlDHdMCI=;
 b=HL3wKZAQNzN+riV7RL19DId4KKfnX09Iva0hbqwkCdST5OyqbBJzGO1DbSh4VFgVt5QC6h5qs1j4W8ltserlV5Fe5LNXGYIi67wn8R1oioZHRwqrzf9zsww5fD474hJRMMfCgV+SYVx+EQ8EMHXpJjLpwt7vcIiIFhf+/WlZgS2nl7pJHLYOErnVH0yb8zdDCBES00TTztDLQeu38RPBNdphHY20AB2GLmP/bYN6UpfoWJykbxwajkLSvGcB9LCYCIBU7cjVzXz0LMDqhB5Bie0UydSrl4mm1+z3NQNDNFWoxURn1fOusGt6ut9pLa8ic8QqSYFyrHY5E0JaxrtiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joKWd5uEEQVK9Y5NnXDsx49K7vgxeDsMH2fGlDHdMCI=;
 b=PNs/fVyw8A7scmR1CvB7fwNgrpBR6it0JXkZhdItqBp4EhtQyTN5ltyF1HhJ/MpTbcJnr0QHzeS7apOx0Lld34gcRdd1UeKWNf0ktteEgT7ohtlPiPMHpffIlGDOswTLD7I8pxve4nh8gyMlaJ1MH9zjrRd4u3LzWHe+Q3Is9b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB3599.namprd12.prod.outlook.com (2603:10b6:208:d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 16:09:24 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 16:09:24 +0000
Message-ID: <22a3fa0d-c252-d047-f0ab-f2a81434403a@amd.com>
Date: Mon, 14 Feb 2022 11:09:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/11] drm/ttm: add resource iterator v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-4-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220214093439.2989-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb125a47-c42e-48ce-8b58-08d9efd45e08
X-MS-TrafficTypeDiagnostic: MN2PR12MB3599:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB35996775ABF42644BD867FA992339@MN2PR12MB3599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtAbRW5EaKO1SrtkW3emFQuvrUeO8vIs4K0Li/FHzAvxoJgGJx83h5Vh58xHOVzf9mdzzltTZqaA1PRkWV9g4ez5fLy22r9UDgPQJzTDA2ayMnlS60wNaG6OpiBf8Y9gcddj/mKiD9omoQwIKMseAjzJfRYX76de8gvyHHoAvSiOLYtu7s7oEzrUONESGMmJdApv0ekPcJO91znsQ9IFAyap+rYR6EBKWQXNoPTsWoE6CWu2UJ1/ZkPQWUfoXLU/OKfFWK57/zQhuNiXP3dYqQCb+S4ClhfFwDLYYbx6sppW4XFul+wDpBs5N/qs5AK149srD5Hh9/87SkP28pIJP9WR44dfvBEWVQ3JxZOdsgyyGItAGXT6yxXcGb3gLXy/FEvaPHg49XZM084s0QL+yKRl0zOKRvZw/d7Pp0EhxO3wkP+kC2ils04I0gkwVeQ7A6r/cyGNW3LpP+1ZhTCb3ivTSWZtWL8gVw7lJAVwccArEVypofxowcdtz0F/vSEimjy66lJTgLqYoeBMkJZMZ+PXLWaCJ1/BJSTJamgkEuSnyg3U4lPUSHpx/4T5dQsyXIA1gL6DyuhJnxfNI0ZrAkP+k017hs+iMcjB++guHhQxgIf6j6yX2oxZWPrsqahSTWdbUiupnAiz8WHC/rZNpx3nrF4wfBk3T/Nv+SGGOO5Kra3KZ1yzgD+LWNxyMO54cf89c8ShHwL4D7Mg6v1xcixKlYnj3SdRgU1+fTzM4DEy/zwYW+0imbVRKResDTVS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31696002)(26005)(186003)(86362001)(83380400001)(8936002)(6512007)(508600001)(6486002)(6506007)(6666004)(38100700002)(66556008)(66946007)(66476007)(8676002)(36756003)(2616005)(31686004)(44832011)(2906002)(66574015)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBvTmROOXl5dVFjc0RsMzdETU9QU1N2T3VJUlY5YlFGUkJBdE13dkxtYWR0?=
 =?utf-8?B?VzRCYTNtakdvRDA2blgwQWZnRjdJeGVxQU1qUy9CM0tPYnVuZGZTK1poNE55?=
 =?utf-8?B?cXBMdm1ic2NkTXBVWVduRnhHL0tvVWM0S0VPUGFVS0VwWDF2bWpnVERXRndQ?=
 =?utf-8?B?ekJvWHI2cVQ0cG9hU3VsbHlaMG5nNW0vQTNGeEVnSVVvQ0daMTByb3JLK1FD?=
 =?utf-8?B?L2dTNDdlREtmVmdaWWRFSWZzbjh3aFZuU3NHT0VlbVZ3cittYkNtZ2cxenRZ?=
 =?utf-8?B?MVFBU0dxNVlndFNJT2xpTXhYVUpORkVXVXpWTXk5UGJCVjVvajV2VmY4UElv?=
 =?utf-8?B?eTdXaERtOE9lVU4yZkNzL0R5K3M0bXBDL3BLcy85NlB0SXlnaHE5SlVtMzgr?=
 =?utf-8?B?b0xHYjg5TXBtQ05jL1RHQldscEtVN1NKTVNBdHlWdEdwWElOUCtHWFFwRTdD?=
 =?utf-8?B?V0xoSGE5RFphVkZ2RW5lZTNPOS9FYzdodWtKVk9pUFFQVWJ1V3p6MDhURE9F?=
 =?utf-8?B?eFhLTjNQZ2w1RFl5VGNaS2w3RmF1OU5xRW1jM084WDRYVjF4VzhMRVNlSWg2?=
 =?utf-8?B?cVFaS0hCWEJIWVJDWXdRaHRUeGQ5T0FKaDNMYnFoQmhFWEZJSThNOTY1MXV2?=
 =?utf-8?B?WmZkMndRcFdZSEJWaWxUcTZ1L0kvZCt6dG4wNzBEVUw3aDU2YkwrQVZZUkVr?=
 =?utf-8?B?WU1SN2VHa2h5RHNkOXFXTzBDL2l3d0JCMEpNcCt1RUowcmYvNXdFdndCSjE0?=
 =?utf-8?B?NENkTVJiNTNIRlZMNHdLZWV5RkhxMmtMbkUvaTlqSkNjU2xPa1Y1YlgxeGRq?=
 =?utf-8?B?ZFJJL2hUaHZYZUdYOG5Sb0VieHRwdUVIeWg0V2habE43cUh6TjR6Vmw1TUx1?=
 =?utf-8?B?U3A2RXdNelVqZzY3bGFHYjZOeWhZUkV2M1liazMrOEVzdldacnMwak9mS0pK?=
 =?utf-8?B?ZUFHSEljTUVpTHBseXR1VzJNTjZ5cjJsTU5GRy9RVVRTRzljWUpwUSt5Wngy?=
 =?utf-8?B?VDhYWUd5YWU5OGZKaDJGbENYKzc0Umc4ejI3bEk1aVp3cEtlWjZUdVhyR2JH?=
 =?utf-8?B?cUpMTWNCM0hocE1ycVVuQUxYVnordXVZWWFyQ3I2TzBucmNOejF6dWU0VmpF?=
 =?utf-8?B?MlRVTDdEcWdhNlg2T1FINTZPaFkxZmxveEYzTFNMYlkzZTZVbEp2WC9yMXlE?=
 =?utf-8?B?NXZOSzhiN2ZERFgzdmhmRjFoNjNZNk9MWkd5NlNWOXd5N1BnZ1RKZ3NNSkMw?=
 =?utf-8?B?bDRVZTJaaHVmcUszcDhQOGt0ZzQvMzEzQU9BdGpyWjRyb05QMENsUU5XVjQ4?=
 =?utf-8?B?blhRcVk5M24rVncyZjNkbEo0dThXUGtrNDJzMlBzS2xMcExMNjh2Ujh3K29J?=
 =?utf-8?B?RDdrazU4c3ZJY3M3dWlPbkJXaTliZUpQMGJreXlLS2FaOHFQR1RXMFp3YWkz?=
 =?utf-8?B?ZSsyWE16NXMxRkNrNVU2cWdjT3F1U0NRT1VucHNtZnZRN1o2aS8vKzJMRE90?=
 =?utf-8?B?SExZZmk3RUxkM2xpWkYrUlZ3VXRNSW1CZWVZTEp5VTczYUhTNDFmNzc5WTJO?=
 =?utf-8?B?aW9pOWZrbDAvRXhBVk9oNEJGQVFuOFFZRnQvK0xoZTI2Qmw1UnZiZmQrTkNN?=
 =?utf-8?B?d3YwU3JPMWNhRlYwRWhoMnBtUnVFUVpuTGQ0eG9SbGx2M1FIRE9uYUNyc0J0?=
 =?utf-8?B?ODdHSHdPb2NiVnhBOU9rbUJxakRhRmJ6N0dqcWh4eW0yK1lML0k3NGRUaVFV?=
 =?utf-8?B?eWlqc0VBY0grVHpSWlMyam1la2ZkL0Z1dlg1Q2Q5VG1zWHBJTEFUWi9odS9k?=
 =?utf-8?B?OEVqSEs5TGR5dlFyUDZxa3E3aDFnYzJHeGQvZ3VOMDNkNVFQc3lQNTZpN3d0?=
 =?utf-8?B?cFh1VDN3Y1FYZVJOaGxWQXBDWmg5YjM0U2NkcDRrVmk0ZEF3eERpWlZTNjRI?=
 =?utf-8?B?M2pkSUE1cTRYY1lFMU9JbXNzZXA2YUNUMitsMmxHeHJlNTQzNndiRWUzdjVu?=
 =?utf-8?B?T2hKYXlkM1BQNjhhRU1oN29XN2dLaGpqSHcvUkdWNm5TRTV3SEdyVVVXbVl5?=
 =?utf-8?B?enVwajVFR0pqRHNYNktkRUpjekRoSEZTU3ZlWFQ0anhsdXdxazdQMEl4R2dE?=
 =?utf-8?B?anY4NlZ4UmRuZStOMEhzK1FvaHo2S3ZhSG82NE1yUjRaYXBKaUlXbGIrSzNT?=
 =?utf-8?Q?KdS+Eh1ibjldT50iSgn6KUU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb125a47-c42e-48ce-8b58-08d9efd45e08
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:09:24.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bobeo5aHtpvvtae+vXcdSKhLWFnSxxOPC6pUY1mIFdi+T00hKmz/WJl9qZxiitlMT/hB/XbEX3wO7OQd0rS+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3599
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


Am 2022-02-14 um 04:34 schrieb Christian König:
> Instead of duplicating that at different places add an iterator over all
> the resources in a resource manager.
>
> v2: add lockdep annotation and kerneldoc
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 41 ++++++++++---------------
>   drivers/gpu/drm/ttm/ttm_device.c   | 26 +++++++---------
>   drivers/gpu/drm/ttm/ttm_resource.c | 49 ++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_resource.h     | 23 ++++++++++++++
>   4 files changed, 99 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cb0fa932d495..599be3dda8a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -579,38 +579,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   			struct ww_acquire_ctx *ticket)
>   {
>   	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +	struct ttm_resource_cursor cursor;
>   	struct ttm_resource *res;
>   	bool locked = false;
> -	unsigned i;
>   	int ret;
>   
>   	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(res, &man->lru[i], lru) {
> -			bool busy;
> -
> -			bo = res->bo;
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> -							    &locked, &busy)) {
> -				if (busy && !busy_bo && ticket !=
> -				    dma_resv_locking_ctx(bo->base.resv))
> -					busy_bo = bo;
> -				continue;
> -			}
> -
> -			if (!ttm_bo_get_unless_zero(bo)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
> -			break;
> +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +		bool busy;
> +
> +		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> +						    &locked, &busy)) {
> +			if (busy && !busy_bo && ticket !=
> +			    dma_resv_locking_ctx(bo->base.resv))
> +				busy_bo = res->bo;
> +			continue;
>   		}
>   
> -		/* If the inner loop terminated early, we have our candidate */
> -		if (&res->lru != &man->lru[i])
> -			break;
> -
> -		bo = NULL;
> +		if (!ttm_bo_get_unless_zero(res->bo)) {
> +			if (locked)
> +				dma_resv_unlock(res->bo->base.resv);
> +			continue;
> +		}
> +		bo = res->bo;
>   	}
>   
>   	if (!bo) {
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ba35887147ba..a0562ab386f5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -142,10 +142,10 @@ EXPORT_SYMBOL(ttm_global_swapout);
>   int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		       gfp_t gfp_flags)
>   {
> +	struct ttm_resource_cursor cursor;
>   	struct ttm_resource_manager *man;
> -	struct ttm_buffer_object *bo;
>   	struct ttm_resource *res;
> -	unsigned i, j;
> +	unsigned i;
>   	int ret;
>   
>   	spin_lock(&bdev->lru_lock);
> @@ -154,20 +154,16 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		if (!man || !man->use_tt)
>   			continue;
>   
> -		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> -			list_for_each_entry(res, &man->lru[j], lru) {
> -				uint32_t num_pages;
> -
> -				bo = res->bo;
> -				num_pages = PFN_UP(bo->base.size);
> +		ttm_resource_manager_for_each_res(man, &cursor, res) {
> +			struct ttm_buffer_object *bo = res->bo;
> +			uint32_t num_pages = PFN_UP(bo->base.size);
>   
> -				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -				/* ttm_bo_swapout has dropped the lru_lock */
> -				if (!ret)
> -					return num_pages;
> -				if (ret != -EBUSY)
> -					return ret;
> -			}
> +			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> +			/* ttm_bo_swapout has dropped the lru_lock */
> +			if (!ret)
> +				return num_pages;
> +			if (ret != -EBUSY)
> +				return ret;
>   		}
>   	}
>   	spin_unlock(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 411b3f001eeb..1f9b8205b3a5 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -385,6 +385,55 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
> +/**
> + * ttm_resource_manager_first
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the first resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_resource *res;
> +
> +	lockdep_assert_held(&man->bdev->lru_lock);
> +
> +	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> +	     ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_resource_manager_next
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position

Documentation of the "res" parameter is missing.


> + *
> + * Returns the next resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res)
> +{
> +	lockdep_assert_held(&man->bdev->lru_lock);
> +
> +	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> +		return res;
> +
> +	for (; cursor->priority < TTM_MAX_BO_PRIORITY; ++cursor->priority)

If you get here, the previous loop has finished iterating over the 
current cursor->priority level. Therefore I think you need to increment 
cursor->priority before the first loop iteration here. Otherwise you'll 
just keep iterating over the same priority level over and over.

Regards,
   Felix


> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
>   static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
>   					  struct dma_buf_map *dmap,
>   					  pgoff_t i)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 181e82e3d806..ef0ec700e896 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -184,6 +184,17 @@ struct ttm_resource {
>   	struct list_head lru;
>   };
>   
> +/**
> + * struct ttm_resource_cursor
> + *
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	unsigned int priority;
> +};
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *
> @@ -328,6 +339,18 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor);
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res);
> +
> +#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> +	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +	     res = ttm_resource_manager_next(man, cursor, res))
> +
>   struct ttm_kmap_iter *
>   ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
>   			 struct io_mapping *iomap,
