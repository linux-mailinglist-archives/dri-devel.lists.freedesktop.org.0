Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FA3E158A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B96EA3E;
	Thu,  5 Aug 2021 13:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2906EA3A;
 Thu,  5 Aug 2021 13:18:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqFxfK08CsoNTUegZpfI6l352G84ahLUq6gYnxjwKPaLE5ttSJmeKNigfq1BzGAzv+Y8+0tM5gZEc0Li/DHV2ZrYWcCyuyT0GaWruGtLCSlL0Z9ks6BIeGcjRho50J5lphbOh9ZYIU3olAusT+eKdkpw5QSpIdexhlNZh8FGMZGXYaSrFoHBdOy7+UOybeHYgiAhC+DhmXyhjKHkF1E8FwxShJ/oM5dtegBhDT8R8ZEmwHC+qnCN29TJmXJTxhPBKUyyFJnO11/qAviYR3zE662o0JR7SYL57L5aFbF/SlNhwZIFFC0BBF4jbAfsjsSS1m6U3rc1KF3Tu/nNCrfzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk0vAZ3wx3k70lfzfW6aKNkt5lxDa479wSXebv7yzQQ=;
 b=UCW0PfW+TI+cy+FhbKUfII6k9KkBudHjSeO+1OXqmJmh5+jVKNrZdhTqzeiSBnpWT/wb9ATdVlAFuYtv3BhkSRibFgfoBztZ93T+XMcCtihEojILo/H8tQAv4GUSVI0RtK+9BdjMUsLzLIBpOisNb2/w02QjsKJ06fgjrhAS+EkqVGgDRlASJV/hlz+j/rU60+mLoAxm4XatGDgeQ6C8n3ZNhEDoWJduwE1K/N0jWGT5607TQ158iZTb+8CxjRH1xiL7LQEYtoknwfrgaZlbpv1KN/eDq8bAJoZfRt7iD1Ot3rGVJdC6O3OGRZPZrHpIE2EZkSdkGtqFzsCSNkcwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk0vAZ3wx3k70lfzfW6aKNkt5lxDa479wSXebv7yzQQ=;
 b=PBXB0din0cGQJEHwzrnlbNDxjSqxhFJMnwyH0iKgrLIS0HUghHrX3yPg39JTlBSWFGRUeP2HALvo0pIaqKqw4is0uSx+vT2wlA0rttFoGYTxOO6VAIE5fI+zA0VL1LPYfZ9350+VVnyZj02ZmTFAdZfLh0rsBjyM11dSGdr2nIA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 13:18:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:18:20 +0000
