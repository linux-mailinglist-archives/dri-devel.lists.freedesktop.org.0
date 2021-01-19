Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08022FBEB6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 19:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715E16E897;
	Tue, 19 Jan 2021 18:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C416D6E890;
 Tue, 19 Jan 2021 18:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OphlmUy4eKpro2GPm4NKdQWHXbgTjUfLX6/1NJhT2AiJi+hfz2/awFtGVwL7RhaJRMODRIXUxWcMwk7diEERhjRfQnR9dfSAcyzfYXiZxvQplwNfSpAYQUQ2m9p+f5YIrmbIEzOFzvXAw1/jaP+Jd4e8YT7wnOJmc7iT9Rw/j59/Yx+uKNUPQYPig9C2IDz71/Tj3JP0KN9QjnK4m805Z6UjJ0vvcekjJlUwVAyiJEwtafGhO5WmgMyAbitB1fVZC0cfQOwcju2lGp0aTNSOEbaUtYzQZdPjVMGDWmAz4qRRD7WzlnaPguNxQicoT1GdXT+FpDT+xF98mfzYZ+Iu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+fj62N4N2554/9NIInQ3yyidUu4EMsFdIEYRYw+J6U=;
 b=NA6lOzMdkEfXfFKaMM54gLHZ1xMBQJUFpe7eQShWWoLOcORhImRrBidkUhVXmhHasYstz7+g70oQH68rYb25+IxPS8F1riFgVGRdxDzTS2MenUaaJUY3/NUiAiBZZEJ5CcihE352fkB0nAI7IypUTKUZt5n5yDtQtUERlHjXXQFF5OKbZfY9Vc5gVd7v1krPi/DbzfZ4ddO/qFfvGxEl5jNoRhp/5ZeWDy/z6JomRO85H/YSuVvt4MkSeMAeoRZojSGXmNJy6IZmwobiRrgLpwcQxEnsLQooq350wt61eadYF39tE/+Mjf0qnyI8aH1K9HZ5uY83+lC0PRuMjdKVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+fj62N4N2554/9NIInQ3yyidUu4EMsFdIEYRYw+J6U=;
 b=oE4+dhM75o3rFvdy7sPOuZqaiPVnyr9GfNqpwvdWnIFakKfDciNjQROP/D7L1AbGhljHXaKb+oYvwtHzGx9GwtWNzBLNSEMQ509DvKl3YKNQr6go51tcgGEV9msubmOHOdVRd9pfNo9tZctVyzFH9ot480Tj9qjLojKvP/6PIvE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4542.namprd12.prod.outlook.com (2603:10b6:806:73::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 18:18:18 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 18:18:18 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
Date: Tue, 19 Jan 2021 13:18:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
 (2607:fea8:3edf:49b0:c1b5:6dec:d289:5430) by
 YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 18:18:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3820920a-d931-49b2-4c28-08d8bca69841
X-MS-TrafficTypeDiagnostic: SA0PR12MB4542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4542A92A725252F69A0CFD5FEAA39@SA0PR12MB4542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZ6cPLMq3UEb7yfAyBjYGDwUOXiPMoEd4dZy34VCJlzZnySd4D8WXIj4E2ZJPnEWw9kQFcqsXexgQzCGwQjlvkOwUV+om/zu4wp27ZFRy157i7NSLCwNkhz5FkmJCDa37YNUtr7H1wOwfyzR5YT7iMvyrFMxBHL46Szy5RTwaVRMjUPYvANxv5rievlzkEdpUJTKFRjhDCIzk1iy915Drwhw6zV/w5D130wo/wLoemEXIXbqBSDdYlRbfJ0f50xcvFRVMGzy1LfSflj6F9tg/LCWTzlCTEnf/gKp335j2V1ZMXaHw+xa+zS4pmTd5kwEXHmeuCZZZvgc9Aevq5eQ/YXurTZ6yT12QWuW7LyAVp95eTiuyf4sJbzeuSIDe1Ngl26J+3ceSufP403w58qDJOl/o8/nPAyau3TaWslspNAZj6r9FaLp4E/ouO8mG/ep5nkjRvhYuD9WxIPf+XGRWWWTn0tcIp+OkSZkO19iLWMrXqdyw5InUhEYSzhnS+p0eTuYT8c6Zm5lGEV6+AmjA6PncN/TFqcBk4YhzjLniWRPoxuZJrZzhUvHtEtg/T7b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(52116002)(66556008)(66476007)(66946007)(54906003)(316002)(2906002)(5660300002)(8676002)(31696002)(31686004)(86362001)(36756003)(83380400001)(478600001)(7416002)(2616005)(6916009)(4326008)(966005)(53546011)(8936002)(45080400002)(6486002)(186003)(16526019)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjVWakdObjVRenExM25DSnRaa0RUVkxvaDY4TTUzTzEyY3M1emF4Mi9yZlVq?=
 =?utf-8?B?b0lSeEdDUXBlWTlSQzI5MUtRTW4vZmpnRzZQWi9aT0hNU0FMZkVXRVJ4Wmkv?=
 =?utf-8?B?bkgyNmxCOXIzUThvYkxuRnJCMFNwK2hyNUdjUnVUQnRpR2ppT2tNT1hyUGND?=
 =?utf-8?B?eFBuOWNqbGNOL1dWMklzdzEwNXRpeUZRWmFVMXhDbkl5cHdPKzZ1U0QxMlAv?=
 =?utf-8?B?MzlydGFzZEtDbWhjYm9EZlNDeEJNV0NZWkhuWHJJT2ZwOG5MUG9xWnpqT2R6?=
 =?utf-8?B?Z3Y1UFVCWUhFY21iTDc4UzJZY0VzR2N0VWxXMmJBaXhxaEtqek9tV00rMHpz?=
 =?utf-8?B?dlNnOHhhTzRBK1J1OW1sV05pT3FHQzVxRjlmR1JpNHhNUWQrd1RGdm0xVjh4?=
 =?utf-8?B?ampvMVFiU0JpVUJFcmpDMHZoUjEzUENrUDBzL2tkbmlSR29xdnF3VWJ5RnBp?=
 =?utf-8?B?Tm9ENURzWjFUWTZVdzhBeUxzSmlzS1FpR2VxRzdQMkJ1c3BQaVJ0ajNPZDVG?=
 =?utf-8?B?NmJ6MHdLN0tGWG43OXpDRVk5ZDM5T05VV0hieXVUbnVuZmtWQkNKTkRqbXhG?=
 =?utf-8?B?R2w1NVFCc3cvSHdBTkRuSzU3RkFUakUvV1BBSEI1ZmdnZTlETDRGQlluQXBy?=
 =?utf-8?B?OGl6Tm1KUnh5cjBjRUg5a1QxYnU1Y2tjTUcxUTJ5TUJ1MFBhTkY0Ny8wdm00?=
 =?utf-8?B?d285L3NvckVmSkRxKzZ3b0xGRXFvdjh1N3oxN2RHQTkzSjZpS0M4dGJnQ01i?=
 =?utf-8?B?TU55aFJRZDBsd3pJYnE4UGV4TEpvZ2g3cVZweHQxMUdnc3BNN3FKcUl3Tk9R?=
 =?utf-8?B?ZnI4TzBpL1JEMHcvbVkvYWk0Um5JV1ZaNU9NUjNWTGp6VEwyTXYyYVB5VVJ2?=
 =?utf-8?B?YjlFaGJIdmVBb25oRVEwSUFZVVJaa1YxTXZjZUNGV1NyNXFSdkVYRmU5b3N0?=
 =?utf-8?B?OU9vWFpFRDVPaVBEYldyUTQvYjBiZUNPUldhL0trVzJKT2M2Y0V5QzdocU4w?=
 =?utf-8?B?VTBmTGd0YkVIdHhqdWdtYTJ3Q0w2cTFKc3JmWXptY2txMjY0akNzRzlUWThs?=
 =?utf-8?B?WGEwTzcyeE01YnE1THhlaUFCK0hjNDEwRlhwckcwL092UE1QNGV1cXdkSHY4?=
 =?utf-8?B?LzBEYUhHVnNsSXI2Uk5kTktXaXpxeEJIaGdiendUTDFWR2NPaTl0KzNUdUtH?=
 =?utf-8?B?RjkrV0pvUVpJMVZRMFdxN2dZM1FrUUxFNDh3Sks2ZEprbnI1anp4b3grbXFX?=
 =?utf-8?B?VjhVdHZzS1ZTb2JQTDlsK2tITHpuNEdudFQ2SWxNOTdkWW96TGFYL3ZZcDB0?=
 =?utf-8?B?elJEUGZTYTNPUkpuTkc2emFtT2VBbXE3aXdlQ29IdmViS0VLYTM1VjNJbXNN?=
 =?utf-8?B?Vm9xU3RPUk5zUER2TmRnTGtsNG1vUUY1b1NXZ2hYZmV0OExoRnFadmtKTTNx?=
 =?utf-8?B?Nmp1U2J6SndyN25MVEp2MGpmOE4wUVJoUkJKMlNITmFYREc5K0tFRUQ0Nzc5?=
 =?utf-8?B?bUlOU29HSEdkRjZYYXpwUWRMZ0dFOXBpeGI5M0p5cjZFVGRNVjJSSXBycHlk?=
 =?utf-8?B?UEU4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3820920a-d931-49b2-4c28-08d8bca69841
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 18:18:17.9823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64gVmh0MR4g65pDXziPUdRxb+sFwbakPFyngs6+z0r9sUYF2epebOgmV6G20pgREXf/YdHsVZLTQ9dinDwiQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
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


On 1/19/21 1:08 PM, Daniel Vetter wrote:
> On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
> <Andrey.Grodzovsky@amd.com> wrote:
>>
>> On 1/19/21 9:16 AM, Daniel Vetter wrote:
>>> On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
>>>> Until now extracting a card either by physical extraction (e.g. eGPU with
>>>> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
>>>> would cause random crashes in user apps. The random crashes in apps were
>>>> mostly due to the app having mapped a device backed BO into its address
>>>> space was still trying to access the BO while the backing device was gone.
>>>> To answer this first problem Christian suggested to fix the handling of mapped
>>>> memory in the clients when the device goes away by forcibly unmap all buffers the
>>>> user processes has by clearing their respective VMAs mapping the device BOs.
>>>> Then when the VMAs try to fill in the page tables again we check in the fault
>>>> handlerif the device is removed and if so, return an error. This will generate a
>>>> SIGBUS to the application which can then cleanly terminate.This indeed was done
>>>> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
>>>> fact that while the app was terminating because of the SIGBUSit would trigger use
>>>> after free in the driver by calling to accesses device structures that were already
>>>> released from the pci remove sequence.This was handled by introducing a 'flush'
>>>> sequence during device removal were we wait for drm file reference to drop to 0
>>>> meaning all user clients directly using this device terminated.
>>>>
>>>> v2:
>>>> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
>>>> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
>>>> waiting for all user clients having CPU mapping of device BOs to die was dropped.
>>>> Instead as per the document suggestion the device structures are kept alive until
>>>> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
>>>> belonging to the device directly or by dma-buf import are rerouted to per user
>>>> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
>>>> since i am trying to get the minimal set of requirements that still give useful solution
>>>> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
>>>> test case is removing a secondary device, which is render only and is not involved
>>>> in KMS.
>>>>
>>>> v3:
>>>> More updates following comments from v2 such as removing loop to find DRM file when rerouting
>>>> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
>>>> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
>>>> On top of that added unplug support for the IOMMU enabled system.
>>>>
>>>> v4:
>>>> Drop last sysfs hack and use sysfs default attribute.
>>>> Guard against write accesses after device removal to avoid modifying released memory.
>>>> Update dummy pages handling to on demand allocation and release through drm managed framework.
>>>> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
>>>> of GPU recovery post device unplug
>>>> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
>>>>
>>>> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
>>>> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
>>>> with the primary card or soft reset the device without hangs or oopses
>>>>
>>>> TODOs for followup work:
>>>> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
>>>> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
>>>> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
>>>>
>>>> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AqqeqmhF%2BZ1%2BRwMgtpmfoW1gtEnLGxiy3U5OMm%2BBqk8%3D&amp;reserved=0
>>>> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oHHyRtTMTNQAnkzptG0B8%2FeeniU1z2DSca8L4yCYJcE%3D&amp;reserved=0
>>>> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=inKlV%2F5QIPw%2BhHvLM46X27%2Fcjr%2FXyhxmrC0xYXBhHuE%3D&amp;reserved=0
>>> btw have you tried this out with some of the igts we have? core_hotunplug
>>> is the one I'm thinking of. Might be worth to extend this for amdgpu
>>> specific stuff (like run some batches on it while hotunplugging).
>> No, I mostly used just running glxgears while testing which covers already
>> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
>> test suite
>>
>>
>>> Since there's so many corner cases we need to test here (shared dma-buf,
>>> shared dma_fence) I think it would make sense to have a shared testcase
>>> across drivers.
>>
>> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
>> and fences
>> use cases there or you mean I need to add them now ?
> We do have test infrastructure for all of that, but the hotunplug test
> doesn't have that yet I think.
>
>>> Only specific thing would be some hooks to keep the gpu
>>> busy in some fashion while we yank the driver.
>>
>> Do you mean like staring X and some active rendering on top (like glxgears)
>> automatically from within IGT ?
> Nope, igt is meant to be bare metal testing so you don't have to drag
> the entire winsys around (which in a wayland world, is not really good
> for driver testing anyway, since everything is different). We use this
> for our pre-merge ci for drm/i915.


So i keep it busy by X/glxgers which is manual operation. What you suggest
then is some client within IGT which opens the device and starts submitting jobs
(which is much like what libdrm amdgpu tests already do) ? And this
part is the amdgou specific code I just need to port from libdrm to here ?

Andrey


>
>>> But just to get it started
>>> you can throw in entirely amdgpu specific subtests and just share some of
>>> the test code.
>>> -Daniel
>>
>> Im general, I wasn't aware of this test suite and looks like it does what i test
>> among other stuff.
>> I will definitely  try to run with it although the rescan part will not work as
>> plugging
>> the device back is in my TODO list and not part of the scope for this patchset
>> and so I will
>> probably comment the re-scan section out while testing.
> amd gem has been using libdrm-amd thus far iirc, but for things like
> this I think it'd be worth to at least consider switching. Display
> team has already started to use some of the test and contribute stuff
> (I think the VRR testcase is from amd).
> -Daniel
>
>> Andrey
>>
>>
>>>> Andrey Grodzovsky (13):
>>>>     drm/ttm: Remap all page faults to per process dummy page.
>>>>     drm: Unamp the entire device address space on device unplug
>>>>     drm/ttm: Expose ttm_tt_unpopulate for driver use
>>>>     drm/sched: Cancel and flush all oustatdning jobs before finish.
>>>>     drm/amdgpu: Split amdgpu_device_fini into early and late
>>>>     drm/amdgpu: Add early fini callback
>>>>     drm/amdgpu: Register IOMMU topology notifier per device.
>>>>     drm/amdgpu: Fix a bunch of sdma code crash post device unplug
>>>>     drm/amdgpu: Remap all page faults to per process dummy page.
>>>>     dmr/amdgpu: Move some sysfs attrs creation to default_attr
>>>>     drm/amdgpu: Guard against write accesses after device removal
>>>>     drm/sched: Make timeout timer rearm conditional.
>>>>     drm/amdgpu: Prevent any job recoveries after device is unplugged.
>>>>
>>>> Luben Tuikov (1):
>>>>     drm/scheduler: Job timeout handler returns status
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
>>>>    drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
>>>>    drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
>>>>    drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
>>>>    drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
>>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
>>>>    drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
>>>>    drivers/gpu/drm/drm_drv.c                         |   3 +
>>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
>>>>    drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
>>>>    drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
>>>>    drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
>>>>    drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
>>>>    drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
>>>>    include/drm/gpu_scheduler.h                       |  17 ++-
>>>>    include/drm/ttm/ttm_bo_api.h                      |   2 +
>>>>    45 files changed, 583 insertions(+), 198 deletions(-)
>>>>
>>>> --
>>>> 2.7.4
>>>>
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
