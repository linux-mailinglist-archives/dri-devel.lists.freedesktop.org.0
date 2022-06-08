Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1B54298A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC4C10E41C;
	Wed,  8 Jun 2022 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E7810E419;
 Wed,  8 Jun 2022 08:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr9AtieIHTfd5ZUR0f+92lyEdm4YH5548wc6DCdh9Ca/trLcsovTftV3aAJkNSa+T1Kz6W56uf2jb/utofi8JjYO3i/LQb8wZk1Diz4Rv0IT7zYaNc4rx+qvqlsrltQoQmYTj29AT4AVGO08fERhWYlXw/RAAm4LYIrmaG92nUIVBHm59mEQmA6/0xYODHmUmY0foe3w8s0WMyezgdV7/J0AvFdpWlZl4wl4Fcq2QBrs33XVEuh673lHewhlhUsSkxYkkP/xsVFdMC7bfquF0aIAs04sSXeYPXaXP0N4ajQgm/75geCCaTfDK9uQSq9cWyimp58pc1a/9m47xQQMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIlG6/V8CagKWFtxZL2sj8vN0WzsSEz59i8JmuREPsY=;
 b=nmyngiuZZ39Cx+HYSSCn3F6uZchbht+KJkLefFVwhWT4u8ceX5+wgW1FD2jRBCFh/2mwurxE33bXP83UDGtv7d9B8wVmCX42qgTCJzQEQEShX2JVkk7znHxoZg6Rj1QZHNkuHV9BW8MUtiiLN5jt0Q4T0jE1gjj+qwzKMubnRowByJKWby4K3YdgWxE/TMZ3Jutd+3X0WXWZqEMTfbTm3LzjZqEnxAgr2YhZj4Nl5iOxz715XbdZqfcwbqlG+XzsZa81Brmy5w+SzoyvoQyW/PnR3X8wOHIVRYV0Y7FDs3um2admX+IJKiCjRmfgPUGvJKM5j4MkyormFw+y3fNA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIlG6/V8CagKWFtxZL2sj8vN0WzsSEz59i8JmuREPsY=;
 b=zHSGkn//5llILg9droLK791BN2yHDFv5gb+DnFwpcfWAxhyHXZWaHcK4F3mpPcCbM42m/zG16v961/Erz3WuMusR7gwdljo4vrLGZDdbWcRNL2d0Sfz6KetMmWUPBEihTOZj7WqZDOJfgxgArA8hYTJUKafszthjQ2vdl66cZ8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 08:35:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:35:19 +0000
Message-ID: <b2bfdb5e-25d7-22d8-1788-ba34256e7664@amd.com>
Date: Wed, 8 Jun 2022 10:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] drm/radeon: Initialize fences array entries in
 radeon_sa_bo_next_hole
