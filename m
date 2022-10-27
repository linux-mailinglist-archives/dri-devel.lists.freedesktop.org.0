Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62F60F214
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4F10E37F;
	Thu, 27 Oct 2022 08:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409DC10E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdRmMDdt06fbfKjky77RRjbsO74dr8FFiO9S9riKypGm+G6KCfDPrGaXYvrc4yyyu785aoQnVAbgymBIspVojSZBr97Hatzb6096UC2L3LpDRSApibyrUhUvGJTY3CjL7g26t7/PU2nr4MlzpoW183mm8k4Q0oocEpbIp5gZQhI97iC0Vrpxh5pJyTY5xJ1sybi+RPLzplU/5gsEq85lERir59n7i/wyCEr81YUpktLXS4Nemoo4XlQwxcKI7JZZVmGuwc1vEjmFYkaM53zosfmzU2gGSJtMbCkfJ0OK8Z9VGoyt/VRU4EpJHXt717ytjOIriXpkEBSiSCpxf5eF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfwiBORJW7jlMaH36LLWkCk/NaZzDuoUsnjQicX1YeY=;
 b=FcRJdIlXCOO3dozumSFns8cMXWJjKI+VKpSacrLyd2PNVP/SfvBCVNEq/olHLVigZFYYR0v1tKEeYAvUjR3TgGjCWIjn6TIyG2RJyWynv1kPyEQdXFGe3Wx0oMGekRjbAVH44KuJqKgCF6aD0yohbdzR0R3xzclSGLJ3LwIwZj1mvBKoLvCfrEymxdxF7Ws/VKLPovY/jauOWY/SAw7RJMTC23S8KhhN7okqwanTHIU4BS3nCBgWym0lWy5Wxi90sI3+t9YGXvyOcCxgV8uUcwgn11F1A4ayy9KJHTrpltHXsbSXiXQ+5cvRH4SZd9NyTrsEKvuLzHAGFDJEW+/bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfwiBORJW7jlMaH36LLWkCk/NaZzDuoUsnjQicX1YeY=;
 b=1G459hqojVRJOJfJHhFZT98lSJEVF9FuqppGK9i+JDX52gA1fm3ts8iSe0Sk8hASsWtkG7zfGU/0/NAxLeXVPMF2bYTY90v3DMPD9L4aGDwQP/78pa6JB3JEcumgExht/ADHta84RGlsUVKMHBr98VzVBbxgnXqF5z1hPLRUc6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:85::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 27 Oct
 2022 08:19:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 08:19:25 +0000
