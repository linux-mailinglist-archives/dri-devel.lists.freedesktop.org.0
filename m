Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3279F98C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 06:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A729310E4F5;
	Thu, 14 Sep 2023 04:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE110E4F4;
 Thu, 14 Sep 2023 04:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SePJvEgh5KBqsWwp/kSCHau58b82/+iaQWpBL6Jpcc/gwpwLZzUqJoyDGvj8yMnlCxrpADCBf1xThlGCbqFxK5CoQLqtPWtIgvMXGEvOUAED2N0yficcA6tD9JYlywUOc+B76U9ivau2Ro7p9+PYuyB9DdzGpB1JZ+2VM3xjE2gOvOMJyuylJquC0QS4n8xzWeejjefVYSHDoaFLxEUpothaIC8TMk70K/4MpJzHuSKb4BVEzJcwaarf55bGcek4KKQ2aJRr7PY4XWxKl0GMmqftVBGLKF4DoY9f1nIam7XsP5Ni/uM0xEyWACo0/L2POhJasyeQA2uU/Zv0M+DveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYhUyDM0tLbVrFr0qauW0g81FRIDqN9xE0Cj5VjxBWY=;
 b=J8vFbmkrwycqSWRMbcWNf/r8oKcULGR447Xt4br8FPRs9Hajlo+EAg2HfqWB+Befg7KQ5wrDcr48KCkCriWVkC52MnbfqN3sYU8nseEwHfNiKTzSGE/Px74D76H4IrH//bqOV6gTpyhrKbjV+jhVcz2ZztBPeahNoRxbXWrBh1MHlXEJm8rtd6gAni4zXQoXVbZfUFSQ3VWUPntoGprWhrPud+OapekBZyTGM7dcpfPFdV0OIMq8Vtb2EPhSA2siKhjms6kbbC4n++AYaujmGvi3oBg7zNa+blyMJnvqP//qtlDZOg6DpBgdVyIPBwwZDodJ+WiOjJ58VhaaoGZwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYhUyDM0tLbVrFr0qauW0g81FRIDqN9xE0Cj5VjxBWY=;
 b=u2gkWk9P674wCvdOwdp1rCAJuNcEX6rGnrHygkeEFWhbq1RNutkBJ1ShVVYKSff7TN055WlsvdsUSDvBil/EI59scOpYqyFrUMeIJ1HC6uzI2rXfW6bXgvZh9rfLrZH5X+IZ9bvo3otA4GQ6iBBZyD9q/0KA4Mmr7kJiV5B1mGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 04:23:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 04:23:38 +0000
