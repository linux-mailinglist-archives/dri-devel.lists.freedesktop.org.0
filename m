Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052857B2150
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526110E680;
	Thu, 28 Sep 2023 15:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FB810E695;
 Thu, 28 Sep 2023 15:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZPqAWQKkeVHhWeOVQpYfth8LSREkHDe75NDyE39qd5tGxlsGBIHmw8569+lqG82NAyV0n7GRueFp5J4UbFtYgpuT3Za4j5SKOjuSLl0dCeRSGWp98mw4Ws5F7chWxaTlFOC0RmGC278r43fZ2RZb2QkEBWdEDSkladZWVJoQptErPjWdRZXYT+3/Zrj4s2T6flyd260Hmm6IPLDX/E71EMA8UdkHbeyILYThNZfie2dWMFNhYr7MPDeXWj0arFPrAZI7n9+nEjYYD0/sZKfg+GHkJCIaV9RlkWDz/NZItMwoEm3NG/K+Z7GDtozweOdKXJ5Qj7f/C+6gVmmjgmXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+8/QiH+/Ipe1z7QdoLgtU2ajQ9wiFwwhJXWTRxbm8g=;
 b=UU+bWzlTBbdQ79jfm/Cg/F1Es0Shjsal3AJI1Td9MxW0bSj0jvQnxtJOPiNhea8c+5vhIQzPSQmXPPy//3hnHunEsqdGndiIl7+KRAL6HNwvYgGXg/3CMAlYEC2Oyahzafv9LrkS+D1+YoGUQyY82wwV/5GU2S4uqnisXPDLBsGXYkZlsJimpuf1RsJRcbl5M2tKwkaTo6CPlH91MDjMxoAxnHIbfTmjvWzrv17NKDizfYsEcSFl2eYG3YIrqIOB2kTO91MIpb6U5vsGWjJmKKJE3Pgn8ErSgvCNDfE1TTMpblwuW5Rj3guJKOgubqRy8jafOHiueRSC5YXPpWpqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+8/QiH+/Ipe1z7QdoLgtU2ajQ9wiFwwhJXWTRxbm8g=;
 b=d0SpshFIOKvAuIfklu4ckaI7412kZ0N14ejL4OEHyDBL7Qlv/pDPfXCirdG5vkuYrhOq82X23g+whMaDmmjtQU1TZQVYqFCleXM4v2e7WtvUnVnYikksk37qDjyhQ2+0VvexqmLtdKRjg2I4Vnfq6K8cUvg/8gF5Ee0Lob9WshM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 28 Sep
 2023 15:30:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 15:30:26 +0000
