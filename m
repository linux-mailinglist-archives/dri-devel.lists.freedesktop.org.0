Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9F4FF258
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321210FF08;
	Wed, 13 Apr 2022 08:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127910FF08;
 Wed, 13 Apr 2022 08:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GP0yEyL1/UP3Tn/w0xaf8Y6CRcsAeXJeavihrJN1E3pP3GG622uybp6dW/mn2IQbbJUYZa1I5UE40SIdigWIB15AL0wl1tSY314iSkQJRVx1vm7na32dkN67NFh9pQ4jRJ841GdTxUk1s50FUAqHv8+P634tIwJ/Hu7pwjwscscOVU2CjwtMCgNYSMQwF3be78q504ZuOyCGDu2xzIJjTHOq2Mv1QhRnbnTvxF23zhfeHL6/+KhYMrwbFYrsJE4NnX4pR5mHyRQ3juJ2bsrHS+IFLLLSUZz96t/Laa03clT+eg5sMiIfks/UxIlOgjzzQSkqeopA4FHVbdtSah0Ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34LmedJrktaPBU05Xdg7JW6LBk9zZ72PcA1yyHwXVwc=;
 b=iqbipnABKUkAeTPOEG8Vz87rKnRZXJ5cMtvYXp6xqGX7YfnT2vu96PyMnSlbjXDIUjfoFD6+lxWjb30WN0Pu8O5knRPkTuy9wVIt1Sj+RxdzbY+H+ipVN4X6EkHhz3BkVelYe/ZEpdati+rqI2AMGZF3IyHafccdedOs1FfUE0ar1xs/yzk5e2h8BDE7XKs4lgIr90dNvoiU6tZMC9ZECCTv9ChRD64Az0ErWZWi5vo5JqQEKdjUrVtBPSVVM/9KiWWGZUZ+S6sX8oKAxaXEk0EMVkQcCPGNboYS8VqJawb7ISJ7Cd/V5pFn5F3aW8aFejWyc74qF42jvVX1e/oSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34LmedJrktaPBU05Xdg7JW6LBk9zZ72PcA1yyHwXVwc=;
 b=P34Gsha8DM4NZK2oaBUAONL2QdEr6Qfgl1LAfPnXx7PJxH78rekEZzeCp7lpI1zGj+uptcXPaim/7qE4xhR68WOYzvIxwiHsHQCFrbnpoQpE6z+lJcsYXpbTlKKeoNFj6X2DqRG3ASkH3ZEZQ3jRVl8OlXD0d+TIVzzNbFLFzcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5957.namprd12.prod.outlook.com (2603:10b6:8:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 08:43:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 08:43:07 +0000
Message-ID: <7c9f767f-60c4-6276-a3b2-7d77b7050e22@amd.com>
Date: Wed, 13 Apr 2022 10:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fixup ttm_bo_add_move_fence
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220413082133.272445-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220413082133.272445-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d6a78c8-2a67-4259-9894-08da1d29a184
X-MS-TrafficTypeDiagnostic: DS7PR12MB5957:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB5957E7DEB1AD66F3C0818F9083EC9@DS7PR12MB5957.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8REni4gYrgqYt5lCmWBjhWWJ3OeJEk5UhSAXfX6SWt2Fqtn67vD5SCZA9zKQ+btuZe/hBlKy48YtDl/KutX7shlBK+Ys0s70WwOU7V6cBMnC6Nd7G7jB9dLBitSJTQuGDEQ57QxSiPI6YvCvGTOzel6QIE/iALJxiZxHxy75KMAoF/2WCvGuQ1x20JZhBu/sIJCxIYjKMDEho0XQBVghAnJyi6WVIU8Uzt9lg2yOr5ZzQEkjc0ZY4F2tHt38va5ts7LKHUuGi8bXzPmAUhsRe4wQ0iTzqpWivrjRS7c7LS95TFHUPE/+W6OLtxZzemypv6dVyXV6K6Eyp8A5EI7AtzfMfVEYWM6F0+dkgD/ukEf7opUG76Y5nUQbrxmpczAXAOpW2rKElHR5MsrslMQ/5WGDRazy2WtuffAbyVi/PbMdQROyCA+tU7MKtKsnbNB2EAjamdiNc3ImBVWzr4jZzk3VJ+ZNeyfbIjKahYJtW7c90XVPGdEFJ021d5kEXJzQQDjaBcNbLBgNJZC+PgQXYnVrb3kyFfYdjZChw4nXKBqbKaImXm5MkL08rak9s6ykTYtf4Nx3eYDPli7cAZao5MksgT8yzs8bBe8gRMg7VJMOCxN8P26Su53lLhffd64Ck3713OJJwxmDJ+CyWWgKxrMk5hc52Qc334wsbG3rrBoh1720TEfxSOy+68JFZdTcyXQYKQLSDr2atWPo/r/hBm7zqbXtknvJjS+RCXgrbRhFE4A9+9PRhx+GzpdAf32y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(2906002)(26005)(186003)(45080400002)(5660300002)(6666004)(316002)(6512007)(31686004)(66946007)(66476007)(66556008)(8676002)(38100700002)(6506007)(4326008)(83380400001)(31696002)(508600001)(6486002)(966005)(86362001)(2616005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDhxUEgyUTIxQ3hLdis1dXFHQVNnUTJ0K2t6ajRkZFd2UGI1L0Z6bFM0R00z?=
 =?utf-8?B?S3RhV2oyVUNQbk5DdjdORUlVbjA0Z09DRDdRYndQRkhZdWdZeGFKMUtBWUc5?=
 =?utf-8?B?bENyUm1zaHFzdGFsbmFkZ3BvdHJ2RXJEYkk1WVRldXJVTUEvV0JWaEJ0Nm5D?=
 =?utf-8?B?SURWb2tDWG8waHl1TWpiejUwa1NnSHhPVUFTUWtNeEI0NlNxTk5lS25mREVn?=
 =?utf-8?B?R1l6Mmd1ZzAwNWpwTmhFQkduWGlhZUdyL3hpYWJQZ3llbE40cjBKOGgydTFw?=
 =?utf-8?B?eldEY2J0dU1KUHZqUUhDMXViTFZheElZc052bmdOSnBVbEg0OXN0YXFmS3ZL?=
 =?utf-8?B?bGdsbkpGanZYVHlzSjhwaCtXc1JDdWYwYXBEeGZQYTVDalMxd24rZEtKV2Q2?=
 =?utf-8?B?SEphbmpqMmNiaTBuM3NWeElGVUlIcGpBbHFab3hIMXoveXVEclpNcEhhUE5X?=
 =?utf-8?B?TUtXWUxXRms4MmNnbnRMazFmQWNiZnl3KzB1dkluU21nWUJVYnVOSWcrVUFQ?=
 =?utf-8?B?NjhEWkdYNnVaNXhFYlRmWDBUUlBXZmFKYXBzYXQ1ZHZPSllYTjJFRndqR1lU?=
 =?utf-8?B?cDYwYVFwSWRtc0o2VnNybUZDZjhTKzJkUzlqQ1hSM3pLVDEvaFhGeWxRZnBq?=
 =?utf-8?B?eG5aM2tJQnRKMFFsTFh0MXU2NlM1R3FOUFdFUFlDTlNyOUE3S2h6RVBuL2Rr?=
 =?utf-8?B?TTIxWW1ZQ1RIUzRpR2N6U3JhTTJ1cS9xczlPeXR4dUMyVjFIcFZZU1d0OG5I?=
 =?utf-8?B?T2lRcEwxdCswMUU1dW5CcGNBNkRPMzMxNVFIWDAwa1pOZzc3Rm9QYm1SZXlB?=
 =?utf-8?B?MVBkZnYrYnBLUjJtTHRWVVpvTzN1MURadzdJUWlyeUZKeVp2NlhZQ1A3OUVM?=
 =?utf-8?B?NHZxV2M5bkR3UkdBMHhvZkhTR0FDRnZMVXd1RStlTWQ4OW5UdThjS1RkQmRE?=
 =?utf-8?B?TFJxMHh1dStqS09IY0ZBQ3V3WTFybzNmd1Z0M0xrbTVNV2RsZDRWYThkTFdp?=
 =?utf-8?B?VWk5UHpJbEJqVE9GdXlzVDNhcTJiN00yZytnbUlBRTNBb1U4enBGYmx3SkxI?=
 =?utf-8?B?Znh5TmJNK0lXWFNld055TC9aK1FrQkZPdDBUTGpxRkZVZWtSS25HY1cxeWZh?=
 =?utf-8?B?VGFTYnJtbVlHNnZIdUhDekpTR1FiT0RxcHA0T0lBbXNRZFRPTElGZEh0NWF2?=
 =?utf-8?B?Z0ErTDJJR2tjUERQaTBiWDYrZWxqSG5FR1hEZ1Vycjk2OHV2NTVldjVjYnZv?=
 =?utf-8?B?UXdjZXNMTzdsZ0F4MFNRTUYxUllmZjkwUnI2b1lvQmd2ckdFbHlSSTJGbnMx?=
 =?utf-8?B?WVVtNjJYTGRPT0NyK3QxcDVyREZkNHlvSTBETEJJNVlNS0dHdW1lblpWTWVE?=
 =?utf-8?B?cXRMMWE0YjBVZUJ6SjRzL3FLZFhmNGg4MGdQNG5PQWk5WTNlK0hkamJ5bTlZ?=
 =?utf-8?B?TnBvS0hhc0Q4UmYyZFlVVElqYm90bVNSTzNXK3RLWVpYTFFYMFRBM21KQi9Y?=
 =?utf-8?B?d0tpUVhKSExCZGlkZ3JaZ0FFTXk4MGV1RXphQmZFUkM2NWdvWEQ0bUZJckx3?=
 =?utf-8?B?cTlEcTJvMmJWRzJZV3A3TWNhY2tJSkNKQjlUSmpHOUxVbGdCSzVGMlVaNG0w?=
 =?utf-8?B?Qy8xY3ZMWWlwbHpNZGg3elpzWC9ZWWEyS0djakVPcmNCWk1pZnduUVJkQzg1?=
 =?utf-8?B?dmVQWjZmYzAwbzFBcFVJVEhlcGtzM2FEKzQxdWlnUitvbFFnNExlREFXRmtC?=
 =?utf-8?B?RVMwZkJ5VGtGSHBsVGpEOXBuSFpZbEJncEhjREFJVVRyVmZtd1hiV1dHNUxh?=
 =?utf-8?B?aHFBc0c3SlNsRitVbEN2MkFRb1h4cndTaUY5VURicFN4N3NEQ2pCOSs5cHcv?=
 =?utf-8?B?TElFQkdUbzc1Y0E0THFVSkxuQTZMa0J6UkFtTHRvTExqWkFVRHByQ0VJdHFw?=
 =?utf-8?B?R1kyUS80dm94MjBwMnk5Vy9PZlZOWUQ0MWxqb0lOZGM5WTRzekwyWlpyaDgy?=
 =?utf-8?B?N0UwcTJRQ2ZnQUJhQjhOVmpDSUI0d0VrbjNmWXFOaEg0UjNpQ3ArRkw2dXpj?=
 =?utf-8?B?OWhISW9BRU9JcVd5eXNBZW9qV21nSTA1T0hCR3Q1NzFuUFkwTzhHdTEzVno1?=
 =?utf-8?B?TkwwZUdGOExnTE9rdUM3MkIwTERNSlJJNmlWYSs4eElvYnlhR3RJNTl1UVZo?=
 =?utf-8?B?TTJvMjFJZFRuTXZGWmI3ZWRWVDlLY09jZGVnUnRmamVmT3dXakdnYTdoQ3ls?=
 =?utf-8?B?V0ZES1Bvb0FCUWg0ZnV2MjNKVklQNk55QS8vTHJzMnFGeENMZXZGbmFLdzlE?=
 =?utf-8?B?YU0xa0dpVTlmbld2WVQ2VU5oUjFxZDFSUlB1ZTVnZVFLS1lSM2d3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6a78c8-2a67-4259-9894-08da1d29a184
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 08:43:06.9688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb6Vpo+3MxpP76O5ftKEGU72VH6V8OCHGfxMbRbFuWp98KY5RY6gqgrczsRSKx4b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5957
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.04.22 um 10:21 schrieb Matthew Auld:
> It looks like we still need to call dma_fence_put() on the man->move,
> otherwise we just end up leaking it, leading to fireworks later.
>
> Closes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F5689&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2c316b01285b4deacfda08da1d26a778%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637854349105267939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=bWuQuQm6N5Lf183uo%2BsEw%2FxMWQFYVkyfYnB6SH61fto%3D&amp;reserved=0
> Fixes: 8bb31587820a ("drm/ttm: remove bo->moving")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Ah, yes! Previously we added the fence reference to bo->moving. I was 
already searching for that one as well.

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push it to drm-misc-next in a minute.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 015a94f766de..b15b77e10383 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -744,6 +744,8 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   		dma_fence_put(fence);
>   		return ret;
>   	}
> +
> +	dma_fence_put(fence);
>   	return 0;
>   }
>   

