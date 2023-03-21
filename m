Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EF6C3D8D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 23:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29C910E2AC;
	Tue, 21 Mar 2023 22:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BAC10E886;
 Tue, 21 Mar 2023 22:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPimEGvmbXjOesgbl5Wlpqb5imxZDIAhcnMu9vPdYGCUDWrgVV79tg02AP18spdqoeT+URno+QSOIE6mTPsn9EQw5v7q1vYcHGJEeFxQYluPsnBUP/1MIw6qefySUdzS3+SuT4XSH0c5I+GSfPM4bZPZguXUIWFnLqfXzQs6AvCsFb/DtBZB97sjRPNnB5WsQZWlsssIMu63EqinJE00NYO1QrlbnshbtjV4lAw1+miH5WbUSirkiRjF5p+x89FqZpSBwND1Rq0rWsPl4E8BJYAkS+Teea0GLKJ1oDvwAjRM0Y5gMw3QVJvzryhM8NMxisaaGRoe7iaoDPv4SmdjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yhy/U6548KYgOO7Yk2YmXc3jYIAeulzhZh+GvNKu1ic=;
 b=Ua6LRt5SqzTXBAjnaoO6GN4y51FCXjQlsqKZc0RC3LqJnQypIAQr9aqsx+4xXABt33GxPwotYrC6HXgOJnO1lPQPAjqF2xMowY3ayHlvEQMVnGWgEr829ghN8dxA4yHBD9/7oZFy1lP0tv8yjNUrpUMrfGkJucFs15qlNb0m8I24ME9/aIkA/DdmaHoCC/IByh+lOZw5Mir3wKHeEMpiSxyqSu2dU7fEdJdtfC1LhI5n23HvuRGH3ijLQPbCKZeW/mNCNf/lqfVcCM9qxJU6CWKW22bba7rd6mOiPympzqObXVxzZ2roy200H/zTlUCgDKCh2sbOmz4AYQ8C7JIoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yhy/U6548KYgOO7Yk2YmXc3jYIAeulzhZh+GvNKu1ic=;
 b=UymwGwyGw/o7/XDlP221nD49zWgxipYMLl0ku03xohEWkJpjcMbD6TaQWa5LHtg3gFumaGSlJ/ZD+mSsxql1LJY0mnjfnScCOMdkWLlwP46rgMPlzv9Hp9RG2yc9rYaSd4DIvW+92vPl8wrGSuEqlz/K6trga+nglST9C94JDUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 22:16:05 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 22:16:05 +0000
