Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9605782AFD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D77410E269;
	Mon, 21 Aug 2023 13:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C2610E268;
 Mon, 21 Aug 2023 13:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M13K1DG98SJXnbzho2IkNQR7+4QRApDi9LdVGIIAfjK6vtmtlRWG/GevRyMMqHaZsPpZ2wh2GEWfPn2p1f7y+0PSLShtD3pSXNojne6pilWr3tgxrhYDRIk8Kc0s91wJ7pOPAuSMfyGfGh7XqOmQCDXxrQBF9ZeGgygtKZ1XAfthcRvGDixbzAbTWKxmXsaiYpCRfLomp04tiNaxTYN/xIzvpoWVFcpuWedYGXulM+KgQjHpHZ4hzgIsTbasNZR4s2YjJPu4XCsx/4oS1ZzTuQIoPGfsGqe3t/YbsEAb6ge9jV4ocpFGo6jkfCOk4p0vRVYMbZZHLl0VrHVAbmj5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iYRfRQhfrhIbj6+RBezZKBk64ChdA4/jlAxCwDkxPs=;
 b=KfuD6iQwDmxag9rN/07ZsvSFuf/nHoPHLn586pQlFYq1gObJgdmY1KNv77mJb8XVJhBMHqhV6FRmzLUdW+ktDwHUIc0kKeMJDCymu7ddXVEPujiJSt1+7tW3by73dW7g3e9UfXKe//R0wX/bT/LIDk+ZORbCySfXAF60ICTZ9sAV+wvYvY43y86YFsIi4GJP6DSif83+sa6AeUVvWw8zS99jslK5SD5Gg+Mgu0wg4Gtowdt/Z1mX7t2+GjnxtLxB3nU/vgb5979KDHCWo+1lWHJghTwjud1ilt9mqfTg/d+LqeUt84on5PYI1fzGQ9ULpKl/ce0kAivOhjPR5uCQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iYRfRQhfrhIbj6+RBezZKBk64ChdA4/jlAxCwDkxPs=;
 b=YyDjbz8Z6zJvMKMBnf++tQPDD9pU395rCnq+bvxHbbkdXWSj0a4maFEl27k03+GNXvqGZBDaQxSrX7sCI3/7GuUKF3BX7aO2hdgvnKNs5v3syNiFK4akBGTylIFj+FVM6ay1MAaft0wzEqqBVHn5WqSbVJwjqD/7nVfZwwuxWXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Mon, 21 Aug
 2023 13:53:34 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 13:53:34 +0000
