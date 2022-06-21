Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3B5531DE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBC10EC72;
	Tue, 21 Jun 2022 12:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22EF10E6A6;
 Tue, 21 Jun 2022 12:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYXgJMpvCJGAhFHQaYm0ctHZi4+IjdROkwIXt2guD1twctPAZWwtmKev4lgAIdVKQfbDcszV20izubS40Y0uyfuEUNSLNUj8/C6M8i0+HWXMKAAkzr10kzg/CxnpPfhCpMdZsmMc6Vj267Z6XVyYC1ibi/jSQ0QXveNW+rn1Ij+l9+9c+6hZyTwHOcSUXJq9sFiz5BhzdRZiSvVAFBtxrec8m0wfJ95RZ8E4YEXh+Ta9+cgIEXmlK4tH4OT70DidU3DnS+dDN042glkaPlIjtEIc+9lllvzUSlx2B1R9PDv8YZakWpmDvGsf4YRRzLW95Ru3Lc6F3mlfDpHdZG9ISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzjo9WWahPWj7dbLAEfKVjclQ7hPzg65h7aVRecl+gY=;
 b=Knlf5qFhN9J3R57hhwuhdrWVndGZ5kdpRNt/9knmwblVlIHY0xWSnO+8MPRZd6WA2jaUDBqpVA5HKxMo/lFprTB025eoiubuZkTZYMBRZi+wttN04p9WMhNj+8eBq8Y9vxrJyyXZ9FTCviIiB4xvDMvDHRHj3aLMPUpgySGnE8Qr1Fk7kSQBmxFyaJUlFd6HUH5wpqsb9TzKxIuotpOk7jI5dODDechAUrAzenAYJBFgVz1lvtqF2FXnCHHZXBlPohpj4P4gdSg6B7qTE6PiMwz1FImRYL8yb9tyJyxfqZjWda3z9nUCb5mvo44BAFYq85QCPwdFYSz/rvLGC7ixqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzjo9WWahPWj7dbLAEfKVjclQ7hPzg65h7aVRecl+gY=;
 b=s5Yk7eFCxFr6iyM9IixUVtj8KMaCXuCD+e3kxQoMuXaZlFbylwqPpKSlrmLqvRH3D9nESaMRwMbLt051D+D5HBPybUvwmsvYX8CkfSsATmylc5b+9gteJ8wi9EVjOjFxyP3l6/88/fnYJeyPQgmW33c7Cc3SFs7VvLpRB1NJeu3nEsLZxCjcrJ35y2/ziJqeBtUszL54KgBzvTGcVJ1FUekF0NZBXuX12ojXOMyKsLL16zHy3NgO8qPXlLDBCoxBVnYQ4XCys+axuVNoyJrT+owuRUHC0wfJzPOgTP2rvPeywXp7H7KE/vQJpTeeZMJerqHdjDxL2KOmVKzOqyV7wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by CH2PR12MB3926.namprd12.prod.outlook.com (2603:10b6:610:27::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Tue, 21 Jun
 2022 12:22:10 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::2cb7:9d5b:fea7:16bf]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::2cb7:9d5b:fea7:16bf%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 12:22:10 +0000
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Date: Tue, 21 Jun 2022 21:55:24 +1000
In-reply-to: <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
Message-ID: <87letq6wb5.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b52ee809-458b-45b6-76e6-08da5380aa36
X-MS-TrafficTypeDiagnostic: CH2PR12MB3926:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB392656535E8DA306BC6F9DA6DFB39@CH2PR12MB3926.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWJIdjcV/A8H+cyk0VXEvi+5Wlohdb//+l3U/FOa3kbzAinFWH3qnCp8t971qWNH+GuShSmx58IEif6706faOT19UrEykCyKnCQnXjihp56snLaMWGWuLeiU/kt7vgIVb/OIAeJcQKgKR7wieaESvW7TQnxaDas/wnbW23e5QGGgakwrz0wE7n4kYVi/XyPWUwKiuBiKQyW308Uy9UKQcYqTCMKLrxXbR/8MswKhLSYdY+WN89yzTu2uATclXPrlMr1H2F5QQAjKMnLNaKfa6ZXkmJFwJ4kW14xq1VawaQ5bzrI4KrvhmBDDSPyr8KICjBI3M93ocGNCXi7gqCouAP2OjD+/GV2aJdYH3Ow8zLsJKAapV5dL0uHo59cXQWj906wa4HghgB6V/2ihSxA3Mlcm6y04xaXxQvFBxAmUy1ogHdWLYPEHG/hcEvvE7HIXxmnwbMB0pwc/G1qAUYWLaTM/qBI9Q1ZUQ51uIyy8HGdgbxd0dvFme+U+M4few610ZRhZIja6ny9QRUz4nFkp5m+JeCQFuMBZ5cHNMeXQobNt+/LmIu3jGPFEgl0JD+ysfYKsVVOM96Kf3BS4IBCr5Q2vVcvQcBO+Zbc+r6yDf7LA0BT/2KqI2iyEBi3OQudxVRwvtOmmuOdiWLfSYF64YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3179.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(38100700002)(41300700001)(9686003)(54906003)(83380400001)(86362001)(26005)(6512007)(186003)(53546011)(66476007)(7416002)(6486002)(5660300002)(66556008)(4326008)(6506007)(8936002)(2906002)(8676002)(6916009)(316002)(66946007)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dfxDo+cuQ0bl0ZBdSpnKMq2xFmD5qM3ROj/t10hPJDVHdDUY8ctCoJm6lwS9?=
 =?us-ascii?Q?jXjPJrtHTpjXvfz4XnvRJiQjtdKbuemM10p9VDeh2lWGNOSuS4EqkbaVzyP/?=
 =?us-ascii?Q?CR5308Vchg2fSTS/94MFD5iknunvBySbft2iWtNlJfj6L4ix53uEWhkoMnrx?=
 =?us-ascii?Q?wmkNvY+DimwQTccGq8oswVD6faELZmid6qe/8QZMBbdzo60/V+lox6uhXKnD?=
 =?us-ascii?Q?YdUvko6iMNtQ3fScipO+PFMF0Nvgffg/Vjgyv9NrQmNy8oUzxwd1E0GheIRH?=
 =?us-ascii?Q?/AOrBx9nqeBSfdxs2hpblf7nwyI43y5gRuI+R3YJdqyYuhJ/FQNFDHw9Frl1?=
 =?us-ascii?Q?gUKai5gvpAwM59L7bShgkzSgeHgsXcMNviPLPKUL3TxYbAT+cA89siamHhEo?=
 =?us-ascii?Q?kHgmj1P+dEkEqrEBQHjKHZw6MS5ZPQu5qPRkwsYFNQXjuwbj2QunliK85Dpa?=
 =?us-ascii?Q?3i54aU0Bpo0j0PwsIsDsnusJuJ16TwBo9T1RAePNeWI51aOjV0KaLfVHKhnu?=
 =?us-ascii?Q?EcqqjBL63ulGEqMU5r1x2ph+pMFIjSPYaZ1btW+TLFc9lz/bdPQwKakwrlyV?=
 =?us-ascii?Q?Kp04DRnP2jRuxo9va7DuOWN7qQ16pu7hxT+JOhpIGxdU4iO7WYFcJZzLaxMH?=
 =?us-ascii?Q?3DU0031hBjvFUcpdEy08+xVrw72X5EIrqz/w6G5jyldRc2teZa9BwrOoN2iP?=
 =?us-ascii?Q?oy++Agq1JC50DPaM1zaNSgcMVQLDJ30mvtfl/q9BlKnVP+TboiYJQtuUscjs?=
 =?us-ascii?Q?raMaoSaKRwz665512vLZgFCnFfYJ4E8k1lDU77JHRKjr2Z42eMRomPNskxYW?=
 =?us-ascii?Q?3k8vb9FbXXHy6/kLAPDGp9JhOzqdtvaDqYdBIRjM/dx3cM0K0PgsV1O3A7Re?=
 =?us-ascii?Q?0FmiH50Z0OVqq7H+ZTspYVJk9/KH1vhF/DVkI8gdH1PQN2W3IVGZYDFAypAm?=
 =?us-ascii?Q?P6XkQ2TLIMRE0kzHfZuAhjJG766NFiz8qhuBTUs2yqNb4w4sMed+RXhai0fc?=
 =?us-ascii?Q?w/DmI24JTpVV9xmDzkoAzQu7KkqV99OKpapw/YPOaFYg9aoOa5L/jx4rUGHI?=
 =?us-ascii?Q?/nbb4L7dAL+mSvunQBLEq59AcBApsy/iAsAOXtTk6ByeUVl+N3j663kTm7SW?=
 =?us-ascii?Q?PWr2VRWueoSMeMMdhOjK6eFaKR09Ok4hcnEzWY1jOjtU9R7hae3DVmBoYN0A?=
 =?us-ascii?Q?filYw6KdTX3BlPf2S63/CGs5MbhRdoy8A7Qyzvlc0iI3ypSVTssfBXFvNwXM?=
 =?us-ascii?Q?DF4S1EjQYVNWVKsKh5OkIJCKnVIBOQt0mJ8hs7HigI5AC2CaUbzi4UQ3a1jl?=
 =?us-ascii?Q?b7zjtz8QgahF5Q6HYLBd7AlDgt+dWWe0Ku1wNpvbLcU7s2zcNJ72JqB7swK3?=
 =?us-ascii?Q?VHPkwKE0kUPrHEV4mc8UKskv41z1t6142GopPs7WaUXM+BfAgTAu2ismZJCr?=
 =?us-ascii?Q?jfrvclwW/TD44MFvJoYBHakR3Ta+uuzomS3S7x51+nzNbcBSWCkytE3qo0tL?=
 =?us-ascii?Q?EqNN46xPukESBhTz+867FGqC8xhSFHfpUG0/gNFjqcYsc2lKKMsvfIqhMIyL?=
 =?us-ascii?Q?Vjfl2Riodp2u+jZ0BqQ1rxgSbPQMbXBEdRQxjqtEP0qZvj47AjbSKZb8ZU79?=
 =?us-ascii?Q?JwhcUIFU+KsJUvFwT2dU2ZJF3Zl+gr62G4XvWMwl2q8NvvFVc5TLfz2ImzW+?=
 =?us-ascii?Q?I8oEg0StR7ptrLd6L0r/1v2Z21Y8cGvsRPMC5wXd2FEFJndFYuF2TR2bUjUf?=
 =?us-ascii?Q?ICGJEwPhiQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52ee809-458b-45b6-76e6-08da5380aa36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 12:22:10.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62IuDvf91zLsAfsJzcGFUQR5izN34O2KHNQAynCbHq2ER9o6ajbfJrLupgFPFI2DhhmyNut5OxL6DyVTWQArCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3926
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
Cc: "Sierra Guiza, Alejandro
 \(Alex\)" <alex.sierra@amd.com>, rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 21.06.22 13:25, Felix Kuehling wrote:
