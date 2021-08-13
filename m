Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB683EB479
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 13:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EB66E5C8;
	Fri, 13 Aug 2021 11:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65836E5C6;
 Fri, 13 Aug 2021 11:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbTvMwYDA3POlR9+RJKccVRL3yHoQiLPKqVNdO/oRBFbZpcbUXTwHFlezZEhQv1+9dnHc26EZCu6KzarfZFD7aruxSn7i8bRhW7MvMXZHhAZQ5tIQSAlxSQ2FFDSwjydAawlNaUQVa039Dt5PgWzwNIxbv2BX/2qR4xHeeTixxfDWmN8YN0zeiPo1HQ9GBhEnaate7zXInr6BMTfNgT7TVvCb4JVDVcXRI55i3JA80Fv077LwWNMeX8j6REJ6KuFH2Q5SdxBAJDj1wl2uu6Y8fxfcHfS5ZQ8Y3K0A4/6aMwH8v3/1VU++eqV3kRyFGteTl/nnDqW4m7k5Jg6XPb49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boPAaIvsHPI3KwXwNc4hFUqZs88BuhyfIE0mFH5rG2c=;
 b=fZwR7xfUqK0v9LRmD2ao8w8zpjcTsYUXRKExPbkbZmlVDUa1oWC6InH9eWrBdmqY7WyylkVGc9g4Y30Cfb9pVO1cNeTjft8KHxQEWh1x4l41J2uritttG3ERqIvher8UgSQ83GCP10evujAw6Q0LywbeyjmKKRjpV2idt9BY048WZ6XWzVwQNrUxSLdOKYfjbmS+uEz8ZX4AiqYEAcWmX7zkgKZcoVH0R7Gai2Y2+Bmt+HtGwBZ3Qg5SEEC/+W3EoAUahpp6GeLpL6e/vgUlyJ4uDlLu+CsulTm1i/QRzB1NjSl5GLe4qg7mcr0msjaxR0GtPPTRbv0sA5tVMO8kgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boPAaIvsHPI3KwXwNc4hFUqZs88BuhyfIE0mFH5rG2c=;
 b=zKZHP7IbTWHKF2etseV3ZvcOTk/v7fyCd0x9FLvj7L5C+I+a75xqW/YvuNH8Dl7tNCN0G04c1VUsfWJ7i0+gCs3FpKo8I0D5o00czJ/UPtFPlvSxnl/uPTgkyPcHVPGnhNg0981nPSryNhA7hR1kVHJhbpmdkaYPA4bduR0x6lc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5077.namprd12.prod.outlook.com (2603:10b6:208:310::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 11:18:26 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.018; Fri, 13 Aug 2021
 11:18:26 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
 <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
 <194e8a33-1705-d19c-add1-38941b6d9b5c@amd.com>
 <ae81d7d1-c111-1d24-6be0-6728ce9ba36b@daenzer.net>
 <61cb9cf6-7700-4654-e160-e8a74978123b@amd.com>
 <1cc96257-6401-7d5f-6fec-6b1cbbbe4005@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <00f6d35c-20bd-bc6f-3eb5-2a8b5af06e44@amd.com>
Date: Fri, 13 Aug 2021 16:48:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1cc96257-6401-7d5f-6fec-6b1cbbbe4005@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::13) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Fri, 13 Aug 2021 11:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de9638c-5ff9-42a8-cda6-08d95e4c122b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5077B8C79935FBF562D2DE1397FA9@BL1PR12MB5077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieiWeCSUk4c7Z2qAHWXd1d5yemcg4NoicgWa+vk+U5AWHdiasttoGw3IhEMLxudxUu7roIK+KmEBUk5eNpwyVpZXqSL0ZyaE2njLq46Z2OJ8ZQvzNGqtDFmc6XXDPAOFM4zSu0uIc2pwPZHrs9YqM7A2rI3daI94jwx6SCKdffURu430D/EcLwneoEeLSGfWKZsdYFlMgoNQcELh9A/sN2kyyk7uaxYDTrAcs+q62YSEEXb+IUMgE63+BoBWWP2+dycBBU4xyhKyUV40ZV2ODh/4RL2hnJvw0OebtGQyqCbUIJkkPq79W4obfp7WEAY+RPYahRAW35tBqFw+m6DhdCSDbUSz9/8rFl3iTqrBvmxgtXhC70IZ9kOMHsMcUUNv95ibgzC4fQMnDgs4kflIrwyfMaGIi3INRz29PRSTd3nBFJ3qyirQ1l17pOrvLZdFYN/coEtiM1FupHkPcAmiAV3fPyh/YqMeNH1XhkmjDfAfgl7To67RvW1GrwV7g/UkSyHjYSA6w5LyMEJMeOJTSXKvgaCRNk4AEmN6fJf3jmXxnClJGWPSmD3ZznD6Y+Dk7oSYQH9QYyYoZkwN2x8Ml3L8c5dfkVyEnh8qISi8Ip6q7c1SsAK6J0jyxetHjQsL5wnh/9BcR8LQgm0hAbRkG34vmeZx4KePOOM1PQ+WEo8JW0Dd0DqP023RPxOfMp2W9grHk1V0LyVWqaAWA6hj19kLUkcObxytESw4bv5v8sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(66556008)(66946007)(66476007)(186003)(26005)(8676002)(6486002)(8936002)(86362001)(2906002)(956004)(2616005)(110136005)(16576012)(6666004)(54906003)(316002)(31696002)(4326008)(38100700002)(36756003)(478600001)(6636002)(53546011)(31686004)(5660300002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCtRdEJOTlVzK0JObU8rY2YyaFR1TldiNnEzNnFSOXBvY0FzWW5wd0ErYUI2?=
 =?utf-8?B?alBrajgySU5nME5oUnVsQzNzM1hhQmpFSGRyRGNaUUcwWlRLOFJ0aGhlbVAx?=
 =?utf-8?B?M1BWSXhGZTFralBHNXZRWThJbHgrVWxsK3VJbk9ZWHlyTk1OWXJXUFBocUpI?=
 =?utf-8?B?WnJxNktVQUdjVk1FWjczbDFjOUZjUlNheENaMEx3Um83S3lRRTZJbTVxdE4r?=
 =?utf-8?B?VG9qK1UrMlE3RmpJL1JrVWh4eFNOTEdzY1JBa0NhcEZhQ1hYWkFqUFF4RDlZ?=
 =?utf-8?B?VUpSeS90N2pHMDByZjZzY1hPYnR3ZzZUeFpjV2FNSjlCbUNiMTFzS3lGNWRr?=
 =?utf-8?B?M29SL01RS3ppS0I0Q25Qc3Z6VUJwbmhxTENOcFBIdStSYzR4VTRMZHBBbzNL?=
 =?utf-8?B?Znl2VTZkbVJZWDlkQ3lwU0NabVdSai9CMVhVcDRzcThKaHY0eUM5M3o5ck52?=
 =?utf-8?B?eFMxazVMYXZtREtLWXhMRm5oRWcrTnZGUzQ4dXhFeTU5NHdBeHRmVVFWM3lG?=
 =?utf-8?B?a3BQWG44Q2RpaVdnZDNQSGlIRjEweTdNczVRTXBUZUQydnQyMHB6enpQQTF3?=
 =?utf-8?B?RjdWZzUvYmVNRlZKaUlHTFZUb0t4c0ZKT1R0S2NMcGRzM2JrTllMY2ZpVDR5?=
 =?utf-8?B?eE5jTnpHWnArTzNDOHZvYWplSFYxTjU1aXhQWUtCL2MwYlZ4Qlh6VmVlclh2?=
 =?utf-8?B?UnBvUTZpUSt2M0syajFaWWxGRFVuYkQyVWdvdFU2L1ZTQ1FnbGV3UWxJU3JN?=
 =?utf-8?B?Z2dkYVEvbmJZTGZJRFVEMTM1dm5udjNJZ2VlM3E0cGZKRWJzcldad3Jucnpt?=
 =?utf-8?B?V3JoNkFkajZ5WlZ2dGtzQzZoRkRBUklvREFSK1VqRDA1eC9IT1ltRnNXQm92?=
 =?utf-8?B?cUxkMmswdXpRK0xBMVk0ZXg1NnUxVVJrc3l0MkowalNYbGN6dzdyMDdIRFFZ?=
 =?utf-8?B?M2twM1lCdVFuOEZkcmVsNGpKUEU0VXIzQnR3NHc5bXBZVW9KeWhNaHF5eE9o?=
 =?utf-8?B?a2dleW1rSkNjVXZWUG5RTk5IbVUyNkE3NnlmcjNmNXNWNzN3VzdoWjFKWEdn?=
 =?utf-8?B?YXZKUlE3ZUIwTjUwR2d6TndCYWVoUTdtMHJLTngzZW81Sm03Z3BXT1dpNDVP?=
 =?utf-8?B?WTB6OGQxMmw2eGd6MnJxMDROWHF1bTdiOFlYMTFaMVk0ZDRNSGh4ZlA2amlr?=
 =?utf-8?B?ZHJFaXlmUFJudktHbWh1QW1PZG0wV0tVR25YaVZ2eWJsb2dlcDR2K016Y3dN?=
 =?utf-8?B?WDdQUnhBeTRYNmRQbGZTdUFUZmU2SElnNjRSeklpM1BzS3d4NjROaVF2dWtM?=
 =?utf-8?B?NTlZb2c0WWdVNnN4RzZldHpwM3VzdTVzU2xYQ09xM21lS2FXZXJWTHNkZGdP?=
 =?utf-8?B?UTZ4VEM5bFpJU0YyUlFZbUpuY1hGKzdjUmdDOVNGTlJkMExEdTJ4MlBxcjdV?=
 =?utf-8?B?cUIrMTV5Q2lnUUpzM1RpcmZSaXJraWVlZWo4UFIrZ2EyZ1g2dzV6VCtzU0dO?=
 =?utf-8?B?TVgrRjBuMWpsdm1aUmFDd294UjdPUmhYdHI4aW5YZWhKTm1lN1RFbWt6SFBj?=
 =?utf-8?B?TTNmYTloSEVBMSs5em5vejRid0IvVjQzOFFHNjF5OGxNdG50NlVmSFZLQzR5?=
 =?utf-8?B?N3AxSkdpZUx0L1ZHRVNpN1lDVGpNblhGcitwUWt2Tjd1bHlWRkZodmM4TE41?=
 =?utf-8?B?cU9YR25xbTljRDFTUXRQemZLUXlxSEsxQWpNZmxQbTF5dWlKbWFlK2lHNnkr?=
 =?utf-8?Q?EXvlF9XaUfT/S1RTWR4PAPzTM0c9wZHmg6UChJJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de9638c-5ff9-42a8-cda6-08d95e4c122b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 11:18:26.6973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIZ2JFJ5JZidqJqKu3FbkPeaez5XpuAyE6o9QkU74cWW0iSqu75EqFC3++sKGilQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/13/2021 4:01 PM, Michel Dänzer wrote:
> On 2021-08-13 6:23 a.m., Lazar, Lijo wrote:
>>
>>
>> On 8/12/2021 10:24 PM, Michel Dänzer wrote:
>>> On 2021-08-12 1:33 p.m., Lazar, Lijo wrote:
>>>> On 8/12/2021 1:41 PM, Michel Dänzer wrote:
>>>>> On 2021-08-12 7:55 a.m., Koenig, Christian wrote:
>>>>>> Hi James,
>>>>>>
>>>>>> Evan seems to have understood how this all works together.
>>>>>>
>>>>>> See while any begin/end use critical section is active the work should not be active.
>>>>>>
>>>>>> When you handle only one ring you can just call cancel in begin use and schedule in end use. But when you have more than one ring you need a lock or counter to prevent concurrent work items to be started.
>>>>>>
>>>>>> Michelle's idea to use mod_delayed_work is a bad one because it assumes that the delayed work is still running.
>>>>>
>>>>> It merely assumes that the work may already have been scheduled before.
>>>>>
>>>>> Admittedly, I missed the cancel_delayed_work_sync calls for patch 2. While I think it can still have some effect when there's a single work item for multiple rings, as described by James, it's probably negligible, since presumably the time intervals between ring_begin_use and ring_end_use are normally much shorter than a second.
>>>>>
>>>>> So, while patch 2 is at worst a no-op (since mod_delayed_work is the same as schedule_delayed_work if the work hasn't been scheduled yet), I'm fine with dropping it.
>>>>>
>>>>>
>>>>>> Something similar applies to the first patch I think,
>>>>>
>>>>> There are no cancel work calls in that case, so the commit log is accurate TTBOMK.
>>>>
>>>> Curious -
>>>>
>>>> For patch 1, does it make a difference if any delayed work scheduled is cancelled in the else part before proceeding?
>>>>
>>>> } else if (!enable && adev->gfx.gfx_off_state) {
>>>> cancel_delayed_work();
>>>
>>> I tried the patch below.
>>>
>>> While this does seem to fix the problem as well, I see a potential issue:
>>>
>>> 1. amdgpu_gfx_off_ctrl locks adev->gfx.gfx_off_mutex
>>> 2. amdgpu_device_delay_enable_gfx_off runs, blocks in mutex_lock
>>> 3. amdgpu_gfx_off_ctrl calls cancel_delayed_work_sync
>>>
>>> I'm afraid this would deadlock? (CONFIG_PROVE_LOCKING doesn't complain though)
>>
>> Should use the cancel_delayed_work instead of the _sync version.
> 
> The thing is, it's not clear to me from cancel_delayed_work's description that it's guaranteed not to wait for amdgpu_device_delay_enable_gfx_off to finish if it's already running. If that's not guaranteed, it's prone to the same deadlock.

 From what I understood from the the description, cancel initiates a 
cancel. If the work has already started, it returns false saying it 
couldn't succeed otherwise cancels out the scheduled work and returns 
true. In the note below, it asks to specifically use the _sync version 
if we need to wait for an already started work and that definitely has 
the problem of deadlock you mentioned above.

  * Note:
  * The work callback function may still be running on return, unless
  * it returns %true and the work doesn't re-arm itself.  Explicitly 
flush or
  * use cancel_delayed_work_sync() to wait on it.


> 
>> As you mentioned - at best work is not scheduled yet and cancelled successfully, or at worst it's waiting for the mutex. In the worst case, if amdgpu_device_delay_enable_gfx_off gets the mutex after amdgpu_gfx_off_ctrl unlocks it, there is an extra check as below.
>>
>> if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count)
>>
>> The count wouldn't be 0 and hence it won't enable GFXOFF.
> 
> I'm not sure, but it might also be possible for amdgpu_device_delay_enable_gfx_off to get the mutex only after amdgpu_gfx_off_ctrl was called again and set adev->gfx.gfx_off_req_count back to 0.
> 

