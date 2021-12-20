Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD6947B564
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 22:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984F10F4B9;
	Mon, 20 Dec 2021 21:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D5810E284;
 Mon, 20 Dec 2021 21:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4uX7KstNg1Y4mnzHfMtoVpCVv1emb8CnMTbiVriEN7XMQyJhmyq+Z/C3HMLRRwuHt7E0erUuwmi8J1o/MJLJhW7rYV+ICj+oiLrH43GIWQfqjPkkfu4SvH7MEkQiETMqENeDSxO6L3Bs6HwL+lYsYSXYAY05plGwcfT5KVDl6QsRC4mIOH4N5XZg+ejZxI7okgVdFDmp7Z2Ax1S3tirJEbcpvyora3Pm+AxZAH6g+UPtU/qDPu8dgZLgTFmzh8UD8dCOtzoC+LY09LNBHTu/sSLMm6rSnbGq3GkbO6DeSi9PDbyvyXILCxYyzAiQMF6xNMjngXGfCV/1Mqo8BFvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfyUEMLP33MIhHG28/tJZJPbegeA17IP8YFgOQKqyiA=;
 b=I+LSnYzMYO3afGlk0A270vPH+dooLnQtb4BmuFD9Y/h+ZjnU2LwBrPDgO8sMzHS3TQIVFbITdgUme8GrNpllb9msr0QrZV3S4Jt0nnGEjz11QlGdMHMLTGE3s22UDSu8Ds3GdKiC5rNKErde06Brg8iWuXTN8B0d6QWQJpVQgNxck+JceoKlkrnhbBjnF8O2UXOdQxoaMGzVqVJQIT1AqePkhcPqQFQEA7pVD7SA7DcHq22eKqy2RNXFu92G2mCABGUaqIpc9fKe3rEvoEX5+tiNHMsYVSwq51PMz8S3roWKIStiBFvjiTx9KPS0NG/STP5RiGfEIam5fBRmETs2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfyUEMLP33MIhHG28/tJZJPbegeA17IP8YFgOQKqyiA=;
 b=dwXObOzAyOhwJ+XHRekB4ElPInZKUTuaOF19GNzZMtu8NoDCZownfMjQTxzhbpyRgH2xbNo0KeoX826A+xCJgiSFPw3bWWixlzRZ9wpAJYHCIxPUWh1UnzCrG2Y0NhOrdNwl0+/PARyYTL370g4UYKN1MzrmEndYDjGuex6S2Tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4746.namprd12.prod.outlook.com (2603:10b6:5:35::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 21:51:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 21:51:33 +0000
Subject: Re: [RFC 2/6] drm/amdgpu: Move scheduler init to after XGMI is ready
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-3-andrey.grodzovsky@amd.com>
 <d7872062-e99a-03be-c52e-d27a7022de09@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <98c9e91d-adb8-3ee9-7c4c-567c214c34a9@amd.com>
Date: Mon, 20 Dec 2021 16:51:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d7872062-e99a-03be-c52e-d27a7022de09@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BLAPR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:208:32d::12) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43eee1a1-9bf5-4ad1-be9a-08d9c402e35b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4746:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47469477CC1DF23A9DBEE477EA7B9@DM6PR12MB4746.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSMtlkaMAA4lHI6WWRQ1W0P1c1PkV4nsvxlKijyaxp+QcXtR42Dx6LfsBDttm0To3c80+ySoJ4j2YzrKAzP1nqqggGxtxSbPm4PGUR1tzHCSI0B6/WNRZvYINVb27E4QCVRHdOApIhknoe0Q3N+wq0ipXmY2UlC4YdNNRe8eW2cz+MZ1j0JT/uWnvy7k1/22v4wlMLVJ+s5f5A+WCL1LvkD9KPQ3eum5Ya+cDDVxBotuyfBDEaLkdrtQ58iqivp6f1HF/K9npZB/HzkCoDB83qnuPpa37OIBYTuWS6aPKppyzO3HVgATr3LJocoZDaQcq5WN7nv06AEGYB9k2WbfSiv1QLgqkcrFc8eHL274ZCiBBe6rQedcdsUMJ1ZEM2l3A0sMhE1DnfxjZw5Zn2QBqbHpiOQNwBlMke4iqKOpqnPtuIBD3VJZLsNICwCeoGTlpWkW6qCsw1w6m6jyrKs68iMZYtXzc8UqnTv5BLgBIQaeV1KTcvuqe2D87kYIF0p1PeUnUHRAfJd3/DdEtx+CxasAYLKXTZwlBC7bfw6JTvGayRtQRuDZTZleCJfRvFR77nrQldEGr43bJggWv5cxT7raWUuP6WjwBDRQmBIwgp1ghq046u9xhzrD3uIHRRx0YuCNWyAl5Z+6fzSr4wxdEZ66wcDIxn+K6aiDNRUQZMPmruc5Sc4O6hGmM/Ut6MDoIQZubZEDob0fGN7wvz4+lK5u/99mqQLPPXlakPeOTEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(66574015)(316002)(4001150100001)(83380400001)(31686004)(86362001)(8676002)(44832011)(31696002)(66476007)(2906002)(66556008)(186003)(6486002)(8936002)(36756003)(66946007)(53546011)(6506007)(5660300002)(2616005)(508600001)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFc4ZHQrOVkxRkpkTGtUVWFweklWemViWWRHem5SR25EM3d6QnJSQjZvRnFl?=
 =?utf-8?B?cnJBYlphOXdJdkFLNmd3b3NYVXJBczlCOUZvdk9GcWcyZFp4U0xrbVpQcDdT?=
 =?utf-8?B?WjIwK2ZSY3djUE9KVVVqeGZoUG0veVl2V01QckRYZFhCZjZ5cDYwYkN0bmla?=
 =?utf-8?B?Q0ZvaDhaZm1XTGtic2FXbjkwaWRtVGdyOU5vKzBiMm0vd2ovMWhobittSCs3?=
 =?utf-8?B?dGtMUk83bXYzOUpUUm9SN0p3cnBDMXQ0dlBFdnQ3Snd5WGd6aEwzcjl0WEpP?=
 =?utf-8?B?RFZ6Zi8zTVdLWmd4TmE0RVp6ZzZHOW9GajNBMkxnSkIvWmNXaTFJcm5iR3d4?=
 =?utf-8?B?Tk0yNHJxSGxlaUt5SDRQOVR5OVVXVWNlQmtmeGlFUElGNVpZSU9UMVRFYkxa?=
 =?utf-8?B?KzlkWGtMTjdYTmlsaW1QbVg3UGhBeTlrTEFQbzlnWlZlU2pITTc5MmZXVlhn?=
 =?utf-8?B?aFp2MWxaRmJBQ2lNS2VFVkMzSVZ0THJGSERxZkdiNFRSdHM0SXB3cFptZ3V1?=
 =?utf-8?B?Vit3eDdqK2hTdHNwejg3NVcrd2V5N01QL0pSWFN6d2tNeG43eUtSQWFWbG1U?=
 =?utf-8?B?Q1Z1OEFLVzZ3SDFkMms4RHhhbmoxc01lL25FZEFkQTE1Y2xoYUg3Q3gxbnc1?=
 =?utf-8?B?N2NKT25mQ3dtdjlxWkZOMXBObzd4Z3pwemd2czhTRHc0WkJiMmhBQUxnTGN5?=
 =?utf-8?B?UHhkcHZLNFIvekZXNlF3ZllqQ0lrdXNnQkNCN2RtSG5qY2VWWHNDNys4ZXR2?=
 =?utf-8?B?L25GRHVjQ0RmN1lQR0J4bWhHemw2YXdFbllhdnl0VEhpUlRicldRbXFQY25n?=
 =?utf-8?B?N0pRdW9DZGNEVi9BcXRYVVRnWmRtWkwydkIvM3ZPQTlQLzI0enU3UGo3dDNR?=
 =?utf-8?B?d1ZWc3dhcXRkY1EyNnBoclRzMDNBakNXNFk2UGVQRlJQaTd6aWt3elVBSG94?=
 =?utf-8?B?ODlJR1N3OVJKTk1hWWVSZE1BbXYvazVYRmJDeDFtMkFOaXEydkxhekwrU2o2?=
 =?utf-8?B?Kzl6Zi9QQW0vSk1OMndWSzlGQkhwYXYzT21xZGJJV1U5S0IrYm5zcVVmMEVW?=
 =?utf-8?B?NXh2eDZoRGRvYmxXMGh4NnRlU3p5c09kSU1vOHlpOTlGUStMZC9Fd0hEdlVF?=
 =?utf-8?B?MUx3UGNzMEFMbzJYTCtiZjV3R28veVNOTkw4WEFSQ1NTajNsdkhnUTRzREo0?=
 =?utf-8?B?VGdKNkJTdWx4QnpZMUhRaGoxZExSb0V5RENzRS9wWmhoR05YeXdZNWlHRmJu?=
 =?utf-8?B?LzY1WlM1SytkOHd5cmxla0lBUzFkRUQ5Q1h2V3VuTzQ1aVVOZnRsOEYvaDg4?=
 =?utf-8?B?c1phbUpHNEM0Z0NBeGszMmlTVU5iUmRmYTk3aHZldUpiaElGMUh4emt4a2l6?=
 =?utf-8?B?K2xYVWpMQkdteHA2UHNpUnZWVkY2akVsYmFmbjhkYWRTTlJMdmlrbnAzdHdD?=
 =?utf-8?B?YUpFT3h4ZVJMbUhNaVZKUzErUVp0YWFsbDhkWkxzZ1dzMjdyMEFXUXFyTVpQ?=
 =?utf-8?B?Tjl2OWtJQ1lnKytqb21DcTgwVndTdVFtbldtYWJvQXJmMXlqUmQ4a1hUbW4x?=
 =?utf-8?B?S2FrNDNKL3kzQ3l5VDlLcklRZUExdDNaNC9SQkN3dFhYWjVydkRZOVpWaXRS?=
 =?utf-8?B?OXRFc1Z6blpYNHlES0k5dGpOcThFK1RmZnlXRkpaQm5JU2t4UnpxcUxWRm93?=
 =?utf-8?B?ck5Jb0lvRWZIVHVCV1Y0UUFyODlSbjFpN081aHF5ekUwckFzOXhlRTZnbWd6?=
 =?utf-8?B?K3l2RFlWUUxpNFF0eUt3MHNhbm8vSmM5SWpTOEFDNC8xL2RxQ0U0WWdJV3lk?=
 =?utf-8?B?eE9MbFNiRFhRYjdVMDV0Qmkxb3A0Zm4vSzRvY3FRNG5oeXBEaU1yL1JJNHhI?=
 =?utf-8?B?aWZKL095cWcwV1JRRkhxb1c2bCs1OFV0cEJodjhNejU4ZXd2cStWNFhGOWVy?=
 =?utf-8?B?V2hFMXJHck00b2F5d3d3TjJvUUxBdkNKOW5CVG5INVdiYWY0T2oweGliK0tt?=
 =?utf-8?B?RWo1VmtTRFRsUUdJaUhlM2d3WFBVNTQ3SEo0Nm1VY2JCRldVcG5KYSt2dnNU?=
 =?utf-8?B?OHhxYXBhS05nbkY0bk5Bd2dkM0JZRVRHbDBKb2hJOWI3S0dnODN2VmZia0x3?=
 =?utf-8?B?a3lMejRLUDU5YmJBM1pDTUc4RWtQTitBOHhXVWlDZGlIOW5WRFBNSkF5NDJr?=
 =?utf-8?B?bDA0ZUt6bjRlS1BqUS9wTlJ6Y1ZDM3FRdG84L016SzBNZGxKRDdrNTVhN1Jk?=
 =?utf-8?Q?92suPg2c+1A/sGFqInlLSLPyvTBhL8iCzTXvoHgiBE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eee1a1-9bf5-4ad1-be9a-08d9c402e35b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 21:51:33.5398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnQ5hPigy87AGzBexMCTBoYwZ8CU6c1I5ABJ1qIGwo0eBC07nsg5+WilacD71VWf9vBGHEhBUoiFjenRG7K9Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4746
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-12-20 2:16 a.m., Christian König wrote:
>
>
> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>> Before we initialize schedulers we must know which reset
>> domain are we in - for single device there iis a single
>> domain per device and so single wq per device. For XGMI
>> the reset domain spans the entire XGMI hive and so the
>> reset wq is per hive.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>   3 files changed, 51 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 5f13195d23d1..b595e6d699b5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct 
>> amdgpu_device *adev)
>>       return r;
>>   }
>>   +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>> +{
>> +    long timeout;
>> +    int r, i;
>> +
>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>> +        struct amdgpu_ring *ring = adev->rings[i];
>> +
>> +        /* No need to setup the GPU scheduler for rings that don't 
>> need it */
>> +        if (!ring || ring->no_scheduler)
>> +            continue;
>> +
>> +        switch (ring->funcs->type) {
>> +        case AMDGPU_RING_TYPE_GFX:
>> +            timeout = adev->gfx_timeout;
>> +            break;
>> +        case AMDGPU_RING_TYPE_COMPUTE:
>> +            timeout = adev->compute_timeout;
>> +            break;
>> +        case AMDGPU_RING_TYPE_SDMA:
>> +            timeout = adev->sdma_timeout;
>> +            break;
>> +        default:
>> +            timeout = adev->video_timeout;
>> +            break;
>> +        }
>> +
>
>
>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>> +                   timeout, adev->reset_domain.wq, 
>> ring->sched_score, ring->name);
>> +        if (r) {
>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> +                  ring->name);
>> +            return r;
>> +        }
>
> Maybe better put that into amdgpu_ring.c. But not really a hard 
> requirement, more a gut feeling.
>
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +
>>   /**
>>    * amdgpu_device_ip_init - run init for hardware IPs
>>    *
>> @@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>           }
>>       }
>>   +    r = amdgpu_device_init_schedulers(adev);
>> +    if (r)
>> +        goto init_failed;
>> +
>>       /* Don't init kfd if whole hive need to be reset during init */
>>       if (!adev->gmc.xgmi.pending_reset)
>>           amdgpu_amdkfd_device_init(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index 3b7e86ea7167..5527c68c51de 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct 
>> amdgpu_ring *ring,
>>                     atomic_t *sched_score)
>>   {
>>       struct amdgpu_device *adev = ring->adev;
>> -    long timeout;
>> -    int r;
>>         if (!adev)
>>           return -EINVAL;
>> @@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct 
>> amdgpu_ring *ring,
>>       spin_lock_init(&ring->fence_drv.lock);
>>       ring->fence_drv.fences = kcalloc(num_hw_submission * 2, 
>> sizeof(void *),
>>                        GFP_KERNEL);
>> -    if (!ring->fence_drv.fences)
>> -        return -ENOMEM;
>>   -    /* No need to setup the GPU scheduler for rings that don't 
>> need it */
>> -    if (ring->no_scheduler)
>> -        return 0;
>> +    ring->num_hw_submission = num_hw_submission;
>> +    ring->sched_score = sched_score;
>
> Probably better to set that in the caller and drop the parameters from 
> the amdgpu_fence_driver_init_ring() function completely.
>
> Christian.


I noticed that at least num_hw_submission is validated within the 
function so not sure we should then discard the parameters.

Andrey


>
>>   -    switch (ring->funcs->type) {
>> -    case AMDGPU_RING_TYPE_GFX:
>> -        timeout = adev->gfx_timeout;
>> -        break;
>> -    case AMDGPU_RING_TYPE_COMPUTE:
>> -        timeout = adev->compute_timeout;
>> -        break;
>> -    case AMDGPU_RING_TYPE_SDMA:
>> -        timeout = adev->sdma_timeout;
>> -        break;
>> -    default:
>> -        timeout = adev->video_timeout;
>> -        break;
>> -    }
>> -
>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> -               num_hw_submission, amdgpu_job_hang_limit,
>> -               timeout, NULL, sched_score, ring->name);
>> -    if (r) {
>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> -              ring->name);
>> -        return r;
>> -    }
>> +    if (!ring->fence_drv.fences)
>> +        return -ENOMEM;
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> index 4d380e79752c..a4b8279e3011 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> @@ -253,6 +253,8 @@ struct amdgpu_ring {
>>       bool            has_compute_vm_bug;
>>       bool            no_scheduler;
>>       int            hw_prio;
>> +    unsigned         num_hw_submission;
>> +    atomic_t        *sched_score;
>>   };
>>     #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), 
>> (ib)))
>
