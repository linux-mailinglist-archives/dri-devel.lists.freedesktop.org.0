Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007C77F7D6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D3110E480;
	Thu, 17 Aug 2023 13:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6610E46D;
 Thu, 17 Aug 2023 13:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+tnJmPozcyeJUxH9HCHbTH3bXYAGbQE/Ov7glr0aP9Hpt3VeK/tGXCImKQ/7uEjok1MVQogEI5h7FbbTjNyWjPCjhtxfVMhopydMm7CMIlWY9/Azj/zpRS1Mcj1JHztXfBR/tTLhRJVjzHV/K6gVP9IeV+TDV/A6pzXJe/kqEPD1iv4waHv+5hP4m8QQi8RUCkzPtrB5TMikVaq5aXBCOr4ATGquBK5b6Vp9eE0kvFQ/N675lmsWnVMAi5CIgXoeFHfQJNO7bj7rMFGX6aL9xHtuGljrRj2BC718Oke3pje5G8FimI1cxx8sUcoEFkPQ/1AUxcaBArMQAMi6pcHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6O3nMLtx/j4E4+rjTfCSw3bY4+zi4LZ2VjqsV2a7kI=;
 b=WV7KuW8a/SRmuCvCANfViaAC9Cw6aQLTzYXHQrnMvSacwP+mpXXYHlYGaqFmuUdSvJ8t/YEeSJ+OexKEE0yX+UB3ehy7ogo9f8qp9F3Z7Fg+XvnZYtf3jo2RcAKfZP/cWAzEvKONrJM+g6NeWy7Cv19kY0OAx7sc1TE5KBukvt/2hqqPshF4TovHHwVJHumHgpY8KZqp1SzSKoMRuhJj3EulUuEsq8BFLg4fI1DepMwBdzANC4fL84pJQlbxcGq7swc3fOYYP8BkxtSgtEID/tCmSD68q/f7kT8ijheR/dveoGyCqZOuxGJ/vqgZkdx0MS6iYfQ2AxvVuvxRrrP+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6O3nMLtx/j4E4+rjTfCSw3bY4+zi4LZ2VjqsV2a7kI=;
 b=SXgOUP6bUvDOjSFkUePtO2DQStK7wsoFHJwaABz5ucMEw5dDb82YcGPiQopXZqrY4xwgOpDXmev7JNx3fvJuVVU2hPo5/7bqTh1a2j9qgYeDcgTDsT93bSOcvPIAKX+nSTPRqZ2k0BWOSKEB4pnwYM7xQ6NkmResvsCmTvFXMfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 13:35:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 13:35:58 +0000
