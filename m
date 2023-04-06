Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB16D997D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0337310EBEE;
	Thu,  6 Apr 2023 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786E910EBF9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTljRQzRFCdn5Lh7BVj3KwOQFLhuNtWlH6tv5J14D7JAOP0o6mKwn8TQ1v82afTCRM6zoS3heZ6KZ3hA2XKfkVHGsDjw3u81gHGKVO3T6Ymks8WmgciCXYI44atwFEgbmXW9hzjFJm5txoG2+XX3xdVPaVmMwwtSZ8gkQfPsFOJJ9izhQ+hqV0YA2fgf4WQgqrDBN1pJtVszp7J11CQeIokg/6g5QSxxSOcirgPyESvPKVyfQlPSvvBXI9l2MibqU9oOZgR0PeqvO/P6QWzh+Wfw1swyg+eyqfPL1y1a8HJG3u55wtou9bVZFDdIgpCQTvep8KTRVsTJikkuxxG+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQVy8hi4/m4MGWNVEYmv5jhoTGTrbBO1sLN8tT2u53k=;
 b=mxdIqo2GyuZETaWzOUp0t2x5i2WX0Q6fjsibHJ84CT56nt570hlhVUsai3dUDR2kTehc8Tu5j0BtN1Ucr0Iq4bHC2jCH3xi4/tQc1Dg4KRJ0pwxDITF0IyEFgoW8RCalPwBnCq42L+mnMeuSv5RshZid/B6IwUl7TnWepUTU8juBKwh1BqIuxiFdctAENaFxCKFyNqO+/THjRjp7nqb2iguvTqUO+2xU23IWeS7Vs5xjoddtHb6h3qCL6/aa2WmuHodzMlQvok4nROMVE/QxhoG6KOTW5tyVCW27/XYysWso2BYKRdNqB0T4qaK3yOmjEG7F8NvshWDAKDHV3XyMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQVy8hi4/m4MGWNVEYmv5jhoTGTrbBO1sLN8tT2u53k=;
 b=SvpjL/YVAHM+SwjIyzp5PiMu7zOOvtPoJpXbCXYfInnDNOyFwgp01C7ehuJSZzV7C5DxK0Qq34T9Dcsf+reIuYE9jkxGVthvxS50bxj/i1u4cPdA09SVLE/3mnwNSXzLSQgLvLlZRKSZO2o+WhUJvZ9uXXQq1o9kaOJjsSzmnAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 14:21:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 14:21:19 +0000
