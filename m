Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB257B035F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4BA10E4E8;
	Wed, 27 Sep 2023 11:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3A610E4E7;
 Wed, 27 Sep 2023 11:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnslfQ2K4sXeGfFlee8kWrWr2ENbUxeFGRyeRXtn7Jrf36MB5iMQJKzN63SBGMXkeUGQ7YFG+sF+1ufDHS8P0o8dsnQneXzRpfJZv7/f9TSclmdu+qNfv/N5h3dXjZn4wxilntBHW/yp9ukGR9jJRW7P1KdgYxuoUySKwU2rahj0GAYofq5hB6IINvX0CH3NnmYOS1ORbnhZ5N/p5NtjREUlC7/GeZwX15svtkl9aXuwW94kJxHpXzSALyKXx2ddF91QzaHFfbhvSdIJUonisR16qLLdMWo/KnhhXUpVdT2HOYQhZwkPNBjUqd9dh16uokV7pHUA1FdGYmqvnPcs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFwy3neVL04A+NqKH+xDGfrz8aU92UtO0hWTF1k9O5k=;
 b=DsBvRXPsz95wlxs/5l8ZNTsbMrA1TAirgbSMWCdxGtuiNPNWNB8WMLNN9jFu5z9tvg2Nigg9JnfYMJmkRg5d6NMgBjj3K2z3oHv4SwrD86JEN+FeumdgbJvHtJaZ7Qfw0Ncz1XGWEP+dJz4vFxd82y3xI/eFaCFgr4jTLHLN9xjUG/63YW6RX8ZCN+Cn2/VmfNFDJLTgWDXE4te/1H9E5c4fg9Y7vac6dwlFHyjKF7r57Sjj6JWsFsmuiFC83vXTjDGephkBbqQp8TzdsUqSEKUlFRNS4u/mBiPwJDYvGy/q6pcZ4D1tTSP39zOmPTg5J+P408dyLfVh1gdXSQZGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFwy3neVL04A+NqKH+xDGfrz8aU92UtO0hWTF1k9O5k=;
 b=CU64YNV+ZLTGaEIElysaNze23jghFcxJr6bq+WEcEvvjDzxhdsDBAYh7k8GgEl2hs/FIviarZpBBX3LvixH4fwnHGE/OqB91nhF0ijtXS/86z9Or6c2mHZZASUPUQfzgfEpK7YAbLOr6lzIYYQx4THcUkNPvO8xNOHV0akIRVvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4944.namprd12.prod.outlook.com (2603:10b6:5:1ba::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 11:54:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 11:54:46 +0000
Message-ID: <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
Date: Wed, 27 Sep 2023 13:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230926091129.2d7d7472@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:803:64::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bd6418-4ca2-4af0-e6e9-08dbbf508bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4fxqC/kNrWLo1ueW+ywOAFU2bLD8meYIWlBz4gXeq8PK0uk9eW5xUr/UT7WgZg/k1Vq1W4wwoS8z68+hVloxYUMWsqNGtxxukiNK9NjLs0QTz/hKpmyjjkAR8dbFXdFojNXEHFhGF/QXd4uQKcDc6NqYLLH5I61c184k0OJAKHd1XcpSiOOJLrsPNpm/CtFJ6b04JoCSqEvKQe1yzJYz/JjcTGpyUZ3ISqAGZLLAqtg+e0aWjfH/WZIbs29QFLPTEP2oY5+cxeRLwIESEGiBYT+3XeavSn0z2k4UI1nygIsuOSlJf/Vt8nDBV1iC4vRe15i1fdhcmZP2bhDrvdoLbxcJ9P/NuMKgJSWT8aQJeoW9zBxWP3tCityRdo+xX7NBu3hI2HaLl87TmpQi6gQ43JJClZI5e6q06LDXeHgMwESS3QAeL83N40ghR+URrz3JCjlZrpTddz7rCZWqxfdHqr7xN2/+nZP1Wir+WCs4Y7YvYUe7pIudZW4J1plktR+vy1fRu/Ie9T8R5HxXVXyDtaBhLULzdbALGdTpYRLzF1EuZdspZP4twp7AyTCylokdxUMz0xavOJohfD+pvMyRtuz6CLZTyRZk+581trXBeiuJosjA4anfc9AbKshJiBG3OG1rMaetXrDxhSpUYLDYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(6666004)(7416002)(83380400001)(6506007)(38100700002)(66476007)(6512007)(54906003)(66946007)(26005)(5660300002)(66574015)(66556008)(41300700001)(8936002)(8676002)(316002)(478600001)(4326008)(6486002)(2906002)(2616005)(6916009)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0Fra2ZZR2I0a1FneFJldlBDYkNvRlRsUGxSTWxQOG12QUFtblhYeXd0aHB0?=
 =?utf-8?B?ekV0WWQ2UlB6MmdsZUxyOHBaeUFmZ0pDMlBhejB6MndDNFV5MjQ5Y24wQ1Q0?=
 =?utf-8?B?UXlnRkx0MEQ3NlBXbDlSNkxnM0NVdm9LWHpWenNvNjJtMkNQZCtpdHVRR3N2?=
 =?utf-8?B?RzNuYnlhUHRIZjBLOS9Vd0tIYzYrVnBBQ2pjZUFpTEwyVzQ0SHRKS3hpMFN3?=
 =?utf-8?B?MTJQeUZER1BIbWF1ZmFyU09ld0h6Si9uYUYzUTdjQzFkUjdLRVhVVmE4Sk9H?=
 =?utf-8?B?V1pRVm16eFh0K3N3aG5aR1NIbUtST2hZeEFDNFFJRmpORStsb3AvdEhOWWxz?=
 =?utf-8?B?TStZUEhLWWZ4a2tXeVFHaFJqU2t3eU1wVElGaTZFKy8vdmRjRys5THBNYmc3?=
 =?utf-8?B?YVRLeFp3NzA1Z0ZXanUzV3Ayc2pJdlllN0d3T3NCWmFMbzRzdml4UnhIR2FR?=
 =?utf-8?B?NVJBOTM3WkJJMm4vZm1NSXd2RzEvUW9HS0lSN3g2ZjJiSmlmM1ZqK05UN0J6?=
 =?utf-8?B?Y3BMZlZOcGZpZ1hUMGdPeHZjamdsbVF3WG1MWTIxckhMck5iRU9FL2RFU1Qr?=
 =?utf-8?B?RG1MU0FoaHJTVWJDdTZHd1FDVzlhZlBYUTQ5ZjU0U3EwVEpzNVhmeUZVeHZ4?=
 =?utf-8?B?SlgyZG4yNCtvaUtSaElIRkZZaWlSZ3dvY0kyd1UzclVtR2FpMmVROTFpc3Bu?=
 =?utf-8?B?VjM1Mjl5azB4YXY4Mkx0Q0VCcEkzOFdjWWMvWW43b1Frbnc4elpvOWVCRmRq?=
 =?utf-8?B?MHJiY2NOaUJoZSs1UzV5RzhNN1NPNlBEcFRRT01Ldkx0UGNSeDgrTGx2eDRz?=
 =?utf-8?B?a3kydUNWL1VkVDB0MGRuaGNGRXNuQWJkWGtTdWt2T3dUdHZJeFB3TVkvU3Bn?=
 =?utf-8?B?eHhzUUlvdDNSTHZEMEViRmFqUlRMYmV2YXVwZGd6bUtrTVd2cWRzQVRQYzJP?=
 =?utf-8?B?ZlpqSVJwT2dPMFNvNjA4TExxM3gyanl4eGN5VGZodFRkOW5vZkVWemxwYk9L?=
 =?utf-8?B?NGNEN2NZZUZzS2VQczZLZi8rQSt6VGtmamlkS0N4aXVJMEg4YU1wNm82U1Ew?=
 =?utf-8?B?cEF5WFJ2cEJzS1BOS2xGeVY4OVJBeDRGRkZ6c0RPYU1qTThzVVFEU2Ftd0Vr?=
 =?utf-8?B?eFZqSXdGeGhINmo5VGF0UEtrblp3Z3NqTkhtUGhBRlFlQWx1NzhERFNIRnhD?=
 =?utf-8?B?a2F2RDhxSi9aaGtNU1FQN2JzMHl0SUgxNjE4eUtpZUIrK3l6M1dwU3hpZ1V1?=
 =?utf-8?B?S0RpeVcrUTNhZE5iWlNyNWRhNDQvZ1U5cGlkOXNiWVJZb215Q1puWTlRYkRn?=
 =?utf-8?B?ZTZ2UTNWL3RQMmQ2YjdwWUlvbzVyZWNtVzBoRzgvWlc2N01TTVZYTFpqMC9s?=
 =?utf-8?B?Tkd5WERNTEY0cldqcTJwS0NHMEl4bmR4Z0xGN0UzMy93eUJCbGFaU3pLUmNa?=
 =?utf-8?B?THdxR3ZrT3huY0cvUWxFRDJSSk92eHoyUzlUbUtzUHh0K2N0TnJzVVBmd0RH?=
 =?utf-8?B?UFNGZ29vRG1UbVJSM3d6UjMrRjBXM0R1aThSaldYMTJPSmRBMkJLclNad1RY?=
 =?utf-8?B?cDBoMGJzbU9wRnhOR3RWc1M1RjRWYUdGWlVoK2VXTkxJTWJEMldlOEwrQkow?=
 =?utf-8?B?ckVocEtqS0YxSzM3RHNaanZ1d0l4M2dMcG9WOGpUV3NKaGJBd3BIYkNjRTdY?=
 =?utf-8?B?WnJqWHhZNmJnZ29JU01GcDRjR0dPbDNLRGFZRmxuOWR1M21OTkhQaUNWYmZH?=
 =?utf-8?B?c3g2eGlsSE5NU29Wbmd2Q0RDc1RBeGlmUUdpdjVpMld1Skh4cXFBZFpFTHRY?=
 =?utf-8?B?TVo2NEwvdk51elZkUlZ0SDY3QWx0MUp1TFI1YjVUYVAwdVVzUXVtUVZTbTdh?=
 =?utf-8?B?Y1lINkpIclJYUlB2bTZoZzdmYW12RU8rTzFYTlJyUGExY21lczJKMzdCU05m?=
 =?utf-8?B?M2UvS1RQRmFOVFlMSHdWQjYzMk4xRDBoZnhqUERoSCsrYzl6VDNlNk9GbURz?=
 =?utf-8?B?eTdwYXVLY0lWZmJHUkFFdTJUb2g4bkNrR3JFaElOdkQ3dG5UUzVTT0JNV1pS?=
 =?utf-8?B?cDN0TTg5UzdPdUlITVQ5ejB6bnBYdUhzN3FFTTc1bG1KN0F3VWRiQlhsM1gw?=
 =?utf-8?Q?yqhM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bd6418-4ca2-4af0-e6e9-08dbbf508bc6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:54:46.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL9TGaj7vV4LxlUmlaZOepIf/90FclMNSB9X1J6wXrsBb3UZh11jLXvEHM3kEQUa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4944
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.09.23 um 09:11 schrieb Boris Brezillon:
> On Mon, 25 Sep 2023 19:55:21 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:
>>> +The imagination team, who's probably interested too.
>>>
>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>   
>>>> Currently, job flow control is implemented simply by limiting the amount
>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>> submission limit that corresponds to a certain amount of jobs.
>>>>
>>>> This implies that for each job drivers need to account for the maximum
>>>> job size possible in order to not overflow the ring buffer.
>>>>
>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>> rather large range. For such drivers it can easily happen that job
>>>> submissions not even filling the ring by 1% can block subsequent
>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>
>>>> In order to overcome this issue, allow for tracking the actual job size
>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>> submission units, which represents the amount of units a job contributes
>>>> to the scheduler's submission limit.
>>> As mentioned earlier, this might allow some simplifications in the
>>> PowerVR driver where we do flow-control using a dma_fence returned
>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>> dynamically query the size of a job (a new hook?), instead of having the
>>> size fixed at creation time, because PVR jobs embed native fence waits,
>>> and the number of native fences will decrease if some of these fences
>>> are signalled before ->run_job() is called, thus reducing the job size.
>> Exactly that is a little bit questionable since it allows for the device
>> to postpone jobs infinitely.
>>
>> It would be good if the scheduler is able to validate if it's ever able
>> to run the job when it is pushed into the entity.
> Yes, we do that already. We check that the immutable part of the job
> (everything that's not a native fence wait) fits in the ringbuf.

Yeah, but thinking more about it there might be really bad side effects. 
We shouldn't use a callback nor job credits because it might badly 
influence fairness between entities.

In other words when one entity submits always large jobs and another one 
always small ones then the scheduler would prefer the one which submits 
the smaller ones because they are easier to fit into the ring buffer.

What we can do is the follow:
1. The scheduler has some initial credits it can use to push jobs.
2. Each scheduler fence (and *not* the job) has a credits field of how 
much it will use.
3. After letting a a job run the credits of it's fence are subtracted 
from the available credits of the scheduler.
4. The scheduler can keep running jobs as long as it has a positive 
credit count.
5. When the credit count becomes negative it goes to sleep until a 
scheduler fence signals and the count becomes positive again.

This way jobs are handled equally, you can still push jobs up to at 
least halve your ring buffer size and you should be able to handle your 
PowerVR case by calculating the credits you actually used in your 
run_job() callback.

As far as I can see that approach should work, shouldn't it?

Regards,
Christian.