Message-ID: <97b3ede7-dce8-59be-eadb-19e2101dfaa6@amd.com>
Date: Tue, 21 Mar 2023 18:16:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 25/32] drm/amdkfd: add debug suspend and resume process
 queues operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-26-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-26-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0335.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e59b3e6-2eaf-4fa2-ae22-08db2a59dcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IbotvJePxrRnCxxRdpTYY7mpizDq+SKuEIvVJYY7BwOBauAr4O4Z4VAv9gdFH6DrMdsdWnxtW2EeyCtE6LCwHW0LkgqC9647Gm0WUhbAACwe9ifYG7K6NmTeWSB1/pqiId3TrX/edoJ+yKIjvuCl53CQJth3h4EPcEeuoIdosCQrHsA0YI+3mdVjzVFWtIdLo9ze0NuKj2B56DcaU6qAEtAJ7YXhAtj3KY/Aub74JvGNwViqVbbT2IuJuvQqFBrqyY7ewnCRyf9bQODr6ETTL7SmU0FjNTur7r6gkZUBXh6ygU5eylFtvL90n5LL+nKPbBoIsIQtN+8uDv+A4jTSMUFbAW/hqYoGLnXahLh5roGJfPyHnXGglgdu5gSiFX+z+mA0N6LgsPMrfb3mExrdGbk5VKk6tXzJzJSW+Jbv7Jn1Ik3mGIeqMHuF/fMQC/WN1I+7hf3jNiCF281/ILVDF63Borb8puGsF7vjmlp6cdBTbkc8RtpsJnfxWOyQ/b5L6acCFOII89i2spdM5RvOrF4g/8TrDGAjvxZuycZS5+7iCBTJ/mm/JnCB9Y5pPf+F47xF1wwHoyTHE1704j6M+Jr7Ojlc6TPLxdT5/9XVSpS26eGewvMi35fQv4+7/i58Gmy9RdW78F0TW8nPeYSQMEnUrgApWhmdhEzMXt5hklxvi8fPzNEE7fmWr6qnttu+QcXci59N1laJe27n7GJyulNAAM+fYMceHDZYY9ja1sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199018)(38100700002)(31696002)(86362001)(36916002)(6486002)(8676002)(44832011)(450100002)(316002)(66556008)(8936002)(36756003)(5660300002)(66476007)(41300700001)(66946007)(478600001)(2906002)(83380400001)(15650500001)(2616005)(186003)(6512007)(26005)(53546011)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnM5NUxZMmczRjJLVm11b1IveHV5bDJ1SXRzdE53dHliSUhyYmtFUXp3OUVG?=
 =?utf-8?B?Um9kWjZMQTFQWmlWTVpjSEI5QjdMSThDbVdUL2UyZnU0d0VhZEpLV0NTbTV0?=
 =?utf-8?B?bHEvNEtmNzM2YkxZK3lkcTdNZUpmeEcwVzZSVDRwWWcwRldDQ0MvdE1CQ05E?=
 =?utf-8?B?K2FBL3VmeFA4Z2xtelVJSVE0cFJyY2ZlU3lCeXQySXU3U0w2dFVDbzJsZjZC?=
 =?utf-8?B?R3Z6STVKSmlFY3VlV2p3VXMwd3FZS25kUW5NVkZ2QXd6WXNXV2dDc0lkUEUz?=
 =?utf-8?B?VmVkOFFmbSt3UWF0K1lzMU9YdWJQbFVPVzlrVXV3QmJSYXhvWU4vcEo5SUZt?=
 =?utf-8?B?dGo2NFVhdmpRSjQza1dXMmR0dkQ3WEYrNGhVcWdpVVJ5U2Ztc2ovVTF0UE9E?=
 =?utf-8?B?WTFPenVmSDBxTzVOVUtqcEl2NS9QZzluQ1RaclBNOFJRcVhuc2k4VXpsSUpS?=
 =?utf-8?B?OWh5YkFqdk40aWVjbkxyRDd3T0tZeXZxWVAvK0JGOHZFN2pOYTdicXhiMjBt?=
 =?utf-8?B?Ky9EcU41K1NMejhMcnVnWjVXMFE0N3FLUGhDdlY0TmU3QzBGeEZMaHB2c1dF?=
 =?utf-8?B?OTZxbTNzL3B2YkpKdUtLOGlTc3A2UURTbVN5SnNSSEFnYkVZbStObDZTZ3ha?=
 =?utf-8?B?TjY1QjdHNXorM3JzSVRqcXI0aFFzV3IrRlVyVTM5T296N3A4b0orbTBZLy9h?=
 =?utf-8?B?TFh2MFlYUk10b3hCKzJ2SlNmZ01FVEpYWGZxSUQzSnJFSDRpSDBxSmdNNHVv?=
 =?utf-8?B?OTNBUjU5dWxpQXVGU0lsa3FORW90aUNjQlRrTWVWUFpyWXp2VzNZL3h4andF?=
 =?utf-8?B?aUtnRFNGbDBFbURoN3c2TTgzK0kxZnMrc1FRclZVR2txK3JDM2U2Z3dwc0Q3?=
 =?utf-8?B?SFhubzZjU2ZXUzFmamdpcElhY29OWHMyVmxVUVM1SW1UYnZYVzFla09lS0h6?=
 =?utf-8?B?L0pOUlJJbzdyNUw3UzdlV2NDeW5vYUt0TExoZUE4U1ZDYjI3Uk1YYWZVYjNy?=
 =?utf-8?B?dnkrL01YNVFhamZ4dEZySDZoUzJKWkRYM29mZVFRUlZOckNiZUZWaW54Z3FV?=
 =?utf-8?B?TG9Ed2pyZURFbHN1ZDdiRTBCYzNudXNld1dBR3R0QVJPMmZSakFHM0VRYnkw?=
 =?utf-8?B?VlN2WUYwcDN0ZUp5aytlUWNzbXJJSHVXNjRhaWQ2MUhMYzJtWnlzaWtSSEN3?=
 =?utf-8?B?OHkxeTlDYldkQWNjbTl6RE5UTFRVcU5XaVpQZVc0RGJIelhzQzJwYlAxbnpW?=
 =?utf-8?B?Y29qemtPSWo2cWFrZ0YyVUxtZFA2N2lBMDhackg1T2pUZHhxb2h3a1FoQTBD?=
 =?utf-8?B?WTFCOUs4bDRsaElXRDVWQXBwNWJkQWxTMSthV0FnNFpvNmRodmc5ZldieXl1?=
 =?utf-8?B?akV2dTlPbUsvSlMwWGJEVWVXbjVuY3R5Zkd6SFdIaFNMbGl2K01zNUdrUm5X?=
 =?utf-8?B?NWVwK0hzWlh2VFlXREJzU2lKV1ZtTkVoSkZLUGFMaCs1amhVTmN0eDZpcm5l?=
 =?utf-8?B?OU5lekhveUFPUHdqcmVPcmtGTmY5N0gzUlo4ZHVUM3RkYjV2VVYyeEh1Yk5j?=
 =?utf-8?B?Sk9aVFNEYWwrM2toMEVxczB5Z0puMGI0MmFVeHp5ZUpyOUFTU0kvWVZaZ24v?=
 =?utf-8?B?cmNUY3F6M1hkLythRWgrazF6R1FyZ0piQ3RORTRjSmtOcXNPcTRhWXQ3L1Bp?=
 =?utf-8?B?UGxtUWxzNE5aTS9LcURaTnorbEF5ZzB1OURCaXhxU3VDSmN3Q1JxZk1YV3h4?=
 =?utf-8?B?QXdFM1Jjendra3Q3SXBmYWcyNHlsV2thR1AwN05rd0xyVXY0eTIvZnEvbDZ6?=
 =?utf-8?B?S0d5RFluZW9UUzlhWFdMdmkrZTh6ejNWOWNlTmwyYlIvMHoyaEVhTGtvMUdQ?=
 =?utf-8?B?UnBvM0dsUTJMWVFnaUhrWnhEd3pWOUR0RkFyb2ZjM3VReXI2WFdpZGNQZlB4?=
 =?utf-8?B?QVhqOHUyOElWYy9jUHNlUlhxaTU1aTNpYVRMZWtmbXF5Y0tZclNtejErVHVW?=
 =?utf-8?B?TEwyUnVML3MyWGdMTlVjNHo4VUdiZ1NLTVNvOWo2UlVGaVAxZlRmNTlSMFRN?=
 =?utf-8?B?ektLbk5SSWxSZlJaUmhnelIvRCtJRUZzTThFMnFOWkVzaTJNcDJTeHFQWktn?=
 =?utf-8?Q?bpwAYhY6NyFnCnfByZhQIIQ8f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e59b3e6-2eaf-4fa2-ae22-08db2a59dcff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 22:16:05.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee56zhDvGVEaYpd+Eu4xUELgFk4RdosPF9EBIB5kzO+zyti+tDRSYvvysmaXQ6APLAN4xpidBGqmzPqYXlwIjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> In order to inspect waves from the saved context at any point during a
