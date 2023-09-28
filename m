Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E47B2177
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5039010E04B;
	Thu, 28 Sep 2023 15:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505E210E682;
 Thu, 28 Sep 2023 15:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSteXhysSi62zOO8DRRx5bukuwJKyqmYQ2lzrXQz95LO3vN/KSMpwXyJCzFERnLnqJugdyzxCyl9dp90T57qptA3TFA8v1Y0wf2pTBvydAcAG+zmPNBDohzx1U7X6h/b3M65onpyt5TJ2Dz446IqsQrF55mc5NnYz2oNK5GUQnuuLNVhm5wQfdHq2qqyeSY1qX+h0C/1bcaGss+DmpadbT4jRLieGJXUQZb7r4W0nSZtM5llX8Ef2KVl6zI5Xvcp550cLN07nyQd3ccSR6bsA847waKh39yQOviLiFLxeEo1bCtBXrbXPWLc2KUOOzXUgv/44F+Lfa12yxiUo+Uu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU36oH8KD8nke11hz4CMuuzBEc1nIHs4Gkf1h/uVV2U=;
 b=T9oA3CeRKk3dMowqkyCpPIIuBHRj7OD5u1FOF0Goow2Yi0oecvNLwlMy93v0ClnSUWkVZhJ7cQAiKXGt3bQU1NnXtoaOllEMhnYotoxtEdeYm4VsrOt3fGa+6aSJnh6gpJPXEVK+OmG7b5SBdUZFGhs49hafvKLNqi1PvxiW+pPdyNBl+GwzavY5ivgMPlQAALQCf07ztzsI8mwPFe8gD6Ih98wRtmvoLgTyWcXfPVWDw+6FzZGJfaH4zQULFytGKxxsW6Goa79tyI5q80tb3+29vUbw56HN5mga9L6mz1i9QwtoiSgxIxTq2d1cSyr4sQAcagOZ35qj/puL4MH8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU36oH8KD8nke11hz4CMuuzBEc1nIHs4Gkf1h/uVV2U=;
 b=jk6XOaX8MICLOErG11TJyy290efPTaji1xTzAdDRIbpW5/P299QFp1l9DjcslpDsc2IUGmeU4uTiHKnJP1R5u3rqfGKnkJ3mxkl+Xzwq1XYnxedYyOx4kQyP9o3uQfRQc/SnzeIUHryTes91LTcEjJkyG/Qr3qbcAdk8txl1hdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB5325.namprd12.prod.outlook.com (2603:10b6:5:390::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 15:38:46 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::24b9:2521:84eb:2471]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::24b9:2521:84eb:2471%6]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 15:38:46 +0000
