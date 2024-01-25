Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E416C83C635
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 16:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608610F90D;
	Thu, 25 Jan 2024 15:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9310F8F9;
 Thu, 25 Jan 2024 15:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdZKPivZOHJZ+4N2+sJltZ0rHF8mk4XK5W+fc3WCqx+fk+BqLtDJgSDFNke3DFqjljH/dCteE3c09kP87PMEIQWmRofgu/MyXA9YUdC0ZSVuqJPb2JP8GEQS1N3V8dnvaEOs2ZkvCfMsiOzK08+x7qr6zUqP8/yoE711jHzG+0/vXYNdVDSuIej+yPQfp5mhlWvJcYCl5LpTZ/0gYNqWbRvVjyjESBD6eBQVkUI3eIH/QvqByWeNNlOTH8deO697WUQY6TMO+aCNrxk5DV9gB3p1RD05zkDAay3+Y3EHNTDsR2GF9UxutjPIZeDKZCIBw+IsRzSksxhyCFamF8tyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPaB4SzSGph8TikLaSYPOlZR4HzwlbYrIEEscWsqyls=;
 b=mATxQzaxE9vUrUX8uyE9vG/1M0YEvectg4RVRwTbK9JnYOUvf6meHO84XhMqkbjNWCdOVjRTVrqM4cQ7j1buFBvkNfhPA0lj3RcKh9IVo2c0okzhSsM8DwDVj98cHJRzJeCvqt+H87DWbuPUO9BKK7D4nglAOA3kKm/j5KE7vibcgXpM6aC7cpSawVxxJuPj9OvjQ924bYTj1W0r0CLAXgs5ChBNm3AaH96msDi2fXieLj+Ys/8pn36594YR2NjbYQg0pmoZfKBNHmBXBMsnuzUVcfL/6lT2gkuhP8z2RHA2dQnNUXY7jAfGopemD9ueq9nX5mdLKgXbtNgMBuRQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPaB4SzSGph8TikLaSYPOlZR4HzwlbYrIEEscWsqyls=;
 b=ESDKJbf3JYAO1HEUJ3mlhhU/B/jmWbv6PKlT99W0b92aqimLAW+sxXIIhQcHel2WglkT2KRzErDDDFx/kH+f+pDonxqUlD2pkb7aYcjSiIsjJ2V1sGCi7nilr3lR7qXi6cyszYcH75ZVe9lm4kqfu8OxafKSgCqOCTPoGT1Jvxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8515.namprd12.prod.outlook.com (2603:10b6:208:470::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 15:13:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 15:13:05 +0000
Message-ID: <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
Date: Thu, 25 Jan 2024 16:12:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240124210811.1639040-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240124210811.1639040-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f8a0d7-7b92-4539-bef1-08dc1db82154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYCjG6GIZrpYRnLIFnZWU2OtHao9MGJy+jiisX8IJZKKrC7qBaRKS64D0xAWsE/lDwBXaq+QiEMptsJoyOdXYFDfJvRcYvAY4xHraAdi7hl5j5QzBaF/h8xS41xZjXWv+RuU/Mixt36WbSk8ncEOF8ywxXCwcaaao6Q3mCKuvmibI8NM+sX4XlNFTPieXnG4VG2ibjmuJDAHA3BmyRIPcyuXnylN3iWbQNmxn768s0qagCEaR2oNJxePjd/LHjn/S9OTxiXifqvIx0Li3iOmaih3y4NMRgCMbvCP0HXvjsciiBHDVBIfxEKKkU8IplZMYbgSs7rmhvp4v+qxSY2Z8EFttCSKZhsq/B1xTYyNQtdEf3I8fuuLHAAI7qdozbPvjCvh5zDRpZQe36DecMitvJEUPiPXpOSWZiGVsCw0AKtYT9EiDxOsEVjez2PLG/36uJTd8CRmwrZqy5251ZUIO5piN+ptCE0QVIOhr3ivldMpkd82PxQOcdyGNuork8nBOeRU2Cv4L0+0RAA69JISnyDPlWu/Y9gLX68JnG+awYhvAWyTlPixfzABAm747m51S00Y07dyoTBKQlAXmHUZkm1JjyMzfBa80i9hyNW3guR2TXaooNsIooKDyAl/6ER5QoFeeJng3NnlEG4U35TpXAbJ+h5hiJfjCfQTjgE20/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(41300700001)(36756003)(31696002)(86362001)(38100700002)(26005)(6512007)(2616005)(6486002)(966005)(6506007)(2906002)(478600001)(66946007)(316002)(66476007)(66556008)(54906003)(6666004)(4326008)(5660300002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGtqMjNCNkJhd3dRUFJRWXdTQTRCTkord2NJRWY1dkV5S0JjL2xXVFQ3TTIz?=
 =?utf-8?B?SHdyeGlLbElqVWFOdFJPRUd5V1NTOE1yZmV5VFd1bWQ0dEUzSVNJaTdJMkU0?=
 =?utf-8?B?VE5UckQ4WTBoN1VzUE5hT2x1MDV4c1JTQTBTOWFCdCtlcHNYUlRIWGF0YlYz?=
 =?utf-8?B?djdKYnlpeDc4TmlvZEUrblA2NGFycjZEeGRWV2xVM3ZCY2tKckV5LzJOSjUv?=
 =?utf-8?B?bGNjNlVNRzZTZVRFUnJsdlNCVlhRVEUxSHFoSVZ6SmVHblZhTE1WcHg2alpX?=
 =?utf-8?B?dEtzZk0wQmcxTVFncEJxZUFQeTAvNnlwWFhsZ2MvMVViOUJvRFVQZnd2SEt3?=
 =?utf-8?B?RzdTY1U0L2NIbGJrL2pvZjkvNkYrQ3JRVHpCS2dBeWRDRGJjZWFsdGFDRlFE?=
 =?utf-8?B?Q2d0UWNrUlE0RDZWVnRhT0FFWnBQem9yVERwRUlLS2FXOEtvL3ZLdkl0MUpt?=
 =?utf-8?B?WDdDSTJiN3BQa1lHbk9YZFA5b083Zkg5RitnQWRmSGFWS09tclkycWZ3Rk5M?=
 =?utf-8?B?L2gxb0NNREZINzI3d28zSzBIamxVVGw1MW52VUx5eXYvSGw2eStjSTJ3SGVK?=
 =?utf-8?B?aloybElKU2gvZXVhR2g2b0JoMVRCejdsVk5UWmh0bzJVeWNlZ2lHQlVicjhy?=
 =?utf-8?B?VlFwQm5KVzlwM2JaZVpRTDdjN3B1dlhtREwxRTFZWWZkNDZOcXI0QnI1UWhr?=
 =?utf-8?B?MngxMERNOU5zN3BnUnhnb0t5MXJrcGRuaVZES0c1dVRlb0JvcnRiT3pYeGVW?=
 =?utf-8?B?NW43cU9xZndSLzlwRUxLamJla2RmYkNseFZRdXBCejk1TXhLZWVWMEJ1Ympi?=
 =?utf-8?B?OE5ha2kwTnNpWHZOS3lGRG1tVVd6ZHE4U2lPQjdiOTNjVkVkTlpnQ0JBNnkw?=
 =?utf-8?B?dE9JMWlVV0w5WUNqV3RYeEZFUzVzdVoxZjU1VFcvZEZNQmhFcndIRWRlL29F?=
 =?utf-8?B?V1RVamZmVzdBam1xYzhBODJSZjBKMHpLNlF1d2djQjVNcFNJZG80THR5Z2hx?=
 =?utf-8?B?dmFmdE1TdzRrWUxYdGVsU2Q5ZVRadW92WGpCVDhVOWVlSFdrelV2cERuMnNE?=
 =?utf-8?B?Q3h6N3VKVVZEbi9FWFJjbHRRVHVndFAzN2VJYm1XRUFlQm40VlhxVXJidjhz?=
 =?utf-8?B?aFEreFZsYmFyUDJwL1ZPVzB4MXRoY2h0VHg5Q2FRMHovdTBQSzBaOWJvc1Qv?=
 =?utf-8?B?YlFwVmJTNncxQ01ialB6bG0yeE9hMGNDVmt1eXE5ckkzdWV3K2h0Z1dXNzdy?=
 =?utf-8?B?ZS8zcTFYcytmZVlTWmpYaVdNVTZZWXFMZFVSaUlOVnlscmdPTFovbis1T3NB?=
 =?utf-8?B?SkhwQ1djUWVUOTZDOUZTMzZMV3lvRjJBMVVtSUdFT2tJTytoUXAxRkNIN3RL?=
 =?utf-8?B?VG1NQnY3SWtsMWxZam40cjl0bXRNYXZ1RzRMY2xUc1JzMml3Q1EzdzQzMHdB?=
 =?utf-8?B?UGwwSmR0OG9TbSt5Tk4ycGo4VnQvVm93cjZUUmt1M3I3dHhFa3htMmgxc0Z1?=
 =?utf-8?B?cTc5cmt2UHUvL3IyRjQ4bUtjV1pOSXptS2lSU1JFWm9zNG1vbTIzYmhmb0xC?=
 =?utf-8?B?MXZDREF1TTMyVUdkV21ZT2x0REtBQVh6V0wvdGVjT3JtV1FTelpLUit2M0tV?=
 =?utf-8?B?L3VUVGpXai9abWtNMXdkYzJ2Yi90a0thK2p1Kzg2bTBobkJsQVZXUDc2dlow?=
 =?utf-8?B?L1RmQTkwTDc3MzBwdzN6blN6RHUzMXdCcVd3MEVzWGozdEhuL3FaVGN2TmVx?=
 =?utf-8?B?c3pBeXl0MWYrSUE3Ynh2QkJFK0oyR0xOL0Vsb2hlRVlwNGVIMXZDNm9vQWJx?=
 =?utf-8?B?bmtEVk9ldmhTWlYyK0tkZmM2d004MTQ4REtzQXZ1S1ptSEJDVzV4TGloSkxr?=
 =?utf-8?B?L2hCeFVFeDV2enlPKzVEY3VaRjZnQ0xqL0s1RUc4TlNVK1pRcGxKLzkrU0Zy?=
 =?utf-8?B?NCtHQVFueklkaWtKeUt5OW1ncVVYTk5PR2JzVGRwaG1KQWxHWHdOSnozdW9T?=
 =?utf-8?B?SjE5ZUh0Skh5VmVheDhiY0ppZDlucUtaRk01VkJ6b2JjWnpvMExMMkJtRi9o?=
 =?utf-8?B?bjhIdFBxSnJDSmNQR2xwekI1M2c2RHFWTjBJdFVDUnd4NXk1YlcxZE81bDRk?=
 =?utf-8?Q?65PxnqHZGYmWPn0cE/qRtk47/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f8a0d7-7b92-4539-bef1-08dc1db82154
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 15:13:05.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe5MlmQE4NVyOjA73GXmWA0HpmtMlhFqQ6oPiOCOASCSb0zzMf1wnpuOjm5T0Xg0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8515
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
Cc: ltuikov89@gmail.com, Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 24.01.24 um 22:08 schrieb Matthew Brost:
> All entities must be drained in the DRM scheduler run job worker to
> avoid the following case. An entity found that is ready, no job found
> ready on entity, and run job worker goes idle with other entities + jobs
> ready. Draining all ready entities (i.e. loop over all ready entities)
> in the run job worker ensures all job that are ready will be scheduled.

That doesn't make sense. drm_sched_select_entity() only returns entities 
which are "ready", e.g. have a job to run.

If that's not the case any more then you have broken something else.

Regards,
Christian.

>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 550492a7a031..85f082396d42 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	struct drm_sched_entity *entity;
>   	struct dma_fence *fence;
>   	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job = NULL;
>   	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
> -	entity = drm_sched_select_entity(sched);
> +	/* Find entity with a ready job */
> +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> +		sched_job = drm_sched_entity_pop_job(entity);
> +		if (!sched_job)
> +			complete_all(&entity->entity_idle);
> +	}
>   	if (!entity)
> -		return;
> -
> -	sched_job = drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> -		complete_all(&entity->entity_idle);
>   		return;	/* No more work */
> -	}
>   
>   	s_fence = sched_job->s_fence;
>   

