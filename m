Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EB3D4311
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 00:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7F6FD11;
	Fri, 23 Jul 2021 22:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9279C6FAC7;
 Fri, 23 Jul 2021 22:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDm4v06/gStv+ImM7hP+4LEV3gDIj9qFffPgxkqDzI+UwbKVWAVP9CDd2hU8GDz/c158i3yznYVLhEwtcmcgrSUE8wtEPV7CzVco0OySr0dNzz8uu0JcLh+5wGz93L0NZgFsr0NuhqJUV4ybixJbpDAi2W7qzY9hdxBfoj6lqbCurxbnBrW1rEisVkl8uAo85sDnBjkZUw4QHdA2fd/AfP00aNGF3Bn7aKG0G/TgzNd69Vs09f2al+ubKLhHGxBV20VaVbAnBb5y+SQsVQM8Nc7e+/05M+R9nQpjffeXqOmbmo+RsaC6qgfaYYarbLTHx+Nf5RL5GgugbJnJugKtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWVERFJ9PqFKSyT4srd82031Du9GNyEn0Y8flW0V8PM=;
 b=PDsfzIjOfCaJNotL5k4xC9MuVK0XL7s5TdeNcDjNP7r+48Aw8RHizmDApIxVHad1aJqdN+v4pVYWekTQPgDhcP5OWGmravnpgPWwpykWebiuV7ux7hPoK/7BIDTnuP+RF5x+nZYso7UZlL8MR+nmGErvZt7VCVWSbcemVQp/hkF0VPdweMcZxV+67gXM0cxqTNoVuBWYrdUdvYyJbVlt5JqVw9Z6Bvjm/VQ8DBqXzmtmTYDgbrXrGisZnZiGW1ZWvkLljS3HIcKPhJ/WoulLdO4+URqEvKzerThj3MUgiAhIqFfBQ1pFiw74V35Hn/XO3J/Pqfikh9mmVEAaLUgaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWVERFJ9PqFKSyT4srd82031Du9GNyEn0Y8flW0V8PM=;
 b=Ccy0WaqeDLhLwGZi+KciiTEg1xi42O/9RGAm45fPwzFjo3/+/ASSi2qyzwCScRg9FDQzS8BEJIu0n6f1blXjlmU3KyDWt9i01mEMS1WM+NBlUX8vjgXcjWjURbLx06oxrzpkc5+wEOSZLjrsHFBfsTUCmbagg4kYPy5xgPcqh+I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4590.namprd12.prod.outlook.com (2603:10b6:806:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 22:46:33 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%5]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:46:33 +0000
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
To: Felix Kuehling <felix.kuehling@amd.com>, "Theodore Y. Ts'o" <tytso@mit.edu>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu> <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
 <YPGgvNxfOCx/Sp0g@mit.edu> <e9cc27d6-b0f2-8379-c276-0bbdae3ce4d7@amd.com>
 <601418f5-c526-08e9-b071-4533a32ce25d@amd.com>
