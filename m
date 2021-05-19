Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B358388BFD
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC646ECD8;
	Wed, 19 May 2021 10:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFD56E82B;
 Wed, 19 May 2021 10:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0ZPS7c6Ohgt1S4PuNosFxOn7XxElgyU7j67J/15F8Bez9E6GpFcu3esKMY9kghat71ar5gm5XCu1EuuuahGNzCOug/kUrdiOqL3/ydg/eDfgxhtn+3ImlY21BOdTq/pZH8xnuJ7boWWobdowqA+XW2zIpUf5S+e8BfwQawGyVuxBwGFmSHjiceDkcI0Rexc/dkr9zk/jEbwTtbfA0213K9a5GotbLuLhfXdPyCiDliiXSBC4dkAuWk/UXzkauEN/A5DcBm5IspzV280qFpU4kGL+U0Xbf6wUBxSAYKJt3KZ46Zw21vtf/wIotSq9/QzoRiEu3XTWd5TW4PnjX6QVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c73JWzaqe3uDx/g97Z4tEXpXa9tHDoLKxQF8Q693bqw=;
 b=FEYJpfbVczeBsE07GX6HdfbLSEJvBc+Ve51hZI3hdYxR4wQ0l6Gh6pnyXISABQVKKCjL1DEAIas0QVXjnEfp9JtwdIk2UtUrNHMa5+F9hSvSnw4aCjb+zbyqrm5WWjbdqpAMFmG4DSFAWhtV2sVOT1rECoYDmfuXAYBmpHgCChjLIvVfJnk/5OR7n0OeTXIuic9Q2TV+2QMz6oRwvvRiqzlBgLe/xKbSZOKJm8N7cyZweEyXL2Odg+7V+jonqsO/epB3txsEpu5ExVIW1L1EdYnHydW4AshWQmKe7O1PW8h8vKZKsu195pjvYDlVz0E2+RMNKyqr4pDfDq9sAnE50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c73JWzaqe3uDx/g97Z4tEXpXa9tHDoLKxQF8Q693bqw=;
 b=kLGlCTsjRshT0Uv0lvjkdoBY0h/tAkPsRA20FZVuAtthbLc4C7ePlvP6dYGBSkYVcb09726ESqDprP5WIjizctCE5yb0kvnpnVYA2JdfeHI2aWKf9pGkvE6BRcBnyaJfMw4Cur52ojxP3IUf+yr5GYNV0Mnd+VTLb5iHUpHjdoIzOEC6OJnyZnpI+m0JpIfMHaGvUaZz1yz0kAJbveSYBRmXzYOem8ak1deA16BCD9zryGE4uKhvmCbKN98NZMjqVlP86Jwc7Qh850BlJa3tgErSGMHCqGtUIKDAmx6u5oUAzuEyadoWdlpw7nDuWGCi58WNdaSHvw2lRvjXiGxFEw==
