Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE242FD23B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 15:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF0689F19;
	Wed, 20 Jan 2021 14:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158989B00;
 Wed, 20 Jan 2021 14:20:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgLJKWwBHQKQk1Qdt4IG+ScNAhhmmLpJjuau/fUk7hIShyTDqZBP1jfVvOW4dO8VHv7zzErYRNAaUhV61kCYY/8dJ5uqIULNKZ6f5FQoVn7fuWuxudkPog93WSgckcN8JmvmzbrdBHjMUsvI7C+b3RDNJ1EHqABI0nLA8XNugc/3lMnm3+2BM+wWVCxG5BLy4bvnTYanQtReqnYDlOUdcDsbWL4grwC46DtYdLjC19ipb46fusH28jCxMdhB5cBbwbdRjtQ9mZNPke9HxxgN8PdlumKXicDW3UiYt56kgf8LxWs2JpoBckoKikn0dX6E6j2EFlxSyK0WCLkQUisVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/n/jbD8MH5MSFtcdyftOSTDMXQOgfkrihLoUFm9qYg=;
 b=P8z6fWoXfjkdW84A46JU4/90nb2ua9jiWFFH1i9WQSu04omlFQuwM66d7hd1Rc9fCeTTwEy2TH8C9zwRRbAkZftcqep3jJqumFepWA4IIWHdw6AQAbbV3hc1bPMM8F+ZCSkeeOYh0Fu8JtEylK5AbCtc+Hu55CQlOEzfT2SoUf/Poyg+7+5w/NoJL1XkCdNdOPsQB5th/CgBddM2GE4zmlmR0Q3TLeSVSyltDmR5kAZfUbBIWgcFxOBHUM+tjmXdsKMhpjXrS5/ie4ocbQXU+7UdkQVW3yvjaI5QgV6Uug2aBQ5R2tszZOvipE6PxMaJReDiDezuJhO2A1o3tby8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/n/jbD8MH5MSFtcdyftOSTDMXQOgfkrihLoUFm9qYg=;
 b=fQZ/PvdsTEZ8lG6daWDlVZsX1h06JjuoMmMlcL+wOTGQoPwd1+AKqbhLCwrHU5L13l0A12g+Vv9nbQfFuzGj/HnBGoL3nVSJCWcXoTUCp961jnYT2cVvwzKuclqByOf7myFxsKFF+hBHPtCKgHXwYiT31gFuIcWJ2UIyQ1ir3f0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 14:20:01 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 14:20:01 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
