Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631434F408
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141916E0E5;
	Tue, 30 Mar 2021 22:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FB26E0D0;
 Tue, 30 Mar 2021 22:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRNrQA/Oi5cuxpS6HmpV7zRHg8xejT9dEb7ORSNVhXprXqcv052wfsuN+eMva+0nsxG1G8ADYlfPuTt1/WyHTy+qTGyeED5zzkmyt5bc/oQR3odOXoktBy9mfLnH5AZ+2BHF9UoykT0EvAQ30OAKGlkUCWfFe3bezrkm5LGLfdmbLxgpTyBm/VbNEZu/+nXEhtdAwe2OUGA6jT91BCs40myyykdYotvjWaHFNxiE2d2xlFSheVV0x1xXP6n+5Q10FrroRtYh+j5GJWRT4pa29g9aAce6j+xopZ9Br7tUj/FaV2B3abRDa7202djRW0FwWDScPyibwyksoM978IYtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ1JAfsJORwWdshubQnbDAwf1W6d2RocMsXTaMqmGiw=;
 b=JpGVVuDjJLXPJlDqHdbbL9C2J6CdrP6yZ1h7z5XwUcxk3iYLjWa0FbmiRZCIvrOB8L59uPbNRevrYkxeeCq7jQfVg+aQg273LA+1W5t9qXO+HajNX/9i0Nv9QrOW5smEN2YrvDBBELTbXuRuDH8GIxsZBRgs0ExidyVWDFDnVr2eM3lg38tqBHfcNRfeSEP7b/OQwZQQp/p6YgH9kK8UkFUnI7f9glyk8JDhtelDUyfCS6vf1YErRZrKOIFpvy9M6IO2mGsYLWaTn44eLFKuuNky9sC1s8a88xqEMQXqkvFYXjfHQpglrHQxl1zIKzEtcG65NdrCAWuKhlMWW5ysBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ1JAfsJORwWdshubQnbDAwf1W6d2RocMsXTaMqmGiw=;
 b=TVuLXsKf1qR3Q9oTlVGt4WJj9f0czS75gGJXWHc1Jg1y5CJ7M2jWR07CjDmIKFaJUET08ZJns0m0xrmkXT8CKxOZnKf6q3Pnmp1XUFFuRM+I7992PgPvbCGRWnG+f1qux3BjkxIkhq7LvYA+GsvDe+g9r24G1Z3Iugxj0OCMs2i8ecrsv/IPLtMownnGY8OdO54Ksn80geJEaMUtMa/PxO6LJ2K80YRxbpkYOAvT0xFUUOGD3X9TgjEdxPtZGAsJbDtw6gCD49MDu/vbJMXE9kSdrhwkTSshI+XQMx95Th4ePtxOAIC/mtxhs2QbgzuCFLI5oE5/ra3OXlNDZQIlMQ==
