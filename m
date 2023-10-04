Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569177B8640
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 19:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7685610E3A4;
	Wed,  4 Oct 2023 17:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A063710E3A4;
 Wed,  4 Oct 2023 17:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQceNfMfWErQV3L8CSlC6gX7Nz7BCKRUeeNBjLP/gr9UdciDpNdMy+H6FlrNVAIlJRCc7Pl3+KKd5Fk237zF9lSsZ9H84pbwxQB8EsNoX3TqtjEhvOtUhRem3YxpBw9AaU8tYZTGG6gI5XpDhwYNQp8dDUocLR/kTG1HbU1qOZNvEkDutm6+xBf7hPyjqxnRiXGPPtOkY+nT3umwgehdfr+Q4/KfsM5JtZUEOkBTx20BRLGhIwqwCoYEY3Nms4L+Xc9humWjno77DAiIqfuBv/1Q57Osgx8TiIPvp+jizArhbbj5e0JwYKTlboKQag3hov4Ufv16EqyIguhWrKIqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED3WJACXf10ehvHcD1LImmTP1REgtaTe89/DJlrkQ+0=;
 b=I7pBoBr61CaFj4bx0BdiDHzROm4+zmEQoryRUQzupk8ccSaVnmHAQZXrtdbL7HpCKZ6JsdTkZTfCRKwvKagXP2Fr2Jouv9UoakD0TwIT2au1j50TpH6l926jedSoeMTjplS8IlmLVtWJ4I8nWehmmyN+jGCa0lbDpRuze8sSg4JJvRX/8gkWnIaXCdsdxkYUIAoEP3TwVHo+5emTUGVm4EVdOJtQPfe5YyALWivFVzzQOS1Tjcz6V959d0rGfFPGIIB8KydRL6rV9uotT8j1mzsPEBJGZbLvEoY2EeD4f/KuyQLo8LFzpTqkEicUpSmnAhUmerIxBtqPxrv8j4jkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED3WJACXf10ehvHcD1LImmTP1REgtaTe89/DJlrkQ+0=;
 b=KOlKGxPetKI5Q4x5wIA0oe8DFxiiT5XpksGSQIC1CjNQZK0hCin8ENhceqbA9wFt2sLBHaexeS6Kyy3EdWEHYnQhWtOKdIc5itcLbP0XtPbN9pUuHOuk/ajNfAfryFA/EJWt7CcZYQOOetSSC3i0qETYOnf/SLlqF+n8RTcCjbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 17:17:23 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f%5]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:17:22 +0000
Message-ID: <0d546c7c-2302-8d51-e37d-da47d9f5a39f@amd.com>
Date: Wed, 4 Oct 2023 22:47:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/2] drm/amdkfd: get doorbell's absolute offset based
 on the db size