Message-ID: <8c9c3b5b-ba1e-ba07-3001-242eab9ca1a6@amd.com>
Date: Thu, 28 Sep 2023 17:38:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230928095427.4337-1-Arvind.Yadav@amd.com>
 <20230928095427.4337-2-Arvind.Yadav@amd.com>
 <DM4PR12MB6445548E05C8E3B29AAEAFCAEEC1A@DM4PR12MB6445.namprd12.prod.outlook.com>
 <8cd0539d-5d5e-e670-9577-7db72393b784@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <8cd0539d-5d5e-e670-9577-7db72393b784@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::23) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe207ec-ac3f-4c22-996f-08dbc03900df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqO0Ag17ujtaD8Pnq4T6lwkEgAHmjdJ9+hj66tRsHeJ13yh2JnEH+claTjZMhHJ1yXI4ZCW9Iz62BV5p+oR6Xh+xKOBCRaFHRuBcfgUbTlefa4MEudWE8V4ZbwqJ916ahUOXplkvtc0m77GEGTOeIKPWLrVPQE7eTNUiloQki5HH83wOu9cZ2yPbWMyJCWBxcPaOKiJAX5QQE+uTrsgQEAlgiANUaVxxdA1YBsnjr5D/plsD48Sd2SJDmINKupc2u6YwrrYL4RXHS3rntM1izBQ0LH1sHmDGfge4dN6XlYU1L/yHvqZdXCbPdUwQuoaNBEJmnQXPrDSLS/Ht9dQWA5Ea6Mz3xlPddLC9qgiUO4ImQlLGZM9yI5QE4xFYF98wsn9JYtqXndAiISQSnsFUONALoNg/6Ei4fNI3P+PHvud0aN+Yma1oCdHjECp1X9bTRj/AjVXIk3/ukiBcyG9Odsm4gCfRh3HHbq3z4juU0GcL2vL7D7nl+OHrr+0qth2sqpNVxyiKG5J7Xp6l5Uz4XWePUc+qVLH/0qlJO46iFQKLYHo3cAUR8JkM7iyGcjFMmyGoXTqaA33Vs0l5qfOaPnp2NRmZr3qcOpxbGS32X5nz2JDIyiBntt80VbOKwSQmJm+n86cI9a9Gp3Q5xnGaOhSLFSbBW1tDzlou/TJM8OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(921005)(86362001)(31696002)(5660300002)(44832011)(41300700001)(8676002)(4326008)(8936002)(2906002)(38100700002)(6486002)(6666004)(478600001)(6512007)(6506007)(36756003)(53546011)(83380400001)(2616005)(31686004)(26005)(66476007)(66556008)(316002)(54906003)(66946007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjIzbG5Sd0t6cUNpTW9wbWRJQTJpd2FGc1FtT0Z2RzB4Nm9nMXZJZlpJSTRT?=
 =?utf-8?B?Z3hqWlN5cmNGUFpkcERVWlo2QzB1MFltNlpLa3hLK29xbi9YRGZBbi81d1FF?=
 =?utf-8?B?MlZJZXJqZUNwdy94ZjVoeVdUY0xBMjV2UUF1bGVwVlIxVTBWRERLa3dyeG80?=
 =?utf-8?B?VkRTN2FxOXdLUVdyMG1xUzVGRlBuU04vdzEwSHJPSjNTS2tabmR6eTlrTXZE?=
 =?utf-8?B?ckRBejZyM1EvM2FNbW5tanlQa3hUZ3FlL2hYN0pBMUhZeFlTN0JiRzhxSGVp?=
 =?utf-8?B?c2dQZFc5V0w0dk5iQUVKSkkrdjRDYytKT2pEYWxWQTdzQWx1amRoRE5RelhL?=
 =?utf-8?B?TUFpcEFOSHlER3pobnQzeEVmdVd3SnhzQ1ZQR2VGUXVGTzZmay9WNEZhZ1Fp?=
 =?utf-8?B?bWJCYVY1d09jWE1udzh4bFhQQjY2NGRBVWFxUVZQc0kvS3VoUEdYN3JPSGVO?=
 =?utf-8?B?Q3Jpc0MwcS8wUzQzNmcwSnlFYnRLYVQxMzJJalBNZWlpSHRNcTlYKzVXV2Fr?=
 =?utf-8?B?bWwxVllRdXpjSXNBM2NhMGZlN1htTStNMFVZd2Jrc1ovR1ZHcHpqUGpsUDE2?=
 =?utf-8?B?ODVsQVcrOUNldlJzektiSTJnb2JDOUFLT0VReHdETU9Gd1hGbmRQU1BPd1hX?=
 =?utf-8?B?MjFEdCs1WWpQRVR2eGU5MFZ0SmNzT01pbllPNXZlNGQ0TDJrcjZML3AxelBv?=
 =?utf-8?B?am4xRkh0Vm1ZR2ZWQ3ZISG1aMUlsbFlrR0ZyTjF1SFJuSENnTytvMURUZWk0?=
 =?utf-8?B?OG4vZnYvczIza3kyclRVV1l5dUgyU2dqS2JyWW01Y2lvN0dRMnRwcGVDVCtU?=
 =?utf-8?B?L1RVQitCSnNnRFFHZjdWNXFrbVoyeElFM1IrQ3haQklkY3dnM0NWTUdCOXpm?=
 =?utf-8?B?ZzBPSlhFRjdQYkVHMDdxNUlxR251YWUrcXlEbThYZWZZbjhEQ1VDQ3V6ZDdp?=
 =?utf-8?B?THk3UmZEVGVkeTlCUmlsdVR6cUQvRVVORm9vb1F1NWNOYmJrTTdDV3kxZE1L?=
 =?utf-8?B?ZXpnc3Zhd1Y2dUZaWURKd3ZaY0dNTWRCbjZkZWVoUzJseHUvRnk3dFYrakVr?=
 =?utf-8?B?eXgxdHlmbHdEZy9xdGROc0pLT2EwRi83UzVhd1JkM2dsM0lEOS80RGN0b2lI?=
 =?utf-8?B?a0tzU1MvN0s0SUdRV1VmOTJWSGNIenp2aUQySWdPK3dYVjFzYWNaQ21iaDM4?=
 =?utf-8?B?SXF6NXRmV2FBTTZqd0w1WlNlUStxTmREaFJBRnZ2cWs5bWZwcXhQTWhoRXYx?=
 =?utf-8?B?WjNkN3NWVFFSMS80aWdlY1R6U005bkJiK0ZrVS9PYXU2RUpIVTQySkFIa3lD?=
 =?utf-8?B?WmovSERvY2MyUUE4MVcxRyttYyt6bDNtdjJvbG8yNUdCRDFmTWYzVXlvS1FO?=
 =?utf-8?B?OEpUS3RhellObHVRbzBnTW5XTmVVTjNpUnM0Y0FQMEp1QWQ2R2NJUS9OOWhv?=
 =?utf-8?B?eFY0RnR4N3cvVVBDNzdxK3NTM3hWU3NDZTdyRUhGVVR4U1ZXcVhaQW9RSWVX?=
 =?utf-8?B?dkRjemVUTW5pMGhQWUVxaWwxTERWQnhlQ0JZazdoVW05MXkzQkNOcnpmcUhu?=
 =?utf-8?B?ODJrQy92Rzc1MlJaM2RDWEtyT2RQR0JHQnhTVGxaMXhkanFNZFg0QUlqMklC?=
 =?utf-8?B?TzNIT2h0UytlMW1CdmhpQXFNUWNKVHlqemJsdmZvZ3FHOXEvV0Y5d2dZakFD?=
 =?utf-8?B?WGJZMG1MaVV2VWRoMUQwRldsYW5FVTd1KzcvdDY5VFVHNEJKSTMxcm85L2Jl?=
 =?utf-8?B?akwvelhORnRETW1LSVRWd2pvRUhkTWVKa3JLUE5MM3c4cER6V1VRR1RMSFFK?=
 =?utf-8?B?aEd4dG8vbUgwZVFiRlY0YStDWHpoNkkwZkJHOEphOC96R20zenZUVHdEWTFI?=
 =?utf-8?B?MUFPeFhJNHBQWGtjVWsrSzZtRzJEckE2dHlWa0luYVVlWjlJRFo4L2FpWnhs?=
 =?utf-8?B?c1NKYjFrenZndVNETFJUL1Y2dzNIM3FNOXFFTFl0cEd2WkR6TEVPZ3RFTXpi?=
 =?utf-8?B?UXJ0YmM2bnRPQjl0WjVuSFdjSTBiQ09RZjdobjZLOW9ZTGd3ZUpPeHFZZWRK?=
 =?utf-8?B?SThjOEJwb21pU0NVWTJpZVB6clp4TTlGbHhNSTZjLzREbXovQXpuME9SM3Nm?=
 =?utf-8?Q?RKu2tnVjgUjrm6mv7Uq8DG9wB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe207ec-ac3f-4c22-996f-08dbc03900df
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:38:46.6834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: safzMhXVXg0//VM7N9NHuTF3suW7UGf7z5CZnjnDiDC9EeLCC18SYXMVJ8xvcCdwUNDww/4fKM9QiZDBFqsSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Felix, Mukul,

On 28/09/2023 17:30, Felix Kuehling wrote:
> On 2023-09-28 10:30, Joshi, Mukul wrote:
>> [AMD Official Use Only - General]
>>
>>> -----Original Message-----
>>> From: Yadav, Arvind <Arvind.Yadav@amd.com>
>>> Sent: Thursday, September 28, 2023 5:54 AM
>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; Sharma, Shashank
>>> <Shashank.Sharma@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>;
>>> Joshi, Mukul <Mukul.Joshi@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>> airlied@gmail.com; daniel@ffwll.ch
>>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>>> linux-
>>> kernel@vger.kernel.org; Yadav, Arvind <Arvind.Yadav@amd.com>; Koenig,
>>> Christian <Christian.Koenig@amd.com>
>>> Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute 
>>> offset
>>> for gfx8
>>>
>>> This patch is to adjust the absolute doorbell offset against the 
>>> doorbell id
>>> considering the doorbell size of 32/64 bit.
>>>
>>> v2:
>>> - Addressed the review comment from Felix.
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> index 0d3d538b64eb..c54c4392d26e 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> @@ -407,7 +407,14 @@ static int allocate_doorbell(struct
>>> qcm_process_device *qpd,
>>>
>>>        q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev-
>>>> adev,
>>>                                                                  qpd-
>>>> proc_doorbells,
>>> -                                                               q-
>>>> doorbell_id);
>>> +                                                               0);
>>> +
>> It looks like amdgpu_doorbell_index_on_bar() works only for 64-bit 
>> doorbells.
>> Shouldn't it work for both 32-bit and 64-bit doorbells considering 
>> this is common
>> doorbell manager code?


