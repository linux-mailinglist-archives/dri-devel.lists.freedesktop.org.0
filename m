Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89DD6FE00E
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9810E4B4;
	Wed, 10 May 2023 14:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C53D10E4B3;
 Wed, 10 May 2023 14:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxBwZV2SFnYHHW9oflrfgk82HXE1DoMCk/+LLJZgRHpw3OzcZhu5CJ8YhZGLwYNq9BFTGfnWz8jQhMtl/jZEt6dsTfPvKdGXn4zs2b+iQwrxAnFoYiwtvRAhMyu/QMRjSLv9PED8hQbqreJniqBSn8nqdNk7ONe31DtRq5rY6Y7TOdF+pyBYuY5/+57jUyJsMIyqbdBWmcGaGfmPFPE25nTG1OlEAogRrB1fKK5RIgkNKMcFwhWkWCmDI3C1Y4suHBx5no3xZuMLF814wASkd5MuaBZOE0eE2W2b0+Z+08kr5oPXbGaIuXJAtJc/zd5AGVKmd+Qe1KRzJEb2m6YO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbq2IwNTgTORyLujNIToP0WFp0BG1GckX6ZszaY0f7E=;
 b=oHY/6c3bx7x9Z6wcWIKwHE438XRA4XQ/++ZvVn4IFaY2mxpf0jc6CbHMhnFOyv7zH3V5ESviKQyXo5K5+hJT+wZ3wkt5/HFe9ZardJtjy9wQr0YmRwt94m//uI33MsjjvEEmQ2VvZEpffLYxrMA0t7XSTMG/WIpUhktMpQU2EY3aO8IjJGa4/F9XRRht7S8kfTm8qu8ZQd2qJFxErnStV/vBctPFRENcXkpo3xhvsqQK99cwTLb9eLa7u72REeDgrRW7R57WVlNyDIo5qbYN390fuvErHr/qIxHklOZ5Fv0EY+YNhjbXdp4ewgRxSnFNkAGyZ1VWN9jussVg8suFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbq2IwNTgTORyLujNIToP0WFp0BG1GckX6ZszaY0f7E=;
 b=v5yO6MQOqtmd2xB1XjVfyUe42jnsFuNS87V7V88bvCtCWbZwHGrYbkNx4/nRgTU6LO3lbnkObJz7mxKaxOXRKMjoNTRFRgepixDHPRkrfqAjEfcfv3YyF24JC2MuTzArIZUCxR0ACBoa0MUy48XQGCzrYifpek0ybSUojbY7APM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1897.namprd12.prod.outlook.com (2603:10b6:3:112::8) by
 PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 14:24:17 +0000
Received: from DM5PR12MB1897.namprd12.prod.outlook.com
 ([fe80::2e77:d1ec:f477:4281]) by DM5PR12MB1897.namprd12.prod.outlook.com
 ([fe80::2e77:d1ec:f477:4281%12]) with mapi id 15.20.6363.033; Wed, 10 May
 2023 14:24:16 +0000
Message-ID: <b43e25d5-8ce4-a1f7-cd46-fbc76a9d7aac@amd.com>
Date: Wed, 10 May 2023 10:24:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/sched: Check scheduler work queue before calling
 timeout handling
