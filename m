Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56393DBEA5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 21:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19A6E440;
	Fri, 30 Jul 2021 19:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553476E440;
 Fri, 30 Jul 2021 19:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlfyiX5OKPd9rj0YFqOoXVwexLyKwvoXZb/Jq9ohWb5tYT5GlFxeVDNt5JPS2NC89+H/CciOp507W5xO7vueJhNzPFwhlmI4GcIG9C28AGA1QWxqg59Jbobuo5a5YEE00wFOMn7x++P543ocl1WETcD1AzR/gswwWwxeVpDGl+KlUI2is7grEh+ZbQskd/GhWXEzeRUGQXCpSZ9+pWIBPEo148uMg5YI1qdHj81diL2D6dDaMHhQSbKVldVYOy85UIGDuGDRv80Ud8hunPwQk4mJFJJfSLbelhUvt1lKrziOhUcJbj+ZdhOHjqxa+RvS2Z6HUXWAaRkxKblPLRoetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVC8RxOCSpxnKYaPsvDo9x88HC+uNfEQbB74YSbWtiE=;
 b=RC+g0QGLZ7mZor3PW8myDvzl88VSElpm/vqG9zLAlmOZDsdk3HpuYv5Eh6/W+NRvwm8RMCl6GaginemuW0NLjYNTVWXec1wtyX3qutoyRbp+fKAljAy78z1jYsc8hzSQYVKdsoArphS/6S7dmIbvOB1s4b24kP86CK+uJtgPEQJHRTdCYxAGbcu7f3DPkc1EyloInbTy6U4vYcsZ4Lg/wT3rrJv2j5qaTajUPhIGv+7XZW8atSVGEVHkrRo15FDxgJ2XlsoFqI7yOZkII3DWc8XDLEC/yUCYGB6/CCyZoCEz2d5trZZFwSy5a03q9o9lvHY7kQLPMIqqvohuDbufJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVC8RxOCSpxnKYaPsvDo9x88HC+uNfEQbB74YSbWtiE=;
 b=Y+x5/8t7/dBatp0uq70ayAUbt9wtYmaOd6/dKfO6N6Pq3HzYrFbfsKS5LmIH7aO2aSUfkuCyvUMcGwBISCASkP5X5HVLalEovIOCJwsf7qKZyigoQgY8rsplh6PhxQ1Y+pPTrwDpZ1EJOgzPzJM0fKmOl1AasjePnIhQCbo0iJk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Fri, 30 Jul
 2021 19:02:33 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4352.033; Fri, 30 Jul 2021
 19:02:33 +0000
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu> <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
 <YPGgvNxfOCx/Sp0g@mit.edu> <e9cc27d6-b0f2-8379-c276-0bbdae3ce4d7@amd.com>
 <601418f5-c526-08e9-b071-4533a32ce25d@amd.com>
 <79416c93-2dc7-6097-01e4-d60d6221ee14@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4c787948-3ac1-6878-1155-3ce061b102df@amd.com>
Date: Fri, 30 Jul 2021 15:02:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <79416c93-2dc7-6097-01e4-d60d6221ee14@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.144.73) by
 YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 19:02:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd794f1-4ee1-4b53-e1da-08d9538c9633