Date: Wed, 20 Jan 2021 09:19:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:39c9:c8e8:c41f:6637]
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:39c9:c8e8:c41f:6637]
 (2607:fea8:3edf:49b0:39c9:c8e8:c41f:6637) by
 YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 14:19:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bda30b7-ad38-496a-1ff4-08d8bd4e7854
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4398669E181D232BEF59DCC9EAA20@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLGPqNMvKA3ppIGpzH9l5Md/W+kk25QL8tD8Tt4WK0LquOUEcho+KRjuGfXtrQNUB3OnAnpkDY9nfjWnsbN9P/cjsfzjsv1egj5aXgHj2YBtugvGjyHikr59jAjCda+rAdAYA4y6l5lDM6PlEsm/bJ+rV1T+NyyRuZu1RDzvwNWlX1g4tceO8fSxO1eKYK3UktFadUZLF2qJ5amF1LpsypJXsOU4YFjd6MooLqT4bz+HaWxAfGwlYPVtQwU8uaarxPXMbNHoIbmDjYAYNZt6AiHJ6QFAVQns1UJgbZrp2A65moIRJDY0vK2KgxcPsq1QL9fOZ7kBF+KvHD/obywYHypcbNlC+gJqCFTfSRaa95nJoWm8jzmYvkDbP1jjTRwAx0f1zqbrcWzrrEcuPUpeZ/LxApknb2dliSURESXkrBVQfDx16E7bvfNR+rPUUc4Bnqf2EV5Rmq94w7C80/5wV0t9Mu3Ac1qjS4i84jsHHxKRZD4sLgIDCsHRicMus9YDEWheOitacsV+Uv2fBafw75S9rl6+kSRWqugf0kTMENAagaPZZ+X663rPX3tISztg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(31696002)(16526019)(54906003)(45080400002)(186003)(8936002)(52116002)(6486002)(30864003)(498600001)(5660300002)(66476007)(7416002)(36756003)(2616005)(83380400001)(6916009)(966005)(53546011)(66556008)(86362001)(66946007)(2906002)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1EzdytnU0VSNG5ncWV0R3ZRby85N3UwNGpDYVRyeE5GMUM0ckNUSlZuSDRP?=
 =?utf-8?B?aEdkL1RhMHErenFvUlZ2bGw5dWl0bGFsL080MVJDZityRVNSOVRuUmRKMWNE?=
 =?utf-8?B?L1RUVDB6S21EalBMbEZkY1VCYUpTRTVmdkNNbGFOdzUwWWNtc1o5RU10M01P?=
 =?utf-8?B?aUxQeHlFcWZMUTlLV3JzZmVPRHJYSDVrYk9CTEFEY2RSRzV2UjZYTGkrTzlL?=
 =?utf-8?B?a0RZMW9LYUdCNzFFN2I5M3J1WW5velRud3VNTEladmRQRldBUVdaYUlObGR4?=
 =?utf-8?B?cmFqb0R4UERQVkdDQ0RWNXJlN0dKZmlVbDhYY1dBS3JHajVFNHIvVkhpbHZq?=
 =?utf-8?B?c3dFZVIyTzVPczJTeUlDbGp3QXBmV2VEOU9DR3NqajhsS1l6UzF0TUdmR1JC?=
 =?utf-8?B?Mng5SWN5cjJkd1p3NnFkNTJGaVpBRjRDaHZxNW5LM3d4TUxlZXBsYXVNZEll?=
 =?utf-8?B?cU9QajdjWFl3bnkzQXh2ZHhaQ0FaTFdsS3lDbkxZVFVSbUdzckJjY1lSQ05h?=
 =?utf-8?B?S0w3RC9hR0U1enpNVHVpN1pDYWxPYXNZWEo0Q2RLeDVMS0s2QTNMamI1bm1R?=
 =?utf-8?B?UHJQMWx5VUdqZUVrd1ZYKzhXQkgxY1gwTVZKTEplZVFmZ05uc1BoY0Z5Rkpa?=
 =?utf-8?B?Z3c2QjFHak5wMyswTmFUcVgzNGxLRTRyZHk0VzZxb2VRL0ZsZEF5WHBuL25K?=
 =?utf-8?B?eGJLVVVHY25yN0dhcnV3SGtVbHBmR0V4Szhza3FPdVkrTEJTdlpxTmVha08w?=
 =?utf-8?B?OUZjRW1PL09XM3djVTBJdmNVU01SOXlvNGZzWWZTeEJtN0FreVRVMkN5QzNP?=
 =?utf-8?B?ek5heUdZRUgvbnAzVyswK0dLemFCa0hSZExOSnZ4V2UrSFZoUk51VjlCZWk3?=
 =?utf-8?B?L0p3Wm5ZSjV6OGhsMjVmWWRXbThPR04ydStpdXkwVEdNd0NtbUFnRWxsSDFz?=
 =?utf-8?B?ckN5ZnlvcE8raVhIR2ZBVlA4YXIrWE9aV1QycjR4SG8yOUtBK0FpeURNdVVD?=
 =?utf-8?B?WnZpell0TmJ4VUpjR3VQaDMvcXhWNUVVdFE2OTBXakJLY0txaExhSkFOYXRI?=
 =?utf-8?B?UDB0ejRubHNXVXBWcjl3Q1hoN0JVVHQ1aWlvaktWL2tJVWZ3YTExNWEwREFv?=
 =?utf-8?B?aDltSnZGSXphMGw0b3pCNmNjV2s0YlRDR1hZbVI5YUFsRXBKUlRDTUhrbTU0?=
 =?utf-8?B?eE42V1UyN1V5bXJQeURVWG5Ic0lCOTVoYmV0K2pBUEdWTXo1OFZlUmE5ZlVP?=
 =?utf-8?B?RzI2NExnZHRhdkpDQXBYVWdiTktnR0dPMVI5bzRPMzg4dTdNa1c5Rm1Fam1x?=
 =?utf-8?B?SUpQVys5eTBjSDA1L0VGMGhhV0krbGJuaUswcmhTM2JLOHNrd2FyZ3M4UXNp?=
 =?utf-8?B?UWthU09qcEt5eDYzcWpsN2lQSXRVZFIxS0tJeVBiTXFBa2UxdGFpYjZ4L0Na?=
 =?utf-8?B?N2FNYWY1ek9tUVJ3ODJ0UkdQVS9TV0NsdDd1Z0MxTmlPbEF4Unh1dDlCTnZV?=
 =?utf-8?B?SGlVanFyYzlpNUhBcHNNSi9jM3JOT1ppUmE3TGljYTBpcitLRHBlUkdINTFR?=
 =?utf-8?B?dzMzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bda30b7-ad38-496a-1ff4-08d8bd4e7854
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 14:20:01.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSt14ArA8Ae1CakmFTEZKHSSo2aJat/tTYLqrviZGUMhv82LxXTIG6DuqRTuhchpzOB3zkH8L1lES6lfdaL7AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/20/21 4:05 AM, Daniel Vetter wrote:
> On Tue, Jan 19, 2021 at 01:18:15PM -0500, Andrey Grodzovsky wrote:
>> On 1/19/21 1:08 PM, Daniel Vetter wrote:
>>> On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>> On 1/19/21 9:16 AM, Daniel Vetter wrote:
>>>>> On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
>>>>>> Until now extracting a card either by physical extraction (e.g. eGPU with
>>>>>> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
>>>>>> would cause random crashes in user apps. The random crashes in apps were
>>>>>> mostly due to the app having mapped a device backed BO into its address
>>>>>> space was still trying to access the BO while the backing device was gone.
>>>>>> To answer this first problem Christian suggested to fix the handling of mapped
>>>>>> memory in the clients when the device goes away by forcibly unmap all buffers the
>>>>>> user processes has by clearing their respective VMAs mapping the device BOs.
>>>>>> Then when the VMAs try to fill in the page tables again we check in the fault
>>>>>> handlerif the device is removed and if so, return an error. This will generate a
>>>>>> SIGBUS to the application which can then cleanly terminate.This indeed was done
>>>>>> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
>>>>>> fact that while the app was terminating because of the SIGBUSit would trigger use
>>>>>> after free in the driver by calling to accesses device structures that were already
>>>>>> released from the pci remove sequence.This was handled by introducing a 'flush'
>>>>>> sequence during device removal were we wait for drm file reference to drop to 0
>>>>>> meaning all user clients directly using this device terminated.
>>>>>>
>>>>>> v2:
>>>>>> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
>>>>>> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
>>>>>> waiting for all user clients having CPU mapping of device BOs to die was dropped.
>>>>>> Instead as per the document suggestion the device structures are kept alive until
>>>>>> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
>>>>>> belonging to the device directly or by dma-buf import are rerouted to per user
>>>>>> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
>>>>>> since i am trying to get the minimal set of requirements that still give useful solution
>>>>>> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
>>>>>> test case is removing a secondary device, which is render only and is not involved
>>>>>> in KMS.
>>>>>>
>>>>>> v3:
>>>>>> More updates following comments from v2 such as removing loop to find DRM file when rerouting
>>>>>> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
>>>>>> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
>>>>>> On top of that added unplug support for the IOMMU enabled system.
>>>>>>
>>>>>> v4:
>>>>>> Drop last sysfs hack and use sysfs default attribute.
>>>>>> Guard against write accesses after device removal to avoid modifying released memory.
>>>>>> Update dummy pages handling to on demand allocation and release through drm managed framework.
>>>>>> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
>>>>>> of GPU recovery post device unplug
>>>>>> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
>>>>>>
>>>>>> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
>>>>>> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
>>>>>> with the primary card or soft reset the device without hangs or oopses
>>>>>>
>>>>>> TODOs for followup work:
>>>>>> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
>>>>>> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
>>>>>> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
>>>>>>
>>>>>> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cbe51719dbdac41f5176b08d8bd2279ec%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467303085005502%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T4JLiSl7m4R%2FhcfcAxomY%2FMJ8QiTHaJ%2FJaqNZVT%2FDsk%3D&amp;reserved=0
>>>>>> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cbe51719dbdac41f5176b08d8bd2279ec%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467303085005502%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qitlHw6tqm4eGRstKccgh8zIPgILbS%2FJUa5yZGmSQcU%3D&amp;reserved=0
>>>>>> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cbe51719dbdac41f5176b08d8bd2279ec%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467303085005502%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UzOXP6bHYY6f7MCs4ZbSSvfY0DJ%2FEVPeIqedAi%2BZGG8%3D&amp;reserved=0
>>>>> btw have you tried this out with some of the igts we have? core_hotunplug
>>>>> is the one I'm thinking of. Might be worth to extend this for amdgpu
>>>>> specific stuff (like run some batches on it while hotunplugging).
>>>> No, I mostly used just running glxgears while testing which covers already
>>>> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
>>>> test suite
>>>>
>>>>
>>>>> Since there's so many corner cases we need to test here (shared dma-buf,
>>>>> shared dma_fence) I think it would make sense to have a shared testcase
>>>>> across drivers.
>>>> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
>>>> and fences
>>>> use cases there or you mean I need to add them now ?
>>> We do have test infrastructure for all of that, but the hotunplug test
>>> doesn't have that yet I think.
>>>
>>>>> Only specific thing would be some hooks to keep the gpu
>>>>> busy in some fashion while we yank the driver.
>>>> Do you mean like staring X and some active rendering on top (like glxgears)
>>>> automatically from within IGT ?
>>> Nope, igt is meant to be bare metal testing so you don't have to drag
>>> the entire winsys around (which in a wayland world, is not really good
>>> for driver testing anyway, since everything is different). We use this
>>> for our pre-merge ci for drm/i915.
>>
>> So i keep it busy by X/glxgers which is manual operation. What you suggest
>> then is some client within IGT which opens the device and starts submitting jobs
>> (which is much like what libdrm amdgpu tests already do) ? And this
>> part is the amdgou specific code I just need to port from libdrm to here ?
> Yup. For i915 tests we have an entire library already for small workloads,
> including some that just spin forever (useful for reset testing and could
> also come handy for unload testing).
> -Daniel


