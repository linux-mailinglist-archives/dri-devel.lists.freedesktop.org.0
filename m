Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A958392D1E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C26EE8A;
	Thu, 27 May 2021 11:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C256EE8A;
 Thu, 27 May 2021 11:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4RJDGmV9V1JX0keIH3+Tq7y75btHUqqnYmKtiwmqTQGG/qQolO6aT/FV+MSd0SRhH8G8tgmCRPhmTYLkFZZ7Oskx651YIEXrPZrVWL4LGcY7YoSo0c9DCLxaHvaHyiF5ILxhyLTtb6YJMTqQQKjAqrUJEtAIB5DP94uKgKyEB7z8jpEjl0JY3dKNugge0iS2Q8qGC1HnfCz6TP8l3VqY8FM2cMkXrc+4ZG3XrMx/tw2gu7cFbOVSseKSlawhkMtbCXHFT3dfSBTwexbh9PlAg+aahWH1YGYu9Ct2FFmMvWPtgDRArUUvXU/kcEicCYVWlw4R8ihyg2VsQx/TquHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ld9xQDNC5wVEZ0275kcmC51jtici2ChI7tjfGNmYkY=;
 b=V4payDgOkfflG27pZB4C1NCeYhybvDE7wpTRTJqSr+PqIzzBp1xIHqcmAJQq4QK3AA5eaNEf31cQqfttDmq2mKwcXdxFYxdzfitqvX+qVFWjCqsp9egk5LK4J8kVm1bCBDGH6mDgPFvnmILUgO9OerKAJxCBBMTC8axj0KBsMgJZF2syEV9XI1U8PwbDZUDBSZ4laOfWtVMYwU8fZr5uw2syKqYW6HeA6NWg37rancHU+19fZBL0g1yTL59FVSrjAXkymyg8c1KCrxycjt4gkfeFCV4TXR7B5dr6j4RiV7kvFqRHU3SAZJyqsHYswCluxDjGwU4/2PrOAYc0gSI9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ld9xQDNC5wVEZ0275kcmC51jtici2ChI7tjfGNmYkY=;
 b=a5CchZMb7KZYGiFRKhMyHE8y23alSlpisKplTUfrnR1i5ZKwMltWwE6SAtRM+xaajJVBGwhPeHXfaHnMf9eeYizRcI7gilhVr5k9PxJXkMozQRPj5RTmpdGT4JKhqxARmtl9YEd6hGr0k+MxSSlVAwA0lRX2Ph/RKw6ZnAgz/Zo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 11:51:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 11:51:33 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT
 allocation