To: Luben Tuikov <luben.tuikov@amd.com>, vitaly.prosyak@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com
References: <20230510135111.58631-1-vitaly.prosyak@amd.com>
 <6e1930e0-1a52-6499-0ebb-998aa7e82c8f@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <6e1930e0-1a52-6499-0ebb-998aa7e82c8f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0958.namprd03.prod.outlook.com
 (2603:10b6:408:108::33) To DM5PR12MB1897.namprd12.prod.outlook.com
 (2603:10b6:3:112::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1897:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f9e21e-31ed-474f-fa08-08db51623be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkUFreNSw4dSFqG301UXcrRFKc0PM/FBPPe5ga6ypdTYM9ZPqSeNnsotBKb1GCaUeUTDk+I/7eGk9+tS8RWDpm8P1dWUCAsNgnRgKws0CIngJxXoB4GeAkCVXmGBNj0uZlhAW9C1u/FccOWyCeTH9rAUvqzs5F6JcNEd09a3NDG6Xkhb+92GMrvW+4301qGi5UPpFYiyaCI2N6AQTNfyfC1pXE4ihbs83JhE415Qg8e+laNQJK4TzXs/uQgeobovfTomOhZ7MlFrWDQTRrk9N+9oG/l0KRnIa0zvdYgQpDqY7Gjn4SKR3zpw9yJf9F4C5aLSJL1X/UvphDmQDQ2O428TeDJfJBqB2ruxj2ZJq0h7ayHSQcZOThjK/dIxjWSqxsevEgeIMZ9UTv2xNE/7PGWeqJiW756P8yCImnRy2l27mlRNStlxA5IROoOAwB60+e+f+cTnbb51Hs7vsIl3lplZ+T/sGbBBV60D+YRXt/9fKMZ2QIbzk/lujI4rY7ZtmUWBPWjmRV7jSiCw8rrFjeRp0fYRPTDUWNZ6as2L6IQx47LjMNrEFZSkFGuqBKWTblukq3Z0c7A7nvJgcKUh924NqKUSN+a1fcz3gh8mj84EtZLNlY6GqyeNzY1Rxw8ZN7RtCjVH31g0WBuhmimdIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(450100002)(66946007)(66476007)(66556008)(38100700002)(478600001)(6636002)(31686004)(316002)(6486002)(41300700001)(83380400001)(6666004)(31696002)(2616005)(8936002)(5660300002)(8676002)(26005)(6512007)(6506007)(53546011)(2906002)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVwc0FiMWovMTB1L0hwNi9qYnI0UTlKN2t4QSs5aUI2SEE4UlM1RzNVa2RG?=
 =?utf-8?B?S1A0NVJ2L2RXTzRmeWxjNE45TzJ0RWsySkNYMFpkcHhVd1hmYkxaTXdvMlVX?=
 =?utf-8?B?VFB3Uk0zMWpvbTB6bkJ5aGhFVjZoaitjWk5nRE45KzFHTVhKaXpOQXBCNGxq?=
 =?utf-8?B?ME1KSWVmR0JWc3RScWU4TjBKOG1wUTlyZkh6dC9lRktQbVlrdHBkd3FmQmJt?=
 =?utf-8?B?b0RzU29iSmhrNzM1dVV6eDNQMnkvaUhLc2U2c2lWMTBLbExodUVCeXdRUGI4?=
 =?utf-8?B?OVZiSzlrRzIyNUNyWE5xaGdwdEVFYjNhTW10djd5RG4wbzV4LzBCdlFITFBP?=
 =?utf-8?B?WEI5SjNRK25nRW4ydkhDWnRodXp0bmZYdWhNVXdQcUYwS29xMnNFd1N2dkpT?=
 =?utf-8?B?dVZZNzZmMVhwSHpuQ1VPRk5icUQrK1JybnI0bVVZbkxSSVZhT1BFc05CUlNP?=
 =?utf-8?B?dkJQUFZIT3RUVW9IOEpmbndHdkQ0dzRnd1lQb0tHc2x1WXp0dW1WRWM3Smln?=
 =?utf-8?B?VnMrc0RGWXdJR0xqbFkyZlJlUlEyRzRIUjlRaWhiQ0lPVHh4RmtVSVBtWjhx?=
 =?utf-8?B?NlYvdEYxMGNvbGNBRmFpeVUvR2JRaldIRTVFU1JITVg1MEZ5Sy94WlBnK21F?=
 =?utf-8?B?SmJuS3VVbVgrTmdNc1lLbHJMRTVZN1daREFIN0grbDR6U1ZsUEJhUTdLMEtC?=
 =?utf-8?B?eEk4NEZRbG1UYkZMdGVnaHU5dE94VGtPeGVYbzBtWlJtR0h0Q3ZaNzFKTERU?=
 =?utf-8?B?THJmUElsVm5BU2ZjK1RVK3Npa09sNWR3SEJqVG5hb1VSYllFRWpZSXkzMEZO?=
 =?utf-8?B?dEtnekd5NWFTcjlVU3Zwa2huMEtkbDBxUmtRM0tQOGNPellIV21tZHFPLzBq?=
 =?utf-8?B?Mi9YQlFob05lTjlpRlJQclVneVdzem5nc1FObW9rZUNYamtHbFVpOVV3ZkRQ?=
 =?utf-8?B?L2NoNXpkdzZzanZKa0Y3OGpadUJZek4rSE84dExPTkNaZXo5TFRxeUtGNGVN?=
 =?utf-8?B?a2tvKzVYaDVlb0laSFRVblYwVXMzbG9TUThIZklucXJXWWJIcnBQaVppcExO?=
 =?utf-8?B?TG1scUFDS0l2aWptaE9LZXBOMU9mTS91SXR6SkNCTG03QXNvM2ZkMjFJME5y?=
 =?utf-8?B?Rm5KTkRpRy9Fck1RUTNoOFY3NWNDblFaVHBTSXNwbnl5VFgxYTAxa1VlV1h5?=
 =?utf-8?B?WE5wemh6VXhiWHZmMUsrR0pHL1lpeFdoc0FvNTAxMjlYYVBUNzJUdzJxZ3V3?=
 =?utf-8?B?eTROZU9GOFpJMkd5RnVFVW0xN1dMWlZFZ0N0S2Y0NUN3ckFTNjlvQUpuS3k4?=
 =?utf-8?B?d1hBTEdJWFZGK2wxSGRYQ2R4RUFLYUk2dS9WZWZ0dkd5Y04xbmdhVHNWY3dj?=
 =?utf-8?B?bmdMQjRnNld0bElPSWQ1cld0anhXTVFoK1VhSnN6Q05pM0RGbVVhUWlSSXRl?=
 =?utf-8?B?NEIzZGh6RUZvajlUNnFoc2pYVmwzbGVnV2kyaGVuUjNxb084elc3RjBDcXgy?=
 =?utf-8?B?SzJNZkRyZDVYQ2lTZjRZWnZLcFBGSXhMVlZ6STMzMkNjYlk0ZFV5Wisyaml1?=
 =?utf-8?B?MzFYS3Njb0RiUEduN3FkVk9wbjZYeENpUFgxR25MMTN4VXplQ1FWUDNYTGNk?=
 =?utf-8?B?bFl1ak1wdjlWTzBmOWNFUlFGc0luNG1XM3NyZFR1c1lLNnZFMDF6UkNudldP?=
 =?utf-8?B?V1BRR05rZGdINlN0WjVTQ29NVm1kSVJ5N3czbGVaQ0dSZi9sVm16TlIvNk1q?=
 =?utf-8?B?eXVTNDBORE5VVG10djhhQTNFOUhhY0QxUGVDMHF4aEhmWHE3bU4vNnZDTFAy?=
 =?utf-8?B?WlMxbUlZUGYyMEtXNndnTkxkY1FHVWV5UjJqR25QUmJRMGh1ZzJ2UGhwSEVh?=
 =?utf-8?B?QkpMNFJ0TGpOWlk1YmxnRkRnRGhsRTNrSm1uNHB2U0ZlWSt5Q3psQ3dDcFl1?=
 =?utf-8?B?akRXSmswVUo4YUM3SnhpQWR3bmlPSFZOQm1TY25OQUFXQ1RjWDhIbUtxbWZT?=
 =?utf-8?B?Z2dqK3NUVG5aOXhlVGhpSGV6QXZRQm9lcndKZ0k0RTNhRWZvdjJSRDRCOWRO?=
 =?utf-8?B?R3h6TVZIL0YzOTlBOElsZXdaQVF1VWdiSEFmTGJvRjlzZ1A0cW9CSWhqdTNY?=
 =?utf-8?Q?re2jBWw7iPycworBOe1dTVS8d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f9e21e-31ed-474f-fa08-08db51623be4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:24:16.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vySC9ozAjR7BEi2+xJFM96TVeuNtsPQVZ2YNnc2kLP/OEkXmHp3y+A5BJgicY2i3Agy5xwNSWOFUcL18zBlvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937
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


On 2023-05-10 10:19, Luben Tuikov wrote:
> On 2023-05-10 09:51, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> During an IGT GPU reset test we see again oops despite of
>> commit 0c8c901aaaebc9 (drm/sched: Check scheduler ready before calling
>> timeout handling).
>>
>> It uses ready condition whether to call drm_sched_fault which unwind
>> the TDR leads to GPU reset.
>> However it looks the ready condition is overloaded with other meanings,
>> for example, for the following stack is related GPU reset :
>>
>> 0  gfx_v9_0_cp_gfx_start
>> 1  gfx_v9_0_cp_gfx_resume
>> 2  gfx_v9_0_cp_resume
>> 3  gfx_v9_0_hw_init
>> 4  gfx_v9_0_resume
>> 5  amdgpu_device_ip_resume_phase2
>>
>> does the following:
>> 	/* start the ring */
>> 	gfx_v9_0_cp_gfx_start(adev);
>> 	ring->sched.ready = true;
>>
>> The same approach is for other ASICs as well :
>> gfx_v8_0_cp_gfx_resume
>> gfx_v10_0_kiq_resume, etc...
>>
>> As a result, our GPU reset test causes GPU fault which calls unconditionally gfx_v9_0_fault
>> and then drm_sched_fault. However now it depends on whether the interrupt service routine
>> drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed which sets the ready
>> field of the scheduler to true even  for uninitialized schedulers and causes oops vs
>> no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx_start and
>> NULL pointer dereference does not occur.
>>
>> Use the field timeout_wq  to prevent oops for uninitialized schedulers.
>> The field could be initialized by the work queue of resetting the domain.
>>
>> Fixes: 0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")
>>
>> v1: Corrections to commit message (Luben)
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> I didn't give my RB to this patch so I'm not sure what it is doing here.
I removed your rb, also if you do not know what is doing here why do you want to push this to amd-staging-drm-next and to  drm-misc-fixed?
>
> The fixes tag should be before the SOB tag, and the v1 line should be separated
> by a line before the Git tags.
>
> Since this is a good patch and I want it in both drm-misc-fixed and amd-staging-drm-next,
> I'll submit it to drm-misc-fixed with a Link: and RB/SOB tag there and then cherry-pick
> that into amd-staging-drm-next.
>
> Don't push it to amd-staging-drm-next.
>
> I'll fix this and submit to amd-staging-drm-next and to drm-misc-fixed with
> a Link: tag.
>
> Regards,
> Luben
>
>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 649fac2e1ccb..670b7997f389 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>>   */
>>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>>  {
>> -	if (sched->ready)
>> +	if (sched->timeout_wq)
>>  		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>>  }
>>  EXPORT_SYMBOL(drm_sched_fault);
