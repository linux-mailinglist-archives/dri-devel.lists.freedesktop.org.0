Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DE3AC654
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E66E981;
	Fri, 18 Jun 2021 08:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5323C6E841;
 Fri, 18 Jun 2021 08:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieQeywPar/1roKOtKXXW1qlxUIjt0Wq055ohJlu1wcCeB07+0JPnbf/gap4osqQV1qthpLwsFb+JgK3W81YHekD/yggkynQjFiM3zWNJcoM8CXcVznx2iH9nbfNiQHTkZeoJl9sbdT72wPtyGlxtesUFzHkSmEfS6/8UdwHoGouLN6+oaW4766ePCWP4fxVDw9rlrBo1XD8dGlUw4BKuEftwlPrImSJ6h3hToNFi9ioLkmrEQem0cIuuJk+poyMZa1VoEBfgreUD60EO//Lb1Sm6P0uFLAYzkDzX4NFNqqHlidWC/RXUnOBPGK+4wE7BU98QLuTxcFWGcW7TDkQuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iyq7UDVwPmW/KGwqoSNjjPBNMpZNXq9cnHseJWxido=;
 b=bVJvZibfiDBceIELOVwyNugMCAVOEJ7gYIvzK1WMLIubo5D2esfw/rmdy37coTi2gG8HqXDBg2BMO+sdZskWOJGkOVRob0XyOrpHit//PraxN+m5Ui1pYzGS2zwglxYMxBf9wxlkjxL/qL4Tljkc0Ew/J7LMa4qhp5HpeE9CtT1Qd2a/3sKHY2ClzecKhfkMWn/Qkd0UWT5Rq/pFtGf28VfmiVFE3A7iEGSHKmWqCBGyX2rTRnoEXSkWJ2nRfVCuu72KyA+VGRSpcjNRu5I5ioxtWd6XHgOZ90XX8jhPDeKMj4aHrJ2FSShuYmNY7vgnyBrTPPKGFgyLrLbMpsQw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iyq7UDVwPmW/KGwqoSNjjPBNMpZNXq9cnHseJWxido=;
 b=08jsT68fzglLvUy+ELlTSJMzgVG04BBHD7wl7MW9rSl1l8kv+eGT27cf7JjOC5Wor1zTpJ7Ax7Of33MRygIQsuQ8CooFTrYV1UqXDJD75KQxsI7+1j0n3zNkWKeUnooSdqUO3ycBSVzaCZEXshqNpSneRPEVHYKvYBe8ssq5gQ0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 08:39:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 08:39:33 +0000
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
References: <YMxbQXg/Wqm0ACxt@mwanda>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
Date: Fri, 18 Jun 2021 10:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YMxbQXg/Wqm0ACxt@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd]
X-ClientProxiedBy: AM4PR0701CA0029.eurprd07.prod.outlook.com
 (2603:10a6:200:42::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd]
 (2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd) by
 AM4PR0701CA0029.eurprd07.prod.outlook.com (2603:10a6:200:42::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Fri, 18 Jun 2021 08:39:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223b4f05-5dd3-48b5-a879-08d9323498b6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40614A0CA08215B66DCBA737830D9@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xb1nACwWsGzpzmVFsXVNIir0zGg7AyqbvXJcgYVS2TVJgL4kNcNn/8/9EWDg0aRlUrfin01/InILqm9a+0e5ERb9VTTfhFxaQgtcYqdkljztQ5Yr5wIR2yV8s1OTtvxp7/hF42GP7p1i/j/4vDhR9HMtRdEoZX+WKeQnmlCJ7kWOhu2F5UPFCFJAdEltj8g8BeSf5ITNY7VpsaOsMdbjKi0ZSWTmSP5yByaz7f783co2v8+p/rLrqV/VO+zmXSI1HXXtYBpjE7iYOGnrYX8rzlOKxMhlTaDpKVNrNIQlGAL3412WSKiHBV9NKRKShCpBGQ6ZrTC1AG5Nerh5WpINunCCrgnFUknaxR+T9rOGDPFGb8kq5HhU/c+PWd3DMHOm+4lqtzia9xgG2c3goEYwKImF5BO/Lgu5RUNedKfeqiapWt4L9CJHsM3zCItRDe1/MmlhvvNH2mEmur4VOvpnZ5EP7ewfh+qiql2NxSUha/wpMqXIwZhSiI3FsdRkcEfAidXJ44aP2lcITRjmizAWjijhae0qXhkHsh/wJ/qJ0xnmytiHpwwfC/KU/m5D4VT4mZFtsnCRf30UefuHdggsZjFyEsZ2H60xcCH/beq41P2QYBbTdh/wfJaeRdt/md1tNCFVXPQLLgyL96zv8VfWhPyuVF37lb68whk7xrO6VnOso8KZusNlH/dTWtGKBMmQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(2616005)(6486002)(6666004)(8676002)(86362001)(38100700002)(5660300002)(2906002)(66574015)(8936002)(4326008)(110136005)(478600001)(36756003)(16526019)(83380400001)(54906003)(186003)(66476007)(66556008)(316002)(66946007)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K21Ba1RlMEFQQVo5OWd0Y0VlVmx1SitibXNiMVZwOWR0OXBoN2poY2kwa01E?=
 =?utf-8?B?YjhqMHdXbnUrY1k3eGhPTm1WU2Juek0wVXhmeDA5ME4rQlloMUMzTHZLSlRR?=
 =?utf-8?B?aUlzUnRQUTJnTjFLTjE1WjJnWFBTMDFUUWxrd09mS3RBN3hEQ1libDloR0hw?=
 =?utf-8?B?YnFxMENFeUMxbFVDN0NyRDVHWUxqa0ZiaUVZbndNa3NvSE5WbDhWdXRJUkow?=
 =?utf-8?B?NkxLbWtsUFJKUFN2SGpYM1pxSU4vWUM5MTBtV3ZVOWpRblhIUVNKMnRNbXcx?=
 =?utf-8?B?UFVlYU9XcWpXNjVCaVZ4QWxOT0pRRThqczJ5WUFLWGpFWXRFeXViYkNwUm9C?=
 =?utf-8?B?ZWNEWG9sdTA2RXlsYlpKN2cyeVloNUhqeEw4aERhNFVsVnJJdzkxWTlUOVM5?=
 =?utf-8?B?N2I4UllMZDA4eXkzUk56eml2RUN4cURDT2MwVmNQa3BuZG1abkIrMGRFVThL?=
 =?utf-8?B?VDkwc2k4ZkVGcENSdzZieUY4RFVXd3dvWC9xNVo2N3k0V3prUE1rMGxWMTVw?=
 =?utf-8?B?SnZIUlZzZG5jMEFJRVBUNENoNW5lYVMwV3VTSGNEbjdiK2pFQUh3dFpPWDNq?=
 =?utf-8?B?RW9sWlJVNW50a0YzZkhiSi9uY1orTGZ5cWNXTkt4cFp3cExFRWZIOFJjbENW?=
 =?utf-8?B?MDVQQ0wvUW5uVUg0eGdaSXBIWVd0NXVrdHBoU0lrNGh0am9peEx4cXZmMldE?=
 =?utf-8?B?VUxadEVZOGpuMkE4TlpJajhmNm5SQjFSN3ZwUnk2bEZWWm52dTdWQmhLQjlu?=
 =?utf-8?B?RkF6S2xPWWZIamZSSHJrZER3WmdRWmU1bnFERXM5bWpLZEs3clEzWkR0d2RN?=
 =?utf-8?B?cjBjZjMwVHZPSHJKekRUazVHcjI5UVh1MXFMWkM4emlwVm9yaEEvYlpySHdG?=
 =?utf-8?B?SmQ1Z3dONkJ2SzZjeWpiaTNvc1VmTEdQNElOZ3dKV0dlNXNJRWRvUWx4aHBp?=
 =?utf-8?B?WEhaY01OZUNybi9paXY5UkorMFJjNHZFd3IzYVFoM003SHhEWVE5Z3Zwd00w?=
 =?utf-8?B?NEFsUmplMk8zRzMxSklXMVVVc2M1Rk1wS0c5VWM0WGdFQnBQSW9nOEJ2cy93?=
 =?utf-8?B?UVppWTV3Z3U0TDBBaUk5WkVxcERoa0pmdTBtSVJnVHd0c2g1ZlVYTDMvUzZ4?=
 =?utf-8?B?RWlXN2tPMExDdkZ1WVRkOFk2YUoxQmw4c1NFbGhiM0dlNFZyWmRUVzYrbTFC?=
 =?utf-8?B?dVBaR25MRDhCOWJ6WkNWQ2s0dkhUT0dMSTgzOW4vcFhBRWdmQzc5UHdsZExF?=
 =?utf-8?B?akdRUXNabkhaTk5wai81MzhDMHlWc1ZXSE5wZXNhVHBYU0g4RUJMQng1OHNS?=
 =?utf-8?B?YlBjNjJldVV0b1ZDdFp6S1NZaUdUTW9RcTE3RjNtNU1tL0NIR1N3L2JyeVE1?=
 =?utf-8?B?ZjJjaFVYM2o4NHdwNkJYWkpnZHVqeS93SmJFUmxZeXhNQnFVR1JMNXFHbVM1?=
 =?utf-8?B?dXRyRVVFR0dYVVZQYldONTBVRXk5Ymtmd0Q5WHVCRFFCaTkzRCtLWVFOSHZE?=
 =?utf-8?B?bXpTQTRsV085R0RjVHNub2tDMTQ4RXZldTZSMFRPd1VqS3NNeWFpM0RXdUlF?=
 =?utf-8?B?aWZKNGpUM21ycW1zQ0l4K29PSEF6VlRRL3FHR0ErbVRURzcxRzFKZDF1VUda?=
 =?utf-8?B?SGEzQkVlWm92U3BWV3NNRDFjcVlxSklsQ2RueTdhc0lKenRnTmdlYmlWSWky?=
 =?utf-8?B?U3ZRV0daQjFjcm5GZlZTcG9GR1BuYXNxalVhR0hnZ3NtczlwZ2tjczJXMzI0?=
 =?utf-8?B?ZnBOWHc0YUo0R1k4VGRoaHprempmNEsxVXFla0lDRngrS1RDcXB6b25YUnZy?=
 =?utf-8?B?d3VPa2xoMkZ5ZEEvaDhoaFo0TUsvMFpyN2V0eStWdjYwVndJdXR5cVllNTl5?=
 =?utf-8?Q?wlQl1Mg8PeUFJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223b4f05-5dd3-48b5-a879-08d9323498b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:39:33.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpAXa/iYXrneQbabvzr/DciW6zHkMNBRBwAfkWu72aHRAftTWpgWPVc3f0UVPPZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.06.21 um 10:37 schrieb Dan Carpenter:
> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
> always returns -ENOMEM.
>
> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of git://anongit.freedesktop.org/drm/drm-misc into drm-next")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Most be some fallout from merging it with the TTM changes.

Anyway, patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index f6aff7ce5160..d02c8637f909 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>   	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>   
>   	*res = kzalloc(sizeof(**res), GFP_KERNEL);
> -	if (*res)
> +	if (!*res)
>   		return -ENOMEM;
>   
>   	ttm_resource_init(tbo, place, *res);

