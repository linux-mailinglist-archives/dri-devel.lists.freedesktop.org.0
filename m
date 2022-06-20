Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF89550DE4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 02:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EECA10E8DA;
	Mon, 20 Jun 2022 00:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9210E8DA;
 Mon, 20 Jun 2022 00:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXAq6XSLPUMK2fneGDIoVBVZv1FCms6kSj4rIsDYR5kEKvyxW/GQQTJlmTY0zG0w2iBKhJcSxD5D6InqNM1kJ1RcqcspQ0imWb7nNRWrsTrwDFazc0m2vivk3DkAmO5ySCyDrpr2mBcF5tbLTPYkGxsyFzxCrugesE38zb0nTzygQzQBspsNfgOzMyXDdcG8FoCp/J7pQtR+8bmdjmQUwYRNgpJTicQPIoGrYeRuv1eMkEsZCBGp+62i+Z+F0IObZlqRpcipfQOAeAMVIJdEKOqhPbIN8MECJWio7uzllv7EfeDy0VI0RR/99rIXvFD5jrpJkHseA3u8E0SaglfHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHpkPMa5JjQJ7GmU4UFhafBmklyY6GKLl1HtSmmP9Ho=;
 b=cLqLsCoHNhOvhhe2CGA4ZKH+T33IVHSrtmGS3EWsLyRvixnfguHsyMhDlcEuGTHCvwZOLAMOOC37CWT/XSs3vZOJxGzd4gfh14a450+L2fMXdfGrxtxgdB6kE0YbAeOo1cSfDoO7frxbEHpNcbFjDZO+35agPyA1vzhV3OWspcS8wk3lg/iODLaqumVxetM0SQ1qPmfqpUEVFdy16tBoGW2aUTpeFtkociCr8HsXPODpoQuGkF9shUFRdxfjcjWGKD3BX/7dDfv/1P6OgbZqc59SfH+tMbb5FFesiG5yCdbKT5h2zrkRGPFu76SOqhQ8GhcKeZKC6GAyMqqVPIaspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHpkPMa5JjQJ7GmU4UFhafBmklyY6GKLl1HtSmmP9Ho=;
 b=nC2tfDGqj2sI3DNsHpgq3nxRJJk6FpaX/8hjdI45nWhr0q2QwolngLQ9AvQHFL30dO+KgGPdWfx8vDuYasIT2krsYQSEPwlfX82LHPnaRUeftg8vKFPIIkK274q8+bHJr4G4MHrZhN20yMXDyn/RJdYkSPyIhKMZo5aicM52S6TI8VM9xLNBRrCRT1mKSQ8mZ5TsBQ31mgLB33gOhHE32LpgM2dYevi93+r/2J+x5K4Q/+TEGEGGz4LUJHgQlVuBsrYWjdrsri9tDJOq0XI/dBl0NS8AXbdV7mSVlNJxSk7MGAjgfIekjiayQ+cumujln8wJKCiWtpfnfnN4Jr69lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BN6PR1201MB0259.namprd12.prod.outlook.com (2603:10b6:405:58::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 00:33:13 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 00:33:12 +0000
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Date: Mon, 20 Jun 2022 10:17:00 +1000
In-reply-to: <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
Message-ID: <87bkuo898d.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::11) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76a73f5-dd3e-4385-e417-08da5254752d
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0259:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0259CAB927BBC3222F122F98DFB09@BN6PR1201MB0259.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AQL843VOj4b1w/uulf9BUVH3zn3Ku7siaPQ6nFuXLm/sEgBU215jYFqVXML0xj/z9bwPfmpdDHBB6tLYfEFfeYMFxE0X7B77yStYvXNZ6WtJ7etrcGyCm9vfqnJIPO0baGFBQ5HlDS9SUYBatX22OVfP8F0rBgAeKecebmvrFYv0MOY7ULNyWSqNPQR9I3J55IsVzWtmkjMj1K1nHtKd+ipsuttWP8Sil20Ouob0YynhfGnSs0oHCRs9pRhcnvEFk0e9EQXByIyh6nc63j1MSb4LVGv6KNmvzpv+MmUbQC6jacA3OmXUcIFG0hFS9IgWvSUzdP0PVt9WS5VY+RDlLdHD/tfbGB1DnYpNgWMTY4iJ7Et/QPFeaLD6kApq9Opvo3KzSP0JS3AfEzW53teKs+YDTp1gp5m7LUn+d/KRvW2k9M70FwrwGNV8AXh6mngl1D9cgR9A4OOeHK9wpzoHscaYeFyqSyGJhyCBPXGlTvBgqhlVLJkuy4bGYRlbmEaz5gnfPb3/NWdMSXt2jAFuYq54QRnGAIBSoB5mcnU5jvdX80p3gZHRSvUMfrUC0iQ5B2tq3Qrt4Cfma3NuWkcQB2ylQA0RI/ptmlJWKYId0btnmtm0XurUy/xl1iQ+IpbJ589P63Y8k+xrAlDtwKEFKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(9686003)(6666004)(6512007)(26005)(38100700002)(54906003)(6916009)(53546011)(5660300002)(2906002)(6506007)(7416002)(8936002)(66476007)(6486002)(66946007)(8676002)(498600001)(4326008)(83380400001)(86362001)(66556008)(186003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O0E/VqIwE9SaClmZ7Z/jchgjECyS5Jc446TG3RLKn6Dx292IDQn/zexQX2Zw?=
 =?us-ascii?Q?oJtcbKx1IEtLyzpDwA1Brkn3k/oO/fi0aElK+N/K7yGejKm4WnqKeN45b22v?=
 =?us-ascii?Q?+vSco7FTVEmZirHW49R1IYXKJ9UffUFi4VnyBa27VbRs93QKziWn6kh2/98x?=
 =?us-ascii?Q?aczseOy433NoCxJDo9YC1XEkr6AxDLQwF/KHEftMT+1UkOCro4/9+yD/0iQP?=
 =?us-ascii?Q?zgnkXQU1d1h3JOC9JarkgG9g972zSeU0W5zJguDO3f0loOYqwCYWqG7qTvyN?=
 =?us-ascii?Q?OHd5Rodpyfzdl/bY7IyXWReeGYpTUAVM0e4epMIiTCH0cxaf8/9kw33byisp?=
 =?us-ascii?Q?PCmwSXRzqoPVXkSCWGZGBcZyCkXvJUEcVHemvkJvNV9/1SY/AmTIRovpxJNC?=
 =?us-ascii?Q?FvRe1qsCI4hQ3pi5KzJc6toQh0pR9rZsCT1CPZIreevmZBW+5VmAm/JpYlzf?=
 =?us-ascii?Q?5+ZI6nwWNIIj8bZYGwmJY1aiLnrHAbzVkjMSd6CdZDMebNpvRyY2n3Yq6SnT?=
 =?us-ascii?Q?HQxVSkNO3JzxYjn0sohIKeTIYMTZfzExKnDYKSRYyffZ+xfZyWj7Z4cvVSLy?=
 =?us-ascii?Q?y1SXOvZUwGx3g9M/nf+lEvpKVBDzCgeR8nbiIRN/w+CwcQPQaicr1G0TsOW9?=
 =?us-ascii?Q?JV0UEENMnvS7LPiL98zzT5sCASdb2wpiDz1WS6mYXAU/w+mSST+Era896v+T?=
 =?us-ascii?Q?dA6hnqmdLG4zP7iZbUGHJhjXp0n5lD1/TxfpiHF7nua/XeuBQkTuTy9LCinR?=
 =?us-ascii?Q?mCYQkSqS9NbSXxEoombBQAZCYJ5GUoFDfGokDUhuBVSga2jk2QnMSZsyApG9?=
 =?us-ascii?Q?p10uA3UY4AEKmznnbO130lOvP5igwYZI7yaE/2AtzMJcxG92eSDl25Fxm2wI?=
 =?us-ascii?Q?JR2kuR9PdSqtM9R5b2Em2b8TidHRXJ1KqUvusjpuZaB9zrisyb5Qommunbm9?=
 =?us-ascii?Q?Kb80hImBInV47DpUcTgwJnN9f0oQA7JumSYFDPZQnHfvuIRPDDj7K5gcgAl3?=
 =?us-ascii?Q?qFWomRI9ZhQ6FgqOL0lDHJT6x3BC9XoXQmFcyhEH03EtFMkCE0orNxr1ki2o?=
 =?us-ascii?Q?CmioU+nPCKHWDkWZQc9X9iC8IRElrdaRboMwwBqKIBc9WZ+T6stxNd86GGbc?=
 =?us-ascii?Q?nnT3p4TDLOfOhfJ6/3GUyfB610aCCoYtK3yDuKj/F4ytngnP9J6P0MIRlnCA?=
 =?us-ascii?Q?sPYqTwnpNMjnUs6dpmb2Hiheru8fn9CO4EgTK6JFH/E4TrAOiAD/8MYP/EQW?=
 =?us-ascii?Q?FkgU58+lQ+tfneWoqHODr2Kz1zvLH2b91InrYa0dDZyQWQlIAk1xFSlRFIad?=
 =?us-ascii?Q?wxz2zhY8XheKO4qbkRBJ2hw4D/ej6/McrBX0KfMwLHus3/iHesxUAfx4ljt9?=
 =?us-ascii?Q?WLC09iddcYEbn7QESP4Jno93gRm3dcj7MZTUEmFCRfQjPQwhg0MVAnvj+IiQ?=
 =?us-ascii?Q?kzF3XzHB2H1fXVcBO1/Ljjc1xWD6vQ6eAjvE1fRIgGPvM6UQc9z2bI3Hisq8?=
 =?us-ascii?Q?HDriKsGTYR5LRXw79xXsNny5eWAWhxIkXSW13TnnB2FVg0Ie7ckZ8W5O9yL2?=
 =?us-ascii?Q?sftsvl+nxkJlcdZXJsYHouk58QFNZo0IJklHVybIZT8eXymqoQ39ZQZWV9q6?=
 =?us-ascii?Q?A/WyKEfP3pQWlLawOM+szXzFVdtDxkgysAfKhi4ar/buzLqVkyo1uOVVNnRI?=
 =?us-ascii?Q?Z0cSZsJGZ4TnHBOZit81E41of4cade4kRPV6pqzj20mhoS0uvvgDzd6rN/7H?=
 =?us-ascii?Q?R4wY7ZsOkw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76a73f5-dd3e-4385-e417-08da5254752d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 00:33:12.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9n1lb3LdTQPX0qyZasNcwLiAzFtgSgBO+vBd/kT3pgwIfPDPK/p4oaJBtGZKGvh7IDyLvKeYs2kN2esd+Anug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0259
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

> On Fri, Jun 17, 2022 at 8:20 PM Sierra Guiza, Alejandro (Alex)
> <alex.sierra@amd.com> wrote:
>>
>>
>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>> > On 31.05.22 22:00, Alex Sierra wrote:
>> >> Device memory that is cache coherent from device and CPU point of view.
>> >> This is used on platforms that have an advanced system bus (like CAPI
>> >> or CXL). Any page of a process can be migrated to such memory. However,
>> >> no one should be allowed to pin such memory so that it can always be
>> >> evicted.
>> >>
>> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> >> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> >> [hch: rebased ontop of the refcount changes,
>> >>        removed is_dev_private_or_coherent_page]
>> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> >> ---
>> >>   include/linux/memremap.h | 19 +++++++++++++++++++
>> >>   mm/memcontrol.c          |  7 ++++---
>> >>   mm/memory-failure.c      |  8 ++++++--
>> >>   mm/memremap.c            | 10 ++++++++++
>> >>   mm/migrate_device.c      | 16 +++++++---------
>> >>   mm/rmap.c                |  5 +++--
>> >>   6 files changed, 49 insertions(+), 16 deletions(-)
>> >>
>> >> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> >> index 8af304f6b504..9f752ebed613 100644
>> >> --- a/include/linux/memremap.h
>> >> +++ b/include/linux/memremap.h
>> >> @@ -41,6 +41,13 @@ struct vmem_altmap {
>> >>    * A more complete discussion of unaddressable memory may be found in
>> >>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
>> >>    *
>> >> + * MEMORY_DEVICE_COHERENT:
>> >> + * Device memory that is cache coherent from device and CPU point of view. This
>> >> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>> >> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>> >> + * type. Any page of a process can be migrated to such memory. However no one
>> > Any page might not be right, I'm pretty sure. ... just thinking about special pages
>> > like vdso, shared zeropage, ... pinned pages ...
>>
>> Hi David,
>>
>> Yes, I think you're right. This type does not cover all special pages.
>> I need to correct that on the cover letter.
>> Pinned pages are allowed as long as they're not long term pinned.
>>
>> Regards,
>> Alex Sierra
>
> What if I want to hotplug this device's coherent memory, but I do
> *not* want the OS
> to migrate any page to it ?
> I want to fully-control what resides on this memory, as I can consider
> this memory
> "expensive". i.e. I don't have a lot of it, I want to use it for
> specific purposes and
> I don't want the OS to start using it when there is some memory pressure in
> the system.

This is exactly what MEMORY_DEVICE_COHERENT is for. Device coherent
pages are only allocated by a device driver and exposed to user-space by
a driver migrating pages to them with migrate_vma. The OS can't just
start using them due to memory pressure for example.

 - Alistair

> Oded
>
>>
>> >
>> >> + * should be allowed to pin such memory so that it can always be evicted.
>> >> + *
>> >>    * MEMORY_DEVICE_FS_DAX:
>> >>    * Host memory that has similar access semantics as System RAM i.e. DMA
>> >>    * coherent and supports page pinning. In support of coordinating page
>> >> @@ -61,6 +68,7 @@ struct vmem_altmap {
>> >>   enum memory_type {
>> >>      /* 0 is reserved to catch uninitialized type fields */
>> >>      MEMORY_DEVICE_PRIVATE = 1,
>> >> +    MEMORY_DEVICE_COHERENT,
>> >>      MEMORY_DEVICE_FS_DAX,
>> >>      MEMORY_DEVICE_GENERIC,
>> >>      MEMORY_DEVICE_PCI_P2PDMA,
>> >> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>> > In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>> >
>> >
>> > However, where exactly is pinning forbidden?
>>
>> Long-term pinning is forbidden since it would interfere with the device
>> memory manager owning the
>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>> is allowed on this device type.
>>
>> Regards,
>> Alex Sierra
>>
>> >