Content-Language: en-US
To: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220607151933.32850-1-xiaohuizhang@ruc.edu.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220607151933.32850-1-xiaohuizhang@ruc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::36) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7de2be80-9d48-4ee5-e86e-08da4929d1b6
X-MS-TrafficTypeDiagnostic: BY5PR12MB4180:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB41809C0BA992D67984F9BCB183A49@BY5PR12MB4180.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLaWZvEUCIUboOpp9QswVm0FN3LyfjASjVY9LNswIRTs3IHNqtU4FV8H0HKjBZu2xCAehjYGwfMXKFIV8VAKEPW2HF8yqp9ChWByFwTfPV18FBKkDVgckzJ9Lfv6Aml0hpvoOxA3uADVLBNhMn+euOdXKfHRnnebbqTHqsLNtg6fwv0Loo7TX/6LwL86sdGPbPspTr2Wa0q49jMXzhSPL6GjBf7tvfHvF/L1fDdzK2ZVwmKG7TFcipeEg7hvYxK/KUZLwE/UEsUSeO8XcEf6pk5JColxILA+b777sChjK7ADoex3xP4fAvoEkKmA1eAPdhxXfFDHLYlPgp+ftJuaG3gCRrK1Jed3KS57RjkX2lqtuZihR37gjL6XE7qpVsx11VZ5IzyD9DtfEx1DaHYmCIiXriwwM2AYHcwXXVH1Qq/6YaAQsWSerE5nBvcOUZ9KisOtTYr+zP+mezqPF5mfEnRlPJnh5U18kKjqUUxYyQjin93C9Nu6+IcrTz95MZKMDF/R/JZAWJQRHWPzwZ9woh73VauEVn11/BpDoNfWIxSoTvpI+L9btipnTZZ86F+b6kiCeuGXPRutf575HbDf9BgRxl80146eNFGhfcDvIV8/PtDC/3k6xiD8jEh24sD4wUKt4o0Ks8aYBjKYfwr831rMk4hdhQceW1ORXDl1TTjumLqYhkp/QRJEhvpw+VV37h4NFJPewU/KqJmqnNPEwbQozrackF5119TTxw2Fk6zN1iLsb+anU9502QUUNeEk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(31696002)(8676002)(83380400001)(38100700002)(31686004)(6506007)(66556008)(66476007)(5660300002)(2906002)(36756003)(8936002)(6512007)(508600001)(6486002)(66946007)(110136005)(186003)(6666004)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0NnMUF3bHQxWm1jVjErQ0JleVc2a0h4eW0wUXpMVFdvdDhpNGtDT0lvbnRU?=
 =?utf-8?B?cFUvdURnWmQveWJoOXJjczRldEVtdGV4cmYxL0ZhU1BJc1NFNXEwSXNjTFZz?=
 =?utf-8?B?dW1iQWcyRm9DUEdZYUt0clo0K1FKcDR2QkNiNVB0a1NrdjBoRjA3QWpod3po?=
 =?utf-8?B?VTVCeGhTejNCRmMrNzhpc3ZSYjV5Y1NuMUp2NDVuRTh6T2hwemQ5RnVFdDRh?=
 =?utf-8?B?RXlrOFgza1RaMEZBTUMycFdveG1INWlxbzFpeUdJYUJDdURDYmVneWo1MWdW?=
 =?utf-8?B?QmNaVkFSY0V0UUVJS012Zzd6dWV2dm5rM250eHZkR0lmUUsxNGJZalZndDYr?=
 =?utf-8?B?N3QrTUFPd2RNbFNMa2pwT2xOcDQwTlQzMXV3OURveVJxUWFNbEJEaWVMZFRD?=
 =?utf-8?B?M2ZrLzRvU3NYV1ZYV1NzZFVpVkZLQzZhYVRnUVVRNlJTdS9pUi9kbXRQQnBG?=
 =?utf-8?B?QVh0RmxzNmlTZFl3c1kyemx4NjV5aFh1TWNub3FHMHhVZkZzWll4dzBHUUp1?=
 =?utf-8?B?cGVYR3VjalRON2RuSGVQY2F3eE5taE9KRGxmNXV2NURJUWJIWFdJSUFVTkhB?=
 =?utf-8?B?OHVod1F6TTVJM0N3U1BVK01aZlZ4aUt5cGh6NWRpUTZOVjNPNUtSeDVOSFpE?=
 =?utf-8?B?M0VEcVEzTWRmdUZHKzBwQ01qK2V4OUVrUmV3SkdNT1NTRmdpejM2eTRzZ1RP?=
 =?utf-8?B?RjJmUk01RHBHRnJFamtsZmZjdzdZK0RhRVJyL0s0bFYrdWpFUm9HNlE2ZnNK?=
 =?utf-8?B?SFZtOVN5cmkzeUhwUFhaaGVScWEvOGE3OEZYd0ttV21DemViZEtMckFKQjZU?=
 =?utf-8?B?bVJ1bkNxU2J1N1FUTWhOWU4xNzMzUnJlVVU5TWNXZEhreXA3dldwd1lRK0Yx?=
 =?utf-8?B?S1A1UHlVM1V5UjVodU5kMjlpVWRNTDRzTW5IMFFWZFlqK0pVUWhlalk5N2NF?=
 =?utf-8?B?Z2xuZGF3K2NIckVBalo1QWdlMVhZM2hCcUdFZjdZYXFKY3FOT2hxQWRVWkp3?=
 =?utf-8?B?YmlrNnlNZ1M0Y0E2OUthY0FGNXNFZTg1ZzZINmM5L2FNTUVSU3pxa3BVQkow?=
 =?utf-8?B?dnVMYWRRQkpUbmVhU1BtRlF5eXg5Ri93b1hyVCtlZC83dkQ0TFowc0ZTeTBl?=
 =?utf-8?B?eXJyVFdEdkFHQW1ZOVFCbDJsRFdKVXgxQ2F4NXY3TC9NTCsvQlhvckNUUUxh?=
 =?utf-8?B?NTB5OUZQRWx5UWpPZ3BQZDQ2U0Vya3NDemJkbEc4d2ZYbWlwTFFxK3kvS0Yy?=
 =?utf-8?B?RVVCOXBuN3BBWHl0QjRQL296OTRVdjVkTUczVWhlTll1RjRBak9ZbmdNbEIz?=
 =?utf-8?B?VVgySVcwa2g4TEhBZVBpNUtpb2ZYa2NNdjNESFFVVGtDUlVvTGUvYkpvZnhH?=
 =?utf-8?B?R1JBSU9ob09BQlptQ3FDMFdsR1BMekFuMXJNZCsvV1VvOGhTMkg2UGpoak9Z?=
 =?utf-8?B?cmtxV3RrRWc3ZklFWkovbElGSHZFUXpsL0NYTGJGYkFqY2h0b2pzTnpqR0lJ?=
 =?utf-8?B?RnNEK1Nmd0VubzhVUmd1Qi9aZHYyTmdqZllLQ28yekNMTjVaaWhBL1duNTdw?=
 =?utf-8?B?OGkxM2YrSkxpREtkZ3hBUWhWdWZUMzRKNnYwWkxoNVI0VldtbkpCZVBrSVE5?=
 =?utf-8?B?dDlRaGlOa1l2enVpeTY1eW1SOExOR2VRVEJoTk02WHBhYlYwUXk5UXZCMHBh?=
 =?utf-8?B?RXdLenAvUkZCOGZkWDlJNW8xNWVPUWVWSUxqTllVaUdYRXowMXRabUlLRm5C?=
 =?utf-8?B?LzBIQ0Q4QXFaTnpuVU9XN2syQTQrZzAvbUw4N2NGQnhPUkk4MjV5bGFoSzBU?=
 =?utf-8?B?UmFsSG5idFVNNldaNDJqZVV4bTBUOFFwaWRNR29hY3B3aEFGVXpPSXpxY2tO?=
 =?utf-8?B?cnc3RnE1Q282aG02cVZKK0F4YXBMekNDQzVCSXc2OVd5VlJXRi9lMWxrZ1Fk?=
 =?utf-8?B?bnY2bWc1UDlSU1dnZk9YNGx2WTgyWloxMzNZdEU4NWFVUThDNHhERTEwQzhm?=
 =?utf-8?B?TEVvN0pobGZXcTZCQ3hzWElBRmtRazU4T3ZPbDVxR01aaitWV1hjeDhoR3JZ?=
 =?utf-8?B?SysvWnpqZ0dIU1poRUorNzhETzRvcWkrWW1WQWlwcnpUOGNlMW93ZCtZR01K?=
 =?utf-8?B?S1NHZ1QwTGxPNXdhUUZlWXJBakhSTU1UcWwwd2NDR3NqVnpkOE1LSTh0bTJG?=
 =?utf-8?B?REJoZGQ1YnVRTHliWU4yYlhZRmx6RFJKUFJXNll6bENZTzlHOG9hWUJTSGVR?=
 =?utf-8?B?cklUKy9qL012YlBPcU02M09COTM0Zm1uMkpHQmJQdkQ1ZHdjL0I1T0R4MVRq?=
 =?utf-8?B?UVZXRGlwdGs5T29LeXZYT3NQOXpIR0gxcHRMYmtkT1lnUTRXcEV4R2IwaHFQ?=
 =?utf-8?Q?Z4li4e6LfOHRkaMFtD7dYJ3FdqUvqWquGL32ldJIi04rU?=
