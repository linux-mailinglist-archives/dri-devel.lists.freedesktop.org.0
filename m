Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644547AF7D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 03:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454FD10E0C4;
	Wed, 27 Sep 2023 01:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE2B10E0C4;
 Wed, 27 Sep 2023 01:55:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4AmyNnXVTw5n0WPLROV9CBNbsvPAQrbTVJv37sCfTSx77vb5FrLJyUIOukaUK0LZYDBHWZKAnnFZrjTxDd5dw664522sNcn4Tn9gk5q11IazwB0sdME6wGhUR2S3tEy4lOCHwMlE5LB63xMEFeaf0+zlO4T6EXqMERN8Q058fNOzrEPYt8NTJv6Bn8rKBQPzBrHq6nmjzDMyYWkuISZIzBqlZnkl1mzn9dvbj9pkIZemBJtOL5tODaVSQM5f9MhjU5jKbDt2CGTitjECkSOSVVBxJ7nuCGJ/hIm5hQKkm7GIpmOveOdBrmujtbPd41kNlyQoLsMah35+v2QsdPX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59StD5zN2ASZwvtB/WbPHQzJgiWADu7ZHr9mGkcCfmE=;
 b=Fyq+tP/dpRP/Sdr/Ir9NiAHqtIrVHF54e5rxyGsVmgVPceZflUkifSZoA33Oa+FK6Fy6yXTm4Kn7bVViIjvcGS73mPdj90fbehnjICBwxUit9wY/Wf3w8P5V7NDVrdblPgmAAr3rijBZxv8uZqr0xAgl6mBIjH/yrMaRz192YVmxd+F96GnuZyTDH4sRZFIOgKTVXrPpO4nFnqmKLukBD7skHYuv+braM5hCpYm2QN/NOS45Uz7/iOGsyh8NX6pbePmnMTR1PuJs8z2FVxmjPUZfw1WcchQ3n3FfF0ouYUWAcGl0XWgG6hWrnYwiIXnDoCJUfrBiX0CjsUwlcUNuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59StD5zN2ASZwvtB/WbPHQzJgiWADu7ZHr9mGkcCfmE=;
 b=vGpTqhs4xu7sea5u0RH+kcrzSwGCJruK/WiQYgCM2WxqK3wwLJWqEUcIoiH4Su5djbK0wwWuBjFWcVv4WGncKjAivQOzrvgV0srgUUsxQg8tZz729/SthT7UGfu0Zl+q4mFwbQnqdk7cBH+06kJoc5Yu+C6JxmvBNCuW+y7gU1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.21; Wed, 27 Sep 2023 01:55:23 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 01:55:22 +0000
