Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9719635094
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 07:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AD510E4EF;
	Wed, 23 Nov 2022 06:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE2910E4EF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 06:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knj3lrayIwdp4sgTyghcc7bt3EoiCf0vDzSmDmBLIbhzKeUCey5KbKyT3owvhUMSsopPZQwSNalMLSdE1oUfVS+ZXl9/sSkokkpGsLbSDDx7egImvRVb6QeLucPFcL62BB8I09OSuKbl1c0HvlaK95wYX8go8w8oVajoeRcQA457zgub84Xe25/geTEgqkKG3lUOdktua+SWDAWB6Hc12Bnk//kzSFfmtfgCBSLOxhob46nVn07wWqIFprLFxbNtoxkvc/dtfb3VRYQsSc/MvKaZpCD7FR3es5MgV4+jdkCvWY0OxiFQA5QWTQFOuWzCH6klmJluFjrKvmbnE9dUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBFH3I4aDcBLgmDZ6+lKh+8MBc4ubqNOQnVCSowp19o=;
 b=mrDr0oKxaL8gCuqTFlJMcmef8zxM73pLhWemutjQaVapUNa/sKnpl4JqQpYMY93VxkAouO1WUOtf9DJDK0VXZUvehxBK3qFjFkwyFFS67Zj2/DriCkyusVc/mmY+eW/xc8BRY+RyRdwpxjHCNbSmypsS7c6ADorJE9RpNlPbwcF+jKKfpMQGqQtxoVO48Q8PJ6vm5YG0E9vo0p2/KEfHzGvB1apNu2pSNx2VemBLaz517QZWFB5AI/F8Y8+9fWUr6j734YC4jkqyesl3VhlGuysapf0XLaUyDSXZ/iFZ8XzLcM+zxPwlRV4CiqjuSqvUInafMGbBxrNlhoUfrv8l7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBFH3I4aDcBLgmDZ6+lKh+8MBc4ubqNOQnVCSowp19o=;
 b=MhHtpfOS/ce1tejAIwJ2jgoK9Y5VdD2uFSaBnDPwly0IYXrCrvxTVcLclq/9gMRnjAi5Lr89iXlVxOwYLUQ6I+GmwGZ/GCw/GfjR2y72IOdwneHqv1gLvI/SVMkZifwU7CpnoFbhwaZtCYzQxJRK67dyG05uffbf0n28Mic9nhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 06:40:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 06:40:48 +0000
