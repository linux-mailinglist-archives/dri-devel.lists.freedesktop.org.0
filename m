Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A277E412E21
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 07:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9526E8F4;
	Tue, 21 Sep 2021 05:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A0B6E8F4;
 Tue, 21 Sep 2021 05:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG1DLmRmAJu7jaTTIqTRexcrZVpa/cTsdQs5rTtTCOLWP1vTW8nZhhdio3m+dAD9jUtnAnqOifryAaB+kLqIh8SBT+3SwnDtqImMXvpDO11YY9mEu0A7QeXoVGqxqjAuipGwVWUGXDw/8KXH35FTWc0IZymG23ivUbJOR2AZfTc9uojHkQVaFIMprYH+VNW7RPkcQe4bJx+4mWPoWeCHXbPEDaSKK5Nx5nC58LM93yIjy+7FEoAXOgFhTlXYgUfNLDPLr6xgh2S/3V81TziwdJD3BXiKo4NsTK5AAi136wqZYerk6CyOApKmhtUIRsmwoAvDW6nDeVs+Wd3O2/gJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=COCU5c3cXw8LNRE7ukk7dc/Zk+tWeqegeW4S/B8A2Y4=;
 b=DFDLr1y2yCNH8WT79AbwRjVCALybbwjN8lVcZi1RhsskjZBM035en7gqSb2vsGZHvtYwUGuYQUHm1jqR4oJDcvVhGYGnZzg8dJ4X7c5CcGLzYMIFsqqP2tuWI78BXZmP17z3qEVxPc23KIgqk99Q+/D29avzjdhn8Mq/9rsqQsyhwDbeXfOvxjF/tSzIJgZOQ/NEHm3eqfwsl14EqtfEJtc95vzvBQNw0vMUjOk+5tcyQyKIahvCQD+APanmgHbBk1uSo2kies5OOS3hi2O7xVXTs4o6zT+oC7xhVMLrTaFCzhLLDI2gPpEY9QOyupwDXpjyedZsHVy4BrIXzNxFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COCU5c3cXw8LNRE7ukk7dc/Zk+tWeqegeW4S/B8A2Y4=;
 b=o5DGK+hJyrjTl1IZEAwDePWfk6Hc3Ug8elwu78MJTg4gkMGAQiJHLnUArHRJsMW/lEhzkWpzLdPWv6m6J/mbau63WcbhXSohzFwnZRKZMXqflnvEqo48Kp1+34CQ+4wtH8e0Ueiuvg/0/PRDSUsoqoJFLDnoYE15TGiBWS1To7/d5QovL77M2RqYv13JToCu3JAXtu95zLzlpYbVeDMQl33XwCTP5CD18uhO1yAhK8zfBWPQwL9LltkoxX6q4TBt9hHzkVu/QJ9IHD9TBE3+Tc3iJ4jByXCSiCb2sw5jeB2iizf1jqvrRmKCVnq/wsSEiBF/7t97H+URrVZptYxpgg==
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by DM5PR1201MB0043.namprd12.prod.outlook.com (2603:10b6:4:57::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 05:14:30 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::b3) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 05:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 05:14:30 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 22:14:29 -0700
Received: from nvdebian.localnet (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 05:14:27 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, "Sierra Guiza, Alejandro (Alex)"
 <alex.sierra@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
Subject: Re: [PATCH v2 09/12] lib: test_hmm add module param for zone device
 type
Date: Tue, 21 Sep 2021 15:14:25 +1000
Message-ID: <2161903.HsYN06obEU@nvdebian>
In-Reply-To: <729f833c-e880-96ce-5f49-2d72a93faa21@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <2139200.KYAmxeAneQ@nvdebian> <729f833c-e880-96ce-5f49-2d72a93faa21@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6aceead-3bef-47b6-c7af-08d97cbeb128
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0043:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB004316AA32995E9F5C0ED460DFA19@DM5PR1201MB0043.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mS8SZmwd4UVXnrOa1Y54TU3oIn/cTG+EFKD5bXWhlaqAs9GTUnwRA8zU+EFDNd7bRXy1AUz0VayJZz6BS5m8wxbD3nl8LlYkiSfEk/102L7V8JTRIndNiTdl7CiO4aK+JZo/HW3Tf5MxiMN/LO08E4FNW0XcTJgIZ9iAJQK8W9Ukde18NuxQPsbgPGzCi5FUImv/Q2v4WPAPLwzSHD6cjN2on98Y7cVcxTyd1sLP4D0CsNE9FWN/5lYcTc/RpSo3sQsNjkw4dXVlH0TeqGuWVAa58t2zVIjoCckxPjuYhpC7bu7UhfJePKvG9qjHyOV4SD9MKJ3UCqvF6AxsHQOAxdg6aKurGXEi3rl1g8DsTKf4Tl9RWdyZhX0BVEuUlKTsgfNhSVnpKMfYg5UwHaF/bjeGtIeGyUn3p+e1bNL1bckufZ1IzI3VUODENe0opwOXV6YMHNm3udaOBdTTEcKI611l5xYDNKSbBHYWB2sSQW4fahPyjV2qSIwQkecaFwqxQpZIqudEnorOfb/ehdiJzlLxLhHkdG0EYVKu8xaFne9qtukuNCHB7eyWeE/bs7BTDmoM3zcOf20mjewbUU/MF/ltsXRxuiK/DYqM7B5+0Pjr8s9JIw4CVWiHzqjEd2uKZG65tM88/8F7RtAq925nJdAM3pWvuNk6Ogw+J0RxdtYZ22JfpUW4S5S83kGYie+SDQFYT0B8/tdcwyOsodiGI/ofe9hVvX8SFN+IaASFibE=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(356005)(26005)(7636003)(4326008)(53546011)(83380400001)(82310400003)(36860700001)(508600001)(16526019)(186003)(86362001)(8936002)(9686003)(110136005)(2906002)(33716001)(316002)(54906003)(70586007)(70206006)(7416002)(47076005)(9576002)(426003)(336012)(5660300002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 05:14:30.6433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aceead-3bef-47b6-c7af-08d97cbeb128
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0043
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

On Tuesday, 21 September 2021 6:05:30 AM AEST Sierra Guiza, Alejandro (Alex=
) wrote:
>=20
> On 9/20/2021 3:53 AM, Alistair Popple wrote:
> > On Tuesday, 14 September 2021 2:16:01 AM AEST Alex Sierra wrote:
> >> In order to configure device public in test_hmm, two module parameters
> >> should be passed, which correspond to the SP start address of each
> >> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
> >> private device type is configured.
> > It's a pity that testing this seems to require some amount of special s=
etup to
> > test. Is there a way this could be made to work on a more standard setup
> > similar to how DEVICE_PRIVATE is tested?
> Hi Alistair
> We tried to do it as simpler as possible. Unfortunately, there are two ma=
in
> requirements to register dev memory as DEVICE_PUBLIC type. This memory mu=
st
> NOT be accessed by any memory allocator (SLAB, SLOB, SLUB) plus, it has=20
> to be
> CPU coherently accessed.  We also want to avoid aliasing the same PFNs for
> different page types (regular system memory and DEVICE_PUBLIC). So we don=
't
> want the reserved memory to be part of the kernel's memory map before we=
=20
> call
> memremap_pages. A transparent way of doing it, without any special HW, was
> setting a portion of system memory as SPM (Special purpose memory). And u=
se
> this as our =E2=80=9Cdevice fake=E2=80=9D memory.

Ok, I think it's great that we can test this without special HW but the boot
time configuration is still a bit annoying. Would it be possible to allocate
memory fitting the above requirements by hot unplugging it with something l=
ike
offline_and_remove_memory()?

I also don't see why the DEVICE_PRIVATE and DEVICE_PUBLIC testing should be
mutually exclusive - why can't we test both without reloading the module?

 - Alistair

> Regards,
> Alex Sierra
>=20
> >
> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >> ---
> >> v5:
> >> Remove devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE at
> >> dmirror_allocate_chunk that was forcing to configure pagemap.type
> >> to MEMORY_DEVICE_PRIVATE
> >>
> >> v6:
> >> Check for null pointers for resource and memremap references
> >> at dmirror_allocate_chunk
> >>
> >> v7:
> >> Due to patch dropped from these patch series "kernel: resource:
> >> lookup_resource as exported symbol", lookup_resource was not longer a
> >> callable function. This was used in public device configuration, to
> >> get start and end addresses, to create pgmap->range struct. This
> >> information is now taken directly from the spm_addr_devX parameters and
> >> the fixed size DEVMEM_CHUNK_SIZE.
> >> ---
> >>   lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++------------=
=2D-
> >>   lib/test_hmm_uapi.h |  1 +
> >>   2 files changed, 47 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> >> index 3cd91ca31dd7..ef27e355738a 100644
> >> --- a/lib/test_hmm.c
> >> +++ b/lib/test_hmm.c
> >> @@ -33,6 +33,16 @@
> >>   #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
> >>   #define DEVMEM_CHUNKS_RESERVE		16
> >>  =20
> >> +static unsigned long spm_addr_dev0;
> >> +module_param(spm_addr_dev0, long, 0644);
> >> +MODULE_PARM_DESC(spm_addr_dev0,
> >> +		"Specify start address for SPM (special purpose memory) used for de=
vice 0. By setting this Generic device type will be used. Make sure spm_add=
r_dev1 is set too");
> >> +
> >> +static unsigned long spm_addr_dev1;
> >> +module_param(spm_addr_dev1, long, 0644);
> >> +MODULE_PARM_DESC(spm_addr_dev1,
> >> +		"Specify start address for SPM (special purpose memory) used for de=
vice 1. By setting this Generic device type will be used. Make sure spm_add=
r_dev0 is set too");
> >> +
> >>   static const struct dev_pagemap_ops dmirror_devmem_ops;
> >>   static const struct mmu_interval_notifier_ops dmirror_min_ops;
> >>   static dev_t dmirror_dev;
> >> @@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirror=
, struct hmm_dmirror_cmd *cmd)
> >>   	return ret;
> >>   }
> >>  =20
> >> -static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
> >> +static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
> >>   				   struct page **ppage)
> >>   {
> >>   	struct dmirror_chunk *devmem;
> >> -	struct resource *res;
> >> +	struct resource *res =3D NULL;
> >>   	unsigned long pfn;
> >>   	unsigned long pfn_first;
> >>   	unsigned long pfn_last;
> >> @@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmirro=
r_device *mdevice,
> >>  =20
> >>   	devmem =3D kzalloc(sizeof(*devmem), GFP_KERNEL);
> >>   	if (!devmem)
> >> -		return false;
> >> +		return -ENOMEM;
> >>  =20
> >> -	res =3D request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> >> -				      "hmm_dmirror");
> >> -	if (IS_ERR(res))
> >> -		goto err_devmem;
> >> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
> >> +		res =3D request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> >> +					      "hmm_dmirror");
> >> +		if (IS_ERR_OR_NULL(res))
> >> +			goto err_devmem;
> >> +		devmem->pagemap.range.start =3D res->start;
> >> +		devmem->pagemap.range.end =3D res->end;
> >> +		devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> >> +		mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> >> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
> >> +		devmem->pagemap.range.start =3D MINOR(mdevice->cdevice.dev) ?
> >> +							spm_addr_dev0 :
> >> +							spm_addr_dev1;
> >> +		devmem->pagemap.range.end =3D devmem->pagemap.range.start +
> >> +					    DEVMEM_CHUNK_SIZE - 1;
> >> +		devmem->pagemap.type =3D MEMORY_DEVICE_PUBLIC;
> >> +		mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
> >> +	} else {
> >> +		pr_err("Both spm_addr_dev parameters should be set\n");
> >> +	}
> >>  =20
> >> -	mdevice->zone_device_type =3D HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> >> -	devmem->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> >> -	devmem->pagemap.range.start =3D res->start;
> >> -	devmem->pagemap.range.end =3D res->end;
> >>   	devmem->pagemap.nr_range =3D 1;
> >>   	devmem->pagemap.ops =3D &dmirror_devmem_ops;
> >>   	devmem->pagemap.owner =3D mdevice;
> >> @@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmirro=
r_device *mdevice,
> >>   		mdevice->devmem_capacity =3D new_capacity;
> >>   		mdevice->devmem_chunks =3D new_chunks;
> >>   	}
> >> -
> >>   	ptr =3D memremap_pages(&devmem->pagemap, numa_node_id());
> >> -	if (IS_ERR(ptr))
> >> +	if (IS_ERR_OR_NULL(ptr)) {
> >> +		if (ptr)
> >> +			ret =3D PTR_ERR(ptr);
> >> +		else
> >> +			ret =3D -EFAULT;
> >>   		goto err_release;
> >> +	}
> >>  =20
> >>   	devmem->mdevice =3D mdevice;
> >>   	pfn_first =3D devmem->pagemap.range.start >> PAGE_SHIFT;
> >> @@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirror_=
device *mdevice,
> >>  =20
> >>   err_release:
> >>   	mutex_unlock(&mdevice->devmem_lock);
> >> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->p=
agemap.range));
> >> +	if (res)
> >> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->=
pagemap.range));
> >>   err_devmem:
> >>   	kfree(devmem);
> >>  =20
> >> @@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror_d=
evice *mdevice, int id)
> >>   	if (ret)
> >>   		return ret;
> >>  =20
> >> -	/* Build a list of free ZONE_DEVICE private struct pages */
> >> -	dmirror_allocate_chunk(mdevice, NULL);
> >> -
> >> -	return 0;
> >> +	/* Build a list of free ZONE_DEVICE struct pages */
> >> +	return dmirror_allocate_chunk(mdevice, NULL);
> >>   }
> >>  =20
> >>   static void dmirror_device_remove(struct dmirror_device *mdevice)
> >> @@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirror=
_device *mdevice)
> >>   				mdevice->devmem_chunks[i];
> >>  =20
> >>   			memunmap_pages(&devmem->pagemap);
> >> -			release_mem_region(devmem->pagemap.range.start,
> >> -					   range_len(&devmem->pagemap.range));
> >> +			if (devmem->pagemap.type =3D=3D MEMORY_DEVICE_PRIVATE)
> >> +				release_mem_region(devmem->pagemap.range.start,
> >> +						   range_len(&devmem->pagemap.range));
> >>   			kfree(devmem);
> >>   		}
> >>   		kfree(mdevice->devmem_chunks);
> >> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> >> index ee88701793d5..00259d994410 100644
> >> --- a/lib/test_hmm_uapi.h
> >> +++ b/lib/test_hmm_uapi.h
> >> @@ -65,6 +65,7 @@ enum {
> >>   enum {
> >>   	/* 0 is reserved to catch uninitialized type fields */
> >>   	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE =3D 1,
> >> +	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
> >>   };
> >>  =20
> >>   #endif /* _LIB_TEST_HMM_UAPI_H */
> >>
> >
> >
> >
>=20




