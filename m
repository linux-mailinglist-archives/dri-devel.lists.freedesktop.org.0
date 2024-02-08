Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F884DF5D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 12:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C3410E68D;
	Thu,  8 Feb 2024 11:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uYerI0dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAD910E60C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 11:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIlGDzKEyd1tO88ymPwhNn0q1UQcU9K64xFx6x+FpcKEOFZv+FSP8ApxTUd87ZsEDSc6EL6DVH2DYmwcKaMfOA6mp6q6AhmOEaKkBpnRuSaHuCTNPNCUIXXtAV3hLNGBAU8v2+mWGNLZAzCZ91aO137gJDh2gRL3Vv6OnQZXFYfr7QX0k6toQM1OKA37nwLpfybQaq3CmU1QpbI/S9TO9nl+8gvvPsu+KnzNbRLQvtvpHLmn5aFvWFf+BfFcChkbgnvjV8SHddPAmYk9gsD96vyNcFk61RFNLch0Jy+85XwqyA4SQ+J68EwAlvpPXd/wi5nCFpajmHY4x/1Dck38SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1RzYIjo02Tj4eeSUKiGiu7WboJZBVBW+Qnf8d4eO68=;
 b=L1vPc+u9dbTzkjGHo0PXpB6EtvKn++REe4dDdmaE5RnFxBJpDnFXjS9UrPoSYBFnYNv0ar4R00VpUOw+PHnUfKitkEBJs1PcsdBjsL/mD2lWyZ2I7Rv4zUwUfmALXU+0sBGBGqkzQnVafA/dmR/NBatXCZVpreJYRDgm1LRwcXYjUhsfZN8GpBOOIn0CFprUb4MA6s7Gl0j5+MeyEUpCfnld17OXfovMu6EWMm2SJ5MUmw+EOUqlJDRUc6k3yVTFBxw76rAT8EsBBFdMZEo1F3fN9snnPtHoRMZKuyyrsKfwVdgYkTF2zlQRJ/GjxgHm779gJXorI4lzUzPrVLgGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1RzYIjo02Tj4eeSUKiGiu7WboJZBVBW+Qnf8d4eO68=;
 b=uYerI0dSSJEWVcFlEYteb7DJ6+OOX+gBJTiJFCyOHFld9ejcLKVdfPXm/uyIVbjMITFgblCPthH2edooA4AkR4nfxyTj28XHmMRt9VJC0Z7MeLIeLCgLPbYYDSQKRcffF1JSuVIDHhjI2ZXW8a9fjpdhtPH6YXh1GeMgRr00ewc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.13; Thu, 8 Feb
 2024 11:08:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 11:08:54 +0000