X-MS-Exchange-AntiSpam-MessageData-1: p4mqBjnlsbvhng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de2be80-9d48-4ee5-e86e-08da4929d1b6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 08:35:18.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfViJrY8L1P0DODqXu+TpfXPiQil4qojPInlN+bgvFrnfbs57/WnLqBkHY19cOTi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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

Am 07.06.22 um 17:19 schrieb Xiaohui Zhang:
> Similar to the handling of amdgpu_sa_bo_next_hole in commit 6a15f3ff19a8
> ("drm/amdgpu: Initialize fences array entries in amdgpu_sa_bo_next_hole"),
> we thought a patch might be needed here as well.
>
> The entries were only initialized once in radeon_sa_bo_new. If a fence
> wasn't signalled yet in the first radeon_sa_bo_next_hole call, but then
> got signalled before a later radeon_sa_bo_next_hole call, it could
> destroy the fence but leave its pointer in the array, resulting in
> use-after-free in radeon_sa_bo_new.

I would rather like to see the sub allocator moved into a common drm helper.

Regards,
Christian.

>
> Signed-off-by: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_sa.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_sa.c b/drivers/gpu/drm/radeon/radeon_sa.c
> index 310c322c7112..0981948bd9ed 100644
> --- a/drivers/gpu/drm/radeon/radeon_sa.c
> +++ b/drivers/gpu/drm/radeon/radeon_sa.c
> @@ -267,6 +267,8 @@ static bool radeon_sa_bo_next_hole(struct radeon_sa_manager *sa_manager,
>   	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
>   		struct radeon_sa_bo *sa_bo;
>   
> +		fences[i] = NULL;
> +
>   		if (list_empty(&sa_manager->flist[i])) {
>   			continue;
>   		}
> @@ -332,10 +334,8 @@ int radeon_sa_bo_new(struct radeon_device *rdev,
>   
>   	spin_lock(&sa_manager->wq.lock);
>   	do {
> -		for (i = 0; i < RADEON_NUM_RINGS; ++i) {
> -			fences[i] = NULL;
> +		for (i = 0; i < RADEON_NUM_RINGS; ++i)
>   			tries[i] = 0;
> -		}
>   
>   		do {
>   			radeon_sa_bo_try_free(sa_manager);

