Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F17B0478
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7710E501;
	Wed, 27 Sep 2023 12:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B7C10E4F8;
 Wed, 27 Sep 2023 12:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWjz7bDdyc6OEFC30iGlSdO2gJ7j7m53R96WgU4Q3JJkPwKd+DncFz1qzEh98eYOQ2wobETECtOagBK02gDZYTxwzLcqQKaLso9lxk3H6ZUTDdO6iuvj563JrjgSDc7aLLRJUgeccQRD/GYKHYsWXsI2C7CmuWFapAi4JgNdCneHeQOiKxYeFOJE4ik9SUy8GFLEcRlxPK3q6NskrzfA1s6sq81YlJj895CsTGxSMdnEKRyBFYIpSrl2z0Sdyt1QL0p9QnM4vD9gj70ctnUotVsdlnP9J3okJyulYZsPYNKwPaEAXCctMhUxdeE76CuPhrx8BJAwFckDAmM+SzR5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/TXEngmJPPEGSrpo/vrjhl9z59RJpAQ//q0S8Gc+0U=;
 b=LZpSN3xKetZUrGtHmSs8q4A45f1m/rWgSDELdaZb6KD2Z4ofAnACcXxzyRtOCL/9isWzReTAR2ciXPNEnDMf5GQZY6tGIbKjleah/hM3T1mYMoPmc6T5peuhSpkyq3yOeP+TQdq/wB7hh8tMIZ9l8etmz+AZvKgdmgtYgNOln7Psb2El5pz/jxs/6gQ1puy3P2L4w/1j3CRtIBH5rphXni2bjWASRuGX9OBIXAIQdpGg1oQkf2x3kf3eUJLXZOnNNHOxNUX3uQNKuOtD3kjmPOXjzkzuODrYfDQ3lxzs2LeBBcq/PyoMgBr2wwGwiNQznz7rUP7fw8XvNNTFHNqDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/TXEngmJPPEGSrpo/vrjhl9z59RJpAQ//q0S8Gc+0U=;
 b=hFZ2//rptZY+1eM0Ubu58Nr3foOX+lzsG83h9KruG4ZxVEqPRcPa6GcDiIzb55Z/9DYZGEmdgRiJv0C4CrVkWhWjPH7rOSq6aQXvp2Tpgg/fJlzgei46goP+UmZKidLTwewuq9MJuPMuiwDtQ5KzsrMEBE+Dse+LY1Y9lBDW/iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21; Wed, 27 Sep 2023 12:41:55 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 12:41:55 +0000
