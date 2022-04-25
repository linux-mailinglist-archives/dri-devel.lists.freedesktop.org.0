Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68250E4A2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 17:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396E010F58D;
	Mon, 25 Apr 2022 15:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316910F5BA;
 Mon, 25 Apr 2022 15:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J41YB/KU7txszTc4NoGE2EcL6Bs4iDGsCMjZmvrqlQ9U1nzenR9zdeS0h8Dat53lJ9nY6UWZab8kXFtyJXVANVIBxqti1K55zdV+gNE7EcB3mSaJ/UgFPOg+qjuiy98E24YtrpqFithJEj0vP/yiU2mCU1G+Y/3rSElybBMMtLxmEaNnRGq+QQoGnVDNrzgOHqOBccK+ykke2Oq5/hVY0EOngVdrVXw4AN/XIKAaNV5areqn/J6wj23B0FrppZtbjjjMcK7cyWvT0cFsIWD5ae2Mylkr9MAYYnF1uOD6NIWhO1LCI0LEX8lwp9PvwaYMtIXPPWpubmYJ79Nvd5+e3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r5LVmuy33I4I6Wm0epx7EXL6GIo7Xl6nw/G4jtm6ug=;
 b=ktCPHM7I7FZxworPeZY0+ExWX852zRRaDlWtB43cAomagzLUG69dJure4yUkIVnCQFORqTiXxnTNo3zlkAfJcSvlXNLqCki4HkpfMQS8mAIlIdbVI60X5NZz7WJYnSWO35xrTn9JRVnVFjeZ7vEqkie/dhOOEFCLfgsHmbwg12/92Qq6oFVohF6PYJjKwzIvVwD0oOXeMWW2OsS51/Omj7kocVaArLEKO6Nb82rFI4XIBaGlfCkXZ9QNKZqO3oz/gRMbYJNGykfl9Nc1GaziJ7UF0JiTwpRqbx5mXAJhVqZTgi4XGc8tQmNEACmqb9zURbkr8oX6wKa/F6QwxeoOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r5LVmuy33I4I6Wm0epx7EXL6GIo7Xl6nw/G4jtm6ug=;
 b=Z5za6+S3/DdOGCvmHghqQdFFuFAUuQHkdFHWd2zyW0zlJURtOtn0p1KHRGwgCO4eOmWlVpD+Ei3zHhSVCnXXyKj8bXIxePsXBEhcJ+trySAPg3qPZENFF5m1wD3FqqCV5bDy3fUZIxm9CcLmW+O16I/Ea/474FQo2E9GV2BWJUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 15:42:42 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 15:42:40 +0000
Message-ID: <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
Date: Mon, 25 Apr 2022 11:42:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, yuq825@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220425083645.25922-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0064.namprd20.prod.outlook.com
 (2603:10b6:208:235::33) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bf588f0-ea32-4bbc-ef7c-08da26d23b34
