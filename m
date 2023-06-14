Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE63730310
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 17:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6710E465;
	Wed, 14 Jun 2023 15:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829FA10E134;
 Wed, 14 Jun 2023 15:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIy30PzLIj6oRiTATJGFVa03hjjpAnt69RP1+ZL1YIR6EyrFAM/OeFWYJHoBnb+1UA9kFNyn/s77EZkNAqaAnyi0ejTRSE7+4PoiX+F3ET8R6mSfnZgUI/yBZDT1S3XWKDeH3O5htCqOQj2j09qBB9kBhxrJewcgxNCA51Fmv9gCeMOb6mLZFqPPX4ZwDhxtnIVUqEN5khHr0vpmUihNRjnu6/MfcOpIAV5ykCDb1PSIioM/Sq/YW2KJPou+IkpbAOMoc6i8FHavPsDPgzJv9jy91LZDxbSnjcWbBScr+HGoIvEcFYfmBxjvKge75CFQPmxz4IbXr/gEdgjwjyKXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVjII6GF+XBp87YXfiHzhMFgsWYA7XZ7MFMNowT7Iuo=;
 b=FeDSS572wfHirMXCdI9bfNKMbZ04GrwQ5e3LXn6ZyyG6+4rkGaIswcPoMpQskgOIPG6yJEF4UQBZEppk3XncmVgNnGPewFvRhjeyvPcn0A6cv3a0OMjB7zT1eJfLRE8hxlSrjuO9Tl4Bn0gbJKRFRMYhAomEBTMQ/7sKbUHw7NXneAmht/Z/EYx80T9/lv7aEkbC3jcbf+j0o80Cn1+6MzwA/y4qsemYvKLpFPKSn/mEz0cDDH7oipjv6iLbdstrgHsY2+1nXn7MjHECeTa+GU/JACwkQ6nZTg0urV3g7yTm0v917OrMrf23YbXt5bl4gd/bhCWWjZB5Au4QRPT72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVjII6GF+XBp87YXfiHzhMFgsWYA7XZ7MFMNowT7Iuo=;
 b=RSzOj42uoeVHS92++Y1SJT9BSz57hocjeyqyDIAFtyNB1VtAVs8LJVWpx0w/qB4G5ab3RyynkMHuFKSAaYovSdAi7XvCkr5u/ZvF/0Fm0EjsPVJYsz36V9UNPz7y3FO+oUu92f8qoF4e/vu9kuuyizr5wvhy4lpOO3Yvz6JlKHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 15:11:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc%7]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 15:11:32 +0000
