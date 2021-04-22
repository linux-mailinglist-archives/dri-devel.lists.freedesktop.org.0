Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B4E367F51
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 13:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76B6EA68;
	Thu, 22 Apr 2021 11:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861FC6E083
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 11:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsheJt36pbNX3PFgkE8855eb9NdK2FsoxZjA5wOgpaKVqbWJ5Nldv4xwadevFi3d9QhtUu7Nby7MGMwE3ER6GgzyrMgU7Hie7Vcq7s6QLUs5MaVGq4IIuKyBbkQle5Ds9H14hYnR2cUhNASWuubdOBK9Vdcc9JRk8i8Llw0mB7V6AO6YG75UFwE2T7egFoVRmMCoOA9Ye1ZC4ikkDkIUNSKhSPdP2jZLt+Q3FxoLP0Tqoi5f9ug530QXG5gktaOzsWJu9FkJlDNnNF+ob54cZzUxPA94AsOKmtwYyYvRjRryS7dwMtCG8jHsWJd/miTTm7iPwSv0npqwluruCll3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMnYknRS5kT3QeS8qPt3tF8S2hQkdebi1Fgi9srH+sw=;
 b=EqcGu1AnJgLdVe5s/O3Y64EPxMu8Kn3gnlYp3zItCwm3kkndwLSuYE8tza3FPnxymiOp0fgK8epQB7jJaixWi78CI+Dj7om/c2XmWKUNuVXgQSjEuy2ImtgOySDOUpyymOQgpcjjaA6/quvPNW0DwTbVmvEt8JlMLIIILYjJInt9UTUohdGFO/ZqhF3VyOj9bNK3hrINY1YX0KkaaCNjXCdGumm8C306gREUS2UO2hZOr23PAVGrZ1mxfs8mfonZMxl+KZtBTMTOEtRisV/+M6ow+3hMr0Ol6WfEweHrRhJ9LNFGDVICXeVcLbFoOVKMxMMTiL3+/yiHcK6GHYglBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMnYknRS5kT3QeS8qPt3tF8S2hQkdebi1Fgi9srH+sw=;
 b=5sEXJns7KEVo9WGxLfIwEHYxRVe3yTSy4Z6NO88JRgq9q2a42O2QuS/Ffy7eRPixk4xMITSu5tbg2t55s9Rz09Atjh710DvJbhJ/DEaP2XGVOqmrTDrJksG5p+uXov0sOtb95pY4GFu5vB3bstb94F/qFoxcn8sTtyBziwOjeAo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 22 Apr
 2021 11:11:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.022; Thu, 22 Apr 2021
 11:11:04 +0000