X-MS-TrafficTypeDiagnostic: BN9PR12MB5163:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5163652F4428E9917B816CA392EC9@BN9PR12MB5163.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfFLuMYYq4yUS3VBCritNQhFw5BJzvY3mq8XN8NQe+8CiYfsSCuqWMx+ONu/x3TGcbAIVhkoVkxkevDSs/wDD3DePu5VGr8/u7NenfFy982SEKPI6mrLvXxVdvo27QMrhoznHyD8GO1AJt1KUfdetQZtmI8deW+fI95BDMKj61lsvVCWv6sg0pSQFBc4pXCCsfQE9hrgtnhp5e13Iq3P7OqB+kGuuViyBg7dd/iATCPJSjHsgmdrzogxS8IJaKv4O7raLPu0qeU+l8MzeVox74S9r2jbMfXjCOPFSUKuLcbH4XEeApmcfUHhtQLBBitZF011tRYfEpbwUDIXTKcSkIwP6Re1ZtgvTadeJZZc1du3sY2/FjetikpmdRmSJ5JKp6WGJ0dgWGXA+4FFbB4XOF/vOHXSFyH/N/3bmji6xUKF93xrcc51SkkOY76+cM+L4bMfh2WXCUlgGR3Jn5eyX/rM/bk+/6bJNhXoKmgZKcR2dxh5HlnTy8ULWFGu1WTrrnMKZLL0kW94NfXvlz+v+gFz+UlN+Fd+PvWz0JJNV89/F6cwEEFWSSba7WFXsZUz7lTyk7GbOUdLu7Uc1F4O3U6rihF7kgNp5Zy/ieH959g5Z2N9ToYg3mSpsy3iKaVYT9JyapnKDk3/sseuguiej3V40s+ii/T4JHkwTlpvCb3yi3Dd53RIznLSilBhoYEJZ2dNbvFVAXfnPW3p8qQ8FVKGW253/bzfnxfNL/SmjkXgQf/oweXATqZ3JONc42sfqR7hYNRHPUVkDXZX/HbJTC6AmpTAC1zxwMhfB7lnTreP3ooO/HkULgpby8T/s7GkS00ur+CbjMiSs+SxLNCHSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(66946007)(6486002)(66556008)(83380400001)(44832011)(66476007)(36756003)(7416002)(4326008)(508600001)(16576012)(31686004)(2906002)(8936002)(2616005)(38100700002)(966005)(26005)(8676002)(31696002)(5660300002)(956004)(110136005)(186003)(316002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b29zZnNBeGx4Q0hJaTlTUk5JeFAxdkRSV2o4RFY0U2V4SnlJQiswWmlvNHFm?=
 =?utf-8?B?WEQ0SEJjM3hqK203T085bXU5dW9xVjdNS0dNdEw2RmF3VFhoZ05oT2FMR2t1?=
 =?utf-8?B?aXRLTVJ3ZFVsb1NmMjgweXdSWEVPVXQxMW9rVTllek44blhQTVl1Uzl2TTRo?=
 =?utf-8?B?UjFHTkQ4OEcwQ0cvdnd1MHk1UEpXTnlLTXBpOUJhcldDL3RsVlZDWVBlTG1R?=
 =?utf-8?B?NCt5blJGNHNQV0VkU0pYM0UxM0lLSXAzRFd2VERnZzZtLzJkd1ZVeTNnZkRW?=
 =?utf-8?B?WVZ5dEhvbjlEZ1ZEWmFkSXR0MEwveVNsdmJjcmpPdlU0cjFYcksrcjh2Ritm?=
 =?utf-8?B?MzQvTWNBRE9FM1VSK3l5bzVOemx5a1Q2eERKd2tiRG1IZnJWZjZRQXRxcWgr?=
 =?utf-8?B?a1dGdUJ4aWRROTRadWdEOGpzcnc3bldaMmxOTWYwc0hmbFFOTFFKd0ZIUTFO?=
 =?utf-8?B?bkQ0Wm5EcVNvWE1NR09wd1hqQ3RHaytNb01JbTN1Zk5hVHZoakJwS1hwYzN5?=
 =?utf-8?B?UGVnMDZlVHZHUlVmaFh3OHlyVEh1Tm12NzBQM21YN2k5bldyZUN5dlZENHlj?=
 =?utf-8?B?M002NFdhcTBiemVkM1BUV0FYSDhxdXdrRlQ1c0dKejl4Q0ZOT0RiN3hVY0Uy?=
 =?utf-8?B?YWpBdE9LVnBMSU9kaXlKQ3dpQmFpQWk0S1NSRGlGSW1GY0gwU3JtT3dDdnFT?=
 =?utf-8?B?K0NqT0ZzZjRTOHg5YlhuaDF5V3lKVllBTTBvYkVhc0ZLR0dCV1NKTFlNVUl0?=
 =?utf-8?B?ZnA4UkcrN3o4eVNGNitlc3dnMWdaV0hhQ0c3RHRYYWFqcTdabDdxZ1RBU3Jm?=
 =?utf-8?B?aVhTNkd6cWRSREVYWEZ5UUNJL2ZFRG53Y3FYaFcwQ2kxL0RwTkJIVWM3TGtL?=
 =?utf-8?B?VkQ1NTVKbFVrODJXUm94Nk9zWXpNYUhxVytDc29qak4ybW9xK0N3MHpwanhL?=
 =?utf-8?B?cERKRk1aZXZFckpjd0hTdzdZbFRwWVVQM2hXdkdjTzF0a29ObW5Scmt5VEtP?=
 =?utf-8?B?dG95cUtoOHZGVW40SjBWQ0dzdWhHcEVSVU9tOXV6bUEwcFVXV3c5UW5wVkhm?=
 =?utf-8?B?eFU2dmg5SlduMTJLV0NDNEgrZi85VVp1WFFnbDZ4UjJxMTRmQjc1SWI4ZXpO?=
 =?utf-8?B?dmluMlVVUklDM0J1c1JIZi9ka3FuKzFlYzFZRWJUOVlLMUtPT2dSWkVvRy9D?=
 =?utf-8?B?VWt3Q2FwTXh5NndjeGwyTkhzY0tMbDJCQWpKbzVJVXNsNkYydytFSWZ0VzJS?=
 =?utf-8?B?YkVzNGZMY05sVFBZVDFsMEpRV2huL3o0WTJBTVlUcDgzeVcyTVZhalVwN1Yy?=
 =?utf-8?B?ZkgrOFpjQjZHR2E0OVk5ZDJvekM2T2ZIVGhkTFRFQmNSc1ZvTXYySEpiNnJh?=
 =?utf-8?B?SEtPZFpoZjUzYXRJVEVuWkZSRXpXYTFaTktpaFl5RjNkbTBxUi9sQ3BsTSt0?=
 =?utf-8?B?YzBneHRJZS9RL0NmTmNkaDdUU1E4TXcvR01MR2RaZXN6Q05NVnZmV3pETGxr?=
 =?utf-8?B?VzNyTDdwSjducCs5dW1zREZOZlJCN3l2azRMc1RSWDJSWDZsbGJzN2QxOE9F?=
 =?utf-8?B?Y2xsUnVCbzlhLzhJckc1RmdrU3lOYU4yTzNBUkFzVUt1MkRQcGZ1N29CcWlX?=
 =?utf-8?B?MGRBOG1yZDZRNEhZWWxrdVBpV3ZMWVpzaFFncWFZSHY5ZGc5K3JFRDQ4VjZx?=
 =?utf-8?B?K2Rod29IZVN3SmprV21CdVFyOTljajRWZ3VjUXJqS013bWJrY0pmOGhBaEJY?=
 =?utf-8?Q?myCIxJvhwO/ufEpjZAehsIhxKyWioFJW8CWajdZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd794f1-4ee1-4b53-e1da-08d9538c9633
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 19:02:33.1658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhwiW6WT2jTIinP6UpqvuAb+i3M0tEB25b05hlKrkWj2Br4NZRf9o3fw8CS4NvbtYILJx6RWeITCcSfdqG9Fow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5163
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

Am 2021-07-23 um 6:46 p.m. schrieb Sierra Guiza, Alejandro (Alex):
>
> On 7/17/2021 2:54 PM, Sierra Guiza, Alejandro (Alex) wrote:
>>
>> On 7/16/2021 5:14 PM, Felix Kuehling wrote:
>>> Am 2021-07-16 um 11:07 a.m. schrieb Theodore Y. Ts'o:
>>>> On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
>>>>> I can think of two ways to test the changes for
>>>>> MEMORY_DEVICE_GENERIC in
>>>>> this patch series in a way that is reproducible without special
>>>>> hardware and
>>>>> firmware:
>>>>>
>>>>> For the reference counting changes we could use the dax driver
>>>>> with hmem and
>>>>> use efi_fake_mem on the kernel command line to create some
>>>>> DEVICE_GENERIC
>>>>> pages. I'm open to suggestions for good user mode tests to
>>>>> exercise dax
>>>>> functionality on this type of memory.
>>>> Sorry for the thread necromancy, but now that the merge window is
>>>> past....
>>> No worries. Alejandro should have a new version of this series in a few
>>> days, with updates to hmm_test and some fixes.
>>
>> V4 patch series have been sent for review.
>> https://marc.info/?l=dri-devel&m=162654971618911&w=2
>>
>> Regards,
>> Alex Sierra
>>
>>>
>>>
>>>> Today I test ext4's dax support, without having any $$$ DAX hardware,
>>>> by using the kernel command line "memmap=4G!9G:memmap=9G!14G" which
>>>> reserves memory so that creates two pmem device and then I run
>>>> xfstests with DAX enabled using qemu or using a Google Compute Engine
>>>> VM, using TEST_DEV=/dev/pmem0 and SCRATCH_DEV=/dev/pmem1.
>>>>
>>>> If you can give me a recipe for what kernel configs I should enable,
>>>> and what magic kernel command line arguments to use, then I'd be able
>>>> to test your patch set with ext4.
>>> That would be great!
>>>
>>> Regarding kernel config options, it should be the same as what you're
>>> using for DAX testing today. We're not changing or adding any Kconfig
>>> options. But let me take a stab:
>>>
>>> ZONE_DEVICE
>>> HMM_MIRROR
>>> MMU_NOTIFIER
>>> DEVICE_PRIVATE (maybe not needed for your test)
>>> FS_DAX
> Hi Theodore,
> I wonder if you had chance to set the kernel configs from Felix to
> enable DAX in xfstests.
>
> I've been trying to test FS DAX on my side using virtio-fs + QEMU.
> Unfortunately, Im having some problems setting up the environment with
> the guest kernel. Could you share your VM (QEMU or GCE) setup to run
> it with xfstests?
>
> Regards,
> Alex S.

Hi Theodore,

Sorry to keep bugging you. I'm wondering if you've had a chance to test
FS DAX with Alex's last patch series? ([PATCH v4 00/13] Support
DEVICE_GENERIC memory in migrate_vma_*) I think other than minor
cosmetic fixes, this should be ready to merge, if it passes your tests.

Thanks,
  Felix


>
>>>
>>> I'm not sure what you're looking for in terms of kernel command line,
>>> other than the memmap options you already found. There are some more
>>> options to run hmm_test with fake SPM (DEVICE_GENERIC) memory, but
>>> we're
>>> already running that ourselves. That will also be in the next revision
>>> of this patch series.
>>
>> In order to run hmm test with generic device type enabled, set the
>> following:
>>
>> kernel config:
>> EFI_FAKE_MEMMAP
>> RUNTIME_TESTING_MENU
>> TEST_HMM=m
>>
>> Kernel parameters to fake SP memory. The addresses set here are based
>> on my system's usable memory enumerated by BIOS-e820 at boot. The
>> test requires two SP devices of at least 256MB.
>> efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000
>>
>> To run the hmm_test in generic device type pass the SP addresses to
>> the sh script.
>> sudo ./test_hmm.sh smoke 0x100000000 0x140000000
>>
>>>
>>> If you can run your xfstests with DAX on top of this patch series, that
>>> would be very helpful. That's to make sure the ZONE_DEVICE page
>>> refcount
>>> changes don't break DAX.
>>>
>>> Regards,
>>>    Felix
>>>
>>>
>>>> Cheers,
>>>>
>>>>                         - Ted
