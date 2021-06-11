Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB223A3A76
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 05:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F196EE2B;
	Fri, 11 Jun 2021 03:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D870A6EE2B;
 Fri, 11 Jun 2021 03:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYGKOAeZB1R8UQa6Uhde+OuMAR14U3nik1P5/kVj5KnGR0AF+2wve7D3dmbBKvkYCJBMgCBxpvqbWypcCX2S5jDdz8ZX9ggw/zRmVFvj7hYm6voWxo/192kRZpfMg8y6FfgTsCm091bgH74FnygOPxLtG3qu63Krj86HCYVWxzfUf46tVZviTsdnBq1ggFWg3LwiFGQo+WEBWIc+CxbuU6xeIQhEYc9sxci9dmDLVnHnxXoagEZ1Qd6kqnXjtP/sVep3nJ7I7lWeHHA0sQYaVyQifoglvtsaQPj2tVxVPLUl6mSOrv1kUHHp7dNPEHFgliUEfsZPA4Dx1+R6vn/fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+QHRtWCV4Ndv6ZHYXC/4LW3/mfaNmVTYrUuSySkFIg=;
 b=JlTccu8vv1aOAXBKAmb16rY+4Lwz7NL6UtghR92f9UqJhpcofHfM6e4pTSoxluLacEGk/Hq+FcX4h6GHai1RPcq4PEB5fIp0pi0bdVpS/usxKOhTEVJzVsJZ9Vs+LFLOnqyJ5MWp+8+gMXyhDtx4PzbKt+1w531aeo8aEg8nuKdc6l/jN3YAZ84b0ogCqh/1ezPxGYHC9Fle504Q36IxOi2JKFd6NzXzmP8akZBfYPoDvtzoOmQY9gnNPFHzAIFzck/udS0iFzb2pg9k1meaDUZS4dULPh4Ec3WT1W6waPidp35TNS1A4ThUvLNyLlVmY/2VmAILg2ix2fZf9DSw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+QHRtWCV4Ndv6ZHYXC/4LW3/mfaNmVTYrUuSySkFIg=;
 b=EHJdWof9l3C4vaPyqmFFY4H3WbUUOqjDlnxfOEKLYvkPmO8ixONQeSkdqH8fuTTFSamzmXIG2W1DaswrJmhxsLLXPLfFfizxm1byDKWzEnaXWCO5ohzCOTx2pnHBAKVxjguacZs9Po+s6/g8oj8H4BysowqGwpCdQWtR85MHTVOWmrHGSdkzPwNDvSCEGf4f1crkys05ux7Lj+eL/TMTNlyGHj4lPsKKi1OIIGKYG/XCSwnJy0CZSgEiYJQxmP/WVjn1UPxfED23TkMoVf+1T9N5E08lTE+5ZKFXyps0kE+SnsFALB6aWOtWqctNUWbxzCRvpwB/xda5AEcgPLi6Wg==
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 03:43:27 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::4c) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Fri, 11 Jun 2021 03:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 03:43:26 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 11 Jun
 2021 03:43:22 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Fri, 11 Jun 2021 13:43:20 +1000