Subject: Re: [PATCH v3] drm/ttm: fix error handling if no BO can be swapped out
To: Shiwu Zhang <shiwu.zhang@amd.com>, dri-devel@lists.freedesktop.org
References: <20210422102521.22580-1-shiwu.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a402f61f-9b4f-91c3-d9b7-af6d67ab4f6a@amd.com>
Date: Thu, 22 Apr 2021 13:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422102521.22580-1-shiwu.zhang@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
X-ClientProxiedBy: PR0P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
 (2a02:908:1252:fb60:2fbd:d2a4:da7e:4526) by
 PR0P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Thu, 22 Apr 2021 11:11:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51ce71b0-0c99-4970-3d12-08d9057f51af
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49474EE0079F3C973C75CC9283469@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgViSvx/FOo7qCuQcLzjVaQSjSKnV2YikWFHA4abAtGy7zrU/Nt8BuaA29QCfggEAXgAKhcEXpXoHpQAO7b/diENMcVwTcvZunT7kLNZyEyOVivC3nR9/tf7R5hTmDAVWlnXFnw+nWYewFpyjAoI40viWnjMQ6ewlg7iS+4m/VxRgNXq0s92SAIlwin2pbnjWhdxC0D7gDEnJscyPCCPeQcsmuh/i+4TVGIzPzNEl5d4dMbbs/suyoDMyBjn6JDoea0DmPtIgEbJuVFYDCFoGHugGZq1yNpqCZHWUYtrnERxx0nCk2mKAmj3843yHjlDWusZNc6YgZBd3edrkIOkCRyTSmsmAo1xEklJ8ap+FR/w9DEMAWc1mleafIGKASvTXOPmtoUOTRAWYwJeORoV35kwKadjaECLVjf/QGgsWup8Dd5XJLtdqlynHLx3toHFgTTt0ryCnbDied8J1GVZbgojWAPRp3th4E30S8p7a4sbbtF9FaF93VWzXzk+OqpNw9KQJkRsROq5fLlF7SPvSrPtquzBNNjlFzN0vjwsWQidC0S27Um6s5HH1ySHvQwjzzObvG6phmlDhQfWra6b2y5kFjxUW2O35CbEAsLB37cqWpfOqjXxNIj3PMm19JtpPI8OcOuJpJRVGaLNhqvb4V3JQTGryb6WND0d6JK1NbjEXQ0sLSHiTdgS+Y6Ihkh+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(2906002)(5660300002)(186003)(31696002)(38100700002)(316002)(8676002)(6486002)(52116002)(66946007)(6666004)(2616005)(478600001)(8936002)(16526019)(83380400001)(86362001)(36756003)(66476007)(31686004)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEM5UWVxNmxTOFM4S2FMdWhoSmNTOXdwTHZWZkhGOFQ0dVBnSXBPUE80am5I?=
 =?utf-8?B?WFpMaW5pMkFwMkdVbzRHbm5nejBheGNudFNXc0gyNkh3ajIvVVN4Yi9tYktT?=
 =?utf-8?B?MEFUbURnL2ZKWlhnMTh0TU5YcUJWT1hOR3pHR3JwQkxkUHcrZVpGYnp5MndO?=
 =?utf-8?B?azlka0tyTEhaVVpYUVlTekJFdUNzbFNsU2lLYUhlK3JtYWs3RTNtdTBkQjY2?=
 =?utf-8?B?azhsd3hqTmNGdVVDWTg1M0x3RzhVcGEzWUpKY2lTUm1ndWd0elVVZWtGL0Zr?=
 =?utf-8?B?MEpkWmw3T01pVzdHQVV3U2huV01seStvaXdpdkZzQldRazZhRUppTWRQSTVM?=
 =?utf-8?B?bVBtejl4eGhYYnpFQlpnNGlqLzNPa1hOZFQyVlpRa2Q2eEk3ZGRtOS9Zb2J1?=
 =?utf-8?B?NlpoYlZsTkxIcTE4UDg1UlRYSDNqSEMrNFhuVUpwdDFZaHNnZURpSWg4QUJ0?=
 =?utf-8?B?aXBmZ1dJVWZZNHNDK3B0THVSTm0xUXdrMVYxSzB1dW1LTTRhTzJScUt1dUVR?=
 =?utf-8?B?WEdkT2NsOExyRmtnQlFqSjdEcVRCWDErN3BvUDYvVjFmZExURXNOMzBZTmlC?=
 =?utf-8?B?S1d0Tm1udzVpWXpIemp1dmhBeXAyQTNKTnFIcjhvbExGYWF4NFRZaXJGd0tl?=
 =?utf-8?B?ZkJrOWZSVTFqRUlvWVAzZnh6VTZTc0hKSEJCOU9oczhwOE5rb2VNa3lHTjNz?=
 =?utf-8?B?ZWEzTnlDOVFvMkNLSnVkRm5RbE5MbkkrUGlsWkNRME8remNaSG85dklLMlBB?=
 =?utf-8?B?U0tsZ1pxQy92elRIWUxsQVpoRjZiMnkvcllKMHJORnhCNkl1U0pNK3VTcDM1?=
 =?utf-8?B?aUZYdndGRHkzVVFpNzlJQVgvKzAwS1FLbTIxUjBlMHlGL3JqM0trSnZwYmMw?=
 =?utf-8?B?WEIyOVpGb3FOZGhqMXlCd0VSZXg1MmIyRHJibG9ldzdpMUdDalRCRVhaQW5B?=
 =?utf-8?B?NThuRnU0TjdjalhOOHpaNkZ0SFJpV0ZSNUE0bzg1RURzTmNlZzllVVAwb0d0?=
 =?utf-8?B?SnBRNnRvWnoyWGFnUFVRdXhESzYvSGxVd0VRWUYzcEtuRHhYREZTSlpodGRH?=
 =?utf-8?B?ZUx5My9iY2VzanhYZU94MnpyMGdpMVQyMDhMVnBUeFdybmh4WVZLNnpoQmpB?=
 =?utf-8?B?WUZYTWlaSzhXYTFyUERvWnVicldqUnBMaHc3MTRjYW01S0RGNTg2MkN6a091?=
 =?utf-8?B?c01DY2M3QjdCTHBJN3A4Z0RKTThVWldZZ0RUQURYbzZrYzJWVzdVdTVvYUlC?=
 =?utf-8?B?MHVhaFk0WWR3akdvczdrRUp0Q3poQVpLdkI4REVncEdyT2FBTHVDQkJHRGEw?=
 =?utf-8?B?bFI4WWdTOFdqUVQzdXRaN2tYbEJyeUdoOXZEeHczckxJeVpvdlM0bWlaeFY5?=
 =?utf-8?B?amcrZU5qQTc5bE9Cblo4YUw1OEh2blJLQW5VVU52N2loNVluZGFOSWJMaGNI?=
 =?utf-8?B?UEhDeXdsYmJiWC83b0JrOFRsdjhQSDh4Y0ZVOWdTYkdpMXc0MmlhTGNWMk9D?=
 =?utf-8?B?SnE0WU1ZaytxKzRlQkJZdVJMSitXMWd5djdXdlRWaW1YbXFVeDN2elp4dEpT?=
 =?utf-8?B?Ym9zcDFjckxxaG9LWW80Qm1Wd2o3ZjJjNElMemtDMTVGdmtNZ3IwU2Z4OFlW?=
 =?utf-8?B?WHJlZjg0dHdycm13L0w4RlAzTlI4R1NlekNOOGd6M000RnlmeTN4VW1hdUZQ?=
 =?utf-8?B?aCszTVhDK2dnU0kzcGphQW10bXpkSEtCVGVPaC9ZbCtad2JLVGZiZVpzZ0Np?=
 =?utf-8?B?R2wvWFM5ZWhkNGJuOGZFckxMS1E2UmhlU3ZyLzlOaWg3emVyYTBKVmo4MlEz?=
 =?utf-8?B?NjQ4V2IweUhTQ1RjSUt4U09EVk14WTQvWEVxUVlpVXF4aDRvdHk2Q1hNbWkr?=
 =?utf-8?Q?E6WcAqH7CY3dZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ce71b0-0c99-4970-3d12-08d9057f51af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 11:11:03.9969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5GHt2UIOtj6WR1ZBS4zANzuJWjYu3NDWNPL6ebA9Pt5/7mLsJf6jFi627lSGfPp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.04.21 um 12:25 schrieb Shiwu Zhang:
> In case that all pre-allocated BOs are busy, just continue to populate

I'm not a native speaker of English either, but I think that should read 
"previously allocated".

> BOs since likely half of system memory in total is still free.
>
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 1f2024164d72..a48fe4dccd61 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	struct ttm_device *bdev;
> -	int ret = -EBUSY;
> +	int ret;

Oh, we have been inconsistent here?

In this case we should indeed zero initialize the variable and also fix 
the only other user in vmwgfx!

Going to take care of this myself.

Thanks for the help,
Christian.

>   
>   	mutex_lock(&ttm_global_mutex);
>   	list_for_each_entry(bdev, &glob->device_list, device_list) {
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 48c407cff112..539e0232cb3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	       ttm_dma32_pages_limit) {
>   
>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> +		if (ret == 0)
> +			break;
>   		if (ret < 0)
>   			goto error;
>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
