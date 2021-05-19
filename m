Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9D388CE5
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014A26E1B7;
	Wed, 19 May 2021 11:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC206E1B7;
 Wed, 19 May 2021 11:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJdOuKJgkt2AxFELWVjV922sdRIV5EKiKo3L3OVVQDoNxNJ8HpNfDRC6G3nj29mdmKLQDoRid1emLuOFtHrct9MeMdeaq/mSdeOlN2uzm+nZwdO3mnEdVrmL4s1Co5ZQV36essMrA6oKaclaYiHdyBvbvB3hw2bh/a/CTAIWncrdBbQegQGt/sRx9HFQdZKRGFpERG3SrmHqsCnMKJMqcQPGS1plkQvZc21iqibv5nENe6TfdAD3KiiUuPVJu6makXwdckbDkOINttX8wUYBLfNoFLHP8pk3t8eWNEYspVdasVGwETkYBpEkp4Zto+cs2ayEYCIY7zjqsQ4TLSLjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6CQ8755svoCY2YPzo7oiuSSdcZXJ08tTxYmaeR7asI=;
 b=ay7Us3y8jMpJQuJOKFcoB8g//sGOwMkBGx+Vmwn8BT9MWjJuCenCJ7YJL520h12bNhLkO3GHNc80/gCNd6WMneF/Hli2/hoQrcR65l9ZZu+gJJt/7sTKr4JliPZA8xxwFEK/42Vaht8PP+bfKlXt/rJtGyiq+3Bgx/8M/XkNzkYfGXCk0CbejbJ7suhdtExyP3+wCwX8fxiJp9QEcpqQYRkusqqScII3ubsHlc/PFbsjODkj2prhkL+u76A5PxAoCgG9veCX97UqMfjnx+O3yABGKGkXdj7PtbNCMK6GXd2lEde3J8P5Iop6uzixuWFT9RjDJYOMxZJiIGrSKENHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6CQ8755svoCY2YPzo7oiuSSdcZXJ08tTxYmaeR7asI=;
 b=by/wMgPtjZALmJA9/n94mno2jV65Y8VWuRQ/4yWsH+1SUmi+GbymPZyCnBsSh2rZlQa6i2CWJemu5LDWq5ytsByzDxhEzYAaz6cC9OZFwJX4KQo/YPlM4yxs7g86Wf4vIE4BfmredPIo5wHfP7ktwXRneG9QZKlKqdgrgQ468ZCjtowELXWGtURgWy9aIDtdDRxNxFMDZg+bbCafS7RIcB1fGNgO+36CX58GVKva3Xzqkyje6dBIgdHV6khvKbjxQWc511J43BXqbeLLy3bM9BlxuzGpxVi8GGO2OON1nRwrmZ0cVVtDIbtLXXRpdijdXj/9HfbwQ6LrELzp9J9NTg==
