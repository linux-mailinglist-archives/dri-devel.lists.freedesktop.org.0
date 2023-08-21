Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D5A783003
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8D610E12A;
	Mon, 21 Aug 2023 18:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2F010E12A;
 Mon, 21 Aug 2023 18:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgMNuzoar/M7dLQkGv0g/Ar1DnWcGJN12Ns3KwPAFQw+gOPrMWpk5bUEVobDPVe6pZ8/jlQzw67I9enDxB8KRj7cPlIzenLHx/qP5efLLgYA/SLXNWMeEvqYCG8AK24vHSLp5mos81I3PivzR0cqEwIWrBIjabZf6ELHQXrrtnrkbPCLNzNb4hWlVDUlyOSds8TzRROq6D+vKuvSYPPJE2rPAPJBDdBftFxK+k8c2jSE/JLUMVhhvTSpc9B1KO8/9i7XHgcd0NH2bzepNFNkqyGaPu/VG7M709EWYzzS2EEk3ZVnAG1RzHI+FZwY/hw6epw1ZyfYdZgV8yPwd4jlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQkd2l5rpLG93TiltggGdmWnPYz3IyfZ6Aycm4a9llA=;
 b=JU4Ysb9SXuQsuFQuWnkaFO3Y8VOCNaykE7rTwZ1O6m2qW5dktnhzqTdj/lQoohr0eI/2BhlhiYKpAd3HEgCAUNYmpZEP/g9BlnLnGm/Ty+NJAqjy113uthss4tzZnzppCi1lnAsyu1w58ijmVcL+ucFW4DD0ofxZtW5S+nzkS15VQmmctsmj9eF1g1yqwdpplj710UlUrq8YpGstRjgR7KT5xT4jN7d2rxBkTIvKy0OFoBC136wH/zAoOXLsL610wLly3u8OmagW6Y5AWIwYsqb4KfmWdW5EGLWIndIIwQMxUs5jd2uPOSsSnsYziM6ido3tdlEtR39zEuzClx9eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQkd2l5rpLG93TiltggGdmWnPYz3IyfZ6Aycm4a9llA=;
 b=QuH3pbt80beM94z1KPiMNV86GcSZGVJWNEsZthg3s3Ar2vD1K52iMq2XOwdnYUjDqnluPDPtpDX96DbmGaD+92hDId1VCCffYmA3Ed+JDmA8a/7H5oiiB90fT59yCFyzIMloU//iC0arIQplIqRKeQCz9R9HWEN2kU3TLa+aDlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 18:13:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:13:01 +0000