Message-ID: <61c0d884-b8d4-4109-be75-23927b61cb52@amd.com>
Date: Wed, 27 Sep 2023 08:41:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
 <5c6e1348-ec38-62b1-a056-1b7a724d99eb@redhat.com>
 <1f113c7b-975e-c72f-e6f0-ded55d10d64f@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <1f113c7b-975e-c72f-e6f0-ded55d10d64f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH2PR12MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3f140a-f916-4f86-1aa5-08dbbf572175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjkc5ejfY+8dIToKFIM+lQySnMnT3tanTe8fEJi1cNeRtnZSL4i++PtBRVMCt2U1pCvBr//4mgyvm66qTFVwquHmAz0N6fnywWjXZR0f82Vrv1CRoLb6QOig5hbLxN8X0OH4eEAnmJ8L7mT29BFXaVk3So6UaewyLO5ieyIbx0a6oZD8QCtAZ2KhE/xNU/AQQTT299P8FhnAYgbIE8BDTQtWM1WOoqTxiJKSZXS4lKT21a8cowQHHp0uyEODibvu9ZbFDu9/WNIzStJ4iiUtihVj4khT8QRyPQ58v0b/GEMlsk6juAFbq9/0FgzlM2Th2SpjsISrz+k3gIpkiwtNcZS+hVqiTHQDCsiHMZet3GoAsGrEvfpG/oK14Egvwq3ipWxEias3mKXUAJjNKrg/EsNT/E8wQTsgOcvHBo3d033l/vNpNN13N4yjGCxZBMbi1WVjXM+TYyb3bAZuLXMaN88Setdn+kEXkszbXNaz1TBdDy3HfHH8NMAs1gftKo+V6UUSwAyUwttcO1hOdD/x+6hGG21O8Zj2iQPV1R/vV7nEvpHKa0l/T06x9kyovbAQfX6LPAokdlf7MVUgefhiptCWUcqTM/cQ7E1LDRUGBM2MZuRWdq7Iw46ZFJvBjM0Tzd4//QXnbWIUYKbCGl++FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(31686004)(53546011)(2616005)(478600001)(26005)(86362001)(31696002)(38100700002)(36756003)(7416002)(83380400001)(6486002)(66574015)(6506007)(2906002)(6666004)(6512007)(8676002)(5660300002)(66476007)(44832011)(316002)(41300700001)(8936002)(110136005)(4326008)(66556008)(54906003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGlpaHJDZnRyd3lMVWtRT0ZobTh0TzZ2SEpqY3ZOS1NHL2lyYi9HUE02NG8x?=
 =?utf-8?B?eXBPbnJkU2xZYjgrZGtzR09yQVBwTDN5amlmcldmaVdVNVJDRUhXTWRRYlMx?=
 =?utf-8?B?SnFGckNiVlhPQStlakI5bk1uK1ZWMFBOUEhRcnpVZk9UdVphVGsydEFONUVm?=
 =?utf-8?B?ZnZxMUNseTZzZzJTUGxGREUxMnorbUtLV09IbndEWEo0RWgxSE5FYzU1YXp0?=
 =?utf-8?B?MEJNdTZKTWpKV1ZVLzNsT0NOejNGUWxoZndQTFZid3VCVXhLMTV6NzVxQi9w?=
 =?utf-8?B?Y1JUWjJLSU0yZld4d2x0VVE0amRwQzRFajV2UUtuQ0tiaFk0UTdnT2lCTlNX?=
 =?utf-8?B?NFlpRDh2eUlPTjA4TjNIVStDd085MGhneVo3Uk5kNlMzelliWEhqZU04bXhW?=
 =?utf-8?B?MmN6T3o3ZGFLTFFLMEJpQzRLWE95b3JrL3R4VzFpcWFSNHkxK0xiT1BZem1L?=
 =?utf-8?B?Qnd3WFA2ckJCZ3FjSllYcWZqQ2laaWdxOU16NHdsZTFoMVhCRHJkd1ZpdlVw?=
 =?utf-8?B?L3FWbldpS3piY0IySTA0UXdXMWkzbHhuUDFGMmNsNVJvckY4Zk8yR1ZpYURF?=
 =?utf-8?B?aVBiaVlwa3QzSGhLb1Z2QjZjeThKWHVjRk54V0FGd0RPZ05QSU9hdFJRUzM2?=
 =?utf-8?B?VkIwOXZKMVdTSTRuSWFjTWdHTVk5MWZlWmlIbkZhTy8xWXM1ekVpT2J3UUxz?=
 =?utf-8?B?dE4zQ2QrMHF6dytGUjZFL3pmem02bG9uNTk3N1o5cUZqQy9QWmJXWC9WWklZ?=
 =?utf-8?B?eHBuaktKSlRUeEZXcTJuL09hRURMQ0FTQzBmM1dYK1liMjdOSVFhS2ViMnY3?=
 =?utf-8?B?VURKUmUzT256eUJVNGdISUJtb3ZmdVRFVlFBa0hoUjNoMEZOb0lyS3ZRRWJW?=
 =?utf-8?B?R2tQSW5qUWJiY2dKaWJJWjJUU1M2K2VmbzVTOWIyL2M1ZU9Pdis0aW5UekE5?=
 =?utf-8?B?NHFGQmFjUldUNDdrRWRhNnpwZ2M3QXd6U2k2UFhGeWxKSmh6TEhtK2NJdjFF?=
 =?utf-8?B?ZFhMSGFyZjBxeTM0eDZLVlNFOXFoejk5aHdieHArY3I0cnIxZUNNK1dSQmRR?=
 =?utf-8?B?WXkrUmhYWWNzWEphNWNyZHlnN3dkVlVESmt3WDJBY3lLeXJZVWhMM0NtL3A1?=
 =?utf-8?B?NVQ4a3ljRHl1TnlRY0lEdGU0ek9WaDFPaUMrUjN1dCttTDU1bVZYU2ZBYWVR?=
 =?utf-8?B?U1hVcS8ybnhldVdFVTdRclpmeGZDdU9yMEluWVdWSFdZRFZ6RTZXKzhHWmRZ?=
 =?utf-8?B?czJPdUtXNm1lVjJINDd3ZXBiK3c2SS9Va0lTRlJsN2U0SHZ5dWM5UDd2SjJ2?=
 =?utf-8?B?ZDVIQ2JKbkk0TFZOVVZ0UTFPNGlxUTN5ZUsrSzlqSlhBYnpOTC9oWGc5QURP?=
 =?utf-8?B?NGFiMzYwZE9kbU9XZTgwclcxQTE3U2VsQzUvVUJJRUxLd0x0T0pwdVNyeFZs?=
 =?utf-8?B?bXk0blpKeTVRUm1DWGVBS3RwQWgySmk5UmFmV3B2NG83ZmVGZmVsLy9IR2JX?=
 =?utf-8?B?SjB1WGJLT0pqQ3NMcVY3WmsxV1psWXZlRGQ0eGRlS0JKUERnOGxBM2hzd0Vn?=
 =?utf-8?B?VDR1MVR4RVNzaXdadndrTDRFS21LUTJMVGlCUXpxc0RWMXZWMEw3UFdSN203?=
 =?utf-8?B?WnFnUldma2hweSsxTnFmQkI4WkpCejdSdDFiYjFXQzdKSGw5ZDFvWitOanVu?=
 =?utf-8?B?d3dPUUJQZi9wbjFzUW5pWFZIdi9nd2hnaFVpR2k1WEdPMWlLWWlLcEhNaFBj?=
 =?utf-8?B?Uk5LS0Z4bGpzTVRLSDVkQURQS09HblVPMEd1c2dkdWlTamNOUnNzWStLR2hR?=
 =?utf-8?B?L2ZVbXVaUXpneG1ETGJEaFk0NFJkOE9BYXd1ZDNmZml2RWxHVW50aHRpVlNQ?=
 =?utf-8?B?c3pCeVBmSWIxZ0RES3pmaFhwQUFWVFJzbnJkUHhOM1N0NEh1L1QyeklkK09M?=
 =?utf-8?B?WUZncTNVYTZpSXhEVm1tYm1DYjAyZDI5WEpERzcrTXRRSkNMcGFpZmJseld0?=
 =?utf-8?B?c2txRFZxWThtUXF3aG9KLy9tZ2lUZmgvbDlDQ21PVW5BcnVZUE9mSkdOVEVq?=
 =?utf-8?B?N3dtc0hVeGhhOGZOcmJEQ2pWMVh4WndZQkxPYUhkcXhJd2dtZVpVL1lNNVl0?=
 =?utf-8?Q?QzQzzqW+6r6/q8Kn2xtfVkJLP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3f140a-f916-4f86-1aa5-08dbbf572175
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:41:54.8746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du5voAZ+Q/WiwTfEn4big3pjmxj7KX0TZQ0IsW4icEwzxChlVWp1lhT5OmVZWzoP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
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
 dri-devel@lists.freedesktop.org, Donald Robson <Donald.Robson@imgtec.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-27 08:15, Christian König wrote:
> Am 27.09.23 um 14:11 schrieb Danilo Krummrich:
>> On 9/27/23 13:54, Christian König wrote:
>>> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
>>>> On Mon, 25 Sep 2023 19:55:21 +0200
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>
>>>>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:
>>>>>> +The imagination team, who's probably interested too.
>>>>>>
>>>>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>>> Currently, job flow control is implemented simply by limiting the 
>>>>>>> amount
>>>>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>>>>> submission limit that corresponds to a certain amount of jobs.
>>>>>>>
>>>>>>> This implies that for each job drivers need to account for the 
>>>>>>> maximum
>>>>>>> job size possible in order to not overflow the ring buffer.
>>>>>>>
>>>>>>> However, there are drivers, such as Nouveau, where the job size 
>>>>>>> has a
>>>>>>> rather large range. For such drivers it can easily happen that job
>>>>>>> submissions not even filling the ring by 1% can block subsequent
>>>>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>>>>
>>>>>>> In order to overcome this issue, allow for tracking the actual 
>>>>>>> job size
>>>>>>> instead of the amount job jobs. Therefore, add a field to track a 
>>>>>>> job's
>>>>>>> submission units, which represents the amount of units a job 
>>>>>>> contributes
>>>>>>> to the scheduler's submission limit.
>>>>>> As mentioned earlier, this might allow some simplifications in the
>>>>>> PowerVR driver where we do flow-control using a dma_fence returned
>>>>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>>>>> dynamically query the size of a job (a new hook?), instead of 
>>>>>> having the
>>>>>> size fixed at creation time, because PVR jobs embed native fence 
>>>>>> waits,
>>>>>> and the number of native fences will decrease if some of these fences
>>>>>> are signalled before ->run_job() is called, thus reducing the job 
>>>>>> size.
>>>>> Exactly that is a little bit questionable since it allows for the 
>>>>> device
>>>>> to postpone jobs infinitely.
>>>>>
>>>>> It would be good if the scheduler is able to validate if it's ever 
>>>>> able
>>>>> to run the job when it is pushed into the entity.
>>>> Yes, we do that already. We check that the immutable part of the job
>>>> (everything that's not a native fence wait) fits in the ringbuf.
>>>
>>> Yeah, but thinking more about it there might be really bad side 
>>> effects. We shouldn't use a callback nor job credits because it might 
>>> badly influence fairness between entities.

I feel the entity and job selection algorithm should not be influenced by
how many credits are available, but by the respective scheduling policy,
RR, FIFO, single-entity (job-FIFO).

Credits only tell us, "Can the hardware take on the next selected
job _at this time_?"

As long as,
1. the next selected job doesn't exceed the maximum job credit the hardware
   is capable of processing, and,
2. pending jobs are being completed by the hardware and returned back to
   the kernel, and their credits are added to the available credits,
we can guarantee forward progress, i.e. that the next selected job
would, in a finite time, execute and complete.

>>> In other words when one entity submits always large jobs and another 
>>> one always small ones then the scheduler would prefer the one which 
>>> submits the smaller ones because they are easier to fit into the ring 
>>> buffer.

I think we should stave off credit availability from scheduling. DRM
scheduling is based on factors which are "above the hardware", e.g. how long
an entity has been held off, how long a job therein has been waiting, etc.,
while "job credits" merely tell us if the next selected job, whichever one
it is, can be taken by the hardware _at this time_.

So, credits tell us something about the hardware. Scheduling tells
us something about entities, jobs, wait times, etc. I feel the DRM
scheduler should stay away from mixing credits and scheduling, since
that wouldn't be portable across different hardware/drivers we support,
and would make the code unnecessarily complicated and prone to bugs,
timeouts, possibly deadlocks, etc.

>>
>> That's true. Admittedly I mostly had DRM_SCHED_POLICY_SINGLE_ENTITY​ 
>> in mind
>> where obviously we just have a single entity.
> 
> I also only stumbled over it after thinking Boris suggestions through. 
> That problem really wasn't obvious.
> 
>>
>>>
>>> What we can do is the follow:
>>> 1. The scheduler has some initial credits it can use to push jobs.
>>> 2. Each scheduler fence (and *not* the job) has a credits field of 
>>> how much it will use.
>>> 3. After letting a a job run the credits of it's fence are subtracted 
>>> from the available credits of the scheduler.
>>> 4. The scheduler can keep running jobs as long as it has a positive 
>>> credit count.
>>> 5. When the credit count becomes negative it goes to sleep until a 
>>> scheduler fence signals and the count becomes positive again.
>>
>> Wouldn't it be possible that we overflow the ring with that or at 
>> least end up in
>> a busy wait in run_job()? What if the remaining credit count is 
>> greater than 0 but
>> smaller than the number of credits the next picked job requires?

That's fine and this is _exactly_ the purpose of job credits--you want
to know if you can push the next job _now_ or if you should wait until
some pending jobs in hardware finish executing in order to free resources
in the hardware, so that you _can_ push the next picked job down to
the hardware.

> 
> The initial credits the scheduler gets should be only halve the ring size.
> 
> So as long as that is positive you should have enough space even for the 
> biggest jobs.
> 
> We should still have a warning if userspace tries to push something 
> bigger into an entity.

Right. Generally, if userspace tries to push a job which exceeds the capability
of the hardware, as measured by job credits which are set by the hardware,
then emit a warning. 
-- 
Regards,
Luben

> 
> Regards,
> Christian.
> 
>>
>>>
>>> This way jobs are handled equally, you can still push jobs up to at 
>>> least halve your ring buffer size and you should be able to handle 
>>> your PowerVR case by calculating the credits you actually used in 
>>> your run_job() callback.
>>>
>>> As far as I can see that approach should work, shouldn't it?
>>>
>>> Regards,
>>> Christian.
>>>
>>
> 

