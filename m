Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A8312A53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 06:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94986E2E6;
	Mon,  8 Feb 2021 05:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A296E1B4;
 Mon,  8 Feb 2021 05:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Etm4EJh3stXRl5zrv1oDuN8RjQJLVleZrfWrlvwhyXSUT5nyEZrz/k7GRupebdbYYQI7My1ou2le6NS8X/tvN4lVzHLw1I7y/wld7xi4EB1FfiRZoPtRNKMp3rN4+28uSM+VGiXVec62/bbheDcMosvzKmcZg+06WKbcLbwmUI+oXVciWtU5DmOaTamhMafTdaksM5byEsPuDQLqH2egZlsTHVD6M0dQOVOnNBmXeuMoVoR2hUWvwSvVcCPXFpcvsfxDvOuiJjRECBtkGjgm2mjUqNvje/f7zIAsjIn64R3ucDXqUm2cB4DbzMJ5FCLgypGwLYJMhb4wtoC3Dp6GCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8OLCu/woKVM4UaXDljFjUiT828n9uzTcmptU8XdWCg=;
 b=i0FzDjASIdFvvRZ72etmiigIHjo9DChQhajXTG4whA7TgGdEn5wVuu3n5bJqlSxyU9GUdAV+S84wtqNVqPv6M0Q7QQNRXDSOpmcO7qrPMTaA9qWJWFhTjaZSe9818kb+xM5wqpflAaEaV3vdMMWUFGUTeNGgaeC+yeGQHiyIHBJ/y0ffJ7vyQtY5HqDas2HQEOl+VDiQ+m9ppAvjdphGXpQ/7U2ULXj3Lhe1aT7ZXcx6EnuQMIq0cjBbRWB/j/+TFzdhCXqFL7po2C3hsebpgZGKdmE+fff/5aPC2tnn4rG3g+OY07kKVQ5AWu0poEV32TD6ziTpGm1DvPvn8P/5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8OLCu/woKVM4UaXDljFjUiT828n9uzTcmptU8XdWCg=;
 b=LbQGKxpegL2Jaoy9SZFpyotjx66KejP2LJGX/2azbBDjSnA39ZBpFVS4/90OFgGa5I8FnLtf97Bm3SsED8+QXgOqrmhCoanBNniXku/n7ZHvLLHG0ZAi/49xZ3TdKX+TFC0BxXTVW4hj9i/iSxxTDr3LzRTJzQ7mOfpgrLOKBSE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 05:59:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 05:59:13 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
Date: Mon, 8 Feb 2021 00:59:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------A24A183B701815BF2A683AC3"
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54]
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54]
 (2607:fea8:3edf:49b0:3561:3f9a:2ce2:2c54) by
 YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 05:59:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d20c9eb4-efd4-481d-627c-08d8cbf6a927
