Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98967B0B8F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 19:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15B10E58C;
	Wed, 27 Sep 2023 17:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203FD10E566;
 Wed, 27 Sep 2023 17:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXxB/gmHAXj7fyT+WfWkOKpPgAYGYsy408OegSYfHueGQQvglZ1cTO6RUhuvTR3m8u/hT+kTFpNlaQQb2MZbNVC2UtM2wQrsGXnxZr0UPFT1S64g3zLl2mcNylexSxH6A5Yr+BzQBASU2ujpDP9qbRtPGvZsy9N8P6W0Rz4+iF5NbQeGuVxmd9A020FVt+QSXt7QWsafuMEmZswe8J1+4GFUCWWA1nnsJePpj3snTqEQGCBEI3K0YoHmWyhzsKO5pmjM43FyVdsxvFScyjx0UDN5yC+J6hS7TuIx5e8EVBMrVFi/e3CZ584gyLTMljuFkHX8DWox4I+YwRRPaSVueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWuoXDIeCaCk/6dfYJVaYDrhnPHLBl0alUwFFtJ8Ywg=;
 b=eSh9JUGBEPLHmHlKV7RKRXmdIWR4DU+tB2LE9ZFA+ov9nMy6GrVEXR/hY+7XLM855p2iCZhhchotSfiVIIPDgLnCH34MP5KD01wBbp05Wv8xjX+8mkKsfyn7uJRThkhPALrFMTKUyBUh6jEAPe4chY3g6/WSHkUafHltG2EgZdGdU5cDNYHjfu9jyi1TznqzojcYXfcsB+X5yg6n5XjaH/CwytEI+2FlFg8Ci+KykpneJN3UXVzaNATSMZtPNVZ5NPziukIbTjKu8xGGFELlOxVXF9Q/3Rn7Q4691b7yNVFg+AmVeroZEFfhEwtxQXikpojWR3t+biAcomzRLhfy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWuoXDIeCaCk/6dfYJVaYDrhnPHLBl0alUwFFtJ8Ywg=;
 b=dw542m1R5fr2zimoBbijElo3nwOV36vIsB0I5/cPiSqzP7ECEdfpC/2KP6kCXR8IfNClyhXfFciEYORZaFQmUQoaP/Z/IapySP9eUlTLFsMeFvn7HAF/NOF7thf0wTtsPy/LgwEKg08vDisNCnEyVjRkRb2aLL4cNvhJ7YSvMOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.31; Wed, 27 Sep
 2023 17:59:47 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 17:59:47 +0000
Message-ID: <1fb85296-6f2a-57d7-e443-7fa92699cb59@amd.com>
Date: Wed, 27 Sep 2023 19:59:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
To: Felix Kuehling <felix.kuehling@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Felix.Kuehling@amd.co, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Mukul Joshi <mukul.joshi@amd.com>
References: <20230927161616.3335-1-Arvind.Yadav@amd.com>
 <20230927161616.3335-2-Arvind.Yadav@amd.com>
 <a893f9d9-3cc8-44af-9712-602a7b72f780@amd.com>
