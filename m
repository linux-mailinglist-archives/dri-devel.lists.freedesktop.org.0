Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83406510533
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8B10EAA1;
	Tue, 26 Apr 2022 17:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16EC10E919;
 Tue, 26 Apr 2022 17:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROaOmc8cnaw3orX+KMIHEoN9f7RUAOiCKoRiVlw+86tBpSvu6a5qF0b1gjkTkAIb+3gFTtuH6+Ri0Vy1nYkR1uNkyJOoJppz5T2IJx/uLck9fFTOs1O7Caae0noFvpWx9pjN6IPgqUuVecRZPuNm9gvHHW1766Ffu+Rj5r8loHp3IhWztojQ/tJms7JbP/GlP7WxnX75vvjSVyUZtl9cbpfcFtm2ZtkyGS0xHUOgtP9IV6pVTcP6NZRX/GOhrzVpwQvo8xJr5489hWTeNRjlO2H+Mtiw5lB+C1e7IbfWMQDyXUyfTNIwv9YWD08blY4r0RisMNUVx/TunJvtRtRk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTcD16PRQDHQiyPrZcRTysLTkSwQR1rewet6+pTKJbo=;
 b=nDznfq5qNd66Ev4gBPjmCNmGXv9BmGoNAunmhTTnSAEAvYkYxEGmKRyuXp+kfhE1T0nvmATxR3RFkGbNyLXgEtULzdVg7a/Zu1BKl4pd1rMVzH0jboQijsz7L9W5hhQakjemugbmCgt35KFFi3mOq+jKCJO0CDkjAG4RX3BIbmBo0NKHWW2GcHQ8HQWtm+EwR74SCWrs1rDKe5N/+Lwlb8TbQscY9pWq78/uY2Meh3il8670hGZBJ5f3/DVlZxbkyCSyojpvUnWrwFVUMarJBsDbBgXm4hb5gwT+sJMIfhdL908mw4wOC/SHJg5TnOul3m4d8KrwG+T12S1dSt99zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTcD16PRQDHQiyPrZcRTysLTkSwQR1rewet6+pTKJbo=;
 b=Sn/wbsQkM0uPSydta33hUjr6vg0LwiCudRr/MsYmy+hIjsLhCC+wkNzcRwyPBNtihKhk4R/8j+1Nem96d7VQLSE5m8beNqg/Ubo+bdjQ5eWdTyHCCrx4X4GjM0uP2n/OzGyUHXbecR1mn7ATq7MuLj34brzoFdWiqivx/kxAQVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2913.namprd12.prod.outlook.com (2603:10b6:408:9c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 17:20:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 17:20:21 +0000
Message-ID: <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
Date: Tue, 26 Apr 2022 19:20:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Rob Clark <robdclark@chromium.org>
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
 <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:206:14::47) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc12b15f-993b-492a-4a9d-08da27a90b25