Subject: Re: [PATCH v5 14/20] drm/sched: Don't store self-dependencies
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-15-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f883e6af-284c-9400-ca3d-b5192d11fb01@amd.com>
Date: Thu, 5 Aug 2021 15:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-15-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 13:18:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b251a676-7910-4849-35c6-08d958137e71
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422445672DF1C91FF5452A8683F29@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sepVQ8GIi43VateIFA9+5tw6zKEYMs1FMAR3Cs49D/kxffJJcwsAfHdlz8ZiY25qbex+CB4sbrtU5yGE9qudhmk54MsfWCbaTZNghAqm2xQgUws7l6mHl9o/z+PBKLO4rgN20Ap6JOwzJpPoqIV5JmJmz+EZ2s/9jGXCtnDon3dRHTfJnezxhExpdHBTP21W76/qzlPn91oFy9AoIakTeL7ICfcjDQ0gogBMbN5X2sX9XwtZueEm46PVe/4A+KZMbN9c21irIZ2Dy0zCC1ifavG6gUnVVqITn5AruJ5rLgujrh84vyGn60DraGMiid78oO6wuyuiXW2PezAnKrfaWGu3e9Jgj7dJquK6Xk7ujcrterf8jzAJto2ZSqn2WF6wtMS/axnbQ4xipM71TD2FZYc28V190sQGtiNeCkdg7hFjyiyZi4M2jc4SmNUVPhA4e53CceQNxjw+ju2gLQOEXGYCoWSjhN6PQz/1LZ2MgeNmd44kcwbSikbDteCqOfAGcH0mI6phb56Zrn3UYCSj/jpox1sdiRgg1plfShx5MK54aq08Ajhiq2krSFDwmyvHI9f0hqSxWqXjpFRrzhwZFIOHX8vI8kg5TyLCq2WEXbqQQSCCQabPWrDXQSU+dtrjy/8THaRGgHoLSX/060TE+0eoQt0KGyYDQ4pI0Xhp7qPyKorui83JLjnfsCwRPTlcTUBA4CAghPNExe4SS6JVlv3enuBMiczp8hazHlT+ohJBqIFPxhkLtpSLh7Omz7Pl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(83380400001)(54906003)(4326008)(8936002)(8676002)(186003)(36756003)(478600001)(5660300002)(316002)(86362001)(31686004)(2616005)(31696002)(38100700002)(2906002)(66556008)(66476007)(66574015)(66946007)(6486002)(6666004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snl2cjdaMG9zSVNHWEJCdEdCejFzZmlGWXR1OGt0bHF5d05HcWpsNUw3NlZS?=
 =?utf-8?B?QW80eUFXZ2k5YjVFcGEyVmk4V2tTRUN0MGw1N3ZUQmhMd1hWMlp3ZzFpVTA3?=
 =?utf-8?B?dnFnalNXNVVGS2MxVXVOUW1Da3lnUnd4Y1cybTFsVjcyZTREWWdUV1dMcWJr?=
 =?utf-8?B?T1kvdTlVNlk2M1lRTm5TZlhOVHBhRXo5SUphczNHWEFPYlJBNjR6UnUydUZL?=
 =?utf-8?B?TlViVEJYVGVJVHhFMGovVEs0YkVwbEorQ2E1MmVtbmZndHYwTGJFTVhsdGdH?=
 =?utf-8?B?eU1CN2czQmFTUzdTTHdUU1Bwak9PbmdFQk5nTWRUSm9tY2xKY2Fhb05qTnhV?=
 =?utf-8?B?aDRnTnpGbEdQOENQTks0MkRLcko4cEN5YWtXR1h5c3VGV0t5QzlvNWw0YVVI?=
 =?utf-8?B?bTlJRWk1MytaU01QZndtMTZVa0UxL2JEcGgzK0YzTWtiSXZYL0h0cWw0TWQx?=
 =?utf-8?B?M2UrQ2tpbm90Zms0em1wSEFWMmVQVUJXd2JocWtVK3p5MlkrZkZieHE4NE5K?=
 =?utf-8?B?ZmJUN1F6UTRHMEp3NUkxci9oNG5lRXd2dDVxeUFYRU93TVYwYXFoa1BLdnhn?=
 =?utf-8?B?QUtkRmU2TmZ1N2FvUEFUVVVIbGRjclI3SjRLRm1pNFFsakxTUlg4L0JiNUFQ?=
 =?utf-8?B?TUQ5L2R2eUJKN3NxMmd3aUJKRWpDY3ZvMzhYeWMwMFBMYmlLTlVaVmt6Smtx?=
 =?utf-8?B?QWd3amh4WE96bFpjcWVDR0dxaGNXU3drWkEyU09XblZFQmlSa1dyUy8zejl2?=
 =?utf-8?B?djFabVkyUlJmdCtNeG1aeDhQdFZYOVJ6SE5TM2JXeXJpQkkzYVNpZTBVK2hl?=
 =?utf-8?B?c2EwakxmOWo3R1l2UHcwbkY4VmhOcmd5QlRQT0ZyRk9IalU4RWs5Um1KbGxT?=
 =?utf-8?B?OTBLVFd6RTRpQlRZNFJGeS9wU3NuN29OR2dTNllBeS9IT25yQ1ZVdzBBL3pI?=
 =?utf-8?B?SFB5a3F2VHoyTE9oREN3WjRHRUhOMGc3dmZVZGVHMlNOSDhKazZGdXAvcjNa?=
 =?utf-8?B?Z1dKdFRNRGxoYWFaSGgwQngxQkFzbnpLR2Nzd1Bwa2h1WHRvQlZvL2U3czV0?=
 =?utf-8?B?WVlyNFJoZXYrVmZsQTQ5YlFDSGNpOHIrUFJNK2ZjUkQ2QUNvSHowOXRUNjhG?=
 =?utf-8?B?RzAzTHdvYmNqTFplMGMzbExRcGFQV1dEMG1XdmFONHpiTXdYbjdrZTdXTUlV?=
 =?utf-8?B?amdFK0dIS09XZ0tZaEl6VDZQOTRwZDAvOVNmeU5LTmpJY1NZb0pNOENzcFpl?=
 =?utf-8?B?STF6clY5bTZUYjhJVVF6eTlwUTYvenpxUnJKN2UwNjdnR3I0TXBaWFZCVE41?=
 =?utf-8?B?eVlKQWlETTZ0c1RiTFM5TmdsakpJUUdPZVVQTVpTaTRKd1ZnZ3huR1JWNkFh?=
 =?utf-8?B?QW5jRDI2Y2NZTWtGQXhKYm53WmpHdEZXelMybCtyR1hrcjd5VS9xZDdqMUk1?=
 =?utf-8?B?UnFJb0VTN2JwazAzTzJhNCs4NXUwWDdHWkxlWTVwREx0V2NPWDlhNzY4UWIv?=
 =?utf-8?B?NkJUNkMrVi9pNXZFd21FaHArTG9YM0NOY2JSbjh5Vy9SQlVqUzhrL1l4TExP?=
 =?utf-8?B?S2krYUVWNUUzd0VVMTEyd3dnekVsL0Q0MzIxVE5Oa3NlQ2hHcUV3YUJEZVRB?=
 =?utf-8?B?Zm1ZUHk4MWhJSlVwcWg1Mlk0VjVWY2EvN0tFcU5vendwckovRVdkNGh4M0t6?=
 =?utf-8?B?TGorUHB4TzNnQ0NSWVRTOVA2WUY1YTM3b1grMi85STIzczhFVXM3bnBrVUky?=
 =?utf-8?B?WElsZE1pYVhVZzlSbVVkSUNxN1pxY21qdUhsQ1lINC9VT2dURE1rTVk5Wjhx?=
 =?utf-8?B?aWcyTDZMVEkvUUdhM1NyTHBndFFFSlUrUkpvNW11QUtISm9DS1VKZXl2YTdX?=
 =?utf-8?Q?qQieVOTwI25y4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b251a676-7910-4849-35c6-08d958137e71
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:18:20.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKcKlNmawTmxYlwoGvQGzYlSfWfn6DQ0bfs1bjyg9On1CICUlJKXp1H6HdDHOGxK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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



Am 05.08.21 um 12:46 schrieb Daniel Vetter:
> This is essentially part of drm_sched_dependency_optimized(), which
> only amdgpu seems to make use of. Use it a bit more.
>
> This would mean that as-is amdgpu can't use the dependency helpers, at
> least not with the current approach amdgpu has for deciding whether a
> vm_flush is needed. Since amdgpu also has very special rules around
> implicit fencing it can't use those helpers either, and adding a
> drm_sched_job_await_fence_always or similar for amdgpu wouldn't be too
> onerous. That way the special case handling for amdgpu sticks even
> more out and we have higher chances that reviewers that go across all
> drivers wont miss it.

Well you should probably drop the sentence about the vm_flush, this is 
completely unrelated.

Additional to that I still don't think that this is a good idea. 
Dependency handling is something completely driver specific.

E.g. even when you have submitted jobs back to back they still might 
need a cache flush in between and that is not only for amdgpu like this.

What you can do is to optimize for while looking at the fences later on 
and then note that you have done so and what the last hw fence is you 
used instead.

Regards,
Christian.

>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f77456929139..49e507f91ec0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -660,6 +660,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   	if (!fence)
>   		return 0;
>   
> +	/* if it's a fence from us it's guaranteed to be earlier */
> +	if (fence->context == job->entity->fence_context ||
> +	    fence->context == job->entity->fence_context + 1) {
> +		dma_fence_put(fence);
> +		return 0;
> +	}
> +
>   	/* Deduplicate if we already depend on a fence from the same context.
>   	 * This lets the size of the array of deps scale with the number of
>   	 * engines involved, rather than the number of BOs.

