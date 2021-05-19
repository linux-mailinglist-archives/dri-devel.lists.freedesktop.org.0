Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22D388E56
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC376E1BD;
	Wed, 19 May 2021 12:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379B6E1BA;
 Wed, 19 May 2021 12:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2dXzSSROVBGf/gg5PdP2aR16Jlg4O0Z0idlkLpS7uiEZbjYc5ugk/A5NdgpKrb0PShgywQUIzGgpppYqx9ud0itYos6PnfRNAshfOIsN8MEZ80P7e577X5in1IEdfFdp/4g0GW9z0vfkGZl3kdOiwECr7kv7LSQR4C9qiMFcOodOpf8a7DwhE5iLEUSLdMXj3lmfJCvAYM6ecxN6kiyMPhSplwmXihob/JJB+uIo3Nr146DBrs1bSLMVhhYrfHDuLQonJ0kzVwkc1DH0C2FVRV33GqbiCdhyCXOqhK6u3qup63jx/a3gNPJV1YR39fy27/DQ1wvttwLRYcGwTITDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFlxzPp4ZOoISWgFQEuzCfaawnMOi6RRAwx/58uZYco=;
 b=SEyZrZ0MiWMHKtk2XGA+Noi6EDkrbZJ3/dR1T8FZNK/C/X36kh5fnrl3L1B7MGWxxoi4o2iEYnh+QTWy59XWeHLWXTe/vgz/Op09xMEo44pQXSNhxafwn0qzaFjNvZjTpZxt5qSUqmJQb3C9gUXd+fRIxY52tLWzYtXYjDT7m3A9CzR7yjYhU66tzOeoeVaSdnMySf849o04jo0uAydZYFOERa3hs2BpyGlESfdoKghabNV6OecpdpCkXyvsP9yoGK5FoSUQEZ41WiTI9MpmiZAUV5AaGD1Kf3oh+w6l3rVRI69E8bbfd9PdwjCAkoVG0NOUjDaOVz/l3u7bUCY30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFlxzPp4ZOoISWgFQEuzCfaawnMOi6RRAwx/58uZYco=;
 b=QZVBYI+1AqekfNkdMsZqqMrGTHMzgzZ7GTFtlADgZPoCqWdtV5siZWDER34MrjYrsL8Y3XpibRxWBPUMCXfY991je2+c80zl8GudA8Reg3LnnpwuB/DDScgkTvKd4f6S9O4S3AfZNIIvPMADQB5/6HUxf+FlOcrQMTDdg30xH6kbzOEip9z64YpyUMT0pj527PHSAVIU8PckZ8wJ+msBXJgN1wAARUB2kDAxkauQuBz04esmtoEO654ARVwNBEmrjfcHt0m0JR/oUUqaK+1Z8vkirUFJ48jrX/4gdt3pjOE89SVedLkoDviXOoakbkJL66OOP8d/a7WfwjDCtdlRDg==