Message-ID: <85107169-8a24-441f-6631-d99472d810f0@amd.com>
Date: Mon, 21 Aug 2023 20:12:55 +0200
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
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
 <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1330bae0-67b2-4329-f5d3-08dba27241a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eqO76rpor66FsDbBOPRbjOF4P4ppSKohs/oCJKcRqFc7YiE1BZPgVxPT1AeRSSZSaym/Qyq+8PV2tr9ENnxSLaYMMiCXztB5ymHNGSlvl39OPbSSJrB9j5WPlv2cp9fzjZ0ee2fX/AQbATCgYxN9ZJxzkSJjGUdjdFpxvivDPU4BiTo2l1KzFCBMr+YHQ4zHVQuKnImlDLfJOlX3AEwM9etr9QSyCSnmURZc021RMW8CA+gFyNuCLnsrNib8YviALchabwMW0+16rw7NFeqlcxcbUwqMb2Jca+kCMFCZRXmcONHpBQF4kFvg/1FZDviD/FKLz24iMQi31i682RofSbcbl0evijGVL8otUIqayFFU2zObSwnmWjZfdQAFnsqbSbxqRs1B7nQgnbZL01A+Osh+k/CQZjepfMD7jGi9UC4n8UDntF5Wz77dDd6UcWHYxe1NKM4AYH8wqfGKf0UA2nkuQ/uPjRIS7guowYWjdSIte+lEBByc/RrdVXYhkCsZSBZ5fH4U6CQD+Rd5UtLDFNNnuwAQ9NkB9gitslD0/3vH12Rgw+bH9dO5g6/Sr5u1LiHzM41Qpxd8TA7G8QQdVfyfee/g2EM6iOjYaGfgxtC1RE6+6CS39A4JvjNR8XWTYxLWNVvww2KcuVNuRpnig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(66574015)(2906002)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhQZVJoYWJTMWNCKzNZVmdEZzhvQjc1UXBnSTdTd1JPekI5a3h2MHZwL1RW?=
 =?utf-8?B?TlIyV2s4a0hpeS9TZk9zWXdZYy9xbDlpcXRFNjlCV1R3Zi91MnFHOUlZb2tr?=
 =?utf-8?B?UDEwc0FXNDdMOUdRd3l2eE15aWxjSXhXYWtCMnFLQlUzU2doNGpMd3BxczRY?=
 =?utf-8?B?Y1FqRW15YzdjZVN5UFhuaFQ0VHMyQ3RtaDhlTnJkY0xwRld1U25BQnFFYjB2?=
 =?utf-8?B?Z3Y3ZXhlWUJ2TDhOWmp0RUdUbkNjU1IzUUl5MFFNMnoyWm1NTzVNa2NIQ0JV?=
 =?utf-8?B?Unl2N0pQR0o0MTFnS0t2TUs4bFBXNTRoNTBNMVZzS052NmZvVi9yYU8vN1NS?=
 =?utf-8?B?TXd1U2p2K05LY3NGZEN1NHkyY2pFWksyVXBSNldlQVJxUWhBc0FxMUh2ck8w?=
 =?utf-8?B?YXpGcHFTREJ4eWt2dFRSNmNXSDlMTTJ1MFE3d1M1b0JSak01S0lpRzR6TkJZ?=
 =?utf-8?B?QWRmNFZSTUViUmdLa1VvYkxpVTAwTEUvdVhmejVSbDRmbmpmNmJiSTJrcGt0?=
 =?utf-8?B?MXBlZTJKaTFZcXZXc0V1V0o3OHIxZ1N6TTQ1R1ZxYTcrUFBXaDVzc0N1VXFP?=
 =?utf-8?B?Y1h3STRPYi9idTdWbTE3WXBLTGlveGJISzQ4VndIbFhxclJiMXUvSXoxVnZi?=
 =?utf-8?B?M0lyZ2g5Vy9oZmdGKy9JQ3JVRUIzNVZSalR1OWgyY3ZVQmY3aEtnTlEwdlo2?=
 =?utf-8?B?OERFZmZHd2hwQ0E1eUx3OW9tZlBJY1BONFo2OFhKUUU1RmRlYlVMSjd6Rm53?=
 =?utf-8?B?NVo4TWFuandTMkZpeUk4VStvVjllby8vSHdLM3BnS0pRNTE2T1BwV21SQVgw?=
 =?utf-8?B?ZGV0WFU4Z0Nnc2REbFlaYjIyT25pUnRzYkd3ajFRR3d1S2NRU2V6UHROTW9y?=
 =?utf-8?B?aGRxa2VWQlErTW1yNzdIV3d1ZjJZc09YRDlFWkJab0pwNVhRdGdSQ213ZVM4?=
 =?utf-8?B?YndzbjJlKzVJUjE5dEw1WDNiV3ROQ0dONDhXbDhCRW56a3k0REtjYnh3aXZk?=
 =?utf-8?B?aVhGOTNIazQxaXpnRzNQVnBxNnhxZ1pHZXVVdTBHZGRjOGpxWTU2Q0dJZU5n?=
 =?utf-8?B?ZTFIUWxaTXVNOTJDNDkxQmJXdUZHVk9kOXJxWWgvc2kweGNGUzFyWCtwenIz?=
 =?utf-8?B?M1JjS3Nja3huaWNKOWQ4L21HSEdJdGtmWWFmWE93bGhzNjNTY2JVTEZtK0Vt?=
 =?utf-8?B?bHhVTFhGVkFrWWZ0ZkRjRkQwOXBzTCtvQ3B4SHhxYitJQ3BUWEZKQ3JSQ3pr?=
 =?utf-8?B?TmlqSzJvSTRvbTNuWUFmUTNGZTAyNExlWGN0RU5Ia1k0ZUZuR1I0N3JPemd6?=
 =?utf-8?B?WmlybU9tNkRILzZBN243dVhVU3RNY2dEQ21HOU0ycHNpeGpJVGpoWS9iVWZo?=
 =?utf-8?B?MTVKclRlSlVIWEZzTGt1QUdVL0dlWXptVWZCU2VjaERldjFEbkZoZFJnRXNw?=
 =?utf-8?B?WDdtbmdWVzdMYXpabzQrb3ZjSCt2VmFqQ21lbndZVVhsOFpQQ0lmck5JNmg3?=
 =?utf-8?B?YUF0MXdPU1FaaXJGeDZZQ0RqRllzRjFrOU5KSEx4UEtHbjB1MXJ5L2NkMVFk?=
 =?utf-8?B?QWJBVzZLK1dCa0dnK0ZvMzd0ajQ0di9YTkdMQ1lOT3ErQThIa2puSUI3akNs?=
 =?utf-8?B?UVgzd2lUOGtSelhXZ2JFQzJnRGgwQkdmbE9EOE1VL0pUTjhENHVoRmEvNlJy?=
 =?utf-8?B?Wnd5dTg1OGFrUXpMMEJjRUN2Y0k4SWw2L3NkYUo1cVB6STlRbzRPUWF4ZVFK?=
 =?utf-8?B?N3VNVHBkNXVjamNXczFtQURMNWtYTWhHVjJpeDJESXFmZU01TGdHTXlCOXR0?=
 =?utf-8?B?WFFkQWZ2WGlkQytFYU9kRDE4ZFRTUTRnd3BGYmdZVzU5NFRHRm1vaUx6Yllx?=
 =?utf-8?B?SEsvWkRZeVpSMTZYc0I5SVdUcFIyc05lOWI4VGRqV2VLYjhhWVUxeFFQTXE4?=
 =?utf-8?B?cEdKc0RZRVBoaVVkYjJLVVBjaThrYmMvSXloYzR3Slk0TFd1c2VGazRQdnR4?=
 =?utf-8?B?bzZsaGJXYzVnUGswVGJEZW9uNTBTZmtnUi8ycnlrTlJHZVRNS2FoTmJpaFhO?=
 =?utf-8?B?VDR1SlN4d05zSERaaG1uaXFRWGZRa2JEMkYycWxZbjY5a25wMGxUamxjVHFj?=
 =?utf-8?Q?3d6mFqlDbh1QCv/ODDYpMRjrA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1330bae0-67b2-4329-f5d3-08dba27241a1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:13:01.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s19suUpOS1H5XhW8RJq38IJZ9Ykkou7TZjzEahm5Ezmy8qaG/D/WVRgjOCTSvcd2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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