Message-ID: <ba83fc40-e090-ace5-58e4-bb28feb6034e@amd.com>
Date: Wed, 23 Nov 2022 07:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: add56683-c1ed-477e-b62d-08dacd1da7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UP9uVPXlNyeXbgpNfWTYAxSqRukJBp+kQlmKqj6o9QJU4MxU+5915mKkuDRk9dwdUCekLr0HjF9vm8udzcDraw48PheUDG2T0sTAguof2fQaOaoQtxMiqwktMleoTO3sPETiVPqHQniM8SNG7C/1KeMq2jxqXloIf4VGFdxXnd5drK6lp0WDLsU9cxqrwITR2CZaeqyg0xLTdhelxJNPb61z2URgMgHKlxKI8eaiuxb0yfMkcOmn4vU0kGepect9hCuyUtAN6mYthqqIEOhtv9OQxobiDct2AUTBdsx28ylvKbhALQgLiZPAzUxuyUt9nDT59wMHXstI4uwII2XLvgOauFiTyeB6BN5eXBgxw7QfuV4zgN1dOnuJXVrsc8NqS80Z8wioXqtpxOX+JibrV2E8OzMQdbIg6p8kCQ3/2H/vUKBlQ+mqAXqnrXfKFWpqb94CoDSK9hIGIihMKNONIbIXmTUnKxPfsKzgroTJPeWVgIHi0oWYh/RJMsMzO9EKpyFfuTblyKwHybrkltG1ytHCzKPNaYbG6RjAUgOjxhmyDLL7F8c6+1jvBTDSJFBo6mX4SN9iBq3BU/nv0Bsk/Ng4+p9ARGY04reouKH+RQW/HSlJmDlQwhNzYtZMMFI35uBLGPxwYeOXqdz1IwVhh6Hm0Wt2O0sC0FodtQu9x7xdN1s/Dmw7zS6J02lBuekqQxDTUTc75g2AUDouqCE30HuVZNtmPIFF6DtDIQEwHiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(31696002)(110136005)(41300700001)(86362001)(66556008)(66476007)(8676002)(4326008)(66946007)(8936002)(316002)(5660300002)(66574015)(83380400001)(2906002)(6666004)(6486002)(38100700002)(6506007)(186003)(2616005)(478600001)(36756003)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1VvMzRGdXlGVnlvWVFUVzQrL1RET0VBczJQbHYwekNwTjhISndES3dKNERi?=
 =?utf-8?B?SjNvaUphK2NQZURvTDlZVHZscFhCODFGUk5Vb0NtRCt6SEY1alRzMUxENmhF?=
 =?utf-8?B?eTIwb1BtVWx2UCt1VldvY0VSaXc5OWlKR3JUbEcvanBNRi95cGsvcHVjS1NI?=
 =?utf-8?B?MXRCdWJJdEhoLzNjOGFFaE9UbS91aWpVM1NOS244TFMzVC9yaG1TNnZZSzZE?=
 =?utf-8?B?NmZhdFZGMys1bXhPT3YrL1g4ZnRGQlMvR213dVB6blJaa3Vrc0dJVTNvK0t4?=
 =?utf-8?B?cnRDWGpybjVBbUE4OFlVc1RNTm5Sb0JXVzh5QXFnWU9uQjNjWlVsQUZ0MkF1?=
 =?utf-8?B?dUc1K1pwUWlvVkV6Uit3MXIrY05hOE5MbnJsbUtLemFaaFk0c3N2VGRjL3dm?=
 =?utf-8?B?WE1leFBYUVJneVQrQnRQN0kzZ3drSWlrVFArS2NLb3dHYkhaZFpZUjVpbEI0?=
 =?utf-8?B?NXY5KzdTS2xFRlJKVGFyUWp3Mk1Ddi9PTUUxVDRycWRiYXI2ZDgvRHhoL0xF?=
 =?utf-8?B?UGtLWHd1ZEgzWmVNc2dMYnZFZFB0RU1vaEg5VjhBbTFUVzgxYlg2aUdFYnE5?=
 =?utf-8?B?b0lYaWh4akVjOTd0UHN6V2NOb1ZCUVdVVzdsdWsxdm5nSSszWm8rbnd0ak0z?=
 =?utf-8?B?UE1DblVLVWhQUmc4RkFSdzlNRlRjcTkvYWhGenUra2ZMTUpvcEdLREJ3YzF1?=
 =?utf-8?B?VkhUdW0wdW9ZTkZxcFpIY3ZQOERjSFRRVlNYQnc2ejFOaFgxdFpETE5oTDU4?=
 =?utf-8?B?VFdJWG5IbmlNdkprd01oMWU0YTZWb0pVUnB1bEtBNjE2MUVNNk8xMFlYb0Zr?=
 =?utf-8?B?Z2luTkE0d3lwWUNBRmxMeHJYSWcwY2xhdGdpUTJOK0JQYnh1SDd0VUZkdnVu?=
 =?utf-8?B?MUp4aC9sdnlPSS9KV0I5VjJneUZkSm54RFRHMWlBeTI4MDJpMUNZVXJsUklu?=
 =?utf-8?B?SFI4VlNUeSs5d3dlTU9td1BlM21yUTBCMERqWDdaNVBWS3FWY3ZPL2NQa0RT?=
 =?utf-8?B?Z0xtUU5qVHdKaGhhcHgrbzZ3UTRYYVJNc3ZOYmx1bHo3OXdnbW1jOVNXaldr?=
 =?utf-8?B?c2lKOGxKSWh6S0hGcCs3dkE4UVU0U2tJZTYxWFNZZ1JYY1BVNGM1MnhIVk1t?=
 =?utf-8?B?Q0o0UjZxcCsrN25kcUtSMUFnRWpadGtWQXh3Z2ZIVCtEUWc1cTJvK3g2OW1Z?=
 =?utf-8?B?czFOTXE3dGgzR0w4TmpyeWF5ako5b2ZIcmNBeWhBSGFiNEthSEVqOTlWeDlC?=
 =?utf-8?B?V3RYdjhwcGhPMTZLYTdmTUp1aS9GTlJQdmFxcFBNRGpVRUVzZGtHZlZkM1Fk?=
 =?utf-8?B?cCsvVFUvQ3UwRWR1VGp4MXprKzJ4YklUQkNTVXRnTTAzWTFDcEdxMmQ1cXRy?=
 =?utf-8?B?djdkd0RCNEFrV0dHUVMvKzJKY213OGtnYkVrV1RndVN1cFRRem1UczJNNGpC?=
 =?utf-8?B?cW1RNWd0Z2M2N21OdlNtbEtaOEgrUWFLZWZPRFZrQk8ybTFHd2k5c2IyVncx?=
 =?utf-8?B?c3JwZm9neEtxWWRCeHhtcE5yZ2loMDU2OWtFQ1Rvam8vMFN5cjJ0U1Z1aE5R?=
 =?utf-8?B?a2ZjY1NUQkgyZmtkWEkyYnhGVjJjS2tJNXFmTDdzcXV6RHU0RU9HR2dDRE5y?=
 =?utf-8?B?RjBUMFlHd2ZaYVVJZ29nM0J2MXg3NDJiNVV2cnM5am1JeWI3NmhFUVNjWW9E?=
 =?utf-8?B?V1Y4Z0VYKzg5N3NMbmJGYjhRVitEVUs3eDJxTUNYUzJ6dHRJYndFWENtMVl6?=
 =?utf-8?B?Q2ZpVWJxYmU5UVI1ZVJLajJWZ0hWd1ZZVkZzbXNKemhWNUZDRmxjbnQwUXZ5?=
 =?utf-8?B?clNjMFMwTFU2Z2tFT29SMFBLRVhhMjBJSkhMdDMwSkZmWHpwVFhWdURwcnBl?=
 =?utf-8?B?aFJPd1czRGphQkdRaCtmNHBHN3ZrV1QwZHhzcUZMd3JGaWdSeXdRcVZZZE9D?=
 =?utf-8?B?RUJHQkVHQ2pRRzF0NUtDLythRHNnNDJwOXF4aW9aK0JmNEFENGs2Q1RrT0R4?=
 =?utf-8?B?R2hWR3JienBwNmRTWVhkTVdRWmtYanE1ekFDSzRRUWdmcWNjVTdpZ2dOVGlF?=
 =?utf-8?B?RlFvNnZPcnlpVkZyUW5xc2JuOU9WOTFKUXN4Mi9Ock9UWlV4NGhLdEtESzRw?=
 =?utf-8?B?SzR4aTdzb2ZBNDZ1cFRhY0d2bWQ5M2x0UWc2Q0V0b3FQWC9Od2dXU3llOElR?=
 =?utf-8?Q?EN6JoIlm9keuXJxxQ3Wvil5SY4ZpQFOd7Xlac0uKPBA2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add56683-c1ed-477e-b62d-08dacd1da7b1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 06:40:47.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ywaqDioMz1Zd7MYfoijvyb0jNueAszsDn1iIo7z6w/dFZ4DkoBVQvlA6hn2S87U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 01:13 schrieb Dmitry Osipenko:
