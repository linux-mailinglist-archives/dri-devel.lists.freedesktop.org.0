Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44875B9A5E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138110EB00;
	Thu, 15 Sep 2022 12:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4FE10EB00
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 12:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnS0nWOePm5hZUi1igPtKAUysgnjC984SB+x0htjhPWAIOJ4KseCC3VpGHZZTdWz8v2MNAxruUFfAdIxiDhq6EnaQgKnJpmuNBmExnBfNwdKg1UvjipERgLMPpjOpU3oXSFETSJBo9L+kX7wDn2ewqmXkjJlRIrFA8sgcCRU3sZl5OZ+0YyEA/jq34we8Z6FvWA9uHUD6n8EXjcziS3tmdQdo7yYXtpop7IG6rj+Aq3bCbal4HGAnZnj5vRRduJhh6StS6ZOOwEj8UtE1kLLLp8fhBm6G5uQan0OhwVxvaU5BGf0tvf2xDQkUm1+ypz4sQxVIEFGdvAJ9CO3bL5ywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKfNewo7p1swdCx9Uf3kkmyPujqvC0E6CyVu3eHDtrw=;
 b=RxOP+9FFw53qzS3twSRLLNhtBgjH6AQPCe9KjLhIbBfD37++qMeTgc4PjpuASO7foTJgJlSegVT4QOckUXHXizmdUB6ZyJJV40m3ZGN8+Xz2qHMZEWn02+OISKZidYehdS3q3y0nwZYhv1g+cOT1vy+yaTO9gttQEAv38MoSsnEWXUW0jEBZGPsimFpRYRABiTUjtyj1NONmDKEm36CKaTFJ/AnomhDolkiGGK5nizp3YCPa4A0xmRiBc3xySq9+4esImz0ApA4RW30eMGpxDYm6GINE6SwwYHygqZegep/+K1YGuD+HtC2TAvP6OFaI2VibHX+eyr+pP641bpyziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKfNewo7p1swdCx9Uf3kkmyPujqvC0E6CyVu3eHDtrw=;
 b=sIODtFjJMDj4UTykY2Dmhea4uXIGJF+ZuD9ViMTk0l5JFq9jCM1Um6l3gsVkSSJ5WXaHYx2oXKMA42fkMzqmvADRhE6udhomwxT78AWkQYoAtLy/B6uLS8zWfdsLPkumvaf3677hUhgEHtangd1DA6Lo/lETefhkFngMcdUaMfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 12:07:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 12:07:56 +0000