Does it mean I would have to drag in the entire infrastructure code from
within libdrm amdgpu code that allows for command submissions through
our IOCTLs ?

Andrey

>
>> Andrey
>>
>>
>>>>> But just to get it started
>>>>> you can throw in entirely amdgpu specific subtests and just share some of
>>>>> the test code.
>>>>> -Daniel
>>>> Im general, I wasn't aware of this test suite and looks like it does what i test
>>>> among other stuff.
>>>> I will definitely  try to run with it although the rescan part will not work as
>>>> plugging
>>>> the device back is in my TODO list and not part of the scope for this patchset
>>>> and so I will
>>>> probably comment the re-scan section out while testing.
>>> amd gem has been using libdrm-amd thus far iirc, but for things like
>>> this I think it'd be worth to at least consider switching. Display
>>> team has already started to use some of the test and contribute stuff
>>> (I think the VRR testcase is from amd).
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>>>
>>>>>> Andrey Grodzovsky (13):
>>>>>>      drm/ttm: Remap all page faults to per process dummy page.
>>>>>>      drm: Unamp the entire device address space on device unplug
>>>>>>      drm/ttm: Expose ttm_tt_unpopulate for driver use
>>>>>>      drm/sched: Cancel and flush all oustatdning jobs before finish.
>>>>>>      drm/amdgpu: Split amdgpu_device_fini into early and late
>>>>>>      drm/amdgpu: Add early fini callback
>>>>>>      drm/amdgpu: Register IOMMU topology notifier per device.
>>>>>>      drm/amdgpu: Fix a bunch of sdma code crash post device unplug
>>>>>>      drm/amdgpu: Remap all page faults to per process dummy page.
>>>>>>      dmr/amdgpu: Move some sysfs attrs creation to default_attr
>>>>>>      drm/amdgpu: Guard against write accesses after device removal
>>>>>>      drm/sched: Make timeout timer rearm conditional.
>>>>>>      drm/amdgpu: Prevent any job recoveries after device is unplugged.
>>>>>>
>>>>>> Luben Tuikov (1):
>>>>>>      drm/scheduler: Job timeout handler returns status
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
>>>>>>     drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
>>>>>>     drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
>>>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
>>>>>>     drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
>>>>>>     drivers/gpu/drm/drm_drv.c                         |   3 +
>>>>>>     drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
>>>>>>     drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
>>>>>>     drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
>>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
>>>>>>     drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
>>>>>>     drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
>>>>>>     include/drm/gpu_scheduler.h                       |  17 ++-
>>>>>>     include/drm/ttm/ttm_bo_api.h                      |   2 +
>>>>>>     45 files changed, 583 insertions(+), 198 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