Message-ID: <56f6f771-8ccc-ec91-e4dc-f4841bce38c5@amd.com>
Date: Wed, 14 Jun 2023 11:11:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdkfd: Switch over to memdup_user()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 15aee1a9-8f3c-4f66-1f9a-08db6ce9a34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/o7n6yaXWSPSu6R8ckD0h7+1BcpRmcKPFstPSYemGA/M0WzOaU6kpYSFoRgOIVWfFrDSyS4dN0C9hNfWPbJ4PlzmHeYnXJWzFJvxfW2uJ7dC9kQKxe+x7f1aqcfIMUzRy+IvPRRiprTb3cKq/JMGECQ9uuwNy8I2P/OQUG+7x2NkQs5lBh4WvwySa2n/am7JFxSI9P2bJjgsZ1UFVtX6f8LwVvnNT7qKlPftI+G+kOjI5U4NY7wmcvw7z34l0aFSjKcVRAQryQEGL18zc87bC3tk+D4ckSsobLw7AtRvM7u0M0afU3skID0GEpKsG8I3a8tRtsyljwJnJDqy51EOUnM3JYg3T4Z6UxalhcG4EsuBYovqEQtzdky1C/dKqbPKaOaKoXiH+Oib9HklezHBDgi9SwGBMMfy9N96TIgrvd9qA3FfUMNtEzDt/aGaSzHXFuHzwuJX+U9fCItZXJDaRf18h1bZOPdMZ+wOINJ+WpsB3DRHR51gekHo+NNGfxw3QBbvnyXFDgCcXriKPB4XB+okvnpMgcSiV8zQq8jF+BtYM1RuXVcKBLy6/u0uHN3WjSTbqyjtMT04PJ7gvBWhgCwC2MU0RCtaK9YajQZ+MKXwmxde1RLqC3owRAsALgSM1r4K+l/wkIyo3U/C+XYOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(31686004)(31696002)(66556008)(66476007)(66946007)(966005)(316002)(6916009)(478600001)(4326008)(36756003)(86362001)(6512007)(6506007)(26005)(186003)(83380400001)(8676002)(5660300002)(44832011)(8936002)(6486002)(41300700001)(2616005)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJtZHp4OGpyajB0cC9oVElyMm55bXVycFJUbDRrSDR5OUIzemEwTlErUkVt?=
 =?utf-8?B?RmYyUW5XUGRaeW1WUlNOcjREMDNMM2U0MmJMWWhqL1BLTkdGb2ZDSkJHblpy?=
 =?utf-8?B?bTFqc0drVkV3c0xmSlBackhIRTUyTk9IWkZrcTh0RmdEK2JqTEpLanRNNnpj?=
 =?utf-8?B?VkhZWTFXd1ozcGhqMkRJYTBVSG1UV2Q1VnA1WDFTSk9nOTJ0RVhjdEIrUnp4?=
 =?utf-8?B?d0gza2VIR0FFM3I4OXZIaXQvNlBDZTJuQ0hSY1BaK29mc09QYVIrSzArd1cx?=
 =?utf-8?B?SWI5N1NwMW5vZ1dlYnd6R0NNNzRSdzEvMktyNFU1SncyU1NibUsvNmNjcC82?=
 =?utf-8?B?WDBVanBWZFlzNlhaR3BlM3ZNZnpKNGVRK2JoTmpTbStTZDFGcGN2ZUk4cWRn?=
 =?utf-8?B?c3lRU1I3K0ZqUVA1aUU2Mzk2eTVwY3l0VzJGeDczUkdieWo2Mm01K2pHOWlp?=
 =?utf-8?B?ckp3TldBWUN0emxmbkMrTTlLWlpENWhqb29HSUREWXRHRmZvKzgvZjJFSFM1?=
 =?utf-8?B?c2ZlWHN3STcrdXdRK3pXdE5pSjFvRHVHL1FaZWVrYkthOTlPdVdhQS9LcFVu?=
 =?utf-8?B?UVlmdzU4K2MraDREdkVCdEZJbWc5UUZQU0pFYVp1S2R5VFdUa1VoM0EzWkEz?=
 =?utf-8?B?R2J2S1hUK2JrVHRzR1NOT2FXcWczdCtVNWxSMTZ1b2YyMDR1Zmc4M0lxNEkw?=
 =?utf-8?B?SEhUWEt3SThoc25oZndhOUh2N3FWVE9NQlNFK29tTkV2V09jRlhjMlRWc2Ru?=
 =?utf-8?B?dmhFKzRUVEZTU1lUTldiYUQrN3ZwR1VkVDZESlU5bm5xTjdwWHgzK3Q2cys1?=
 =?utf-8?B?UksyZ2hiV1Z5VDhCOEt0RytuMlFoc0NjR20vQ2Q3SlJzSy8xNmFUb0JhYWV3?=
 =?utf-8?B?bzlCTXVsZUE3MXBOM3Q3SkhNMmFkc0Njc3ptYmc1cC9ueCs4YW9SSk9lcVFU?=
 =?utf-8?B?ZVJNV0pHOE9LcnFrUFdFdE8rdU1wZk1yMWhiYlZxL0ZxU2Zyd0FESEU1T2Jq?=
 =?utf-8?B?Um5oRFRtdkFXamhqbzBZQWZYWEpSWWgxQ0lLNHpRMWtvSFFrNnp2RngzSFg0?=
 =?utf-8?B?dUIxQnE0MlJ3eUwweW5uL0FCSk5WSkZpRzlvSTJTVnZXZnMwaWtLajdySlNV?=
 =?utf-8?B?aWlSL3JqeDVJZ3RMOWQ4aEFtY2I1TWsvRHVCcGQrdUk4Z0Y2ZlRPLzNvUHNX?=
 =?utf-8?B?RGhMV0FPYk4yaXkyYUMwMnhGcGl6V0xWNXUzcmFXVWdwcGhZc2FNUndNOExS?=
 =?utf-8?B?THpMNUNIREp1WUxQay9SMzNWZEZwT2FCd1BKNm9BRHpGUWQ1cGc1ZEdiTitE?=
 =?utf-8?B?MUtnSG9ERm5hS0ttV1RpcTRRVWVCRnVYQ0V6VGVVUEt3d3AvWHc5Ly9WdHpD?=
 =?utf-8?B?STRMR1ZrN2FIRitkSFQza0ZvRlY1Ynp4Wk03TmZKSml0U3o5cktCblZ0WWRm?=
 =?utf-8?B?WDlwRnYyWE9TU2dUNEQwb1dvL0ZEN0RCSzRoeFRPcDhZdjdjQ0Jtb0M2cGtm?=
 =?utf-8?B?cXlCM3BsNmVic1dqbWl2SElPNmI1bUVuLytJN1pkVzgyeXlOWUUyb2t2dlJQ?=
 =?utf-8?B?Sy80YklINUEvNjZidG9kTEJpTlFEMzkyM25ma0VSVWhQWUR1cGZWT3pKWUQv?=
 =?utf-8?B?R0NvakMxczhaR3hqekY1MG9RMmZqSDZkTXE3SlRDVWhEU3NNVXdqZUJhYysz?=
 =?utf-8?B?dG00RXBaYXBGbmMzcEFKRW9PL1F1SDZ3Sk52S3lyVXpVQzNUZnhJSTZ0Y3pJ?=
 =?utf-8?B?eFpGdFRDUkNseFJxc2JsZ0hIL0F6QWJuM3dud05DZVhLNU9LWW9xRnh4RE1u?=
 =?utf-8?B?WmRQZXY1Y1BmR3ZTVjlUcHpHc0tFRkJWVno4RGJocmhwSVpwUVNaTVF1WGlL?=
 =?utf-8?B?NWx5VUFXM2N0QXZGcGZqemdtbnp5REZqamt1REEwU3lrdkJtUXBaZnJGWjVw?=
 =?utf-8?B?cWN4OVBxS3lqdk0rZnBWclFyaUphc0tJTTk2cFdseVZ2eFVobWZNd0Z3QkEy?=
 =?utf-8?B?VjF6c3lNb2lORVNVcHhseXowVEFmaExScnJLeFM2WnhNZXBWNWd3WEEyT3lK?=
 =?utf-8?B?S2FEamQyZVduQ2lnRG1qa2VqM2R3eE5XWW9EcS9sVFhYMVlOMmRPTGlUZThh?=
 =?utf-8?Q?AGrIa9xA+w+Eu3u9051Yvb6yk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15aee1a9-8f3c-4f66-1f9a-08db6ce9a34c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 15:11:32.7136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrgoiO4WyQxhVorFeJyYJ5WqU4eQf84X3dG3bqXhg1jkNUECYVjnpA/wUHzHUHTagUHo3Ta/6XaKRIyRiweL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-06-13 um 22:04 schrieb Jiapeng Chong:
> Use memdup_user() rather than duplicating its implementation. This is a
> little bit restricted to reduce false positives.
>
> ./drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:2813:13-20: WARNING opportunity for memdup_user.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5523
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Kernel test robot is reporting a failure with this patch, looks like you 
used PTR_ERR incorrectly. Please make sure your patch compiles without 
warnings.

I see more opportunities to use memdup_user in kfd_chardev.c, 
kfd_events.c, kfd_process_queue_manager.c and kfd_svm.c. Do you want to 
fix those, too, while you're at it?

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index d6b15493fffd..637962d4083c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2810,12 +2810,9 @@ static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array
>   	if (!usr_queue_id_array)
>   		return NULL;
>   
> -	queue_ids = kzalloc(array_size, GFP_KERNEL);
> -	if (!queue_ids)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
> -		return ERR_PTR(-EFAULT);
> +	queue_ids = memdup_user(usr_queue_id_array, array_size);
> +	if (IS_ERR(queue_ids))
> +		return PTR_ERR(queue_ids);
>   
>   	return queue_ids;
>   }