X-MS-TrafficTypeDiagnostic: PH0PR12MB5500:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB550080F3F65A867FB3B586F4EAF89@PH0PR12MB5500.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flDgKB2MALHT9DURuHn8mEbdI3X8F6fPE1CYHUJrazdROHE9yBSYk+MtR8rgd7O+p/otJbAXado7dVDig5nJedxNaG2BNV9myGaPogWz5Qnk1+//2TE/1eUWRDAd/HXCMMgJU5M0ew3L+zWqqOInuGC8QOPZouGJj5L3dJeRhOydSlEB9UVB8okomUSK8zboPpvkioOvVfYehHAGBhdIQToYIm6r+XqLRGAx760+P9+RRQ/SbCMuHQW7e5rzFX/7pobXqk06fD+9eVANY9pFYrUTbPYWqWrCuIDx9XiC4SDZHJ7iEpa0y6HnJrrNiPFEdj0w/dQ6wz1JX7pSaspH3oQdtBGxnLqDGEDxLzaLWzXfz312wm/5xeufUoM7W8daO8qmtjvM0oNUuV2BSJve3y7VRlKCoCOC91Mie0Cnoj2tGtXs2laTXirzUbu9TLcTb7T5cKqbW3KkM3ySDauBwKImGIX5TWXal37E7fZOJGo1WIdCU2v74jMsRmIGaZFqnltmPktq5CB4EQTlhBCsxEalbjsHQrV2SBk1RBTvdw9guBgYt2Jf4BbIVCvJeE1d9TBGKzAu1An+0441FGHcHbDcVUm7QXXTnbLLk3pmCXyGk62UWkIj2+dRw0VUD7mpr6OjTGnPsts2G6LViNvqmb445KJ1HUiw9AdooK1l6LJcMMvxNl4bAPZSVgcIUDVXONxoRFLJrTTcaeU13Znxy4SzW1diFE3koeDjOSdhC6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(6666004)(8936002)(31686004)(36756003)(6506007)(6512007)(53546011)(5660300002)(508600001)(6486002)(8676002)(66476007)(44832011)(83380400001)(66946007)(86362001)(31696002)(66556008)(2616005)(316002)(186003)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFwV1d1Ky9zamtiQXpreW54Nlh2RVRWUmFiOEFEUFFuL0RqQk1remhkTE8v?=
 =?utf-8?B?NVVsMGpSU2NMdElCZ0gzYm02eVhJSUlvUUtORXBpTU0zZHFHTi84TGZpVE5I?=
 =?utf-8?B?WTVQem5rUjhMWTBhMWQyY1hrc1B0aHNhQ0d1SHdPZzVxd3pLTW5QMlZ4bC9w?=
 =?utf-8?B?bmRSU2VRNFJSQk8yNlNKZGVhNERTK2J3TDlCa1RwSFE0N2JMTHRiUnZUNE5K?=
 =?utf-8?B?U21LUEtaclhiYzRLUDFJUktEaVdyUC9UZzF6SkFuZUtmOFFkK3h3Y2dKRkgr?=
 =?utf-8?B?ZG5CTURSdFFuRUpKS1VHMGVXcUx6b2dXZ0xyYXRuaUNLYk11Rm8xZGVUNTVr?=
 =?utf-8?B?dnV6dzNkRW15UGNmZmdnbWFRaDR5aTNxU1plQ1hya2RadDRXRUk5b1R0UExX?=
 =?utf-8?B?UlcxR1YyRkVxanMyWlB4eERxamtoZ0Uvek9NME1EOEhSLzZBQlNDd0U5azht?=
 =?utf-8?B?NmRNa0xMY1VWalZvV3R6dTRRTE9VM1ZZa3ZCcjdZOHgvQldla242Qm5VckVF?=
 =?utf-8?B?K3JyWVh1N0VvaTRGUGdlRjhZNHVMVk5OTjF0ZGlPQ3lKQzI1N2dtY3BwZ1pM?=
 =?utf-8?B?SmtPWkk5UDRUajZWM3lvazJNaTJpOE5EaTJiU1hJK3p4U1h4Vmg5d3ovV0lX?=
 =?utf-8?B?eXRIUm56THNLdXZmSUNjRVVnSi9NRjFjbitLRGVTVUJ6RHI3RmcvZjVaVHRV?=
 =?utf-8?B?aG44LzBPVUNEdUZjQm5lYzl0YXNPUVhjNEFCZHF2Z3lJSG1Pamp5ZVZVS053?=
 =?utf-8?B?M21jVHBSL2l4UDQ4SVBZRVRFeW1VSEFlS1ZWZ2NOT21PYVJwTlJtV29RSHAy?=
 =?utf-8?B?K2JDVDB0dEJoTW9BVkFGZG5JR0N6d3J5MDR5OFZnQWg3QWtWM1JoS0hvaFJV?=
 =?utf-8?B?SkdGU2JUR2xSZUk2RlFYOHRBN1NTNWJqNmlVdkM0NjJabU9lbzNaZGtKUXZE?=
 =?utf-8?B?aDNSbUk4REkrMStYRTk1TkVGUEEwYXZRQkJMS1NzQ0RFOGo3SnY4ampTdng3?=
 =?utf-8?B?ZnNkZmMvQmZ5MksyMlh4ZkdpSUZlRTRqNEZrR1RGd21CcEFqTzNCdWk2THcz?=
 =?utf-8?B?amlRanREWkt0RVk4cytHNDRYZm45OFdsWEtBc05DZDhWUUxLWGpkLzcvTnpY?=
 =?utf-8?B?RVN3SEZ1R3RyRWh3OEJSYk96Z000MWZnenRIMmJUb1NmVEFldlZub2EyVTNE?=
 =?utf-8?B?UjNLNnJvRXZkQmlkQmZ6ekQrRWl5RTlNb2R0bTgyQStVVEJwcW50S29Scjd5?=
 =?utf-8?B?TklONnhFVDZZbnZmbDZhVTRFWUVaSFFuYVFJRkE3cE9hbk5xb2IzUDBTWHhu?=
 =?utf-8?B?RjM0UjgyaFYzcjRoMlh3OU5aNVJkUlZnN01Pam02S2l6WkxPQnAwbDRFN0dr?=
 =?utf-8?B?VEc3OHgrSjk3ajRwZzNTajZxS1RrVVgzWFloeXFwdGRxTlFzUkNIOVgySWRO?=
 =?utf-8?B?U2lrMGg0R3pRMXo3NjdwUFpXY0YxbUpubkFJa21mRDdaZ2dyeFFVMVR1QnR0?=
 =?utf-8?B?NTdqTXM1c24rQTBNNnJvV1F2emxkT0p2YldjUmd4MHllUWpuazhkMHJ5MmRR?=
 =?utf-8?B?RkNHdDlvKzdkNGdkcVR5dnljUmdNNUJ1M2pFWkltdW1OQnhJK1ZhWGYwc0hq?=
 =?utf-8?B?bVpydmgzMjBZMzlvSnhxa1k2eW1MUmJtdUg4OWZmRURrYjVRU2RVaDRBWjk4?=
 =?utf-8?B?YU9SNTdQMnNKQm5NaTVuQmtUeTRjWmxMQzRQVjlpZWxQUkdIb09Ha1NVVDZ5?=
 =?utf-8?B?akJ5aG1VT1N1dWgvajQ0OXdJZzZObHF5RWNYL3ltU0t3OHNYZnExK3pLbEtL?=
 =?utf-8?B?M3RxNmoxZm5id1ZFZnpiUndPUE5nbWR0UE5qakZpdmNKNTUxYmRpZlVsSFdl?=
 =?utf-8?B?OGNVR1BBNjFRRlMzV2RCNE56a0VMNmJEejd4SUl0NVpkT3Q0N0ExOG52S3pE?=
 =?utf-8?B?RWM0OFJVN0RIYmNDSjZPVHN3TjFSMUVxbDdLakxOYjZ5a0Q1TytSSkRUY0VR?=
 =?utf-8?B?R21FdGtiNXFPOXdtSU9WSFMrOXZIN0IweCtSUmNLUll6aW54MmluYW5odXF2?=
 =?utf-8?B?ODZXUmFqN2pwQXpLWnRpaHpmOUlOalpBRGs1MTUzbUp5UHY5Wjc2NTBqY1VI?=
 =?utf-8?B?VGxsUlozZVlWaFpSM1dHdm5WMEZjanE3eGE5OHVFL2YzYnFPMEdCWk5YVjBj?=
 =?utf-8?B?eW8vZ0prbVdJc2NUTzFjazVkNS9wbUFkNGVscmx3STFtd1dvMlZtNjNEbFBu?=
 =?utf-8?B?ZjBGK1VTTFBaZEx4WEp2U3ptZFNxUkpJVjBEQVg1TWFGeGlQMEFTMEFXWG9l?=
 =?utf-8?B?LzZGK1ZjL2d0Nks0eXp3YVNzWnViTjJSenpScHZtWkkreUVUQ3pNdGxUYVcr?=
 =?utf-8?Q?ItygUpeABTcsTZPy2kXDqFar7Rq0HkhieiNC25WyS1WmD?=