Message-ID: <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
Date: Thu, 17 Aug 2023 15:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0517187f-39be-4c85-f015-08db9f26e384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rf9ceO0hWJ2KW7PjOLGFM/mXQdWEXnq2vS0IJmCPTbrPYgz+QBNBFyi/DnJtktX0qwAKz2HxVRpGui/Gy638ODBQmXnkIMZuj32uczWWeI8wtVMyaS8LQ+/nf78r4ddheED7pOxoo/2PUAPUrXj7feNNT2UGc4WIjMZpX1mRQvO4pALBBxvsatiqpmJeuZHkOvdnNwd7p0PP3FjGj0bp7qkNIBdr9wiP/BTid7/6O6d+cdAw8We72TtzaV+09SwfWh+mPf1dPwY3ubX8vy/M+63MS2esrpdjHHq3yaPpPq/gyqXYnxCWKHY3Jlrrr93YZQsHvew5nef4AcWz6++GnGgsyNNvuzX3p27oj/yWOiDfPrwlb1YMtIPNXNQSPZ56+Yq51Y6+XIWjXEMQCvaMwNgvWe/OrLE6cin0wg4O1Bt9xLAa+GIe3tcECWapp9dfi5lv2S+dEetGIDwbu6zPJZkx5nXoTvs+9UrGDEUUdgu3RBleDGHklcMyREHjyv1Y1uUTES/3McwL3oerWDvePnvqBkk0/WVxz51FVzBDVVyOCeiD1HbjBCSsw3iZuC6aV/vqDkVNIgFdvkc9gA1KUMxIPZGVacPEUbCm1F4W3/4PJC+u6+y1zPHyufmPzxHDjXznXfkkKW+cRC4d6/QYCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199024)(186009)(1800799009)(316002)(110136005)(66946007)(66476007)(66556008)(31686004)(5660300002)(41300700001)(66574015)(38100700002)(8676002)(8936002)(4326008)(26005)(2906002)(31696002)(83380400001)(478600001)(7416002)(86362001)(53546011)(6512007)(6506007)(36756003)(6666004)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRoNkZmNHVsL3c2alZEUHRha09MVDFnaXlybEUzemVqOGswQi91cHAyZDdK?=
 =?utf-8?B?V0QyL2RoWFB1NS9tTWJrcE9IOTZjNXV5YWJwVUZFQlllRy9YV2dPYVpNRVV5?=
 =?utf-8?B?WmczOEhENmNVbVQ3LzF5ZkJXN0hKM0xKNmtER1ZTUW1WL3p2TEJyenFrQkEx?=
 =?utf-8?B?V2J2dHZQdXJUTDhWbXJBb1QrMGRoTi8rYndDTjUzZzBtV1JCTUhoN0xOZk1R?=
 =?utf-8?B?RENyK3d5NkJPZ0UzeWlVMWpqMHJaRU94UnJmTUN3MVUvckY3Tmk2Ky9yWmFD?=
 =?utf-8?B?TTNhMStvelIvYXh2WlhRTk1uM3JWOGNPSWs1WVVnUFp0bzZaU2IrUEw5U3hl?=
 =?utf-8?B?V2c2MU1oaXFadWxUdjQzblJMenZCdndXTFppYy9LWWhESmxES1paU2xrSkth?=
 =?utf-8?B?UVRXdE9PNmkrano1em85NHltUS9XSlhabmtOL1dVZjNQSi9aMHdhQmlzcVE1?=
 =?utf-8?B?NHp4bXdxWkF3TjlhMWZ0TlRCaTR0c2JxNVBWZEp3VjdxeGp6UTdCRVZiWXE3?=
 =?utf-8?B?Qk4vWGhvZm5EajU0OTl2TmZ1YjRQQTF0Z1JkOGp1VmFRKzI2bytITi8xUURh?=
 =?utf-8?B?ZmQ4NnNORjU1bG5hOHFsQjVyK3QvWjQrbFRQclMzNWNwOVB1ZUQ3Z0RVVlhr?=
 =?utf-8?B?RmlvMG5XTFVNS29iU2pESnNuRkF4TjVuVmsva2pGUnozY1ZVczJBNUJCYmk2?=
 =?utf-8?B?WktvalRSL3l4SnprbFQ4eWNVYWhicG1XZUVac3ZWM3R1c2tFd29QK3h6VDNQ?=
 =?utf-8?B?d0w1ZGhiQ2kyRmlDdXo0L2taU1duR3RYKzVPelFUcndFZThuQk9ScHZac0xB?=
 =?utf-8?B?SlJWODdtTGVYZzBPMkJ2WjM2cC9SVTVxWkdzRWcvL1dlY09NbWp3QWJmQkdj?=
 =?utf-8?B?U3dFRHBiR0Z3QnhaaWpiUHdwY1ErdG1OTHVrQjJ6SmZGV0Z0QUJ2MlVpMEx1?=
 =?utf-8?B?TWF2U2I1ck5SVmN5aFVDYW9IZjlQeE90RXVRWjZmNGZuNzhEMnJjTnF6eFc3?=
 =?utf-8?B?c1FodmhkRElIV24yV3BMQ0NMWEZQWUJCQitsVUp1Qno5RkxUc1lTbEJ6S1ZF?=
 =?utf-8?B?cUdPRzVCQ1RNUXVNQUpOcG1aTmJVVTNTUVNMOEEyVSsxamdCRXdzU0NVeDRV?=
 =?utf-8?B?Tm9nN2kvNkF6Nll1KzZKM0xzZDlHREVvcjZuWmhqUVRDaEZzSE1RNnpjbnd2?=
 =?utf-8?B?RW9aOWlZai9aSTA2TzN2OFJ6OC85eGhKUlRwTC8wLzRqdWlyTm1aNTcyMHIz?=
 =?utf-8?B?NVUreWE1NERic20zcHNjUnFySzVVN0t3cndwMEpETjlIZG5jNFJoNzh6ZWtr?=
 =?utf-8?B?SDJsR3JRLzBsSEtFcUhJYlhmVXlGREoxZjExUGIyNEYxbUVBcmorcGcwYmVu?=
 =?utf-8?B?YUtscHZ1ZlU1Vnh6OWtlNk1RZnZZelBPQWQ5cEs4eWtGZE5IYTlzekNZdG9G?=
 =?utf-8?B?Yk8vK1NBeE16aTk4Zm9ucWorb3A3OVozdlU3cjJVbEFiNitRNE5nQmI2NGZl?=
 =?utf-8?B?dExhbFJVb1pJUkJHc1N6N0EvU3FQYlhUUHNkcjVORm1yOTg4YUdKT044c3Fw?=
 =?utf-8?B?QjZRUWxqVnUydVlTT1JEcERPajVMbHBKZjNSOUMxd2QrM3N0YVBCK0dpRXln?=
 =?utf-8?B?UUpIM0JKdkRUZmxNejZWcndESUVFMVgrVU1ZR0o2ZkFCM0R4aEZTdGJzd2Qv?=
 =?utf-8?B?YmtPMGh2cEJJdFRSemxtUXdqenk3aVFpRVR6d0xseWJGblZtVGxWeUxqSnFS?=
 =?utf-8?B?RjJNUlZWZzZRUUJjaWxvMDNSK0dOMU1PMjFya3lQYUpHTjVFRTlINHhoN3Rr?=
 =?utf-8?B?eStsdmtWSithQ2FzeGtPZFoxeWpqdmVyV2RzVHcyUmJtZy9WQWZ0SCtaTWVD?=
 =?utf-8?B?dXE2SmxMY1Q0YU5pYkZ1QWhRYmMycjNTczBmbmJCSFRSaUhwczNsWW5iUjl4?=
 =?utf-8?B?Zmx6Y0ZOaUkrVG1iM01EbURPdlFmK0E4MndKSnFFcXJjSkNCYUxqQWY1aStN?=
 =?utf-8?B?a0pybUgvRGo3TytuRTBzY2kwVVBMVjVDcjNHcmN5UjJrZmM2TlJGelFjU2pY?=
 =?utf-8?B?NndFOGV0dDdqRmx0S2F3b1ZvMUtFZmZsaS9RSEZjMjRKc216Q1VsVlh3eHRw?=
 =?utf-8?Q?pI4u7iAAghtNhERRCB4XJB9AO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0517187f-39be-4c85-f015-08db9f26e384
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:35:58.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fMXjdDnQq99IYrRhe30OW29lsdEGZwg+j0h61yjKcVEFs7he72WMeLuvIzlqfDm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.23 um 13:13 schrieb Danilo Krummrich:
> On 8/17/23 07:33, Christian König wrote:
>> [SNIP]
>> The hardware seems to work mostly the same for all vendors, but you 
>> somehow seem to think that filling the ring is somehow beneficial 
>> which is really not the case as far as I can see.
>
> I think that's a misunderstanding. I'm not trying to say that it is 
> *always* beneficial to fill up the ring as much as possible. But I 
> think it is under certain circumstances, exactly those circumstances I 
> described for Nouveau.

