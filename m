Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15A4B031E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 03:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81610E3C8;
	Thu, 10 Feb 2022 02:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C36210E417;
 Thu, 10 Feb 2022 02:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izrrKvUCUPnHOXPOPiby3Z+WmB4eCIGuADi6NZqqGpHL38BnsrSK5U6EhrkSeUKIlwr7H+X2WF/h773GK11MItaVi2gByPaQZz4ESLb4+RIiwG2Pwp59V1F4vuLtNpjBa3UzeBMIyu4Arho67FvFrieTgVmSUumq0dujCjFxeWwbLaKR1jDI0hCIByM55JougUtZxf5v7BpA+l7K0eFSV3yaydwR7oxF2ujUB8uRVgNMtRflNnEVVDScgxl3P1JkCB3Ajohqf8rlNT7GQWvIAsEhtDrX3cS3Fv0ZBgj30L5c7RKUNucHjjGEKfPAwlZOuKnh7lK6mfo8OsJ9gjlznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5hxNW+rRpX9UCXoSoQTQgCB4ZjKNsGvkZ7wisZKC4w=;
 b=jUY+CaxLEpBnoll4pDISpkhVDUjEhnfvrLCandubYE26QC3EOLHOK7T79BW3uBLBsj0aJ2RH8Z0dsLO4yLwL4EO1KfOjAHxqFMwBPPEAc4w3U5JqPYmbOQkvpY9PDZkWgCxP0Uetesf7wnhRTxWWJMR4hQNRaBymQGhvnkpNiy83rZE8DHv7zakCWsR/VgH8vcY7neomtUYmB7Fq42ZS4WBkCxnWP9IR78WqSa5OchB/wB9o32sKDcZklvdCf7YBb1kxsCHUDsvoJ0FvBtRT4khfKjUZ9B5Ywp7EV9ZkRmxVWbBZQj8n48ErdmnBoEvzQB9xATtsyis+qjC8yDfUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5hxNW+rRpX9UCXoSoQTQgCB4ZjKNsGvkZ7wisZKC4w=;
 b=ql7BRuNQZSFG3puyM9p310yE3QqIkDtxyIzN8wXd+GyZSAL6XRENAs4JOao1ZES3utRwsTlWWP7zkR4svIYGNErtGqTEe9CcjejfPsb/wYAZP9aGE8xtNAgVRW7gMsvhhrGRG9lhym/bJmCcT7iyt4wMd5l3OglpSzcPV+BjMQF5Vd8qsIrlzWVDN3bn96S48kwUdD1W0ENmqw+jMx0+3wy2HunTB9r0E3wQT0RSaRj8M6hkq4TueNrDeqGAINyiaGkYpv78tifM9vYebnk8oOZjdYf5SIHhCepvjCv93Fa/Ry1dU1TkSrPftnub1580+s6XeiFWuaJ8b5oGaKbxyw==