Received: from MW3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:303:2b::14)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 22:09:37 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::1) by MW3PR05CA0009.outlook.office365.com
 (2603:10b6:303:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Tue, 30 Mar 2021 22:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 30 Mar 2021 22:09:36 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 22:09:32 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 31 Mar 2021 09:09:30 +1100
Message-ID: <12442194.rtmf8Ope3M@nvdebian>
In-Reply-To: <20210330184903.GZ2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-4-apopple@nvidia.com>
 <20210330184903.GZ2356281@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03d9d71-c8cc-4dcf-0833-08d8f3c88152
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:
X-Microsoft-Antispam-PRVS: <BN9PR12MB527314172FA5E3CFCEC7BC17DF7D9@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96AaGFDMJi2edGAm/6hBmrLBfuI7h8DjfKUBnB1BDvUDzk5XqOBUg9XLzTm1umd9/BjcyIjia3mHPrIdt1/1n0GrjvPB3u8g4EXRCiMMzfhhzv3ZRR54EncpfXA5gDK7En1JbIFRCmi7oYVLQVVWuROrcgVT1E2dVUZmhWlhhmGk0bz3mKqhjj4XdReApwHEpVSqh2VFD8zF50OMsJJhmnn7ZGkuQwOMnj0bzzDgyq/vM69bjB49tPf02VkgzNXAqSRMx55A5TduW8Ey4BrRJualzYLd3x5dW7PnnpPDLjiysAOhGD44LV3gRi3Z523UAhBsbHwldbDjgDF8sqOr8TwzHUfJhkm88EGL78rkzuobONpLtAVL/y2W1DZG7CW2NLn/TogNkSLXddqyD6ZAXq1zNrukPkq0nNtiKZlgr3hKyIoVJ5PXJtN8UxEBeeIn+kBRFastWTH3wy7lWPeckbx1wVhaObDST7w5hkvMVXkp/7Fn0YpBwuhqDRABcSEx/Lw5y9sIfV/rCFuP31GBOeyuPOQuYcnbB/of4pMmxTXNtqKUS5LxbupR5D6QOoImmynWKxsi4TYujOsBBDZgDa+3nTkUKrRdMrmM0/6piuMbgaX2yAKOF5QBxE6yZU5LiSMRGCoRRdHxcqSEPffX5BDO1hvmzB/guMZKImh8pAERB8iX2ePeDA0+GsqP8fIU
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(16526019)(4326008)(9686003)(26005)(83380400001)(33716001)(186003)(336012)(356005)(7636003)(86362001)(316002)(6636002)(6862004)(82740400003)(7416002)(8676002)(478600001)(54906003)(36860700001)(47076005)(36906005)(5660300002)(8936002)(82310400003)(70206006)(2906002)(70586007)(426003)(9576002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:09:36.0451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03d9d71-c8cc-4dcf-0833-08d8f3c88152
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 5:49:03 AM AEDT Jason Gunthorpe wrote:
> On Fri, Mar 26, 2021 at 11:08:00AM +1100, Alistair Popple wrote:
> 
> > +static bool try_to_munlock_one(struct page *page, struct vm_area_struct 
*vma,
> > +		     unsigned long address, void *arg)
> > +{
> 
> Is this function name right?

Perhaps. This is called from try_to_munlock() hence the name, but see below 
for some commentary on that naming.

> > +	struct page_vma_mapped_walk pvmw = {
> > +		.page = page,
> > +		.vma = vma,
> > +		.address = address,
> > +	};
> > +
> > +	/* munlock has nothing to gain from examining un-locked vmas */
> > +	if (!(vma->vm_flags & VM_LOCKED))
> > +		return true;
> > +
> > +	while (page_vma_mapped_walk(&pvmw)) {
> > +		/* PTE-mapped THP are never mlocked */
> > +		if (!PageTransCompound(page)) {
> > +			/*
> > +			 * Holding pte lock, we do *not* need
> > +			 * mmap_lock here
> > +			 */
> > +			mlock_vma_page(page);
> 
> Because the only action this function seems to take is to call
> *mlock*_vma_page()
> 
> > +		}
> > +		page_vma_mapped_walk_done(&pvmw);
> > +
> > +		/* found a mlocked page, no point continuing munlock check */
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  /**
> >   * try_to_munlock - try to munlock a page
> >   * @page: the page to be munlocked
> > @@ -1796,8 +1821,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags 
flags)
> >  void try_to_munlock(struct page *page)
> >  {
> 
> But this is also called try_to_munlock ??

As far as I can tell this has always been called try_to_munlock() even though 
it appears to do the opposite.

> /**
>  * try_to_munlock - try to munlock a page
>  * @page: the page to be munlocked
>  *
>  * Called from munlock code.  Checks all of the VMAs mapping the page
>  * to make sure nobody else has this page mlocked. The page will be
>  * returned with PG_mlocked cleared if no other vmas have it mlocked.
>  */

In other words it sets PG_mlocked if one or more vmas has it mlocked. So 
try_to_mlock() might be a better name, except that seems to have the potential 
for confusion as well because it's only called from the munlock code path and 
never for mlock.

> So what clears PG_mlocked on this call path?

See munlock_vma_page(). munlock works by clearing PG_mlocked, then calling 
try_to_munlock to check if any VMAs still need it locked in which case 
PG_mlocked gets set again. There are no other callers of try_to_munlock().

> Something needs attention here..

I think the code is correct, but perhaps the naming could be better. Would be 
interested hearing any thoughts on renaming try_to_munlock() to try_to_mlock() 
as the current name appears based on the context it is called from (munlock) 
rather than what it does (mlock).

 - Alistair

> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
