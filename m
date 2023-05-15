Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8D703DCF
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 21:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775F410E072;
	Mon, 15 May 2023 19:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR00CU002.outbound.protection.outlook.com
 (mail-centralusazon11021027.outbound.protection.outlook.com [52.101.62.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC72610E072
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 19:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEW5sljTzUwbO4lCzfp+40ibFJwBT6yu4nDx/kcggpuwRE/bmmnsxurARWctBLLVS557tqYkqXtO7dpf/3NMhIOOIYK9flpn+1G5YVf4vbkO4AjYeNhIZV2tK4Ck0n2Kdep9f8E0olzbD1z0Lwm408XsPm7EMb4PNbFf9/RbSD1Vp0DSwJTFuluUKRnQ6oM7R8/2uFZn/h7nQsJ51lpv1w/Ykxfu33+iVDQoetsUUrYYacrG5iCmG5ASy2SlC5hiOtzoxPkM1RwwUFfQzjNXSgtxIQlMXAhngshxwFTIi+fzuQUwh02zBrtDadGgVGCK608QO3YYXUXbqO1ARCfDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/8gInC+y9D81yKsAnyVYaAnxAa7V6M1Xe2UJnRzsME=;
 b=FSgp23OdLmvYhq5+9lNK3UOcSYsv1e0zbK3+rKY4qqiXFwxgULVvP+iRbxCx7B9aVJuheeEXy0AVS/yFAgA9NUf6mNrqM1XGumE6uUvzOWIulbwBshhrFqTpsaaxuTn00Y/m8zWOYPoW7WeRCFyXzLh1wnCKYHuSW53puwSDQA8uoOn02TyT6enB9PNkfd0A9TTaTkRWitihU61SY5zhD3hQP59fZIJt5cof7dSatXXUZA523Ti11/zkiKpzuwzpYqS2uwp9qPSq+a7dBCpm1wkOz8qt7SyEdMviZPMibe6aTTQblp2aRlBVMDRvNWGP3X8E1raFXDjdaqJ7Isjj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/8gInC+y9D81yKsAnyVYaAnxAa7V6M1Xe2UJnRzsME=;
 b=F/65keTwg1/J16oLq4SEwlZAh9eSRGPwBFO1Nk2MwADGNC/8EtfiO38aLY4caLzcN6hB8c5H/JFE9KHpv71DJgVYElq0tgpCRVg6+qHxNDfacYvO/wmdLKRUELfF1JHFZK5HCTX0AhsKvOB2PL0E7+OyJeVj+p3iPz8jY/aVsrI=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by MW4PR21MB1940.namprd21.prod.outlook.com (2603:10b6:303:72::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.4; Mon, 15 May
 2023 19:43:53 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::a4f7:2466:97b5:bd31]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::a4f7:2466:97b5:bd31%5]) with mapi id 15.20.6433.001; Mon, 15 May 2023
 19:43:53 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet
 <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Borislav Petkov <bp@suse.de>, Randy
 Dunlap <rdunlap@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Kim Phillips
 <kim.phillips@amd.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook
 <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DMA MAPPING HELPERS"
 <iommu@lists.linux.dev>