Am 21.08.23 um 20:01 schrieb Danilo Krummrich:
> On 8/21/23 16:07, Christian König wrote:
>> Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
>>> [SNIP]
>>>> I only see two possible outcomes:
>>>> 1. You return -EBUSY (or similar) error code indicating the the hw 
>>>> can't receive more commands.
>>>> 2. Wait on previously pushed commands to be executed.
>>>> (3. Your driver crash because you accidentally overwrite stuff in 
>>>> the ring buffer which is still executed. I just assume that's 
>>>> prevented).
>>>>
>>>> Resolution #1 with -EBUSY is actually something the UAPI should not 
>>>> do, because your UAPI then depends on the specific timing of 
>>>> submissions which is a really bad idea.
>>>>
>>>> Resolution #2 is usually bad because it forces the hw to run dry 
>>>> between submission and so degrade performance.
>>>
>>> I agree, that is a good reason for at least limiting the maximum job 
>>> size to half of the ring size.
>>>
>>> However, there could still be cases where two subsequent jobs are 
>>> submitted with just a single IB, which as is would still block 
>>> subsequent jobs to be pushed to the ring although there is still 
>>> plenty of space. Depending on the (CPU) scheduler latency, such a 
>>> case can let the HW run dry as well.
>>
>> Yeah, that was intentionally not done as well. The crux here is that 
>> the more you push to the hw the worse the scheduling granularity 
>> becomes. It's just that neither Xe nor Nouveau relies that much on 
>> the scheduling granularity at all (because of hw queues).
>>
>> But Xe doesn't seem to need that feature and I would still try to 
>> avoid it because the more you have pushed to the hw the harder it is 
>> to get going again after a reset.
>>
>>>
>>> Surely, we could just continue decrease the maximum job size even 
>>> further, but this would result in further overhead on user and 
>>> kernel for larger IB counts. Tracking the actual job size seems to 
>>> be the better solution for drivers where the job size can vary over 
>>> a rather huge range.
>>
>> I strongly disagree on that. A larger ring buffer is trivial to allocate 
>
> That sounds like a workaround to me. The problem, in the case above, 
> isn't that the ring buffer does not have enough space, the problem is 
> that we account for the maximum job size although the actual job size 
> is much smaller. And enabling the scheduler to track the actual job 
> size is trivial as well.

That's what I agree on, so far I just didn't see the reason for doing it 
but at least a few reason for not doing it.

>
>> and if userspace submissions are so small that the scheduler can't 
>> keep up submitting them then your ring buffer size is your smallest 
>> problem.
>>
>> In other words the submission overhead will completely kill your 
>> performance and you should probably consider stuffing more into a 
>> single submission.
>
> I fully agree and that is also the reason why I want to keep the 
> maximum job size as large as possible.
>
> However, afaik with Vulkan it's the applications themselves deciding 
> when and with how many command buffers a queue is submitted (@Faith: 
> please correct me if I'm wrong). Hence, why not optimize for this case 
> as well? It's not that it would make another case worse, right?

As I said it does make both the scheduling granularity as well as the 
reset behavior worse.

In general I think we should try to push just enough work to the 
hardware to keep it busy and not as much as possible.

So as long as nobody from userspace comes and says we absolutely need to 
optimize this use case I would rather not do it.

Regards,
Christian.

>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> - Danilo
>>
>

