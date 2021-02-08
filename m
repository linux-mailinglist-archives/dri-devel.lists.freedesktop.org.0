Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89348314292
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 23:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F46EA08;
	Mon,  8 Feb 2021 22:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C666EA07;
 Mon,  8 Feb 2021 22:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S68x/3EJ4ItQOBgf0xTW+6/0TNBLm17gpUIx2KgmnufaCr2UrIlU3UTemZFzdEWOgDhjVB3MXiYcJnaa8l2nN4QgqtAnBL2cTtEXhRjmW4UyMVoB7lNfF1pw9pvjjYL3VODK92B9UvcVSLxPLZhD9cOQFbI9FO94lJRIt2Aj3UKd+ZyxbABg2jGeG1tyCcMSBvGO+CMaxe3MSgw9NhNya+YWUROtOCFKFyesqL2hZ8Hw6DwAwImPSqlrrwiRFpzPLVM4rHdFbRVEWeZFJe8vxocdGFWRTaBRxzqsCnljLoME2Ow5Ttnstyw6dWUzBfX5sLh8QANaKd8hGc1zHJA0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bw8Ep5MCKkDwXIU96ouSfFPtVo+lZSGR71MSyQPx9o=;
 b=kyxQTJaShJfNa5gig/d0OTDCnO2tcqXEiJ2VqZQWGUT84m5sUa/kTIjFffq33VV0FPYtOC1i4oaZ/W3mhC60iwAoFvS2Qiqz5YrZkgSD5fnzwcEdZ8HbY/WZF0+27huUpsN3bfEB71E6o1B+s7NjyIoyoPScmKbaL1aOW18alKeut1+aS0YB/M8nE/WzHJcjCW/M+tasUUWB3PUPaJ81b8STBqPPftzqbi1NnTq8SBEWvu56QVqzhEdB2tS442yQ6+K177UWGHLYfgvhBdO6TDz24+/f+4Ou5JKqsa/bZpKsmLkLaETiBD5Atg4Iuh1B2D0Zz1nztPAgO0In2eYqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bw8Ep5MCKkDwXIU96ouSfFPtVo+lZSGR71MSyQPx9o=;
 b=ao8hN8tpSGs5uTZOmuIw/8pxNTt31/N3I6kxF7WxCHILO/E/i6kpmGAMTTP7DRv55EZYSrWnImtLXwtA/wqgCdX87dYqKn7jL+DcS2or5Podogw4Dugwurd/Hh9oK3qFMWrJ977LL2qWcpSiR6Zcqq9EzCfv9mwFAGethaB2J4o=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2704.namprd12.prod.outlook.com (2603:10b6:805:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Mon, 8 Feb
 2021 22:09:31 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:09:30 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: christian.koenig@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com>
Date: Mon, 8 Feb 2021 17:09:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:407a:7c93:58dc:3018]
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:407a:7c93:58dc:3018]
 (2607:fea8:3edf:49b0:407a:7c93:58dc:3018) by
 YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 22:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78cb3ae2-16ac-427d-0f6a-08d8cc7e354a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2704:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB270477C02546F272EDB4D149EA8F9@SN6PR12MB2704.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjwdTWxemUVKNnOGGH3RTKVtlHpOvZlESWi6p0aI7XTAe1AfsRfIPpD4lXFRjPVhQn/Ac4+jkK4NVmns4rkEZT0S+7xf9A5GxZnF4TjqTgWZCsEOIqssLI7J2XIyjV7ZmPpyU2rfyBNUVTiaLOrrQGUCcAKy8TLpY4FVkWEwmGutJPkWUWufPEy1dynDU6z02H8KdKyTNjlEDCcTXKLbvKv7tPR4CItvKWfCT9Yu3H8w0JrIefrGH7N9+BNOvXK8Ak8JdnVICwKAKOkjvV3fdYRILg2z0f/eZbpw1eSXk1c4wHbBsKP/One2i62HCAj0+6mx3K5a6NHL71m+t1SgUKIk9QzEsDTjGgXgP6tLwoZlRGjm5x6oTdEeK3hlxF3+XPdK/XiOryHzPsyJUQTUCUFuWCH0lLrSlTgybKI9HhrbswMAPbasdV6XkAVLLpSLeoVaakSj/u7DDa13dgn9MSd3HDm6BwrbogUPnIDQGlAJAxU+D1eEfq/lWmy/HxzGQwtxAj1hPeRQYP93X6I24g+qsM8GW2DHwqYOnxU6NCmVD3iHY6lW9TN8oW93+aB0s4sTEFg/g2au/Jv947gHxRKKIy8iZ+PyeftrMWt6RbSEZdJiblbpFisScaMjziU4V2IW42X+JgBxNsek2PsixcFxKQQH6iYLu+GZc0Q9sjFAgJN2lSqzcw3DqpuDyRLq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(66556008)(54906003)(31686004)(66946007)(316002)(66476007)(2616005)(66574015)(52116002)(86362001)(2906002)(8936002)(33964004)(186003)(966005)(6916009)(4326008)(478600001)(83380400001)(53546011)(31696002)(16526019)(166002)(36756003)(5660300002)(8676002)(45080400002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXdQMFRYUU5MNGZaaVNvRmFUU0RhMWxJOTFTSm1oZG1GZFRRa29qbVZ6Qnh3?=
 =?utf-8?B?Sm5semtXR3JLamJNbk84WG10dWxSdk1oRHJDczU1dDZmSXFBV3FhV2pBcTlu?=
 =?utf-8?B?UFoxZXBGNnVOVE9tZlZFU29SQW1PcWI5b3FGVThkQkt6eHZ0anFHcUd4dU1U?=
 =?utf-8?B?ZFJWL1ZiWUxZZUxYOGVIYWp6ZmpFMlZEK2d1cEFFL1V0TEZJS3F6S0VtMFJl?=
 =?utf-8?B?aTVUKzBEL3JGVUxuUit4dnF5clJVMzlxcmhGbURYKzFObGFIOHRDN2NnczAy?=
 =?utf-8?B?WEV5T2tjUTl2dU5iNUx0NlB6MW5pV3F1Vm1nUVpMc093eDJoenVab2M2RytO?=
 =?utf-8?B?R1B0Y0ZVS3Q0L1V5YWh3NzU2Rlk2cWVKc2dkdTlWSW00MmhHSHg0WS96T1Bv?=
 =?utf-8?B?VVpVR1F3NHFqQ21YM1gzK0NnVjA0TThGTm9jQXNrclZNeDZjWlVtRThBZU5V?=
 =?utf-8?B?RWtFdVZkeEhteEl6cWxzc0pweHIzV2p5TE0vY0tvM3EvUWM4cnN3T2NnOFZJ?=
 =?utf-8?B?MTl6Z1FESjQxbGlKR2lCVEQ4VksxMU1JbEgrbG5Xc3NBeWs1amNncjIrbmMz?=
 =?utf-8?B?ZmhNUHpZeUVxcG5WcUJtZTN0ZUpmRE5INEpHL3VsaFd0cGtRRG51dzFJSUc1?=
 =?utf-8?B?SHpJWnIveDNCajQ2SXIrNjBZZTVVUzJsYXJBME9pdDZMdEw5cmdUUTVUSUZu?=
 =?utf-8?B?TmNCZTJLTi9tZW45eTgwSTUzSUNMakMyVUpJNTRsTTd5dW5raDlENTM3Wkxa?=
 =?utf-8?B?aUpsejRMT1RXcHBENzdKRTZ1c0pEbVR2aTZ3N3Z5QklXbzRTTlJ6SEpSUUM0?=
 =?utf-8?B?a0NMZ09nbDVUT2lXVmszaUtZdXR5ZGptdnZhQVlwY0pQcEVwQWE5OUpGMCsw?=
 =?utf-8?B?dkMrZWlSUEV3VWdMZjl2VWdrL3NycWkwNFpWNkRJY0doaDF4RWRjRDBrYm9h?=
 =?utf-8?B?dnNDaFI0aU0vRTdFY0dnZDh1RllDZ2M2ak9abWlWVWtja0EvUE9aVmxzSFRv?=
 =?utf-8?B?QjlwREE4VGlhR25rdjYrd0dVM2FjQlhIbDk4TVEwVy9ObVgxWEk0MnJncUJn?=
 =?utf-8?B?ZUF2bWE3NjhJbGErR2ZXVTlueGEySXRGbzZsZ3hYaFRwa2JPclpsTTU5NHR1?=
 =?utf-8?B?YStGcXVBSGZTY082bmU3eUV5ZlpiMDhORDdYTFdHdWFFUzUxMC9ra2k5azVr?=
 =?utf-8?B?OCttWTFqajhrOFIwbHREQkVPOVpjbDFRNGMwWXpUVFcrZ0lJYjZKL0JWN2R4?=
 =?utf-8?B?RCszUFk0UE12T2pmTHNFOVh5Q0VZOXR0d1NCWHpIZGx6YUlSM3F4UkRBZHNH?=
 =?utf-8?B?RHh6bnUzR2FVcHZrRG9iYWw5V3VJNWQza20zcTFReFBwVkRtSHJQZU5YeVhz?=
 =?utf-8?B?L1ZUZUxRK2Y1Z2dYL2RyT0V5bWsxTzBuQkFJSllBcE5PbHZXSjk1Y2JERFhr?=
 =?utf-8?B?L3dNcGJqdWQzVnRUZXRiZUExSkQ3SkN0NzdrTHd1cVpRTkRJdTFPRVlHZnd1?=
 =?utf-8?B?TytBK1REVlBrRyswWXJtajNobTRGb1RLam9QbTk1Q2dTenBsQnoyRjZzZVhT?=
 =?utf-8?B?M2sxZGhZdWJmRk9oQlZ2Y2N4YmlJYnhXc2Rxb1lnVzVKYlNybEFVQTY2R1lF?=
 =?utf-8?B?ZXhmL3ZqSDBtUlQxSUxiOGdjRU94L3FHK1M5dEhOd0kvcTNhd1dMc2wvRGN3?=
 =?utf-8?B?M01YTzBYOHV1SnBjUXQ1Q1NIR3hhY3ViTjNBTi9wQnQyMHFBd2ZpM1A0TUFE?=
 =?utf-8?B?R2hWREpWQ09YUTk5Q29qZWF5NE03aHVsUzE4QWg4d3dIVUxmZW53dFM2UzNy?=
 =?utf-8?B?dnpLTmRtcmNCRWNNM28wcUJFdms4Q0pFQXo1ZDFxbldBdUxvSG9mV0x1WmQw?=
 =?utf-8?Q?iS3LF3gl9DEkL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cb3ae2-16ac-427d-0f6a-08d8cc7e354a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 22:09:30.8075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGgUL8L4503hWslc1XCR0OYNVGIESFg0C6PFP+MkoOQpiyL1QF0Xa59Mikprcl6S4eCIZcpyl6y+MWpqt2VdHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2704
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: multipart/mixed; boundary="===============0759497718=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0759497718==
Content-Type: multipart/alternative;
 boundary="------------4B82DE5418361EFCBD5C5DB5"
Content-Language: en-US

--------------4B82DE5418361EFCBD5C5DB5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/8/21 4:37 AM, Christian König wrote:
> Am 07.02.21 um 22:50 schrieb Daniel Vetter:
>> [SNIP]
>>> Clarification - as far as I know there are no page fault handlers for kernel
>>> mappings. And we are talking about kernel mappings here, right ?  If there were
>>> I could solve all those issues the same as I do for user mappings, by
>>> invalidating all existing mappings in the kernel (both kmaps and ioreamps)and
>>> insert dummy zero or ~0 filled page instead.
>>> Also, I assume forcefully remapping the IO BAR to ~0 filled page would involve
>>> ioremap API and it's not something that I think can be easily done according to
>>> am answer i got to a related topic a few weeks ago
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;reserved=0 
>>> (that was the only reply
>>> i got)
>> mmiotrace can, but only for debug, and only on x86 platforms:
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;reserved=0 
>>
>>
>> Should be feasible (but maybe not worth the effort) to extend this to
>> support fake unplug.
>
> Mhm, interesting idea you guys brought up here.
>
> We don't need a page fault for this to work, all we need to do is to insert 
> dummy PTEs into the kernels page table at the place where previously the MMIO 
> mapping has been.


But that exactly what Mathew from linux-mm says is not a trivial thing to do, quote:

"

ioremap() is done through the vmalloc space.  It would, in theory, be
possible to reprogram the page tables used for vmalloc to point to your
magic page.  I don't think we have such a mechanism today, and there are
lots of problems with things like TLB flushes.  It's probably going to
be harder than you think.
"

If you believe it's actually doable then it would be useful not only for simulating device
unplugged situation with all MMIOs returning 0xff... but for actual handling of driver accesses
to MMIO after device is gone and, we could then drop entirely this patch as there would be no need
to guard against such accesses post device unplug.

  

>
>>>> But ugh ...
>>>>
>>>> Otoh validating an entire driver like amdgpu without such a trick
>>>> against 0xff reads is practically impossible. So maybe you need to add
>>>> this as one of the tasks here?
>>> Or I could just for validation purposes return ~0 from all reg reads in the 
>>> code
>>> and ignore writes if drm_dev_unplugged, this could already easily validate a 
>>> big
>>> portion of the code flow under such scenario.
>> Hm yeah if your really wrap them all, that should work too. Since
>> iommappings have __iomem pointer type, as long as amdgpu is sparse
>> warning free, should be doable to guarantee this.
>
> Problem is that ~0 is not always a valid register value.
>
> You would need to audit every register read that it doesn't use the returned 
> value blindly as index or similar. That is quite a bit of work.


But ~0 is the value that will be returned for every read post device unplug, 
regardless if it's valid or not, and we have to cope with
it then, no ?

Andrey


>
> Regards,
> Christian.
>
>> -Daniel
>>
>>> Andrey
>>>
>

--------------4B82DE5418361EFCBD5C5DB5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/8/21 4:37 AM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com">Am
      07.02.21 um 22:50 schrieb Daniel Vetter:
      <br>
      <blockquote type="cite">[SNIP]
        <br>
        <blockquote type="cite">Clarification - as far as I know there
          are no page fault handlers for kernel
          <br>
          mappings. And we are talking about kernel mappings here, right
          ?&nbsp; If there were
          <br>
          I could solve all those issues the same as I do for user
          mappings, by
          <br>
          invalidating all existing mappings in the kernel (both kmaps
          and ioreamps)and
          <br>
          insert dummy zero or ~0 filled page instead.
          <br>
          Also, I assume forcefully remapping the IO BAR to ~0 filled
          page would involve
          <br>
          ioremap API and it's not something that I think can be easily
          done according to
          <br>
          am answer i got to a related topic a few weeks ago
          <br>
<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;amp;reserved=0</a>
          (that was the only reply
          <br>
          i got)
          <br>
        </blockquote>
        mmiotrace can, but only for debug, and only on x86 platforms:
        <br>
        <br>
<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;amp;reserved=0</a>
        <br>
        <br>
        Should be feasible (but maybe not worth the effort) to extend
        this to
        <br>
        support fake unplug.
        <br>
      </blockquote>
      <br>
      Mhm, interesting idea you guys brought up here.
      <br>
      <br>
      We don't need a page fault for this to work, all we need to do is
      to insert dummy PTEs into the kernels page table at the place
      where previously the MMIO mapping has been.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>But that exactly what Mathew from linux-mm says is not a trivial
      thing to do, quote:</p>
    <p>&quot;</p>
    <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">ioremap() is done through the vmalloc space.  It would, in theory, be
possible to reprogram the page tables used for vmalloc to point to your
magic page.  I don't think we have such a mechanism today, and there are
lots of problems with things like TLB flushes.  It's probably going to
be harder than you think.
&quot;

If you believe it's actually doable then it would be useful not only for simulating device
unplugged situation with all MMIOs returning 0xff... but for actual handling of driver accesses
to MMIO after device is gone and, we could then drop entirely this patch as there would be no need
to guard against such accesses post device unplug.

&nbsp;
</pre>
    <blockquote type="cite" cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com">
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">But ugh ...
            <br>
            <br>
            Otoh validating an entire driver like amdgpu without such a
            trick
            <br>
            against 0xff reads is practically impossible. So maybe you
            need to add
            <br>
            this as one of the tasks here?
            <br>
          </blockquote>
          Or I could just for validation purposes return ~0 from all reg
          reads in the code
          <br>
          and ignore writes if drm_dev_unplugged, this could already
          easily validate a big
          <br>
          portion of the code flow under such scenario.
          <br>
        </blockquote>
        Hm yeah if your really wrap them all, that should work too.
        Since
        <br>
        iommappings have __iomem pointer type, as long as amdgpu is
        sparse
        <br>
        warning free, should be doable to guarantee this.
        <br>
      </blockquote>
      <br>
      Problem is that ~0 is not always a valid register value.
      <br>
      <br>
      You would need to audit every register read that it doesn't use
      the returned value blindly as index or similar. That is quite a
      bit of work.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>But ~0 is the value that will be returned for every read post
      device unplug, regardless if it's valid or not, and we have to
      cope with<br>
      it then, no ?</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com">
      <br>
      Regards,
      <br>
      Christian.
      <br>
      <br>
      <blockquote type="cite">-Daniel
        <br>
        <br>
        <blockquote type="cite">Andrey
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------4B82DE5418361EFCBD5C5DB5--

--===============0759497718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0759497718==--