Message-ID: <13310d31-9173-4529-946d-62ac8841659b@amd.com>
Date: Tue, 26 Sep 2023 21:55:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
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
In-Reply-To: <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::25) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 4184df50-a3da-4132-d534-08dbbefccf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6eqhfF4R7iKL1q5w7qa5DsYez0zPII3WnydGQP3DreYM7H+u5v5P4hNy/hBvcxmr/AW9BU5f5pm1gasDQ98GiYeWqRSagy9Vpvy019SCBjWLFgNIhRExjx3eU+/Z82Y5aRC2okOdDaggaY312dnFNGFpML8svZeRybivf19vuoV5iZ2ICgVzvJ2En3JWi3ljfYOY9RTei43s/ivKJJBv0ihodkDk0N3YCuV9qqhUbkKJJWgeuDtqRY49IRM95vciRNPdvNDFr9KBI59uct/kjmPtewhmItsiKTXb9nR/OBOI62ll1nesB57+jR5/0noIspyU+ArCTxXVQ0QKH8DD9kPEXkyW/U6H0p+5HJJGOEjsHzQ9OInsQpzsz6NKdKx/QdWdnn5JBk1jN8j0raWtnd97YqnlPdyGPl3Geiau66Aq5vtbh8+xajK9MHYal185C3f8XzE892cum9rDU3SfbetMbJhLvSNoe7qwYl5+KJrHgY3de3vWU/IiyFKVurl2KglVOYuiH0y9acXfMa35TilCNj6PK4ZGK+CvGbs7+Jjjcd39YH2jAkQY+XJg9T2pAv6BpaKeuHZV+2EvUU+1o0Feb/d/yZBN20I8sLDO331Q8Ez3YnuNiWQfmN7xkD3Qm+eksbHxesca0t3LDt2hiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(5660300002)(44832011)(8676002)(4326008)(8936002)(83380400001)(38100700002)(41300700001)(66946007)(66556008)(66476007)(26005)(316002)(31686004)(2906002)(31696002)(86362001)(6486002)(6506007)(6512007)(66899024)(53546011)(478600001)(6666004)(36756003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlHR2c5d2hSM2xUUTVuR2pOakRzMFlZczF5aHRkV2dSY0RoaXNpTysxTS9m?=
 =?utf-8?B?N0R0VVJXSkh4bTNTOFFENkd5bkpld3lLU2F5cTA2YlhpdEdFZmtRMHg4UGNn?=
 =?utf-8?B?YXJ2WEplbjFTYVN3c2pyS2FMMEROSWdJbEp0S3RQUHIzZEI5RWFJV1ArZmRM?=
 =?utf-8?B?c1BOaGFqd0VaaE9SNGhpTDV6b2FFNGUzTTZWeUd1aExJMmxEQnZObDN4cVBJ?=
 =?utf-8?B?T3BIMWdiUmE4NEdZQmt5QkxvYmNKVnRlYXFkZkZlWEx0eitSLzZEcWhQVWNz?=
 =?utf-8?B?YnpCQmZwRTBnbms4MW9WaTZQUXZUSmNjZlRMdzQxTlg1Vnd0M2pkV3gyME9P?=
 =?utf-8?B?SzI2dngxOFhJZnQ5Y3NRbXNHenAxSFdrMFNRRWtvNHBpNVZmSlhyZkpRc0c0?=
 =?utf-8?B?SkZDWGV5cGxpWlAzS1hjVmVMQWhBNklyTFR6dFUwRHNtbjAvalNHc0k5dE5k?=
 =?utf-8?B?ZTBmTmR3Y0E1RUxHajkzdlZuYkpna1dqWUtNZFMwZ01EM2owejJPTGk4ZU9w?=
 =?utf-8?B?RXZRc09yMFlyVXJKTEsxdmpEMTRTd0xhME4vcTRmdEpIUTgreVJzK0pOY0tB?=
 =?utf-8?B?WFgxU3BYWnlmZXRMbmt1d1R0N3NrMjJ3aDA1dzVldWlxazB6RmgrWi8yTlhP?=
 =?utf-8?B?aSs1YlU0V2VHOFFtVENjNjMwa3NDcnJIR25zSEloNUJ2bGd3Sk8wRXZsZFdT?=
 =?utf-8?B?WE80Qnd1Y3UzTHRYQmN0SmhYSzY0VW9RZDdoemw4THlNZWRKVkNyRE9mTTJi?=
 =?utf-8?B?UlNWSzFTT20xZ3UwNEhyb0VPZjBZK2dqTUNJRXZrcnpBWnRPVWh3ME9BclBk?=
 =?utf-8?B?dksxbXhNaHZRcVVqaGFFQVZXdG9INDIvc3p6ZWR3ZXNQUm1vTUlMTVV3M2h4?=
 =?utf-8?B?MmsrZW9tSDRyU1JYeEVadS9FNFhySG9IeitaVENHQnZ4cStnK3NqZUR4M0VK?=
 =?utf-8?B?OUJuTW05SGFETit4OWFjdHpJSGsxZVVDNGxBREZIcDkzQXlsY3hJaTVhZVFn?=
 =?utf-8?B?OVhFSU9iOC9wNEU1QzcvOFdpbTNDdlZCYW81dmR3YXBFRkpkTnNyZENVK0Yr?=
 =?utf-8?B?Q2hiL3NsaWxOMDFmVnlleWN5R3Bka0dnN2w3L1lqVkY1Z3pnUDVXZ083WE4x?=
 =?utf-8?B?RHprMk9VK1NNTytTZEdVaEpkV0w2d0xMTVpZZ2MvUmRaZVlFcHNNSjVXdEhv?=
 =?utf-8?B?RzFyTXJYL25pZURTYTRlUFIybk1MYWk1dW90eVZmWlZGQ0x2RGNmZEtsV2p4?=
 =?utf-8?B?ZmEzWlhKRGkvWWlqSVVISXFPSjUvemxSbnI3OGlUdlRxRW5SRkRKQ0hBa0Nl?=
 =?utf-8?B?cGxpS1l6aEZJSUFNRXRvWlpldC9qNVZHNHRvajFFT0RibnhOd0tibmhSRG81?=
 =?utf-8?B?RG5BUWRBWWhOMThBNld5cjVIbklrVjZmdWpIM2pEMjZDSU40VW5PMiszNlFj?=
 =?utf-8?B?OHA3cW5YUDdCVG83d2RQZmhQeWo3dWt2cWlNUGlVSFBFU0NTZFBuVWk5dEtr?=
 =?utf-8?B?OEczcVlpSVkxTVJSNW9jRXNlWHpGcHNmbWNkY0oyYWtwMWVFTmlRWGg0cEFo?=
 =?utf-8?B?WURmTUJRZWRUUkFhamJ5Z21yaHZYYldCRU94MU1PaVpYbkFramhVNGVmSzBB?=
 =?utf-8?B?VXREa3lNczY1YzVYbW8yN2V4bllCbFd1TzBwR0VRUmZCK3p5RnFmbjFmWFRI?=
 =?utf-8?B?WkFscnVEcmxuNExYQ0d2aG9JZ2gzNHZOUVZWZTlqRWREbTNjeVJuWEZwbUN2?=
 =?utf-8?B?bVB5WGV5bUU3dCtYOHFmL0xrM3RaK2xTc2h1QlZWQTRwbGRnbkN0S2JXbVQv?=
 =?utf-8?B?ZXdVT0pzOUF2Q0JTemtyNkZVOEtUU0xMQ0RSQVZFNDE0L3VuNDdlMUhSb2Zk?=
 =?utf-8?B?M3FUZCt5VFFWb2tGaDBlM1p0TWtkYjRkOWFUdm4zeHAyMllNRzVaMTlJcFpR?=
 =?utf-8?B?Tmp1LzFqSTloNVRaOHhyWjAxTE9tdTYvMi9CYlBKT056c1IwQjNMdFpHQVpn?=
 =?utf-8?B?RG82MWRiSVlRZzM1ZTYyZlZaczlOdW9IZENuTWhIV0NmT0luZU1xUEZIOTJZ?=
 =?utf-8?B?Z3FYczc4Tkd0OHFCZWNrZWY3c2Rmdk1GOWNnWklsZUlKSDlMMDg2L0NySEp3?=
 =?utf-8?Q?pEQUTFfJ2KCfJTNUbN5WPxVzO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4184df50-a3da-4132-d534-08dbbefccf4f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 01:55:22.4017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFwelwEVclpewo6LDOKJ/EC2YXB6eKM2vg30OJB2tu0paUICT4PZTLt4BC4qgiGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-26 20:13, Danilo Krummrich wrote:
> On 9/26/23 22:43, Luben Tuikov wrote:
>> Hi,
>>
>> On 2023-09-24 18:43, Danilo Krummrich wrote:
>>> Currently, job flow control is implemented simply by limiting the amount
>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>> submission limit that corresponds to a certain amount of jobs.
>>
>> "certain"? How about this instead:
>> " ... that corresponds to the number of jobs which can be sent
>>    to the hardware."?
>>
>>>
>>> This implies that for each job drivers need to account for the maximum
>>                                  ^,
>> Please add a comma after "job".
>>
>>> job size possible in order to not overflow the ring buffer.
>>
>> Well, different hardware designs would implement this differently.
>> Ideally, you only want pointers into the ring buffer, and then
>> the hardware consumes as much as it can. But this is a moot point
>> and it's always a good idea to have a "job size" hint from the client.
>> So this is a good patch.
>>
>> Ideally, you want to say that the hardware needs to be able to
>> accommodate the number of jobs which can fit in the hardware
>> queue times the largest job. This is a waste of resources
>> however, and it is better to give a hint as to the size of a job,
>> by the client. If the hardware can peek and understand dependencies,
>> on top of knowing the "size of the job", it can be an extremely
>> efficient scheduler.
>>
>>>
>>> However, there are drivers, such as Nouveau, where the job size has a
>>> rather large range. For such drivers it can easily happen that job
>>> submissions not even filling the ring by 1% can block subsequent
>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>
>>> In order to overcome this issue, allow for tracking the actual job size
>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>
>> "the amount job jobs." --> "the number of jobs."
> 
> Yeah, I somehow manage to always get this wrong, which I guess you noticed
> below already.
> 
> That's all good points below - gonna address them.

Forgot to mention, title tweak,
 "implement dynamic job flow control" --> "implement dynamic flow job control"
would perhaps be better? Unless that was meant to be "job-flow control"?

> Did you see Boris' response regarding a separate callback in order to fetch
> the job's submission units dynamically? Since this is needed by PowerVR, I'd
> like to include this in V2. What's your take on that?

Both of them have good valid points. The whole point is to guarantee forward
progress, and to be able to easily debug a stuck driver. Using a fence
in prepare-job would be easy to see that the fence never triggered, but
if we replace this with dynamic job credits, then debugging would be hard,
as Christian pointed out.

> My only concern with that would be that if I got what Boris was saying
> correctly calling
> 
> WARN_ON(s_job->submission_units > sched->submission_limit);
> 
> from drm_sched_can_queue() wouldn't work anymore, since this could indeed happen
> temporarily. I think this was also Christian's concern.

Indeed. We don't want hardware/drivers to game the scheduler, but want to
guarantee forward progress, e.g. a job with N number of credits completes,
and those credits are added to the available credits, and then a new,
smaller or bigger job is accepted for execution (prepare-job, run-job, etc.).

Feel free to rename "units" to "credits" as this is what is used in
hardware and link protocols, and naturally this is what I'm used to
calling such mechanisms.

I say, implement it, post the patch, and we'll take a look. It's a good thing
and we should definitely develop it.

Thanks!
-- 
Regards,
Luben