X-MS-Exchange-AntiSpam-MessageData-1: lqgutPOuBOlKUQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf588f0-ea32-4bbc-ef7c-08da26d23b34
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 15:42:40.8408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD8Q1EIBFgxTy8WCwOkwW/Tg8fat5GBQHSRahf8rCSFHxdQbn6E+hJ6NkhGgWWobgBoIYOYbQhS3NbDywZNFTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5500
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-25 04:36, Hangyu Hua wrote:

> When drm_sched_job_add_dependency() fails, dma_fence_put() will be called
> internally. Calling it again after drm_sched_job_add_dependency() finishes
> may result in a dangling pointer.
>
> Fix this by removing redundant dma_fence_put().
>
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>   2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
>   
>   		err = drm_sched_job_add_dependency(&submit->task->base, fence);
>   		if (err) {
> -			dma_fence_put(fence);
>   			return err;


Makes sense here


>   		}
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b81fceb0b8a2..ebab9eca37a8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -708,7 +708,6 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>   		dma_fence_get(fence);
>   		ret = drm_sched_job_add_dependency(job, fence);
>   		if (ret) {
> -			dma_fence_put(fence);



Not sure about this one since if you look at the relevant commits -
'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
You will see that the dma_fence_put here balances the extra dma_fence_get
above

Andrey


>   			return ret;
>   		}
>   	}
