Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74293551340
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 10:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10C310E61B;
	Mon, 20 Jun 2022 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC0110E62E;
 Mon, 20 Jun 2022 08:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNltK0/Tnde4A9wCe56AJXe+nUj7VeFlgKc0agysGYvc5s4rU6zJ1Drncx2QgutaONX4LEKD4Qh/470fBdXn6pSUDhrcSeDAT5k39w7kgHngz9pakQcbaCGwMv5RtXOtih2JruUeimpBX7+d/Xbg18xsI+CepR0PvVjkZ6thS1mvCl3TOVE0zknfQJmUlDTSeBu4gLYOOuAFXBGGUNVQfP5RZVLmeT27qcc0vPSdFOuYExqA2p8dJZKkuqApdOgxG9HgdzTqxW9or3HyFKjjv5LZWxg6KRJrv45NpLa50uI3y0CL9xPdn8kUk8yxwW+0KIjOXitbNl4Ew0ecpcEBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81WqArI7pQXTZHPxWHpQ8Boejp6LJGYiQEHbQajNcdA=;
 b=Q6ykvYRGvyhut/2JpLsPZEbsDL3zDaSOlC7IlRJyXZK2+el10uHhEHDqTcL8HHzaSEkeV3Icgi7z8h4c5AR3vpcbmAy0wt1+QLovEMMN9jBwXjKLZfaIoVmrHnqw1Nh1p31Vq/cHiPYHCxPdNdkOK32WRh9vGCkDaCwLWCQmpz0Kmq82jf3J1yBCTa5II8gp4DZwBEbK7uOeBw77pLnhSrAGsWDul9JBQhOwTgDw/A6hFxqzQgUcefmcfWuQ3YvKfmbOM7OSeSiQq4olWcX5A+9GOu95EXFarPVdWI6VI5lBTq0PelOXDnyXuR79b6tNcIEnLiLwM50b+ckeKSXA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81WqArI7pQXTZHPxWHpQ8Boejp6LJGYiQEHbQajNcdA=;
 b=PCd6iDcHBp4m+IPBxc1FLcQrY323AHPOwwQqT6YUBMX1wIYKNYGY0+yp9RIiaNyeGMRnHDLwJ6A22rmU+CELOd02/DGqG35PqCPLVH1tC2hGmTU+CE9ni1tkxedMcR1Q7A1eCpsWpb8LBNDqioJXcvDylbkXi7WR2wnPKPKo9Wk1Ltdj3GQjiMQTQoI9DbJ6D+qLUCYjoRI0QZ/rreE/c4f36lNhE42GfCul8bhEXONBUiKs9tAzX8ZS5bLWPrwcNr5ni44L5XdIqg3vj7YW+OpoWFxnV5SnC2VghNe9+FBNgekIGJK5fCT6YtzxKLB0GAR5O5qYJXPDOO3JGQuJEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB2922.namprd12.prod.outlook.com (2603:10b6:5:18d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 08:50:04 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 08:50:03 +0000
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
 <87bkuo898d.fsf@nvdebian.thelocal>
 <CAFCwf11Lru4rHJ93gkCTMqfsWZ8Hcug4z=_t7B=G07bo7zsaFw@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Date: Mon, 20 Jun 2022 18:13:26 +1000
In-reply-to: <CAFCwf11Lru4rHJ93gkCTMqfsWZ8Hcug4z=_t7B=G07bo7zsaFw@mail.gmail.com>
Message-ID: <877d5b90sp.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 495e4bae-adc6-411d-9eed-08da5299dd72
X-MS-TrafficTypeDiagnostic: DM6PR12MB2922:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB29229351C73AE39B87069350DFB09@DM6PR12MB2922.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0HOSoJtTEAGxabA3PEDIjRNSf8hJ57KoWrG6y+biqBAqjjqGYZ5FfJSJz05U+UHovSDQ2yt0vJENXmHwgH1naqX14qXTlq2Iv00i+nCNwkcfxZ7Jf15vS7udcmDYelF0umsO+Q2xt6yOArBumhMXCgeo/vK3fEUVDdT3KSdD+TC+WZxCrxBJJsDmI2MLttnhiAl6d8B/6joc5W1/e83aGlp2ufJnRgl3sNlJutLaEj3bPDP+dcV9XpdJP/F02vEUoNEHM/IEIKmOjSzqrtIA7yYqxTHJuj/fwrk3BpZAKdAKKw+nE7CwLmMblA4lJQKg3cj/+5ZnSS2JyU/5J98RwI5HkkwM9Y3zyTCPjd9ql5wcKABSVzoqX+HuL7dfJIM+X3HkEvt7ln0zW6jD/nWxvwEKKKlzE8Iz6INHfieMr2DWRa4DFgJHIrIobcR404pNInnyZGGh+BXHp4MFa3Ss+YjmeHe3tt7rWEcpy7D6fwWP9FmSdupXVF6DTKLZLV4+OrS9qoWA1VFbpC5zm5TgZb7i87icTBZ8bqVxmOf+wK5Vnb6CGuWw6GamfKTh8JMdoemPSd+qjU5+/8NzHrtHKJ/vDY4WtO4qaW665xMdssVVpAxgKaT+sXW5O7SBAFmNWOkmMmXNqtqWBvVSi5Kcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(4326008)(8676002)(53546011)(54906003)(6916009)(6506007)(6486002)(86362001)(9686003)(6512007)(66556008)(2906002)(66946007)(66476007)(26005)(7416002)(8936002)(38100700002)(316002)(5660300002)(6666004)(478600001)(186003)(83380400001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6dXmtb7TadNzjVUolEARMiaECV9jhh7BJqw5RnGAeZsgKMlrdo1pnQoE/7Y?=
 =?us-ascii?Q?13ahSpgMBea+RsURi+0LHtqiPQqNMVEQeYaghUsuwh45UkwrlZPZz6Ag0QxB?=
 =?us-ascii?Q?U3STOHuD7EF7Fs+i/A7L0B2Y9zqlJ786i0O3rakFijA9lVJqxxiPM0bYPN0s?=
 =?us-ascii?Q?CP1IqrydPMGdfMo+D4H1dcBpbC8VsoFWuBgi8ss8NLZhgXvOZdyK6feeOmSC?=
 =?us-ascii?Q?BKKhQWvRlEHEFdk2hL6O6+9QO2r+rqb72ac1CzJ04Vuy0gUAJDY7SMowJMcd?=
 =?us-ascii?Q?Hvhn5r081vhTRxz3aHSBvvmn1WVVevuZ0/ns2kQ1vA/aA36UNgMlDyq5vBzm?=
 =?us-ascii?Q?u2/ouw4GXBB7Rq2MCBi8M7CAlCVCWWQiyDJWPAXd/cHGJA/d7iu2xY+zYLpm?=
 =?us-ascii?Q?BDmvuAEyewmA9G39lQmrFzqAkHji02LVYJoJbFPCpCBBtb5Z1oDGynTBZeZk?=
 =?us-ascii?Q?2n0uByPQ2j0DwyLbW3QQoOML/otttZwBzr0ixsuhzck8i7xorxbyzvLO17gx?=
 =?us-ascii?Q?X1hOWkdJ83AaQzUnoLKySXjoDK+0B93oD1BV7tka7kXMI1d/B/tWvHR9ZlQQ?=
 =?us-ascii?Q?9iEoE21BcDb8l2o+035VpRvpGepIeAjSVg6j2KZGknSaGY9EPk9vz6OtTNPZ?=
 =?us-ascii?Q?T+iOVTysqKanmEQXybi79MTwhOYFUA81WFQXWAxtuFSG2gfTi0gyLV5YI6BJ?=
 =?us-ascii?Q?Wk7LDvTtSinZdVdz3fxbN3CgyICc9QUIq5UmuuY6qFLe+S2eq3ur50BujmB+?=
 =?us-ascii?Q?M8b7ncSKPxkX9bcEXhHtHgMXTkOhl/v5BpOCdjbTuMM7jWa8k23euLc4xJlq?=
 =?us-ascii?Q?zRRVfmQKYPZn8LdIWwjs1okWphLkj1qIThn1ROZAwy1Dn7oq2bpRfUfev0PA?=
 =?us-ascii?Q?ln9TKfMy4G6OvYml97f7IFtR9pdeEP+oCKjAzb0bWP6J5tjNlDbttdEMe3R0?=
 =?us-ascii?Q?SxFXtxfvw2qsYYB3+hnB/zuAJ3c0SsY2uraxSihKp/TnW3G3hyris562h+V/?=
 =?us-ascii?Q?7VjZWzcOf/w5HHBJoqWdPMoyl26w73p8Ksc7cxhOZZrx1MZrafy0Uonr2bGY?=
 =?us-ascii?Q?B3gp3VR6xEa2PgwMolzZnzRekKStN6qBDJkF5i7ut0Sz108mMMLP8efgELDG?=
 =?us-ascii?Q?EdosVIfIqd/20kgCjiH8UWQy/7yqWZVQt6HhYnbW/2HvT5Ph21Bfq8xJs31Q?=
 =?us-ascii?Q?n8LHdXLrTEFkpCu4RPDAPAlvzJYvHp00ktV1gTmtlp7D34+C6GEFPnNpQpxM?=
 =?us-ascii?Q?gQVEKrFTzVmwDvgiL74GjGKMk/10YLrL66IkyTs7e4oU8mQOMo7fuKJYhDnV?=
 =?us-ascii?Q?GsNoZKzba2FgBEwgniNW047IS9ooAqUiLAk9uDFmg9/Mkh9SXn66lHDcBX/n?=
 =?us-ascii?Q?tuzf29/7F3YNEnh5oZwhO3Gnl2IBw23Eq16E0aNrXW8zQWM5SH9i3RnlqE5y?=
 =?us-ascii?Q?VEK4ZU2h6piNfczbD/OKufCR62tt7nT9/Af1a5mMrKZXRRaryNtoZDYFMAtf?=
 =?us-ascii?Q?wcj+mkSI4knEkGnIE5ehR2zAcuvvRKnxmztBAm8PEAOEwZh4u9SP03zr6HB3?=
 =?us-ascii?Q?wbw0noyQ0BgI1h9N6ElD5h+W2DgZeewjHA+fZNrBl5zp84jrO0380zDsgCYi?=
 =?us-ascii?Q?iwWtZ3CmLZDEqP+N4qzvrA3TDYP4LW/ZN1m1GlAMmlHsMg4Mj0kC4TrOW3V5?=
 =?us-ascii?Q?+gXQ/rI7/dgj6Qy+q/aPHzfbnWruZVGUdkw+iQ4HbUcewXNlt0LjZa6imyni?=
 =?us-ascii?Q?P900kOKgkw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495e4bae-adc6-411d-9eed-08da5299dd72
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 08:50:02.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIcRcrpMimSQkfFN7tBNMwZyoDm4XIPp6cgK3dVh/471zuQ08IdFoj8g9VqgdWb77yVvmq/k+xhyj61/WbVejA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2922
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>,
 rcampbell@nvidia.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Hildenbrand <david@redhat.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Oded Gabbay <oded.gabbay@gmail.com> writes:

> On Mon, Jun 20, 2022 at 3:33 AM Alistair Popple <apopple@nvidia.com> wrote:
>>
>>
>> Oded Gabbay <oded.gabbay@gmail.com> writes:
>>
>> > On Fri, Jun 17, 2022 at 8:20 PM Sierra Guiza, Alejandro (Alex)
>> > <alex.sierra@amd.com> wrote:
>> >>
>> >>
>> >> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>> >> > On 31.05.22 22:00, Alex Sierra wrote:
>> >> >> Device memory that is cache coherent from device and CPU point of view.
>> >> >> This is used on platforms that have an advanced system bus (like CAPI
>> >> >> or CXL). Any page of a process can be migrated to such memory. However,
>> >> >> no one should be allowed to pin such memory so that it can always be
>> >> >> evicted.
>> >> >>
>> >> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> >> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> >> >> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> >> >> [hch: rebased ontop of the refcount changes,
>> >> >>        removed is_dev_private_or_coherent_page]
>> >> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> >> >> ---
>> >> >>   include/linux/memremap.h | 19 +++++++++++++++++++
>> >> >>   mm/memcontrol.c          |  7 ++++---
>> >> >>   mm/memory-failure.c      |  8 ++++++--
>> >> >>   mm/memremap.c            | 10 ++++++++++
>> >> >>   mm/migrate_device.c      | 16 +++++++---------
>> >> >>   mm/rmap.c                |  5 +++--
>> >> >>   6 files changed, 49 insertions(+), 16 deletions(-)
>> >> >>
>> >> >> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> >> >> index 8af304f6b504..9f752ebed613 100644
>> >> >> --- a/include/linux/memremap.h
>> >> >> +++ b/include/linux/memremap.h
>> >> >> @@ -41,6 +41,13 @@ struct vmem_altmap {
>> >> >>    * A more complete discussion of unaddressable memory may be found in
>> >> >>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
>> >> >>    *
>> >> >> + * MEMORY_DEVICE_COHERENT:
>> >> >> + * Device memory that is cache coherent from device and CPU point of view. This
>> >> >> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>> >> >> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>> >> >> + * type. Any page of a process can be migrated to such memory. However no one
>> >> > Any page might not be right, I'm pretty sure. ... just thinking about special pages
>> >> > like vdso, shared zeropage, ... pinned pages ...
>> >>
>> >> Hi David,
>> >>
>> >> Yes, I think you're right. This type does not cover all special pages.
>> >> I need to correct that on the cover letter.
>> >> Pinned pages are allowed as long as they're not long term pinned.
>> >>
>> >> Regards,
>> >> Alex Sierra
>> >
>> > What if I want to hotplug this device's coherent memory, but I do
>> > *not* want the OS
>> > to migrate any page to it ?
>> > I want to fully-control what resides on this memory, as I can consider
>> > this memory
>> > "expensive". i.e. I don't have a lot of it, I want to use it for
>> > specific purposes and
>> > I don't want the OS to start using it when there is some memory pressure in
>> > the system.
>>
>> This is exactly what MEMORY_DEVICE_COHERENT is for. Device coherent
>> pages are only allocated by a device driver and exposed to user-space by
>> a driver migrating pages to them with migrate_vma. The OS can't just
>> start using them due to memory pressure for example.
>>
>>  - Alistair
> Thanks for the explanation.
>
> I guess the commit message confused me a bit, especially these two sentences:
>
> "Any page of a process can be migrated to such memory. However no one should be
> allowed to pin such memory so that it can always be evicted."
>
> I read them as if the OS is free to choose which pages are migrated to
> this memory,
> and anything is eligible for migration to that memory (and that's why
> we also don't
> allow it to pin memory there).
>
> If we are not allowed to pin anything there, can the device driver
> decide to disable
> any option for oversubscription of this memory area ?

I'm not sure I follow your thinking on how oversubscription would work
here, however all allocations are controlled by the driver. So if a
device's coherent memory is full a driver would be unable to migrate
pages to that device until pages are freed by the OS due to being
unmapped or the driver evicts pages by migrating them back to normal CPU
memory.

Pinning of pages is allowed, and could prevent such migrations. However
this patch series prevents device coherent pages from being pinned
longterm (ie. with FOLL_LONGTERM), so it should always be able to evict
pages eventually.

> Let's assume the user uses this memory area for doing p2p with other
> CXL devices.
> In that case, I wouldn't want the driver/OS to migrate pages in and
> out of that memory...

The OS will not migrate pages in or out (although it may free them if no
longer required), but a driver might choose to. So at the moment it's
really up to the driver to implement what you want in this regards.

> So either I should let the user pin those pages, or prevent him from
> doing (accidently or not)
> oversubscription in this memory area.

As noted above pages can be pinned, but not long-term.

 - Alistair

> wdyt ?
>
>>
>> > Oded
>> >
>> >>
>> >> >
>> >> >> + * should be allowed to pin such memory so that it can always be evicted.
>> >> >> + *
>> >> >>    * MEMORY_DEVICE_FS_DAX:
>> >> >>    * Host memory that has similar access semantics as System RAM i.e. DMA
>> >> >>    * coherent and supports page pinning. In support of coordinating page
>> >> >> @@ -61,6 +68,7 @@ struct vmem_altmap {
>> >> >>   enum memory_type {
>> >> >>      /* 0 is reserved to catch uninitialized type fields */
>> >> >>      MEMORY_DEVICE_PRIVATE = 1,
>> >> >> +    MEMORY_DEVICE_COHERENT,
>> >> >>      MEMORY_DEVICE_FS_DAX,
>> >> >>      MEMORY_DEVICE_GENERIC,
>> >> >>      MEMORY_DEVICE_PCI_P2PDMA,
>> >> >> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>> >> > In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>> >> >
>> >> >
>> >> > However, where exactly is pinning forbidden?
>> >>
>> >> Long-term pinning is forbidden since it would interfere with the device
>> >> memory manager owning the
>> >> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>> >> is allowed on this device type.
>> >>
>> >> Regards,
>> >> Alex Sierra
>> >>
>> >> >