Yes, You are right that the calculations to find a particular doorbell 
in the doorbell page considers a doorbell width of 64-bit.

>
> I could see this argument going either way. KFD is the only one that 
> cares about managing doorbells for user mode queues on GFXv8 GPUs. 
> This is not a use case that amdgpu cares about. So I'm OK with KFD 
> doing its own address calculations to make sure doorbells continue to 
> work on GFXv8.
>
> It may not be worth adding complexity to the common doorbell manager 
> code to support legacy GPUs with 32-bit doorbells.


I was thinking about adding an additional input parameter which will 
indicate if the doorbell width is 32-bit vs 64-bit (like 
is_doorbell_64_bit), and doorbell manager can alter the multiplier while 
calculating the final offset. Please let me know if that will work for 
both the cases.

- Shashank

>
>
> Regards,
>   Felix
>
>
>>
>> Thanks,
>> Mukul
>>
>>> +     /* Adjust the absolute doorbell offset against the doorbell id
>>> considering
>>> +      * the doorbell size of 32/64 bit.
>>> +      */
>>> +     q->properties.doorbell_off += q->doorbell_id *
>>> + dev->kfd->device_info.doorbell_size / 4;
>>> +
>>>        return 0;
>>>   }
>>>
>>> -- 
>>> 2.34.1