Message-ID: <bf49713a-15ec-b986-40f5-34de87123f6f@amd.com>
Date: Mon, 21 Aug 2023 19:23:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/7] drm/amdgpu: Switch on/off GPU workload profile
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-6-Arvind.Yadav@amd.com>
 <5436e99a-fb23-29cb-d20f-48fb91d57950@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <5436e99a-fb23-29cb-d20f-48fb91d57950@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::7) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7107a621-9206-4b78-75a1-08dba24e02ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QyrjyI8gYFBdhvKWDxxIHEq8IUs0OFkBiv2NY0UCQBSARs0/8XEjhWPZ19QPKJEdqwTGnr96QwG6bB8CrLCOXXkCcXY0oPjzQ7JnBXCHsgcDs5xtz4J4L7d2MotQbEfjNd6Zx/kXLvf+h2b/YJFkh+oMGeENvFxwI8Zd/RtFCC1l5SsBAJxwNHveB/5AhE1i9VtE6pWsyWZDWSlUniAXlhkCGuD8Rk95XHfIL4rRueD4hUQiLDm6BRzxlt6mbHu2/ZeUicp3xpxhGOdoh+FyHOO3DSfJpI0ojbrZU3OD/Qi7jTciVCUw43IhPNxzgCyep/dQL9msXbrVcnq4rxxVPnQjw2s61j9ChZZOxyG6l0iLbNbBZ0eLGti0I94m9U0nKH4+qfzJDjH9sF2THo+jcms9Kp+Eq9jH7eHJLuZFe0xYs3eDriJZ2QjMuNq5azzktSft4pg/e6LQFKrSoqf4t++vXITplw5qy5ICdrwytHTvMmEWOfCH1BjTrRa7EJnQZ3agzITwT+lxxss/1aRn1faSCY7kbQIU1KljFGWg4+rUOmM8BGMz+opeOjuU8jDWTwUdLzgnBxaRGgherGB+AOEETK7jpTVWg3DZnvx7W7v7ev67NxSZTtLPi46orB96NaSt2d4sAte9oCtqmQZ05A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(36756003)(31696002)(31686004)(6486002)(4326008)(5660300002)(2906002)(41300700001)(53546011)(8936002)(26005)(6506007)(2616005)(6666004)(6512007)(8676002)(110136005)(478600001)(316002)(66946007)(38100700002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTlZbEk0UFNWVHlOcEFXa1N2MElITTU5b0ZkUERXVWRlM1haQ2tkTmt0MWRG?=
 =?utf-8?B?WHVNSUxJbEYzeEFhbGNOOXhsNXMzZUZnTndZTSszaVhicDR2TUx5QUZ2UWkr?=
 =?utf-8?B?LzVnN3gwOWttZStxUDV6VUM3UFE2V1g4bVNaOGgydUhHSDVSbVhFb1A4cjRj?=
 =?utf-8?B?WkxEVk01cHF2QWRoRzVVRk41TjBCejhTUVUxanpXeVRsWUlCN1RMY0FZRWcr?=
 =?utf-8?B?SktTUlRKNHJPOGRSdUxwVURET2huZ25GVk1XbTNtYlFnTHFUUjFacGpkdDhk?=
 =?utf-8?B?STFGckRUS3VnTDV6Mnl3MURtc293bElrM3J2L3Y0a1B0ZVZhQlVoNlRHRmRz?=
 =?utf-8?B?dmd6NnRUR2FIUmFyYm5IT0lvYlJBcFQ0T0txTzl0U3ptSE5oVGQxTnk2QlVL?=
 =?utf-8?B?bS9ITzdlRDZWK3plRzBwdXNmY0lwMWxyZzRYcjE0bkIzM0JEWEQ5RytKWGg4?=
 =?utf-8?B?cHptWC9KTy8vL2cwZHRjVjd5S2tnTFplOXZOTUhJWC9PSTJpdTI5TURpejlK?=
 =?utf-8?B?YnU4dS9iRWJyTUpYQ2lleFY0clJxRnpNc0pnWVlUblE4clgxVTAwRUVqU244?=
 =?utf-8?B?UzNoYXN5SVp5ekkydERWelN4L3VUZjRocjhGNGIvR2RzVkxFNXBuellTdnkw?=
 =?utf-8?B?UU9TWkhuYmEvQlFSUDBFQXZ6c0JTMWxONVRJTzA3L3R5L0NueEliYVpWZkQy?=
 =?utf-8?B?M2NRQkVHT2pkcnV2c0oyTTRIeUp5N2dzSk5UNGwybkFlTUt0MEx6R0NlM1p4?=
 =?utf-8?B?RzZNMkluYTNCQmxoWXdNcXhmRnU0Y1JTOXZtMG9meUlsMUYzNmM3US9tbzR2?=
 =?utf-8?B?VmVtZWRmbVU2ZGRKNCt2WXVZeEVsLzI0SDRuNjhOblBaRGtSWDJKN1FXbGNQ?=
 =?utf-8?B?SndEdkVJTGdDQmZtdnZtWlJTNnNEVGtubmZHNm03YW5IZnJKclcrZ0E3NldS?=
 =?utf-8?B?UlhqNCtBalpwMHRnWGM3Zy9keFRqS1RRWjdaVHZBbkZURElVZDY5ajc0dGlI?=
 =?utf-8?B?N3AxYjJ5d2dBaUsrOURHSkt0czdLa3JtWElsMTdpUWE4VWh4UE9RSFFFTkU1?=
 =?utf-8?B?QUU5SXpoU05aanNWYVdXbyt5UnowanRwSzdielFDYTNiRDhyMEo0ZFNlQUpx?=
 =?utf-8?B?dmNtRHJNM3hWc1A5emZBODNKM0pQencxaHhHNmpSZysrZGtrWFQ5d3FyNjUv?=
 =?utf-8?B?RGY4UHBBczkzbTBVU0svT0dsZXdjdk9qcnIrRERjWkovN2h6VnpmMEtyUHoy?=
 =?utf-8?B?YnNGOGhPUGpJdUdUYXdiRE11c0Vjc0xZaVdaV1FpRnV1dGM0Nmd5bXIzem1q?=
 =?utf-8?B?R2JJZ21STGo3eHBzZ1pROWFZalFiTk1zV29lRkJLMWJlRUE5TFNtLzRzekJ3?=
 =?utf-8?B?QWY1alZPMVgwM2J3VlozSUVWdTdtMml6SWpHMTNWY1gyT0hlK0ZoUE5LSWhy?=
 =?utf-8?B?ZHVyM09ocSt0V245R0hmSStQUUpmVHJQR0ZZOGd2UExGUzFIRjJxdkx2S1RH?=
 =?utf-8?B?UE9KRHkySUQvd3M4YzFvSW9Oejh4bUVqYUZKQ1BkTS91VjNWZFN6TUoxYldz?=
 =?utf-8?B?QTNZY1dvaktjaE92dkhDOUp4SUJMc09zNGgrOUVBR1dZNGRzVWgxVlhwd2ls?=
 =?utf-8?B?K3R6VlludEYyRk9JRmg1V0xEakd1OUJ1Nzl2djZCL1ZRRVhwM3VZTVhwdVdH?=
 =?utf-8?B?c25VMlJhS2ZQNVB1blpwdFVNRG8xaG00N0hYQ2M1MUI1Q0ZraFBsQkFjYXlJ?=
 =?utf-8?B?TzNXRzREM0dFenJwOWxDQk5ydjJKanBMOXRVV3JtbDdKWGxZaiszeGNIZUIv?=
 =?utf-8?B?ZWIvMDduTzlhZkptaDJ0MlhZRG5HaWVobm1WNTBjR05qVnlTMmNEdHY0YXFh?=
 =?utf-8?B?REFLOCswNXVzMUQ4UVlNcnRLOFkzOGJOdi9NaFVOdjEwR2dQMllWLzhTNjNY?=
 =?utf-8?B?bktHdldXaktXVE44SXVaaExGVnpoZytwZ2VDaFN3MXA3b1BOUDdhUEFUckZD?=
 =?utf-8?B?U24yZmNla1hpeG1rNHc0ZmdVQVBocWh5NTBlWEQ1czhwejdLZVdJZ3JrMmgw?=
 =?utf-8?B?QVplUlNlOTI2MmNNR0tDSjZoVENVbEFnZXRpcjRQMTFhOE5vWnhxMGJsZkl2?=
 =?utf-8?Q?N0xWKZWNbn9dnrKBOzbPotkzA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7107a621-9206-4b78-75a1-08dba24e02ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:53:34.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0SrZQzgN7YAUUVy1WCwlphAvZPPzzih6WYrJtu986s3/vEmK+SgN3RgFNWORahpXx2e7jKguqAAtn7s2zdfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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


On 8/21/2023 7:16 PM, Shashank Sharma wrote:
>
> On 21/08/2023 08:47, Arvind Yadav wrote:
>> This patch is to switch the GPU workload profile based
>> on the submitted job. The workload profile is reset to
>> default when the job is done.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index c3d9d75143f4..c2b0fda6ba26 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -176,6 +176,9 @@ void amdgpu_job_free_resources(struct amdgpu_job 
>> *job)
>>   static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>>   {
>>       struct amdgpu_job *job = to_amdgpu_job(s_job);
>> +    struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>> +
>> +    amdgpu_workload_profile_put(ring->adev, ring->funcs->type);
>>         drm_sched_job_cleanup(s_job);
>>   @@ -295,6 +298,8 @@ static struct dma_fence *amdgpu_job_run(struct 
>> drm_sched_job *sched_job)
>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>       }
>>   +    amdgpu_workload_profile_set(adev, ring->funcs->type);
>> +
>>       job->job_run_counter++;
>>       amdgpu_job_free_resources(job);
>
> Instead of calling switch on/off in title, may we call it set/reset 
> GPU workload profile ?
>
> With that minor nitpick handled, please feel free to use:
>
Noted.

Thank You
~Arvind
> Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
>
> - Shashank
>