Content-Language: en-US
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <a893f9d9-3cc8-44af-9712-602a7b72f780@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::11) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c81a573-23ad-4afa-ba5a-08dbbf83894e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqNaTyUseFoe4Ai9F2tloSaeB5ZIzOq5J7p44uQzIzxylLvUPZk3woudHd0FsT70ckZC1nFj96I4mx1vp1Ss4MCWEtxeS/FhfhRjQBXAlwbPNICpP9AQcao2qaxrAXbavRk5R3DfCMEKJlAib/dEPtz7bs8SEs19zgg7w/08oTsPt8ViE1EGwd2SacSvPw0/RuuLBbBoGIBnTOsdEUbaNUC4Nw3n1vzNIgiSGwoo91VAXAwiiR+bwMv3b3C4XxYWMCfZAHpv3XRnxLd54JT3AercViVBIOhvFJ3JWH40A2OzjSlFhQfg2ZtKxk8EFJnaJo4/hQWgsvVoFlSx3esdWyDf3ASUyTOucPTkYjJTGU6WaO/xJ8wtxBf5NyXj+ISmb2l5V958/6EE6eOE2e6CtI+fd6HV6mNZsiKNvK1VyByher/TPE6DKR8pfnIpcdGl21mIgJCzg5ybrFlxUo2fBnrwGuHEsUAGLk+9HHl++vGR7kczsK4LPvYPHHwMZssfPaU3S//YEVN5+xmWA6qrr1Z/PeXpXB44nnea6Z699Ohg+qlOjB3qQdTHLyEDe4Wbkm2tcwp5l7z2SNF84/bEzEv/UbXOCOFxTLUPCDvw/0HA4q581f0jpazjAk9lJ/SunR9P3qSiB+hvPgy6boVcOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(38100700002)(6666004)(478600001)(83380400001)(6512007)(26005)(36756003)(53546011)(2616005)(6636002)(66946007)(6506007)(6486002)(316002)(66476007)(110136005)(66556008)(31686004)(41300700001)(2906002)(86362001)(31696002)(8676002)(5660300002)(4326008)(44832011)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djQvL1VjeGcrYTM4U0dvYUhJbG45ditXejhNemdmOU8wRjkzNjg5eTdEQ0FV?=
 =?utf-8?B?UVlSS3IzRXlueFpSVENtU21VUXpDb3lrd3hvc0xpK3JZbnMyT2pvNjJQY0dm?=
 =?utf-8?B?ZXAxdXdYSUJnUDNJVnBadzlYOGxHNTRVd05Ra2hFVnVZTFFhVU54dHp6Q1N2?=
 =?utf-8?B?dmpLeUVCMlFic083N0dMb0ZGcnExaUh1c1FvdVdLYVJ4TE45UDQvQlV3SjVP?=
 =?utf-8?B?ODZHVk0vOFVrcXBlejZSWUpzdTdXc3VoZTNwNEF0aEcycnUwSmhIeHIxK0JD?=
 =?utf-8?B?MXE5S1dwOTJRb2R1NEpuY2tMV1Aza1FMK2Q4VUhJdVgzM3RFUkJnYS96SmUv?=
 =?utf-8?B?K1dDcVcvRTgxaVB3NHBkVXV0NEhpdXVVQW5Kem9CVTdIcVQ5bk4yMCtmUnJm?=
 =?utf-8?B?OUwxamY3NTdNdnRHVzFpMnptZENsWUNrRmdHZmRsRmhuWGdsbmcxZmZMeVBJ?=
 =?utf-8?B?QmtpU1dCTXZVazNlR25FRTZNTWlLaHdXYmtISlA3TDl1ZThybWc3SXpBSmFT?=
 =?utf-8?B?RjFoNjFBL1owdEowSG9CM2doZXdsajM5VmhDRE92ZG1MdXNseVZEVFVOLzk0?=
 =?utf-8?B?ckNqUWFCSDl5bGJTR0ZYNDRxMW5NaGM3ei95aWV0eVFiR2lGUXdJR3NaaHla?=
 =?utf-8?B?czNPMnpCeWxIaDZBZEZDdmozWUduWWVsbFg5cUkrWi9GcTlXUWpXV0VNRmtP?=
 =?utf-8?B?WFdRUU1kbUlvY1BRTC8vWDJ2MnEwZy9VWlN6Z0QraXRRVEh6WUZTZ21XTW4r?=
 =?utf-8?B?Y1AxclFVT1o2cEp2RjNIR0l2M2pQNzJ5U1NTUS9mNTZWcFNBRkg5ZGRGMGRm?=
 =?utf-8?B?bHJ2cThacXArNndPMCtOZm9aeSthTjhqZzVPV1NYWC9zSzI4cG51Y1ZqdC9H?=
 =?utf-8?B?U2djMVVUVHdLSGVlczJFRzB2N0RqUjUvdDZwM1c0alNuSlhSaGRkTU5LajEx?=
 =?utf-8?B?ZHFkYmk5NHl5SFJVMTFyL1U1NGdiVm11aFhMWkxOanBaenVlS3BTMTdzdDRU?=
 =?utf-8?B?MCsrQ3Vsa0xpeDI0UkRkd214N1RPTXRTay9PandwK002OVhmQ0JJcXlCcFll?=
 =?utf-8?B?cmZFYndObjFwWkQxaXVBWXpMZ3ZGeEVwRjdVL2NyeFphcTNEZnRGaUVlZ0hs?=
 =?utf-8?B?Ky9ZdFZZMXJMSjZneHQzZHJNc2x4UzI1MmNzK1U0N3dKbnpKbmVqdUpIWkZI?=
 =?utf-8?B?cjVTamZjL3U5Zm9lNElNNWJYaDhMdXJYZG5SZ3U0cDVNZ25ZUVVoaHl5Z1NJ?=
 =?utf-8?B?Ymo5RzRVVXNZTyttdlo2alZNZEdwTlNoZlFHT0pCdDI5d2piUGIvWnRuUUlv?=
 =?utf-8?B?L3ZOTHlnN3NubDlmUHhxNEdHaVhKUjZsd1hBVzgyaXNCVEw1S3R0dk4reWVR?=
 =?utf-8?B?SWh4UVd1SFpkWjVickc4QjlyejNTVzBVREdzaVZkVTdhQkkwK1FKbENEYk0y?=
 =?utf-8?B?eVdzS2M2Z20xRVBvM0RIbGpyN1VUYjhkcnpqTUtlRUZmaFdvcFVTMkpWaTh4?=
 =?utf-8?B?MFJHQ0ovQisvTjU1QjV3MnNYMDV1Skd0OVZZYmQwYXRrR0JYR2RPQWZYMGVu?=
 =?utf-8?B?VTJCWis1cFBzOWhRVlR4ZFZIUmZnb2FvaXFXYmc3dEZhSmFxL2xiWEh2Z2ZF?=
 =?utf-8?B?ODZ4R3pjSWlTeWtsa2MwcCtJTGNxbkM2YzBoU3FDV2QyTUdQYk9USXVJSUlN?=
 =?utf-8?B?K1VTTnFZdTdNbTFyMzk3bEFwMWl6Z3BHTTdUWExOK1NsWHdVRGJvbjFXa3Fj?=
 =?utf-8?B?cFpLTzZRTnFUYXhLczk3c0pXdVZtZ083UDBOTHF1ZWx4NFFxYVNMTWUzRGVO?=
 =?utf-8?B?L21SbWhkeG1BSGV2SnRscW9QTVJDQW9JeTZ3N01WaGZMSHlRVkN6Y2NFcUor?=
 =?utf-8?B?Yy9FbXphaThjN2ZKc3RIbkFaOGJXVkNHaitycVJGSEtpWDlqQW5vQThIN3hl?=
 =?utf-8?B?Mk4yWVZwTjVGSEl3UkRmWW5KSmkyUkR4dG1LYzhiMGJHOE1aMWM5c0cwSEhE?=
 =?utf-8?B?OGJFYXBKcE0wdUU4Z2ZWd0FuWUFnbjNDczN5d3N1NnFTdXVkK25jMDNBM0ll?=
 =?utf-8?B?YzA2c1MxZ0g3OXcxSnpSQzM2d3psZERJK1pPM0xsWm1BTVNhVmFzb3hIdXhF?=
 =?utf-8?Q?vOtM3SkK9U6z0jz+C+PPsD2ga?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c81a573-23ad-4afa-ba5a-08dbbf83894e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 17:59:47.1141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WpwZgzbCNbucJu5gtM2nw58pmzEa6YqRm6wFZjrHt/dPDs49Uu80pAD4UBCtnukZSkJYTU5oauaCLoD4W4m9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 19:27, Felix Kuehling wrote:
>
> [+Mukul]
>
> On 2023-09-27 12:16, Arvind Yadav wrote:
>> This patch is to adjust the absolute doorbell offset
>> against the doorbell id considering the doorbell
>> size of 32/64 bit.
>>
>> Cc: Christian Koenig<christian.koenig@amd.com>
>> Cc: Alex Deucher<alexander.deucher@amd.com>
>> Signed-off-by: Shashank Sharma<shashank.sharma@amd.com>
>> Signed-off-by: Arvind Yadav<Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 0d3d538b64eb..c327f7f604d7 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -407,7 +407,16 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>>   
>>   	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
>>   								  qpd->proc_doorbells,
>> -								  q->doorbell_id);
>> +								  0);
>
> Looks like we're now always calling amdgpu_doorbell_index_on_bar with 
> the third parameter = 0. So we could remove that parameter. It doesn't 
> do us any good and only causes bugs if we use any non-0 value.
>
Hey Felix,

Actually this was happening because in usermode KFD library the 
doorbell-size is for non-SOC15() hardware is hard coded to 4 bytes.

We added this fix just so that the library code doesn't need to be 
changed, but can still get aligned to kernel code.

GFX Usermode queue code uses this doorbell-index parameter, and it gives 
us the right offset.


Regards

Shashank

>
>> +
>> +	/* Adjust the absolute doorbell offset against the doorbell id considering
>> +	 * the doorbell size of 32/64 bit.
>> +	 */
>> +	if (!KFD_IS_SOC15(dev))
>> +		q->properties.doorbell_off += q->doorbell_id;
>> +	else
>> +		q->properties.doorbell_off += q->doorbell_id * 2;
>
> This could be simplified and generalized as
>
> 	q->properties.doorbell_off += q->doorbell_id * dev->kfd->device_info.doorbell_size / 4;

Agree, we can do this simplification.

- Shashank

> Regards,
>   Felix
>
>
>> +
>>   	return 0;
>>   }
>>   