Message-ID: <8cd0539d-5d5e-e670-9577-7db72393b784@amd.com>
Date: Thu, 28 Sep 2023 11:30:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230928095427.4337-1-Arvind.Yadav@amd.com>
 <20230928095427.4337-2-Arvind.Yadav@amd.com>
 <DM4PR12MB6445548E05C8E3B29AAEAFCAEEC1A@DM4PR12MB6445.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <DM4PR12MB6445548E05C8E3B29AAEAFCAEEC1A@DM4PR12MB6445.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a91899-cf05-4190-7ec2-08dbc037d6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jq59IQcVO5GLHRWtCdRk42iNwa12DgolNpzSmZHnBfr7uIAzuloNfpSbc5jNjpo0pGJNpCChyLMX771eAlIuVgFRuWqxiSsotmcAKGd3L31SRn9Rz1PahE7EeplVKkKn0vLr1xcGdAckWGWRkl0PAQHMfEUkgqQA8Dwcl7rs+VA9yEJYonbH1eGeSAUWQYfouGdVj9u3NgduBtjRIqtaSKH2E+vP/DZGu+CL5RsjkdnWd07vHm0zvhI1hDd7lFqRRCFR6dWr/FPY9jI0NAxq0d7DC/xotevX7JEXOdM6P4kHl60U5zgT9m+sC9+NhYzE2i//AgEDJaAlYP9BiAFeVivjgSF70Fhx9KOKb2bTcTD/zbV8FxIl0FFhpSowNJ1JaqgkfPctqcq6zpwXavwVdMgKFITs/ken9Bm1JVPv6f9eGIEKnjgQmVz0HLv1ZcrL6h+AAkWrKZpVhCDMilO8XniBEAZXeIFFJ8rFTPL+0tPFdvMOVWjpHnvWpN1QVqEWPxllZckJPGaT8ZsmyUVxZdeNJ4SwuNT8Z3vlSLg714Z+v2M521TY4mYj+4uBX7SNkY0J67hVBJhZJ8cO268KL2hOgUFtNs31aRz8eSWNZkTfkvTR/wQurVWTAJg/Eqka7APDVMbUHdtBbBLo+/h7CPzrmErQ7MfIU081w/Hw264=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(36756003)(31696002)(86362001)(8936002)(110136005)(26005)(66556008)(4326008)(5660300002)(8676002)(54906003)(41300700001)(44832011)(316002)(66476007)(83380400001)(2616005)(2906002)(6486002)(6506007)(478600001)(53546011)(6666004)(6512007)(36916002)(31686004)(66946007)(921005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEt2dXJJSHFXY3V6NlJaWjJuU1hUcE1UNTZXTGZYU1VrSlBaRnFOcFhFSHdL?=
 =?utf-8?B?ZEhUSkJvcGtIbFFmTEFvbGc1R29rM1pBRXhYSWNldkMraXV4NkErWVhUeUkv?=
 =?utf-8?B?QUI1SEFKcnhENytMemxTZjNjc3JPTkNKdmczd21jK3crTXMrbEtSem5NcmJ5?=
 =?utf-8?B?cElyMnp5VHdlOEZla2JRMkdNV3VWcGRQWG50SVZGVUNXdVlpWW42T0F0Wnhp?=
 =?utf-8?B?MGlubXhmNGxVY1dmeXUxcmN5R2FHZ0cxRVQ4Qk8rU3RyUWhCRmJSenZtNWVu?=
 =?utf-8?B?aVVCY2F1VFVUTkZwQTR5YkUzZzdtVEp1NGwzNjQrK21sUWlXTFBjdC9EWkFq?=
 =?utf-8?B?azNiTGFnR091ZWlpZFNnTUZvc0tIeTYyRTJUR3RZdStYRytUNmo0U3dJRXJP?=
 =?utf-8?B?K3lrZTlNSERzSDYrMHdpczN3S1pGYXE2VkMvUzhqQ2JUT0NrMUx0MTlQek8z?=
 =?utf-8?B?YkhDQittYStuWXdvV1JtWlBhWmhPVVcyekhtTXZ4S1lra3UzOG1DbmJvaDhz?=
 =?utf-8?B?b1d4RFJSdkE0NVIyOVcvWWVnTjBqcHVTWVVrOVNMV1c4ckdHcEZtZzliTnA3?=
 =?utf-8?B?TUo2b2pXN1ZOeVVUY09EUERZdFdyTXpabksrOXlvNlUwb290T1NUZWdaUGRN?=
 =?utf-8?B?dERmditndytmbEVrcVk3a29NbGJlWHg4VmllbjBxWkFQRnNzbDczWkJBTlBF?=
 =?utf-8?B?S21rSWZHNytVdmJtN2RmRjdMN1RMQURnMXBBVmw4bVdrYUQwUUtIR1plZ3NJ?=
 =?utf-8?B?RjVkeHlaTnZpVXhkZkVkQ0IvenpZM3lCeFpnTFVuL0lrMHZwTmo3VWwxVVoz?=
 =?utf-8?B?SkpwK3VSMHdtM3NUZHF4cGRiR2FrcFBPMkxYWTNMZHgwVmRjem5yNFNEalpI?=
 =?utf-8?B?bVJXQWxxczczS2YxMjNOLzVtaVBmelRHcHUxN2dEQmJxWm1MR3hSazBGQ005?=
 =?utf-8?B?aUtYRGZGYlFzMG9TdTdDbDhFbnFjR0FZWHphY3lDUW5yZm5LRmlpczd2d1Yw?=
 =?utf-8?B?cjRKUmNtSytxeW9ianJSL3FIMk9PLzJEZkZOZVZOSW8wUE4rRDNrWlRBZFFx?=
 =?utf-8?B?R0RvWHRibWFNQW10YmxXanNUTzNoblNNYzVGc0JXbFVKclNGRlRncjZ1NGwx?=
 =?utf-8?B?SzRSaUlpcXJ5SkNZYjZoK1l3NW1qZ0FhK2pmNWVnWTBDS29SWjF4b1F3bTRP?=
 =?utf-8?B?U25mazVjUkhUU2JxTUI3MHpaMHBWZG40VXR2TnViUU10dE5OMzBiYjkreGhu?=
 =?utf-8?B?ZnhiYS9TYVQvY3JWR281cW5PU3NaUHBTTm9wOVdrSHIvRWRQQVgyb0NaamNp?=
 =?utf-8?B?N2ROcXlKYWVoOE1ZTXl2cGxXUDdNZ2Zyc1VwUXc1djYxS2xFRC83ZlJnS3I2?=
 =?utf-8?B?VGwyS0loNWZ3SDRRSXBQTXlab2ZKUXRqN2F5NVg3cXp4cS96K1VuWGlVM0dq?=
 =?utf-8?B?RDNGRzlET2tENVZsU2crVVVSWFFpNUxna1VmcHNwdm1HejRaOWxQTXZMTWg3?=
 =?utf-8?B?dWpYTmczSW9ubTh5M0Y3OUJySlQrd2M4a1hMdDFudVhnK3Q1dVdwTlBoenhG?=
 =?utf-8?B?Ym16NGZVMkMvaHhRRDZxK0UvVzdSSHZGMjlJTCs4L3N0S1BvR3JneHo3TWZH?=
 =?utf-8?B?K3FWL0Q1R0wwRVk1MnJzVy9hT04xSzdmdmVCMTNlam85TG9SUnN4QW1ZdXJY?=
 =?utf-8?B?RWhRMFVzTk1Da1B2ZXR0TndieUZ3OEVaY2VoWTBkd25hYmpQWUQzREwvdnVN?=
 =?utf-8?B?VzBkdnNNc3ZYVDlXRkZDb0tTN1ZZZWc3dThDT2JacUlKTCtDTloxQzA1ODY3?=
 =?utf-8?B?eU93cWdHZmhHU1dtcFZGcFFjamt0WjRUTVF4S0Y5dTFCT2psZ3JJVXJGU25i?=
 =?utf-8?B?c2txTGMzd1NOVE5hQWlDb2xqWDF6MGZHUTZqUEhnTEdYc2VSYjl3ckJsaVNk?=
 =?utf-8?B?aytWZG1Pd2grdExPZG5aUnB1SVZjYzFwZlpZcWxJck92QVZPV1dlRjVtam1I?=
 =?utf-8?B?N0xFTFlsNDlGUURKMkVFUktqTFQ5bHVhWlRrRHJxUWRZNGlBeEtJVHFDSDY1?=
 =?utf-8?B?UHVyK3pOZVhONzc2aFRTNUtzQjZRR3ZqTmRNbzE1YnR5T2RoME1oUzUxRHVB?=
 =?utf-8?Q?9OAj4yUuZXiku+3jPhRvFl/Bq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a91899-cf05-4190-7ec2-08dbc037d6f0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:30:26.6103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCfg5Q3xLww1nnE1R9TUnTPxUMBGGXgDZt+9FJaJoOeYddFoeZ5bjY8w8PhTsSIq9aIBCZBoXV56d5afEHe4vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-28 10:30, Joshi, Mukul wrote:
> [AMD Official Use Only - General]
>
>> -----Original Message-----
>> From: Yadav, Arvind <Arvind.Yadav@amd.com>
>> Sent: Thursday, September 28, 2023 5:54 AM
>> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Sharma, Shashank
>> <Shashank.Sharma@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>;
>> Joshi, Mukul <Mukul.Joshi@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@gmail.com; daniel@ffwll.ch
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org; Yadav, Arvind <Arvind.Yadav@amd.com>; Koenig,
>> Christian <Christian.Koenig@amd.com>
>> Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
>> for gfx8
>>
>> This patch is to adjust the absolute doorbell offset against the doorbell id
>> considering the doorbell size of 32/64 bit.
>>
>> v2:
>> - Addressed the review comment from Felix.
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 0d3d538b64eb..c54c4392d26e 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -407,7 +407,14 @@ static int allocate_doorbell(struct
>> qcm_process_device *qpd,
>>
>>        q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev-
>>> adev,
>>                                                                  qpd-
>>> proc_doorbells,
>> -                                                               q-
>>> doorbell_id);
>> +                                                               0);
>> +
> It looks like amdgpu_doorbell_index_on_bar() works only for 64-bit doorbells.
> Shouldn't it work for both 32-bit and 64-bit doorbells considering this is common
> doorbell manager code?

I could see this argument going either way. KFD is the only one that 
cares about managing doorbells for user mode queues on GFXv8 GPUs. This 
is not a use case that amdgpu cares about. So I'm OK with KFD doing its 
own address calculations to make sure doorbells continue to work on GFXv8.

It may not be worth adding complexity to the common doorbell manager 
code to support legacy GPUs with 32-bit doorbells.

Regards,
   Felix


>
> Thanks,
> Mukul
>
>> +     /* Adjust the absolute doorbell offset against the doorbell id
>> considering
>> +      * the doorbell size of 32/64 bit.
>> +      */
>> +     q->properties.doorbell_off += q->doorbell_id *
>> +                                   dev->kfd->device_info.doorbell_size / 4;
>> +
>>        return 0;
>>   }
>>
>> --
>> 2.34.1
