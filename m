Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707893D08FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 08:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA9D6E907;
	Wed, 21 Jul 2021 06:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D686E906;
 Wed, 21 Jul 2021 06:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDQwGeueJ3xVFJpdLxqxcTNUU0NV1mhNDxXK415kH9r6r4yd+PqqmRNfoaZkoJYNwRS3GyA58YTkwPzHnW7leIGfDy3JbIO9XVzxpVZXAJfOjmFVA3J+5QrfGbsc4Fzn0PQiDZLkTHbYeX9b7kKW4dNMAeg4oCLNTmltQCskWkVCZmNsqSPjCsH1cBtcesT7MrV0BvzGJv4ukyOOWjQP8mYpHRJR4JEv9IhxFdGdbKVHwCB1NWEZKM/zI5AlcFibceDMGu+eWIUaRdShcTtIGrjEqC5Bqb9KDD+rEZ6sbWzd85iEv8xov6HJWqN57gdyiwKotxZmrhJuxrCDBStDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKWo3JbRvZV9s9+Lr7bgZ/4u3OCBM/ob5YlXpB9rbTU=;
 b=dCN5arGtPLmHKZwGl71wuEsBkni5MKCPIoPIYUA4r0zsk+Nvw2KiSy3tV8+bipodQ7qLbuDxusDh7kxDg0gb7x1KnC2ugFexmD3jq7pcbkM8zUQWrrFjRIvgSU1Gaspzcocgw2dfxfQyRHX78Plq6g2zHf9JAQZVvkqqLDcdG+kUrs64d6HLdBnV2cGQRZ3nqVJ5q1SsVlYXCesCHEb41dtO/Fp8V3OBG4IC6QUwaifLEz6e1UFAHKXy2GpRYL0zdUM5bA01rNNLUl/Vrkx3t1TZFI/zozpcU0RCgYz4YP3wChlyOhPDTrFj5Wh46jqfBsUWPnpgYjnUi9JeZbDQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKWo3JbRvZV9s9+Lr7bgZ/4u3OCBM/ob5YlXpB9rbTU=;
 b=PwqpF0jOpggDgyC11UlsRjMlxQLolMnFcp0lvMJGYAsJLzAwrUf0Qv8NlA6BQnKBDJKvs4UVeorPPtEiNEJp6nv7DMnfV+E4oau5RVokphsZMZ2aPYgiHsMvii0DATOFlWdKTiE5VSQTvXuTTnz3QCYNYpFvQiD92njeEimB8ak=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 06:36:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 06:36:03 +0000