Received: from MWHPR04CA0056.namprd04.prod.outlook.com (2603:10b6:300:6c::18)
 by MWHPR12MB1344.namprd12.prod.outlook.com (2603:10b6:300:9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 11:35:18 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::32) by MWHPR04CA0056.outlook.office365.com
 (2603:10b6:300:6c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend
 Transport; Wed, 19 May 2021 11:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 11:35:16 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 11:35:12 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Wed, 19 May 2021 21:35:10 +1000
Message-ID: <2217153.lfGrokb94b@nvdebian>
In-Reply-To: <YKP5Dj4Q/riGGc43@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <47694715.suB6H4Uo8R@nvdebian> <YKP5Dj4Q/riGGc43@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 692c5b3a-c6ab-4ca3-4599-08d91aba2cc5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1344:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1344AAE4231E74FF10FAAFDADF2B9@MWHPR12MB1344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ekHdPF+vHBadjByZ9hZjOBIDdDlIVEiAfR0VFvn9KQYS0rw339RYUHumf26lWPrreSlD+5z5a4sekSSddyigATjQsysKrXmZ1J51DQP2bdqh1QiIvl23bmlX/H27XbRGk9lWpM03nQaPitMBB7M0brEuwxUiDCN9iItYUyoyrGGY3ivN0kAwpgSrWtBScKRYRzqhxlx8swELIuOJ6fTUcFmWY82uh1FdvlBXAwSSMluNkaXxKiTZPYtx7VIUlfCkknAN2k1Mx1I/J7DSdEgZIMqgHhJZxxbUfrbNlu73/P28OMrfS8rNSmLPndKgV3jKxz5K3AjCVhhiUKTMDr3WOVRRCVqOoCIwwJnbk+JtIlXEuKJzCbZ4PBCKEmpUTWd2cI6s2+aq9WaNMI5XB42VzUJpoXxX7WCIx89RtukmvoN1hSe61W6ud1RBKzVgGgz1V3IkXg8bNSggU14pCvMT2KaWMxWXPdyL78rtruHPbc7wjKYmg6fKzmKgA/+vh8g2QNj9iDggpsBRnKpLcZN+GeZ5UieDlx2nKLrL5Qu/ASCh0RGMO3a8MWc92pj2U11vgCykX50/UjYAK3YK1ewiQxSX2sc8P5On3SAcfwqqMqcc+2Td0qs4Nzd2Jj3kRC/XRwpmWHzsbydBOXv/NFThELLZ+QcUpoXs9X3VNblaiPdLaIcIyo6sKog787xSeUzIxPLN2lCp3RAK7qdR+QjN19XRcPTXEvKQOR2ah7CcZsKuN2yZBxDsAo3uBZK56ztcqDYevM7hy9jMWYKFssK3w==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(36906005)(70206006)(36860700001)(426003)(70586007)(336012)(478600001)(33716001)(186003)(8676002)(82310400003)(356005)(966005)(16526019)(82740400003)(4326008)(86362001)(7636003)(9686003)(7416002)(9576002)(47076005)(8936002)(26005)(54906003)(316002)(83380400001)(5660300002)(2906002)(6916009)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:35:16.6041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 692c5b3a-c6ab-4ca3-4599-08d91aba2cc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1344
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 19 May 2021 3:27:42 AM AEST Peter Xu wrote:
> > > The odd part is the remote GUP should have walked the page table
> > > already, so since the target here is the vaddr to replace, the 1st page
> > > table walk should be able to both trylock/lock the page, then modify
> > > the pte with pgtable lock held, return the locked page, then walk the
> > > rmap again to remove all the rest of the ptes that are mapping to this
> > > page.  In that case before we call the rmap_walk() we know this must be
> > > the page we want to take care of, and no one will be able to restore
> > > the original mm pte either (as we're with the page lock).  Then we
> > > don't need this check, neither do we need ttp->address.
> > 
> > If I am understanding you correctly I think this would be similar to the
> > approach that was taken in v2. However it pretty much ended up being just
> > an open-coded version of gup which is useful anyway to fault the page in.
> I see.  For easier reference this is v2 patch 1:
> 
> https://lore.kernel.org/lkml/20210219020750.16444-2-apopple@nvidia.com/

Sorry, I should have been clearer and just included that reference for you.

> Indeed that looks like it, it's just that instead of grabbing the page only
> in hmm_exclusive_pmd() we can do the pte modification along the way to seal
> the whole thing (address/pte & page).  I saw Christoph and Jason commented
> in that patch, but not regarding to this approach.  So is there a reason
> that you switched?  Do you think it'll work?

I think the approach you are describing is similar to what 
migrate_vma_collect()/migrate_vma_unamp() does now and I think it could be 
made to work. I ended up going with the GUP+unmap approach in part because 
Christoph suggested it but primarily because it required less code especially 
given we needed to call something to fault the page in/break COW anyway (or 
extend what was there to call handle_mm_fault(), etc.).

> I have no strong opinion either, it's just not crystal clear why we'd need
> that ttp->address at all for a rmap walk along with that "valid" field.

It's purely to ensure the PTE pointing to the GUP page was replaced with an 
exclusive swap entry and that the mapping didn't change between calls.

> Meanwhile it should be slightly less efficient too to go with current
> approach, especially when the page array gets huge, I think: since there'll
> be longer time we do GUP before doing the rmap walk, so higher possibility
> that the GUPed pages got replaced for whatever reason.  Then the call to
> make_device_exclusive_range() will fail as a whole just for a single page
> replacement within the range.