Subject: RE: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Thread-Topic: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Thread-Index: AQHZgledQutrE0IR0keVtODngWtNC69bu5SA
Date: Mon, 15 May 2023 19:43:52 +0000
Message-ID: <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
In-Reply-To: <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b9182308-ca94-4cf1-bca6-9aeb7458042e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-05-15T19:04:54Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|MW4PR21MB1940:EE_
x-ms-office365-filtering-correlation-id: 51130672-905a-4548-30c3-08db557cb688
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ed9/tWU7bASZpNAnUs+Y7fZeOsdibpdwKxGNmLhGqmltvCysTd3yraahdB0dw24IFmKLEMVyCMIw73b735gRa3C/Ah1+T10jlsEnyPXS4Za02VmQQ9Jh+BNkdyL3+eRBrXMyERsxAAbxTbnf0byBxLX/ck9GQ2LDpgb87+Ud8Z9Nbv55pk/GZGfA0etkFvPUSEP9rntLw4aSgSHjVkJWqaB9ex5Rtwf9kjqZ1/wsHLhwq+FJiujj/GFXssfJX57cCWV4BjJhCix6uNsKxy4ORW7q41VX6ooEQyQi7ly0T8fR2B9EcvqCfPoitel/1GrpjWe9JFqS0ByhQXYDLgMf1Lx7hgnIQZzDr7unR0qhTN1XJOGECWW7KRC7gx1M+RTD1dfYDIumq6zUgDhye9Pway/08Vv1s9aFPoJocyFOWLpDRYzP7eFh/AxMPMwMNyRrET6KKJFmj217iesZIBemgViXKFY9FtzXHnnrvpwP3qo3MhrXiziUOi0Ci2Lf0FvdHuruSkdllbVhfiiKqzD6OOMGMWSY/jpMYawL0asQluG7RJ/h8ykKPGjhQwTRPLD/esI2PTvpDyYVOXlwj1PLd1LWRg03TjBjGQVIBtRAQHYVxe/lvcgi1etriZXg21kY63bLtfbX3e1lAVuOInTAdlcVoes2rLQ56HZENtNYSMcdMWongzRWGvObKRjhuQgwufdpCyzXl52B0yuwGAlvww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(10290500003)(8676002)(71200400001)(66899021)(478600001)(41300700001)(55016003)(4326008)(122000001)(786003)(82950400001)(66556008)(66946007)(82960400001)(76116006)(921005)(66446008)(316002)(64756008)(66476007)(110136005)(54906003)(38100700002)(8936002)(186003)(8990500004)(38070700005)(9686003)(6506007)(30864003)(2906002)(26005)(83380400001)(33656002)(966005)(7416002)(86362001)(7406005)(7696005)(5660300002)(52536014)(579004)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VVor/dszar78KCDAGd28AtiyjtrcqaOIqHWGFjtBnu65YInvyLXzZ7VQzolE?=
 =?us-ascii?Q?fp7dRb2CGIpSPRu/InGjAEVrz172D7japkcJfrzNELhHmuGymC4T8HID0egA?=
 =?us-ascii?Q?OTnhvMJtP00raQH+IzIrWSbDFt/EoPkoWmqL75+9y5DyDQxkFr7mq2VERgdD?=
 =?us-ascii?Q?9nqgrIXx4xOokTu6mQKLaDy7ozNa+aswmn4Hn14TpJHdif6M/m3VLITKD+OT?=
 =?us-ascii?Q?gzXkMAFIlWm4hhmFkTKZtAduDaFKqoLH81EqLiPYhPuiQ2fKC5L3KspNVqka?=
 =?us-ascii?Q?VNQ8rV3PjjjNc2ph5FMBLfVLlJHzCor2SbJhXEwtTNbnu6zvUjnLhHgzHlEm?=
 =?us-ascii?Q?QtOstZD6dHF7uL0BEKGQ4LdEDV6LG6lSrgog6DKOrWVKauFHK0nmMVx31sIP?=
 =?us-ascii?Q?V3vIeT35CvPfQH5vGY6QPbav3k/vU2DGrkgV/Ry2EB7fNA7AzFbutLWXLO52?=
 =?us-ascii?Q?MCDDaF7Nkdi42XyDHxt/vgRjME9AutWdCkE6sOUjfk36EdCLQbcusUZmx3mA?=
 =?us-ascii?Q?UKvrXfveb7LGntQaWzrLG4MCTS+IpEx3FYhp3voYz9KP/Rh5c+0/xw36AogO?=
 =?us-ascii?Q?usd/XHf0qHxmowqaJEbH1cbTwZqXKymBhXW9i87Wei7igsT8PmHEBFuMG0R7?=
 =?us-ascii?Q?CTWPSprxUdJ/oz3Z5ZHPAL+ScLMAO/G6sh1/IqzVeQ59U7ds7eR2PKnEts4m?=
 =?us-ascii?Q?tSmmSPjYuPRZhPG29U8U32LRThi8JMF6qtNc9qKLc7Vs5Db6JrzNlLbJ5VpZ?=
 =?us-ascii?Q?WgPk7gsY+b+MQIOjrlvX3D1fVAWMwEKRIm2YfvTqdtFPwWeFcEF+Lh4KPlHA?=
 =?us-ascii?Q?DkQJWSpghb2vIP1pSiUSwTwLFRqll9SBsV1mpMjji5E/rbasXdrHq2Ufb16O?=
 =?us-ascii?Q?fnaleJcYD8jKIHK1DVd/6tisErQjT3knCKWILZnzJnUnJ/fOtazu6fCiOvUw?=
 =?us-ascii?Q?lTP+gHCOCMgZAnZJQJeCAOcOOHcT0p5ubQgg6gII606d/fM5LbilIzHqTB7M?=
 =?us-ascii?Q?nV9IozWclTmjphO0Nh9ns2R9tl5owpaadPCJhhwhWEaEk+r++bliubIAsA38?=
 =?us-ascii?Q?ukVVycftdYNK+7c9E2F3buM+FoKBDuaJC/DBDilkW/+Z3sHd5p4Z62ZVV1En?=
 =?us-ascii?Q?ls3izuU0JFZLNFy8BY4LdJKb5v3O7LDFVgtIYUPJ4E2Ynrw120yDzPaxIhvr?=
 =?us-ascii?Q?LymXsTCpEKxNFZ7T0wX77WZX4KTcGS5XUuXka1yJxIw6FCEhokalK6ax/jaN?=
 =?us-ascii?Q?WPB+uhKOyZU4LzBYyrw08hc4mQu88fLB4MvWYdBcJoDef1YfFwmXmV7CYOjG?=
 =?us-ascii?Q?uonnJNTLwPYQOGajP3J/tcrfOkHrfW7Q6o1jDl/fTJc6eBTlry+FapbrrzDx?=
 =?us-ascii?Q?zuBtRR6fZ5+bCsgKjbRo/hTZk8X/CAwZq3pfT8qRqQ4uURqhif0NigT0bapB?=
 =?us-ascii?Q?jcXhMbwsi+gMhHRSg/wr6p5vmtY072QLt0Uym2uTfW8dnofgHUXzL+cIU0Wq?=
 =?us-ascii?Q?1pcbSy0PpAIrSHP0IPMGm3nalUR0Rrtw9QIKBJUxm0DFcKgeg9mC9XgOSXtk?=
 =?us-ascii?Q?Uy9f2XzTYaq7YV+IxfXxnE2D9iNLv7EwRE2YxTcSZvT2CDrFUH1CQvefyv+J?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51130672-905a-4548-30c3-08db557cb688
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 19:43:52.9552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxjptnv4TkqeyAAYjAcFHvMKXNW0XG+ofKUknpmSklEruP751qm2wLT2X9di83tFhqf+x8AwSP6OkTQF+RJdVnS9SiFA27JwLDNicV054Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1940
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
Cc: "petr@tesarici.cz" <petr@tesarici.cz>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Roberto Sassu <roberto.sassu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Tesarik <petrtesarik@huaweicloud.com> Sent: Tuesday, May 9, 2023=
 2:18 AM