To: Lang Yu <Lang.Yu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <20210527013051.4302-2-Lang.Yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8539c291-85e8-7530-af23-505cda7871f9@amd.com>
Date: Thu, 27 May 2021 13:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210527013051.4302-2-Lang.Yu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e531:3aa1:4782:878a]
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e531:3aa1:4782:878a]
 (2a02:908:1252:fb60:e531:3aa1:4782:878a) by
 FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Thu, 27 May 2021 11:51:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b9fb3a5-e723-4f0c-9a18-08d92105c608
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2420C9F9E814A7850A49929983239@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eitiUSSQZLNzaG3h0oIf70elitggqev3MWcye9RVsU4Lxg0giZYBOENflgy7cDoFS3J0/fSlovbL6RFXogwAxvQn/2IhqmYHqlam/0ggA+k4RX9ZGIbG+w93YzjYif3KpZT+5WxIE3clZlSpVe53AEuGFzxgk4kRzEUDm5VMrVMI4lz6ZEZ7QEFvAWLQ0+mRHjMznPMSpRtRlJ/ZMgYmyiB4SExx9W/2xgW/7EJSAMCwM0qCdANZmt+p91gUrciT0SGi5URBvmYtAXyZ7iCG6E/pub93ivxNlLUwWv09msTkAs0DtS2jJkTgNwmdHLkM5Kk+d09831u/jzaDYB3+b5uY4wYJQJWhsrNG0k8T1zsqqPFfZFuVZUT1/CMup6LY1hDUP23hXr4PaMEBpKHapXI2IjRuUkF6O5zsSNlIrOSGDv4pm5liJ1kfmX9RtGXebi2FiY1sMgssGoS7/wn60niWIWHXd7q1nCDSEzn4HexcXdXSOosyvKZXeDRk1C6t4hEp/QrY0WrWPVrf3rIv6VFLS71E4rHugej2Nz7A3dDf7OqhlN30tR5sgQNb5gOcKx43aREMDf4WYojkkP8+lrbJR8HlsF6ZuQ2fIzgLA9MsAp4nqP12qC7Pke2470yuL0jtKXiD2YSEGokcolqQTwIom3vbG9hw37OyqY6/clxPSodvpus5EXUWjSwUlf1F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(66476007)(66946007)(83380400001)(86362001)(186003)(6666004)(52116002)(8676002)(36756003)(8936002)(478600001)(66556008)(16526019)(6486002)(2906002)(450100002)(5660300002)(4326008)(54906003)(2616005)(316002)(38100700002)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHR1Um5pL1c1RWVYRlN4UXk1K0VtVW9KY251Vk9ZQlptY2JXWFY5T3VYSCtU?=
 =?utf-8?B?WWdCUFZEMFMvNnRwcXZPeUJUSmhxUm1XdDBmSXVrV0loZEdYaGhhaFFldjJO?=
 =?utf-8?B?dXpnOU9raEZ5cmtVZ3NiTDZ5YVRFNWY5ZGpYbTEvaThBWlFYc3hOQytlNkNR?=
 =?utf-8?B?TU15US9yVzBPVVZGQzZSNkVKbllvblZlQXQ4RDJmc09BK0ZkMDI2bGo3d1lv?=
 =?utf-8?B?UWlWZXRTVkJ1akZSa0k0djNmbFJwM3I4VkV4TW1JbXlPTjlTR1VpaTIzYm5r?=
 =?utf-8?B?ZzJ5Smc4cEM4bkVYbGJMTnhRSkxkVXM0NDJWaXFDM2J5Ty9kUk9LY0h2RFVs?=
 =?utf-8?B?Y0x6T0pGYUdhS0JtSlBScXF3Y2ljVFFBRDlzek9SUTh3OWc0ZVc3QU1DTVg3?=
 =?utf-8?B?TmdnbEFaQ1piN3gyMDNmTVBnS3NCZFpLM29XaUxzMVBFRnlEaUFzdGNCbG9m?=
 =?utf-8?B?bE9qV2dIOG9iSVJDS0V3SlNPaUwzSHZCYlVFeHFoRm5sZHB6WFFxYkFiSjky?=
 =?utf-8?B?cEFYS2VreFlTTGVNRGRGenQrb2hCVWErS2JMMUVkKzJZanVxalpSRlRhVDRO?=
 =?utf-8?B?WlZVSHVCTHNxZm1OR1BBeVlHR2c0YXFzdWlxa2pkWFgwNkswUmlHa3Q5QUVv?=
 =?utf-8?B?SHlsUjNXa2ovNmRBeVBBOGVJaGVUTnRETUZSQVlodEp3TnNHQ214Mm54VjVz?=
 =?utf-8?B?TFNnTVVtSEpvRng3NkFldXEwb2tXdzg5TEZIb3M4ekdadnVEbWtiWU95eWZB?=
 =?utf-8?B?NkIxVE9KOEN6TFhMWEtMaTE5WGhyaGg0cFBVUGp6WmhHQTZGcVFUSEd0QVJB?=
 =?utf-8?B?RWMxeDJrV05kNGxqZytWaTBQN0J2SFRudmVFb1R1ZnJ3WGlmOEJvZG9xdGov?=
 =?utf-8?B?azhTWTljdHI4Q2dobkhuNG4vUVJLaEdmTDM2QmFQTmdJWG9EWXk4dnQ5ZWpZ?=
 =?utf-8?B?aDlzUmxNK01CUWhJUkZUYjZ6VmN3b2x1RnUvekY3VUpmem9VSFMvN2hIQWxU?=
 =?utf-8?B?RW5pSWljV01lQ0lIYjJUSCtwNjFuL1hQcStIK0hDZVhRUmU0aU03OGRXTGNX?=
 =?utf-8?B?eFlyK3FIclJaY3NrakEwdFVXM1pNbmNNUmw2Mk5BM3ptTHZ2Nmd6OWxWZnBM?=
 =?utf-8?B?eU1HTzJ5V3J3aGh6RHhSVzFaZUxVK0h3UUFFVUdqZGNyODNCZXN4TjkzNzg0?=
 =?utf-8?B?UXlncVlOQjNnWFpwWjg0Z0lGdGdoS0l1M0EyaGt1QVFIS1Q1ZGtWbUVZcVpr?=
 =?utf-8?B?VmtnTW1uQUJlS010cGNkbEplUFo3RWhWSHZzOEdXemEzL3Bkd3ZFSjVTZ2t3?=
 =?utf-8?B?aktheFIrRjR5TG5McVh2NHp1c082MDFOZC9CTDZwemJoOXZ5ZFB2TFRBZGpt?=
 =?utf-8?B?NTJ0TUR2Y2RIQW41eHNFQi8wUmM3bjZPRWhkTnhZLzBHYkExSEp4MUN5TUF5?=
 =?utf-8?B?Z2d5MVZuZE9QaFBmazlhV1BXNGxib0xyOExYaFBxMm1MR210UUpVczlLSU5y?=
 =?utf-8?B?YVh0N3RUb0RISmNWUzdVdTg1amlSRkN1a3BnUEU2Q2dsNmhiSVJkSC94Nmk0?=
 =?utf-8?B?L2IzY1VuZ2d4N0xEWktMWm5LbzhYeWo0REs2WFpjTGNiYzNjWGVFZFhESHNM?=
 =?utf-8?B?QUpLZHlqdU9uTUplNkFSa3NFMkNhazdrenYwT2YwamFsTEYycWh4VlcwcGxz?=
 =?utf-8?B?MGt4RVVySFNwZDgzYjVwWklHVTljSzB6ZzVuejBVUm5xOG93Y2J5VFZKQXZN?=
 =?utf-8?B?MXA4MmNnRGM5Z3dXSjh6VnNZdkQ3ckN4NnBxakhvVlplaVcrK3VQWE5jaXRU?=
 =?utf-8?B?Znh5MlkvWUdNNXJCNGtVN0RHbzAwbjU1a0JuTy9DcWV4L0xST0hUbnl0UUs1?=
 =?utf-8?Q?8+tFQCz9ndmRj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9fb3a5-e723-4f0c-9a18-08d92105c608
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 11:51:33.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs7sfisuaz5z72354gMgW6o+RYEciL0GIxrd1ApV4SwqdRoTagUHt1PFzhlj+gfS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Puttin Marek on CC.

