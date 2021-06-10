Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F73A3749
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3EA6EE0D;
	Thu, 10 Jun 2021 22:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973D6E500;
 Thu, 10 Jun 2021 22:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cggqDglPXC+NL3kCMw6q1wKex0DdN1XBweAko1B3+ZVF390EdTMTaRbxbRnUF210u9usELRgXFRH68pHL4RphKIM+gEgRx0jkW1Sb08b2Qb1lug8Oaduoj4gsHqQZathx6TnF8oSYvVuD58vd9z8pCeeJRcVjbCllDexDPKTYRAx7duqril7VU1csUc6EEKWmoW7pa0zProH6XHOXCmVeSOINXQAYL/Bd3TMQwnLA8TkiDjt9FsJabnaP25+VKMjgF5Or+oySsPbBjyn4FCdD8aN17hNMBQWnfLYMNwgDK3YLhCOOiTy2B8dKnBNIDwb8eGesC+zX0zs8uMLZcp77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EsbqD5LC03Enq3JmB7NRNk+4LM/vxDOezh0MnKCGXY=;
 b=cmLWTozeoNGqCl0wcAL5JAECYWnvXBdPf6/1m0oaNywwq0vMFNOpaAR1o1y2qmXqjohZgiVggh9LoF/caX9OIJOYz0em90w3LlLqDV5H4UIAof5m7prBQAfK1TSUNtY6J3SLuCxDIF46kRm11fm0kIaIV+lzRagGAQw/Icaus3VnMd5GKOYQ6g7/2TFfOyZz+Zibjd96FtvbJfO2K5NnmZ2QJciNT9XCyVLIVB+o4tqB8kvsjZ+yifrvjY3U1LNCq6IO/xJNRNg51mSN1iUXlEUL9CgcrDJDfZFGdlICSpHGVLt37amdUuiDobg8mBj9whNRgmgCSluTYvuVOC8q2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EsbqD5LC03Enq3JmB7NRNk+4LM/vxDOezh0MnKCGXY=;
 b=UE0BL/XJmsMwx8UvHflqlx8gMlbgu6mMAu3di0t77e3DFbBf0JvYf4lD+ZSQ/OsLNcJYABy++D4GGSa/il0aoy0jSDRSWVi91OIzrcVKAHKiiZKdJY4PSqG8Oh5wgkogQPgqjHKzmdSpssU/nQQHmyHU8/5QJmRSYNZVQiSfD67yWe/QPpNpaj1c4+GdLueuvAfKKM5H4EAgKaHZ3u2Lx/aEctRmgLw5ibfanQUrRhUw9NXMzUrKF5u00vGzklAy5ZoW9CqCyG6j33pmbVAJGmN7yd8Anv4Op976gf6pL3epuJ1HiGGIlO145tVHVgzqp1x2LxpKJ+FL4KBrrRJ93g==
Received: from MW4PR03CA0051.namprd03.prod.outlook.com (2603:10b6:303:8e::26)
 by BY5PR12MB5557.namprd12.prod.outlook.com (2603:10b6:a03:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 22:42:55 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::e7) by MW4PR03CA0051.outlook.office365.com
 (2603:10b6:303:8e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 22:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 22:42:54 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 22:42:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Fri, 11 Jun 2021 00:21:26 +1000
Message-ID: <6429491.QiJgnDeYu7@nvdebian>
In-Reply-To: <YMJUM4sx1VclR7oz@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2773835.D95cIkl9rl@nvdebian> <YMJUM4sx1VclR7oz@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aa8e496-4249-4fc4-0857-08d92c61163d
X-MS-TrafficTypeDiagnostic: BY5PR12MB5557:
X-Microsoft-Antispam-PRVS: <BY5PR12MB5557AB25F46C4F72ED031029DF359@BY5PR12MB5557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zh7WcoeLnhgrUG5yC8bTc9B8S1OHb5IOiwd/kTZgelVlx0emN6IoBNDYeLuOHI+UkBB9FJ04kmX/uOAW5N11zGcegV4QeRbj2i62U5nZGaCzoj+ZMNZy2KavFPuNkTmgwx60/4TVsyGWeUHb1stRmIU0KHosWjTROqPGdH104BREu9g9V8e9f9rFk8Lw17ubYhay0qtkQ+dHIb7WMIAG1G0r7BEOytfOz2atnXmrRGyOCk4JbAhAyF96zuli+Xss0lD5dTzHGkO2RoIiOxHOe268Sr13rvQTgShMuwTkte7IEtCCpQXiUhU3m2zvAW5pAMhVrRxQAuK2r0c8rk2EWE0fIEDVnXlYRN3di4uAMYtgnQZl1JJGlGn21vhOR6Y8papqEh7CW5+nc5exMyMQx/Y2bQNdjEfrESICY6IUu/PhZrGH5RaBxqZfEoUdDuPbxKQHCNq5moI0pdZSbpLm1dnRYCCwIXvStTK0aF5zYvkz6LWmrvWiDrw8Tu/uPLZuohQWOn7lRkdc2+eNkUW93NTA41upkkTqGyluWA4GjmPU/7hfymBQXVjkWcYziI5mjrH6HeXNEr9Gz+kCsNqsAwjN+Zs1UpUUMcBbra54CFbsy9HnWmJIOTOEPFAwVBJryRi3gGb0vQRdI4zkzBtGuBDzCBy100bDDCnSMowG9n7DhpLy/KdsNfbGru+cu7Sq
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966006)(36840700001)(426003)(6916009)(8676002)(8936002)(54906003)(70586007)(4326008)(70206006)(82310400003)(478600001)(47076005)(7636003)(16526019)(26005)(5660300002)(6666004)(33716001)(316002)(36860700001)(9576002)(2906002)(82740400003)(9686003)(7416002)(356005)(86362001)(336012)(186003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 22:42:54.4515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa8e496-4249-4fc4-0857-08d92c61163d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5557
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

On Friday, 11 June 2021 4:04:35 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Thu, Jun 10, 2021 at 10:18:25AM +1000, Alistair Popple wrote:
> > > > The main problem is split_huge_pmd_address() unconditionally calls a mmu
> > > > notifier so I would need to plumb in passing an owner everywhere which could
> > > > get messy.
> > >
> > > Could I ask why?  split_huge_pmd_address() will notify with CLEAR, so I'm a bit
> > > confused why we need to pass over the owner.
> >
> > Sure, it is the same reason we need to pass it for the exclusive notifier.
> > Any invalidation during the make exclusive operation will break the mmu read
> > side critical section forcing a retry of the operation. The owner field is what
> > is used to filter out invalidations (such as the exclusive invalidation) that
> > don't need to be retried.
> 
> Do you mean the mmu_interval_read_begin|retry() calls?

Yep.

> Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> internally which will generate that unwanted CLEAR notify.

Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
which will always CLEAR. However gup only calls split_huge_pmd_address() if it
finds a thp pmd. In follow_pmd_mask() we have:

	if (likely(!pmd_trans_huge(pmdval)))
		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);

So I don't think we have a problem here.

> If that's the case, I think it fails because split_huge_pmd_address() will
> trigger that CLEAR notify unconditionally (even if it's not a thp; not sure
> whether it should be optimized to not notify at all... definitely another
> story), while FOLL_SPLIT_PMD will skip the notify as it calls split_huge_pmd()
> instead, who checks the pmd before calling __split_huge_pmd().
> 
> Does it also mean that if there's a real THP it won't really work?  As then
> FOLL_SPLIT_PMD will start to trigger that CLEAR notify too, I think..
> 
> --
> Peter Xu
> 