> debug session, the debugger must be able to preempt queues to trigger
> context save by suspending them.
>
> On queue suspend, the KFD will copy the context save header information
> so that the debugger can correctly crawl the appropriate size of the saved
> context. The debugger must then also be allowed to resume suspended queues.
>
> A queue that is newly created cannot be suspended because queue ids are
> recycled after destruction so the debugger needs to know that this has
> occurred.  Query functions will be later added that will clear a given
> queue of its new queue status.
>
> A queue cannot be destroyed while it is suspended to preserve its saved
> context during debugger inspection.  Have queue destruction block while
> a queue is suspended and unblocked when it is resumed.  Likewise, if a
> queue is about to be destroyed, it cannot be suspended.
>
> Return the number of queues successfully suspended or resumed along with
> a per queue status array where the upper bits per queue status show that
> the request was invalid (new/destroyed queue suspend request, missing
> queue) or an error occurred (HWS in a fatal state so it can't suspend or
> resume queues).
>
> v2: add gfx11/mes support.
> prevent header copy on suspend from overwriting user fields.
> simplify resume_queues function.
> address other nit-picks
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   5 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  11 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |   7 +
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 446 +++++++++++++++++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  10 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  14 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  11 +-
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  18 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +-
>   10 files changed, 518 insertions(+), 10 deletions(-)
>
[snip]
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 50da16dd4c96..047c43418a1a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -288,6 +288,11 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   			  u32 *save_area_used_size)
>   {
>   	struct v9_mqd *m;
> +	struct kfd_context_save_area_header header;
> +	size_t header_copy_size = sizeof(header.control_stack_size) +
> +		sizeof(header.wave_state_size) +
> +		sizeof(header.wave_state_offset) +
> +		sizeof(header.control_stack_offset);

This makes assumptions about the structure layout. I'd feel better if 
these fields were in a sub-structure, which would make this easier and 
safer to handle.

struct kfd_context_save_area_header {
	struct {
		__u32 control_stack_offset;
		__u32 control_stack_size;
		__u32 wave_state_offset;
		__u32 wave_state_size;
	} wave_state;
	...
};

...

|static int get_wave_state(...) { struct kfd_context_save_area_header 
header; ... header.wave_state.control_stack_size = *ctl_stack_used_size; 
header.wave_state.wave_state_size = *save_area_used_size; 
header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset; 
header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset; if 
(copy_to_user(ctl_stack, &header.wave_state, sizeof(header.wave_state))) 
return -EFAULT; ... } |

This way you're sure you only copy initialized data. The only assumption 
this still makes is, that wave_state is at the start of the header 
structure.

Regards,
   Felix


>   
>   	/* Control stack is located one page after MQD. */
>   	void *mqd_ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
> @@ -299,7 +304,18 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	*save_area_used_size = m->cp_hqd_wg_state_offset -
>   		m->cp_hqd_cntl_stack_size;
>   
> -	if (copy_to_user(ctl_stack, mqd_ctl_stack, m->cp_hqd_cntl_stack_size))
> +	header.control_stack_size = *ctl_stack_used_size;
> +	header.wave_state_size = *save_area_used_size;
> +
> +	header.wave_state_offset = m->cp_hqd_wg_state_offset;
> +	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
> +
> +	if (copy_to_user(ctl_stack, &header, header_copy_size))
> +		return -EFAULT;
> +
> +	if (copy_to_user(ctl_stack + m->cp_hqd_cntl_stack_offset,
> +				mqd_ctl_stack + m->cp_hqd_cntl_stack_offset,
> +				*ctl_stack_used_size))
>   		return -EFAULT;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 6f7dc23af104..8dc7cc1e18a5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -477,6 +477,8 @@ struct queue_properties {
>   	uint32_t doorbell_off;
>   	bool is_interop;
>   	bool is_evicted;
> +	bool is_suspended;
> +	bool is_being_destroyed;
>   	bool is_active;
>   	bool is_gws;
>   	bool is_dbg_wa;
> @@ -501,7 +503,8 @@ struct queue_properties {
>   #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
>   			    (q).queue_address != 0 &&	\
>   			    (q).queue_percent > 0 &&	\
> -			    !(q).is_evicted)
> +			    !(q).is_evicted &&		\
> +			    !(q).is_suspended)
>   
>   enum mqd_update_flag {
>   	UPDATE_FLAG_DBG_WA_ENABLE = 1,
