Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD883CC5F9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84CC6EAAC;
	Sat, 17 Jul 2021 19:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4B6EAAC;
 Sat, 17 Jul 2021 19:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbrR4fruOy4X/FDhIKQENGvnRdXvVoPqY1HMBdH2RYCTbNTOQ8OeZ8aqJ0cnwfAJcaCtacZ/PEknUWrZeUjdKvO3gcRW/oOiirya49knyRZQDcFc5bpkqK9dZWTQVyE1TtU7ie79wXfANZM/fTP2CmSmd9npUp/a04SEH6NV0cXDpgvcDSDd8Tsyereq/Kis8iBCw1sNqFCyvh3MfdPAwq6uTZBTyI0SsyRKCoRbVqLjkyOvMWMbl+ZtpvvMOydCV7jrbmxWOmTAxrlTHpHSSW28xFEUBiavKTWNpa6pRmKZWMQDBHIVvCKgNO/RPejNia3uPsCDDuJf1ji5xURfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RB1vNKylzS+mtDGYh+fu9xIpasBlRWYcYOjK4+HlF8=;
 b=ZaFfFk7psUb7BwcXrXJJKF5ARGlE4XA72fLjXC9DHpJz6t4C5tS3Ennre5hk6szgj9bP/A1sliMg3sJAcu+VYd+2Hg2ay/AnRfKmClfLSiBG/vAP4JUPPZhZCJ9T+joIIThp2oRSB3cZwIK3jDUyiknZ+r/LvtGXhlUNJbUKp0zYLp15tb6XA1zEeZqSB3KHNTbroVVNSzVL8/4y+hGwCWuvGFRH92khjVoebQAY3rLjA2ABZdNASUBo89Ov3v05P7LGVMHco9Foa4xO78nqNkDPo5MvAo61CTEx2/dZseyl2W+iG4ZqlDT4NrphmlM3AVCON68MOZQXQftVzUEW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RB1vNKylzS+mtDGYh+fu9xIpasBlRWYcYOjK4+HlF8=;
 b=ceFI7tFafgeoLA4qb3BsPBT6C7N/eatBog3Wq2AZKy8tvvchcWhMlgmrUjXZJkoBM2JahjuHOjETcqiNpUOMPyldXskaooVLMpH+RWDme9bUFZ3rlSeb+GDjXz4ncKQZBoL32lc3y1EgfTOJn9SD2Oge55Xcm4iLnzi/EuYgbXw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (20.181.44.20) by
 SA0PR12MB4446.namprd12.prod.outlook.com (20.181.44.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23; Sat, 17 Jul 2021 19:54:21 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:54:21 +0000
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
To: Felix Kuehling <felix.kuehling@amd.com>, "Theodore Y. Ts'o" <tytso@mit.edu>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu> <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
 <YPGgvNxfOCx/Sp0g@mit.edu> <e9cc27d6-b0f2-8379-c276-0bbdae3ce4d7@amd.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <601418f5-c526-08e9-b071-4533a32ce25d@amd.com>
Date: Sat, 17 Jul 2021 14:54:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <e9cc27d6-b0f2-8379-c276-0bbdae3ce4d7@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN6PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:805:de::43) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SN6PR05CA0030.namprd05.prod.outlook.com (2603:10b6:805:de::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Sat, 17 Jul 2021 19:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190f1b0f-1a23-430b-48b2-08d9495cab82
X-MS-TrafficTypeDiagnostic: SA0PR12MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44461F1B899EB45D1B05F70DFD109@SA0PR12MB4446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLdy0XyE4pjHkSinQs605y0idpwi4EPt53M8cLtIiJIWj//ZHRGXjjHPaE/YxlT5a53/b9gcnwrji1pyXsVrmhKk/cKZkSFqPgyswW9Y+GURCvoqdir7B2Fa67DkJBgD5g+3Qdyo5VkkP0jGSGyXLtitBlltqNVAC6jY1ISAECNlHkbFc4i2QZwZKUIz3dxdlpYYF0lw9GHT/tbyI5pfUK4RkK04M2XIkCM3D7wcEIg44qAGRi/R1fQLjguopIUjCsI44UbjKqrn8QLqja8ej+YnhLKRgorF4ooItiJZJVYZKp3txEgouIxF9MFdyyXya1oGYt1QBJOuo6diRdXV0WtqWp+fKLEPKR1kkfubQsU36UT6PMwZ7qD3qtbyTqfJLwY0mS2eZprgcXVB03U5G4q8WBO20K1Bj+ADaN3NLTb+10Ep5H6sZl0g8khHo65hiqY5muWJoTWPOIxLkQ4mUd2JNEomHIJ6gU5owHGtiJ3/9eX/+AXimt3+xhAFO5APc/nzrYomW9YS8RgfZ+0vgYZIQMIFTVTQiPFFNdrFMl+x4nuR6vL7Pe1GkkcNEsFlFt+PeRpaSoqU3PTQ7ZFbyiwJ3YQPXOOPMn0OPpdIoOemMnYYj89vc27/ott2OWqglHd0wwaTonNWde8W86Iu4zg4ONT0xcJXr50PtsvYIja285QumbEUWjaj/9bgP8YI/thpBxzrS6xZgvpHENQQE3/35J8nFRIl0n4pgo716J0L2j65WI1Y36jEMpu9PjJzN5qjTugvayrQL1o19j/mKl5hEpLm6EgGykC8FwOdv+zqadzR30zgUKiKsL1z8xTgKWyNHpZz46JJCGumc49eEf5WlPpUMHIFl/0oYceiAN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(38350700002)(38100700002)(53546011)(110136005)(7416002)(2906002)(52116002)(83380400001)(186003)(6666004)(6486002)(26005)(2616005)(966005)(956004)(31696002)(36756003)(5660300002)(86362001)(16576012)(66946007)(66556008)(66476007)(316002)(31686004)(8936002)(478600001)(8676002)(4326008)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDR1TDFLNkdxSVh2TDBCK3R5NWRNWW4xbjFXZ0J1SGtwL0VOdStBMXhhb09w?=
 =?utf-8?B?RUMrTHpONC93enlzMkh1QWZGb1F0aGVSTE1zait0SmxYK0F6eDBMeG1WZ28r?=
 =?utf-8?B?WlU3YWk0OFlhRVpWcHBWZ2tmbGpYOUtqSEVxRGNPN0w3clVTWXZHZ0hzTkQ4?=
 =?utf-8?B?WE4yK1I0WWdXUGU4cmFSZkpPUEZFSmltRFFFN1loRlFLWlBBeDRyb296alIv?=
 =?utf-8?B?NnN6emhpemxONWFub0NycE81VFg4bndxN1Y0WVROT2NEaHNnRVROdHpOckg1?=
 =?utf-8?B?V0c3WEJtcGtoNitXd0d0VENFOEdyMnRkTlI3Znc5VWlacHNzTXE3SzF5L01a?=
 =?utf-8?B?M1JlWEJFUGdpMGVUck4zSEgwMTFlSTNpZXdrTFpyM1JabUVoWkRodkdmMEtZ?=
 =?utf-8?B?UlZ1Skp4Ry83VngwUlVQamZZYnhKdzhXSWhINXFRVEtzYTBrOFlMd0FkNm5t?=
 =?utf-8?B?TDRySmljV1I5WXh5MzdpMGhlTStKNk1mV3E0a0tRMjNFaUdQczFYaVBSN2NI?=
 =?utf-8?B?cndFM1A0NWUyYUpiZHhFeU1PcVM3UEw0UHQvNjBUOWJEVUpTN3dYNnhQay9N?=
 =?utf-8?B?VGtpMXJFaE5Vci9RbU0yNWtJQmJwejRNanFsNWthRlVZQjVGVGFxY0owbUhQ?=
 =?utf-8?B?MThLcDlhZUEvSDhwSzBKM3cyeHBrcHI3MjE1MjBhdnV4OVlDenlWVFJTMDRD?=
 =?utf-8?B?VUZHL1hyUExWZURhYlFVUk83RVlhZ29sVzVKZjhhRUwwUXl6bHg4bWt1VU8z?=
 =?utf-8?B?UmM3NUtMQUlqcDF3ZUlNWlUybStiMVl5c2ZNc2hMeWp5eGw5SlgyWnBMWllC?=
 =?utf-8?B?bFAyNitWN0tGbFpRcGdtU3RJOExEMHlycGh4STFVOHptM0NndzlyQkRYaFlQ?=
 =?utf-8?B?Z29YVkhPUlJIQm5kNVBTQ0xBaWtNT3ZxVSsyU0RoMTdiL21LMkRDOW54akdo?=
 =?utf-8?B?OWhWUlBWbkYxdkxjSHk0NlAyMVFJd3hTMlU0ZW5NMWd4Y3ppSEdoTGFEK0Jo?=
 =?utf-8?B?aXJTeDJvUzk5LzdxUksySGI2Q3c1UDk4bHVaQmErZVNxd3JvUHFRMFVST21l?=
 =?utf-8?B?K0RXK0RuSS9EV05RQVhOb3NGbTB0ck5jSnE0c1hnUlV4aGFGRTV4WmxXcW5K?=
 =?utf-8?B?clEwZi9aR2tENFV4OVNqQ3Q4WVNXOGFWRmRZRTVjOWo3WEp5UDJlbXJkYXJX?=
 =?utf-8?B?RDNPa1ltenpZV2FRbmpPVWpGcnhJV0FUT3V5dGlibUVaWEtoS2lZemNVSTNy?=
 =?utf-8?B?L04zRjB4Nk9DcEZBY0R4R214ZkI1K3g4cUp3Zk50dlNHUW9ML05iMmlLMENE?=
 =?utf-8?B?N3JYOWhhUmR6WEdERVdZckFneE0zdlJ2ZEt3MUtoQVZFL09QSjFZM3RPN0Jk?=
 =?utf-8?B?ZmxYd01mcGR6MVNURXB3a2lucmJrclF3RjhDeVIrN1oyYnVtRFlDQkVIaExZ?=
 =?utf-8?B?VVlCWXNubE83TGVLaFk0aktHOCtQaFM2bkxFM2FUcjlKQVFNYmRsTFhBTUFo?=
 =?utf-8?B?ZlVVdTZNMzFqZU9Ya0w0VTh6T1UxVDVON29US0lxZHpWQk5HNDk4ZExHWEtK?=
 =?utf-8?B?S25OMzFQd3F0ZEZiN2NnZjN4ZndPSkVxcWhVOUUvd2NyRkFFS21LZk5XK1NL?=
 =?utf-8?B?QWg0ZDc3Q1Faa25yc2ZMWlBkL05Cbk9mWG9NczBCYkpHYVpBRWxBeXp4YmhC?=
 =?utf-8?B?bnRUbDlZSmtGaCtoNlRTTjM5ZDRldjNubVQ2UFpsREUvVVBIZGlZb010U0Fh?=
 =?utf-8?Q?2eJf6J4Lfe15rkyFp/8eGGTmAK6iOEUZB4XtdiD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190f1b0f-1a23-430b-48b2-08d9495cab82
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:54:21.5903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72VxJbcyvqC9DWQNTwAK4OYOYSuvrtnohC/gn3vUnRMxB7HSj7TP4OxVFBKIfq5cJOEzZnsT1wRuEnpaI/na8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/16/2021 5:14 PM, Felix Kuehling wrote:
> Am 2021-07-16 um 11:07 a.m. schrieb Theodore Y. Ts'o:
>> On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
>>> I can think of two ways to test the changes for MEMORY_DEVICE_GENERIC in
>>> this patch series in a way that is reproducible without special hardware and
>>> firmware:
>>>
>>> For the reference counting changes we could use the dax driver with hmem and
>>> use efi_fake_mem on the kernel command line to create some DEVICE_GENERIC
>>> pages. I'm open to suggestions for good user mode tests to exercise dax
>>> functionality on this type of memory.
>> Sorry for the thread necromancy, but now that the merge window is
>> past....
> No worries. Alejandro should have a new version of this series in a few
> days, with updates to hmm_test and some fixes.

V4 patch series have been sent for review.
https://marc.info/?l=dri-devel&m=162654971618911&w=2

Regards,
Alex Sierra

>
>
>> Today I test ext4's dax support, without having any $$$ DAX hardware,
>> by using the kernel command line "memmap=4G!9G:memmap=9G!14G" which
>> reserves memory so that creates two pmem device and then I run
>> xfstests with DAX enabled using qemu or using a Google Compute Engine
>> VM, using TEST_DEV=/dev/pmem0 and SCRATCH_DEV=/dev/pmem1.
>>
>> If you can give me a recipe for what kernel configs I should enable,
>> and what magic kernel command line arguments to use, then I'd be able
>> to test your patch set with ext4.
> That would be great!
>
> Regarding kernel config options, it should be the same as what you're
> using for DAX testing today. We're not changing or adding any Kconfig
> options. But let me take a stab:
>
> ZONE_DEVICE
> HMM_MIRROR
> MMU_NOTIFIER
> DEVICE_PRIVATE (maybe not needed for your test)
> FS_DAX
>
> I'm not sure what you're looking for in terms of kernel command line,
> other than the memmap options you already found. There are some more
> options to run hmm_test with fake SPM (DEVICE_GENERIC) memory, but we're
> already running that ourselves. That will also be in the next revision
> of this patch series.

In order to run hmm test with generic device type enabled, set the 
following:

kernel config:
EFI_FAKE_MEMMAP
RUNTIME_TESTING_MENU
TEST_HMM=m

Kernel parameters to fake SP memory. The addresses set here are based on 
my system's usable memory enumerated by BIOS-e820 at boot. The test 
requires two SP devices of at least 256MB.
efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000

To run the hmm_test in generic device type pass the SP addresses to the 
sh script.
sudo ./test_hmm.sh smoke 0x100000000 0x140000000

>
> If you can run your xfstests with DAX on top of this patch series, that
> would be very helpful. That's to make sure the ZONE_DEVICE page refcount
> changes don't break DAX.
>
> Regards,
>    Felix
>
>
>> Cheers,
>>
>> 						- Ted
