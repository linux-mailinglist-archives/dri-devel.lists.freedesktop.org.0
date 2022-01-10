Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92D48A3B2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174110E766;
	Mon, 10 Jan 2022 23:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D332B10E663;
 Mon, 10 Jan 2022 23:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db6QswtB/keIQ6w/L4IG5nz1RK1C8jKYjBLh8kqD2aj8HokHeb0Lmk4kwFBu1py+6N5emKRZ0/jcqqc3wJroGmtunond/S+UWPKrstIXeFQ/GlgI0UYWCVKuYsviArOXlIh7rH6DH5iSGJRjNmZBrlVBoEeE8KMomlp3/WEkIaKxABYAeB2x4ZlWRvw41ZMOMqQfXoMGwa8QQPK83OM6bv/ckX6kdtypNtkIizXJrXzOJJIjqsbIwOVbbpmDzhTzNZxe5oSwKwI8dTQorRRZcyDRzJg+PEuSW0n+X0+g9j/mFaP3xR/v01v8ceZNEFHJjdLxltu1epuT0LDzo4MHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ij3sODezHbIPrbU0/WEp5TqVkVVroaIywvWwZiRl9M=;
 b=QGyxA3KCNzYYYgudzN4hftqORvMGfeQE+PFZhJR6FPM4J2tn766TEKyhLHdT1LYwigqkwWcdm/3stSM0aqprze4jGC65kGrP06trwO6/txk9zkmUtMPqWZlWli5pTF1sauOjpDsPY0ZkAICTS6pz4wMtlumPLanE4XuhFPmkKox2b+U9TOY8HiuqTbJitoj/iCfzc7vu7wsYpk+bvg0LevVXPxIZ6EV7BeQ8qtdwU6+Aup+drb4g5Ce4785q4TOxlq9rj8rzPixQQ+l/PP8qwP3ByYol442tXyGoBQj5xFI/Atjqs9f3AAfc0XT1bWEdibhrN0sIMwqlc9pdS52Fkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ij3sODezHbIPrbU0/WEp5TqVkVVroaIywvWwZiRl9M=;
 b=ZBg5WzbtnSBqlufCEzIowN3fp9uxnPwFyoK6aGUf9gN1mgbeddq4TCNUgJxmZSZXliMF56/E02vAf1mPN2yBshPTYsxJ/M+uK6XVRDN+nn+icfAiCc5LjYXk9lKsGeIijRb8tF5G4XU1rzmkBv+qFqV4UvM1XeATS8wJdisTUko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5147.namprd12.prod.outlook.com (2603:10b6:408:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 23:32:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:32:36 +0000
Subject: Re: [Patch v4 13/24] drm/amdkfd: CRIU checkpoint and restore queue
 mqds
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-14-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <d4869780-ce7b-da1b-7dca-fdae841ea8a8@amd.com>
Date: Mon, 10 Jan 2022 18:32:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-14-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:610:60::36) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 210d4daf-fc81-4aaa-d4c7-08d9d4917bb7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5147:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB514777870BFF70FFC43984B092509@BN9PR12MB5147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePjeZzPlDxY/3uDnzde0NvLmdEzN9XkmpEroT9tkCIG/PZXK8FInxyUTrWBb/q/XDp5sI0Kj4ukoTLsUi1YWPqDScmBTDCOhi93dvrBi+pU/xNRZoZWpQ1YSDbxQ0Oo8m7n46WaVQ0h1JkkupBh39rNwDm/LUrtciqP8dwqjuogiPRrfErhtkqrIEfcKMqPoe7umNGW3Ggzz2yo82iMR3Bq+29mciINDb2z9Z6gKs92X83F1cyGk/C+/4UQKP79udMdupH65Z6haJ8/BDCkxUFo/jqnqRBGnHIMFnDyYaHDYlhgTYzPwbdCwQl+gpXYXqzQUUFCUyyHCCzrhZedA9lDYPaQs5bAW8WKg6vFwm55/MGxChXOTxR55rLKAUOdqm4INkXwIoJJ5zmNohFFwiEakwUvW95OeZ3Rr2dMq1GyhRSH2RlLRgF8gNUQyMw9KkSC8mxIgTm+b71KFNIkCZ8hoEpXBsafONLLLjTFdDIdIIyk4IvxRgbMn46p/QemjeAPPO/M1bvaxkKJiWolRe28t39WHXYKTwmhkyGPuia/pT8fdaRL2/BOChpTC935vFM9AHPgTPRSM6T40W/xY7op6/CGEjTFwWjy2iVfqFcp3TJd4/5jBtujgSA7SlcXvV5MQGU9Flq579/xM47VBrOQxI/n1HemiizrI990qwr6yT4pcil4oNHhUdppadcCBcwkSQjjwse8fiPJg5jdPZyD/28bjTNrBHxKLyLbQn3uKwdTgyJ2kJiw9ihcLY2ZAL7nCuP23pYAGD3JJjeoV5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(4326008)(31696002)(86362001)(2906002)(38100700002)(186003)(508600001)(26005)(6506007)(30864003)(36916002)(53546011)(4001150100001)(6512007)(44832011)(8936002)(66556008)(8676002)(66476007)(66946007)(31686004)(5660300002)(6486002)(316002)(36756003)(2616005)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01OZUoycEtqaG1IMkpWV3Q3YlNkcWFPc3VUbDlhVkxsSnY0bXdBSUJibXBY?=
 =?utf-8?B?dHpFcVRUR0JNd0RNUmdlKzZvR0JDR0hTZHp4RjlJbGw2QVFLdUlZYmhFQUhW?=
 =?utf-8?B?TEtielNYeC9rcGMzVDVkaUxERUQwT2dEV0c4c0tIdlFNNHN1T1lmdlBWVzc3?=
 =?utf-8?B?MGFIdkIySlBrSVhRbGxndEE4RmRNZ2xUMHlCSE53WkJXaGdrd3ZkR0doeGRS?=
 =?utf-8?B?cnJSc2lBbFVCK2lqNENHUS9kOHJtVzc5RE1YZVNYOFFrQkdKcVhUbFlzOG1m?=
 =?utf-8?B?YXdUcjJrUWNnamUyeGdZbFU0alFsSi9CdUNvNjFRMmtzMTB4Z3dOOGdKbFpI?=
 =?utf-8?B?bHN1aWM0dVhaV2lhclNiYXhNRkc2UC8wU2xwbUNwL3FGS0JnWm5jVzltZlRE?=
 =?utf-8?B?M0pjc1RFeW9aQ1NRbU84TEFWMi9WWFFLOHJtZDc3ckVhZUtKZFgxSHVGcXFH?=
 =?utf-8?B?cjh0cUNtamJ0SWt3NlpwSWJwaUlmZjJnSXZoNXplbyt4bjgrRDYzWVA2TDVX?=
 =?utf-8?B?Ym5FNEsrNm5NYS9naVVYNzdUaDRuMkppU2Fqamg2ekg3ZVg5dnFTNWpLM3h2?=
 =?utf-8?B?TXIvNTVQazd5SXFqOHk3aitTMFQ1Z1ppclpGTDBJV2I4Z2dvbXhRbmhkR3A3?=
 =?utf-8?B?NkhBdWJQakNFZnc4MCttaWxzTDFkb2Jpczc5UkxBSzE0d0FGMHNmRGJHazk3?=
 =?utf-8?B?bkc3N3ZSMUlVQXhET05mZjgzVXRDU2E4SjU1RzVPQUhubXBWZ2ZSZkZ0Y2N6?=
 =?utf-8?B?R0c4L2N2MnVjOEYyR3lGWGhuWkkyVnFCKy9yRVQ1UHIxR28zVHpQWkxJWXky?=
 =?utf-8?B?MnZNZmpBZEIrNFpzOEVEN1JoT2J4MXErL2JkVkNXRWZMQ1M1WThuR3NVemJm?=
 =?utf-8?B?TDdwU2Y0RllCTUtwVVo1YmN5cEFQTGdrMkJsWFRFdVQ3cVBjQzF5ZUlicW9o?=
 =?utf-8?B?TWtNVTdUTHpaZzIxWkptYUlpTzhCcUxzdWxMYnlXSFd6QXhsUmltOVFkVHhz?=
 =?utf-8?B?Y3daWmpzVWtCRURLRzhXNlFxYTVuRTJhZStlaElMc2pNcjBJRlhQbFJ3QktD?=
 =?utf-8?B?T3NrWGJOcURxcVpxd2paLzAwODhMVGxYZndNT2s3bW9CajNYbHIxR3IrYnNk?=
 =?utf-8?B?RlVzM1M5L2ZLblZYa2Uzak1qTGZlb1pYK3djNGVmQjd2U0NkTW93TS9aUFdn?=
 =?utf-8?B?ZnVuY0hZSEx6WmU3N1ZEd0xMWFJYaUllYzlDd2RyUFltbHJrektMY0prbkZE?=
 =?utf-8?B?b25RSWQzMUVyV3VacFBuUEtmSFJyM1dMUCtyR3RGY2JrNWY0Y2tJR2JsNmNW?=
 =?utf-8?B?dFpLcFZqa1BrN1o3K2Vlbi9ncjRHTjZ1OU0yUC9yZUZhdXBpb2pKTitLN2Zp?=
 =?utf-8?B?TVBncGM1SUswVlhGVEZ0ZTVZVXRmQlRvODRNeHFGOElqYlIxdk5ScDlvaElX?=
 =?utf-8?B?eFBIWVdUUUdDSy9SZXArSmQ1ZnEyNkF0VUNudnErS2xTWVpLbEVKOCtoNHMy?=
 =?utf-8?B?REZ1WWo4d3hKa01JUmpPbm1PS1dJdzN0M0IyU1RWTTV1UnAzOFNBUnB4bHZt?=
 =?utf-8?B?dXNlN2dFbHdJMzR0REN1czQwbFpncWtQa21VTnBMUWtnSEZxL1VtalI0eHEz?=
 =?utf-8?B?Vnd3YlhHNm83eTlmK1MycmdzSm9lQlNSellzUFZFbGMyOFZxRGdYbWVrYkho?=
 =?utf-8?B?SkpqZTJaNTVEbE9wUFgwY3daUnNtNmFSVFljZWhNZ1pkTHJvNkwwYTQzYkdF?=
 =?utf-8?B?TnJUTWQ0NHg4VFh3TkFrWVZTVHEwTEthT1RmOW00TlVlbG9IdU1TNTdWWStC?=
 =?utf-8?B?WVZQVWdVZGhBbW9tN05Na1NvWHFxOHZIVEE5OEJGTDJweDh3SHFrVmUvYUZq?=
 =?utf-8?B?SWRQd0tXaC9XQTBIOFlRWTBJZVZQVnBWQ0gvUDJRNDh0b2tLaVBNcGxwU2pl?=
 =?utf-8?B?aVNsTHNkZmlLMWhCTU8xSGdUZi9FYXY4TTRBaDBvQ0hodDliQmNZNzRLU09x?=
 =?utf-8?B?dFFnU1lzcUFWNGpHWWxEdU8ydGRzSHUrVGJSYlF0OVpBamVBNnpteGpGbVA2?=
 =?utf-8?B?b0prUC8yQ1NRbHg1cjFzNlZoN09PLytEY29HNW5nR3JiaDlCb1QxaDRzcWw4?=
 =?utf-8?B?SUdrcHYvcFpQL2hKVngySnVXZjAvbVllMzM3ZlEwQnZCcUlPc0NZYXdSQ09r?=
 =?utf-8?Q?2LdYoLGs8EvJv8lkXtC9piA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210d4daf-fc81-4aaa-d4c7-08d9d4917bb7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:32:36.2345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzmZQ7c6486FogZ71AptWe59pTszuUmZcCItRAs2Z5uLXeKwaaX5Fy8D9Qk6bLYBwipqEp30OUSYOLAMaTWu2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5147
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
> From: David Yat Sin <david.yatsin@amd.com>
>
> Checkpoint contents of queue MQD's on CRIU dump and restore them during
> CRIU restore.
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>

