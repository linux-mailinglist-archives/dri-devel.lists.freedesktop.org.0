Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBE3A37BC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F65A6EE15;
	Thu, 10 Jun 2021 23:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C47E6EE14;
 Thu, 10 Jun 2021 23:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0B9fHYcJ7yDjuQtyBgFfYcbcERBhEB/MwWVKd3qj8hw83xb/cMhoevu61K33MyUszmuB9a12S26wGKOTVjC5kb9HEmPJLJ133j4KKcBmqzpz+jHWHUeMjHDdV6vJcHGLOuBSVWk16HawISZPvwAckB5qbqn4/byLXzWzCQJARVRpjeoM5UFnht+K3th4xPBnZA46d4iKUdxasLZxlU+f3HApIsJYrezMBNXpr2x/4lBUykCl6W0HB+3ZSGbFfIm4YoAVfeQrkiNxr5oh++D7xcaXZkpkjJhDiDMceRvyyk0gH2KMjGmxAk+rZw/5y69W8ybKzFPdT+qyrUOZa1Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK9/iqGNPG1pyRoITgYZOUATNZ+I+nxx1BH/7taIQwU=;
 b=bN51GMZNJflVAy6uJQxgRr08GNbiPMe936HJWOgfWHPp4LYz1LAMKqK6jDCfa+6Y5UW8navav3PIVvBDVTgc7n4eLHsF94fitqh9BjHEqAY9hRAs0XpMICrxW1Okj0IbGOdmOg8MnFjFQwiesPQ4l5lHPiNVJkcMSBPWEMWqbK/OoR+vp15s8wBIX3Bp2uMMh6X39jk3XXC2dRbo7KWyAA0CbAIlz5btyOtghkCNuXsdVx6cxUNgwVGHViA1btvIDKJimahqfAWp/mbxPs+hDb97V0S9ybySomqTKN+4og1lErxf43d8QUc0YSAN7G7FAfP9zB62pZxWrj7cCiEiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK9/iqGNPG1pyRoITgYZOUATNZ+I+nxx1BH/7taIQwU=;
 b=AXaedr16aTqL3sGxRoHk0gTiCaW2uIBYMPoB6FYij4ZQSRaWSubuSvHPBgijki0Rpwqvi4LfL4rgHbt585SLBshJBX2hBMnQc6MlfX0woLUIGshEToTLf9QeEviFeXgaUmMYrVOSEJ3hAowcCuTkh2OSeePkhKqx1hVXS0G34F4C552Co76DOefTNuy0J/PnW8qD8LxORXvEQukulIftUZZiP6rYbFBOLOV/wennRffnskAXtdUgRIrrdwnUJ6KHEUF/gDJ3Ec419mBZjuneT61P6jy1oD7+mnToOitoZXbfYxUtTlbw3Xe0I7sgc3OAJW38gEHDU6+WKWN61bhs9Q==
Received: from BN6PR11CA0011.namprd11.prod.outlook.com (2603:10b6:405:2::21)
 by BN6PR12MB1698.namprd12.prod.outlook.com (2603:10b6:404:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 23:17:20 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::ae) by BN6PR11CA0011.outlook.office365.com
 (2603:10b6:405:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 23:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 23:17:19 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 23:17:16 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Fri, 11 Jun 2021 09:17:14 +1000
Message-ID: <4307769.9k6FjFFxS5@nvdebian>
In-Reply-To: <YMKacyNstEM9brUD@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <6429491.QiJgnDeYu7@nvdebian> <YMKacyNstEM9brUD@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7eb77b0-f24b-484f-e4df-08d92c65e563
X-MS-TrafficTypeDiagnostic: BN6PR12MB1698:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16984B1FEB1D665F8D5477CCDF359@BN6PR12MB1698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MziLlU6vYlmqv/Qlzpz4iQpE+LnrSWoRaZsa7fWYSh7QUrlQe/F2K4uqOf0lNoVljwd/Z+pcGVzpIFkr9poVUKJncwQJnDHWLH5RXVLggKoW1rw0Nv/h3I01R3bo5R6bVXzuR1OD2PTA88YE6vL9DTo7SCwC8kxlCv/uq2KSllC4AfpHmC5pgDLODRa/jTDh7nvT0FU6Oyn6Pxp57b09tallTZyoDWGsp2p8a+vCNmvwpSQSQHUC3huovaTfuqoe/DVYe1oXUB1dwcHjhLhmbkDVsCCrHQUhQHyfRbng7/vrIaKgW6SrbF9WtRqv0ezlyLp7IURCvDNInABQAF3Pb03OoxTPBvJlbgBR6MkfLHu++8lClnoYda9ZAH156sTvI0+o9fX/Ci2xZqBEUKbIqpE+hP0aFiHXGDTWXKygv9Q/UX18k2Es01dQu85EwV0GWSZWhNhWT/575Ln7/6XXPP9+RkhbU19QfrdY6XXriTXs89snJ5AqcxSjBi1WBCT03KWD23rSZ9UJSYEazqeMueGpTOukiNc/GzU8WsZ8I1FHeasPCFz+o4kojIFzrGtBWGXmJ8IZ0GCKLqqYYfYsR/Yrm/+C1gdfjy7A/TGJRxMc8uwAZlR4+egI0Ok8zkdFY6oB2REsivJxjnRzstds1gSXW5x12xnqHzou9T2nk3ajeFeaX7AT2newEoPKg0y
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(6916009)(478600001)(7636003)(426003)(36860700001)(36906005)(82740400003)(5660300002)(54906003)(70206006)(86362001)(16526019)(356005)(9576002)(70586007)(7416002)(9686003)(2906002)(47076005)(33716001)(186003)(4326008)(26005)(316002)(8676002)(8936002)(82310400003)(336012)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 23:17:19.9804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7eb77b0-f24b-484f-e4df-08d92c65e563
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698
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

On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > internally which will generate that unwanted CLEAR notify.
> >
> > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > finds a thp pmd. In follow_pmd_mask() we have:
> >
> >       if (likely(!pmd_trans_huge(pmdval)))
> >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> >
> > So I don't think we have a problem here.
> 
> Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> and do the split, then the CLEAR notify.  Hmm.. Did I miss something?

That seems correct - if the thp is not mapped with a pmd we won't split and we
won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
is fine - we will retry, but the retry will won't CLEAR because the pmd has
already been split.

The issue arises with doing it unconditionally in make device exclusive is that
you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
understanding, please let me know if it doesn't make sense.

 - Alistair

> --
> Peter Xu
> 