Received: from MWHPR12CA0046.namprd12.prod.outlook.com (2603:10b6:301:2::32)
 by DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Thu, 10 Feb
 2022 02:10:56 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::b1) by MWHPR12CA0046.outlook.office365.com
 (2603:10b6:301:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 02:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 02:10:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 02:10:55 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 18:10:49 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
Date: Thu, 10 Feb 2022 13:10:47 +1100
Message-ID: <2168128.7o4XcKHI9n@nvdebian>
In-Reply-To: <20220209174836.GA24864@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
 <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
 <20220209174836.GA24864@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d7c9cef-e13c-4599-f916-08d9ec3a92b3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5771:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5771A3DA99602901A43AB242DF2F9@DM4PR12MB5771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9I3ue4yOTo/aDrX4T/6qYaFHwHIROxSDV7jcSGlX9W9v01YCFuovfgcJ6mMTXOtfIaSIpq9sqFgHSUovSLfWJBAXo5ykfynQ3T87VRcfZho9GeoA39NbQEnl9yXQplcQCzdoO56EwLIw+4pvVqoOcQpWcUUhA60hqQxAKOuN6Uqs5XdbD0bdcaokr/qxvk3wwbtoFO1TAk3h6jsLo63WNnjZsux207gyMdVaxkuz3xdhnvOpLwHnv9UVP2iPW/SQVhuv4K2LtJhyABpgKSbPQyKGdaExWLMJGKwEozW8GE0C/Y/2b1nfMxGHB6w3iw/7Hs4AVZGvdEn84HsLsa6ZDe+WW6EBCNfcPce7Z5oVjZiFHoh17ik9RC9LEkzfAMivPg1oQKHc0iNGbY5agwtkSTVMRSYbsaSTAVAd/ARLnNTOnjHsdoPnwdr+K85rZy7mbYoigFBTZR7oFL/yt4LJccbh+sN66y9qRuXN+nI8tG9bfecNGv7isqjwW0z7q+vdhj1GbkGPbcGceyIgQLseAZa5NMSvLAymYpCcBYqtNWnYvaQQ6Z+x5coZJB28XiP1VeR7TjpRxeO1ICVRuL5ESipA4bdM12dHm3uU03FTjH5pU5DjW6wzB9c0yRR2Kt6tqjxkuXqDe3jR1JpjEjFf1hG5gyM4p+eIn8syFDDObRMYuA/CaCifLx7uQaiyorW8LCGz25r8CiDsuOTUEoe4xG7oy5oHqZsFUP/bJqG9a8RZm4egPlsB8znVvZ4mUU8CAeEW/HdzZPt/rNmNEko4c7AKp5AKaiKvMP0IrV+goKVJMGyV2bIL/oShq64c8yKGPUyZSxQ9jpi10dkKIQevng==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(508600001)(316002)(33716001)(966005)(54906003)(40460700003)(9686003)(47076005)(8936002)(8676002)(2906002)(336012)(426003)(4326008)(82310400004)(16526019)(9576002)(36860700001)(186003)(26005)(356005)(5660300002)(7416002)(70586007)(86362001)(81166007)(70206006)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 02:10:56.2068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7c9cef-e13c-4599-f916-08d9ec3a92b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 10 February 2022 4:48:36 AM AEDT Christoph Hellwig wrote:
> On Mon, Feb 07, 2022 at 04:19:29PM -0500, Felix Kuehling wrote:
> >
> > Am 2022-02-07 um 01:32 schrieb Christoph Hellwig:
> >> Move the check for the actual pgmap types that need the free at refcount
> >> one behavior into the out of line helper, and thus avoid the need to
> >> pull memremap.h into mm.h.
> >>
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > The amdkfd part looks good to me.
> >
> > It looks like this patch is not based on Alex Sierra's coherent memory 
> > series. He added two new helpers is_device_coherent_page and 
> > is_dev_private_or_coherent_page that would need to be moved along with 
> > is_device_private_page and is_pci_p2pdma_page.
> 
> FYI, here is a branch that contains a rebase of the coherent memory
> related patches on top of this series:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/pgmap-refcount
> 
> I don't have a good way to test this, but I'll at least let the build bot
> finish before sending it out (probably tomorrow).

Thanks, I ran up hmm-test which revealed a few minor problems with the rebase.
Fixes below.

---

diff --git a/mm/gup.c b/mm/gup.c
index cbb49abb7992..8e85c9fb8df4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2007,7 +2007,6 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
-	ret = 0;
 unpin_pages:
 	for (i = 0; i < nr_pages; i++)
 		if (!pages[i])
diff --git a/mm/migrate.c b/mm/migrate.c
index f909f5a92757..1ae3e99baa50 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2686,12 +2686,11 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 			swp_entry = make_readable_device_private_entry(
 						page_to_pfn(page));
 		entry = swp_entry_to_pte(swp_entry);
-	} else {
-		if (is_zone_device_page(page) &&
-		    is_device_coherent_page(page)) {
+	} else if (is_zone_device_page(page) &&
+		    !is_device_coherent_page(page)) {
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
-		}
+	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
 		if (vma->vm_flags & VM_WRITE)
 			entry = pte_mkwrite(pte_mkdirty(entry));