To: Felix Kuehling <felix.kuehling@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Mukul.Joshi@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20231004161652.3082-1-Arvind.Yadav@amd.com>
 <20231004161652.3082-3-Arvind.Yadav@amd.com>
 <c0d6ea10-b648-4f44-8ce6-156aefe556f9@amd.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <c0d6ea10-b648-4f44-8ce6-156aefe556f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f8f0ff-6354-482b-8871-08dbc4fdc5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yo9HWra0sgkkWODCIVMBKANZmY+i42j6CWa87PHUC9yPGm9+JBIdnn57M3io1OeC9qSyOLWafU9+QIqhN7O/v/21VjIgeJNoaoOR5ae9T3ww3UmaLzbd3NtJkMX/9wLdhPb/KNJGv4sBS3dXJR11DOVE+6hs+Kh13/D/0wlXV0tzQpioNA7ZCXK5bJLWynr4ZvAQpTvCvBNkosAnkHbMtJZpoRXsr3kjTlyGewM/JnAVPSV0IgC51vtHKbwjfqd2hJcIaNO89tReXlyjCX9nkOXOrgt2qDgrVKTQpqTewP0xqUQl3nr8rnAhe3FlaMZNCiHEz5cfwsRnkHE8dwzz74Zu3QtcSRRLCU7Hyxp/0wpSpxNYlb6/bl3Zh/pVoxaVq5cCB90dQ9/5dgVGtA9exBDVD6nSN8AfanToHzeRdXdsTJY6Lo/ODhi7YtRGmU54nr7tgN4qxBpuf1dBnl0a4ZvhZ3AJShTP4EqtmTPSIyheLM+ydLJPy/5yGey6YUmYDbkN2bXAOHZwUPpQ4t9t332Xc6zZTOyoc6qPTRwppEdjxwwxeRvo8aefPtj/kIKPfr01nTaivLHUaAwI7NamzTddAKbB74aQQBfheWhOVu79dR5rMniiTLXyOz/gRyjuzBiN6Ejdg8TJMTDqFyUimw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(53546011)(83380400001)(31696002)(2616005)(4326008)(6512007)(8936002)(6486002)(6666004)(478600001)(26005)(8676002)(316002)(2906002)(5660300002)(66946007)(66476007)(110136005)(41300700001)(66556008)(38100700002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3E0emhKb2pNM0J4U2JkUFBzdGYyOHJDQWo3c204ZE9hUCtMd24yb2VWZE43?=
 =?utf-8?B?bVpBQi9nbUNSZUM1TC9Ma2F2bkFxMXpqb1g0TGd4d0ovenJjUFc0dmw3NnhF?=
 =?utf-8?B?TDVLb0NrNS9JVTExZmRsOE8zWWdyZmZvTW5ieG04TGlqSUNXUGlMVDM2REFP?=
 =?utf-8?B?OEdIcHg4bDJabmlQbEhhajBjNmFnTEN0STlEREdrUTBEU0FNQzFjNDA3Mndk?=
 =?utf-8?B?NWsrdVYwSk1rNTVnd1h5LzYzek45Qm1ra0hWSDUwaTgrSFFhME5ObHVONGZE?=
 =?utf-8?B?Z2hWTzgzNW5iQmhoVXFSYXM4ajZ5VmV2Y3VOT0dKSkdMaU5VZllwaWdMZThY?=
 =?utf-8?B?ZzBvU1ZGWjJRRU1tKzdMQTNNZUxoUDE5eWk0UmVkU1Y4b2JBME5CTXJTNGFM?=
 =?utf-8?B?anU2aUhXMG1Bcmd1U3kvVzF3c1c3OWJHZExRRkc1TmtkcHU5cEpFSDBjZTcv?=
 =?utf-8?B?bGQ1ak1sTVB5WnYveFc0T25Xc2VBTThOQTl3bStmOGVaN3lRYjhENXptRnU3?=
 =?utf-8?B?UUdYdHM5Y2xTT0hQYTd1SFRPVkEwYXV3dUlCTVNCRjg3ekNHY2FON1VnTVNN?=
 =?utf-8?B?TVNRdkp0S0NFWFZnOUJGeXRQU0k5SDVETXc3NHNpU2QzQ0swcVVQMnpHVzJX?=
 =?utf-8?B?S00xZnMvZmgyZVpCdTN0WkpvaUx5bnBaVDcwTDBFUFUvQy9kRWg0ZUpOejB6?=
 =?utf-8?B?U1hlR1JnMkxRL1ZqS1Rtd1hDMXpwQXZMOVZxOS9KSTIweTVHN3hRY1dJWVdT?=
 =?utf-8?B?UzRJMzY5QnZTL2tIdTk4ckVvS2V5dUhFTitJQ2UrcWVMOG5VSlFhaVhNbVcy?=
 =?utf-8?B?NngzbkZWMnhlZDZGQng5NFgyRk12ZGhwdjFYYVNwOGlSbHdFMjBZSDNxaVZH?=
 =?utf-8?B?c1h5d1doQ0IxRWZNeUM3Z0Q5Ui9WWkJkZmhNWHozME91aDk1NzhzanVnTFBB?=
 =?utf-8?B?eU9NOWIxWHdaNHhMN0xiTnFkbTE2d25MU2NBY2VsdlpxdHd6a2RLZ0JBQUJK?=
 =?utf-8?B?dXlUblJJN2FMNitmTkhuQktHbThzeGxGVFlyeGpiSVk3czNFNldsTWpkQ1FK?=
 =?utf-8?B?bzcxYnBnRUh5Qjg5K1BVQ2M2TStURDh0VE9UdTBHZVVvUmx6aFR6ZEFucmpp?=
 =?utf-8?B?akhoUjVrbFAzamNtZmJNekhVaDFaeW1rUnJRWlR1RnFVOVlGT05HTEZaM25U?=
 =?utf-8?B?RTIxTEVlMlAvNW9lRVFnSFE4ZkVNZDl6UklhMFNrVU00MzJUUkJRTVA5UDNy?=
 =?utf-8?B?b0J0eWU1b3k5RDhuOUlSVnk5bGF3dlZySjAzQ0hYQURXaGVHcUora2dnbzU5?=
 =?utf-8?B?RXdsR3pQanBld2ovdVlDUWtidjVmVE90eDA2N3RsNHBZem8zUysyTXhlUWtH?=
 =?utf-8?B?ZHZtK1VLVnZYaVFpSENBYXBHSU1XTlhkU2F4UWJJeVBVYVhrNFVJZmw4SXhM?=
 =?utf-8?B?TU9ZQnBCbWJ1cktkRCs0NHVZN3RtMVU4SjBvOVVzZ0NGODM1NmE2Rm5mQkVT?=
 =?utf-8?B?R2tyMnM5My9OSTBUUG1BSjl3YzU4UmhJVnFSQ2lXNGVtVElyT05ZNnQzWlkx?=
 =?utf-8?B?a3NDa1Q3ZWVDa09NN2VoSGplS2FxL2pwR0s1OE5tSVljSWVxMExnUU8rNVp0?=
 =?utf-8?B?ZXJPa0ZEamJSU2xYeFd2UFAraVZoeU1JRXBjRVlXbWlkczR5dW9MZ0I4WWRO?=
 =?utf-8?B?bUtGeDFkRk1aeWx5UlpKeFpzNnh4T08vcDVuSjZJeUNIRm9yUFVsb2ZBODdH?=
 =?utf-8?B?b2ZmQjRqdVN6SlRtUkt6NnhhQklIdEx3d0Z2T01UTFdwb3FkaEdtcGlXNUFJ?=
 =?utf-8?B?Y2pLZ2UrT0JNVGlkclhTZ2tVVDV6am9PM2xUaXNNQ2RVa2w0Nnp2c0lYR3pu?=
 =?utf-8?B?UjJIRHgxcU12TWZDQ280T1pWc3FHSENlZ2ErS01hME53VktVbE1KMU51a3Qz?=
 =?utf-8?B?YVJhRDNPcjJRM2ZWb0txZmZtenpSWWoyc1VNZFFLbG5lUGNtLzhhdjlXWmRM?=
 =?utf-8?B?K01aZmE3aG5EcmxVT3hoS01VM0cyekFJQmhVVmdKODZXRnBBSDR3ZUVRdjZS?=
 =?utf-8?B?ckpialJkY3dFalFIT2doYTNmV0Y0WmNPSGdxU2F2RHBhZlArS3grUFRnWGZ3?=
 =?utf-8?Q?fybOPxh8n+tcqWam2641jnphj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f8f0ff-6354-482b-8871-08dbc4fdc5a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:17:22.8636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: of09ZgVkw6+1WQgAm++mebaljxYMMfQE483+i92/XYKXirVfjXXEXsssxJIvCZWkMf8GJIh5A6T0bDukewW7RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/4/2023 10:29 PM, Felix Kuehling wrote:
>
> On 2023-10-04 12:16, Arvind Yadav wrote:
>> This patch is to align the absolute doorbell offset
>> based on the doorbell's size. So that doorbell offset
>> will be aligned for both 32 bit and 64 bit.
>>
>> v2:
>> - Addressed the review comment from Felix.
>> v3:
>> - Adding doorbell_size as parameter to get db absolute offset.
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>
> The final result looks good to me. But please squash the two patches 
> into one. The first patch on its own breaks the build, and that's 
> something we don't want to commit to the branch history as it makes 
> tracking regressions (e.g. with git bisect) very hard or impossible.
>
> More nit-picks inline.
Sure, we can have one patch.
>
>
>> ---
>>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  6 +++++-
>>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 13 +++++++++++--
>>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  4 +++-
>>   3 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 0d3d538b64eb..690ff131fe4b 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -346,6 +346,7 @@ static int allocate_doorbell(struct 
>> qcm_process_device *qpd,
>>                    uint32_t const *restore_id)
>>   {
>>       struct kfd_node *dev = qpd->dqm->dev;
>> +    uint32_t doorbell_size;
>>         if (!KFD_IS_SOC15(dev)) {
>>           /* On pre-SOC15 chips we need to use the queue ID to
>> @@ -405,9 +406,12 @@ static int allocate_doorbell(struct 
>> qcm_process_device *qpd,
>>           }
>>       }
>>   +    doorbell_size = dev->kfd->device_info.doorbell_size;
>> +
>>       q->properties.doorbell_off = 
>> amdgpu_doorbell_index_on_bar(dev->adev,
>>                                     qpd->proc_doorbells,
>> -                                  q->doorbell_id);
>> +                                  q->doorbell_id,
>> +                                  doorbell_size);
>
> You don't need a local variable for doorbell size that's only used 
> once. Just pass dev->kfd->device_info.doorbell_size directly.
>
I have used local variable to make the code cleaner but I will remove 
local variable.
>
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
>> index 7b38537c7c99..59dd76c4b138 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
>> @@ -161,7 +161,10 @@ void __iomem *kfd_get_kernel_doorbell(struct 
>> kfd_dev *kfd,
>>       if (inx >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS)
>>           return NULL;
>>   -    *doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev, 
>> kfd->doorbells, inx);
>> +    *doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev,
>> +                             kfd->doorbells,
>> +                             inx,
>> + kfd->device_info.doorbell_size);
>>       inx *= 2;
>>         pr_debug("Get kernel queue doorbell\n"
>> @@ -233,6 +236,7 @@ phys_addr_t kfd_get_process_doorbells(struct 
>> kfd_process_device *pdd)
>>   {
>>       struct amdgpu_device *adev = pdd->dev->adev;
>>       uint32_t first_db_index;
>> +    uint32_t doorbell_size;
>>         if (!pdd->qpd.proc_doorbells) {
>>           if (kfd_alloc_process_doorbells(pdd->dev->kfd, pdd))
>> @@ -240,7 +244,12 @@ phys_addr_t kfd_get_process_doorbells(struct 
>> kfd_process_device *pdd)
>>               return 0;
>>       }
>>   -    first_db_index = amdgpu_doorbell_index_on_bar(adev, 
>> pdd->qpd.proc_doorbells, 0);
>> +    doorbell_size = pdd->dev->kfd->device_info.doorbell_size;
>> +
>> +    first_db_index = amdgpu_doorbell_index_on_bar(adev,
>> +                              pdd->qpd.proc_doorbells,
>> +                              0,
>> +                              doorbell_size);
>
> Same as above, no local variable needed.
Noted,
>
>
>>       return adev->doorbell.base + first_db_index * sizeof(uint32_t);
>>   }
>>   diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> index adb5e4bdc0b2..010cd8e8e6a1 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> @@ -375,9 +375,11 @@ int pqm_create_queue(struct 
>> process_queue_manager *pqm,
>>            * relative doorbell index = Absolute doorbell index -
>>            * absolute index of first doorbell in the page.
>>            */
>> +        uint32_t doorbell_size = 
>> pdd->dev->kfd->device_info.doorbell_size;
>>           uint32_t first_db_index = 
>> amdgpu_doorbell_index_on_bar(pdd->dev->adev,
>> pdd->qpd.proc_doorbells,
>> -                                       0);
>> +                                       0,
>> +                                       doorbell_size);
>
> No local variable needed.
>
Noted,

Thanks
~Arvind

> Regards,
>   Felix
>
>
>>             *p_doorbell_offset_in_process = (q->properties.doorbell_off
>>                           - first_db_index) * sizeof(uint32_t);