Received: from DS7PR03CA0257.namprd03.prod.outlook.com (2603:10b6:5:3b3::22)
 by MWHPR12MB1727.namprd12.prod.outlook.com (2603:10b6:300:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 10:49:08 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::3e) by DS7PR03CA0257.outlook.office365.com
 (2603:10b6:5:3b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 10:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 10:49:07 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 10:49:03 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Wed, 19 May 2021 20:49:01 +1000
Message-ID: <3859486.fHISG1RMxY@nvdebian>
In-Reply-To: <YKQutvAa3NlgGaMm@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com> <YKQutvAa3NlgGaMm@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0960da8-fe26-4d08-b8d7-08d91ab3ba61
X-MS-TrafficTypeDiagnostic: MWHPR12MB1727:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1727C4CE154F8A5F7D09E2E0DF2B9@MWHPR12MB1727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKqyVnbmXmIdifSxxD9RTpXBc8HaSTsp8c/A8dDrp/vrvlhrvvjNvXqVsKY2/C0aAn5zC/u9PMP9ELmMyoyOCarnBYFyDX+tOJpgQS/PLd/8EHK3+BtIfi1hgLzHoB6uM6AJIffNH3sOXD/NTcmAU0tAAJXFi452hyhJ06NoNYl1CXjFLr3SUHSWyWt5wM/aue/mmDds0WPr0z+09pn+A665YtLm2yw4owqF2Vrdx+Ipw5GXrdNpCQtLuIjmcT28VJ/AURFx0cmzhM3v6BREBaT6PmvXyOqWvbZB0LwLUcnChFqGnx/Z6g3sJrGg39SEMqIKKTlhmCl5xGbFRnVoXw1xaHiQoZ9Bo4nrK2uwKrEsRreRl4mjntqcuJYtKeJ4L1DWQpb3EfBhBwWuY1w1shF8hBz/OsrYGYH2DStFGCTfRSUS4EWbN35ewNoElKb9oeWGP/g7PjSbCpzjGXuPctEqy8S9+j3VN4v79rR0zNlHNd6Tco6acwDT43gzORRSZKkRH/IU6U/j/klnHYvuyA6v/s51wIQbRnCk52j3m3M+S51ovNsGV7VybrrSkicKhqvJZArWTKEaqiAjfeMdhbeT6SRko1B6XZpsQooN01blBfAySZuunNXLLyziVkQCVb7fcm5AMlC5G3Z+vPbD+7jpc+CRpiH+E7a0jwDHWY2LzoR9UnqM4rYwJKgNrHsQTOZrBDB6sVqZjLwSkEl3tlGwfoRgRYW/VKaIfGIqndxL0jRJs1gpwkGhxwpIh2A9xFEUSjLscQb+kfuhF25yhBW3iK/vWA1U+yyH3bD6qxc=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(26005)(9686003)(54906003)(82740400003)(82310400003)(36906005)(70586007)(316002)(4326008)(70206006)(6916009)(86362001)(47076005)(336012)(966005)(33716001)(186003)(8936002)(16526019)(9576002)(5660300002)(7416002)(36860700001)(426003)(83380400001)(8676002)(356005)(7636003)(478600001)(2906002)(39026012)(60764002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:49:07.7041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0960da8-fe26-4d08-b8d7-08d91ab3ba61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1727
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

On Wednesday, 19 May 2021 7:16:38 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:
> 
> [...]
> 
> > +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> > +                        unsigned long address, void *arg)
> > +{
> > +     struct ttp_args ttp = {
> > +             .mm = mm,
> > +             .address = address,
> > +             .arg = arg,
> > +             .valid = false,
> > +     };
> > +     struct rmap_walk_control rwc = {
> > +             .rmap_one = try_to_protect_one,
> > +             .done = page_not_mapped,
> > +             .anon_lock = page_lock_anon_vma_read,
> > +             .arg = &ttp,
> > +     };
> > +
> > +     /*
> > +      * Restrict to anonymous pages for now to avoid potential writeback
> > +      * issues.
> > +      */
> > +     if (!PageAnon(page))
> > +             return false;
> > +
> > +     /*
> > +      * During exec, a temporary VMA is setup and later moved.
> > +      * The VMA is moved under the anon_vma lock but not the
> > +      * page tables leading to a race where migration cannot
> > +      * find the migration ptes. Rather than increasing the
> > +      * locking requirements of exec(), migration skips
> > +      * temporary VMAs until after exec() completes.
> > +      */
> > +     if (!PageKsm(page) && PageAnon(page))
> > +             rwc.invalid_vma = invalid_migration_vma;
> > +
> > +     rmap_walk(page, &rwc);
> > +
> > +     return ttp.valid && !page_mapcount(page);
> > +}
> 
> I raised a question in the other thread regarding fork():
> 
> https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/
> 
> While I suddenly noticed that we may have similar issues even if we fork()
> before creating the ptes.
> 
> In that case, we may see multiple read-only ptes pointing to the same page. 
> We will convert all of them into device exclusive read ptes in rmap_walk()
> above, however how do we guarantee after all COW done in the parent and all
> the childs processes, the device owned page will be returned to the parent?

I assume you are talking about a fork() followed by a call to 
make_device_exclusive()? I think this should be ok because 
make_device_exclusive() always calls GUP with FOLL_WRITE both to break COW and 
because a device performing atomic operations needs to write to the page. I 
suppose a comment here highlighting the need to break COW to avoid this 
scenario would be useful though.

> E.g., if parent accesses the page earlier than the children processes
> (actually, as long as not the last one), do_wp_page() will do COW for parent
> on this page because refcount(page)>1, then the page seems to get lost to a
> random child too..
>
> To resolve all these complexity, not sure whether try_to_protect() could
> enforce VM_DONTCOPY (needs madvise MADV_DONTFORK in the user app), meanwhile
> make sure mapcount(page)==1 before granting the page to the device, so that
> this will guarantee this mm owns this page forever, I think?  It'll
> simplify fork() too as a side effect, since VM_DONTCOPY vma go away when
> fork.
> 
> --
> Peter Xu




