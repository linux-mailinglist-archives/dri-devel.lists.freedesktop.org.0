Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5490401A8F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 13:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22BE89B65;
	Mon,  6 Sep 2021 11:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565F89B61;
 Mon,  6 Sep 2021 11:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THU78wBZn3g4viL6nYqoxQ9a1IZLP0/H2DAb3MpnD48t4jv6BjhfYXCwpayhrHTBoyK50kOPj4LhYNLciJj90NYVbgHIhZ8Zwrs0fTtOqHEX5Vs9ihBJK29neocViUMASJTfnRRkzXxBmhWVTAnV/NbLPOzDD+6yMfHM1cUnltoEhzCGU8NqrvEPUirn1WuiaYa9t5KPryoH8d5BBZPVNxH4JMItdEwZH5B/3bIZissZzefdnDrbsikzKiMY3mvwHkYpXb42f99rJ5JaGCCCnJYvUrKzZHs+Q4e/ccWLSEF1HOSJ88h0pXir5RRXSV4ydIP477zckfrVwUO5Li6t/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bcgxW86PD1p0i2GE2cEv28elE2QDKO2ZshW/hMYqvjo=;
 b=NoQBB/7LoUESS064nIkW+UnJjw8o1U2YNv41kkBNcyhYlUe9/6tbutl3kQ14gXLc4P34ldc0qbEw5zN//3KEHE6UACwavb0J2ubNj5XIk00HKYTrIX9KcAnZOkHE793uJb7kabEcCRgjkCQ8awm5rXzIhSznwT3URRjMpblgCW9upB1XCYs752AilCOqpBlHmLL7yooersOaOe4If1mgS6j6eaiM/vJAWfiak9Kcp/0GTq+G6CuZrE7V4agS6glpCBE/yqcrpveq5qMZg+cBlrJf1KV1UzNGwCUtU8P1LAy57IM5q4/hzIVbLwzDEbZvb+PZd5TbEelNBY96P18JrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcgxW86PD1p0i2GE2cEv28elE2QDKO2ZshW/hMYqvjo=;
 b=fKDLo3NDtcb45EdzbFtbv8xe1Uo063dhUUPDhl2wOlsKCJlQXSrYjOLGy63lPxzQsD8d9D1RjY7EQKfJeq6+kMbsKmt4LFKAj4knGBAi8h8RZkq7YMW0r+RDjQCa8V2sC0zZbI7nAutKq3zK3C3+oOI5SXNH8vp+842PVACKesU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 11:26:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 11:26:17 +0000
Subject: Re: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, chenli@uniontech.com,
 dri-devel@lists.freedesktop.org
References: <20210906011210.80327-1-xinhui.pan@amd.com>
 <20210906011210.80327-2-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <72212116-c95b-710c-85e4-673e68e6cf63@amd.com>