Received: from DM3PR14CA0145.namprd14.prod.outlook.com (2603:10b6:0:53::29) by
 SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Wed, 19 May 2021 12:46:20 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::d4) by DM3PR14CA0145.outlook.office365.com
 (2603:10b6:0:53::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend
 Transport; Wed, 19 May 2021 12:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 12:46:19 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 12:46:16 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Wed, 19 May 2021 22:46:14 +1000
Message-ID: <1911213.F1gzGJjR86@nvdebian>
In-Reply-To: <YKUDe8Oe4Y+q5Kxx@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <3859486.fHISG1RMxY@nvdebian> <YKUDe8Oe4Y+q5Kxx@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6eac1a6-cfdf-4c69-cfc9-08d91ac419cf
X-MS-TrafficTypeDiagnostic: SA0PR12MB4382:
X-Microsoft-Antispam-PRVS: <SA0PR12MB43821969C28B5B87FCB826B5DF2B9@SA0PR12MB4382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8iYKs6BI2yFSmgCpFM/li4zMKsvlxf+M4oqUXkoucxT1CRL7zY/dn8v7Br2aFGbcVJEqWazOH3w2hgsHRMtpyJUfdv8n8XsDD5D2jbPcvcGAAjAq7N9KhfL5GoibgNXCAsULW9Fpvch/b965Wzxxg6a/gnDUxZJ06dr6YPAXoUTZG5aj1+VnmClVK6rtsDDHGENzssTopER2o8dHhqCfAVC0+H+V6juw0YavEomlSpKQZXDZ5SUyH//g+nz7cGOMTBO0VFkuC+7hg4eHhCvc8m+B+ZQSzB3Q58lSJgbuBgHQZTtAQ468AmSs93ib0hrVgQoTSvBVaAzNg+BJcF46CXvBYhzWts4H5NqTug+bxnTf+2J/X1tqIjXicl8IU+8KKpS33CZw2xDqVP1+O16e440VDs6/6MnrVD53PXaIx0TarDqV+7fd7JJ/fZTCpQuxOP67wkDb8tfqr6Itfkjc3ReiBZzSN59x6d2TYQOIKZRI3pM3bhRyWEr+bWmPP9ANzTzUj3juKhnbEA4VRc+4nVxzxv+MXrSICUCBr5JY+mvhcvhLeGrKFiaMnDz+bXodWKju8ToxsrJeUdPI8adfWIW8LFd24553TdrA01mPyNkEuR4T2KuDlWbhkYjcVmMhknyZH2XQ3CwZhnsxsMAEuRe03Z6Q0o2Woye1c0r6CsmP4KJmxpzy19EdI2ahwLKD1WzgJa2xKKxrFFD+Sd3pf/MBfDetqFDSe7zJMZn8FdN9Fxoi11ykU6wlt//eZNhEdJK8PaVeDOCXFV/Tkqffu54a6ZGIBCcdsuugDYFyXeB2+29vzf3Dv7pmQD01ffy
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(36840700001)(70206006)(9576002)(16526019)(83380400001)(316002)(478600001)(8676002)(9686003)(186003)(5660300002)(4326008)(6916009)(70586007)(36906005)(82740400003)(426003)(7416002)(82310400003)(336012)(86362001)(8936002)(54906003)(966005)(7636003)(356005)(2906002)(36860700001)(26005)(47076005)(33716001)(39026012)(60764002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 12:46:19.7438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eac1a6-cfdf-4c69-cfc9-08d91ac419cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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

On Wednesday, 19 May 2021 10:24:27 PM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Wed, May 19, 2021 at 08:49:01PM +1000, Alistair Popple wrote:
> > On Wednesday, 19 May 2021 7:16:38 AM AEST Peter Xu wrote:
> > > External email: Use caution opening links or attachments
> > > 
> > > 
> > > On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:
> > > 
> > > [...]
> > > 
> > > > +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> > > > +                        unsigned long address, void *arg)
> > > > +{
> > > > +     struct ttp_args ttp = {
> > > > +             .mm = mm,
> > > > +             .address = address,
> > > > +             .arg = arg,
> > > > +             .valid = false,
> > > > +     };
> > > > +     struct rmap_walk_control rwc = {
> > > > +             .rmap_one = try_to_protect_one,
> > > > +             .done = page_not_mapped,
> > > > +             .anon_lock = page_lock_anon_vma_read,
> > > > +             .arg = &ttp,
> > > > +     };
> > > > +
> > > > +     /*
> > > > +      * Restrict to anonymous pages for now to avoid potential
> > > > writeback
> > > > +      * issues.
> > > > +      */
> > > > +     if (!PageAnon(page))
> > > > +             return false;
> > > > +
> > > > +     /*
> > > > +      * During exec, a temporary VMA is setup and later moved.
> > > > +      * The VMA is moved under the anon_vma lock but not the
> > > > +      * page tables leading to a race where migration cannot
> > > > +      * find the migration ptes. Rather than increasing the
> > > > +      * locking requirements of exec(), migration skips
> > > > +      * temporary VMAs until after exec() completes.
> > > > +      */
> > > > +     if (!PageKsm(page) && PageAnon(page))
> > > > +             rwc.invalid_vma = invalid_migration_vma;
> > > > +
> > > > +     rmap_walk(page, &rwc);
> > > > +
> > > > +     return ttp.valid && !page_mapcount(page);
> > > > +}
> > > 
> > > I raised a question in the other thread regarding fork():
> > > 
> > > https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/
> > > 
> > > While I suddenly noticed that we may have similar issues even if we
> > > fork()
> > > before creating the ptes.
> > > 
> > > In that case, we may see multiple read-only ptes pointing to the same
> > > page.
> > > We will convert all of them into device exclusive read ptes in
> > > rmap_walk()
> > > above, however how do we guarantee after all COW done in the parent and
> > > all
> > > the childs processes, the device owned page will be returned to the
> > > parent?
> > 
> > I assume you are talking about a fork() followed by a call to
> > make_device_exclusive()? I think this should be ok because
> > make_device_exclusive() always calls GUP with FOLL_WRITE both to break COW
> > and because a device performing atomic operations needs to write to the
> > page. I suppose a comment here highlighting the need to break COW to
> > avoid this scenario would be useful though.
> 
> Indeed, sorry for the false alarm!  Yes it would be great to mention that
> too.

No problem! Thanks for the comments.

> --
> Peter Xu




