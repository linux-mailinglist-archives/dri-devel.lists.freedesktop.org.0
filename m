Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED8841C55
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 08:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0172112DEE;
	Tue, 30 Jan 2024 07:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D72112DEE;
 Tue, 30 Jan 2024 07:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2LgMbmEWz5C1yO7wyJ/Zt6R0U6c5MTI1Ot8qDPQxQZxeqnCyhWP07njD4rF13IiwSYtAxibMU8IwYuTI38md+2LXp4xYRQ2UwW65S4+49IuPZeXLFOWSDF8xOfLq1xjj7bsO38elM7QPdZO0ZeH1YJQmSkMrIaXist4S1b23Nn+trDI6CgPw9/DH4OPRpYkhDI7Z34+TWB6rPP4qQPm0mkia4/rGPWrhSFbgOFFUhv8HZA1vQ9g1t6ko47mArmm2ebY48jgFuicOi6TxhyjlsHXFW8LrlfNGysjEUsG5qE2SAwpYPKNukyhAunKmskhIz0gVrPPdw0gn+Io4MQXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gu9qbDEY3Kl9Z6njRpCMxX3kudn2S8wArzIIEUWv48=;
 b=dfbd86nE35VQNn8qRWqYAMRu5Dt3AY+ET9ecVER9HLaVadUFh1V6xV25SYky+UzgI2wocfZBaSd2XFcZgUeWxxmHmPKyoa2do81wkc19Zwlh83Ihn7YSCQeFTjo5ZKrpCu0/YYkRH0eiTtslOWuQL42YmsNQN/7JVisN5v+iLWGAihUKffbs5sk5fdaDkG9tmcHUBmWmTjG05wWvATtQYPhI40G47eAJg9nvK2DC/0Mt04L2GOsLPdigWmW3WpkrXE2YLqYB8OgsJ09AVeE7D8MS6PHKFOlwSNI7hVkWhisUOIjMQqoPGnsphS6aEfiaMsYIjZgz/qOcyB0OFPwRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gu9qbDEY3Kl9Z6njRpCMxX3kudn2S8wArzIIEUWv48=;
 b=lxWpgdBhOq/dJ4qRBCe/nnx3hnCdhWsL29riEVIvPHRLDy1sG54hQXN9bm29+S4L8wkwEkDKGYNAV24ManddOZfU9Argo3vZa6r7WXaRa3c5iAjnFjfII8IiF8qZ11ZyhYcylIA4jgpbcvPsgjnWvTO1QoleFQDHfdzeLzXHQuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Tue, 30 Jan
 2024 07:05:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 07:05:35 +0000