>=20
> The software IO TLB was designed with the assumption that it is not
> used much, especially on 64-bit systems, so a small fixed memory
> area (currently 64 MiB) is sufficient to handle the few cases which
> still require a bounce buffer. However, these cases are not so rare
> in some circumstances.
>=20
> First, if SEV is active, all DMA must be done through shared
> unencrypted pages, and SWIOTLB is used to make this happen without
> changing device drivers. The software IO TLB size is increased to 6%
> of total memory in sev_setup_arch(), but that is more of an
> approximation. The actual requirements may vary depending on which
> drivers are used and the amount of I/O.

FWIW, I don't think the approach you have implemented here will be
practical to use for CoCo VMs (SEV, TDX, whatever else).  The problem
is that dma_direct_alloc_pages() and dma_direct_free_pages() must
call dma_set_decrypted() and dma_set_encrypted(), respectively.  In CoCo
VMs, these calls are expensive because they require a hypercall to the host=
,
and the operation on the host isn't trivial either.  I haven't measured the
overhead, but doing a hypercall on every DMA map operation and on
every unmap operation has long been something we thought we must
avoid.  The fixed swiotlb bounce buffer space solves this problem by
doing set_decrypted() in batch at boot time, and never
doing set_encrypted().

In Microsoft's first implementation of bounce buffering for SEV-SNP VMs,
we created custom bounce buffer code separate from swiotlb.  This code
did similar what you've done, but maintained a per-device pool of allocated
buffers that could be reused, rather than freeing the memory (and marking
the memory encrypted again) on every DMA unmap operation.  (The pool
was actually per-VMBus channel, but VMBus channels are per-device, so
the effect was the same.)  The reusable pool avoided most of the calls to
set_decrypted()/set_encrypted() and made it practical from a performance
standpoint.  But of course, the pool could grow arbitrarily large, so there
was additional complexity to decay and trim the pool size.  LKML feedback
early on was to use swiotlb instead, which made sense, but at the cost of
needing to figure out the appropriate fixed size of the swiotlb, and likely
over-provisioning to avoid running out of bounce buffer space.