Yes, this is a case we can't avoid in either case. If the work has 
already started, then mod_delayed_ also doesn't have any impact. Another 
case is work thread already got the mutex and a disable request comes 
just at that time. It needs to wait till mutex is released by work, that 
could mean enable gfxoff immediately followed by disable.

> 
>>> Maybe it's possible to fix it with cancel_delayed_work_sync somehow, but I'm not sure how offhand. (With cancel_delayed_work instead, I'm worried amdgpu_device_delay_enable_gfx_off might still enable GFXOFF in the HW immediately after amdgpu_gfx_off_ctrl unlocks the mutex. Then again, that might happen with mod_delayed_work as well...)
>>
>> As mentioned earlier, cancel_delayed_work won't cause this issue.
>>
>> In the mod_delayed_ patch, mod_ version is called only when req_count is 0. While that is a good thing, it keeps alive one more contender for the mutex.
> 
> Not sure what you mean. It leaves the possibility of amdgpu_device_delay_enable_gfx_off running just after amdgpu_gfx_off_ctrl tried to postpone it. As discussed above, something similar might be possible with cancel_delayed_work as well.
> 

The mod_delayed is called only req_count gets back to 0. If there is 
another disable request comes after that, it doesn't cancel out the work
scheduled nor does it adjust the delay.

Ex:
Disable gfxoff -> Enable gfxoff (now the work is scheduled) -> Disable 
gfxoff (within 5ms or whatever the delay be, but this call won't go to 
the mod_delayed path to delay it further) -> Work starts after 5ms and 
creates a contention for the mutex -> Enable gfxoff

When cancel_ is used, the second disable call immediately cancels out 
any work that is scheduled but not started and it doesn't create an 
unnecessary contention for the mutex. It's a matter of who gets the 
mutex first. Cancel has a better chance to eliminate the second thread 
possibility.

>> The cancel_ version eliminates that contender if happens to be called at the right time (more likely if there are multiple requests to disable gfxoff). On the other hand, don't know how costly it is to call cancel_ every time on the else part (or maybe call only once when count increments to 1?).
> 
> Sure, why not, though I doubt it matters much — I expect adev->gfx.gfx_off_req_count transitioning between 0 <-> 1 to be the most common case by far.
> 
> 
> I sent out a v2 patch which should address all these issues.
> 

Will check that.

Thanks,
Lijo

> 