Message-ID: <42c543f1-c9dd-4342-877c-fd2fd290ea24@amd.com>
Date: Thu, 8 Feb 2024 12:08:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xe vs amdgpu userptr handling
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
 <CAPM=9twvcJPdZvaw+TOpTC+6NoNTbSqhy97aJRP5Hg0HBkQE0g@mail.gmail.com>
 <bafff5df-a382-45fa-b706-47cdf0afe2cf@amd.com>
 <c12b07c33d11cf668516d92ecf9b908af34bf177.camel@linux.intel.com>
 <d4fa26cdb32371ce7981cc87203859c10e9e868a.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d4fa26cdb32371ce7981cc87203859c10e9e868a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: a7acf61a-db92-4902-5ccf-08dc2896565e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Kjp8CRnobCGUwMeiaMwRidUNmDJqzR1MmUTMLNAGtmxAptqQ1X0PG11suhJwOXJxnwqYTgJnfS/4LHzM79WgHaam6xU2e1LD2S3L325IgtWYh3Ih0l8xtYEX1brsiQgehNAjze6/AtpasOKz+zSJZVzIfVB3YfEyAHqRB1fXIZE8lsDq3uzf3N3gJLXt8GK5TPAtoeB9JVu7rq/rMqmicfMSKZOjclmdln9kqPs18/Wm6oAtoqTJjw6qQBY7JPKqmnqAEFNWvP6biSx/1F756QxUlVg26ZoCvLcXlAkh2kVdUz8K82ZaB0sV2cd7ZkupKlO629QDvw5iqfg8pcUHFdjxB7DgR7oK+E+hQg8lXuIMU1Sg1iB4LcE69OftT/PDWVtl0aD7FISsk3FoSUdYjOesvlXQ89zw8n1ttB9MDJQXVW5DY+g2Zg+IFYRFVkrkP/lDtyw3+4c/Za0Z+DKuCQO5qIc7Ik4gsfJHoOyivd9Yziwv9EPk3DlrmbUo9ilCZIldwV8msxMal9msxMdtmwUgT+nwEcEqyT2LpMeI5R+YA9DM2WqrQ1IktUHg/5z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(478600001)(53546011)(66476007)(31696002)(6506007)(8676002)(6486002)(36756003)(316002)(66556008)(110136005)(8936002)(26005)(41300700001)(2616005)(66574015)(6512007)(38100700002)(86362001)(4326008)(83380400001)(6666004)(66946007)(31686004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDZQSW5DaEZITXhmSlUweG95VHVYUjhUS3hoR0MyU2pIUllQbHlrTzJObGQ3?=
 =?utf-8?B?SkpOcG9xRmdpdHhXU3c0bDdTTHZXZ0lnRkYydGYwVnNaZGt3UlJ2aW02b1l0?=
 =?utf-8?B?VEhWTkNNRkdjSUV4OUlMeVFicDBqOUxiRDl3bHpib2hEYkEwcXhpRlNxejVs?=
 =?utf-8?B?djN3UG1kZDVUVXRDcUVIcHgyck92S05ncDVyRWY0Zi8vZndGVnZHWEJBY0c5?=
 =?utf-8?B?dXlaMjBUWTlBZzJwV1YrUjNUVnY5QSszTy9DK1ROMFc2UW5SU1F5VUdlYjBy?=
 =?utf-8?B?aGx2N3FPZ1EvbkRINkJqTkp2WVNrZUE2OEZEWlM1WktsQyt3SFJvaU44VUcv?=
 =?utf-8?B?SDRVbTIxdHZjdjF2aEpBazMwZ1EzYnRDVE92eEZWOFZvUkp0TFYyVzM5R0tM?=
 =?utf-8?B?cFA3SFo2ck5VVjkvYU5yZlEvUWVWQTZJTENOSVE3d3NjbmFjUURJN0VKZW9h?=
 =?utf-8?B?aWpQd0JJYmhlWHRIMzZ3a1M2OXJjeGVTZklCTEN0MGgwMklWMjVLblZ1QWh2?=
 =?utf-8?B?OFpkVGFwM1ZIWHRKbTBFaG5sSzBqaHV3SThkd0pUajdTVGRkNDVhMndCRFRJ?=
 =?utf-8?B?STNETytVZTY3L3NaTklNck1sL0lvbERrb1FvRDFvbmE1RmI1akQ2OGFwWHMr?=
 =?utf-8?B?WDJMY3BsTGlMR0FsK2JwSkFNSW9XMDRBQ1FhQWJGakxiTWl1Tzg0d1VpQmcr?=
 =?utf-8?B?dXIyTVI0QWJLbDExVHJUVnZRUnBNckM2NmJNc0tYd1lCUjdXQWF4ZlVmSUly?=
 =?utf-8?B?RDdhY0NScWtocURvUm1Rblhtd0k0TG42dDQ4K0JDRWRWdk1wVFovaDNmcXJG?=
 =?utf-8?B?NkxYaWZTTFg0RzV1VmJlTG9pUC9Qb1VCWm01cVRCQ080cENyS3lCQm5iVFI4?=
 =?utf-8?B?VlZzM243M2VLdmNGbWZjSC9GTkl3YlpyWjVlVU96ZWo3YzYySUx2MGdIOC83?=
 =?utf-8?B?LytWMDJYeGtKb010Wmp5S1c4VWVBZ1pnL0pmQ2hXR3F3eGJIR0p6em9DWEsv?=
 =?utf-8?B?WWtJalVnRGU4WU1Td01ZQXN5QUVBbjVTT1ZtT3d1WUF2Y3QzdTgvVG9FMnli?=
 =?utf-8?B?OW0xTEZKY0xOc1ZLTkQ5MFVkYUVIWUJ4M2VtU05Kcy8vUHVHYngrSHdQMFlJ?=
 =?utf-8?B?dHNDUzd2aVZtaStqcVFrWlh5YnVnRCtXT29hY0wzL3luOCtiTjN1M3RJZFR4?=
 =?utf-8?B?cENjZlIxcUZQM2gwTzB5UEpiU0FyYmRNMG45VEl6V1A5MGxPSWpvcnBNREpY?=
 =?utf-8?B?blBCMHRFY0dVYmZFa0lDNy9Gd2RpSDVHMm5hMmwvL1ZzdEt5cHpqRDdaUVFT?=
 =?utf-8?B?c1VRWks4V3BBL05yaVErSmtDZjJvMG0vNml4WUFwOFNOVXJjU1orTE9xOUFI?=
 =?utf-8?B?aysrK3U1dkV0UFV0UUhWSWp4eE5Rem5QNllralcrMkFYdEF5bHdhaGZOMW1E?=
 =?utf-8?B?YVE0dkhSc0krZjJkMk82RlFXQWFhSHBLcmdhblYvNXlpWHRab3d5VmR6dXV0?=
 =?utf-8?B?UFo5U1BvMkFmdzQ5K25zQWZES2xZSDNSM2p0WVlLSk5NazIxZTQ3Q04yQm5L?=
 =?utf-8?B?OXJ1RnloUVZhZnF1aVZQSXAvNUplOXRTODh4bjdsQVNqblJEeE9JVjFINi9W?=
 =?utf-8?B?b2JrTGloeUFLT2tuNU04bnJTZ1lwZVBoN0RldzRpMkU0b1lXVWtXWlpibjR1?=
 =?utf-8?B?N1l3QXNXbXVnbStiVzZKMXNxL1NPU2xUbGkvZnNrQVlmWUh5ZTh4cVpGcERv?=
 =?utf-8?B?MnkyNVB6MG9mZDNzSTQrRDdORmI3VUtpRFlxaTc5V2pPLzJURW1pWE5jb1hE?=
 =?utf-8?B?dWJFUkJXdmFtTHNPa2NQZ2lBZE1nREs3MmRhN29WdGM1bjRTeTRXTVBzc20z?=
 =?utf-8?B?UktrdVkzaE53aUdHcGtEYzdjMER1NU55UjdHNUtUVStCSk1PNVlLM0RYaFdx?=
 =?utf-8?B?ZGRNK1dTNzIwcExPbHc3R2ZzcWFSbHl2R21pbFVCNWwyR25XMVFVMjJWMWYv?=
 =?utf-8?B?V0xmeVh0ZldOWnIzUDdTY1FrdjA4TU9rQ0JFMXVqemgwZFdiaTJ0aERBeGx2?=
 =?utf-8?B?ZWdKUDZZRHB5SDhPeG1JTTZsTFIyMGlZbUtCeVRQUHkzdERrNlBNa1JiRkwv?=
 =?utf-8?Q?uhGDrCkSuHKXF+PtWupP3Vink?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7acf61a-db92-4902-5ccf-08dc2896565e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:08:54.0315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zLVQqQhq+tr5U2NxM+MnLEXueAl7DLwbhf+YDh6UOYfFZRHM83ak0EYPA+azgF8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

Am 08.02.24 um 10:43 schrieb Thomas Hellström:
> On Thu, 2024-02-08 at 10:38 +0100, Thomas Hellström wrote:
>> Hi,
>>
>> On Thu, 2024-02-08 at 07:30 +0100, Christian König wrote:
>>> Am 08.02.24 um 01:36 schrieb Dave Airlie:
>>>> Just cc'ing some folks. I've also added another question.
>>>>
>>>> On Wed, 7 Feb 2024 at 21:08, Maíra Canal <mcanal@igalia.com>
>>>> wrote:
>>>>> Adding another point to this discussion, would it make sense to
>>>>> somehow
>>>>> create a generic structure that all drivers, including shmem
>>>>> drivers,
>>>>> could use it?
>>>>>
>>>>> Best Regards,
>>>>> - Maíra
>>>>>
>>>>> On 2/7/24 03:56, Dave Airlie wrote:
>>>>>> I'm just looking over the userptr handling in both drivers,
>>>>>> and
>>>>>> of
>>>>>> course they've chosen different ways to represent things.
>>>>>> Again
>>>>>> this
>>>>>> is a divergence that is just going to get more annoying over
>>>>>> time and
>>>>>> eventually I'd like to make hmm/userptr driver independent as
>>>>>> much as
>>>>>> possible, so we get consistent semantics in userspace.
>>>>>>
>>>>>> AFAICS the main difference is that amdgpu builds the userptr
>>>>>> handling
>>>>>> inside a GEM object in the kernel, whereas xe doesn't bother
>>>>>> creating
>>>>>> a holding object and just handles things directly in the VM
>>>>>> binding
>>>>>> code.
>>>>>>
>>>>>> Is this just different thinking at different times here?
>>>>>> like since we have VM BIND in xe, it made sense not to bother
>>>>>> creating
>>>>>> a gem object for userptrs?
>>>>>> or is there some other advantages to going one way or the
>>>>>> other?
>>>>>>
>>>> So the current AMD code uses hmm to do userptr work, but xe
>>>> doesn't
>>>> again, why isn't xe using hmm here, I thought I remembered
>>>> scenarios
>>>> where plain mmu_notifiers weren't sufficient.
>>> Well amdgpu is using hmm_range_fault because that was made
>>> mandatory
>>> for
>>> the userptr handling.
>>>
>>> And yes pure mmu_notifiers are not sufficient, you need the
>>> sequence
>>> number + retry mechanism hmm_range_fault provides.
>>>
>>> Otherwise you open up security holes you can push an elephant
>>> through.
>>>
>>> Regards,
>>> Christian.
>> Xe also uses a retry mechanism, so no security hole. The main
>> difference is we use get_user_pages() + retry instead of
>> hmm_range_fault() + retry, with a net effect we're probably holding
>> the
>> page refcounts a little longer, but we drop it immediately after
>> obtaining the page pointers, and dirtying the pages.
>>
>> That said we should move over to hmm_range_fault() to align. I think
>> this was only a result of limited hmm knowledge when the xe code was
>> written.

Yeah, that makes sense. In this case it's just a missing cleanup.

>> As for the userptr not using a backing object in Xe, AFAIK that was
>> because a backing object was deemed unnecessary with VM_BIND. Joonas
>> or
>> Matt can probably provide more detail, but if we're going to do an
>> hmmptr, and have userptr only be a special case of that, then the
>> object is ofc out of the question.

Well how do you then store the dma_fence of the operation?

At least my long term plan was to move some of the logic necessary for 
hmm_range_fault based userptr handling into common GEM code.

One puzzle piece of that is the drm_exec object and for that to work 
userptrs would need to be based on GEM objects as well.

>> FWIW i915 also keeps an object, but it also pins the pages and relies
>> on the shrinker to release that pinning.

Well what exactly do you pin? The pages backing the userptr?

Cause that would be a no-go as well I think since it badly clashes with 
NUMA migrations and transparent huge pages.

Regards,
Christian.

>>
>> So yes, some common code would come in handy. From looking at all
>> implementations I'd
>>
>> - Use hmm_range_fault() - Probably want to temporarily get and lock
>> the
>> pages to dirty them at fault time, though, if gpu mapping is write-
>> enabled.
>> - Don't use a backing object - To be able to unify hmmptr and userptr
> Oh, and to clarify for people that haven't been following the gpuvm
> discussions and the xe SVM discussions,
>
> hmmptr is sparsely populated on-demand allocated (fault aware) and can
> do migration.
> userptr is allocated upfront and can't do migration.
>
> Idea has been to create helpers for these in drm_gpuvm().
>
> /Thomas
>
>
>
>> Thanks,
>> Thomas
>>
>>
>>
>>
>>
>>
>>
>>>> Dave.