Now we're considering again a more dynamic approach, which is good, but
we're encountering the same problems.

See https://lore.kernel.org/linux-hyperv/20210228150315.2552437-1-ltykernel=
@gmail.com/
for this historical example.

Michael

>=20
> Second, some embedded devices have very little RAM, so 64 MiB is not
> negligible. Sadly, these are exactly the devices that also often
> need a software IO TLB. Although minimum swiotlb size can be found
> empirically by extensive testing, it would be easier to allocate a
> small swiotlb at boot and let it grow on demand.
>=20
> Growing the SWIOTLB data structures at run time is impossible. The
> whole SWIOTLB region is contiguous in physical memory to allow
> combining adjacent slots and also to ensure that alignment
> constraints can be met. The SWIOTLB is too big for the buddy
> allocator (cf. MAX_ORDER). More importantly, even if a new SWIOTLB
> could be allocated (e.g. from CMA), it cannot be extended in-place
> (because surrounding pages may be already allocated for other
> purposes), and there is no mechanism for relocating already mapped
> bounce buffers: The DMA API gets only the address of a buffer, and
> the implementation (direct or IOMMU) checks whether it belongs to
> the software IO TLB.
>=20
> It is possible to allocate multiple smaller struct io_tlb_mem
> instances. However, they would have to be stored in a non-constant
> container (list or tree), which needs synchronization between
> readers and writers, creating contention in a hot path for all
> devices, not only those which need software IO TLB.
>=20
> Another option is to allocate a very large SWIOTLB at boot, but
> allow migrating pages to other users (like CMA does). This approach
> might work, but there are many open issues:
>=20
> 1. After a page is migrated away from SWIOTLB, it must not be used
>    as a (direct) DMA buffer. Otherwise SWIOTLB code would have to
>    check which pages have been migrated to determine whether a given
>    buffer address belongs to a bounce buffer or not, effectively
>    introducing all the issues of multiple SWIOTLB instances.
>=20
> 2. Unlike SWIOTLB, CMA cannot be used from atomic contexts, and that
>    for many different reasons. This might be changed in theory, but
>    it would take a lot of investigation and time. OTOH improvement
>    to the SWIOTLB is needed now.
>=20
> 3. If SWIOTLB is implemented separately from CMA and not as its
>    part, users have to solve the dilemma of how to distribute
>    precious DMA-able memory between them.
>=20
> The present patch is a simplistic solution. Bounce buffers are
> allocated using the non-coherent DMA API, removing the need to
> implement a new custom allocator. These buffers are then tracked in
> a per-device linked list, reducing the impact on devices that do not
> need the SWIOTLB.
>=20
> Analysis of real-world I/O patterns has shown that the same buffer
> is typically looked up repeatedly (for further sync operations, or
> to be unmapped). The most recently used bounce buffer is therefore
> always moved to the beginning of the list. The list performed better
> than a maple tree when tested with fio against a QEMU SATA drive
> backed by a RAM block device in the host (4 cores, 16 iodepth).
> Other scenarios are also likely to benefit from this MRU order but
> have not been tested.
>=20
> Operations on the list are serialized with a spinlock. It is
> unfortunately not possible to use an RCU list, because quiescent
> state is not guaranteed to happen before an asynchronous event (e.g.
> hardware interrupt) on another CPU. If that CPU used an old version
> of the list, it would fail to copy data to and/or from the newly
> allocated bounce buffer.
>=20
> Last but not least, bounce buffers are never allocated dynamically
> if the SWIOTLB is in fact a DMA restricted pool, because that would
> defeat the purpose of a restricted pool.
>=20
> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> ---
>  include/linux/device.h  |   8 ++
>  include/linux/swiotlb.h |   8 +-
>  kernel/dma/swiotlb.c    | 252 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 259 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 472dd24d4823..d1d2b8557b30 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -510,6 +510,12 @@ struct device_physical_location {
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
>   * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver us=
e.
> + * @dma_io_tlb_dyn_lock:
> + *		Spinlock to protect the list of dynamically allocated bounce
> + *		buffers.
> + * @dma_io_tlb_dyn_slots:
> + *		Dynamically allocated bounce buffers for this device.
> + *		Not for driver use.
>   * @archdata:	For arch-specific additions.
>   * @of_node:	Associated device tree node.
>   * @fwnode:	Associated device node supplied by platform firmware.
> @@ -615,6 +621,8 @@ struct device {
>  #endif
>  #ifdef CONFIG_SWIOTLB
>  	struct io_tlb_mem *dma_io_tlb_mem;
> +	spinlock_t dma_io_tlb_dyn_lock;
> +	struct list_head dma_io_tlb_dyn_slots;
>  #endif
>  	/* arch specific additions */
>  	struct dev_archdata	archdata;
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 281ecc6b9bcc..6aada6ac31e2 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -114,6 +114,8 @@ struct io_tlb_mem {
>  };
>  extern struct io_tlb_mem io_tlb_default_mem;
>=20
> +bool is_swiotlb_dyn(struct device *dev, phys_addr_t paddr);
> +
>  /**
>   * is_swiotlb_fixed() - check if a physical address belongs to a swiotlb=
 slot
>   * @mem:	relevant swiotlb pool
> @@ -147,7 +149,9 @@ static inline bool is_swiotlb_buffer(struct device *d=
ev,
> phys_addr_t paddr)
>  {
>  	struct io_tlb_mem *mem =3D dev->dma_io_tlb_mem;
>=20
> -	return mem && is_swiotlb_fixed(mem, paddr);
> +	return mem &&
> +		(is_swiotlb_fixed(mem, paddr) ||
> +		 is_swiotlb_dyn(dev, paddr));
>  }
>=20
>  static inline bool is_swiotlb_force_bounce(struct device *dev)
> @@ -164,6 +168,8 @@ static inline bool is_swiotlb_force_bounce(struct dev=
ice *dev)
>  static inline void swiotlb_dev_init(struct device *dev)
>  {
>  	dev->dma_io_tlb_mem =3D &io_tlb_default_mem;
> +	spin_lock_init(&dev->dma_io_tlb_dyn_lock);
> +	INIT_LIST_HEAD(&dev->dma_io_tlb_dyn_slots);
>  }
>=20
>  void swiotlb_init(bool addressing_limited, unsigned int flags);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 96ba93be6772..612e1c2e9573 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -68,6 +68,22 @@ struct io_tlb_slot {
>  	unsigned int list;
>  };
>=20
> +/**
> + * struct io_tlb_dyn_slot - dynamically allocated swiotlb slot
> + * @node:	node in the per-device list
> + * @orig_addr:	physical address of the original DMA buffer
> + * @alloc_size:	total size of the DMA buffer
> + * @page:	first page of the bounce buffer
> + * @dma_addr:	DMA address of the bounce buffer
> + */
> +struct io_tlb_dyn_slot {
> +	struct list_head node;
> +	phys_addr_t orig_addr;
> +	size_t alloc_size;
> +	struct page *page;
> +	dma_addr_t dma_addr;
> +};
> +
>  static bool swiotlb_force_bounce;
>  static bool swiotlb_force_disable;
>=20
> @@ -466,6 +482,191 @@ void __init swiotlb_exit(void)
>  	memset(mem, 0, sizeof(*mem));
>  }
>=20
> +/**
> + * lookup_dyn_slot_locked() - look up a dynamically allocated bounce buf=
fer
> + * @dev:	device which has mapped the buffer
> + * @paddr:	physical address within the bounce buffer
> + *
> + * Walk through the list of bounce buffers dynamically allocated for @de=
v,
> + * looking for a buffer which contains @paddr.
> + *
> + * Context: Any context. Expects dma_io_tlb_dyn_lock lock to be held.
> + * Return:
> + *   Address of a &struct io_tlb_dyn_slot, or %NULL if not found.
> + */
> +static struct io_tlb_dyn_slot *lookup_dyn_slot_locked(struct device *dev=
,
> +						      phys_addr_t paddr)
> +{
> +	struct io_tlb_dyn_slot *slot;
> +
> +	list_for_each_entry(slot, &dev->dma_io_tlb_dyn_slots, node) {
> +		phys_addr_t start =3D page_to_phys(slot->page);
> +		phys_addr_t end =3D start + slot->alloc_size - 1;
> +
> +		if (start <=3D paddr && paddr <=3D end)
> +			return slot;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * lookup_dyn_slot() - look up a dynamically allocated bounce buffer
> + * @dev:	device which has mapped the buffer
> + * @paddr:	physical address within the bounce buffer
> + *
> + * Search for a dynamically allocated bounce buffer which contains
> + * @paddr. If found, the buffer is moved to the beginning of the linked
> + * list. Use lookup_dyn_slot_locked() directly where this behavior is no=
t
> + * required/desired.
> + *
> + * Context: Any context. Takes and releases dma_io_tlb_dyn_lock.
> + * Return:
> + *   Address of a &struct io_tlb_dyn_slot, or %NULL if not found.
> + */
> +static struct io_tlb_dyn_slot *lookup_dyn_slot(struct device *dev,
> +					       phys_addr_t paddr)
> +{
> +	struct io_tlb_dyn_slot *slot;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> +	slot =3D lookup_dyn_slot_locked(dev, paddr);
> +	list_move(&slot->node, &dev->dma_io_tlb_dyn_slots);
> +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> +	return slot;
> +}
> +
> +/**
> + * is_swiotlb_dyn() - check if a physical address belongs to a dynamical=
ly
> + *                    allocated bounce buffer
> + * @dev:	device which has mapped the buffer
> + * @paddr:	physical address within the bounce buffer
> + *
> + * Check whether there is a dynamically allocated bounce buffer which
> + * contains @paddr. If found, the buffer is moved to the beginning of
> + * the MRU list.
> + *
> + * Return:
> + * * %true if @paddr points into a dynamically allocated bounce buffer
> + * * %false otherwise
> + */
> +bool is_swiotlb_dyn(struct device *dev, phys_addr_t paddr)
> +{
> +	return !!lookup_dyn_slot(dev, paddr);
> +}
> +
> +/**
> + * swiotlb_dyn_bounce() - copy a dynamically allocated buffer from or ba=
ck
> + *                        to the original dma location
> + * @dev:	device which has mapped the buffer
> + * @tlb_addr:	physical address inside the bounce buffer
> + * @size:	size of the region to be copied
> + * @dir:	direction of the data transfer
> + *
> + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> + * This function works only for dynamically allocated bounce buffers.
> + */
> +static void swiotlb_dyn_bounce(struct device *dev, phys_addr_t tlb_addr,
> +		size_t size, enum dma_data_direction dir)
> +{
> +	struct io_tlb_dyn_slot *slot =3D lookup_dyn_slot(dev, tlb_addr);
> +	unsigned int tlb_offset;
> +	unsigned char *vaddr;
> +
> +	if (!slot)
> +		return;
> +
> +	tlb_offset =3D tlb_addr - page_to_phys(slot->page);
> +	vaddr =3D page_address(slot->page) + tlb_offset;
> +
> +	swiotlb_copy(dev, slot->orig_addr, vaddr, size, slot->alloc_size,
> +		     tlb_offset, dir);
> +}
> +
> +/**
> + * swiotlb_dyn_map() - allocate a bounce buffer dynamically
> + * @dev:	device which maps the buffer
> + * @orig_addr:	address of the original buffer
> + * @alloc_size:	total size of the original buffer
> + * @alloc_align_mask:
> + *		required physical alignment of the I/O buffer
> + * @dir:	direction of the data transfer
> + * @attrs:	optional DMA attributes for the map operation
> + *
> + * Allocate a new bounce buffer using DMA non-coherent API. This functio=
n
> + * assumes that there is a fallback allocation scheme if the allocation
> + * fails. In fact, it always fails for buffers smaller than a page and
> + * for address constraints that are not (yet) correctly handled by
> + * dma_direct_alloc_pages().
> + *
> + * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
> + */
> +static phys_addr_t swiotlb_dyn_map(struct device *dev, phys_addr_t orig_=
addr,
> +		size_t alloc_size, unsigned int alloc_align_mask,
> +		enum dma_data_direction dir, unsigned long attrs)
> +{
> +	struct io_tlb_dyn_slot *slot;
> +	unsigned long flags;
> +	gfp_t gfp;
> +
> +	/* Allocation has page granularity. Avoid small buffers. */
> +	if (alloc_size < PAGE_SIZE)
> +		goto err;
> +
> +	/* DMA direct does not deal with physical address constraints. */
> +	if (alloc_align_mask || dma_get_min_align_mask(dev))
> +		goto err;
> +
> +	gfp =3D (attrs & DMA_ATTR_MAY_SLEEP) ? GFP_NOIO : GFP_NOWAIT;
> +	slot =3D kmalloc(sizeof(*slot), gfp | __GFP_NOWARN);
> +	if (!slot)
> +		goto err;
> +
> +	slot->orig_addr =3D orig_addr;
> +	slot->alloc_size =3D alloc_size;
> +	slot->page =3D dma_direct_alloc_pages(dev, PAGE_ALIGN(alloc_size),
> +					    &slot->dma_addr, dir,
> +					    gfp | __GFP_NOWARN);
> +	if (!slot->page)
> +		goto err_free_slot;
> +
> +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> +	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
> +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> +
> +	return page_to_phys(slot->page);
> +
> +err_free_slot:
> +	kfree(slot);
> +err:
> +	return (phys_addr_t)DMA_MAPPING_ERROR;
> +}
> +
> +/**
> + * swiotlb_dyn_unmap() - unmap a dynamically allocated bounce buffer
> + * @dev:	device which mapped the buffer
> + * @tlb_addr:	physical address of the bounce buffer
> + * @dir:	direction of the data transfer
> + *
> + * Release all resources associated with a dynamically allocated bounce
> + * buffer.
> + */
> +static void swiotlb_dyn_unmap(struct device *dev, phys_addr_t tlb_addr,
> +			      enum dma_data_direction dir)
> +{
> +	struct io_tlb_dyn_slot *slot;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> +	slot =3D lookup_dyn_slot_locked(dev, tlb_addr);
> +	list_del(&slot->node);
> +	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
> +
> +	dma_direct_free_pages(dev, slot->alloc_size, slot->page,
> +			      slot->dma_addr, dir);
> +	kfree(slot);
> +}
> +
>  /*
>   * Return the offset into a iotlb slot required to keep the device happy=
.
>   */
> @@ -474,11 +675,19 @@ static unsigned int swiotlb_align_offset(struct dev=
ice *dev,
> u64 addr)
>  	return addr & dma_get_min_align_mask(dev) & (IO_TLB_SIZE - 1);
>  }
>=20
> -/*
> - * Bounce: copy the swiotlb buffer from or back to the original dma loca=
tion
> +/**
> + * swiotlb_fixed_bounce() - copy a fixed-slot swiotlb buffer from or bac=
k
> + *                          to the original dma location
> + * @dev:	device which has mapped the buffer
> + * @tlb_addr:	physical address inside the bounce buffer
> + * @size:	size of the region to be copied
> + * @dir:	direction of the data transfer
> + *
> + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> + * This function works only for fixed bounce buffers.
>   */
> -static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, siz=
e_t size,
> -			   enum dma_data_direction dir)
> +static void swiotlb_fixed_bounce(struct device *dev, phys_addr_t tlb_add=
r,
> +				 size_t size, enum dma_data_direction dir)
>  {
>  	struct io_tlb_mem *mem =3D dev->dma_io_tlb_mem;
>  	int index =3D (tlb_addr - mem->start) >> IO_TLB_SHIFT;
> @@ -574,6 +783,25 @@ static void swiotlb_copy(struct device *dev, phys_ad=
dr_t
> orig_addr,
>  	}
>  }
>=20
> +/**
> + * swiotlb_bounce() - copy the swiotlb buffer from or back to the origin=
al
> + * dma location
> + * @dev:	device which has mapped the buffer
> + * @tlb_addr:	physical address inside the bounce buffer
> + * @size:	size of the region to be copied
> + * @dir:	direction of the data transfer
> + *
> + * Copy data to or from a buffer of @size bytes starting at @tlb_addr.
> + */
> +static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, siz=
e_t size,
> +			   enum dma_data_direction dir)
> +{
> +	if (is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
> +		swiotlb_fixed_bounce(dev, tlb_addr, size, dir);
> +	else
> +		swiotlb_dyn_bounce(dev, tlb_addr, size, dir);
> +}
> +
>  static inline phys_addr_t slot_addr(phys_addr_t start, phys_addr_t idx)
>  {
>  	return start + (idx << IO_TLB_SHIFT);
> @@ -834,8 +1062,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *d=
ev,
> phys_addr_t orig_addr,
>  		return (phys_addr_t)DMA_MAPPING_ERROR;
>  	}
>=20
> -	tlb_addr =3D swiotlb_fixed_map(dev, orig_addr, alloc_size,
> -				     alloc_align_mask, attrs);
> +	tlb_addr =3D (phys_addr_t)DMA_MAPPING_ERROR;
> +	if (!is_swiotlb_for_alloc(dev))
> +		tlb_addr =3D swiotlb_dyn_map(dev, orig_addr, alloc_size,
> +					   alloc_align_mask, dir, attrs);
> +	if (tlb_addr =3D=3D (phys_addr_t)DMA_MAPPING_ERROR)
> +		tlb_addr =3D swiotlb_fixed_map(dev, orig_addr, alloc_size,
> +					     alloc_align_mask, attrs);
>=20
>  	if (tlb_addr =3D=3D (phys_addr_t)DMA_MAPPING_ERROR) {
>  		if (!(attrs & DMA_ATTR_NO_WARN))
> @@ -919,7 +1152,10 @@ void swiotlb_tbl_unmap_single(struct device *dev,
> phys_addr_t tlb_addr,
>  	    (dir =3D=3D DMA_FROM_DEVICE || dir =3D=3D DMA_BIDIRECTIONAL))
>  		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
>=20
> -	swiotlb_release_slots(dev, tlb_addr);
> +	if (is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
> +		swiotlb_release_slots(dev, tlb_addr);
> +	else
> +		swiotlb_dyn_unmap(dev, tlb_addr, dir);
>  }
>=20
>  void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_=
addr,
> @@ -1089,7 +1325,7 @@ bool swiotlb_free(struct device *dev, struct page *=
page,
> size_t size)
>  {
>  	phys_addr_t tlb_addr =3D page_to_phys(page);
>=20
> -	if (!is_swiotlb_buffer(dev, tlb_addr))
> +	if (!is_swiotlb_fixed(dev->dma_io_tlb_mem, tlb_addr))
>  		return false;
>=20
>  	swiotlb_release_slots(dev, tlb_addr);
> --
> 2.25.1