X-MS-TrafficTypeDiagnostic: BN8PR12MB2913:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB291365758166CC7E6B067D9A83FB9@BN8PR12MB2913.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /k6mq7raeD7ybxqDtOSbpkIDt5o1frOFmbsSxzB74bFt+MLb2zmigltP4L1zFf0haeNs7LSopftfIQa3e9vNAnBzssDS09UJ+si1kVNhxGdn0OA7VDXPvxpp5QDWtBw0ok2Y4HoKVgGAkWQ80MszINR+lqapUh7GYhytgrbBNRAykzGqmrEcY2jGmRbvPg5b8NNS5tDcHC6pW8SlsV12gjo5t6wUw2/iAusifD51pzl+MQMEGNTbPDoYrZOjlVxznBVlyKNiq6UP8s6Hcl0RHGN1KOzse+vVUaoH2AbpVCWGorOSB50bkvQ1ZVtz9TYKpn7KiAgZaa32WW5dVCWgVVw9yEgg3MJVQAOGpJio0juJx38mqYZ6COj3l2eWSTyFy+SdyExTZbrOjz9WYN7TDkMKV76UiWI8mD4LR5FmZFlr2CGbhpibIrt3mLMf25eYxNhL/3aWddqgI/Mtzt/tPzzJCK/t4wxf3cnpeAEvoJECoFbX8gHpEvJsfB+nQ+e5IiCDKoa5dk56aJ36JrxdgP7APl5OOytT7EZeXau0DnpJuvQHGw41tEXM1LBNqB7fZeemaZ53vVAbIpJzTb/iP7L7C8MieaVx8S0pzjz8QQl/MHlm9xCPPFuQtoyamwYVg199Aot3nddE0vftdw453tGwBNxJL7lE7gVteoEgI0rqWE0Q6hfEmahXYgPVt4vcKJm4lmK/3obM59s+rP0GYEWJ29LT5hpB+wV5YawZx3s91XKSIU9bdXKS2abXXqgT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66556008)(186003)(2616005)(66946007)(6506007)(508600001)(53546011)(54906003)(6666004)(6512007)(316002)(36756003)(66476007)(6486002)(31696002)(6916009)(2906002)(86362001)(31686004)(7416002)(8936002)(83380400001)(5660300002)(38100700002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2N3Zm9TTlg2SVJENUlES0hYazdheVE1MUdwdXZZTnNzekl3WFJBSGYrV3JY?=
 =?utf-8?B?RjdaRkFyNWQ4Y3k0V0F6Yk4ySFJKdi9Eald6US9LRk5xd01nWHpUdHcycDla?=
 =?utf-8?B?TnpsSmFvd2xaa0NCZ3NlVmdZNE1aSm1WRmR1VHhwR2lQRFUyR280MjZoN0Jh?=
 =?utf-8?B?WEtPRGltd0RCR0lsVXFhbVdCMW42L2dWeDNmVFdUT2N1eU1wQzJZdStYYmFG?=
 =?utf-8?B?VmNsOGIzUWpLN0lkbC9WcFdBU1I1aWgyNTdDV2dRbFdSSFVzSFA4dUFyYTNI?=
 =?utf-8?B?czlDZzJGQWZhWlluKzhPSkpPMDJrL2YxMlNMc0NRNnZZa3hhamJveGoxbGtQ?=
 =?utf-8?B?LzR3SEQydmxwNXJmUS9VeFZ0VE5sVy9mZEVHWkU5K0xlaXdRNXhLOUhDaDM5?=
 =?utf-8?B?R2JoYW5NVFhFWGJQWlNjclpiTzBxVkJlT2c4L1VXVEdFRU9ucndtazFOV2VJ?=
 =?utf-8?B?VDdNbVJraFpaY0g5SFhZOGxBbFFxN3Q0akhpOUg5UHZBM1JvKy9JYUFLU1Yw?=
 =?utf-8?B?T1RqclROc3Z6V2hMOVRwa21PQndBQ2Y1MENEZVkrS0c1UWNRNmVBYjNjZGdm?=
 =?utf-8?B?NiswY2t0R0wvN1Z3QnlJck1USVVSMXN1VWxkQnVwSVR5UjVaL2x5bFFLVmNH?=
 =?utf-8?B?MUtJc3BRcmdEVkVYOHJ6WUlpc0pvV0tLem4zV3NWdHg1VFRVTGhoYi9RSExN?=
 =?utf-8?B?YVVJemxEc29vbk1xVXhEM0V0V1dpQ1VVa2I4K0dkUkw1Vk9VM1QyN3MvcG9Y?=
 =?utf-8?B?NWsyTGtWTGRHcUc4ZU9QSVNwQ0VKcHhMTGgwck03Q0V1S0hIUGtXcVVpRGRP?=
 =?utf-8?B?OTQrWUdlaUV5NnU3M1lLUjczVmVGTGlralFkamtnVDk5Y0FpZmxXWUJhSVZE?=
 =?utf-8?B?bnIwMDlOdVdTbDdHdzJSUVZ1ZWliYkp0UHd6MjcxYWFqbFFNRVpaZy8rNWZJ?=
 =?utf-8?B?aTFRRE1YK1p6R3pOZys2THVzY3BScUhtR05qUXRDSENzY0lQUC9xM2R1U1hK?=
 =?utf-8?B?U2xnamRZT2F0ZGRSUDZITzdQU05VY0Y4L25OU25tTjZmOEJGQXRIUTZZamJB?=
 =?utf-8?B?UU5CMU1vNEZMZWF0Y0NiZWhYVUhkbGhNS0pvanhxU3E1c05jNWYzd0c5L0J0?=
 =?utf-8?B?YUQ0dnlKRy9tREFsRkx2UWhBaFVVMW5Bak1oelRVZWhYUkZseCtkOFZIMS9R?=
 =?utf-8?B?V3FYZkFzRzdZYVp3bFp1a1ZhQTJTeDNVS2J1RlNZNFpZNE9WamxkTnh0Q2JT?=
 =?utf-8?B?V1IwRjVBNENDU3F0UXM2OXFHazlNUFpuZXVlc3FEWkU1WmJSUXlHamgwLzNV?=
 =?utf-8?B?Zlk4enp4OHFKcDV4WUxGM0ZDRUZCSXRiNGZNZEZQWEh1eXR1N1MvUUtNdHJS?=
 =?utf-8?B?cFhVdkVNdnNtc2ZndjF4dmdJSXJnV25ZcFFuVmlNUDJCUmVFQmhxTWNPZ1E0?=
 =?utf-8?B?Z1ZLWnBPQ2Jab1FjSEJMTktqaHJNK0dlai9CMnhLYm1MM1YvcTBNTUFDK3ps?=
 =?utf-8?B?UnYrWkptYzd4cGZUWFdGN3RjZlJmVTJiOS9XU280Q1JTckZvSy9oYUJyWWlj?=
 =?utf-8?B?RXFnb2p2bjJFL3lwbTR0QkVlaitnVkJBYnZNZnJBUmtLWW9jaHdPTmxFS0ZP?=
 =?utf-8?B?bmVlczJSK1BnWkNLbTBabUlNOWZBWUZ0MVJBWXBnY0RaQnByQllmVmc2bER2?=
 =?utf-8?B?U1h3TTRTWE85andYaWh2ckJCWlgvMzhpOVN1elpxNGQ4VnE4Q2tLRkZmSThq?=
 =?utf-8?B?WDNDbmpUMUpZUTBmMElRMzBzVGxQS3VUNTl5STUrd1NrU0cwL3BZbWVDUUly?=
 =?utf-8?B?OUpJU1EvRGNUU0NSQ2s3ZS9UaHJoeWNxbnlnN0lWWHlUMTJxTTE3V0RneG41?=
 =?utf-8?B?S05QSHlzeTdXdU1lQ1ZicHlRalBwckF2REJqTnI3QjA2djUyckd2cGs1RHZp?=
 =?utf-8?B?bUc0N0g5d3A2dEhwa1A5emFpU1BzSWd0aHlWd0JIZDVaZ20xa1BNLzFUMFFu?=
 =?utf-8?B?TDlNWlJ4Vi9ocTUrRzlhMS9KdHJnRlZZb2hhWFZtM08vTjhzOUoxeXdsV20z?=
 =?utf-8?B?TUozSGt3aElLUGdJSytsYzlrVjlybzk1aWtSQUNhMDhqNUVjME0rRW96U2JV?=
 =?utf-8?B?QjcwayttekZmVnVnUDZWMGdvUWhaVWYwQlZtTGkwSE1HMitzZGk1TjFOZWY0?=
 =?utf-8?B?M29KenUzZFdrM0xYOU5ib2dlL2tCV0JvLytqZGdibzl3RG5GSEl4eDJyUWs5?=
 =?utf-8?B?RzNmanJyV2EvMW5QbjJRRzNZVXBjRzlCY0QycFV1aDNMMk42Z2lqOGU1eHAw?=
 =?utf-8?B?TkpkYlZla25QT1NVUFdIV0lENSs1cjFWWWFlY2NNZzV1VlhySUg4V3ZDY1Uy?=
 =?utf-8?Q?7cPvYHaMzG4kmFhQGh7TOZOze6VgutesDOMsxuS+HlO/S?=
X-MS-Exchange-AntiSpam-MessageData-1: 7jC3Oxj6jAnSOg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc12b15f-993b-492a-4a9d-08da27a90b25
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 17:20:21.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s87/nlOHPwph4+zw3DUE0Z+LdWICs08Qo2UlQ9dGHp43vVS+DOQSA+zyx4RxhPAE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2913
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 19:16 schrieb Rob Clark:
> On Tue, Apr 26, 2022 at 10:08 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 26.04.22 um 19:05 schrieb Rob Clark:
>>> On Tue, Apr 26, 2022 at 9:42 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
>>>>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>>>>> In practice, trace_dma_fence_init called from dma_fence_init is good
>>>>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
>>>>>> and virtio both have cases where trace_dma_fence_init and
>>>>>> trace_dma_fence_emit can be apart.  It is easier for visualization tools
>>>>>> to always use the more correct trace_dma_fence_emit when visualizing
>>>>>> fence timelines.
>>>>>>
>>>>>> v2: improve commit message (Dmitry)
>>>>>>
>>>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> This has been reviewed.  Should we land it?
>>>> No, there are still open discussions about it.
>>> I think if it is needed for trace visualization, that is justification
>>> enough for me
>>>
>>> I don't really see otherwise how a generic trace visualization tool
>>> like perfetto would handle the case that some fence timelines have
>>> separate events but others do not.
>> Well I just send a patch to completely remove the trace point.
>>
>> As I said it absolutely doesn't make sense to use this for
>> visualization, that's what the trace_dma_fence_init trace point is good for.
>>
>> The only use case is for debugging the GPU scheduler and we should
>> probably introduce a separate GPU scheduler specific trace point for
>> this instead if we should ever need it.
> Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
> OTOH if using separate events in these special cases is better, then
> I'm ok with that and can revert this patch.  Chia-I is more familiar
> with the visualization end of it, so I'll let him comment on whether
> that is a workable approach.

Interesting, I wasn't aware of the virtgpu separation of init and emit.

But yes if there is really an use case for tracing this time stamp as 
well then we should probably have that use case specific.

I just looked into the scheduler case a bit and found that even there we 
already have a different trace point for it, which is probably the 
reason why we never used trace_dma_fence_emit there.

So yes, there really isn't much reason I can see two have two separate 
trace points for every driver.

Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> (Or, how do I check if it has landed?)

