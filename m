Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540C5F0A2A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97ED10E15A;
	Fri, 30 Sep 2022 11:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057EC10E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLAsPRH2c04WXBcZlAWXoUUg1fLPUUaEMyBlxw53hvA6pI1CQKdDIZlZOt6jj9NDJYbwls5b8YoplfAq/0MyOWKiaT2r4Ew/NwtNBKRhmNWScH4Iorly9837887PTztM866vlxATlloyofsME0ZdZN4VJIWFC5DVQ8BLfhDBToUvap+TjrRXvXlKI03OuspV+8L0vEVTBefSGT618ji8dqrGomU19AZghYhd0GNvkPXEQ3q9g8Q8nn+U+uKNPVGD23NP/KvROZdsPj+4tCn0yNUpNv8YBP9yoAnhBBgOrpMCNNAIDT1Q7+NBQLLKoevZww0/Zs3h1rNUbRjtPwDtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c9Zxl5J/VzyoO1l1LfCQ528uH2aqnpzlTRgaisjA64=;
 b=ZeNu5SL4QVewUTbZFZliRqCKLYG9M7eSlIO6CIQyEZWIDZ4zH9sLcOKahlXYNaQ13XLitzHys9eyztwxepoME3OhAs9YpHsdj+TGmbGz3KG1nT34PIH6aBZ60nG0NC2fP+jnE7h7qzVc0V4seNTYhDIbcQVYDW3Cjb0vy8BUbB5lQJ4BpWMSLZx8yXSazkzKfcHKJQI97+4xOSj8BMMczPCoNVbITpjo5vnv+79VEgn30mqjJo9W7PzJFIVgE6ZroQHTKQNVlOD9bYnnMMwcSz5YxVOjIuIflnvijsjwfUntslmOT2oSAR9u3ncMsbIXFvLCFU6bB2mHQn3nnmTflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c9Zxl5J/VzyoO1l1LfCQ528uH2aqnpzlTRgaisjA64=;
 b=g/ICD3XYUVvyThmCz/sqjF0BVbfAtXxkuAnw9ZGNBuZhDfn8F2Bz6ABEqV5ew24PZ1T6efxcegsZmTWTMm16ZhzdOA93/cxqeJhV9WLtZ49XlqlkV8e6D8z2xRQ5puCHiWf9q/+j/tN10fNTtFYqVCw8PPJZnCJxIwcl36srxTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:27:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 11:27:47 +0000