Message-ID: <2683185.ETRjo6vMkr@nvdebian>
In-Reply-To: <YMK1snSH9q4Wkyq+@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <4307769.9k6FjFFxS5@nvdebian> <YMK1snSH9q4Wkyq+@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a62af0f-13a9-487d-ac47-08d92c8b1233
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5475D893D29843ABDF6780AEDF349@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6Gxx5VJ/qLI9xkv7NJBjffFkKGsCwi8vZ+sBsL/GCKnnuimWIMdcpdtf6xu6JsT/eKk4tf7EGsBESKAleS9TMs1qmydUFLJ0BhlsXgY+dAAb93Amw4XArH63Lsup2grCmsFNX6lwloGgG3bDjE8AD00YgX9LFCaTbrDJ61H2pj1nqO9yJE7KFaD5R1iPPCnGHA0i8M9dh3uPVrejGLBC59DdKOgdDtGGG607KIWG4IWgKEYw0mOAUaF70P6MS0jIFKKhFMeysiC1azpho53nhnQE+MEsDWZzvL7LVo44nqpu1Y3o3CQ5lEYlUkbRhfL+I7zxd0Bgr7n8w6C/NdG82U8tHSoHyIkV3UJ8vSug1Nia3DmccBHdPTkGEETgtm52wYPVfGrMdd4NVlFGlH/bAdwdbVmLbqopGaq9UeoCEk5ORBrFEsABBVLR/CkS3PaMhd/O8ETF4nDPEjSNEdp2PGbBFVVV2pu1XfvdSNT2+ipocFLWR+yCZU9KnT6gPVBou0GgZim2N7NnjCeD+Qj7pFlXnCgjGeFnoFvROiEOoFZULUfTT5rc786BQR27G6LsLVy9E/dOd3FHTowDeTyVwXL8zhM+IBy2slkShUdClSW8+Al/3eM/oqUrz4Lp6QYhDbtJF3hhPz/8GG+Hdj36YpF9h5n+0ZPVGuiPFuOVsxKEe79tfFh/QUD3NfkSNVc
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(9686003)(9576002)(36906005)(82740400003)(8676002)(26005)(36860700001)(6916009)(7416002)(5660300002)(186003)(2906002)(70206006)(16526019)(356005)(54906003)(478600001)(70586007)(7636003)(33716001)(8936002)(83380400001)(47076005)(336012)(86362001)(82310400003)(4326008)(426003)(316002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 03:43:26.5339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a62af0f-13a9-487d-ac47-08d92c8b1233
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 11 June 2021 11:00:34 AM AEST Peter Xu wrote:
> On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> > On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > > internally which will generate that unwanted CLEAR notify.
> > > >
> > > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > > finds a thp pmd. In follow_pmd_mask() we have:
> > > >
> > > >       if (likely(!pmd_trans_huge(pmdval)))
> > > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > > >
> > > > So I don't think we have a problem here.
> > >
> > > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> >
> > That seems correct - if the thp is not mapped with a pmd we won't split and we
> > won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> > is fine - we will retry, but the retry will won't CLEAR because the pmd has
> > already been split.
> 
> Aha!
> 
> >
> > The issue arises with doing it unconditionally in make device exclusive is that
> > you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> > understanding, please let me know if it doesn't make sense.
> 
> Exactly.  But if you see what I meant here, even if it can work like this, it
> sounds still fragile, isn't it?  I just feel something is slightly off there..
> 
> IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
> performance, afaict, because if it's not a thp even without locking, then it
> won't be, so further __split_huge_pmd() is not necessary.
> 
> IOW, it's very legal if someday we'd like to let split_huge_pmd() call
> __split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
> one to be broken with that seems-to-be-irrelevant change I'm afraid..

Well I would argue the performance of memory notifiers is becoming increasingly
important, and a change that causes them to be called unnecessarily is
therefore not very legal. Likely the correct fix here is to optimise
__split_huge_pmd() to only call the notifier if it's actually going to split a
pmd. As you said though that's a completely different story which I think would
be best done as a separate series.

> This lets me goes back a step to think about why do we need this notifier at
> all to cover this whole range of make_device_exclusive() procedure..
> 
> What I am thinking is, we're afraid some CPU accesses this page so the pte got
> quickly restored when device atomic operation is carrying on.  Then with this
> notifier we'll be able to cancel it.  Makes perfect sense.
> 
> However do we really need to register this notifier so early?  The thing is the
> GPU driver still has all the page locks, so even if there's a race to restore
> the ptes, they'll block at taking the page lock until the driver releases it.
> 
> IOW, I'm wondering whether the "non-fragile" way to do this is not do
> mmu_interval_notifier_insert() that early: what if we register that notifier
> after make_device_exclusive_range() returns but before page_unlock() somehow?
> So before page_unlock(), race is protected fully by the lock itself; after
> that, it's done by mmu notifier.  Then maybe we don't need to worry about all
> these notifications during marking exclusive (while we shouldn't)?

The notifier is needed to protect against races with pte changes. Once a page
has been marked for exclusive access the driver will update it's page tables to
allow atomic access to the page. However in the meantime the page could become
unmapped entirely or write protected.

As I understand things the page lock won't protect against these kind of pte
changes, hence the need for mmu_interval_read_begin/retry which allows the
driver to hold a mutex protecting against invalidations via blocking the
notifier until the device page tables have been updated.

> Sorry in advance if I overlooked anything as I know little on device side (even
> less than mm itself).  Also sorry to know that this series got marked
> to-be-update in -mm; hopefully it'll still land soon even if it still needs
> some rebase to other more important bugfixes - I definitely jumped in too late
> even if to mess this all up. :-)

I was thinking that was probably coming anyway, but I'm still hoping it will be
just a rebase on Hugh's work which wasn't too bad last time I tried it :-)

> --
> Peter Xu
> 




