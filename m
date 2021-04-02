Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80021352DB2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 18:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148686EE8C;
	Fri,  2 Apr 2021 16:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2072.outbound.protection.outlook.com [40.107.100.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269696EE8B;
 Fri,  2 Apr 2021 16:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JltJTlX4U+nycgx1/fr6HArMo5KlfVJ6pQIjioViFq+HrwoOR1ppnNLJi1c5ztgE/CB4BOVsxCq2skH6ZhOMgJhOIKj2yawwfopKcxKhl8ryE0QLD0SM3sihg+nNDuqur/4HXGsRP7B5H3CJzPU2/2H2Lb6Quj4ihtlbAAOaoeNW9SgSMDrh9izBJamqEjVQBLaO0cs5SoAEr+IqNG4ThXMOSVOTx59Rvvu4xPJGTex8VW57YJDZNyR5SQH3ilQegqQ1fOw/HhVCZ5qfDChO31DjIoey/rx00bFh50oWuyjXC9nhUGGju129YjRjB5ZdBvkGrHv0N99HZNCDrulHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7DS9UEYuavuquQVLpiCzHbtQf7oRDdcccoV076hLVc=;
 b=OacZfc1e9zPwHo0BAywaGZosKVfYL3RbskQ1lb9US30q6z3NYXAGVFiyANx1rHaAsAFGOMsawpDxwnRFrlfejDjCvHg72SBJAOuZ9C6iPRYSd8TYqnskgmLYXzupAZM9Yie0aeSwHRj6ytz0pnqgbpXcjJy6ASRe9FYK2ONtgkL9vGjYkaCm1IzCf44jrsNMmpz9c8W3miVU71GQxV1xqwjuswaeX1SUILRAJeNtdyaFRpoiahy2OhgdLhErmQqM0Qwc8JgAiL0Tzjmm2r5uYo0Z25c5dackodd8pJDuP2cbaKfInaX8Eov7DQdVsvIMf3f2pmMTMtdPDMfTWZfWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7DS9UEYuavuquQVLpiCzHbtQf7oRDdcccoV076hLVc=;
 b=smkYpqGGk/sbT50rbtnG4Wv/SALhCQfFJzOnHryads0CcyPLkyzEs75VVgQ6GIRqvVMeHvMdDTtV3eiXLtta7aazGUy8aPQl2gaPAlbz6PAHVA1NxRV6YSmq4pHlcOirn4294hydDhLqDmC3h78jucSdS4Lh/pT63G9Q3d/7S2s=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 2 Apr
 2021 16:25:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 16:25:48 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
To: Qu Huang <jinsdb@126.com>, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, airlied@redhat.com,
 ray.huang@amd.com, Mihir.Patel@amd.com, nirmoy.aiemd@gmail.com
References: <1617333527-89782-1-git-send-email-jinsdb@126.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
Date: Fri, 2 Apr 2021 18:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1617333527-89782-1-git-send-email-jinsdb@126.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:242f:cf66:3716:ed]
X-ClientProxiedBy: AM0PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:242f:cf66:3716:ed]
 (2a02:908:1252:fb60:242f:cf66:3716:ed) by
 AM0PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:208:d2::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Fri, 2 Apr 2021 16:25:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a23da487-dc06-42e1-841b-08d8f5f3f89e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4948F86CC937477C1DE5777D837A9@BL0PR12MB4948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fs+w+m0aauqOKaKlxTGYSADsD2yHvTzijtIMkwN5b43G5AHhcIbbPXaBW8AZ3H4bjnw4aDiWK1bUqTmQx+CH8oLv8FanmwmivCOUfPwByeEAPgCs8XbA/hKxHU2e5a5Ze6CFGFdxjJlENPLlS/lNGY0e1tl+OaVRfRvuv+3Mxscg9jecnLq7iTuq0hfGDWQWtmDzlNrz2npt0SIJDifn4SPZM1xT3fGNG82t7LVkgs0jQWqBbhtAmmGpQorHKl+F39lOUX0ZG1+CP4TBAml/L4zeJmUAwVxDuvYY/iwlOYXFPXfKJZkXWL80XnL0qsMk/aiemQK807WNFDtIgPoB6RLQQbkpvaF++SNxXY4yG0miAZcsOa0Vj3eyi/zfsHFqK3L4+1vK+r6HBGEJqW4/+np4ZOFLqh/hEvqbRjN4U90WNYee1by6hvwaTVSRnbQMD3Ugm+puyXoTDjYEPpF5F5SqT17DP+YBUftORJu3/2XTfvK18uHG8HzluFyBQkxTPpK2ytzZ9FSOz2HQoHm0re0osm65vADCBOAual8iaTAoaunKeUjJdoUVW1cxCibkcYQAkshl3Cc41DTfJKuiVmdSXTGuBrFyQKv2Py+IrefQDuhyy89D1TeikgL9CYeG+eDDEO2Y7RHjE4n/JD7pp1tK7ZlUDIv2WDQ3V+flJmlvfddVBOqfLh1eyH2fGJ1d+WxXyaIdRz/L0paiFM3yq0F/vOvGngJgrnLD3GmxG7vrvlLW5+ulhS4UJohBOXNh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(2906002)(186003)(38100700001)(8936002)(66476007)(66556008)(86362001)(36756003)(31696002)(31686004)(2616005)(5660300002)(52116002)(478600001)(6666004)(83380400001)(7416002)(16526019)(4326008)(8676002)(6486002)(316002)(66946007)(525324003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUs5SU4weXR3MzRrM3I0LzVDcWNhZHhtUXB3dHZwTW1CTnJNVUFtbXBrN2NE?=
 =?utf-8?B?YVBTSTVzYSs1NTlvNmZvQi80enVTZnlIdHhZQ1NxRkhLNnhWSGR5eVkwTGpJ?=
 =?utf-8?B?eGQ4K0FMdFZ5elBIOWVtaXpielJZbklQNmVtWmNqOGF6ZnU2aklNd2Y3S0E3?=
 =?utf-8?B?UkJSYVJLbkdxUU1mNDZjNjA5dkZwelRaRkhDNFpSbzZ3UERJcW90QTVGY0pa?=
 =?utf-8?B?ZGNyWXFRNEhVNFRFaTJlZ2xnV0s0clg3VXZ5d1BUYWhnaWEya200RGVLSWhm?=
 =?utf-8?B?dVFKelVrSHp3UjlxeXhUNHdLK2x0WjRYVXpNN0twditpUWZqajZHanNkaVNk?=
 =?utf-8?B?djFuUmlKQTF6SjM5ZGppRVF5SHI0dkxWdGt5OEVBMkZMRm5wYXhieFFoVHBs?=
 =?utf-8?B?Y0p4NHhRS3F3dm84THRMcVVhbElnTklwMFVZQ211amMraDBJNEhBQXl1VmVN?=
 =?utf-8?B?TCtPSTBJTTNxSFVlMkppUTBaWkVvTFFMbEVMNVB0NVp6ZWNrMWE4WEpTYnVh?=
 =?utf-8?B?ZjNMbGcxRjRFUE43dkFudCtMeDhDeUdZWEtlWnhTanpPdS8xWVdwRGxid2VJ?=
 =?utf-8?B?a3RYVDhjNzJURlBBT09FbkloL2d6MlN2NkQyWlc1REdRZzF5dlNlSHdCTHdK?=
 =?utf-8?B?QXFwS2x5N0ZhMUpuaDlZeHZmcVkrR2o5cXhRTmEzNkdHdUEyUlpGajZhWm41?=
 =?utf-8?B?U1VldGsxYm4yUU55WlBUTHhYaWRad096R0JZM1d3UGsyY0gzZmNvTTZXM3lF?=
 =?utf-8?B?VjIyTEZXY0xXRnVqSkVxWTM1QlhJdHBnOWg2bXNQaXBWT2ZFbW9zTUZoOTlO?=
 =?utf-8?B?RGdRRXkvdUxsVytRYWFYUGhOTHBGbXNMelFUOUliMTArV1VYYzJaSXVFbzlQ?=
 =?utf-8?B?TXhQUUZ2VkZ6Z2UySkRmOHBYSTdwaDA1TGFSTHkzWmhLeWRYTUVncHRsNmNJ?=
 =?utf-8?B?NWE1UWVXZWcyazJScmw0S3B5MWcxd2MwT2JmdGY4d08rVVlHeUQvbFZya1BW?=
 =?utf-8?B?dkhiWlU2UU8rZmxjOVdTL05yWGI0bXFRTklJa3ZNL0xEZmxTcUw0RzNkTnpS?=
 =?utf-8?B?THdRYXVYQ2I1Tk1KT1l6cUJpaFJnZ0FsNmU2S0tvdDQwU1FKRjcxYU1lWjdx?=
 =?utf-8?B?QTdIWUE2NmUrNjFxb01HN2lKQzAyTTBBMi9LVjNSVWp1ZVJ2N3E2K1NNNzhD?=
 =?utf-8?B?Q0pDVFgvQkFzWXhJOGpmU2luRmZ6OHlSQjVNWDljbjUrZXl5aXBXZkMyc0t1?=
 =?utf-8?B?TWdMWFg4WmloQzgwUWxnYlZwNEdoazV4ZTNnbUZpY1ZNSVF3SHRySTA1MGlB?=
 =?utf-8?B?ak90S0I4V09waEF0NkF2WlZ3MHd0V0Q2QzlCMGR3YXNNNlNDTnRrczdDLyt0?=
 =?utf-8?B?Q1dvZkIwdnRPTy92d2hJeEs2SlE2bW1Kc01TbC8rRjhzOHRWa1lTamZONlU3?=
 =?utf-8?B?ZDlmT2FXMkZwZmlGUndkc3JrN2ZIVERxalg2d1NlY0pyRmVZdFUxMGxoTWRr?=
 =?utf-8?B?aHZZV21lMWtNSG1YU012czBnSGtaUUdrb0FYNmwxbGJVZHZnR2lhSGw4VHRr?=
 =?utf-8?B?Zkd5d2pVMTR1Z3BEaHFOZnFCdUpJb3ZVZnpRakk4KzdOK2ZLSDJPem1ybERL?=
 =?utf-8?B?WlBxQ1AwaTdLbkE4clYwR3RZcXlLRndJdmtEYW5xMXNNUHA0c0xqU3hIZnlK?=
 =?utf-8?B?SGVZVkVpRzdSN0hBMFd3V1VFRlV0NjJLUUtLdm15c1lva2pEclFRWmhPYzg0?=
 =?utf-8?B?NlBsZnltZEt0c2pVb29MWkE5Z251cTBNVm0wYlo0Q09HTUxKMDBxK3FlYWVH?=
 =?utf-8?B?anpKOTJsVmRQVzE3Z1VsS3BiR2VGYlAwSlhZOSs5MmxXUXdwU1c4YnVCWktG?=
 =?utf-8?Q?Jo/27VCqyvvnc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23da487-dc06-42e1-841b-08d8f5f3f89e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 16:25:47.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLgE9m6eOn3lEGVXDOo4fB23sa/YdGEz+jTbFoe56JXNJ0OKulnxP1ZYHvYOKgNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qu,

Am 02.04.21 um 05:18 schrieb Qu Huang:
> Before dma_resv_lock(bo->base.resv, NULL) in amdgpu_bo_release_notify(),
> the bo->base.resv lock may be held by ttm_mem_evict_first(),

That can't happen since when bo_release_notify is called the BO has not 
more references and is therefore deleted.

And we never evict a deleted BO, we just wait for it to become idle.

Regards,
Christian.

> and the VRAM mem will be evicted, mem region was replaced
> by Gtt mem region. amdgpu_bo_release_notify() will then
> hold the bo->base.resv lock, and SDMA will get an invalid
> address in amdgpu_fill_buffer(), resulting in a VMFAULT
> or memory corruption.
>
> To avoid it, we have to hold bo->base.resv lock first, and
> check whether the mem.mem_type is TTM_PL_VRAM.
>
> Signed-off-by: Qu Huang <jinsdb@126.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 4b29b82..8018574 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1300,12 +1300,16 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	if (bo->base.resv == &bo->base._resv)
>   		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
>
> -	if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
> -	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
> +	if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>   		return;
>
>   	dma_resv_lock(bo->base.resv, NULL);
>
> +	if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node) {
> +		dma_resv_unlock(bo->base.resv);
> +		return;
> +	}
> +
>   	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
>   	if (!WARN_ON(r)) {
>   		amdgpu_bo_fence(abo, fence, false);
> --
> 1.8.3.1
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
