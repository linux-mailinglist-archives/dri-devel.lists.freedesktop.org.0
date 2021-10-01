Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD841E583
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 02:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FABF6E47A;
	Fri,  1 Oct 2021 00:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53A86E47A;
 Fri,  1 Oct 2021 00:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYU8Ng+ZU81OKXKRcEFTd8teuc5oKYAn/xZ9yyxP/g+oRjykxxwysCZ+Hc9OJXNQdyX8D187cgZZrKDRspcPCwEerNUDvTovAQY4cRFDomDNUDKqp0KMaoZMvSAPTfYo653XHErG1U5W7KlnTtc4QmnTEAIIFH3AqxBi3anCX9ov4Pkaw+GgMeI8CQi0N8n+NKZoCCSrNWQ5TDU0LOCE+Aj8CgavMJCkEP6/qOEd0oEcR91W47sxMf5hAe8jYuU+psu5QNyl3GwYed1VO2jtwXZDutnydMmDONWdebqVur+fZToYPQmiripOIl1bSKrr+ps3r7tEOZdVkS5Zlymv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adOK+0NP9k8+yumGlRX0jNce62EZ/yMR9tdT0UrW+Nc=;
 b=byyHwIYqUH/3OGZDojwjZulyBQTg0d3EIquKcTL89h58sJBA0S+iuhyZfje7M3w2KLlUdtitGN+xOu08NUaqj+0K5BPX4oXENbc3vVtjbPe+6QSXgEMQLrelrWcD57R5p/N56yShi+MVb+b4OAKV+r94XUTQU+SYusuyndBhE8YdpBQ/XH0BpxNvz4lz46zAHQgBDCZLN76qkaUPL/71Wy/CGMxAPBIlpwwDqi0DSGsoe5F9Brql/z1bJp3P2cE/gnkkZY3zOKgvML12juLE/vNwgzXAENEPH/8qHeq0HC9kkEjAMyWT+ummCrcssSaTcgYgHKNNvLMdzGyVpSJeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adOK+0NP9k8+yumGlRX0jNce62EZ/yMR9tdT0UrW+Nc=;
 b=WstwwbJ9rn82ut02caZuzrcnYK5e9d0mWlQSDpVNT41uovf3jdytL0lxn873Of/+Fx/guZlZI4VpNrqi7Jt+pFrt48MNKCT9R4aUaRYC/9DH2xjAGKLh1kHkyVQhrAwVCjtMALTFy9JqCj+TfuOIEXFb9tMVuqP2rcQ79//2UJIxjxPdePfnfJyKJavM03sQFSLFTJStJArtHuilQYP3reUxoMVZk8XKW0dQCOsNGjzFv9BhWSxbifVJHIczpPdzdhK0oESu55Xf+nqXrTQnF0FXyDarfnrhP1kKWv3SfbL3f0EGsNaj0OskPz+KbwJ7qKsXX43DZuGhiSeG7vTwdg==
