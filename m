Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A57805BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 07:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085AD10E457;
	Fri, 18 Aug 2023 05:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0C10E455;
 Fri, 18 Aug 2023 05:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUy2LJuVmZ1Mhvthadw3sd4cmPaXEU/ze8QPv5tVxaaBNgUE3bZisTNtFvks/4ELU5GxZAVcfLvmHSf3Fip8uZxrbyFurlVgR8vicj5kS7aytRiMmEihKdmtwfT8738/6nqxUSyU4ckdnBeWsE6zLqSO4Sy65y1Z1cda/gkqoI7LXmaH7OppkcI8+YgU+pFvGuJPGHh7FKDuXuPkVgnIXmvJ/1jIVqjpSEbZIPl88UUygo3RJiP5QIfmzIYD/krLbuLJkKn+lX+R7yfiDDYh+V5vcherUiKZJuq+JEMz2ZDDp12Axn1YkMzPf76rEY//nycEedLgBvF2/8lW0hmkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frrM9b6SMbOJzJp1hqK2mzPmUTAvPPcD6b21Ox8fqxQ=;
 b=I69psCrX//u7JNSU3mdI01runy8yOEFhI8UxV6Lah2nAxb+ohD0ICtXsu36QTVcO1jeAIbTfcbW34POdhaqkjQ4Lh2xektY5VOePRqa1Xv8RFZ9Dfc+NG4sCixsbjx+4Ad2RtsH8h6r/cFpEcXjTUIFmse+IbSU4UC5HxXiunBOSg3J+VSF1USHqgBHC8zlOtkkc0TGOzckE6l5YIuPBTllU/NP1jLxBq1NXdw0P9bjAsfxea0NNS6HzMdgi/jEeNLaruGdES8PPQiMYsyf74oMIbOD8P0HG+ruNjW7txMdcY2ePiemsM68mpZnI9UbmnjkZBZ29gPravNcBHYUTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frrM9b6SMbOJzJp1hqK2mzPmUTAvPPcD6b21Ox8fqxQ=;
 b=bkhzisrkXPjy5GbtcexdbaaNRlJP3KMu//yDiH3L5CGPnCgkfT1yhm/uXBow/jmq8pEFx7cFcRdIepIZ+HOIfGKZ/aGIlI6BjecNsqP6QpXOlEw7EXQY4u0bsEE1XX2licUhuxTciXrDh6Q/eqfX6YkuwQy1KCaQf7DL+9eIvG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 05:40:50 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3624:9885:6e0a:5d97]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3624:9885:6e0a:5d97%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 05:40:50 +0000