Message-ID: <79416c93-2dc7-6097-01e4-d60d6221ee14@amd.com>
Date: Fri, 23 Jul 2021 17:46:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <601418f5-c526-08e9-b071-4533a32ce25d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:208:160::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.141] (165.204.84.11) by
 MN2PR13CA0002.namprd13.prod.outlook.com (2603:10b6:208:160::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.9 via Frontend
 Transport; Fri, 23 Jul 2021 22:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6011aa29-e21c-4cdb-fea5-08d94e2bb883
X-MS-TrafficTypeDiagnostic: SA0PR12MB4590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4590E68E42FAA09C0A019166FDE59@SA0PR12MB4590.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGnQHW8hmv8nn2qaGblvx4INb/iw1NE6Xbsq9qE4r9CFAYskufIiZOxfkafcszBiuDXiVVnUg5/R8dM78Hs+0UjT0qDYrLxVnVmYmkhPT4PFy2LHOwXS63Js7P0mLNn9gWmfolp0Hzm2WVq6zE9PWUknGlSuzB5jBBmLRXRuns4qu3da8E83ZyRzZ/xPKr1KbSL/n2Z9ToV8gX07L5J03899aHJEkT7UzEBBBS7f0TLPiGMc25lNEVpE+6fez1Bth/JscH7xX3zNpgO6uuVA+Zz8xO4UNROyMgRrgD6ks7tJuocE0BKtWkgVFYwzNglrNQceobI+U9SwR1dlNd7ARa4rXhCvn3CXHFK6TI/Ob9W4Ve6R4CnBbrC0eGWWOsPRAJ3pwl9cLkP9JqgNSZB06yF/F/Kp4JRf3vgHAsRGkwY36LTSBEDzC7A/D1qg8BCUBdMStk82eiDh8ahKhy9r4IH9hvhBdc80hFPtzETZ+o2QA2Nw0pwuiSP7BeBDRomrg9qdNkBzehr8f8j51AzacY2MFIt4OkVlMem4xmAUGNpHhMKrNPCAZrfes6xgPVDDSI/6Ial+a6UpasoKDvdGfmI6E2tfczcSEtkQyXISPnHPQ1TL9n72Q05085VyfoGvAWXdNLy5DwamgPKDJC13yRzFbIP/FbPMBkbpu2hR2NEeF7wHhHaSEd54gpDqwhiWjUg2xpzF/0m+uzdKC1jlfDkSzRovIu1WXfr/fxykGMjQiJWaq7hL7NsAhFpSrAyNOIRuM7ITqfVUbKOHUqpSQ2mEEYJUgQUcwn10oUUpg0iT/qjB5z7Y0l+P5+ty9NW7SxSNfpEdUqkzAIhQkFI2PhmxyCv3LlogcYH0VHfVRzbc+3ojXILuVb0LESQIBsfN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(66946007)(36756003)(8676002)(6486002)(8936002)(53546011)(66476007)(2616005)(2906002)(16576012)(52116002)(31686004)(956004)(66556008)(478600001)(966005)(110136005)(316002)(86362001)(31696002)(83380400001)(26005)(38100700002)(38350700002)(186003)(7416002)(4326008)(5660300002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xmYnNiczB2L2RYMkZaTE9veTY4STNXeTFseEkvUkZKQmcvTDJtajMybFZK?=
 =?utf-8?B?Tm96U3hPVHE2SWFzS1BMVnA4R0hUVzFMNEE5RmpCUGFoREZWMHhWb2NoWUxx?=
 =?utf-8?B?N3V1ajJDdUNMc3VmQ09oOElqRDJqeWdRWCtDa013YmZTUFhNVm9ISXg2THEz?=
 =?utf-8?B?ZFJSYS9FTFdVYjBWMU9Ob3oweHdscnBMRHl0MzE5aFN4UmpTUVluL3p5clNw?=
 =?utf-8?B?N1RFYTZKeUVSRGFZak0xb2R2T2tYM2pTOXRVWUhVNytDNm9pbVRoUlN0bFk0?=
 =?utf-8?B?K1JZWEp5c0xRbEdxUzdEQkJwVkp4MnFsRmEzRGJkOG5RdXRaRmc1elNXS3RH?=
 =?utf-8?B?RjNJZytxd0VjL0JxVGEwcTJFYzZ2a3lGV1ZJcHpCS2c2Q1NIQzNJdDQ3Qmtp?=
 =?utf-8?B?ZDdIOHkvS1BWZVV3eEZvT09OS0Z1UEcxR0w0dGR0VXkrbzFIeHIzOVlRYnlZ?=
 =?utf-8?B?YVhKNkJ4ZGZLVk8rZVVwMTd2QllDRHpCbTFOejFBMHRNNi8rNDM5QnlXM3Fj?=
 =?utf-8?B?RnRGc3plV3ZzempFM2lWWCtnUDdnVG9NbnlPeHVFRjBtNWcreEpPQTliYTZP?=
 =?utf-8?B?V3FIdC90MzJuM3hBazVSaUo2cWhUVXE3LzVPZG5JdkNTSFN5cHhpZFZCUHpn?=
 =?utf-8?B?L3JpT1Y5MEZCdmJLNldtOVFwU2JoZ0UxbFJjZkF6ZElXbUVSQVZ2amRtcFNr?=
 =?utf-8?B?NTVlbDJ6QjRSTmxaTE9EOG1QamZhNFRKbHEwSUR6M1B2d0NiTUlQZlpEbTFx?=
 =?utf-8?B?U0NxSHgwbzRCME1obDlPK0JxTG1sME42cWFrbXNVQ3hxVzVUOWhGQlRrUG1m?=
 =?utf-8?B?UjlYb1QvdnpabU9tL2JFcTk0UEY1cUJzbFFUTFJVYStqc0NPZGdLTTY3dVRp?=
 =?utf-8?B?RndtMlhMeTFkYmtFOW5yQjlOazhmTW1Nd2RUT2djUGhxWXJYN25wZGwvVEo4?=
 =?utf-8?B?aTA2TEdjTzBsVVFuZ3ZoTmg0VkJhcEc3dndFdUxSUmN1ZitHMXViMW03WWxV?=
 =?utf-8?B?bm4wRGwzUTl2WW5FbCtmdFFLTlBSQ0NhWXlKZlliSGhxd05Xd1YrbG01SGRM?=
 =?utf-8?B?clUwSm9OekttYU5SdjNNaTBtMy9nWUU0ZTl3SUNBL25LT2loZm9Wck9nTE84?=
 =?utf-8?B?NGozTjJSMmdJVzEyMzZIVStKSlFieklINWkyZGh2STRITFZnQVd1VmxZM0tU?=
 =?utf-8?B?SUh0bFFOVUdoMGE5RURXWDlyd3F4UHBScHRub3NtYTJKMTMwVDBSaVprWitX?=
 =?utf-8?B?R0x5cTVXY09WYndSWWlpdkRFQkJONWhBS04xL0Y1YlVNSkxiV3VTbURYSTUz?=
 =?utf-8?B?V3VheDlBNGFycVRqNnFreXRTYzFSZ3hhcmJ4Q21ZZWk5TnQrL1dLNnlqNC93?=
 =?utf-8?B?MlM2a2lzQVNlTHVpZEhDblY1bkFSQ2R3Q3JJMjUxL0dKUjN5NTZKb0dVL2wy?=
 =?utf-8?B?K2ZnMHovTnZLTi9xRFhodm1GVGdFZEg2QlViYWZRa3NuZGMrZTBsdmdtTjVC?=
 =?utf-8?B?eDI4QWtlYVpERnQrQmVvZzlYVk5YWmxNOHU0MHUxQ3AxNVoxdDlSV2lqRGJM?=
 =?utf-8?B?KzdGR2N6VXdnSmtvZVFMZkY5QTFBaDZoSkc5K3ZhOHVYcUVTaW5oN3lWRWJq?=
 =?utf-8?B?bFBxbWFQYms2bThJbS9zK1dMUlhTNVpKT29EbnNWZUgzc21ISVdPaHlKMnNR?=
 =?utf-8?B?QnZ3eFB2eituZ2xsUnNmcUttZWtBTkxoeWhTWWxzYjBxdUFjYkdVQVdoTmln?=
 =?utf-8?Q?BpGEI9z4CM3ThC8dTVf++mLWjJYmoC7PJ/yN/O/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6011aa29-e21c-4cdb-fea5-08d94e2bb883
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 22:46:33.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wK+abXlkxruwcX9thHD41ve9wzm2Igjjv0EchNiVy6hLf97K3gr/+f82bKqTu9fjc7uMnUsaLnypY8pbkxlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590
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


On 7/17/2021 2:54 PM, Sierra Guiza, Alejandro (Alex) wrote:
>
> On 7/16/2021 5:14 PM, Felix Kuehling wrote:
>> Am 2021-07-16 um 11:07 a.m. schrieb Theodore Y. Ts'o:
>>> On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
>>>> I can think of two ways to test the changes for 
>>>> MEMORY_DEVICE_GENERIC in
>>>> this patch series in a way that is reproducible without special 
>>>> hardware and
>>>> firmware:
>>>>
>>>> For the reference counting changes we could use the dax driver with 
>>>> hmem and
>>>> use efi_fake_mem on the kernel command line to create some 
>>>> DEVICE_GENERIC
>>>> pages. I'm open to suggestions for good user mode tests to exercise 
>>>> dax
>>>> functionality on this type of memory.
>>> Sorry for the thread necromancy, but now that the merge window is
>>> past....
>> No worries. Alejandro should have a new version of this series in a few
>> days, with updates to hmm_test and some fixes.
>
> V4 patch series have been sent for review.
> https://marc.info/?l=dri-devel&m=162654971618911&w=2
>
> Regards,
> Alex Sierra
>
>>
>>
>>> Today I test ext4's dax support, without having any $$$ DAX hardware,
>>> by using the kernel command line "memmap=4G!9G:memmap=9G!14G" which
>>> reserves memory so that creates two pmem device and then I run
>>> xfstests with DAX enabled using qemu or using a Google Compute Engine
>>> VM, using TEST_DEV=/dev/pmem0 and SCRATCH_DEV=/dev/pmem1.
>>>
>>> If you can give me a recipe for what kernel configs I should enable,
>>> and what magic kernel command line arguments to use, then I'd be able
>>> to test your patch set with ext4.
>> That would be great!
>>
>> Regarding kernel config options, it should be the same as what you're
>> using for DAX testing today. We're not changing or adding any Kconfig
>> options. But let me take a stab:
>>
>> ZONE_DEVICE
>> HMM_MIRROR
>> MMU_NOTIFIER
>> DEVICE_PRIVATE (maybe not needed for your test)
>> FS_DAX
Hi Theodore,
I wonder if you had chance to set the kernel configs from Felix to 
enable DAX in xfstests.

I've been trying to test FS DAX on my side using virtio-fs + QEMU. 
Unfortunately, Im having some problems setting up the environment with 
the guest kernel. Could you share your VM (QEMU or GCE) setup to run it 
with xfstests?

Regards,
Alex S.

>>
>> I'm not sure what you're looking for in terms of kernel command line,
>> other than the memmap options you already found. There are some more
>> options to run hmm_test with fake SPM (DEVICE_GENERIC) memory, but we're
>> already running that ourselves. That will also be in the next revision
>> of this patch series.
>
> In order to run hmm test with generic device type enabled, set the 
> following:
>
> kernel config:
> EFI_FAKE_MEMMAP
> RUNTIME_TESTING_MENU
> TEST_HMM=m
>
> Kernel parameters to fake SP memory. The addresses set here are based 
> on my system's usable memory enumerated by BIOS-e820 at boot. The test 
> requires two SP devices of at least 256MB.
> efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000
>
> To run the hmm_test in generic device type pass the SP addresses to 
> the sh script.
> sudo ./test_hmm.sh smoke 0x100000000 0x140000000
>
>>
>> If you can run your xfstests with DAX on top of this patch series, that
>> would be very helpful. That's to make sure the ZONE_DEVICE page refcount
>> changes don't break DAX.
>>
>> Regards,
>>    Felix
>>
>>
>>> Cheers,
>>>
>>>                         - Ted