Date: Mon, 6 Sep 2021 13:26:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210906011210.80327-2-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:e317:935c:f697:77f0]
 (2a02:908:1252:fb60:e317:935c:f697:77f0) by
 PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 11:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ec847b-1bc3-4e85-76d3-08d971292481
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4962061DBAB22D68D18A811F83D29@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0nsLKRcVl+2Cyc80Uk1f9j+5yx/gfrmOnOQqDalXfUKI/Uih4YIeVnuNxEvdmcgA+eKiOkV9FV88hxyeTAYS1nHoTyAiSbPYTtX06MkCjg5Km4hUlSm/hED5sflD0P/dri9oTgQzOC2sdmPTqmnSd/NOb8lS1FdFNvDZaCKY4g+CcJlQibkWBWLlpabzqDjGMo6HlOBMbryQe2hO7BsY0vE8nAZwS5cUOPdZ/5NjDDSATA0zlkTuCSfvghoxk6fa2JwRWZUTgDJyTCi+6Sz1GhGP8O3pTSRywegk61+Ark643IKRlDZGsJkMkeXp5Xq15mIidjipFnnyyNWvxdxl7QXsnZq6KPYZLOhftq1DQZUpb7EFirYj3VdqL7szxtCofMA2m1rIhpQklYcFED3EWdTsmFG+Erhfw5Yzy0zSuq0ObQIFEUEL7S7eH90aCBpvbxSvRklnkshDMioQQi2wgMHPb/Jh1G9K6F5SUcL1LZ/+EmnNtsq9yGutOEklRbIdStJh5+dru8JGCGP4ot8x6rZok+sNE0+lVRn5WYnA9a1BMHaBhrWGd8TI7lbOYjQs1pk6XWo+RcHGarSOr16tc8r4eYKBAaWladv5meYJZbA6M0OWne62od/pwDgy2LjsAdCZTIiKvfOfPBBt/FBEWMnl5D64lRSBwBkvcwriWfdck+2kveSgEsWH89U/5ljdQ0gpB4STHvbWIwu61hrpTUI+JXty6Run6MtrdZgK1QWcsi+LTjxuKnOcU4Xu+JX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(4326008)(66574015)(66946007)(66476007)(66556008)(86362001)(31696002)(31686004)(2906002)(316002)(2616005)(8676002)(36756003)(38100700002)(8936002)(5660300002)(478600001)(83380400001)(6486002)(6666004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnVLb3ZQQkV3MUNDdzFiRUxsd0x4MnVwb0dUSFRWaktGREtkdjFaN2kyOG1k?=
 =?utf-8?B?QTBWWkVPRS9TWVB0ZCs0TzdIZUJSd0hmZ0cxWWFzSzhrbm5jY1Q1S1pPT2Zr?=
 =?utf-8?B?cEpvRGM2WlRldHNEZGF1UmZQdmhNVVJTS1VKbnMrWWlKaDhTRmRPeWhhb05G?=
 =?utf-8?B?VHVvRmplaWxHRlVUVW10bzJoUWJRUG9iMDhQV0FNdzF6RGpMMW12cWpZei9X?=
 =?utf-8?B?THg3aWR0blVXSW5EcHZsTkpNd3ZrZktsVTZlRGtTb3JNTVE3M3M5UVY5VFRx?=
 =?utf-8?B?eHdIcENrMmR1OTFnZ29kOWtpazNFMGN2TUVnWVlqUzNzOURub25hbDBENjNM?=
 =?utf-8?B?UUxOSnBSdHpPL2tQU2dLYjJyMWlFNmZZcDZ0SW5KUEI2NUpiOWt1Tis1NXk4?=
 =?utf-8?B?MjBzeWVpb010V3F4enR5UTdpS2JpZmNMYVJjdmhFbmxobUZvZ3BqTnpqRWNQ?=
 =?utf-8?B?WFpuaXl6c3NuYjl0bWx0RWhKSHp6bGdETkJFaU5RS2ZheG00ZlJvcmF1aSt5?=
 =?utf-8?B?ZjN4eUpjdlBVWXgzZjRzc2x6TkorSlRkMXN2b1VDR2VoM1lLdnM4UkU1RWo5?=
 =?utf-8?B?Vit2bnpJbzJDMkFJNWVTb1pPYitHQmc0dmJhemFFalBvL0lYalVIbVB1QWZN?=
 =?utf-8?B?a2dxMG9QVWJQdjNUUkRrcjJoQ2N2aFczUkNMaStTWEpoYXU2K25FSk9xVm5t?=
 =?utf-8?B?SjBXVU1DelRPSDBWb2FwM1ZRY0pZMjlnYzd6SEhLRDlZL3NORi81a1hCY3Zu?=
 =?utf-8?B?cDZlak5nV1pvU1Zaekc1bTNQMHdmWGh0SlNFNW9FenpqUHFIdDdWRU9DdVo1?=
 =?utf-8?B?alJDbVlMRU40Y28xWmlYVFlQMVRnVGVlVjBhYWQ5aEFKUG52eEFsbDdKOUxH?=
 =?utf-8?B?NnI2L0dITU9aZjdQdk9vWmFKZEgreWhrQmgzOGM1dEhCT043bUNRWERBTUYy?=
 =?utf-8?B?eDBBSXhyYmNhbmZwdGRzVnBXWTh6Vzd6L1VLVXRLZXgwaEdvbGFLb2xzSHlh?=
 =?utf-8?B?RCtxMnJLczR2TnBiQXFSUVhuRTZPNU9aRVdGYUhXWGYxekVNNGNsYlRnTHl6?=
 =?utf-8?B?ZmpjUnFGcDNFdkdrMEtLMnQyRUJiMlpyeVlMSHpIa3FQN0ZKc1R0VDY1WW1v?=
 =?utf-8?B?aWxlRVdsb2xiamJ5ZlJYWHh1SFJleC9WV1V6MEp0UmE2aEx1RTU3aUlySEwx?=
 =?utf-8?B?ODRtL0Z2cERCQUluL2RzdjNlN2JuK3FwcmdwWHhSamFZL1VrVU1SYU15YXp1?=
 =?utf-8?B?RTlURE1rd3p5QnF0WThNdXB5czdseWt2eHpOSFM2UWh5dkxBc0t6NUpxVjdx?=
 =?utf-8?B?S2w0VU5EaWJSbkgyNGtPTVRiVS9NR0piZEpLRU02REZZSTVrdnNBNzJHZWY2?=
 =?utf-8?B?eFJMYkFqRktrbjFMUmNKbkU1NmdMRS9iL2N5YjhjWmhHUVo4U2FjOHJmSVNX?=
 =?utf-8?B?L282UFJiWktoRkQ0U0JKWHVLajBTR2ZGUmpjaS9KamUxQWtvQXJjZ1lSZGZJ?=
 =?utf-8?B?S3BpM3ZDcXhuRkc5bjVhVkhya1V4L1oxVzF6LzZ2RjJOTzM3WnVhblVyV3lC?=
 =?utf-8?B?N1ZiOWxBK1JyL0ZKSUJubVhzaEtrMk1sOXNucnc4aHFaTnE1Vys2R2FGbEx0?=
 =?utf-8?B?eUFhWFRXS0VObCswQ05LL2dLbGlCYjdNcFJUTmpFUFZZVDQxeHFEZjNhWWhG?=
 =?utf-8?B?d0hueEp5VGlidVNGOXFIb1ZNYUpLUjg0ZitiaXhBV2lwNkZTUmxNSGVON3lp?=
 =?utf-8?B?WGlNY0FMdmFFV2V5WUZhVGduVEJzblVwdmpLREdaV2t0ZXBpZHpHbG45YUJ2?=
 =?utf-8?B?ZFcybEdqL1ZSOThGeW1aZHlQNzdxT21NZ2taM3RFeVgxNEpYWUs4ZDJlWTZm?=
 =?utf-8?Q?/Al0m7KFKpIkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec847b-1bc3-4e85-76d3-08d971292481
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 11:26:17.2016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C74eal4Oi2dYo1UUru7C0budqWcnv2IbS1RXEDV5rf5fhdA12F7Qj9yTJDdb97rS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
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

Which branch is this patch based on? Please rebase on top drm-misc-fixes 
and resend.

Thanks,
Christian.

Am 06.09.21 um 03:12 schrieb xinhui pan:
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
> index 1fedd0eb67ba..f1367107925b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1159,9 +1159,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
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
>   	ttm_bo_move_to_pinned(bo);
> @@ -1215,7 +1215,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (locked)
>   		dma_resv_unlock(bo->base.resv);
>   	ttm_bo_put(bo);
> -	return ret;
> +	return ret == -EBUSY ? -ENOSPC : ret;
>   }
>   
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)

