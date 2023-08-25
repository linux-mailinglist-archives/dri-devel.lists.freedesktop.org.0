Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E690A788152
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 09:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B0C10E622;
	Fri, 25 Aug 2023 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB75710E622
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doNmN+nIpw4Ya37o/23dWzLH7/2d/nDLXOreSzefyPHYkh7iRz3v1hO1hcubP8aV4lZYFUTyuziggX0Zxu0SB3snbtIxIfF+0eZrdElJO4IridYKxkeBCivBELU8/w76/zxi5btZDv/pvXz4ppQgZgMd/tG+XkiqqSfH2YnXH1Z6ODkCA3JpL7t0VpW/na5H+dg4br7iCCkjplJZAeFxY2an7vF+OqYuvxk5oemK3xyCNUMRiq5dFW45J7GObYCxYu+xWiyzGC9cJJ2UKbJUnw/4SlLlC03wokTe2wpOVdabVfNng49aYZbv4Bde4y15zsodsz9E+sfrcPPX07dNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljr+/nIQcr41Gh9YfmXyXKB+kPQ7Q4Quv+nF5LnslEo=;
 b=O1IWzUVFmmEMkWQZjF0fqhOkcwcvnQ+bTihsVL1G+IXzW1RShcsoe8ivC0iLK4KA5vh15oLAvp2Ug6hpZTTaqlZgNo8C8Bg0XDsrGgl4jJXVlcG9vg8gug69rnsqTGTDVi38WbA0j4bf/tlNr4Q6iXPL034Op5+QtoDTfBvcujGb6yBctuAMBzfAAbGNNBRjt3V92CrQ/gH9nIb5hEXiDBv3PA8lMhJKMfTYLb6GF+D5xb9BWRE92ivvWiGedjtP7vs00oOALKZWInaYbnh9KYvR1gGkUjLJo771nVQm8P/svRx/1QALVPXNbW+gr2ncX6O/oA3fyOCGrFxHjm0rHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljr+/nIQcr41Gh9YfmXyXKB+kPQ7Q4Quv+nF5LnslEo=;
 b=NjcyamhdgVtY3xfElOlqekuLcWZyIrrNGjnVqGqFhDD9eQ2xhS5f9f9qryG52DKUDXt1jKK9q/E0M3NVZPPzEknL69HJ6BPMKyjE9KHplyM2zrXNT4SOQ5YgSFFpO4+HqoMuM2DbdzMtLh1pQCvh4vJheUoBmNVFDa7tm2aLpsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by PH0PR03MB6383.namprd03.prod.outlook.com (2603:10b6:510:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 07:56:27 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 07:56:27 +0000
Message-ID: <65432c20-a6fd-141c-2ced-a7e6599a1e7c@synaptics.com>
Date: Fri, 25 Aug 2023 15:56:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Content-Language: en-GB
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
 <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
 <20230825104052.4573ab7b@eldfell>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <20230825104052.4573ab7b@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|PH0PR03MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: ad59d3db-75e4-442d-a828-08dba540c919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8h95Rko70cOSXKKu7fLHvItiZPkQBF1PKcLYL0G51VmrHjKIYf1WJVy5hXr5TlbrPQgExt2E/U51SJkrtTb0ZPc4LRuLSIJl7fTuPQ7GGVRAcr5Sg9aRqTu64uBB7cAIrczMteTF2x9RiUSHcW/etJv56RWOPDV0EwL+lZK9o2IICxnTBE5aDEoHFABaRbqs6iIGzHrEVPpfdrUoY4BAAq8SH/BO0VS54cgvadOhHrpg32/tjLz9p6ICTLs4a18sFEHK2NXvx0iboeZQtvToNkI0xWTkHbEfUAio15MLMC06ZRGAoIl1Ic2TUjEbWEjdr5yCH2o1hxk2QaG3Ba4ayS3ocC4JjgXi6qhWNVRkPRuVPR8HfYJVC+SzHmgZgZPslKeBarb8MvJTD7QG55iti15BWWXWIHN90TJ9o48kQmXgQoHA+InSLh8upXnnZM1p2RyoS8Do9/5YZCub7UolivOpFiSf+3DVIVwUIFdNmUlWakIx+vXAxCTLbpoxR6deF4gDprnv6g2EKM8vQ6A5rXc97/wQRneU4dtDMALrIUEZoE03+fpuZUL14CSe2VtoUNoNZ0JBPZiF1iFZptFAkZrnP1JhWorvQk7/eYJ8mPpejcCSRQbpwJHuHZk+S5VFJ892wD7Ukm26Z874+fLL0cYq4ZvB25JvDlj5aY6NJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(39850400004)(396003)(451199024)(1800799009)(186009)(38100700002)(38350700002)(66899024)(8676002)(4326008)(8936002)(54906003)(31696002)(41300700001)(52116002)(6486002)(53546011)(6506007)(6666004)(316002)(36756003)(66476007)(66556008)(66946007)(6916009)(86362001)(6512007)(26005)(478600001)(7416002)(83380400001)(31686004)(2906002)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czQrZ1VmQUlNT0h0aHlHSElVLzIrbmNGRDNDcmI1ckxaVVZYUGM0S21nSVdP?=
 =?utf-8?B?RXhqODJKRENYajBxeHBKQVQzbmhLdm4rYk5PTHJnNUwwaFhkSDNxMXIxNldn?=
 =?utf-8?B?Ri9RUi9aVnl3bDhsVXV0VWRENjAxa0Znbi9oeEI5OTl4U3cyTG5VTThaY1hC?=
 =?utf-8?B?WmhvQzFLcDdqTEQrTkVEODZUT2tzTjcyeU82akI2K013UTBGd0ZTNlVjOTdX?=
 =?utf-8?B?RUdJQjRTYTNCSSszbytrTWNQOE1yUjczUm5Rdmdndm4zYzM3cjh4RHd0ZjhF?=
 =?utf-8?B?cXY0Y2pNbXZPZFN4OE9XMUpaZE9odzYvdnFKWDZEOGhlVlA4RTNEY2hSS3R0?=
 =?utf-8?B?cFJQMldJbUFFOVRxNWFrRVNqNWJTQ2w3OGJjQVBXeGhCeUh0enJVM2Z1S283?=
 =?utf-8?B?SXVYWmJTZVJ4OHYzZldzaTBUMXZVa05nRm84UHB5VDkxak81N01EWjFUWDdQ?=
 =?utf-8?B?OWFwbTNjb0JYODhHRTBMS3A1RUljS25yVjJyU0lBMkVUL2xNbnRuU0M0WkJi?=
 =?utf-8?B?d1pJMVY4WlBwcmtVc0lYRzhIdmUvMnZtTjlmbHhueXc4alpwQUlYazhkai9v?=
 =?utf-8?B?dHE0Qld2QkJWaHV5OFdUY0pYaU1GQnJGVEZteHpGdlQ5L3RqT1pXYXJ4VHpv?=
 =?utf-8?B?b3ljZ0JHNFppaDI5Z0xUYndVbk5uRklDT1ZTSUhwVmJkNWwyREJsS3FjUkJK?=
 =?utf-8?B?ZEtTQjFNOGtoQW5VbVkrUVpUYkxGdVJOZVhobGNyOTdPL2w5cDdXQXZvUDBI?=
 =?utf-8?B?SmhaZkd4dmhKcjQrZmtEUG9FV1hJSHlpeTlHS0Y4Q1NyQ3FsaXVzOXl0Wldu?=
 =?utf-8?B?cEtQYVlkY2pWbGlkTmwxSzV5WEhqYjhvblpna1BmakJDLy80U2N1M0ZLQlFK?=
 =?utf-8?B?M2x6OTVnejNmWlBKOG9qS2JkMnNVaURKU3VLOHhjYmNCZkM2bGRUcEJLY3R1?=
 =?utf-8?B?blJWZGl0UmQrRXJDV1lUeGFvMEtQOGdFZGE2N0o2UXg0RUo2YnF2TjBTb0Y3?=
 =?utf-8?B?NUV4UUYwSmtiaEw0UTBESG15MVlOc0dkVzlNNStDNmNWTmtWdnhiTForRENu?=
 =?utf-8?B?TnI3OVlBc2tPOVo2SzAxL2pITUw5MkRjR1FZRXVCS1BRU3lsRFVQUkd1Wis3?=
 =?utf-8?B?M1Q1Ty8wU3FaVnBRWnNHL0EyNVdkQ1BQKzlZa0tVWE5Xdm1XUUJMUWdweERa?=
 =?utf-8?B?NE5pVnl4N1ZwWUlFcFJITmcxamc3TDZHN2RHTytyYmlhTkl4aldhcXlSMHhv?=
 =?utf-8?B?WXZEdWZBYXRaSEVlKzBzcmJkd2FXY0NlUmFvT1ZTbVFTUnpneWYvbmo2Q1NM?=
 =?utf-8?B?aSt3M2Z6bTBCZ1ljTXgwYSsyekRMeTFOS3Robm9CdjBYNUZ5eE52MjFtK003?=
 =?utf-8?B?OUc3WXdnQlVIeWx4S0lIbkhRd0cxN2VneGhjNDJxMkRYZ21kM1Fld2Y5NmRk?=
 =?utf-8?B?cElOU3hwM2RpVVdtQ2hFa0gwaURwTjlBandxYm9vMUlsRVgzY1dKU2VFNWJB?=
 =?utf-8?B?Zk5TcDRiNXJlK3NtcnFkK04wcEdURld2RlM2TEx4ZGpxTlA4ZS9MWS9aRVMv?=
 =?utf-8?B?SlVRWUZnT2hxbXB5SmpQNXg4czIvVFJwK3hKWFMzWi9UQkZLZUZJSVVyZFdI?=
 =?utf-8?B?OWZZaXMzNlRVK1VkUExZbzlUU2M1c2tYOEV4QW5xYkVLNmNTdVNoNnM5bTMw?=
 =?utf-8?B?MmJwT0Jkb0l1YUR2aWVpeExmSUhTWndJQ0ZEVm9VZmVPbm55dCtjeHJ3WCtG?=
 =?utf-8?B?SEZWOFFkOG5xZWFkaCtwQ2RaZkd5L3JEODM5UzVnZXNiZlBYQXQvU2xEQjAy?=
 =?utf-8?B?cnBKK2htMnBLN1BRY3ZxOEdXTVN1Ky9UTUlobGFTUU5ZeWNuYmVTc3RTMzlE?=
 =?utf-8?B?L1RVUHdkOUQ1M3B4MUx6TTFNY1Q1L3pKbnpaTTR3Ukh5UHFKbnRkUGFsWDd1?=
 =?utf-8?B?cTc3YjRpM0pQRHlJeS9mM3cwRlg2a3YxRWhLUnBwWHNvdnV0SDdtN2EzRDM3?=
 =?utf-8?B?ekFnZTAxdS9yNU5Cdkhkdjcwd0dFWTV2azF6WlUvL0ljaytnekthd2U5eEp5?=
 =?utf-8?B?aENwR3lCTVliazd4L2lOZ3lwQksrZy9uVkMxSnhTejJtWHNncW0rTEdwMnpG?=
 =?utf-8?Q?WXnH4paLAMY2H/VhgpT3Ea4VC?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad59d3db-75e4-442d-a828-08dba540c919
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 07:56:27.4356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8ksU+GSSTOT1+qiL9cOWh/Q/A5zc4FTn7EVfsAkobM648jU1Ychnn5qZwNuBZQ/AUQMqiTmkvMs1dJvl1x7Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6383
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/23 15:40, Pekka Paalanen wrote:
> Subject:
> Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
> From:
> Pekka Paalanen <ppaalanen@gmail.com>
> Date:
> 8/25/23, 15:40
> 
> To:
> Hsia-Jun Li <Randy.Li@synaptics.com>
> CC:
> Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org, 
> dri-devel@lists.freedesktop.org, Linux Media Mailing List 
> <linux-media@vger.kernel.org>, hughd@google.com, 
> akpm@linux-foundation.org, Simon Ser <contact@emersion.fr>, Hans Verkuil 
> <hverkuil-cisco@xs4all.nl>, daniels@collabora.com, ayaka 
> <ayaka@soulik.info>, linux-kernel@vger.kernel.org, Nicolas Dufresne 
> <nicolas@ndufresne.ca>
> 
> 
> On Wed, 23 Aug 2023 15:11:23 +0800
> Hsia-Jun Li<Randy.Li@synaptics.com>  wrote:
> 
>> On 8/23/23 12:46, Tomasz Figa wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> Hi Hsia-Jun,
>>>
>>> On Tue, Aug 22, 2023 at 8:14 PM Hsia-Jun Li<Randy.Li@synaptics.com>  wrote:
>>>> Hello
>>>>
>>>> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major
>>>> purpose of that is sharing metadata or just a pure container for cross
>>>> drivers.
>>>>
>>>> We need to exchange some sort of metadata between drivers, likes dynamic
>>>> HDR data between video4linux2 and DRM.
>>> If the metadata isn't too big, would it be enough to just have the
>>> kernel copy_from_user() to a kernel buffer in the ioctl code?
>>>    
>>>> Or the graphics frame buffer is
>>>> too complex to be described with plain plane's DMA-buf fd.
>>>> An issue between DRM and V4L2 is that DRM could only support 4 planes
>>>> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
>>>> interface to support that 4 more planes which would lead to revision of
>>>> many standard likes Vulkan, EGL.
>>> Could you explain how a shmem buffer could be used to support frame
>>> buffers with more than 4 planes?
>>> If you are asking why we need this:
>> 1. metadata likes dynamic HDR tone data
>> 2. DRM also challenges with this problem, let me quote what sima said:
>> "another trick that we iirc used for afbc is that sometimes the planes
>> have a fixed layout
>> like nv12
>> and so logically it's multiple planes, but you only need one plane slot
>> to describe the buffer
>> since I think afbc had the "we need more than 4 planes" issue too"
>>
>> Unfortunately, there are vendor pixel formats are not fixed layout.
>>
>> 3. Secure(REE, trusted video piepline) info.
>>
>> For how to assign such metadata data.
>> In case with a drm fb_id, it is simple, we just add a drm plane property
>> for it. The V4L2 interface is not flexible, we could only leave into
>> CAPTURE request_fd as a control.
>>>> Also, there is no reason to consume a device's memory for the content
>>>> that device can't read it, or wasting an entry of IOMMU for such data.
>>> That's right, but DMA-buf doesn't really imply any of those. DMA-buf
>>> is just a kernel object with some backing memory. It's up to the
>>> allocator to decide how the backing memory is allocated and up to the
>>> importer on whether it would be mapped into an IOMMU.
>>>    
>> I just want to say it can't be allocated at the same place which was for
>> those DMA bufs(graphics or compressed bitstream).
>> This also could be answer for your first question, if we place this kind
>> of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try
>> to prepare it, which could map it into IOMMU.
>>
>>>> Usually, such a metadata would be the value should be written to a
>>>> hardware's registers, a 4KiB page would be 1024 items of 32 bits registers.
>>>>
>>>> Still, I have some problems with SHMEM:
>>>> 1. I don't want the userspace modify the context of the SHMEM allocated
>>>> by the kernel, is there a way to do so?
>>> This is generally impossible without doing any of the two:
>>> 1) copying the contents to an internal buffer not accessible to the
>>> userspace, OR
>>> 2) modifying any of the buffer mappings to read-only
>>>
>>> 2) can actually be more costly than 1) (depending on the architecture,
>>> data size, etc.), so we shouldn't just discard the option of a simple
>>> copy_from_user() in the ioctl.
>>>    
>> I don't want the userspace access it at all. So that won't be a problem.
> Hi,
> 
> if userspace cannot access things like an image's HDR metadata, then it
> will be impossible for userspace to program KMS to have the correct
> color pipeline, or to send intended HDR metadata to a video sink.
> 
> You cannot leave userspace out of HDR metadata handling, because quite
> probably the V4L2 buffer is not the only thing on screen. That means
> there must composition of multiple sources with different image
> properties and metadata, which means it is no longer obvious what HDR
> metadata should be sent to the video sink.
> 
> Even if it is a TV-like application rather than a windowed desktop, you
> will still have other contents to composite: OSD (volume indicators,
> channels indicators, program guide, ...), sub-titles, channel logos,
> notifications... These components ideally should not change their
> appearance arbitrarily with the main program content and metadata
> changes. Either the metadata sent to the video sink is kept static and
> the main program adapted on the fly, or main program metadata is sent
> to the video sink and the additional content is adapted on the fly.
> 
> There is only one set of HDR metadata and one composited image that can
> be sent to a video sink, so both must be chosen and produced correctly
> at the source side. This cannot be done automatically inside KMS kernel
> drivers.
> 
There may be some misunderstanding.
Let suppose this HDR data is in a vendor specific format.
Both upstream(decoder) and downstream(DRM) hardware devices are coming 
from the same vendor.
Then we just need to delivery the reference to this metadata buffer from 
the upstream to downstream, both of drivers know how to handle it.

Despite the userspace, we just need to extend a wayland protocol that 
making wayland compositor know how to receive the reference to the 
metadata and set it to the DRM plane.

If you want a common HDR formats for all HDR variants(HDR10+, DV), I am 
not against it. But it won't make the userspace be able to fill the HDR 
metadata even the HDR data comes from the bitstream(likes SEI). We must 
consider the case of Secure Video Path(Digital Right), the bitstream is 
not accessible from (REE) userspace nor linux kernel, the downstream 
must take what the upstream feed.
> 
> Thanks,
> pq
> 
>>>> 2. Should I create a helper function for installing the SHMEM file as a fd?
>>> We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
>>> so maybe that would be enough?
>>>
>>> [1]https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/udmabuf.c
>>>    
>> It is the kernel driver that allocate this buffer. For example, v4l2
>> CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
>> Or GBM give you a fd which is assigned with a surface.
>>
>> So we need a kernel interface.
>>> Best,
>>> Tomasz
>>>    
>>>> --
>>>> Hsia-Jun(Randy) Li
> 

-- 
Hsia-Jun(Randy) Li