X-MS-TrafficTypeDiagnostic: SA0PR12MB4397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4397FA58939AABECF4114BB6EA8F9@SA0PR12MB4397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkqDc1zOj5TXyivK+WJ3jXneTRQQIoGQDtQSVJNs+A0Io7kNLLrSC7DhTTVLL5T0OlXf8gBygAWa05iGWZWQqPQx/8yqX+xk1YyJl2bymr0q32Uii8HbzHT4CJZuNPzOySkDHwywhZOHlWjH5/5LGCu/IhjXkmt5uAGKLX/h+FuDK3HSH4nsJEmdZY9MbGXv0JFdMzcvp2rk2e8onNJbTmH15YCzY7CwMrNfKhGMhOMKGrQXlXmKOfouQkkcblt673APQiN4McXmsKoZtfh3OT23iFeDgbYxKaQTQ8gz3uUQXOsCh7Q+dNeZirReyyrKrTGsnJPHL0nAWKdJVf7Bc0tjuLZrX4l+eSFPnn6RQ+sC+F1Vr1TEojYQwrdFjFV+e50m95wvTbv3JtALEeo5tMSRZN+uSGgZrRYGIdbL387p80tLcFw0ku9MvrmQxIJIk+HC2BMp9TlaFGLKlsnuI4ILLlyVExKyfJNt9RhxTynPz61TvgSi2HY1rv3BS5GzfcbKU+3K7LTuYDmFSTfP7rWM1QHMuqgZlSK9NSobX1iqlCssMYlroEjRsnfgte8wIm6nwoh4oz4kwhB+K8blz4VO8Soq+cB5Xd4gWEtfmzPI1j14ZOvPFsU7oDTDoU0xOJVq0FZJPVES3dYYDNuHILw+A2asnuijPAnzuebjWkfopHNPjMiAe5/7UVv8YRy/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(7416002)(8936002)(235185007)(316002)(30864003)(4326008)(31696002)(5660300002)(186003)(53546011)(6486002)(66476007)(83380400001)(66556008)(66616009)(86362001)(16526019)(66946007)(33964004)(36756003)(2906002)(31686004)(54906003)(478600001)(45080400002)(966005)(2616005)(8676002)(6916009)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czUrdFczOWxuZTVNaTM4bjBiM1FvRE9aa0JuY0xiYnp4OGo1b3ZSYm1BV0Uv?=
 =?utf-8?B?ZlprUTJIeDRWY0NueXBkRkxmY0gvdnhaZ0RyR1ZJU0ZYdUFqVlJoWXIwenJk?=
 =?utf-8?B?NDFwZ05NWHJpS2NRa3lhZFppdzlBZ29nS29zekRwWVB6V3BzUDZkWGsrbjVr?=
 =?utf-8?B?NC9NVERmdU1waTRPRVh6cklQNWt0T3p1RDAxZ1dFT2dGNVJ0M28xVzRuVSt0?=
 =?utf-8?B?WUZPRTNPOHlpVGNwZFBlSGMvQ1VRaVlEZnNTUTNyZlptcnJpeWR3Mm55M2F1?=
 =?utf-8?B?L085YjgrTVp6V2FYOUpBaVhSSTdwUkxiN3VFM2pZR09OYTFFTHMwazIwUm44?=
 =?utf-8?B?Ung1TU9oeldpZnJHZjlxWVEyZVFnMGdxYnp1MHI4Z2hmMWpKSG5WU29QZGRZ?=
 =?utf-8?B?YUw4OEo1cTJjZ0dWOGh4ZHE1aDQ0eWpCWndFclAwNktJdHY2Y0lKOWRNQzBF?=
 =?utf-8?B?VzM4U0liR1hXZERhSGthdEMzRG9Kb0IvVTFNeDZEakxvbGFucmVGb2UrRTgx?=
 =?utf-8?B?UWZHOXFaMXlaR3pSbWIvaS9rWXFLNDBoR3lDRzN3MDI4d0tCaW8yUnBDNGc4?=
 =?utf-8?B?dldpcytLcVpYRGpXOUtuZTVoQlhIeDk0bXNFWUZyQjcxQlJlVXZEN1N4a24r?=
 =?utf-8?B?VW5ZTWdKeWVqZldUYW5ZbHhMR2F6RGkvTy9BWVI1SGhjRU1laWdwOEJkN2Jr?=
 =?utf-8?B?OEdoYUdXNTQxdmtJK3hhNklTaE91NWZkMVNCazZIWUpQU2dJdDRnSVpYSlpv?=
 =?utf-8?B?MThXYUUrbGFNTnB1azUyQnpIM1lDbzR3U3NUUUIrVzhTNUgzZStLZUp4N2or?=
 =?utf-8?B?VXZ4cWcrK0FJN2NDR2JRZ05YbW5TcDhKQU52WUhvTlR1b0c5eXJGNnJOQjdC?=
 =?utf-8?B?dW4zbzlLODZzbU5VcEJNNk5rMHJXZ2dacUtCa0RxSEFQMWVYbTZqUTEwclRh?=
 =?utf-8?B?TWpYOTY0cG9pangxdzdJMTRmWkRZQlI0anhDNWxJbDdZOWpuVGFGakNxR3d2?=
 =?utf-8?B?bnJQYlJJRDVzdXBSTEpIR1A0M3pIUlMwbHhlN0JvNVJhOG1rK3FhZFo3RFhL?=
 =?utf-8?B?TmZHYm90TDRWTjZodHJOL0xMbDFSQ1E4L2JYNjJGbjFIN2tQQ2NyN0lBb1BU?=
 =?utf-8?B?Q3Q2VlJKbys0RWVaZUpyakNiU2RjaE1CUW5mV3ZQV3U1MXBRYW0yTXl3dWNs?=
 =?utf-8?B?WEFwRE1vaThIYVVNMjlMRVVjM09CMTRZc0lLM3ZzY0NmUEtsdEdjRUVjNHl1?=
 =?utf-8?B?QjA3TlN6Ym4vb3BuYjFaSk1aSE1MZmZUV1pyeVJzdXErN1BwdWpDMDcxQ1Fl?=
 =?utf-8?B?bk5HVFZMbHlTMEJORmdDaGNueWZZSGE2Y01ELzUyQVVKN2dvUVZoWE5HeVA5?=
 =?utf-8?B?K2YwZ3puV1dqazAxcSswVzVoelJrWlVteUZjR2h4bEk3UVNDdnFwMTMwWGNr?=
 =?utf-8?B?TG9FcVR3bUQvRFl1czk0S1lOV3JZbUFJWkdHK2ZKODNQdWUyUElqL0p4NnFm?=
 =?utf-8?B?RmtQdG80TVQzL0VyYU5yT0p5MEUzeW5hM0NNNjUrYkswSEJwN002R2YvRFRx?=
 =?utf-8?B?OXNscS9idjEzQlNVTTdQV3B4amNEVWJpeWZuejZTM3BwQ2pRU0VlMUxMbEdD?=
 =?utf-8?B?MStSNzJUdjlrc1JLN2dXTXYrMlNuaEd1aFRQL2dsQnU3WUZlQmNUMkNpa3FC?=
 =?utf-8?B?cTV4UXhidlNmNlUxUGxXbGlHc2pNdDJsRFNvamI2dnY1aWF6Y3UyVTJRTWow?=
 =?utf-8?B?MG1kYkNpOHhwTUpnejZIL0tBRjBMcXdMeTFaTGpxV2s0Y21BYTgwODRKTDVV?=
 =?utf-8?B?SFBobXhuUXRpaWhBRkRoemw1WGY3MXVHUFp2T0NrM0xhcEpObDRadkRIRFVw?=
 =?utf-8?Q?btaCjl7rHxXVU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20c9eb4-efd4-481d-627c-08d8cbf6a927
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 05:59:13.5567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6tZ6ugy9KiolJLPjME6TUBp5mZNj6/To8/tL6O5rrRtVw4R49sQxtHhBeXTiaf/+VVZToaaxajO+bpBWNlnDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------A24A183B701815BF2A683AC3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/20/21 10:59 AM, Daniel Vetter wrote:
> On Wed, Jan 20, 2021 at 3:20 PM Andrey Grodzovsky
> <Andrey.Grodzovsky@amd.com> wrote:
>>
>> On 1/20/21 4:05 AM, Daniel Vetter wrote:
>>> On Tue, Jan 19, 2021 at 01:18:15PM -0500, Andrey Grodzovsky wrote:
>>>> On 1/19/21 1:08 PM, Daniel Vetter wrote:
>>>>> On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
>>>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>>>> On 1/19/21 9:16 AM, Daniel Vetter wrote:
>>>>>>> On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
>>>>>>>> Until now extracting a card either by physical extraction (e.g. eGPU with
>>>>>>>> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
>>>>>>>> would cause random crashes in user apps. The random crashes in apps were
>>>>>>>> mostly due to the app having mapped a device backed BO into its address
>>>>>>>> space was still trying to access the BO while the backing device was gone.
>>>>>>>> To answer this first problem Christian suggested to fix the handling of mapped
>>>>>>>> memory in the clients when the device goes away by forcibly unmap all buffers the
>>>>>>>> user processes has by clearing their respective VMAs mapping the device BOs.
>>>>>>>> Then when the VMAs try to fill in the page tables again we check in the fault
>>>>>>>> handlerif the device is removed and if so, return an error. This will generate a
>>>>>>>> SIGBUS to the application which can then cleanly terminate.This indeed was done
>>>>>>>> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
>>>>>>>> fact that while the app was terminating because of the SIGBUSit would trigger use
>>>>>>>> after free in the driver by calling to accesses device structures that were already
>>>>>>>> released from the pci remove sequence.This was handled by introducing a 'flush'
>>>>>>>> sequence during device removal were we wait for drm file reference to drop to 0
>>>>>>>> meaning all user clients directly using this device terminated.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
>>>>>>>> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
>>>>>>>> waiting for all user clients having CPU mapping of device BOs to die was dropped.
>>>>>>>> Instead as per the document suggestion the device structures are kept alive until
>>>>>>>> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
>>>>>>>> belonging to the device directly or by dma-buf import are rerouted to per user
>>>>>>>> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
>>>>>>>> since i am trying to get the minimal set of requirements that still give useful solution
>>>>>>>> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
>>>>>>>> test case is removing a secondary device, which is render only and is not involved
>>>>>>>> in KMS.
>>>>>>>>
>>>>>>>> v3:
>>>>>>>> More updates following comments from v2 such as removing loop to find DRM file when rerouting
>>>>>>>> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
>>>>>>>> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
>>>>>>>> On top of that added unplug support for the IOMMU enabled system.
>>>>>>>>
>>>>>>>> v4:
>>>>>>>> Drop last sysfs hack and use sysfs default attribute.
>>>>>>>> Guard against write accesses after device removal to avoid modifying released memory.
>>>>>>>> Update dummy pages handling to on demand allocation and release through drm managed framework.
>>>>>>>> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
>>>>>>>> of GPU recovery post device unplug
>>>>>>>> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
>>>>>>>>
>>>>>>>> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
>>>>>>>> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
>>>>>>>> with the primary card or soft reset the device without hangs or oopses
>>>>>>>>
>>>>>>>> TODOs for followup work:
>>>>>>>> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
>>>>>>>> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
>>>>>>>> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
>>>>>>>>
>>>>>>>> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072067767%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fjgP9YubHCrILFxWmpVGSmurTJHkWw%2Bv4okyjSNsPxE%3D&amp;reserved=0
>>>>>>>> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072067767%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=11PYyAhOjLDEiNNho8WaMB%2FLkA5AuxK6g9XpbNiPIec%3D&amp;reserved=0
>>>>>>>> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072077759%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=q%2F%2FXDKm9LOgw9mq4Ts4JoHR8Ysd8KmoM0NGLD98MsFw%3D&amp;reserved=0
>>>>>>> btw have you tried this out with some of the igts we have? core_hotunplug
>>>>>>> is the one I'm thinking of. Might be worth to extend this for amdgpu
>>>>>>> specific stuff (like run some batches on it while hotunplugging).
>>>>>> No, I mostly used just running glxgears while testing which covers already
>>>>>> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
>>>>>> test suite
>>>>>>
>>>>>>
>>>>>>> Since there's so many corner cases we need to test here (shared dma-buf,
>>>>>>> shared dma_fence) I think it would make sense to have a shared testcase
>>>>>>> across drivers.
>>>>>> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
>>>>>> and fences
>>>>>> use cases there or you mean I need to add them now ?
>>>>> We do have test infrastructure for all of that, but the hotunplug test
>>>>> doesn't have that yet I think.
>>>>>
>>>>>>> Only specific thing would be some hooks to keep the gpu
>>>>>>> busy in some fashion while we yank the driver.
>>>>>> Do you mean like staring X and some active rendering on top (like glxgears)
>>>>>> automatically from within IGT ?
>>>>> Nope, igt is meant to be bare metal testing so you don't have to drag
>>>>> the entire winsys around (which in a wayland world, is not really good
>>>>> for driver testing anyway, since everything is different). We use this
>>>>> for our pre-merge ci for drm/i915.
>>>> So i keep it busy by X/glxgers which is manual operation. What you suggest
>>>> then is some client within IGT which opens the device and starts submitting jobs
>>>> (which is much like what libdrm amdgpu tests already do) ? And this
>>>> part is the amdgou specific code I just need to port from libdrm to here ?
>>> Yup. For i915 tests we have an entire library already for small workloads,
>>> including some that just spin forever (useful for reset testing and could
>>> also come handy for unload testing).
>>> -Daniel
>>
>> Does it mean I would have to drag in the entire infrastructure code from
>> within libdrm amdgpu code that allows for command submissions through
>> our IOCTLs ?
> No it's perfectly fine to use libdrm in igt tests, we do that too. I
> just mean we have some additional helpers to submit specific workloads
> for intel gpu, like rendercpy to move data with the 3d engine (just
> using copy engines only isn't good enough sometimes for testing), or
> the special hanging batchbuffers we use for reset testing, or in
> general for having precise control over race conditions and things
> like that.
>
> One thing that was somewhat annoying for i915 but shouldn't be a
> problem for amdgpu is that igt builds on intel. So we have stub
> functions for libdrm-intel, since libdrm-intel doesn't build on arm.
> Shouldn't be a problem for you.
> -Daniel


Tested with igt hot-unplug test. Passed unbind_rebind, unplug-rescan, 
hot-unbind-rebind and hotunplug-rescan
if disabling the rescan part as I don't support plug-back for now. Also added 
command submission for amdgpu.
Attached a draft of submitting workload while unbinding the driver or simulating
detach. Catched 2 issues with unpug if command submission in flight  during 
unplug -
(unsignaled fence causing a hang in amdgpu_cs_sync and hitting a BUG_ON in 
gfx_v9_0_ring_emit_patch_cond_exec whic is expected i guess).
Guess glxgears command submissions is at a much slower rate so this was missed.
Is that what you meant for this test ?

Andrey


>
>
>> Andrey
>>
>>>> Andrey
>>>>
>>>>
>>>>>>> But just to get it started
>>>>>>> you can throw in entirely amdgpu specific subtests and just share some of
>>>>>>> the test code.
>>>>>>> -Daniel
>>>>>> Im general, I wasn't aware of this test suite and looks like it does what i test
>>>>>> among other stuff.
>>>>>> I will definitely  try to run with it although the rescan part will not work as
>>>>>> plugging
>>>>>> the device back is in my TODO list and not part of the scope for this patchset
>>>>>> and so I will
>>>>>> probably comment the re-scan section out while testing.
>>>>> amd gem has been using libdrm-amd thus far iirc, but for things like
>>>>> this I think it'd be worth to at least consider switching. Display
>>>>> team has already started to use some of the test and contribute stuff
>>>>> (I think the VRR testcase is from amd).
>>>>> -Daniel
>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>> Andrey Grodzovsky (13):
>>>>>>>>       drm/ttm: Remap all page faults to per process dummy page.
>>>>>>>>       drm: Unamp the entire device address space on device unplug
>>>>>>>>       drm/ttm: Expose ttm_tt_unpopulate for driver use
>>>>>>>>       drm/sched: Cancel and flush all oustatdning jobs before finish.
>>>>>>>>       drm/amdgpu: Split amdgpu_device_fini into early and late
>>>>>>>>       drm/amdgpu: Add early fini callback
>>>>>>>>       drm/amdgpu: Register IOMMU topology notifier per device.
>>>>>>>>       drm/amdgpu: Fix a bunch of sdma code crash post device unplug
>>>>>>>>       drm/amdgpu: Remap all page faults to per process dummy page.
>>>>>>>>       dmr/amdgpu: Move some sysfs attrs creation to default_attr
>>>>>>>>       drm/amdgpu: Guard against write accesses after device removal
>>>>>>>>       drm/sched: Make timeout timer rearm conditional.
>>>>>>>>       drm/amdgpu: Prevent any job recoveries after device is unplugged.
>>>>>>>>
>>>>>>>> Luben Tuikov (1):
>>>>>>>>       drm/scheduler: Job timeout handler returns status
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
>>>>>>>>      drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
>>>>>>>>      drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
>>>>>>>>      drivers/gpu/drm/drm_drv.c                         |   3 +
>>>>>>>>      drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
>>>>>>>>      drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
>>>>>>>>      drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
>>>>>>>>      drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
>>>>>>>>      drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
>>>>>>>>      include/drm/gpu_scheduler.h                       |  17 ++-
>>>>>>>>      include/drm/ttm/ttm_bo_api.h                      |   2 +
>>>>>>>>      45 files changed, 583 insertions(+), 198 deletions(-)
>>>>>>>>
>>>>>>>> --
>>>>>>>> 2.7.4
>>>>>>>>
>
>

--------------A24A183B701815BF2A683AC3
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-DAFT-Add-amdgpu-command-submission-while-unplug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-DAFT-Add-amdgpu-command-submission-while-unplug.patch"

From af658ef6b7e5b044d2566104137ee1cb34e52c59 Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Mon, 8 Feb 2021 00:41:28 -0500
Subject: DAFT: Add amdgpu command submission while unplug.

---
 tests/core_hotunplug.c | 218 ++++++++++++++++++++++++++++++++++++++++++++++++-
 tests/meson.build      |   2 +-
 2 files changed, 216 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e7d2a44..5a4dcb4 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -52,6 +52,190 @@ struct hotunplug {
 	bool need_healthcheck;
 };
 
+/* amdgpu specific code */
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <pthread.h>
+
+#define GFX_COMPUTE_NOP  0xffff1000
+
+
+static bool do_cs;
+
+static int
+amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t flags,
+			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
+			amdgpu_va_handle *va_handle)
+{
+	struct amdgpu_bo_alloc_request request = {
+		.alloc_size = size,
+		.phys_alignment = alignment,
+		.preferred_heap = heap,
+		.flags = flags,
+	};
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle handle;
+	uint64_t vmc_addr;
+	int r;
+
+	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(dev,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  &handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_MAP);
+	if (r)
+		goto error_va_map;
+
+	r = amdgpu_bo_cpu_map(buf_handle, cpu);
+	if (r)
+		goto error_cpu_map;
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+	*va_handle = handle;
+
+	return 0;
+
+error_cpu_map:
+	amdgpu_bo_cpu_unmap(buf_handle);
+
+error_va_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+
+error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
+static void
+amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+			 uint64_t mc_addr, uint64_t size)
+{
+	amdgpu_bo_cpu_unmap(bo);
+	amdgpu_bo_va_op(bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
+	amdgpu_va_range_free(va_handle);
+	amdgpu_bo_free(bo);
+}
+
+static void amdgpu_cs_sync(amdgpu_context_handle context,
+			   unsigned int ip_type,
+			   int ring,
+			   unsigned int seqno)
+{
+	struct amdgpu_cs_fence fence = {
+		.context = context,
+		.ip_type = ip_type,
+		.ring = ring,
+		.fence = seqno,
+	};
+	uint32_t expired;
+	int err;
+
+	err = amdgpu_cs_query_fence_status(&fence,
+					   AMDGPU_TIMEOUT_INFINITE,
+					   0, &expired);
+}
+
+static void *amdgpu_nop_cs(void *p)
+{
+	int fd = *(int *)p;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	uint32_t *ptr;
+	int i, r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	uint32_t major, minor;
+	amdgpu_device_handle device;
+	amdgpu_context_handle context;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+
+
+	r = amdgpu_device_initialize(fd, &major, &minor, &device);
+	igt_require(r == 0);
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	ptr = ib_result_cpu;
+	for (i = 0; i < 16; ++i)
+		ptr[i] = GFX_COMPUTE_NOP;
+
+	r = amdgpu_bo_list_create(device, 1, &ib_result_handle, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = 16;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+
+	while (do_cs)
+		amdgpu_cs_submit(context, 0, &ibs_request, 1);
+
+	amdgpu_cs_sync(context, AMDGPU_HW_IP_GFX, 0, ibs_request.seq_no);
+
+	amdgpu_bo_list_destroy(bo_list);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+
+	amdgpu_cs_ctx_free(context);
+	amdgpu_device_deinitialize(device);
+
+	return (void *)0;
+}
+
+static pthread_t* amdgpu_create_cs_thread(int *fd)
+{
+	int r;
+	pthread_t *thread = malloc(sizeof(*thread));
+
+	do_cs = true;
+
+	r = pthread_create(thread, NULL, amdgpu_nop_cs, (void *)fd);
+	igt_assert_eq(r, 0);
+
+	/* Give thread enough time to start*/
+	usleep(100000);
+	return thread;
+}
+
+static void amdgpu_destroy_cs_thread(pthread_t *thread)
+{
+	void *status;
+
+	do_cs = false;
+
+	pthread_join(*thread, &status);
+	igt_assert(status == 0);
+
+	free(thread);
+}
+
+

@@ -455,15 +645,26 @@ static void unplug_rescan(struct hotunplug *priv)
 
 static void hotunbind_rebind(struct hotunplug *priv)
 {
+	pthread_t *thread = NULL;
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
+	if (is_amdgpu_device(priv->fd.drm))
+		thread = amdgpu_create_cs_thread(&priv->fd.drm);
+
 	driver_unbind(priv, "hot ", 0);
 
+	if (thread)
+		amdgpu_destroy_cs_thread(thread);
+
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
 	driver_bind(priv, 0);
 
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
@@ -471,15 +672,25 @@ static void hotunbind_rebind(struct hotunplug *priv)
 
 static void hotunplug_rescan(struct hotunplug *priv)
 {
+	pthread_t *thread = NULL;
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
+	if (is_amdgpu_device(priv->fd.drm))
+		thread = amdgpu_create_cs_thread(&priv->fd.drm);
+
 	device_unplug(priv, "hot ", 0);
 
+	if (thread)
+		amdgpu_destroy_cs_thread(thread);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);

 	bus_rescan(priv, 0);
 
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
@@ -543,6 +754,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
diff --git a/tests/meson.build b/tests/meson.build
index 825e018..1de6cc5 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -243,7 +243,7 @@ i915_progs = [
 	'sysfs_timeslice_duration',
 ]
 
-test_deps = [ igt_deps ]
+test_deps = [ igt_deps + [ libdrm_amdgpu ] ]
 
 if libdrm_nouveau.found()
 	test_progs += [
-- 
2.7.4


--------------A24A183B701815BF2A683AC3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------A24A183B701815BF2A683AC3--
