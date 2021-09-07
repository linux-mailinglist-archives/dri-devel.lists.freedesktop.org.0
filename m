Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AA40235D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B730F89C93;
	Tue,  7 Sep 2021 06:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239EF89C6A;
 Tue,  7 Sep 2021 06:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R63ap6gI3WxXYPUsPDCy8yP77Z3xamprB9mWrgGe3eq0kRdBhSbwoeM95fxTb4o2QOY+o7IO915iDBaw8ybDq5K+wVPgP31DViCWj8f8k8lKahk9xN3kE1rNwUvw90l/23CZ8RRuHgLErQQx2xp/DtZ6nAfk7RVxiEWXXv3OtB5oxAWncxQZ17uiCyWHt5bvzEzBgPdK5g6jqpAf38+ZSXJYGh7575SJ1oFtwwGv4zPgJGEGY6sWmfNcumyZhgqMWRce6jzA5+glH/IV/ECOILFZ1cSljPW4PGU4SYDAkEoGtHYzDPgrSKi5KxxOJ8XS3VF/AAMsySJ6hCQAARvQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CJ4rLChPQ3uz7DkdaPnlP1G1D6gJ66+eyfEOXxLjDh4=;
 b=fAnG44sc1/O1iNA6vkFU5v0HrElpnQiv0eEXd5KbE4V4fk0sV6hAV7h7yniYFgEsOVNhHlEFCvdvmikR8+4uCjOpdFsvUfxTGubkWtUrvXVrq6ooibEPu9+5N+vQBxvhvglAfE682bzLo/dMwqv2TTTyXXbD6Otfh5AvAS3iBLMnQbkDWt9o91JbTG+BBNLzp142mqHRRc61JqvwupThdKTIagdAYG5kvPcZw1WnE3UuDqLi1xl4U4tC8iFKTgpO4RV18Z2Gobkf2VzgzW04Qz6NTDFDNLLcWIRL6HqhY8kid+eriJvN1TM/utqURsxr87Iwa/ub6prAlQ4K/8TK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJ4rLChPQ3uz7DkdaPnlP1G1D6gJ66+eyfEOXxLjDh4=;
 b=kb5z127fa0124gNghnMRlIftTMVeMp1SVG3hbdJBobEdpCi4fEABd5lOCIX4wv2lvzoApCxOw2l5gUaB3DneDbkVFDwleLs2ahLGOovBIjS7TjRFzmOa4B/OjPE3ron3rrvh/toLS8hVeF9WzZfa+SCU2lmXRzPSAinnecIakqM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4691.namprd12.prod.outlook.com (2603:10b6:208:84::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 06:22:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 06:22:30 +0000
Subject: Re: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210907040832.1107747-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <074efe24-db7a-df68-3624-05989596f44a@amd.com>
Date: Tue, 7 Sep 2021 08:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907040832.1107747-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 06:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fefae88-0be8-483c-b542-08d971c7dec6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4691C1949150809B1C959FA883D39@BL0PR12MB4691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzxmDdRa6Ivl3XuU4jYsmDEDZmWMgnImpY4NbWJJPA4IeQBL/v0PndowQz8EPs6NlJ/KQjGdNCyUAESnKOV3qDxeVyLNdNfXQAZ0BUzXFzOK/gWTaPmWgZ2qZNGo9GgJ1jyp/fb9dPy6LlHm9/5iUAEtAor50EytEyqhE4ViPYO8F4F32khFKt3oGRA0QI3uhXgtzasyCWvQ9a+lHDyIRvXx317IduJX4Vv+qD724V7EfrFeq2RLwCt0zYOvliJcb5bcfElnCcwvGEwWOpU1ySmgrmLunurbAFu8j7J22bLZttremu5A6d699FEsH2Z1/WI+yd3mGXaT/OtS5Ai3Ts5ROavb7p3NlhVoExA2URaAaW6X9jHrf3SECWHI3P1NuhmCUMLM3NODBfQH333FG0ym+ZHByyl7uQJiHHX6+5l+hVrJ706yewQcyzcFcEyUC79NGKf7FV1+YP/o6/3mRuL+BXTjQ+vh4Y120Vzf89jja8PYSrEvFSFmkSzeSwybUxLjF2hs+Nzr78O9Z0+8iwEnOZVp92M7Dr4Rl5GpN3Fb42pTMWpK7ReDeUL0rCojTu4nogHxMefqD1VadYcbdMMrTLMEUa6q7RAGmnTQTyHqUjMj0I7/SiQVkq4JvrwQwSEp11D+h0VApsTx52rTwAucqDfkgPbc5W19SV+gXcI26mrDH5YuWKSDhfXAAIUMjAWSQt8xRoq+XF1LIR3xC3hErfF3mOy9wJKxfBG3j38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(956004)(478600001)(66574015)(8676002)(2616005)(83380400001)(31686004)(186003)(6486002)(31696002)(66946007)(6666004)(66556008)(26005)(450100002)(66476007)(38100700002)(86362001)(36756003)(4326008)(2906002)(16576012)(5660300002)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFEySkZuUTk2NnBpUUtvTFdudjVKOWxkT29JN01uSXFoeXdVVFE3MlEzcFYr?=
 =?utf-8?B?MytKem1tS21NcEN0M05Jc1AzRTVQSzlZS1JHbUNUZjNRcWg1bDE2V3hBV0ZG?=
 =?utf-8?B?dVVHdEtCa0YxODV4MmRXZlViV1FDak5qVTVYYVpkKytEUjFISHU0M3U1eml5?=
 =?utf-8?B?NkZsL3B3NlZ5ZFVZRUZrL0lMN0pzZlpkSFNpNlZWZU0yRFgxeE91eHVPNVVp?=
 =?utf-8?B?RGtaOGtzQUliK0szV25wVUVUVy95dmxSSHV5UWs2S0hOZ2lvK01BNS9ENXFM?=
 =?utf-8?B?eVhTWVkzYklqZ1poZGg1SkJXZ0MyOVpiR05jd1NyT1Z5Y0JiWDJZN0tDcmF6?=
 =?utf-8?B?aVgvVVh0S0xMekpKZ01iMmhiVzR4VTE3dHV6T0FUbkpTSDNRNFVhcXJRWWw2?=
 =?utf-8?B?K1JieCtVZFl6aXN4aldScXhsUUd1OWNrdEo4dnBVWCtmWmdhYlpNTGt0ZXlw?=
 =?utf-8?B?UTR0NStRWUxpMU4rN1ZQR2JMeGlmZG9HT2x6MGFpbVpqSG9OSytzclZmQkk5?=
 =?utf-8?B?WjJxc3d3R2k2ZzQ0NGNCekVEc2pIdTJWekpLdzBPTHBvTzF5a1Z1NGd4OHFX?=
 =?utf-8?B?U1hySG1XTFNWT1J4RFlSckdlS3lDd3NpbEFNSkdzQ3BqNTJ5bWlHUU1RWjMv?=
 =?utf-8?B?OVZlVVBIUDlLMTJPNFV0OUhieDRsdzIvVlpHWXg4enFLS2tuYzVJSmYraW81?=
 =?utf-8?B?L3UwU3FTWlVMS1BrVitTSGxyRTdsS1c4SWRkK0t3cEV2VldMYkZjTU9lcS9P?=
 =?utf-8?B?alJRR2MxV05VUUxjd3lqUlA1OVVDN2JpZFJ3UFpadFg3V0UvRzRRWDNYek9z?=
 =?utf-8?B?UWRVMUZVYk84N1N5ckYzTUQzdkszNmNoZTY5UjBXbDdFU01vdDl2UTZTWkFV?=
 =?utf-8?B?TU1GN0tZVklLSDdrbVBNVldkK0JHN3V0U1Z5TmRsbVpYWHp1Z2Z0S3dkOEIx?=
 =?utf-8?B?VUhjVk4vMWZXSEc5NWdqR1c1ejgrV01KQUpzZ3VYQWV6MW1QazM2bEl6U1Bk?=
 =?utf-8?B?ZTFHcDduNmRrMnU3S0Rxa2JTR3pKdjlaYkNlMlNrL2JmemJ4ZlI3dWpCNkJm?=
 =?utf-8?B?RUNQR09kWUZaK0xFK2wzdzlHTld0OWt6K1NwV1hXZDJyTHFVOU9tMVRjNlM0?=
 =?utf-8?B?Y0ttUk1FeGRpZ01kdGpScm5iN2xDR0dZd3g4a3NJbG1CQ0h2cTdFWFVoTHNI?=
 =?utf-8?B?a2RtcHlBbkdTc0oyOG1HSDd4V0FHZWd3eGhRcE0vYnFIRkJnRTN3RWc1TEdu?=
 =?utf-8?B?TENCMVlCSUMrc0g1V0JwWWhCUUt3ajhieVpoWHVBRkZKY2pwOTNtbGZHRWFF?=
 =?utf-8?B?VDlQR2E4Yi9zZytKZzNYcFJjdHpUb21CQTM1QWhYS1lKQm9MT0pFVU9uMHY4?=
 =?utf-8?B?ZEhad3JmWFpsV3VwQXBUSGFvMW5Bd203ZmZpUEw5UkhUaWh0aFVJKzFXZXJN?=
 =?utf-8?B?T3QvZVRzMElTRm0yQmpVaXRhbTNXSEoweDZXU2EwSzg3SnY5Qlo4MW1kT1NP?=
 =?utf-8?B?ZXZTeUJxZ3BCdUg5cnBzU2dWazVmbHAwUmRxZjVVUGd6VnpzUXlpZUNIM2tm?=
 =?utf-8?B?c0NtK0FRMThkM29kSFU4UUJlWFl5ck5qdXMwT2h6NENSNE5RVDdqY3dTN1pU?=
 =?utf-8?B?aHpMTU1QdmcxNFBzYWxFelcwaktKVUJSSC9xZjA2TGhCS1BZVU9UYzFKU3FW?=
 =?utf-8?B?U2dBenNWVzQxQy9oNm5oY1k3Y0ptWG9uNm5LZzczZzU1WG9YSWMrTWVZckNh?=
 =?utf-8?Q?d6KGupORaaRPW1Bme/900itHUf6PH0W0fkwg4xc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fefae88-0be8-483c-b542-08d971c7dec6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:22:30.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8f8ayPU9z+IsbDaYNsoQFehxIioJKAvl1Yyhz1x1NP/JnpPV8FoCMoyU2fwjBDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4691
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

Added a Fixes tag and pushed this to drm-misc-fixes.

It will take a while until it cycles back into the development branches, 
so feel free to push some version to amd-staging-drm-next as well. Just 
ping Alex when you do this.

Thanks,
Christian.

Am 07.09.21 um 06:08 schrieb xinhui pan:
> The ret value might be -EBUSY, caller will think lru lock is still
> locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
> list corruption.
>
> ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
> caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
> be stuck as we actually did not free any BO memory. This usually happens
> when the fence is not signaled for a long time.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 8d7fd65ccced..23f906941ac9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	}
>   
>   	if (bo->deleted) {
> -		ttm_bo_cleanup_refs(bo, false, false, locked);
> +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
>   		ttm_bo_put(bo);
> -		return 0;
> +		return ret == -EBUSY ? -ENOSPC : ret;
>   	}
>   
>   	ttm_bo_del_from_lru(bo);
> @@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (locked)
>   		dma_resv_unlock(bo->base.resv);
>   	ttm_bo_put(bo);
> -	return ret;
> +	return ret == -EBUSY ? -ENOSPC : ret;
>   }
>   
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)