>>
>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>> evicted.
>>>>>>>>
>>>>>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>>>>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>          removed is_dev_private_or_coherent_page]
>>>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>>>>> ---
>>>>>>>>     include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>     mm/memcontrol.c          |  7 ++++---
>>>>>>>>     mm/memory-failure.c      |  8 ++++++--
>>>>>>>>     mm/memremap.c            | 10 ++++++++++
>>>>>>>>     mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>     mm/rmap.c                |  5 +++--
>>>>>>>>     6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>      * A more complete discussion of unaddressable memory may be found in
>>>>>>>>      * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>      *
>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>
>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>> + *
>>>>>>>>      * MEMORY_DEVICE_FS_DAX:
>>>>>>>>      * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>      * coherent and supports page pinning. In support of coordinating page
>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>     enum memory_type {
>>>>>>>>     	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>     	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>     	MEMORY_DEVICE_FS_DAX,
>>>>>>>>     	MEMORY_DEVICE_GENERIC,
>>>>>>>>     	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>
>>>>>>>
>>>>>>> However, where exactly is pinning forbidden?
>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>> memory manager owning the
>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>> is allowed on this device type.
>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>> Device coherent type pages should return true here, as they are pinnable
>>>> pages.
>>> That function is only called for long-term pinnings in try_grab_folio().
>>>
>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>> As far as I understand this return NULL for long term pin pages.
>>>> Otherwise they get refcount incremented.
>>> I don't follow.
>>>
>>> You're saying
>>>
>>> a) folio_is_pinnable() returns true for device coherent pages
>>>
>>> and that
>>>
>>> b) device coherent pages don't get long-term pinned
>>>
>>>
>>> Yet, the code says
>>>
>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>> {
>>> 	if (flags & FOLL_GET)
>>> 		return try_get_folio(page, refs);
>>> 	else if (flags & FOLL_PIN) {
>>> 		struct folio *folio;
>>>
>>> 		/*
>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>> 		 * right zone, so fail and let the caller fall back to the slow
>>> 		 * path.
>>> 		 */
>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>> 			     !is_pinnable_page(page)))
>>> 			return NULL;
>>> 		...
>>> 		return folio;
>>> 	}
>>> }
>>>
>>>
>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>
>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>> pages returned by __get_user_pages_locked that cannot be long-term
>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>> long-term pinned will be migrated afterwards, and
>> __get_user_pages_locked will be retried. The migration of
>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>
> Thanks.
>
> __gup_longterm_locked()->check_and_migrate_movable_pages()
>
> Which checks folio_is_pinnable() and doesn't do anything if set.
>
> Sorry to be dense here, but I don't see how what's stated in this patch
> works without adjusting folio_is_pinnable().

Ugh, I think you might be right about try_grab_folio().

We didn't update folio_is_pinnable() to include device coherent pages
because device coherent pages are pinnable. It is really just
FOLL_LONGTERM that we want to prevent here.

For normal PUP that is done by my change in
check_and_migrate_movable_pages() which migrates pages being pinned with
FOLL_LONGTERM. But I think I incorrectly assumed we would take the
pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
So I think the check in try_grab_folio() needs to be:

 		if (unlikely((flags & FOLL_LONGTERM) &&
 			     (!is_pinnable_page(page) || is_device_coherent_page(page))))

 - Alistair