Message-ID: <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
Date: Thu, 15 Sep 2022 14:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/6] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220914164321.2156-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 9affd3a7-5bb2-497d-aac5-08da9712ec5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGH4/p8D/s30e9H18s4SJ6fqkmvJ49om/wYY7No08rjJdpo9gOmnJBQrTgN06z4TcRwtblHuL4aerToMc5uYtTWUEO3ZZMmYZS7bWcWlO3BV/VjTbBSorJ1lD64fE3GJC3l0XcH33BSjHp1pM4Ubp0rlHCO/WEZcZQE62T1kAmfzRFIV6ytxkuPBpoD73XAfEynD4NOlM8X1nvhXff5ncUUi+IPz7CDxTYQvSLl0c7pryKYszbzS+SlJArEwNerVyClE1CRPMzHdnvtu5e6ccQo/sG3ivL0C9/CRGnEtG9rf+hHndHzzU7FjWX0zdPBV2Uav7vdOUi9ij5yovjY8Y9qX5jfpXEcV86R/fwMl9tpcdrqnz7HrOkCdNC5rYDIvj1zyEjWijy2fa7x7bzA6/GQq0L5xiF53RkCyUbPnrFbrx5oAMBB32X5E5f692FUuy2MTTi7/pbe5eQeGo6crDCE7OeW/XuM2HUAYsPk/OkVSm7tOwN/clUnAJ6qF6Kysrd9OZSWEc9bDdhC8zTtIM+xZeBXAET/dR5cLx/M/qZmBvUk+G35UN9mW6cFioZCSidL5w6GNQ4B/5a83IeJdhQCvYq2mKSA6pahFurQlM7EW+v9kgtICoygxdozYnbYkT8Ig7DM82wy0wQAT614Zvub1caDxv8uuC04Ap/KpUgwLFwtwz7ks4b1Gt0wDEwv4AmEU5txDAuB1JGLD5SlX86C5MLGyWvlDEy3Kixt45x4hhjxdOUaC26n8Gv1zD1vjvnQxsSvmRRP8GMjh5i/fAmg3Txm9mNusr8dx2ZFp6SqD74PUMIac2cMsRRdDHhFj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(6512007)(26005)(6666004)(6506007)(41300700001)(36756003)(31686004)(38100700002)(8676002)(66556008)(66476007)(66946007)(921005)(31696002)(86362001)(316002)(478600001)(2616005)(83380400001)(6486002)(186003)(8936002)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNzV1JML0dLd0YvSEpobmFhSzBiL1VyZmdTREFoSFF5bjlUbGVCWS8yMUdJ?=
 =?utf-8?B?N2R1T25xUFlSNjR1UDVMZVZCZElYS0IyeWdqbGl6SVFVTGNUalNiVnBPcGxn?=
 =?utf-8?B?b29ydXVObmhORi9jSkZqK2IvRER3S2dhbUJTaFhMM0J4V3hZNloreDBhT04x?=
 =?utf-8?B?djNZY1Z4TFJROS9ubDFDYmJKQ3RqZnB0NEw4SjV6aSszYnlSYXdQRWUyalJT?=
 =?utf-8?B?NEtvT3k2WG1sdmFVNStrd2M1VkFkYStOUGlzOTRaaEl3MWNreElab0NxT0tl?=
 =?utf-8?B?WjRWU3A0bDVWRVdHdHk3Y1R5UlFGRGRTRUhidHdsbU9MZmdTT2ZiM1dnUE05?=
 =?utf-8?B?VEV4eFZ1cEk0T1VlekxFdUs3WTZBRVczUTN4VXZ0WitQWnRkano5NU1BL2sv?=
 =?utf-8?B?K2NSblZuKzkyY2xTRERvUkxKYjFJc1daeklFb1NFYml0MkhxdDkvRFRlZm5L?=
 =?utf-8?B?Ry9qY3ZFZlFDeGg3K3hkWXZOYmloR0RzSlByQnZKdUdmc3Y4aUlsY0lNcTY4?=
 =?utf-8?B?T2Nqc2tzUThOdE1xOFRMekFmSlltZFAvOGpnRDltR3EzK1BuZTkyeGErVVBn?=
 =?utf-8?B?UjBKVFdOTnFZZDVTdzNqZkMyTE1mM2hRZG54ZVc3WWxRbjcyQ0x5UlZzZ0xH?=
 =?utf-8?B?U00rV29EMHNpYVNITllrc0hXdlJzdExGZ0k5ZjFNSU5DdFo3VGZtTVlpTmtM?=
 =?utf-8?B?MU1wenJ6bFlGcWRuUE9kdnREZXlya3lqbkRBdVc2a0pTamV3UVQ3N3d0M3F5?=
 =?utf-8?B?bkQ1bzdDNGsxTnhKVjZjQlRVTVB6T2pJbmlsMWdQRmtlWEtTMFJuQ2x5b1ht?=
 =?utf-8?B?dnk3UURzQzJTUHlNOUVRME0rZHRzWitLV0J5aFAwVjNoVWZQTHZqN0Y0T1dw?=
 =?utf-8?B?elBjU2RpTm5Zejh1OXg0QTZrbFltODlnbmRXR1pyb2xuRG1nTE1Hc1ZQT2Qr?=
 =?utf-8?B?OUFzL256WUl5aFM3dW5kTnNKMEhad1VKTTZpZ0JQMHpua29TcXNEaDAvNG5o?=
 =?utf-8?B?d0FBc3BoR1JLRXZmMWxUSTlMdEpJQktTb0x0cHlmN1VwNmxFSzJwWlJiaCt6?=
 =?utf-8?B?am5kVzRFb1F0citnUnMwSERaK29VQ20yNkt2SWVKblBKcnlCaVVXSnptRExk?=
 =?utf-8?B?eW16cnBhengreFlhV2YxRWIyMFNqZDl6cXZYUnJUZGRLMHgrbk94azBKNWhF?=
 =?utf-8?B?Z3ZuZWZPdXowd21ESzJlUFZZUlJ4NVBVaWFCcVN4SkZxalZCTy9JYWFkU2di?=
 =?utf-8?B?VzdiRGNmOEJYMlZjOVNTL1A1cy82WU1odmJjKzc5dFQ5c01PQTdHUk5tSEtE?=
 =?utf-8?B?REhFS3I0NjVNUUZWR2J6UVJsWThKZUNKelVDbDBpNFd3VTVYVndCVkdEVEI1?=
 =?utf-8?B?S3BlZkdKaHkvSjlsOWk4SXlqSE1DNEM2KzlnMUQ4b1B1ZWpzQzdjTGdmcnpN?=
 =?utf-8?B?M0x6blJ2bDRYOVpiVWZkN1JVK0ovdDJGVysxQU9YUy9PVXNnMGhOOVZ1a3h4?=
 =?utf-8?B?dVFWSHJ0VFljU2xmbUtXamhrRFJsSWJPdGlaMEMzTUc3ejRyVVlDNE1UamhS?=
 =?utf-8?B?SzQwTVRkZGJPTU50Qk13dDJEazJxSG9vMWt1eUJnWnVWLzBWQmtTYVJ4dUJC?=
 =?utf-8?B?SDdUYTZxb2hzZzdsUDRlOG5xakVvWjZYUHkrU2pNN1BBOHpRTlY3S0FwcHF2?=
 =?utf-8?B?L2M5MzlJeXR5eEc4RFVFSWxTbW4wTFhKVUVLdnphcHdBK0Q4VEgzdUhKYzhC?=
 =?utf-8?B?M2xaUjJNalJ3MFVvZnMveFVTMUF2WWtLVncwbVNMZnJnRC9sSG9EbFQxQ1Ax?=
 =?utf-8?B?eFdNNjZ0QTk2ZU1HL05SL01TS2ZTbmxJNC9VMWh6YSs1S2l0cUpkeGRYSGtl?=
 =?utf-8?B?dE0rbjJDeEhidHZEdkJha0RlVS9waTZYQ3FTUWlrR3hHNXN2bXpvZUtpNjhi?=
 =?utf-8?B?bzJMM1RBVjVkOERGaFlDV3dkMG9mQm1xemFXZVlMQVNDNWNmWHB0dFJGVGxv?=
 =?utf-8?B?SGd0TXNBc2tHWjZHWi9MNG4xSWNOOTZQOTZjVWo4K3JSOXZFTUJ3V3FkNFJy?=
 =?utf-8?B?Ny9YWEZOSGhIcVZaU2NRVG5GWldXZ01sNHViNVNrbzJtRG1xcGFoWUErcWlY?=
 =?utf-8?Q?jZxZTgGmCsRQwVVL2QcN3pp/z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9affd3a7-5bb2-497d-aac5-08da9712ec5e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 12:07:55.9835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxFw5PZGRmFjhXHOmymmQ09FSSQri3+LhR5t/RygvO5NnntqHiTuWNVR+qrFQkVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599
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