Message-ID: <3aa630e6-db3e-c03b-b3c2-aca517170a1c@amd.com>
Date: Fri, 18 Aug 2023 07:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ZN7gxBpnZD8OW9ZW@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZN7gxBpnZD8OW9ZW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce17f30-c564-4411-d230-08db9fadadad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOHQwu+WN5kXFtO7BrQ3UwPYQhZGJcb1AQ3oKhZptmN/Pfo9tK05QmJjx91bt3EgodHvREBn972SZWBiyzZyNKD3k2ukkKJyLl9yl3T/1tLvaxLTOS9qmE0QsDiR3e+8MxafOTk3UEPtoKaN7FvZxddO8mNMoQgNTCPNA94apOtmvYK1pA5b+0taf87hXYG0phpMv0wFTynVWfpVySFfDqTTwf3LTmuv/Da2Tz4xeRUhdPE1OF39yVA0y7F14JhbKedM+b9icNK8z8hha9VSjXO4RQs4xnWqJY6ZRn8fJdrAcpKok2T9JlOZYH6b17SfHadOy2fh5WjrWPU6mv/k0sJLNjoF/VFbx9rYS9XVG+L2Yrdn9C5Djvko5XZVTDgY2xTq5wszWGADcGhOcFUdaeVsFeLyeYaFHAgmHwWugWeskxRppJvSM+5RhomxRP+vdjsjDN6gFYtahTrxpqf2MD96n1WmUVhFgLJISnwqj6/UvmQAycuSyNaV9cYQmdLz+mOu0+0qN+jhlSdlPepaANsaD5QCt6UWIqv6nGkmP+WG9TrPynDQWhB5WzwybfczmntrHztMVqcMf6lwQwm2MM8Hh/GM+joi3z4KpR3u7+Sw/xR0bimwjJCZuaUfPDi3lJDf7MLAoFeb4bKA/1aM+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(1800799009)(451199024)(186009)(6666004)(6512007)(6506007)(53546011)(6486002)(66899024)(83380400001)(38100700002)(31696002)(26005)(66574015)(86362001)(36756003)(2616005)(41300700001)(2906002)(316002)(66556008)(66946007)(66476007)(110136005)(5660300002)(7416002)(8676002)(8936002)(4326008)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZwcnYvMk9URkFVSmR6MFpOZmFzMlpINElFa1ozYTFMaG45QTQ0aXdWcGlO?=
 =?utf-8?B?dlg0UjdLbE40TkJrR1ZtSThFdWZpL2lsajVyVEVQUnpXYk1SMVI2Q0EvWmph?=
 =?utf-8?B?aGtzRDRsT0l3TWpUd3hzLzFnQ0NGYkYwRCtzMEZKOWJjVE5kWGxnd3djSnNZ?=
 =?utf-8?B?b1lFNHM1NFIyL0RZZm1XVzROUVpFS0Flakl2d2tObHhDTFRxSnB5ZExHWjZy?=
 =?utf-8?B?RVYwWndZUkNrUXVyVW1YT0ZJRDF5U3o1TWI5eFBpY2pFaW54bFY4NnE3TDJD?=
 =?utf-8?B?S3hhOERkOFY5RlNpLzFCaHNqRklBcm1LRGR1UHU1OWVvUzl5dEQvZUJ3ZHhJ?=
 =?utf-8?B?Y3Q3ZVovdmJxVGRKcXhHQXZMSGhpek10dlZwWlhyQWQxQ0kzQzZuVXkybUFz?=
 =?utf-8?B?VFF1TGs1dXE1K1FNS0lxeWx2clZSa0d5ZDRtdm9ZWXlXYlB0OS92bWxlSHp2?=
 =?utf-8?B?SktXSm12OEJZV05uTkZEdmoraVhwQitLQ05hTVNKYUQzcllIUDAzUGxMclR2?=
 =?utf-8?B?bFhRNTVOVStSTENKRXZ5S2FHZGZFOHN6SktrQXNhNVpjNndqQVF2MHI3RVBW?=
 =?utf-8?B?N0ZBMjNkc1p4bTYxQkpubkhTWVNhTVNpUlNlSnoydGZrODNheHljTnpmSkRh?=
 =?utf-8?B?K25RbG1DMCtpb1F4TVk2RUxzcUtGdUJ1TkUyVkN0YituRi96SnZFYll3SkdY?=
 =?utf-8?B?aUYxaVZLeHdrRzE3M0xTbEI5eWMzaWhxVmFEcXlWTlhDYmk5T1pFVzFmMlFs?=
 =?utf-8?B?THNvUXBFK1RnMmVzU2duNmlrdWZua0dZRkNMWGdFbXAwalU4UmtBbnFYNU14?=
 =?utf-8?B?YjFXZE4zTFRTamE0WHBXbmUxeHR4QmFWR2pSb1BmZ0pZV0c5SXNGamhDS1V0?=
 =?utf-8?B?NFhaOWJHcklGZFlxZjZlemhJWFgzaW1JQ21RVlpkQWt5SlZhaGZzUzl3ZTcr?=
 =?utf-8?B?d0tULzF4cEt3eUtlSXFJc2hCaDRpVitYcGlEemtHWVNjanBPRlpaUXNrNjIw?=
 =?utf-8?B?T2VOalFlbWN1VjBJSi9KaDZpbUxrckRJMUZBVFBhSUZSOWdLN2V3eFFRdlZ6?=
 =?utf-8?B?TVhFNXRramFwaGN6Mno3c1lhYnZtc21mRWwyazd4OXVFNEE1OWRDWjJPK1Zx?=
 =?utf-8?B?bm1NdDZyd2h4bXlkaURFVE83eGNRaUJZdWZOcVNhMnR4WmYxU0Q2RUtUTmJD?=
 =?utf-8?B?cE9XcW9qamZjeENyNCsxMzV4d2d3TXhFdDc2V295dXFkYlp6OWl5RVRBYUEy?=
 =?utf-8?B?b1k0OEFNTGE5VHN3WEZJcU9Lbkh6NzIrTzlzQVZ4UXQvdDl0ZWlTdEtUaW9a?=
 =?utf-8?B?OFl6Z0tsaERrdDhwR2lrMjllb05SeWRITzZRQ01ZUERWRm9DTGpiYkQzRnRk?=
 =?utf-8?B?Yk5ySVh0b3Y5d1N1RnlOQy9UWUlVUS91d1pnaDU1d3pLMUIvRlU1MFpLbzJi?=
 =?utf-8?B?dVNCMlh4OS82dmVGTEZwTnhxZHZINXRkQVpkWnNDblBwV0d3NXBZL2lKajBU?=
 =?utf-8?B?MHI0bXp0U1hDUFA2T01OZ1VGWE44WWliaHF5VXdYWHRITW5SY3B1dGZFRGI0?=
 =?utf-8?B?akJoSzZPVGVDa05mUVNZNURSaHdMQ2VpaW1lT1VVc3ZNK2hNRzU0aWxjMTd6?=
 =?utf-8?B?cm96bXl3OFI2alFFS010RXdDMkhYM3NwTEFmaUJ6ekg0M1drRzFySEJoTTBK?=
 =?utf-8?B?aitEa2JjdDFtbEozdTFha045Z0ZUWGtpVFZZMktHUkNWd2ViTTc2cnBuZXo1?=
 =?utf-8?B?OWN6UXYySC9PNDl4eDJIR2VIb3k1YUlUN21ZVGJzUUh6TEMzem90aVA5dUU4?=
 =?utf-8?B?Uk54NUcrODVjVWZZWHVDU3lrZDQ3WjgvWjh1UzI3d0dZNU5SbkJyT1RvZHlT?=
 =?utf-8?B?VUs2YTY0K2xoSTlNYlVpUG5xSlIyKytaalVEemVrQ3FDTnVvaHErMzdyNndy?=
 =?utf-8?B?T1VkY0haMisvOU5mVWZLN3VlajZETlRmZEwvaTZxS3lDRzNoME1CaHJoOE5i?=
 =?utf-8?B?RTF0c0FycHg4c0xOQjFQc0tTL2daQ2JocDRPTGtxbWFPNlU3a1R5dE50OXEw?=
 =?utf-8?B?aEtmVjBhcWxyVDJxcDkvMEdnajN3QmxpT1poWXYvZnRZMDlVSjNrdGEzVDZq?=
 =?utf-8?Q?hoEdoAv1NzjWeAp55jyNVUfku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce17f30-c564-4411-d230-08db9fadadad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 05:40:49.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e27GY3kYI2Lu/KFz/Gz8fpALTmRZ/aMoTk/+dbsi05lZyreRIG0lIvNp1I1sdZ2f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
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