Message-ID: <31f03135-40e4-a6ad-37e0-3b434a37922d@amd.com>
Date: Thu, 6 Apr 2023 16:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9f01a7-5423-48a9-146c-08db36aa3094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uirbT9dCkfkpInkcU3fD+FRENrehNAf82zUtMM2NBFBCzAGrRvY+5GMqNQdrpQyFYor5a5I1qi70ZBG8K/Wkt99to1fJyxTmSW6Q1RC/smahdO2arqBxr+Ce5b4vO6AxZf78g0hluiLhVcM7acr28qB4UKL7oRmrkc4//isgbjTLjxsnNb0a1wPEKHNpJj7qO14/g+Oyu+tW3butz86TSqlPDLznnZ06iNO+tMe/0uJDp2LJPZzDCBIiobeapmvQpU1yXPvXI3HlzIFk9+gvxTJ90bMDJ06PPDWt95wu34Itq0TNzT7fu+IKKjcgeu9ZrKvRidk6m4opIbcj2Vbz+42pdb1E4r8AWKsuMo9ErbpCGQUz7000KCpvCEmX4gL8q/PFpeOqWvT9ahqS+wMkQ92M5Mw2NmJp5lXvtYiCj28GUBbmiUk+uPdItqWqZ3sp2OfwsQrFnYV0JP1vpSqqNtP6ZYjZcn75BLH37RCNwOgpxsYvV6+1mx5qFZtSkuepgJB5TwAGf9BacbxyjPlZhjcUvfeGHWaiKTXo5pBj1H13VyLxZcXwOlZaC5QoNFTFuMiWGesMC6xYWLnszENQNH+sOCuRM/KCKF5b4M6L8HX45SlCRsxGrM0TbQuDw3HDUyStkn1efwHrHs1xZXDsCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(36756003)(31696002)(86362001)(2906002)(31686004)(2616005)(6666004)(186003)(53546011)(83380400001)(66574015)(6512007)(6506007)(966005)(6486002)(4326008)(66946007)(66556008)(66476007)(8676002)(41300700001)(7416002)(38100700002)(5660300002)(54906003)(478600001)(316002)(110136005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJhcitMblUwWTJJRkYyUHRScUlXZnpYNjZWbDQ5R1c4eGd4ckxqV3JLMEh4?=
 =?utf-8?B?NklDTHp6RGg2MFhMNndLZ00rVkJPYjZPNkxSTkk2YTdzWk1sd3JiNWRXRWdn?=
 =?utf-8?B?TzZ3bXhlc0U2bm5iN1pPOTlrZ1dNd1VCWjRRWS92YnE3c0xadXBjckQxZ0FG?=
 =?utf-8?B?ci9mMmo2ZmlvYVdCMHF3R3JoZlNhWm5zT1dKOXlkREdQRWRxQUNCY2hGNmtT?=
 =?utf-8?B?YUtMMEZhaUx0ZzFyN0w2dnIzU3FOL2FxNFFReDMwaExEOTVFWUJBeUU4S2Vh?=
 =?utf-8?B?cWNCOXkwNDQ2d3pVR2RkcTVCTkhoNFU0b0NueWpYclVZM1pMTUkvcHNlZ0pS?=
 =?utf-8?B?WGY5NXRzQ2Z4Y3l3anhoaWk5WjQzcXJLVmczakFDTUV6ZHRKYTBSa3p4RTEw?=
 =?utf-8?B?bmJBN1pwNi93QzhMb3B5R0NwQTFldWYwK3lLcG1VODV4UUFUS0NscXBGK2p0?=
 =?utf-8?B?NFFWTVkwbFRwL2hRenQwdjRvMzd5TitUeDNYb1daNEpuVlZMT2ErbjNlWS9m?=
 =?utf-8?B?U3FBbnNacjIvSmcyb3BlQWNaTXdOT0NobjhjMytxcmhMSUQzTDJkSit4Z1Np?=
 =?utf-8?B?V0t4K3ltWWpQblhmcXBsL2JHNUhxL1d6UURvN3IrR0FtVWZpQWhIYUpXbENC?=
 =?utf-8?B?T3pUNWFLcnJSaDI0cTMyaWxiN0ZPTG5zUFhYYUdHNEVPcHI0c3hhRWF0OXhU?=
 =?utf-8?B?NjVDbllGcGMwNVZ5ODlJeFlOQitVcndVYjZFRG51N2dsSXZ5OGRMRFBCQVhu?=
 =?utf-8?B?TzM0dmI3c3NvenBVOFAvUFduY0dQYlFVU1RoYitCQm5hMzJ2Q3htVjVLd0cw?=
 =?utf-8?B?TkY4UUhrR2xXOWJZU1g2OUgrbmxjRFM3QUhBN25qcXVwMFVsbWJpNVd2QWFk?=
 =?utf-8?B?allBeUkvQ1kzKzI1am9kQmc1RVZzUmxKenVYbGw1MnpzQ1ErMjNscTlMZWVG?=
 =?utf-8?B?TFVoSmQ5eEhQaHpCaExIazVqcEt0dlR1QWxwb0xVbTF3WTVBa29QRUYwNU9H?=
 =?utf-8?B?b3RGaGxrWlA0d2lMZ0NER1VKa2N6RUh3cDRWQjZUNkFDTllIM3orNTRRWk54?=
 =?utf-8?B?VGJxYStseUFhM0t3cEVKSDdrMk5DM2Z3cU14dnBmc2U4QVBmMG5nSWdFbXE4?=
 =?utf-8?B?U0lKekpQUy9PM0RZUDliSFkxQ0ZHcjRCeVl0a1RXTEVmT2thUXYxS3dXWWJL?=
 =?utf-8?B?Um9zd0kwZGpZRTZrbUlvdWc1ZmdtSHRnRURSRU52WUlNTUpMa0krWDlHbmZE?=
 =?utf-8?B?VmZ5N1hMd2FYdk5SRXhybEV4QS9TRXBzWDRuUU9FMW5hcy9pc0VUZ3Y2Y0Y1?=
 =?utf-8?B?NC9LV2hkZG1PWFE3V1dmU1N0cXNHaklIc2JyWXl4TlNnLzJLcHdKQXFUUG96?=
 =?utf-8?B?d3NLZFhPMjRCVHZ1bGNvREtER0Ewd2s5dlppSDN4VDNka05LV3M1RDJ2dHNS?=
 =?utf-8?B?dmhQZXZYWVlYbXBpVVlxNmZHWWFoc3dHQ0IzaHRBeFBId0VWY3phOTVJUEl1?=
 =?utf-8?B?eVFDSUI0T2gvVnIzeWtEbEo2L0pML3FtT2JqazFEK1BZMW5JY0JFejBPdzJK?=
 =?utf-8?B?dGRRSDVLUXRWL3VJMTZPUCtBQUkxWHh5OGxhQ2syS0VXeWN4RVJ6dFh5S2Qy?=
 =?utf-8?B?YytqRTl3OEswSVgyYU9JYzdZdXVybmxoVzViaCs1SWdBeUFNNVBFL2h6S2po?=
 =?utf-8?B?U3JPcUxlZmdsZm1uUHBKQmdIT1B3bzFqTmFKQy9Nemo0a0RjcHJ4emxoUTJy?=
 =?utf-8?B?bGdSOStiYTEyWkw3ZmlaeG9NanBQaE9jOUNldHF5VUExNnFMbjg0WFNVSnZs?=
 =?utf-8?B?UlhacXVqZG85bXd6K3pVUlF5ODRHU2psRytvcmNvQVBwcUhiZzBkQm9LaHdP?=
 =?utf-8?B?dXhPa01RRWdRK2NaMkNQOUR1bkFlV3ROaS9HVGRLVEQxbXlGelJ5SWxlakt2?=
 =?utf-8?B?MGxsT0R6YkRXaFFiYno3bkRGa24vUXRrMDNRYmRwSlcxUXByMkpRbmNQUkhq?=
 =?utf-8?B?MDVLcDNocHV0T2RiSkhoVTNmcE9jTVJ1aXl5REFnOVNOd1BKT0tZWFE3eDdT?=
 =?utf-8?B?aGlFVnFLc3pLZk96VW04SlRtTWNXczlrMlk2dUsrK2ZoY1lvNFVrVkJ6elNw?=
 =?utf-8?B?Tllrb0pRQUhJUGdzYWNoSzhQVmR1MEMxYW9rNi9OVXNHQTBHM0l3Nyt6Y0JT?=
 =?utf-8?Q?RhM9g072ljwFG39Xok/TNLpyNfNZMO/oeFzihWdZbHms?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9f01a7-5423-48a9-146c-08db36aa3094
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:21:19.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7zYoqsfXQ0AcbJr8DQ6ySaWKdCEIBqhzQeM1sYC7widtXClZKI2e1AUDXoG/0uf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173
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
Cc: Matthew Brost <matthew.brost@intel.com>, tvrtko.ursulin@linux.intel.com,
 andrey.grodzovsky@amd.com, lina@asahilina.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, yuq825@gmail.com,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.23 um 12:45 schrieb Lucas Stach:
> Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
>> On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
>>> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>>>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>>>> Hi Danilo,
>>>>>>>
>>>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>>>> writing it to the entity through which the job was deployed to the
>>>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>>>
>>>>>>>> Doing this can result in a race condition where the entity is already
>>>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>>>> once the job is fetched from the pending_list.
>>>>>>>>
>>>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>>>> over to the scheduler by this entity might still reside in the
>>>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>>>> a UAF.
>>>>>>>>
>>>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>>>
>>>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>>>> allocated for a subsequent client applications job structure again.
>>>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>>>> reproduce the same corruption over and over again by just using
>>>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>>>
>>>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>>>> a fix directly.
>>>>>>>>
>>>>>>>> Spontaneously, I see three options to fix it:
>>>>>>>>
>>>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>>>
>>>>>>> My vote is on this or something in similar vain for the long term. I
>>>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>>>> more fairness than the current one sometime in the future, which
>>>>>>> requires execution time tracking on the entities.
>>>>>> Danilo,
>>>>>>
>>>>>> Using kref is preferable, i.e. option 1 above.
>>>>> I think the only real motivation for doing that would be for generically
>>>>> tracking job statistics within the entity a job was deployed through. If
>>>>> we all agree on tracking job statistics this way I am happy to prepare a
>>>>> patch for this option and drop this one:
>>>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>>>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>>>> The reason kref is attractive is because one doesn't need to worry about
>>>> it--when the last user drops the kref, the release is called to do
>>>> housekeeping. If this never happens, we know that we have a bug to debug.
>>> Yeah, reference counting unfortunately have some traps as well. For
>>> example rarely dropping the last reference from interrupt context or
>>> with some unexpected locks help when the cleanup function doesn't expect
>>> that is a good recipe for problems as well.
>>>
> Fully agreed.
>
>>>> Regarding the patch above--I did look around the code, and it seems safe,
>>>> as per your analysis, I didn't see any reference to entity after job submission,
>>>> but I'll comment on that thread as well for the record.
>>> Reference counting the entities was suggested before. The intentionally
>>> avoided that so far because the entity might be the tip of the iceberg
>>> of stuff you need to keep around.
>>>
>>> For example for command submission you also need the VM and when you
>>> keep the VM alive you also need to keep the file private alive....
>> Yeah refcounting looks often like the easy way out to avoid
>> use-after-free issue, until you realize you've just made lifetimes
>> unbounded and have some enourmous leaks: entity keeps vm alive, vm
>> keeps all the bo alives, somehow every crash wastes more memory
>> because vk_device_lost means userspace allocates new stuff for
>> everything.
>>
>> If possible a lifetime design where lifetimes have hard bounds and you
>> just borrow a reference under a lock (or some other ownership rule) is
>> generally much more solid. But also much harder to design correctly
>> :-/
>>
> The use we are discussing here is to keep the entity alive as long as
> jobs from that entity are still active on the HW. While there are no
> hard bounds on when a job will get inactive, at least it's not
> unbounded. On a crash/fault the job will be removed from the hardware
> pretty soon.
>
> Well behaved jobs after a application shutdown might take a little
> longer, but I don't really see the new problem with keeping the entity
> alive? As long as a job is active on the hardware, we can't throw out
> the VM or BOs, no difference whether the entity is kept alive or not.

Exactly that's the problem. VM & BOs are dropped as soon as the process 
is destroyed, we *don't* wait for the hw to finish before doing so.

Just the backing store managed by all the house keeping objects isn't 
freed until the hw is idle preventing a crash or accessing freed memory.

This behavior is rather important for the OOM killer since we need to be 
able to tear down the process as fast as possible in that case.

Changing that is possible, but that's quite a huge change I'm not really 
willing to do just for tracking the time spend.

What we could do is to track the unsignaled fences in each entity 
similar to what amdgpu is doing.

Regards,
Christian.

>
> Some hardware might have ways to expedite job inactivation by
> deactivating scheduling queues, or just taking a fault, but for some HW
> we'll just have to wait for the job to finish.
>
> Regards,
> Lucas
>