Is that sufficient to allow running a desktop on amdgpu with the extra 
check enabled? If yes that would be quite a milestone.

What's left is checking the userspace IGT tests. Especially the 
sync_file and drm_syncobj tests I would expect to have problems with 
this extra check.

Thanks,
Christian.

Am 14.09.22 um 18:43 schrieb Arvind Yadav:
> Fence signaling must be enabled to make sure that
> the dma_fence_is_signaled() function ever returns true.
> Since drivers and implementations sometimes mess this up,
> this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
> is used during debugging.
> This should make any implementation bugs resulting in not
> signaled fences much more obvious.
>
> Arvind Yadav (6):
>    [PATCH v4 1/6] dma-buf: Remove the signaled bit status check
>    [PATCH v4 2/6] dma-buf: set signaling bit for the stub fence
>    [PATCH v4 3/6] dma-buf: Enable signaling on fence for selftests
>    [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
>    [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
>    [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on debug
>
>   drivers/dma-buf/Kconfig                |  7 +++++++
>   drivers/dma-buf/dma-fence.c            | 16 ++++++++++------
>   drivers/dma-buf/st-dma-fence-chain.c   |  4 ++++
>   drivers/dma-buf/st-dma-fence-unwrap.c  | 22 ++++++++++++++++++++++
>   drivers/dma-buf/st-dma-fence.c         | 16 ++++++++++++++++
>   drivers/dma-buf/st-dma-resv.c          | 10 ++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
>   include/linux/dma-fence.h              |  5 +++++
>   8 files changed, 76 insertions(+), 8 deletions(-)
>