Subject: Re: [PATCH 4/6] drm/ttm: Force re-init if ttm_global_init() fails
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-5-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
Date: Wed, 21 Jul 2021 08:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720181357.2760720-5-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66]
 (2a02:908:1252:fb60:9bcf:837a:d18c:dc66) by
 PR3P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Wed, 21 Jul 2021 06:36:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78f4bd7-cc53-4c6d-1a20-08d94c11cfb5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900EEDCFCC8E60C96672CA483E39@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y00o+Yxb0zFw3ADJM9iEtTd9EoGREPYNznST3Cmn77qjtGyx5YvGChQlSNLijnEm99cO/YuYoguzcmyAMKpK/ZYWUEALjk/eM/B97yJnmMCDvPxr+mSGKTu9yflV5Ueho+CY84bn2CHJhy7zv7V8dnF2iiei5Bu4/gb8vY4t3SwEvbuuYXaSI5093PR9nNoYckBRNfTDdCF+PV26YCpkrmver4PH3UfTIRv6hKROiQIksR+b4rHr9wvx5c3XzXXYJZ+mTd8zKzxmjVVYpTrVUCW2FlAFF6u0PUYD+Qbda3E8WskXds/1jIjv/AOFwdPjg3olP+XH2jM+XKdnSaECzVeHeUYou3dbLrumx5eeaTXbyyjXsgvgO3XoFVP5zc2j6wmpTTNQEEH92uy4i/RghtI+OZEy13ClVKwvKgWRwn4IJOzmOiobA1wIjrY+xnzZFCUyegOJyxdrqaOMPCkq4i9759ikoP6Mv0ZI4NUNx8P7nU6MuCsYrII4YkuDyeKYhsmeoqrI4FA3SVDjnkuGyVjZm1qwTtRmnxTbthw3+GkRwumtmK+aR6ppShfJ267QGEH//dWdhRfj+viqHF4tEWKUCY/XfYlWCRw+wXvayNNZuC5jk62eOJLOjbjblkGqe+M7anc03+gQVd81ET7mlVJ7o0IlvzVP1quplz3V+WiehK+8elwaffAwt/GQwy0V8PWCldd7eJp/OHfid0EcQJgd2lxiO7eb/n8rE0jxjbx/gChH/euO7F3bY08/qcof
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(31686004)(8936002)(5660300002)(316002)(478600001)(2906002)(6666004)(8676002)(66556008)(4744005)(66476007)(66946007)(83380400001)(36756003)(2616005)(6486002)(186003)(66574015)(86362001)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG84ZnkwNTREd1FBdVVYV3FIT3NOcmJodkpuT2hhUUsvbW40VjZoVlF3eFBU?=
 =?utf-8?B?Q3puUlpMd2JXTEswVGJBYjhsZHlFTjdFWVVybEw1SE1DcFlURVRWdktKMlRJ?=
 =?utf-8?B?c3pCUm9JYzQ1bkRTTkw3WHhqeFJPUXI2SFRGNWdUK1REdnNHdDlCUEIwZVlz?=
 =?utf-8?B?dlEzUVZ3aDZGZDdyRFU5bkxuRTZndWlYcEUvQ05PVWFzSElqdzhnOVFvWWhU?=
 =?utf-8?B?bER5QzVKaHF1WEdVTWlWMjRsRS9yaE5MNzE2bTY3OStkaE0xUEt4WVVYc1hR?=
 =?utf-8?B?M2w2YUNSSWVqcEhYejlKb09jcTI0WGFjbFdlZi81ZDR3am1xUm5sTHorVEFG?=
 =?utf-8?B?Wk9udnkyTWZEZDFTSklRR2JXVk5jNStOZXBIT3EvYU1QYndabTJIL3pUa095?=
 =?utf-8?B?c09XTWlCakFCdFFWYnRWbHdSZ1Yrb1lFU25IdHBPRlRGYjA3cDNORVMvYXBN?=
 =?utf-8?B?R1JFY0orSUpYdVZiUHduc2VyUHl0bTZMRWJ5OElZUTJFS21aUStxZ1FkQ0E3?=
 =?utf-8?B?NmxIRmdPSW9HY3NmKzhMWkJJd2UvTFcvamw1ZldpK3N0enpOSzkxRDFMVkdN?=
 =?utf-8?B?OXZtS2NNOWNFSXRSTGp2L2Z0LzhUc2piWGd6amhZWXVWSWtoSTNXOWpLL29x?=
 =?utf-8?B?WnJxWmJrcnBBcml2c0R4RHFkR0hJQzlJbXVja3EreU5ZVngzYzRjWmM3YS82?=
 =?utf-8?B?dXVYcFRmaG9ROFVWWG1KNnhTNE5mLzhqNjd3Qm5YdkFJOUFJRzF3Qm5RL2Y0?=
 =?utf-8?B?UHRtdjJSYTM3NE4ydVpPYkg5N3A3SDdBUmxPNUFhUk5BbUhtajZyMUhrM0NO?=
 =?utf-8?B?ZlBzMnpxYVVRUUJNb083anBBYmRaYVFwQm1PM2s2LzdHV2ZBZTRBbjhEaS84?=
 =?utf-8?B?TzN0TEpYZWFiT2tpcnZISURMaFpWcE5qY2c5THZSZ3pvSTBIMDhwOVBvYlU4?=
 =?utf-8?B?ellUS0htdisvdmM0akVweENEMjFuZXFFbk9ZUDdRdldHVlNaWjZGc3g1aGFX?=
 =?utf-8?B?TVprNENoVWN1bG81MkJFQmxHeS9LcVcvVklXMm1sTUU5VDRza0xpODJxV0lp?=
 =?utf-8?B?L2EzMi96bHZRUmgxU3hnS1FJeHFaNmpNUWZWaXMwck1GTFB2K3d2bGxqeFN0?=
 =?utf-8?B?WkpXZG85NmFYVmdHU3F5YWl4Z0tMcG1Ic3BkRE5OZ09MNDNBUmNBeFdaWldL?=
 =?utf-8?B?bnloTjFkR1FNYXVYOXVaTG1MY2w0bDBvS2hyRVRMbjNxaFlmb2J0TXE3YUdi?=
 =?utf-8?B?cnJpNXBQUjhwVWI2Y0NycVEzak9VcmJpdndIS0ZQTGF3YW1OcURhUkJNNFVW?=
 =?utf-8?B?SmRRSkEwUWxoVUd0OTRNNkV3SkdXUDMvVkxRdFNHMDUrTFNXWUNMMlp2Nmxm?=
 =?utf-8?B?ajlHV0pKSEFTSk1VaEFLb0NOaXBuSDhGdjRZN1lVd0NmdTdLZDFOdHhWMUgy?=
 =?utf-8?B?TDAzTERCUzcyekxOMzdRU3VSR2NXblFHbEV6MllnNzdvNitqRmhvVEZ2bW54?=
 =?utf-8?B?VTZNc25VL3YrMnJWYW9rT3J1ZDUrWVFIdmxwdm1sRld0UzF2bXJxU0ZxeThz?=
 =?utf-8?B?SU43SmJFQ2hTaEMxWDBkb2dJd3B3K25jYXhWNjVKWEsyN0ZjUHFjNnVTNHJ5?=
 =?utf-8?B?RjR0T0JubGJvK1F0cUQ0a3NIcmdSMXBQdDltdmJZVFlJaGlkR2JMam5IaFRJ?=
 =?utf-8?B?SjU5eGRFQXU5b0VRZGtSNDZMdVBxVXJwRzBWVFJQOGZ0VUZJbGhRM3dEZTQx?=
 =?utf-8?B?c1RYUkJ3L3hNdmJjNEFvcllLdE1uN05ib2lPYzlVcytoUWtRNitzMk5JVGYy?=
 =?utf-8?B?aHNHa3g3a2hES1RvV2VMdHlhcEhRK09wT1MzZ1NKbkNFQ1lsdDlRMlhnSEVV?=
 =?utf-8?Q?pDzl96ioo8oKH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78f4bd7-cc53-4c6d-1a20-08d94c11cfb5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 06:36:03.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtI7eqAiGp8jRgJWERxBbFm+PlhVHtLMWf2QwNjU5SgPR63yUGkd9d81U7z+uk3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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

Am 20.07.21 um 20:13 schrieb Jason Ekstrand:
> If we have a failure, decrement the reference count so that the next
> call to ttm_global_init() will actually do something instead of assume
> everything is all set up.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
> Reviewed-by: Christian König <christian.koenig@amd.com>

I've just pushed this to drm-misc-fixes.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5f31acec3ad76..519deea8e39b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -100,6 +100,8 @@ static int ttm_global_init(void)
>   	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>   				&glob->bo_count);
>   out:
> +	if (ret)
> +		--ttm_glob_use_count;
>   	mutex_unlock(&ttm_global_mutex);
>   	return ret;
>   }