Message-ID: <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
Date: Thu, 27 Oct 2022 10:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, brolerliew <brolerliew@gmail.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
 <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d446150-a456-47f6-1efc-08dab7f3f5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmkgpNqwkUGoE5xZ090XU3ecuxPMNxbPTOXkIwsEdtiG1HPqhzF3rJyZza81AoOQb0UrWQvNUQMet0pMn5tlCFJD3OH84on2zIfiX8u74znQJ13/KgsY5onq/Kf0Ing6ASag0ELkyXZ++JYmTin35PTouUwdzQk9zZxsFQPG+hErznLbPNU7XjPHiqaBmOC1NgrYevLaAH08xsY6KVRFhQV8AG0bxL3kPE25WiP0i7IR7Sas25saQZdxZbdreXpkcAGEU7KENtdzx/kDZJn0ZukN58AczaXNLSQWHYlWFzkcj8hTDWQl5cvJA/ypZD8DSqMMg/rZEDVhGuQvYz3C6Y9TdvWF8JxfK2+DovO+Fw04nC1i0ThOgplw2p/c8xNc1TN+QmndwmxWL464cZ5M7hy0Qbtro4bA4jCQdPzWlZVPh8pmOZ/22HkZauSsrT2ukohipHbRg2eJ3rEYB/zL2uN3pJh/9h7DOqLjkg0P+Un278kC8ZsQqal3t4yGGZc4lG4rXWImFKArvvdxdO2IrSkhAkL/PUqFVskOmO21pxPt+iwWqUgy0htwicsBQ4Npq5N/5TmsZ8QVFzQzb12BRZaEJjjat+qbJ4WQyrrJttsnmFdEiNyi9kHy2CGGfZV+QfpttFi4eqqiVbxoRdfAdSxDVHiAQSav2d+p3nSn/n7eCoY6JYHALgoBvc9ta+8qdyrBYZqdE7HqCGJO0o1z9KdnUODEKK6zTKWTNlixdxo4iRIsbE0VYhN8KxUb7Yat1eFh9XP33jBTMoDjErP25jozBvnPOl3cDg9uCiw9SDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199015)(316002)(2906002)(186003)(4001150100001)(478600001)(6486002)(66476007)(66556008)(4326008)(8936002)(2616005)(26005)(110136005)(66946007)(31686004)(6506007)(31696002)(36756003)(6666004)(6512007)(41300700001)(53546011)(8676002)(86362001)(38100700002)(83380400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lhR2NYdUlYNGR0T3VCN1l0d2o5SGZnenlyRFJNdTgvZ1hNb0xRT3lobXFt?=
 =?utf-8?B?Ly8wZUd5ZTFtR2cxNllvQTZTNWhUc1BVeElIL05EdmZuU3VlTzhzQTFGbnJZ?=
 =?utf-8?B?ZnlUUEJxV2xFeE55aHRXTHhtUXdrUzNweWU4eXV2clZUNnI4SWh5TWFTMUNC?=
 =?utf-8?B?UzBZNU1JSkUvU0dETUNvak0wLzlhb2FlRDA1QXp4K0pDMHE4Q09ReGNYWEds?=
 =?utf-8?B?Um81MzRWMzhrdHdPZE5RWG41Tm9uSC9KWlg0c2x2MVlzckdUNFNUeGdMUzRy?=
 =?utf-8?B?T3hoMUt2U0cyQkN6b2hlV2lrSkFXbVFlclZhTG00eFhrS3F0U0VYOVcrNG1Y?=
 =?utf-8?B?M3BwWUE0RFlrRzQ4UE9VUU55WmxDN0lvUkRYdmxXYUhKYW5BYVVZd2dRYXNq?=
 =?utf-8?B?VDljQUhWdEJoc1dFTDQyZGJiMXMrUDZ2ODYzREYvNzB2aEtsZ1AyQzlYZytV?=
 =?utf-8?B?MkhmcG5TT0t3UHdPZXVEcnR4SSt2Vk9yT0thTG16MDRhV0VyZG04MVR4ejFF?=
 =?utf-8?B?WWdzU29EMUgvOTRrNlJVTXplejhUTTJjWjJRc0N0cmFIQS9HQ1hwL0xSdUM1?=
 =?utf-8?B?QWVWU1FiREdYYTdpOFpJTEJqQ2JVcFB0VS96Yi9EaXpMNkcva3p4ZE9EQ3U1?=
 =?utf-8?B?cU1WdzFXS2VBMjhCbjdocHZ0ME1QWnY5OE9QSERTM0dnODFXWjgxT0NqVEN1?=
 =?utf-8?B?Q2tpcmt1Y3FJbFNOMmxiTW5JL0NIaVBEMTdINjIvYTFxYWxFdys4RmZDek5P?=
 =?utf-8?B?b0UrZ1JWbTVEODJ2ajlSdGRpcWxONm93L3RNcXNVQ0ZYNTMzbm5WMUtrNjRs?=
 =?utf-8?B?dTZkcW9sNnBzZUNLazN5bXVVYk9kSVRZK0tBV2o1V09kZ0QycW9EZ1BIVUNa?=
 =?utf-8?B?ZWNENHJsVG5MekVKa05PK2hFT3R0SWlyU2J1aFpTOUJEZytueXJub2pIVTZq?=
 =?utf-8?B?NXJlV3VTckRGOWZST0RhYTYyUlZBQVBxRS9SSDhvQ2JOWDhEZHkweW5sMFR6?=
 =?utf-8?B?NEU5d3BpS01wQzk4NzA2aXhRUHhmU3I5Y2E5N1RwRkhDREVOQStvd0YrYmVI?=
 =?utf-8?B?UGd6cHJqSDNlRjR3WXhYQVkrZko1cWVhanRpSnhESmkweVpTMmRRUndDaDNR?=
 =?utf-8?B?OHIwWTljbG02ZjRsNUZoWnJKZGNBdTBIaWRJZXRoS1RUbDdOanM5eWN4cXpZ?=
 =?utf-8?B?bmIxd2Z5N0xVbXYyR1hZaURVME4rTmo1dnZtc0piSnZSTEswTDgwVWJORWlD?=
 =?utf-8?B?TUJUclNFZGc5azFwUkx6UHpxZmt1TzFHcGhEMFRTdEwwYi9lcG9DUjk0QTRy?=
 =?utf-8?B?NkJTMkxweUwvZDVRc0gzcUsweGV1TlFEZHVxQjhIclpsUkplQlZYclBPNDZ6?=
 =?utf-8?B?Ymxuc0RnaWNMQUQwZFhnelIxbEorcFJaVXA5cEk0MFljVGpZQU9NYnd0YTdy?=
 =?utf-8?B?U0g1emRMeFF4NEhQVnBlTlhLUWllUGExaE5aeVpVQnlDQ2pyM09xNy9rUEdR?=
 =?utf-8?B?M1VLSUhpTFZqdWJBU2Ivd2tMak82dWJLRk85YjRUZDhZNTZwcmQzaHNuS1k4?=
 =?utf-8?B?cmd3ZXlaQ2dlb0dnYm1zSzJOVllhRG5yWG1rRlB4ZVNzNW5ES1FQSExEbGVX?=
 =?utf-8?B?NUFJSy91WTVpU2lseUM3aC94TGpFV1E3Wk1td3BzUDI2bk80K081K1VIc1M3?=
 =?utf-8?B?bmM0cUxyT2s1cU53d3dMOUJzeVJvNG01aHRSbU1XaElPQ0VSUTVsMmNLQmZB?=
 =?utf-8?B?QitVQzhOQmJIN3RSc0d0SHBiL0szSUFXbXhsL2d2Nm1ncG9pOTIvRllPdmdo?=
 =?utf-8?B?MmNyQjRqSmxiRlFzalAzazQ4RDVoSGp4Z251K2tYWVhhWkQzT0Q3RDN1aWl2?=
 =?utf-8?B?aU1wRHlxaVdsZ3hSdWZ3Qm1CUVR0MWVjeUdBMkdiK1g3QjlmSmJZN1I2OHlt?=
 =?utf-8?B?Sm1tUjVhaHFmRkdCMjFPbEdPN0hYUVNmWUxyVU1Id3JDanVCNUxmL2VDUWx4?=
 =?utf-8?B?ZmtuYzMyNVBWS29XLzZMckI0NVhhQWpNUzVVTTNSRXkvaldDZ3RBZGhDR1lk?=
 =?utf-8?B?ajR6UDdDT3ozdE40cWttY1JmS29pV1QwcEpkRmF6SkVtdEthUStodE9UK2RQ?=
 =?utf-8?Q?NpBrEB/fAXG4Et+Vc4mO4BBcV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d446150-a456-47f6-1efc-08dab7f3f5cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:19:25.7577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2XXZzwpqdBLE6pBhT18db151qy2uBlq9cTxfrF+SQRyUzWmji2igHIR5y4nNPjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753
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

Am 27.10.22 um 10:07 schrieb Luben Tuikov:
> On 2022-10-27 03:01, Luben Tuikov wrote:
>> On 2022-10-25 13:50, Luben Tuikov wrote:
>>> Looking...
>>>
>>> Regards,
>>> Luben
>>>
>>> On 2022-10-25 09:35, Alex Deucher wrote:
>>>> + Luben
>>>>
>>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>>>> When entity move from one rq to another, current_entity will be set to NULL
>>>>> if it is the moving entity. This make entities close to rq head got
>>>>> selected more frequently, especially when doing load balance between
>>>>> multiple drm_gpu_scheduler.
>>>>>
>>>>> Make current_entity to next when removing from rq.
>>>>>
>>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>>>>> ---
>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 2fab218d7082..00b22cc50f08 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>          spin_lock(&rq->lock);
>>>>>
>>>>>          atomic_dec(rq->sched->score);
>>>>> -       list_del_init(&entity->list);
>>>>>
>>>>>          if (rq->current_entity == entity)
>>>>> -               rq->current_entity = NULL;
>>>>> +               rq->current_entity = list_next_entry(entity, list);
>>>>> +
>>>>> +       list_del_init(&entity->list);
>>>>>
>>>>>          if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>                  drm_sched_rq_remove_fifo_locked(entity);
>>>>> --
>>>>> 2.34.1
>>>>>
>> Looks good. I'll pick it up into some other changes I've in tow, and repost
>> along with my changes, as they're somewhat related.
> Actually, the more I look at it, the more I think that we do want to set
> rq->current_entity to NULL in that function, in order to pick the next best entity
> (or scheduler for that matter), the next time around. See sched_entity.c,
> and drm_sched_rq_select_entity() where we start evaluating from the _next_
> entity.
>
> So, it is best to leave it to set it to NULL, for now.

Apart from that this patch here could cause a crash when the entity is 
the last one in the list.

In this case current current_entity would be set to an incorrect upcast 
of the head of the list.

Regards,
Christian.

>
> Regards,
> Luben
>