Message-ID: <9b691217-dd36-e3f6-3b10-373d60116ccc@amd.com>
Date: Fri, 30 Sep 2022 13:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Add NULL check for s_fence->parent
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com
References: <20220930083857.3950-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220930083857.3950-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0287.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: c83541e2-db14-44f7-aaac-08daa2d6ccc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNpzFb6CGMhIGdi7GlugaYEnNutZryM8NQfmetDC0N2PxB9bG48RqW/AV0umx5BY1MJrhAvg4K3k+QrsT4HX9oTYQdcb0AWVTmOS6Q/zFHGWxkHh0mf08WaFCEn5ol5+1FNOdGNhmVS91v06LReGQrXwkC/9TotXuwq+wxOcDiPC3fMTHLPrtRzgWQd+cmy3iTYzDjmcGJULBZld4MQsiShqpb/xxPpTEqXC4uZvDDlNcaVY7hBKJAwvXIBlWb5d/IutYHs9oseIenkM1+JjZPTTbkQux1zL/5K4HHM+Kp6zrOZVlb+MGdVyr73GDHo0KrZdJXh49ovRkwxr82O7INrr/bKjJ2ujSMVLyCfnZw32lrYlj/viyd4niCKpUBqNvy1bYwOMt3WfurEeyVvu4mW97S5JcD92VX/JUzuRVHa5Dx8TVZNt+Chq6X8J+1XCNqhCWyHdt1OZGdEJziVtRJtWMgbrtBI9VFZ/yGfBlxs+xsPbiSZWe7tMP15ALBECc3DP3uOvZ6UGpHJTqSNAsSHiM6YTy6AJbc/e5d6hEDIYNgViF3FDEpK3AfP9yusjVWfMVdPNWT//2MwBE+cV8Gyjbez+eqPB+XRi37noatIEUllScS82z/p6dTSHIChcMSmLB0e75Wd059oodiACEG7mPtYULioEtgkgsxrGe5nGgNmfcTWPsMJNI/6ZjMTYAI44cOO2P+xDQFr+8F/cQ0k150f4am0406V5cb2EVSWCCXfdCg/KsYri5HoxzySQIjIQLR7iMTto3p5mBcB8f6hOtyayG2WFGBzIlYLCKTXPvU8eHuiw9UQ8zPf6R+/F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(478600001)(6486002)(5660300002)(36756003)(41300700001)(66556008)(316002)(8676002)(66476007)(8936002)(66946007)(38100700002)(31696002)(186003)(921005)(6506007)(6512007)(6666004)(86362001)(83380400001)(2616005)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxPU1l2V255bE1uTC96cC9xQlA1Q2NKUzZ2d1QrVi9kbWM0M29WQlJ1MlBI?=
 =?utf-8?B?NW4vS2plSXNCeWpaTTdLbU9IelFzUHc0T1pZSUY4UDROQWh3RDNmbEtQVVJ1?=
 =?utf-8?B?L0NDbnpnWDUxallTdHBsYVZJMUkvRENEb3p1TkJwOFppQnEyUnVDbXdJU2ps?=
 =?utf-8?B?Yk1tVElhcnkyTnhZbWIvQU9FWUp5enJPTGJuVGsxK2xkWjFVRTMxQmFnUnYy?=
 =?utf-8?B?cjIyREI1bVQvWDFMK0xTMFpwTTBid3hTelhXeFNsOS8vOVNGQjBZclljcUIv?=
 =?utf-8?B?ZGNyNWVLTm9VKzlFUUw2elFVMTErMkZNamF1M0svcGwxUFowSXE0SExwNUlE?=
 =?utf-8?B?VzJ6VklraVp3MmszZDdrOERqc1d4OHZxeWVQS0M3L0djOEpNdklaNy9WOXNO?=
 =?utf-8?B?WDdlbmlDeTJHc0ZKeGlWQlFIRFhmYUkxVTZxS3ZnNGY2WnlWK3FTRWV1bm04?=
 =?utf-8?B?MVM4WlBaZi96azY1TzRJQldmVmFRbElmVSt0MHpyd1VNVGZ4RDhsRmtBUkJ6?=
 =?utf-8?B?N2dLZkhML3Y4TDVVb3laUTRWUzV0bkFQbFdydzRMVlAvMVBubm94YXM1eVhL?=
 =?utf-8?B?Ym5mWDYwUk9PQmxHUUlYMVFwODFzK0dmcGdvd3psRXBuN3ZlZFZKUVZiS25v?=
 =?utf-8?B?WVZkSFZIL0hsVzFmMDNxWVV5ZkpZNi9wdmFBaEx2c0FqanNIa0hrdFVZbkZD?=
 =?utf-8?B?YUQyS3NkQkRNRzZzVVFWT3Avb0R1TXVGaTZhNVJYaHZBeUduYS96VjREKytj?=
 =?utf-8?B?endtcTd1eFUvMDRkZklPV2o3THB3VW9JV21jL29MaFhRb1BEMjVoQWpGbWJu?=
 =?utf-8?B?TVUySW9NMElNU0k5dnhHcEhPaWRrdmJmMmI4d3dyZml3cDNEVUE3WGVITlp2?=
 =?utf-8?B?YkNkMG5rczlpRU9DQnp3ZkozTityOXRwQVI3b0dWM090SFhHU1BFQUkzaGxV?=
 =?utf-8?B?YlFvaGFCQlVWa0ljZjF2SGtPdXdwSjUxZEJSSTdrNTYrbnhmbnQ1SVl2b1RI?=
 =?utf-8?B?NUFMbkx3NThKbE1QSkY5ZzdGZmYrNzJhK1RsRXF3NTRzNXBHYTZUSWVFR1hC?=
 =?utf-8?B?c0dISEhpNDRmTXkzTERqei9HL1JpaU5GbHIvaWZ4TlBJRDlSNzEzT0Rwd2di?=
 =?utf-8?B?MnJuLzZ1L3A1RGc2eW92MllUa09pc01NUGNjL2g5VTcxL3ZLODJFZHlOOHRh?=
 =?utf-8?B?MjlKTWducmpmanFnMXhGMzVEeDA4Vk5yR2haemQ1WjJMNnpMMTdvcDFRUlBn?=
 =?utf-8?B?NWZ4ckZJOVVlS3o2UE1tWjR5L29ERTMzc1JZRTNINjd6Nk9rNXkyVk83RUxa?=
 =?utf-8?B?dXVabUpwdnhHVHNPdmxheVBxMXpMRzdmUlhIdDkvbi8xeG12WEhpUWZiQmc1?=
 =?utf-8?B?UUlScENTRFFxQUlScitxUkgveHN1c3llWXV0eEdkNXJoWkpBMUhqMU5NU1pU?=
 =?utf-8?B?RXUrNFJUQVNVbzJPR3RRcDdIQU12MUM4UDM3UkJlcUtvTVR2WmYvTThvWmQw?=
 =?utf-8?B?anIrbGdFOWUrbTJNa2dmVm40eld1bFdJWDlrQ1duNlR1Nng4ZXlqbU5OWmFD?=
 =?utf-8?B?Ky9jZ2VGb081L1NqSVhJekxmRXZYdkwreU5qeHpZcDBFUnpiSEtNWFdsUE9Z?=
 =?utf-8?B?YVkvT3V4S0ZFZk1JeVovYlcrcEYvVnJqT0VOdEpjUXFtVEJ3eFVPMGo1bkpY?=
 =?utf-8?B?cWk1L045aEtuNFBVa0lHblV4d09XZkJremNZcEpNTElKZjFDUjBuc0lwNG5V?=
 =?utf-8?B?Z2dEcVpSVlQ5aS9BZG9GQVFBQlhrOVhNVllhZ0Nuekc1VmN6cFB1NTZrYi9P?=
 =?utf-8?B?UXR2dGU1TWNuUzMwZ1U2TTFJQW5TYTZkeXVwYlZtVC9Ed2FCeUxleklJRnFy?=
 =?utf-8?B?SmZWWlM4UlZwWmlEcm9pMGRrK2ZIWmQ1RGtQejVlaVJPdW9UOE9JYjFRRzZa?=
 =?utf-8?B?OENlSnRiSU5qSGw1a1pCNnNIbTA4VkZZUS9JYXphWnYxaEJob2lDeUFZOEgx?=
 =?utf-8?B?VW5zMm9NQXltS0E0WjVaMkZaK3Z5TFFqd1Z6eVJTbk5TbTQycmdJZHRBRTk0?=
 =?utf-8?B?STBRd0c3OVRCSUVnZ0t2SzVQNXhHWXZINjB2aHB4ci91VDlOYlRZLzBudER6?=
 =?utf-8?B?aDYzMUlNUXZHUG5YTkZ6U2s3V1BWS1FpVXhCaWV6Tlh5eXJQUG5EeGZQUzZC?=
 =?utf-8?Q?Ndo8YpS8lzgd01d/cSoufPFegq1Ku5T4V36kODun5soQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83541e2-db14-44f7-aaac-08daa2d6ccc7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 11:27:47.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flGt7uU3rEfu3rgCgxnnNR7lVPWgc0uSXrqMpmc5v951EZcKC6Uk2VhXjB9bwzkV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
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

Am 30.09.22 um 10:38 schrieb Arvind Yadav:
> NULL check is added for s_fence->parent.

I've send a patch to fix this as well and this here is actually the 
wrong way around.

We want to free up the job when there isn't any parent fence any more.

Regards,
Christian.

>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4f2395d1a791..6684d88463b4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -829,7 +829,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
>   
> -	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
> +	if (job && job->s_fence->parent &&
> +	    dma_fence_is_signaled(job->s_fence->parent)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   