Message-ID: <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com>
Date: Tue, 30 Jan 2024 08:05:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240130030413.2031009-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240130030413.2031009-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df56c53-8ebd-46f4-f5c9-08dc2161db11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFSGPr/dPoeUnPgk+eKJ3OUrJoXrVWUsLejWxVbVHJ2HV0ySbdhCzLosXsANtrGlTaqPP6LCi3vOnuG3O9fdul+tHLwMYY24DpZsDnWheNz6OdM2iOz7QUUS7X4jaffq2LdkTXxkrnptCA42bg1SaaSl++jomMH4B3pqS26qPwZvdVhVkaqqWQ7GcJUERJHrzVc4mwzzzQoblsBqtcVfwUj6DnOLpklg0YaIvp8VBS41PEBaXeeSAYe6/TNgPkg0fGSYounpThIcnOidre20C9RKQoPNx+Zu67fFXSaHhPJ8EsOU5xi3SXBUWh0eOORligOLsoJuCvO6XMpuUzN5A32PPH67VWqBTTYu/8pp8659UfzWR5TfdqcHddc0py2F4tf/VpV2A3VK/x4U0InLkiUpLfTHWl1dmDpWiV6oZYma/yhHf/71g27qsjseLx5Hnt6gb+WJekeuc6oSag8hxoWl8bAIlb2ie/ig0z4JTcac3VmqFRxBLIKxKD/JyQhf7PY8nbjDfVqGvVmQc5Zp4TTVnqsqIL1CbR8NET/d/XcMP6PjDVPNv7qvgtLXJQ5u6NtlhwrHHiMUjOeDTScyEJ2q/p991c6slTtOwMpZ6tDnmi1b8lJYRyEWQ53/tOjcTnAOYv2bFLg0rVXmr6t1+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(66556008)(66476007)(2906002)(8936002)(66946007)(316002)(4326008)(8676002)(6486002)(6506007)(31696002)(86362001)(36756003)(31686004)(5660300002)(83380400001)(41300700001)(26005)(2616005)(6512007)(478600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTE0bWkybXUxM2V6V1VaT0IrZThlL0Z0SXBONEttdDFHbFlkM2JTUW5kZDNE?=
 =?utf-8?B?SFVOVDBpNnJYTms0VFp6SjVhbU53VlRtK1FyRWprWGtjUzJLRDJuUUordGdi?=
 =?utf-8?B?aW9wZkplTTVHaU4rNHdkZHJJamNaWFBhM2JxN2xOSk1UeGg4b3RoNzZlaHJQ?=
 =?utf-8?B?WWtoWnBrT295cWlJOVpjVEx5YjB1OFFlWFEzczZTaFgwMnI3M3FIOXFNQkJ2?=
 =?utf-8?B?ZzhObnpPbWp5VzFqb3ZWYlQwWWRjQnFBblpGcnN4dk1tbHl6OVdUWDlqcTlz?=
 =?utf-8?B?aDh1VHlZQlFmM0JNTGZ1aVQ5aDIzcStsbVY2OHpkY2pnTEVQN2tXU1huS3J0?=
 =?utf-8?B?emQrYnZzb3RHSGdMTVZtNWF6Um5JdnoxVWFJb0dXS1Fvcjg0OHhDZktUbGtZ?=
 =?utf-8?B?c2FnVWpqQ3MxekJZK2lVMFFMU1FkVVhlZTBITVRybEoxZitwUG02WW1wcFdX?=
 =?utf-8?B?Y25qdHc0RkxVblpHbXBGOENDUzJOTTJWamFBNHN2MG1oOC83aGpXb25uWFMr?=
 =?utf-8?B?TFRXdFh6UzNsWThMSjkySDlkN3FTLzQvNDRJSksvRUtJV2ZTTktSUVVvdVla?=
 =?utf-8?B?bE1CWldMVTBTL1BwVW9rQ0pTb28zc3dQQzBYUDE0Wnh0M2RLbHRyazQvRzJk?=
 =?utf-8?B?TjFiblczWjRtV0gwbDJCUXVFOVpjYm05TG1SMXZqcFVWYkg5OGNaV003SGt2?=
 =?utf-8?B?U2tqSSs4TWFXM2hLWElINFdXQ3NpS3JUOW5sZ3FGdVZqbnBOQWRjYjdHMm5X?=
 =?utf-8?B?cjY1dWIxV3pqYXcrYmhvUjhWbDdSVnByZC9zdUduYjA5R2MyWXYvREpQb3g3?=
 =?utf-8?B?Rmg5ZFl0ZzE3RUJoUVNpL2MxWFNmM1VzRVYzS054dXkzZEgwZUVqbzhTd21M?=
 =?utf-8?B?a0d4RXEzcS9KTk9SWFVlbFc3dzRXMHlvTWFsY2hTZ1gveFp0L3ZSMTBFYWdR?=
 =?utf-8?B?dlFtUWh0SnNpTW80THcxQ29wVnNKZ2d4Rk40NllSTWdrVk8zdDg4ZDB6NkRx?=
 =?utf-8?B?bnBWeDU1N1NzRlZPR2MrcThjdHlsZVUvbVpRNGVPUklBVFVEejdDMmF3WWNh?=
 =?utf-8?B?YnhmcjNCbVF3OU5SbkxzdW5mKzZVb1VNZ1E4WXVtSkhEZzdyU240eG9hZ3pq?=
 =?utf-8?B?b0RCRUNpc0QvSFIrVTI1akdJMDExRHFYUUJ1MzZDeWhEczJrb3JuUTZqbUZi?=
 =?utf-8?B?SS9FZjJPYU05eS9KZzQwNW83WkVtU1VDWXBPYmpsSTk2QWZhbjh3ZDQrZ0RS?=
 =?utf-8?B?K0RJOUh3VWxKSVlpS0V6VHdmSkt1K2VidWQ4K2F1cnFPcS9hNmw3K3dSbVVr?=
 =?utf-8?B?bDNwbFdqQ0llS2ZsbHFGOUxGbHEwTkZGMWN3elhERWdWc2FKSTNyaElSUC8w?=
 =?utf-8?B?U003Y0JyaXVUK1JpMDN1YzJlWW9oQk1pc3MzNE82RGRtTFAwd0hnYU1jZEpI?=
 =?utf-8?B?S1FJcmVHeFpacUdrT1RpTXluUUxUY0U0dTNBbFdNVkpBTkN3MmVqYnlJdHdw?=
 =?utf-8?B?Rnp2RlhzallnckJTM2JNbUNLd2hNN0pvTi9jTk80OFRKQzFqa1lMRGI2MWUy?=
 =?utf-8?B?R1pDdlZldmpBQTRXK2ppMW04TVFHNkI1Vlh6ZHl1WncrSStDZzZNQjBtSjNC?=
 =?utf-8?B?Q05PUnZhVmlnVDlJMFloUXJCUUFBVEFWM1UzRSszcnJqTXFwTUdoTTBqYVg1?=
 =?utf-8?B?cW1PTmRkbHV4TGxqUnRLNkN3T3E0WG5pOUFWN3FtdjhwWEIvVzdrOVEweE42?=
 =?utf-8?B?cjdGVVM1MkVBb3dqZ2hoYXJlOFZPdEtUYW5Zdzg1eVQ4Y2RxNHg4UEZvUThW?=
 =?utf-8?B?dkdwK2lKMEYwRW16Nmk1ekdTeVFNMFR1MTBlNkZzQnF2SzJXaFhmVm84VVdp?=
 =?utf-8?B?Wk96SXlBbzFZTHlQR0UzZVo2TXQ3eXhjc2s0dEpqUngwak4xN1RpVW4wNE9q?=
 =?utf-8?B?U3lLdEdJVWtTakxVYUNpZlZkeDFmUkJiYk9XcisrUEplMm9iYVpPanlNSVR3?=
 =?utf-8?B?cEE1Z0tON0JId1JKR1JIaFdHdEdzd1VyRHhNaW5rUHdrNmhEd3lZNmFyR0Rm?=
 =?utf-8?B?K3l6cUFLYVIxaVBJS01XZit2K0NjeEtGNSt0MVJ4TXg0U2NkcWhVTlVWT0py?=
 =?utf-8?Q?wXURjFEYR/X8QyRsNbYfJjPxC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df56c53-8ebd-46f4-f5c9-08dc2161db11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:05:35.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmmZ1ftSr3ZQbukNmpjrM0EPNFRoIoTx7zmKSoTTDa+FTiCFx9IgWFsHBt+rvHJ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
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
Cc: airlied@gmail.com, ltuikov89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.01.24 um 04:04 schrieb Matthew Brost:
> Rather then loop over entities until one with a ready job is found,
> re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.
>
> Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8acbef7ae53d..7e90c9f95611 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	struct drm_sched_entity *entity;
>   	struct dma_fence *fence;
>   	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job = NULL;
> +	struct drm_sched_job *sched_job;
>   	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
>   	/* Find entity with a ready job */
> -	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job)
> -			complete_all(&entity->entity_idle);
> -	}
> +	entity = drm_sched_select_entity(sched);
>   	if (!entity)
>   		return;	/* No more work */
>   
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
> +		complete_all(&entity->entity_idle);
> +		drm_sched_run_job_queue(sched);
> +		return;
> +	}
> +
>   	s_fence = sched_job->s_fence;
>   
>   	atomic_add(sched_job->credits, &sched->credit_count);