Am 18.08.23 um 05:08 schrieb Matthew Brost:
> On Thu, Aug 17, 2023 at 01:13:31PM +0200, Danilo Krummrich wrote:
>> On 8/17/23 07:33, Christian König wrote:
>>> Am 16.08.23 um 18:33 schrieb Danilo Krummrich:
>>>> On 8/16/23 16:59, Christian König wrote:
>>>>> Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
>>>>>> On 8/16/23 16:05, Christian König wrote:
>>>>>>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>>>>>>> Hi Matt,
>>>>>>>>
>>>>>>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>>>>> mapping between a drm_gpu_scheduler and
>>>>>>>>> drm_sched_entity. At first this
>>>>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>>>>
>>>>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>>>>> guaranteed to be the same completion even if
>>>>>>>>> targeting the same hardware
>>>>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>>>>> which allowed to reorder, timeslice, and preempt
>>>>>>>>> submissions. If a using
>>>>>>>>> shared drm_gpu_scheduler across multiple
>>>>>>>>> drm_sched_entity, the TDR falls
>>>>>>>>> apart as the TDR expects submission order ==
>>>>>>>>> completion order. Using a
>>>>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>>>>
>>>>>>>>> 2. In XE submissions are done via programming a
>>>>>>>>> ring buffer (circular
>>>>>>>>> buffer), a drm_gpu_scheduler provides a limit on
>>>>>>>>> number of jobs, if the
>>>>>>>>> limit of number jobs is set to RING_SIZE /
>>>>>>>>> MAX_SIZE_PER_JOB we get flow
>>>>>>>>> control on the ring for free.
>>>>>>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>>>>>>
>>>>>>>> In Nouveau we currently do have such a limitation as
>>>>>>>> well, but it is derived from the RING_SIZE, hence
>>>>>>>> RING_SIZE / MAX_SIZE_PER_JOB would always be 1.
>>>>>>>> However, I think most jobs won't actually utilize
>>>>>>>> the whole ring.
>>>>>>> Well that should probably rather be RING_SIZE /
>>>>>>> MAX_SIZE_PER_JOB = hw_submission_limit (or even
>>>>>>> hw_submission_limit - 1 when the hw can't distinct full
>>>>>>> vs empty ring buffer).
>>>>>> Not sure if I get you right, let me try to clarify what I
>>>>>> was trying to say: I wanted to say that in Nouveau
>>>>>> MAX_SIZE_PER_JOB isn't really limited by anything other than
>>>>>> the RING_SIZE and hence we'd never allow more than 1 active
>>>>>> job.
>>>>> But that lets the hw run dry between submissions. That is
>>>>> usually a pretty horrible idea for performance.
>>>> Correct, that's the reason why I said it seems to be more efficient
>>>> to base ring flow control on the actual size of each incoming job
>>>> rather than the maximum size of a job.
>>>>
>>>>>> However, it seems to be more efficient to base ring flow
>>>>>> control on the actual size of each incoming job rather than
>>>>>> the worst case, namely the maximum size of a job.
>>>>> That doesn't sounds like a good idea to me. See we don't limit
>>>>> the number of submitted jobs based on the ring size, but rather
>>>>> we calculate the ring size based on the number of submitted
>>>>> jobs.
>>>>>
>>>> My point isn't really about whether we derive the ring size from the
>>>> job limit or the other way around. It's more about the job size (or
>>>> its maximum size) being arbitrary.
>>>>
>>>> As mentioned in my reply to Matt:
>>>>
>>>> "In Nouveau, userspace can submit an arbitrary amount of addresses
>>>> of indirect bufferes containing the ring instructions. The ring on
>>>> the kernel side takes the addresses of the indirect buffers rather
>>>> than the instructions themself. Hence, technically there isn't
>>>> really a limit on the amount of IBs submitted by a job except for
>>>> the ring size."
>>>>
>>>> So, my point is that I don't really want to limit the job size
>>>> artificially just to be able to fit multiple jobs into the ring even
>>>> if they're submitted at their "artificial" maximum size, but rather
>>>> track how much of the ring the submitted job actually occupies.
>>>>
>>>>> In other words the hw_submission_limit defines the ring size,
>>>>> not the other way around. And you usually want the
>>>>> hw_submission_limit as low as possible for good scheduler
>>>>> granularity and to avoid extra overhead.
>>>> I don't think you really mean "as low as possible", do you?
>>> No, I do mean as low as possible or in other words as few as possible.
>>>
>>> Ideally the scheduler would submit only the minimum amount of work to
>>> the hardware to keep the hardware busy. >
>>> The hardware seems to work mostly the same for all vendors, but you
>>> somehow seem to think that filling the ring is somehow beneficial which
>>> is really not the case as far as I can see.
>> I think that's a misunderstanding. I'm not trying to say that it is *always*
>> beneficial to fill up the ring as much as possible. But I think it is under
>> certain circumstances, exactly those circumstances I described for Nouveau.
>>
>> As mentioned, in Nouveau the size of a job is only really limited by the
>> ring size, which means that one job can (but does not necessarily) fill up
>> the whole ring. We both agree that this is inefficient, because it
>> potentially results into the HW run dry due to hw_submission_limit == 1.
>>
>> I recognize you said that one should define hw_submission_limit and adjust
>> the other parts of the equation accordingly, the options I see are:
>>
>> (1) Increase the ring size while keeping the maximum job size.
>> (2) Decrease the maximum job size while keeping the ring size.
>> (3) Let the scheduler track the actual job size rather than the maximum job
>> size.
>>
>> (1) results into potentially wasted ring memory, because we're not always
>> reaching the maximum job size, but the scheduler assumes so.
>>
>> (2) results into more IOCTLs from userspace for the same amount of IBs and
>> more jobs result into more memory allocations and more work being submitted
>> to the workqueue (with Matt's patches).
>>
>> (3) doesn't seem to have any of those draw backs.
>>
>> What would be your take on that?
>>
>> Actually, if none of the other drivers is interested into a more precise way
>> of keeping track of the ring utilization, I'd be totally fine to do it in a
>> driver specific way. However, unfortunately I don't see how this would be
>> possible.
>>
>> My proposal would be to just keep the hw_submission_limit (maybe rename it
>> to submission_unit_limit) and add a submission_units field to struct
>> drm_sched_job. By default a jobs submission_units field would be 0 and the
>> scheduler would behave the exact same way as it does now.
>>
>> Accordingly, jobs with submission_units > 1 would contribute more than one
>> unit to the submission_unit_limit.
>>
>> What do you think about that?
>>
> This seems reasonible to me and a very minimal change to the scheduler.

If you have a good use case for this then the approach sounds sane to me 
as well.

My question is rather how exactly does Nouveau comes to have this use 
case? Allowing the full ring size in the UAPI sounds a bit questionable.

Christian.

>
> Matt
>
>> Besides all that, you said that filling up the ring just enough to not let
>> the HW run dry rather than filling it up entirely is desirable. Why do you
>> think so? I tend to think that in most cases it shouldn't make difference.
>>
>> - Danilo
>>
>>> Regards,
>>> Christian.
>>>
>>>> Because one really is the minimum if you want to do work at all, but
>>>> as you mentioned above a job limit of one can let the ring run dry.
>>>>
>>>> In the end my proposal comes down to tracking the actual size of a
>>>> job rather than just assuming a pre-defined maximum job size, and
>>>> hence a dynamic job limit.
>>>>
>>>> I don't think this would hurt the scheduler granularity. In fact, it
>>>> should even contribute to the desire of not letting the ring run dry
>>>> even better. Especially for sequences of small jobs, where the
>>>> current implementation might wrongly assume the ring is already full
>>>> although actually there would still be enough space left.
>>>>
>>>>> Christian.
>>>>>
>>>>>>> Otherwise your scheduler might just overwrite the ring
>>>>>>> buffer by pushing things to fast.
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Given that, it seems like it would be better to let
>>>>>>>> the scheduler keep track of empty ring "slots"
>>>>>>>> instead, such that the scheduler can deceide whether
>>>>>>>> a subsequent job will still fit on the ring and if
>>>>>>>> not re-evaluate once a previous job finished. Of
>>>>>>>> course each submitted job would be required to carry
>>>>>>>> the number of slots it requires on the ring.
>>>>>>>>
>>>>>>>> What to you think of implementing this as
>>>>>>>> alternative flow control mechanism? Implementation
>>>>>>>> wise this could be a union with the existing
>>>>>>>> hw_submission_limit.
>>>>>>>>
>>>>>>>> - Danilo
>>>>>>>>
>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>>>>> number of drm_gpu_scheduler are used. To work
>>>>>>>>> around the scaling issue,
>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>     - (Rob Clark) Fix msm build
>>>>>>>>>     - Pass in run work queue
>>>>>>>>> v3:
>>>>>>>>>     - (Boris) don't have loop in worker
>>>>>>>>> v4:
>>>>>>>>>     - (Tvrtko) break out submit ready, stop,
>>>>>>>>> start helpers into own patch
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