As far as I can see this is not correct for Nouveau either.

>
> As mentioned, in Nouveau the size of a job is only really limited by 
> the ring size, which means that one job can (but does not necessarily) 
> fill up the whole ring. We both agree that this is inefficient, 
> because it potentially results into the HW run dry due to 
> hw_submission_limit == 1.
>
> I recognize you said that one should define hw_submission_limit and 
> adjust the other parts of the equation accordingly, the options I see 
> are:
>
> (1) Increase the ring size while keeping the maximum job size.
> (2) Decrease the maximum job size while keeping the ring size.
> (3) Let the scheduler track the actual job size rather than the 
> maximum job size.
>
> (1) results into potentially wasted ring memory, because we're not 
> always reaching the maximum job size, but the scheduler assumes so.
>
> (2) results into more IOCTLs from userspace for the same amount of IBs 
> and more jobs result into more memory allocations and more work being 
> submitted to the workqueue (with Matt's patches).
>
> (3) doesn't seem to have any of those draw backs.
>
> What would be your take on that?
>
> Actually, if none of the other drivers is interested into a more 
> precise way of keeping track of the ring utilization, I'd be totally 
> fine to do it in a driver specific way. However, unfortunately I don't 
> see how this would be possible.
>
> My proposal would be to just keep the hw_submission_limit (maybe 
> rename it to submission_unit_limit) and add a submission_units field 
> to struct drm_sched_job. By default a jobs submission_units field 
> would be 0 and the scheduler would behave the exact same way as it 
> does now.
>
> Accordingly, jobs with submission_units > 1 would contribute more than 
> one unit to the submission_unit_limit.
>
> What do you think about that?

I think you are approaching this from the completely wrong side.

See the UAPI needs to be stable, so you need a maximum job size 
otherwise it can happen that a combination of large and small 
submissions work while a different combination doesn't.

So what you usually do, and this is driver independent because simply a 
requirement of the UAPI, is that you say here that's my maximum job size 
as well as the number of submission which should be pushed to the hw at 
the same time. And then get the resulting ring size by the product of 
the two.

That the ring in this use case can't be fully utilized is not a draw 
back, this is completely intentional design which should apply to all 
drivers independent of the vendor.

>
> Besides all that, you said that filling up the ring just enough to not 
> let the HW run dry rather than filling it up entirely is desirable. 
> Why do you think so? I tend to think that in most cases it shouldn't 
> make difference.

That results in better scheduling behavior. It's mostly beneficial if 
you don't have a hw scheduler, but as far as I can see there is no need 
to pump everything to the hw as fast as possible.

Regards,
Christian.

>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>> Because one really is the minimum if you want to do work at all, but 
>>> as you mentioned above a job limit of one can let the ring run dry.
>>>
>>> In the end my proposal comes down to tracking the actual size of a 
>>> job rather than just assuming a pre-defined maximum job size, and 
>>> hence a dynamic job limit.
>>>
>>> I don't think this would hurt the scheduler granularity. In fact, it 
>>> should even contribute to the desire of not letting the ring run dry 
>>> even better. Especially for sequences of small jobs, where the 
>>> current implementation might wrongly assume the ring is already full 
>>> although actually there would still be enough space left.
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> Otherwise your scheduler might just overwrite the ring buffer by 
>>>>>> pushing things to fast.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Given that, it seems like it would be better to let the 
>>>>>>> scheduler keep track of empty ring "slots" instead, such that 
>>>>>>> the scheduler can deceide whether a subsequent job will still 
>>>>>>> fit on the ring and if not re-evaluate once a previous job 
>>>>>>> finished. Of course each submitted job would be required to 
>>>>>>> carry the number of slots it requires on the ring.
>>>>>>>
>>>>>>> What to you think of implementing this as alternative flow 
>>>>>>> control mechanism? Implementation wise this could be a union 
>>>>>>> with the existing hw_submission_limit.
>>>>>>>
>>>>>>> - Danilo
>>>>>>>
>>>>>>>>
>>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a 
>>>>>>>> large
>>>>>>>> number of drm_gpu_scheduler are used. To work around the 
>>>>>>>> scaling issue,
>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>>    - Pass in run work queue
>>>>>>>> v3:
>>>>>>>>    - (Boris) don't have loop in worker
>>>>>>>> v4:
>>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into 
>>>>>>>> own patch
>>>>>>>>
>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