Received: from BN6PR2001CA0023.namprd20.prod.outlook.com
 (2603:10b6:404:b4::33) by SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 00:28:42 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::40) by BN6PR2001CA0023.outlook.office365.com
 (2603:10b6:404:b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 00:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 00:28:42 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct
 2021 00:28:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, "Sierra Guiza, Alejandro (Alex)"
 <alex.sierra@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
Subject: Re: [PATCH v2 09/12] lib: test_hmm add module param for zone device
 type
Date: Fri, 1 Oct 2021 10:28:36 +1000
Message-ID: <5733707.7NG8XZRkRI@nvdebian>
In-Reply-To: <30468c52-62b6-1af8-07dd-e9be766b6b77@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <2161903.HsYN06obEU@nvdebian> <30468c52-62b6-1af8-07dd-e9be766b6b77@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b18f2f1-9d81-4fb9-b374-08d984726c11
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:
X-Microsoft-Antispam-PRVS: <SN6PR12MB4752C3AE08E37E5628C895EEDFAB9@SN6PR12MB4752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tl/mPGYUIe/w9Ywkui8vgvS5ssA63kw+AFd3V+2OyscyrW18qSClhCSVGtbB+9Awy6wf4Uz64nbD7s2TRx3JfGG6GBl2Eo6ZQmWaiBEUPQxlCgwYD2hrHctVNTp1CRNV94c0KF/0XN6QYiWMHbjH8nzGkT6WR2KsxPPw55XYZT6ii28Jp1Hs4Cxyhl6nx+3nHZVlVD+3VXiefhnxejU7GMzdx15iN0edBe608mi7ovP09ABzLM34NqF0t5ikorpw+onDrEtlKIPBEF6F9Dx6EiyIg3B4i3DnkiZNFz6TgYgBwdOb/YQdLSgJNkLiNb/AL+OQcyWFzSATSo5R9JGHGz51XGwr91Xl/2OcOJ8Rz3n5vKfNsflRnqlEiLpk2sl62PmB6YDB9GkZtxEFNim+zhm4/SnJV6CGwcATCjq795UEeWugdb7bhhyyYmp+0HVXy0fuxnQP6TVHeDq5OaviM4wc+pxjN9ms/5f94xxPZnJ/nNY9wspy2p6MhpBS22h22DkXfoguYKzAqkniVENVKgQkEOQeF4NGvBk+LUrffSQGRH93OSgg1EOBs9jEoyEfHrYmpoI1TFQ4Th7Edau9mW4E096fvzFSkCaMMfDCUDxNo8eAgd+5hsBYdzE9r5uVSnsPmZaBiujXYQpS4ILmC0yiWyyi0V/73qJ3Yx4OehDWmUi6U7FuXTbVTaCLxe1p/tsXAYOw2+7e+pdtBagOPtWtnjKfNOtssTWL1pvY+g=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(4326008)(7416002)(36860700001)(47076005)(33716001)(9576002)(9686003)(426003)(356005)(86362001)(53546011)(7636003)(26005)(5660300002)(8676002)(83380400001)(54906003)(186003)(70586007)(70206006)(508600001)(8936002)(16526019)(2906002)(316002)(82310400003)(110136005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 00:28:42.1624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b18f2f1-9d81-4fb9-b374-08d984726c11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4752
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

On Friday, 24 September 2021 1:52:47 AM AEST Sierra Guiza, Alejandro (Alex)=
 wrote:
>=20
> On 9/21/2021 12:14 AM, Alistair Popple wrote:
> > On Tuesday, 21 September 2021 6:05:30 AM AEST Sierra Guiza, Alejandro (=
Alex) wrote:
> >> On 9/20/2021 3:53 AM, Alistair Popple wrote:
> >>> On Tuesday, 14 September 2021 2:16:01 AM AEST Alex Sierra wrote:
> >>>> In order to configure device public in test_hmm, two module paramete=
rs
> >>>> should be passed, which correspond to the SP start address of each
> >>>> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passe=
d,
> >>>> private device type is configured.
> >>> It's a pity that testing this seems to require some amount of special=
 setup to
> >>> test. Is there a way this could be made to work on a more standard se=
tup
> >>> similar to how DEVICE_PRIVATE is tested?
> >> Hi Alistair
> >> We tried to do it as simpler as possible. Unfortunately, there are two=
 main
> >> requirements to register dev memory as DEVICE_PUBLIC type. This memory=
 must
> >> NOT be accessed by any memory allocator (SLAB, SLOB, SLUB) plus, it has
> >> to be
> >> CPU coherently accessed.  We also want to avoid aliasing the same PFNs=
 for
> >> different page types (regular system memory and DEVICE_PUBLIC). So we =
don't
> >> want the reserved memory to be part of the kernel's memory map before =
we
> >> call
> >> memremap_pages. A transparent way of doing it, without any special HW,=
 was
> >> setting a portion of system memory as SPM (Special purpose memory). An=
d use
> >> this as our =E2=80=9Cdevice fake=E2=80=9D memory.
> > Ok, I think it's great that we can test this without special HW but the=
 boot
> > time configuration is still a bit annoying. Would it be possible to all=
ocate
> > memory fitting the above requirements by hot unplugging it with somethi=
ng like
> > offline_and_remove_memory()?
> > I also don't see why the DEVICE_PRIVATE and DEVICE_PUBLIC testing shoul=
d be
> > mutually exclusive - why can't we test both without reloading the modul=
e?
> You could do both DEVICE_PRIVATE and DEVICE_PUBLIC tests by running the=20
> test_hmm_sh
> script twice, just passing the proper parameters. Even when you booted=20
> with fake EFI SP
> regions. If spm_address_dev0/1 parameters are passed, the module gets=20
> configured with
> DEVICE_PUBLIC type. Otherwise DEVICE_PRIVATE type is set. Technically=20
> the only
> complication in testing DEVICE_PUBLIC is the fake SPM boot parameter.

Or you could just have the test specify what sort of memory it wants to use
(DEVICE_PRIVATE or DEVICE_GENERIC). That seems preferable to requiring a mo=
dule
reload. A module reload also makes it impossible to test interactions betwe=
en
DEVICE_PRIVATE and DEVICE_GENERIC memory.

 - Alistair

> Alex Sierra
> >
> >   - Alistair
> >
> >> Regards,
> >> Alex Sierra
> >>
> >>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >>>> ---
> >>>> v5:
> >>>> Remove devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE at
> >>>> dmirror_allocate_chunk that was forcing to configure pagemap.type
> >>>> to MEMORY_DEVICE_PRIVATE
> >>>>
> >>>> v6:
> >>>> Check for null pointers for resource and memremap references
> >>>> at dmirror_allocate_chunk
> >>>>
> >>>> v7:
> >>>> Due to patch dropped from these patch series "kernel: resource:
> >>>> lookup_resource as exported symbol", lookup_resource was not longer a
> >>>> callable function. This was used in public device configuration, to
> >>>> get start and end addresses, to create pgmap->range struct. This
> >>>> information is now taken directly from the spm_addr_devX parameters =
and
> >>>> the fixed size DEVMEM_CHUNK_SIZE.
> >>>> ---
> >>>>    lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++---------=
=2D----
> >>>>    lib/test_hmm_uapi.h |  1 +
> >>>>    2 files changed, 47 insertions(+), 20 deletions(-)
> >>>>
> >>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> >>>> index 3cd91ca31dd7..ef27e355738a 100644
> >>>> --- a/lib/test_hmm.c
> >>>> +++ b/lib/test_hmm.c
> >>>> @@ -33,6 +33,16 @@
> >>>>    #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
> >>>>    #define DEVMEM_CHUNKS_RESERVE		16
> >>>>   =20
> >>>> +static unsigned long spm_addr_dev0;
> >>>> +module_param(spm_addr_dev0, long, 0644);
> >>>> +MODULE_PARM_DESC(spm_addr_dev0,
> >>>> +		"Specify start address for SPM (special purpose memory) used for =
device 0. By setting this Generic device type will be used. Make sure spm_a=
ddr_dev1 is set too");
> >>>> +
> >>>> +static unsigned long spm_addr_dev1;
> >>>> +module_param(spm_addr_dev1, long, 0644);
> >>>> +MODULE_PARM_DESC(spm_addr_dev1,
> >>>> +		"Specify start address for SPM (special purpose memory) used for =
device 1. By setting this Generic device type will be used. Make sure spm_a=
ddr_dev0 is set too");
> >>>> +
> >>>>    static const struct dev_pagemap_ops dmirror_devmem_ops;
> >>>>    static const struct mmu_interval_notifier_ops dmirror_min_ops;
> >>>>    static dev_t dmirror_dev;
> >>>> @@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirr=
or, struct hmm_dmirror_cmd *cmd)
> >>>>    	return ret;
> >>>>    }
> >>>>   =20
> >>>> -static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
> >>>> +static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
> >>>>    				   struct page **ppage)
> >>>>    {
> >>>>    	struct dmirror_chunk *devmem;
> >>>> -	struct resource *res;
> >>>> +	struct resource *res =3D NULL;
> >>>>    	unsigned long pfn;
> >>>>    	unsigned long pfn_first;
> >>>>    	unsigned long pfn_last;
> >>>> @@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmir=
ror_device *mdevice,
> >>>>   =20
> >>>>    	devmem =3D kzalloc(sizeof(*devmem), GFP_KERNEL);
> >>>>    	if (!devmem)
> >>>> -		return false;
> >>>> +		return -ENOMEM;
> >>>>   =20
> >>>> -	res =3D request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> >>>> -				      "hmm_dmirror");
> >>>> -	if (IS_ERR(res))
> >>>> -		goto err_devmem;
> >>>> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
> >>>> +		res =3D request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZ=
E,
> >>>> +					      "hmm_dmirror");
> >>>> +		if (IS_ERR_OR_NULL(res))
> >>>> +			goto err_devmem;
> >>>> +		devmem->pagemap.range.start =3D res->start;
> >>>> +		devmem->pagemap.range.end =3D res->end;
> >>>> +		devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> >>>> +		mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> >>>> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
> >>>> +		devmem->pagemap.range.start =3D MINOR(mdevice->cdevice.dev) ?
> >>>> +							spm_addr_dev0 :
> >>>> +							spm_addr_dev1;
> >>>> +		devmem->pagemap.range.end =3D devmem->pagemap.range.start +
> >>>> +					    DEVMEM_CHUNK_SIZE - 1;
> >>>> +		devmem->pagemap.type =3D MEMORY_DEVICE_PUBLIC;
> >>>> +		mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
> >>>> +	} else {
> >>>> +		pr_err("Both spm_addr_dev parameters should be set\n");
> >>>> +	}
> >>>>   =20
> >>>> -	mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> >>>> -	devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> >>>> -	devmem->pagemap.range.start =3D res->start;
> >>>> -	devmem->pagemap.range.end =3D res->end;
> >>>>    	devmem->pagemap.nr_range =3D 1;
> >>>>    	devmem->pagemap.ops =3D &dmirror_devmem_ops;
> >>>>    	devmem->pagemap.owner =3D mdevice;
> >>>> @@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmir=
ror_device *mdevice,
> >>>>    		mdevice->devmem_capacity =3D new_capacity;
> >>>>    		mdevice->devmem_chunks =3D new_chunks;
> >>>>    	}
> >>>> -
> >>>>    	ptr =3D memremap_pages(&devmem->pagemap, numa_node_id());
> >>>> -	if (IS_ERR(ptr))
> >>>> +	if (IS_ERR_OR_NULL(ptr)) {
> >>>> +		if (ptr)
> >>>> +			ret =3D PTR_ERR(ptr);
> >>>> +		else
> >>>> +			ret =3D -EFAULT;
> >>>>    		goto err_release;
> >>>> +	}
> >>>>   =20
> >>>>    	devmem->mdevice =3D mdevice;
> >>>>    	pfn_first =3D devmem->pagemap.range.start >> PAGE_SHIFT;
> >>>> @@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirro=
r_device *mdevice,
> >>>>   =20
> >>>>    err_release:
> >>>>    	mutex_unlock(&mdevice->devmem_lock);
> >>>> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem-=
>pagemap.range));
> >>>> +	if (res)
> >>>> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem=
=2D>pagemap.range));
> >>>>    err_devmem:
> >>>>    	kfree(devmem);
> >>>>   =20
> >>>> @@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror=
_device *mdevice, int id)
> >>>>    	if (ret)
> >>>>    		return ret;
> >>>>   =20
> >>>> -	/* Build a list of free ZONE_DEVICE private struct pages */
> >>>> -	dmirror_allocate_chunk(mdevice, NULL);
> >>>> -
> >>>> -	return 0;
> >>>> +	/* Build a list of free ZONE_DEVICE struct pages */
> >>>> +	return dmirror_allocate_chunk(mdevice, NULL);
> >>>>    }
> >>>>   =20
> >>>>    static void dmirror_device_remove(struct dmirror_device *mdevice)
> >>>> @@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirr=
or_device *mdevice)
> >>>>    				mdevice->devmem_chunks[i];
> >>>>   =20
> >>>>    			memunmap_pages(&devmem->pagemap);
> >>>> -			release_mem_region(devmem->pagemap.range.start,
> >>>> -					   range_len(&devmem->pagemap.range));
> >>>> +			if (devmem->pagemap.type =3D=3D MEMORY_DEVICE_PRIVATE)
> >>>> +				release_mem_region(devmem->pagemap.range.start,
> >>>> +						   range_len(&devmem->pagemap.range));
> >>>>    			kfree(devmem);
> >>>>    		}
> >>>>    		kfree(mdevice->devmem_chunks);
> >>>> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> >>>> index ee88701793d5..00259d994410 100644
> >>>> --- a/lib/test_hmm_uapi.h
> >>>> +++ b/lib/test_hmm_uapi.h
> >>>> @@ -65,6 +65,7 @@ enum {
> >>>>    enum {
> >>>>    	/* 0 is reserved to catch uninitialized type fields */
> >>>>    	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE =3D 1,
> >>>> +	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
> >>>>    };
> >>>>   =20
> >>>>    #endif /* _LIB_TEST_HMM_UAPI_H */
> >>>>
> >>>
> >>>
> >
> >
> >
>=20