Message-ID: <7c54b2d7-0a17-43e8-9da2-766b0464f4f8@amd.com>
Date: Thu, 14 Sep 2023 00:23:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
 <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0470.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca6596c-a309-43ed-0246-08dbb4da5e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/7bayFnotTNczfdi4BxXpbbzcQWjUHqq/NuLJoXi7C9V+k4qHLi/SSQy2i9vyx8XwtMefQDz75NYw0InBMo7zZdRXDtdavfKr3xU65pDTXqEABzBRVSTmjAGb+6DHsaowhmubAsZDo6PBL/bwkaLusB5trgjiiuliaLnRYorMtNF57+Cf1yyFJazH9X21vdvZvuVzgPMzqVhOTxf2AzEe2w/xPEGo3iEYrCreBR3U7uKJSZ4D703q2FfmxWcRz2qLAanQwGkr1gkrGNurshOJSIeweIL9lahLBfeIUXOoFndmVn7AdTEx75UQrjiAmjMFibWL6AoFcub//FOjBry7Q/BJM38wv6vhg3JxC/Hbv1854aM+oPO9WCzBK5ufsRgIzErMQEOmviy5j2ojMsXEp6f6LAiWEmpCNmObuUKXF9Q4npnyLIjO2QcifwWildslWGiA68bCU3rn9v69NaUm4Wkp8I/q7MEM2gJE753KJ4qNIm6qaBjSwboqLiJvKlgZXW58T64KXssJvynExOEkoa7wweCsFClVrrr/TdH8W5Sf3Pqs9MOmunJzbiUTKbiytOpcNTdA67MgVEkqkbkmYPVPXflDkx3m/aTGIP+2BKWLw0u0+/0sdL4Wmf7eExTd/A5fm4fHGDsFvc6+Gj8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199024)(1800799009)(186009)(31686004)(6666004)(6486002)(53546011)(478600001)(6506007)(38100700002)(7416002)(30864003)(41300700001)(83380400001)(26005)(6512007)(2616005)(4326008)(86362001)(36756003)(31696002)(66556008)(66946007)(316002)(66476007)(8676002)(44832011)(8936002)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZyTW5xUElJenJnVHh5T3VDZzFQVE8vQ2RaM3hubXZ4cVdXSE8rUjNxV3JU?=
 =?utf-8?B?M3RWU1owMjZ3NEgzUUh2N3c4TzdYN0tsUXlvK2M4NXNoVEoyWHpMd3RTbW0x?=
 =?utf-8?B?SVVXMFFJTmE5ZDJJWUZpSXhYcTl1VjVrODZ3MlFDTW55N2FLM2tOaHR6ZFVK?=
 =?utf-8?B?NVhDbG53TUdhN0l0SDNibGkzRzJjRkNCSlZhU3NiR2RVZkQzUHZNYmpvd25S?=
 =?utf-8?B?ZmdVUDV0MG5sdUxrYnhRSGlMRFFXSG9UNHF3TGtTTjc5bUZhYWswV3JXL01i?=
 =?utf-8?B?Qlh5VUJoaFJSSTdVVnZaQnZZcis4QlBWd2txaUZIb3VQMHhsNURkMUt2dzMz?=
 =?utf-8?B?YWloeVhTbUZ2L1RnQ0JTbkRaeXF0UWRZdnlTRFg0SmVVZmVXcU5CRi8vTGtC?=
 =?utf-8?B?RWhESG9RSHRjSWlsK25uNkkwUS9ZVGk2NDc1SzZkM0p4YVBURlNYalpEVyta?=
 =?utf-8?B?NkZDb2JOZGlicGV2TkU5VlVXZGhZZmIybFEvbUJ3bVZubHRjTklXZDFFNVBX?=
 =?utf-8?B?UjZjc2ZpM01zNUFKbkF0MW8reUdseVJJcjFlQ1BmUFF4d09EbklwMWh2ZnlC?=
 =?utf-8?B?ZUlpRmJocjNWSFlxMEZTVW84bGZhV1RPY3Vrc01MY2p2YjIyeEp5MUF5QWJh?=
 =?utf-8?B?a0dzM05vVTZNUXUyNGVFY0lCclJKZEw1bGhjUFkveHVvWGJxOVlVSjF4TGdG?=
 =?utf-8?B?T0YxSENVZGFsWUFqWTk5MVB1a2FmOXdzNy9pS25oWEVYRG9GY29STVhjT1pY?=
 =?utf-8?B?NmJ0d3hERUo5MnV5aXVTOERWL0FrdVRkSkYwQXNhL3VrN2Q3WElMaTNvcVFo?=
 =?utf-8?B?SGRtR1lCa3JSSC9jUEoyNjlPMVJnK2Uva0lDY2NGaUpQUThMdkZadXdQcGVU?=
 =?utf-8?B?bnZZUHFoaFR1bVVJYzltMU84c3hEOEFCTkRnZkJ2M09rN3E0M3pUVjc3a0Nq?=
 =?utf-8?B?OHRrMzJMUmsvczBvQkwva1dOR3J3bVlGNjBRQmpiOXR4Q21KUUI3V2dzdjB0?=
 =?utf-8?B?Qk9TVHVrczJSQ0RxQVJia1hQaks2amRJcnFrYlBJSHhRL2ZBQXRHVnFlMEhY?=
 =?utf-8?B?TVZLSjNYREpxUmhvaTBNNmUwa0NoUUVvdVRFd0NOZzN4cEovOGdyN2VNWUZj?=
 =?utf-8?B?Zk1JeFltMkNqMWR2RmRmZ25OWXFIU2kwYndkb01PekJ5d3owWUI3UndtTlR4?=
 =?utf-8?B?WkRvVGs4MWJldzZwYzRtc2ZxTHJCdFpoU3poZ1hFYXZZc0ROL2xjbU5kUDlM?=
 =?utf-8?B?K2wrcmxvK2hiSDUwamVBWlRSTzhxZGVyMkE1aTdWbk53SEFwT3BlQVUvWU1k?=
 =?utf-8?B?TnNKVkFrL1BhV0g0Z1ZPMVErcSt2WEhqWVFrODNLVEpNNFFGRmZzQXY4eWd6?=
 =?utf-8?B?NTQreXNITFM3LzBodS96TkpkdmN6Vyt4U2UzZkhWNGJqNkhsYkxtb0tpenYr?=
 =?utf-8?B?cTVFbEErc3ZoMjdiMW1mS0hRS3BheVRYN0FiUnpjWC9QM3N0NDlLTkh1RW1o?=
 =?utf-8?B?RlB1WklEKzROeFhncXFtUS93L28yaTdnbjVUbDBBL08wUUlkczgrM1ZWMnpa?=
 =?utf-8?B?cHZRRzFDcnMzWlh1N2NITDJodjFSOUY1SjFodmtGODhVYk53TmpkTEN2SER1?=
 =?utf-8?B?bXFxNXNPOG15VXcwcmdrVHdFNnVZblBIdHJKL0NKWE43ZGczUDdraE9oN2Rp?=
 =?utf-8?B?ZUR5MnlNOEpIR3RnM2VRK29LSENLSWFDNXBlQXFMeHE0R3V6QXdYTVpsaTlL?=
 =?utf-8?B?ZjFxM1AzbE85NnVvV0l3dkk4NDhTSmxCajNnZzNncjVBalVEQ1MzeEVvM1JQ?=
 =?utf-8?B?ejN6SW1PUzdmOU1CbmgySkgyU29sUWxLeW02RjRuTTVtL3ZmMUJmMDBPVkRJ?=
 =?utf-8?B?WFRRTFd1d3I4UU0wR0ZxRUgrK3Z3Q2tSbGJwTzVrR1dBdnlNNE9DOWtUa3dI?=
 =?utf-8?B?RnR5MEpwZnNyd0ptWkYxZjY3UFNLSzRUVzZ0RHVRSCtZbld5dlRtMUlJUE9l?=
 =?utf-8?B?WFp2dzdQOE9VNFlzRGI2VnMwdTBUL0gvQ2krbmlyNlhsY1J4aE1JVUlPeUhn?=
 =?utf-8?B?L09YRlp3MTRCM3Q4MFBEVTN0RXJNUmtQUTd0K3B3eWFqMW1JTVVVOC95czF0?=
 =?utf-8?Q?5GIHiO+G4q9pJFt+L0RDEiqsp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca6596c-a309-43ed-0246-08dbb4da5e5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 04:23:38.3362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TUEi7bxynI/Bx4x70PqBzuVLal0QePcouF9oPV89LPc8VuavOBAcsb+iwtjq5+a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-14 00:18, Luben Tuikov wrote:
> On 2023-09-11 22:16, Matthew Brost wrote:
>> Rather than a global modparam for scheduling policy, move the scheduling
>> policy to scheduler / entity so user can control each scheduler / entity
>> policy.
>>
>> v2:
>>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>>   - Only include policy in scheduler (Luben)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
>>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
>>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>>  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
>>  drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
>>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
>>  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
>>  10 files changed, 72 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index c83a76bccc1d..ecb00991dd51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2309,6 +2309,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>  				   ring->num_hw_submission, 0,
>>  				   timeout, adev->reset_domain->wq,
>>  				   ring->sched_score, ring->name,
>> +				   DRM_SCHED_POLICY_DEFAULT,
>>  				   adev->dev);
>>  		if (r) {
>>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> index 618a804ddc34..3646f995ca94 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>  			     msecs_to_jiffies(500), NULL, NULL,
>> -			     dev_name(gpu->dev), gpu->dev);
>> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
>> +			     gpu->dev);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>> index 8d858aed0e56..465d4bf3882b 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>  			      lima_job_hang_limit,
>>  			      msecs_to_jiffies(timeout), NULL,
>> -			      NULL, name, pipe->ldev->dev);
>> +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
>> +			      pipe->ldev->dev);
>>  }
>>  
>>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>> index b8865e61b40f..f45e674a0aaf 100644
>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>> @@ -96,7 +96,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>  
>>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>  			num_hw_submissions, 0, sched_timeout,
>> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>> +			NULL, NULL, to_msm_bo(ring->bo)->name,
>> +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
>>  	if (ret) {
>>  		goto fail;
>>  	}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> index d458c2227d4f..70e497e40c70 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -431,7 +431,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>  
>>  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>> +			      NULL, NULL, "nouveau_sched",
>> +			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
>>  }
>>  
>>  void nouveau_sched_fini(struct nouveau_drm *drm)
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 326ca1ddf1d7..ad36bf3a4699 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -835,7 +835,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>  				     nentries, 0,
>>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>  				     pfdev->reset.wq,
>> -				     NULL, "pan_js", pfdev->dev);
>> +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
>> +				     pfdev->dev);
>>  		if (ret) {
>>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>>  			goto err_sched;
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index a42763e1429d..65a972b52eda 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -33,6 +33,20 @@
>>  #define to_drm_sched_job(sched_job)		\
>>  		container_of((sched_job), struct drm_sched_job, queue_node)
>>  
>> +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
>> +			 unsigned int num_sched_list)
> 
> Rename the function to the status quo,
> 	drm_sched_policy_mismatch(...
> 
>> +{
>> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
>> +	unsigned int i;
>> +
>> +	/* All schedule policies must match */
>> +	for (i = 1; i < num_sched_list; ++i)
>> +		if (sched_policy != sched_list[i]->sched_policy)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * drm_sched_entity_init - Init a context entity used by scheduler when
>>   * submit to HW ring.
>> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>  			  unsigned int num_sched_list,
>>  			  atomic_t *guilty)
>>  {
>> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
>> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
>> +	    bad_policies(sched_list, num_sched_list))
>>  		return -EINVAL;
>>  
>>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>> @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>  	 * Update the entity's location in the min heap according to
>>  	 * the timestamp of the next job, if any.
>>  	 */
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>>  		struct drm_sched_job *next;
>>  
>>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>  {
>>  	struct drm_sched_entity *entity = sched_job->entity;
>> -	bool first;
>> +	bool first, fifo = entity->rq->sched->sched_policy ==
>> +		DRM_SCHED_POLICY_FIFO;
>>  	ktime_t submit_ts;
>>  
>>  	trace_drm_sched_job(sched_job, entity);
>> @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>  		drm_sched_rq_add_entity(entity->rq, entity);
>>  		spin_unlock(&entity->rq_lock);
>>  
>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		if (fifo)
>>  			drm_sched_rq_update_fifo(entity, submit_ts);
>>  
>>  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 614e8c97a622..545d5298c086 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -66,14 +66,14 @@
>>  #define to_drm_sched_job(sched_job)		\
>>  		container_of((sched_job), struct drm_sched_job, queue_node)
>>  
>> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>> +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>  
>>  /**
>>   * DOC: sched_policy (int)
>>   * Used to override default entities scheduling policy in a run queue.
>>   */
>> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> +MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> 
> Note, that you don't need to add "default" in the text as it is already there at the very end "FIFO (default)."
> Else, it gets confusing what is meant by "default". Like this:
> 
> 	Specify the default scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> 
> See "default" appear twice and it creates confusion? We don't need our internal "default" play to get
> exported all the way to the casual user reading this. It is much clear, however,
> 
> 	Specify the scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> 
> To mean, if unset, the default one would be used. But this is all internal code stuff.
> 
> So I'd say leave this one alone.
> 
>> +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> 
> Put "default" as a postfix:
> default_drm_sched_policy --> drm_sched_policy_default
> 
>>  
>>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>  							    const struct rb_node *b)
>> @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>  	if (rq->current_entity == entity)
>>  		rq->current_entity = NULL;
>>  
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
>>  		drm_sched_rq_remove_fifo_locked(entity);
>>  
>>  	spin_unlock(&rq->lock);
>> @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>  
>>  	/* Kernel run queue has higher priority than normal run queue*/
>>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>  		if (entity)
>> @@ -1071,6 +1071,7 @@ static void drm_sched_main(struct work_struct *w)
>>   *		used
>>   * @score: optional score atomic shared with other schedulers
>>   * @name: name used for debugging
>> + * @sched_policy: schedule policy
>>   * @dev: target &struct device
>>   *
>>   * Return 0 on success, otherwise error code.
>> @@ -1080,9 +1081,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		   struct workqueue_struct *submit_wq,
>>  		   unsigned hw_submission, unsigned hang_limit,
>>  		   long timeout, struct workqueue_struct *timeout_wq,
>> -		   atomic_t *score, const char *name, struct device *dev)
>> +		   atomic_t *score, const char *name,
>> +		   enum drm_sched_policy sched_policy,
>> +		   struct device *dev)
>>  {
>>  	int i;
>> +
>> +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
>> +		return -EINVAL;
>> +
>>  	sched->ops = ops;
>>  	sched->hw_submission_limit = hw_submission;
>>  	sched->name = name;
>> @@ -1092,6 +1099,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  	sched->hang_limit = hang_limit;
>>  	sched->score = score ? score : &sched->_score;
>>  	sched->dev = dev;
>> +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
>> +		sched->sched_policy = default_drm_sched_policy;
>> +	else
>> +		sched->sched_policy = sched_policy;

Note also that here you can use a ternary operator as opposed to an if-control.

	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
				drm_sched_policy_default : sched_policy;

-- 
Regards,
Luben