Am 27.05.21 um 03:30 schrieb Lang Yu:
> To improve buffer migration performace, stop bookkeeping of
> temporary GTT allocation, including allocation for BO evicted
> from VRAM and bounce buffer.
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 16 ++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  4 +++-
>   2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 8860545344c7..32fedd495c7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -111,14 +111,15 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	struct amdgpu_gtt_node *node;
>   	int r;
>   
> -	spin_lock(&mgr->lock);
> -	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
> -	    atomic64_read(&mgr->available) < mem->num_pages) {
> +	if (!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
> +		spin_lock(&mgr->lock);
> +		if (atomic64_read(&mgr->available) < mem->num_pages) {
> +			spin_unlock(&mgr->lock);
> +			return -ENOSPC;
> +		}
> +		atomic64_sub(mem->num_pages, &mgr->available);

After sleeping a night over that I think we need to talk about this part 
here once more.

While temporary GTT allocations can temporary exceed the GTT limitation 
we still need to account them in the case the eviction is interrupted 
for some reason.

In other words what can happen is that we want to move 
VRAM->GTT->SYSTEM, but GTT->SYSTEM never happens because it is 
interrupted in the wait (that's unfortunately rather likely).

To solve this I think we should do the following:
1. Change mgr->available into mgr->used (e.g. invert the value).
2. Always account all GTT BOs to the used space.
3. Only when it is not a temporary allocation bail out.

This way temporary allocations are accounted for, but we still allow 
memory evictions to happen under pressure.

While at it you could also drop taking the spinlock to check the atomic, 
that is pretty much unnecessary.

Regards,
Christian.

>   		spin_unlock(&mgr->lock);
> -		return -ENOSPC;
>   	}
> -	atomic64_sub(mem->num_pages, &mgr->available);
> -	spin_unlock(&mgr->lock);
>   
>   	if (!place->lpfn) {
>   		mem->mm_node = NULL;
> @@ -178,6 +179,9 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   		kfree(node);
>   	}
>   
> +	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> +		return;
> +
>   	atomic64_add(mem->num_pages, &mgr->available);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c0aef327292a..129d39392859 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -152,9 +152,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   			abo->placements[0].lpfn = 0;
>   			abo->placement.busy_placement = &abo->placements[1];
>   			abo->placement.num_busy_placement = 1;
> +			abo->placements[1].flags |= TTM_PL_FLAG_TEMPORARY;
>   		} else {
>   			/* Move to GTT memory */
>   			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
> +			abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;
>   		}
>   		break;
>   	case TTM_PL_TT:
> @@ -538,7 +540,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>   			hop->fpfn = 0;
>   			hop->lpfn = 0;
>   			hop->mem_type = TTM_PL_TT;
> -			hop->flags = 0;
> +			hop->flags |= TTM_PL_FLAG_TEMPORARY;
>   			return -EMULTIHOP;
>   		}
>   