David has an update for this patch to fix up the doorbell offset in the 
restored SDMA MQD.

Regards,
   Felix


>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |   2 +-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c |  72 +++++++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  14 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   7 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  67 ++++++++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  68 ++++++++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  68 ++++++++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  69 ++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +
>   .../amd/amdkfd/kfd_process_queue_manager.c    | 158 ++++++++++++++++--
>   11 files changed, 506 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 3fb155f756fd..146879cd3f2b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -312,7 +312,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
>   			p->pasid,
>   			dev->id);
>   
> -	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL,
> +	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL,
>   			&doorbell_offset_in_process);
>   	if (err != 0)
>   		goto err_create_queue;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> index 0c50e67e2b51..3a5303ebcabf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> @@ -185,7 +185,7 @@ static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
>   	properties.type = KFD_QUEUE_TYPE_DIQ;
>   
>   	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
> -				&properties, &qid, NULL, NULL);
> +				&properties, &qid, NULL, NULL, NULL);
>   
>   	if (status) {
>   		pr_err("Failed to create DIQ\n");
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index a0f5b8533a03..a92274f9f1f7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -331,7 +331,8 @@ static void deallocate_vmid(struct device_queue_manager *dqm,
>   static int create_queue_nocpsch(struct device_queue_manager *dqm,
>   				struct queue *q,
>   				struct qcm_process_device *qpd,
> -				const struct kfd_criu_queue_priv_data *qd)
> +				const struct kfd_criu_queue_priv_data *qd,
> +				const void *restore_mqd)
>   {
>   	struct mqd_manager *mqd_mgr;
>   	int retval;
> @@ -390,8 +391,14 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
>   		retval = -ENOMEM;
>   		goto out_deallocate_doorbell;
>   	}
> -	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
> -				&q->gart_mqd_addr, &q->properties);
> +
> +	if (qd)
> +		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
> +				     &q->properties, restore_mqd);
> +	else
> +		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
> +					&q->gart_mqd_addr, &q->properties);
> +
>   	if (q->properties.is_active) {
>   		if (!dqm->sched_running) {
>   			WARN_ONCE(1, "Load non-HWS mqd while stopped\n");
> @@ -1339,7 +1346,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
>   
>   static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
>   			struct qcm_process_device *qpd,
> -			const struct kfd_criu_queue_priv_data *qd)
> +			const struct kfd_criu_queue_priv_data *qd,
> +			const void *restore_mqd)
>   {
>   	int retval;
>   	struct mqd_manager *mqd_mgr;
> @@ -1385,8 +1393,12 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
>   	 * updates the is_evicted flag but is a no-op otherwise.
>   	 */
>   	q->properties.is_evicted = !!qpd->evicted;
> -	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
> -				&q->gart_mqd_addr, &q->properties);
> +	if (qd)
> +		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
> +				     &q->properties, restore_mqd);
> +	else
> +		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
> +					&q->gart_mqd_addr, &q->properties);
>   
>   	list_add(&q->list, &qpd->queues_list);
>   	qpd->queue_count++;
> @@ -1774,6 +1786,50 @@ static int get_wave_state(struct device_queue_manager *dqm,
>   			ctl_stack_used_size, save_area_used_size);
>   }
>   
> +static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
> +			const struct queue *q,
> +			u32 *mqd_size)
> +{
> +	struct mqd_manager *mqd_mgr;
> +	enum KFD_MQD_TYPE mqd_type =
> +			get_mqd_type_from_queue_type(q->properties.type);
> +
> +	dqm_lock(dqm);
> +	mqd_mgr = dqm->mqd_mgrs[mqd_type];
> +	*mqd_size = mqd_mgr->mqd_size;
> +
> +	dqm_unlock(dqm);
> +}
> +
> +static int checkpoint_mqd(struct device_queue_manager *dqm,
> +			  const struct queue *q,
> +			  void *mqd)
> +{
> +	struct mqd_manager *mqd_mgr;
> +	int r = 0;
> +	enum KFD_MQD_TYPE mqd_type =
> +			get_mqd_type_from_queue_type(q->properties.type);
> +
> +	dqm_lock(dqm);
> +
> +	if (q->properties.is_active || !q->device->cwsr_enabled) {
> +		r = -EINVAL;
> +		goto dqm_unlock;
> +	}
> +
> +	mqd_mgr = dqm->mqd_mgrs[mqd_type];
> +	if (!mqd_mgr->checkpoint_mqd) {
> +		r = -EOPNOTSUPP;
> +		goto dqm_unlock;
> +	}
> +
> +	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd);
> +
> +dqm_unlock:
> +	dqm_unlock(dqm);
> +	return r;
> +}
> +
>   static int process_termination_cpsch(struct device_queue_manager *dqm,
>   		struct qcm_process_device *qpd)
>   {
> @@ -1950,6 +2006,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
>   		dqm->ops.evict_process_queues = evict_process_queues_cpsch;
>   		dqm->ops.restore_process_queues = restore_process_queues_cpsch;
>   		dqm->ops.get_wave_state = get_wave_state;
> +		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
> +		dqm->ops.checkpoint_mqd = checkpoint_mqd;
>   		break;
>   	case KFD_SCHED_POLICY_NO_HWS:
>   		/* initialize dqm for no cp scheduling */
> @@ -1969,6 +2027,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
>   		dqm->ops.restore_process_queues =
>   			restore_process_queues_nocpsch;
>   		dqm->ops.get_wave_state = get_wave_state;
> +		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
> +		dqm->ops.checkpoint_mqd = checkpoint_mqd;
>   		break;
>   	default:
>   		pr_err("Invalid scheduling policy %d\n", dqm->sched_policy);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index 6fa43215e3e2..ebd7d4d3772b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -81,13 +81,18 @@ struct device_process_node {
>    *
>    * @get_wave_state: Retrieves context save state and optionally copies the
>    * control stack, if kept in the MQD, to the given userspace address.
> + *
> + * @get_queue_checkpoint_info: Retrieves queue size information for CRIU checkpoint.
> + *
> + * @checkpoint_mqd: checkpoint queue MQD contents for CRIU.
>    */
>   
>   struct device_queue_manager_ops {
>   	int	(*create_queue)(struct device_queue_manager *dqm,
>   				struct queue *q,
>   				struct qcm_process_device *qpd,
> -				const struct kfd_criu_queue_priv_data *qd);
> +				const struct kfd_criu_queue_priv_data *qd,
> +				const void *restore_mqd);
>   
>   	int	(*destroy_queue)(struct device_queue_manager *dqm,
>   				struct qcm_process_device *qpd,
> @@ -135,6 +140,13 @@ struct device_queue_manager_ops {
>   				  void __user *ctl_stack,
>   				  u32 *ctl_stack_used_size,
>   				  u32 *save_area_used_size);
> +
> +	void	(*get_queue_checkpoint_info)(struct device_queue_manager *dqm,
> +				  const struct queue *q, u32 *mqd_size);
> +
> +	int	(*checkpoint_mqd)(struct device_queue_manager *dqm,
> +				  const struct queue *q,
> +				  void *mqd);
>   };
>   
>   struct device_queue_manager_asic_ops {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
> index 965e17c5dbb4..cebb2877a505 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
> @@ -100,6 +100,13 @@ struct mqd_manager {
>   				  u32 *ctl_stack_used_size,
>   				  u32 *save_area_used_size);
>   
> +	void	(*checkpoint_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst);
> +
> +	void	(*restore_mqd)(struct mqd_manager *mm, void **mqd,
> +				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +				struct queue_properties *p,
> +				const void *mqd_src);
> +
>   #if defined(CONFIG_DEBUG_FS)
>   	int	(*debugfs_show_mqd)(struct seq_file *m, void *data);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> index e9a8e21e144e..dee90e72f672 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> @@ -280,6 +280,69 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
>   					pipe_id, queue_id);
>   }
>   
> +static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct cik_mqd *m;
> +
> +	m = get_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct cik_mqd));
> +}
> +
> +static void restore_mqd(struct mqd_manager *mm, void **mqd,
> +			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			struct queue_properties *qp,
> +			const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct cik_mqd *m;
> +
> +	m = (struct cik_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	m->cp_hqd_pq_doorbell_control = DOORBELL_OFFSET(qp->doorbell_off);
> +
> +	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
> +			m->cp_hqd_pq_doorbell_control);
> +
> +	qp->is_active = 0;
> +}
> +
> +static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct cik_sdma_rlc_registers *m;
> +
> +	m = get_sdma_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct cik_sdma_rlc_registers));
> +}
> +
> +static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
> +				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +				struct queue_properties *qp,
> +				const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct cik_sdma_rlc_registers *m;
> +
> +	m = (struct cik_sdma_rlc_registers *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	qp->is_active = 0;
> +}
> +
>   /*
>    * preempt type here is ignored because there is only one way
>    * to preempt sdma queue
> @@ -394,6 +457,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
>   		mqd->update_mqd = update_mqd;
>   		mqd->destroy_mqd = destroy_mqd;
>   		mqd->is_occupied = is_occupied;
> +		mqd->checkpoint_mqd = checkpoint_mqd;
> +		mqd->restore_mqd = restore_mqd;
>   		mqd->mqd_size = sizeof(struct cik_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd;
> @@ -434,6 +499,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
>   		mqd->update_mqd = update_mqd_sdma;
>   		mqd->destroy_mqd = destroy_mqd_sdma;
>   		mqd->is_occupied = is_occupied_sdma;
> +		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
> +		mqd->restore_mqd = restore_mqd_sdma;
>   		mqd->mqd_size = sizeof(struct cik_sdma_rlc_registers);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index d74d8a6ac27a..36109547494e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -285,6 +285,41 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	return 0;
>   }
>   
> +static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct v10_compute_mqd *m;
> +
> +	m = get_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct v10_compute_mqd));
> +}
> +
> +static void restore_mqd(struct mqd_manager *mm, void **mqd,
> +			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			struct queue_properties *qp,
> +			const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct v10_compute_mqd *m;
> +
> +	m = (struct v10_compute_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	m->cp_hqd_pq_doorbell_control =
> +		qp->doorbell_off <<
> +			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
> +	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
> +			m->cp_hqd_pq_doorbell_control);
> +
> +	qp->is_active = 0;
> +}
> +
>   static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
>   			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
>   			struct queue_properties *q)
> @@ -373,6 +408,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
>   	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
>   }
>   
> +static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct v10_sdma_mqd *m;
> +
> +	m = get_sdma_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct v10_sdma_mqd));
> +}
> +
> +static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
> +			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			     struct queue_properties *qp,
> +			     const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct v10_sdma_mqd *m;
> +
> +	m = (struct v10_sdma_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	qp->is_active = 0;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static int debugfs_show_mqd(struct seq_file *m, void *data)
> @@ -417,6 +481,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
>   		mqd->is_occupied = is_occupied;
>   		mqd->mqd_size = sizeof(struct v10_compute_mqd);
>   		mqd->get_wave_state = get_wave_state;
> +		mqd->checkpoint_mqd = checkpoint_mqd;
> +		mqd->restore_mqd = restore_mqd;
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd;
>   #endif
> @@ -460,6 +526,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
>   		mqd->update_mqd = update_mqd_sdma;
>   		mqd->destroy_mqd = destroy_mqd_sdma;
>   		mqd->is_occupied = is_occupied_sdma;
> +		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
> +		mqd->restore_mqd = restore_mqd_sdma;
>   		mqd->mqd_size = sizeof(struct v10_sdma_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 326eb2285029..86ded61fbdeb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -340,6 +340,41 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	return 0;
>   }
>   
> +static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct v9_mqd *m;
> +
> +	m = get_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct v9_mqd));
> +}
> +
> +static void restore_mqd(struct mqd_manager *mm, void **mqd,
> +			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			struct queue_properties *qp,
> +			const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct v9_mqd *m;
> +
> +	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	m->cp_hqd_pq_doorbell_control =
> +		qp->doorbell_off <<
> +			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
> +	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
> +				m->cp_hqd_pq_doorbell_control);
> +
> +	qp->is_active = 0;
> +}
> +
>   static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
>   			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
>   			struct queue_properties *q)
> @@ -428,6 +463,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
>   	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
>   }
>   
> +static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct v9_sdma_mqd *m;
> +
> +	m = get_sdma_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct v9_sdma_mqd));
> +}
> +
> +static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
> +			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			     struct queue_properties *qp,
> +			     const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct v9_sdma_mqd *m;
> +
> +	m = (struct v9_sdma_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	qp->is_active = 0;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static int debugfs_show_mqd(struct seq_file *m, void *data)
> @@ -470,6 +534,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
>   		mqd->destroy_mqd = destroy_mqd;
>   		mqd->is_occupied = is_occupied;
>   		mqd->get_wave_state = get_wave_state;
> +		mqd->checkpoint_mqd = checkpoint_mqd;
> +		mqd->restore_mqd = restore_mqd;
>   		mqd->mqd_size = sizeof(struct v9_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd;
> @@ -510,6 +576,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
>   		mqd->update_mqd = update_mqd_sdma;
>   		mqd->destroy_mqd = destroy_mqd_sdma;
>   		mqd->is_occupied = is_occupied_sdma;
> +		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
> +		mqd->restore_mqd = restore_mqd_sdma;
>   		mqd->mqd_size = sizeof(struct v9_sdma_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> index d456e950ce1d..e0204392c6dc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> @@ -306,6 +306,42 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	return 0;
>   }
>   
> +static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct vi_mqd *m;
> +
> +	m = get_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct vi_mqd));
> +}
> +
> +static void restore_mqd(struct mqd_manager *mm, void **mqd,
> +			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			struct queue_properties *qp,
> +			const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct vi_mqd *m;
> +
> +	m = (struct vi_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	m->cp_hqd_pq_doorbell_control =
> +		qp->doorbell_off <<
> +			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
> +	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
> +			m->cp_hqd_pq_doorbell_control);
> +
> +	qp->is_active = 0;
> +}
> +
> +
>   static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
>   			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
>   			struct queue_properties *q)
> @@ -399,6 +435,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
>   	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
>   }
>   
> +static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
> +{
> +	struct vi_sdma_mqd *m;
> +
> +	m = get_sdma_mqd(mqd);
> +
> +	memcpy(mqd_dst, m, sizeof(struct vi_sdma_mqd));
> +}
> +
> +static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
> +			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
> +			     struct queue_properties *qp,
> +			     const void *mqd_src)
> +{
> +	uint64_t addr;
> +	struct vi_sdma_mqd *m;
> +
> +	m = (struct vi_sdma_mqd *) mqd_mem_obj->cpu_ptr;
> +	addr = mqd_mem_obj->gpu_addr;
> +
> +	memcpy(m, mqd_src, sizeof(*m));
> +
> +	*mqd = m;
> +	if (gart_addr)
> +		*gart_addr = addr;
> +
> +	qp->is_active = 0;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static int debugfs_show_mqd(struct seq_file *m, void *data)
> @@ -441,6 +506,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
>   		mqd->destroy_mqd = destroy_mqd;
>   		mqd->is_occupied = is_occupied;
>   		mqd->get_wave_state = get_wave_state;
> +		mqd->checkpoint_mqd = checkpoint_mqd;
> +		mqd->restore_mqd = restore_mqd;
>   		mqd->mqd_size = sizeof(struct vi_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd;
> @@ -481,6 +548,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
>   		mqd->update_mqd = update_mqd_sdma;
>   		mqd->destroy_mqd = destroy_mqd_sdma;
>   		mqd->is_occupied = is_occupied_sdma;
> +		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
> +		mqd->restore_mqd = restore_mqd_sdma;
>   		mqd->mqd_size = sizeof(struct vi_sdma_mqd);
>   #if defined(CONFIG_DEBUG_FS)
>   		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 8272bd5c4600..9a381494eb67 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1158,6 +1158,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   			    struct queue_properties *properties,
>   			    unsigned int *qid,
>   			    const struct kfd_criu_queue_priv_data *q_data,
> +			    const void *restore_mqd,
>   			    uint32_t *p_doorbell_offset_in_process);
>   int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
>   int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
> @@ -1180,6 +1181,10 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
>   			      uint64_t fence_value,
>   			      unsigned int timeout_ms);
>   
> +int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
> +				  unsigned int qid,
> +				  u32 *mqd_size);
> +
>   /* Packet Manager */
>   
>   #define KFD_FENCE_COMPLETED (100)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 25cf97d97d87..97e794d6bb76 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -209,6 +209,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   			    struct queue_properties *properties,
>   			    unsigned int *qid,
>   			    const struct kfd_criu_queue_priv_data *q_data,
> +			    const void *restore_mqd,
>   			    uint32_t *p_doorbell_offset_in_process)
>   {
>   	int retval;
> @@ -273,7 +274,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   			goto err_create_queue;
>   		pqn->q = q;
>   		pqn->kq = NULL;
> -		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
> +		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
>   		print_queue(q);
>   		break;
>   
> @@ -293,7 +294,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   			goto err_create_queue;
>   		pqn->q = q;
>   		pqn->kq = NULL;
> -		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
> +		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
>   		print_queue(q);
>   		break;
>   	case KFD_QUEUE_TYPE_DIQ:
> @@ -518,12 +519,26 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
>   						       save_area_used_size);
>   }
>   
> +
> +static int get_queue_data_sizes(struct kfd_process_device *pdd, struct queue *q, uint32_t *mqd_size)
> +{
> +	int ret;
> +
> +	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
> +	if (ret)
> +		pr_err("Failed to get queue dump info (%d)\n", ret);
> +
> +	return ret;
> +}
> +
>   int kfd_process_get_queue_info(struct kfd_process *p,
>   			       uint32_t *num_queues,
>   			       uint64_t *priv_data_sizes)
>   {
> +	uint32_t extra_data_sizes = 0;
>   	struct queue *q;
>   	int i;
> +	int ret;
>   
>   	*num_queues = 0;
>   
> @@ -535,23 +550,53 @@ int kfd_process_get_queue_info(struct kfd_process *p,
>   			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
>   				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
>   				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
> -
> +				uint32_t mqd_size;
>   				*num_queues = *num_queues + 1;
> +
> +				ret = get_queue_data_sizes(pdd, q, &mqd_size);
> +				if (ret)
> +					return ret;
> +
> +				extra_data_sizes += mqd_size;
>   			} else {
>   				pr_err("Unsupported queue type (%d)\n", q->properties.type);
>   				return -EOPNOTSUPP;
>   			}
>   		}
>   	}
> -	*priv_data_sizes = *num_queues * sizeof(struct kfd_criu_queue_priv_data);
> +	*priv_data_sizes = extra_data_sizes +
> +				(*num_queues * sizeof(struct kfd_criu_queue_priv_data));
>   
>   	return 0;
>   }
>   
> -static void criu_checkpoint_queue(struct kfd_process_device *pdd,
> +static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qid, void *mqd)
> +{
> +	struct process_queue_node *pqn;
> +
> +	pqn = get_queue_by_qid(pqm, qid);
> +	if (!pqn) {
> +		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
> +		return -EFAULT;
> +	}
> +
> +	if (!pqn->q->device->dqm->ops.checkpoint_mqd) {
> +		pr_err("amdkfd: queue dumping not supported on this device\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm, pqn->q, mqd);
> +}
> +
> +static int criu_checkpoint_queue(struct kfd_process_device *pdd,
>   			   struct queue *q,
>   			   struct kfd_criu_queue_priv_data *q_data)
>   {
> +	uint8_t *mqd;
> +	int ret;
> +
> +	mqd = (void *)(q_data + 1);
> +
>   	q_data->gpu_id = pdd->dev->id;
>   	q_data->type = q->properties.type;
>   	q_data->format = q->properties.format;
> @@ -577,7 +622,14 @@ static void criu_checkpoint_queue(struct kfd_process_device *pdd,
>   	q_data->ctx_save_restore_area_size =
>   		q->properties.ctx_save_restore_area_size;
>   
> +	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd);
> +	if (ret) {
> +		pr_err("Failed checkpoint queue_mqd (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	pr_debug("Dumping Queue: gpu_id:%x queue_id:%u\n", q_data->gpu_id, q_data->q_id);
> +	return ret;
>   }
>   
>   static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
> @@ -585,15 +637,16 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
>   				   unsigned int *q_index,
>   				   uint64_t *queues_priv_data_offset)
>   {
> -	struct kfd_criu_queue_priv_data *q_data;
> +	unsigned int q_private_data_size = 0;
> +	uint8_t *q_private_data = NULL; /* Local buffer to store individual queue private data */
>   	struct queue *q;
>   	int ret = 0;
>   
> -	q_data = kzalloc(sizeof(*q_data), GFP_KERNEL);
> -	if (!q_data)
> -		return -ENOMEM;
> -
>   	list_for_each_entry(q, &pdd->qpd.queues_list, list) {
> +		struct kfd_criu_queue_priv_data *q_data;
> +		uint64_t q_data_size;
> +		uint32_t mqd_size;
> +
>   		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
>   			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
>   			q->properties.type != KFD_QUEUE_TYPE_SDMA_XGMI) {
> @@ -602,19 +655,46 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
>   			return -EOPNOTSUPP;
>   		}
>   
> -		criu_checkpoint_queue(pdd, q, q_data);
> +		ret = get_queue_data_sizes(pdd, q, &mqd_size);
> +		if (ret)
> +			break;
> +
> +		q_data_size = sizeof(*q_data) + mqd_size;
> +
> +		/* Increase local buffer space if needed */
> +		if (q_private_data_size < q_data_size) {
> +			kfree(q_private_data);
> +
> +			q_private_data = kzalloc(q_data_size, GFP_KERNEL);
> +			if (!q_private_data) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +			q_private_data_size = q_data_size;
> +		}
> +
> +		q_data = (struct kfd_criu_queue_priv_data *)q_private_data;
> +
> +		/* data stored in this order: priv_data, mqd */
> +		q_data->mqd_size = mqd_size;
> +
> +		ret = criu_checkpoint_queue(pdd, q, q_data);
> +		if (ret)
> +			break;
> +
>   		q_data->object_type = KFD_CRIU_OBJECT_TYPE_QUEUE;
>   
> -		ret = copy_to_user(user_priv + *queues_priv_data_offset, q_data, sizeof(*q_data));
> +		ret = copy_to_user(user_priv + *queues_priv_data_offset,
> +				q_data, q_data_size);
>   		if (ret) {
>   			ret = -EFAULT;
>   			break;
>   		}
> -		*queues_priv_data_offset += sizeof(*q_data);
> +		*queues_priv_data_offset += q_data_size;
>   		*q_index = *q_index + 1;
>   	}
>   
> -	kfree(q_data);
> +	kfree(q_private_data);
>   
>   	return ret;
>   }
> @@ -671,11 +751,12 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   			   uint64_t max_priv_data_size)
>   {
>   	struct kfd_criu_queue_priv_data *q_data;
> +	uint8_t *mqd, *q_extra_data = NULL;
>   	struct kfd_process_device *pdd;
> -	struct kfd_dev *dev;
> +	uint64_t q_extra_data_size;
>   	struct queue_properties qp;
>   	unsigned int queue_id;
> -
> +	struct kfd_dev *dev;
>   	int ret = 0;
>   
>   	if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
> @@ -692,6 +773,26 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   	}
>   
>   	*priv_data_offset += sizeof(*q_data);
> +	q_extra_data_size = q_data->mqd_size;
> +
> +	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	q_extra_data = kmalloc(q_extra_data_size, GFP_KERNEL);
> +	if (!q_extra_data) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	ret = copy_from_user(q_extra_data, user_priv_ptr + *priv_data_offset, q_extra_data_size);
> +	if (ret) {
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +
> +	*priv_data_offset += q_extra_data_size;
>   
>   	dev = kfd_device_by_id(q_data->gpu_id);
>   	if (!dev) {
> @@ -708,6 +809,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   		ret = -EFAULT;
>   		return ret;
>   	}
> +	/* data stored in this order: mqd */
> +	mqd = q_extra_data;
>   
>   	memset(&qp, 0, sizeof(qp));
>   	ret = set_queue_properties_from_criu(&qp, q_data);
> @@ -716,7 +819,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   
>   	print_queue_properties(&qp);
>   
> -	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, NULL);
> +	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
>   	if (ret) {
>   		pr_err("Failed to create new queue err:%d\n", ret);
>   		ret = -EINVAL;
> @@ -733,6 +836,27 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   	return ret;
>   }
>   
> +int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
> +				  unsigned int qid,
> +				  uint32_t *mqd_size)
> +{
> +	struct process_queue_node *pqn;
> +
> +	pqn = get_queue_by_qid(pqm, qid);
> +	if (!pqn) {
> +		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
> +		return -EFAULT;
> +	}
> +
> +	if (!pqn->q->device->dqm->ops.get_queue_checkpoint_info) {
> +		pr_err("amdkfd: queue dumping not supported on this device\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm, pqn->q, mqd_size);
> +	return 0;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   int pqm_debugfs_mqds(struct seq_file *m, void *data)