> The drm_sched_entity_kill() is invoked twice by drm_sched_entity_destroy()
> while userspace process is exiting or being killed. First time it's invoked
> when sched entity is flushed and second time when entity is released. This
> causes a lockup within wait_for_completion(entity_idle) due to how completion
> API works.
>
> Calling wait_for_completion() more times than complete() was invoked is a
> error condition that causes lockup because completion internally uses
> counter for complete/wait calls. The complete_all() must be used instead
> in such cases.
>
> This patch fixes lockup of Panfrost driver that is reproducible by killing
> any application in a middle of 3d drawing operation.
>
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Oh, good point. Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>   drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index fe09e5be79bd..15d04a0ec623 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -81,7 +81,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	init_completion(&entity->entity_idle);
>   
>   	/* We start in an idle state. */
> -	complete(&entity->entity_idle);
> +	complete_all(&entity->entity_idle);
>   
>   	spin_lock_init(&entity->rq_lock);
>   	spsc_queue_init(&entity->job_queue);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 6ce04c2e90c0..857ec20be9e8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1026,7 +1026,7 @@ static int drm_sched_main(void *param)
>   		sched_job = drm_sched_entity_pop_job(entity);
>   
>   		if (!sched_job) {
> -			complete(&entity->entity_idle);
> +			complete_all(&entity->entity_idle);
>   			continue;
>   		}
>   
> @@ -1037,7 +1037,7 @@ static int drm_sched_main(void *param)
>   
>   		trace_drm_run_job(sched_job, entity);
>   		fence = sched->ops->run_job(sched_job);
> -		complete(&entity->entity_idle);
> +		complete_all(&entity->entity_idle);
>   		drm_sched_fence_scheduled(s_fence);
>   
>   		if (!IS_ERR_OR_NULL(fence)) {

