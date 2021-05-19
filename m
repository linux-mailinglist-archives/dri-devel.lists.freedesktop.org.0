Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80F388EB1
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9418F6EDA3;
	Wed, 19 May 2021 13:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26D16E3BB;
 Wed, 19 May 2021 13:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdJE79JpFnYW8ID2u1XX4avM+GtKcg7orgwOazsq4ehxC49P/1wP4u2STBs3diY4NBEz9af72ZK5zP9QEQ8pTkubSWr6eXj68NxfuaMMUuH1lXmSU+B+xetSYmxXUExOvLXQSi6Xd3op+4WQfUW63QXLCcfG1Dfh+fnTl4P2P4YIJQIagw6MAnVlY3NEYZC35/xSm7Nfrh+usfdpCxxCxL7iQ+ZX6fHVlV8Ut1hVUwZX51nYPSQ5UX80km6IoFbtUPXyCral/DuzxoCs1Z9T+cPgBvFWzVEYsDydmquCnaI0iH4TEORFsMhIwLb3ZWaUxlBW7IEVeCoHR5x7N+1jNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uoknZbjGAYWkMqjYvXJe1jcU3yiTsCf/UaNR3x7LbU=;
 b=c8D7r9iIbPlVvMkse1kUJ+dw2KZBiXS5oWFBa+pX/LELXMfsU98ysa0Xg9ndoSb9p0LkCxQvxsQSmb97cUuYMPy1iyM5TNjaUobrrPmGDVZLHecovLpFqRBoE0opuQGbwBIrYwUyOSd5bXPtQzYOzdDxwVzZgE7uw6IkEYGISVmKijpUSLWbhbdV5n3/jFsq+9VR40zlRlJgnXSwoIgKTx8MgeQ1tJqDJ0n9kLKXpN1hutkCFKBVagptJys5z2ajjoHVU8V7dxQ32CLcc4EFu7R2kwJ0qQbCdN/S9GWbqfFOfxsd8si0LDz2jMMykZQO7rjSlhjvWVFT/4jvfcm8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uoknZbjGAYWkMqjYvXJe1jcU3yiTsCf/UaNR3x7LbU=;
 b=io5fHVE5OHMBOBbf0/cq3PYkQE2piUfZVimedZZI75XpfdX16KRZPbknZXB++NPjXBDG4uoiVnbAQoM4u4vx3/eVGkSWl+Rf7oRCkvUknpnSWaBaI4Xt6J0jbvz2AVUG6r+j41YDjByL6ROyOrjj6NSUmEPQzovUiNlfAY2/lOTu31tL3Z20kjPccOzC3xdVVh0W79h7b4/nAkcufiiTI1ZCK1HZkc3QRaIVns0y1CY2XxOIW0RB+IWGt5H4dozGQUiebM7K8lMQq3tNCt1d9XE/A2Wt+alKm1rIO/bRt6iCxqoMzS1hpsDCZxRKAmZHTLAsX25l+F8+LCkeKSKQVQ==
Received: from DS7PR03CA0157.namprd03.prod.outlook.com (2603:10b6:5:3b2::12)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 13:12:01 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::eb) by DS7PR03CA0157.outlook.office365.com
 (2603:10b6:5:3b2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend
 Transport; Wed, 19 May 2021 13:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:12:00 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 13:11:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Wed, 19 May 2021 23:11:55 +1000
Message-ID: <2569629.VzlulnA7BY@nvdebian>
In-Reply-To: <YKUBbVuvm5FUJRMl@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <2235357.HsqDk0zIjc@nvdebian> <YKUBbVuvm5FUJRMl@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dfe2fa5-c08a-45ec-dc52-08d91ac7b06d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48131A696F2BF70CC10A783EDF2B9@MN2PR12MB4813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4tdDNENPPeeQgW1+xvJPcp1KfSSs/nC8L2EJiw/ILX7k4XWuqAoiPBFMfjDQdWZR+JZZarZ+NgsVNqohy+r+QutIvva3z6V3BkVoAPFNBVpx3o9ddUfzAZABNeief0e1KXnnAHcEdTiGfmfmcVGK7xPoJ1FWwqFN/Mk1e9bBcwhHgIKSn7RG0ww5hfMVJRbL7xC8m6zz4X7iiqGeJzAGmg6i8rvJxQggn7XA7jl773n4+fFRXuUH+fNbRoSz0xXQyT5wGkOai0lEB3fom6h3HwsP0MRCs2KX9RabYSlVt+Zssk0pwPWCapE+UBXkNx+LOs8/BAjDXoaiyKspwBE/pKNf/1iEKMwxPIgwupbRGLyD6PAmDKzqNAQOKJxGJ912pvqY65Mb+S3dhrfe49dD+ZNhsDDdxCv7S96I/INFJyLxyfIxRf5AuOslCRqIf7heE2Ruwf5OFo7aL1Q6iHZJMwbBslP4Xw3e56Orwbr0Y/Op/1cIbxo4PXkr0BBEJTSKbNbTunsUVMe8o1+A27y/fq5CNagjCaT6LoD2JCOCmXSUqYQ4SA7PzXIp2DIctqTEI9Jtn8dhkVvNIeGnkN9AvYZPVmaMZP+M8QZEC3T5G3vQ7l6bPLkkQelIaDCH6v7fvUQ0UAZThxd50dl8IrGybnfiMPNekXU77j0IlrBycrZkWg1IGwhJQOPmnMawkfT
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(33716001)(7636003)(82740400003)(5660300002)(36860700001)(356005)(316002)(36906005)(83380400001)(9686003)(47076005)(86362001)(478600001)(2906002)(336012)(9576002)(8676002)(26005)(8936002)(186003)(16526019)(7416002)(82310400003)(426003)(70206006)(54906003)(6916009)(70586007)(4326008)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:12:00.9280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfe2fa5-c08a-45ec-dc52-08d91ac7b06d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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
 Jason Gunthorpe <jgg@nvidia.com>, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 19 May 2021 10:15:41 PM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> > Failing fork() because we couldn't take a lock doesn't seem like the right
> > approach though, especially as there is already existing code that
> > retries. I get this adds complexity though, so would be happy to take a
> > look at cleaning copy_pte_range() up in future.
> 
> Yes, I proposed that as this one won't affect any existing applications
> (unlike the existing ones) but only new userspace driver apps that will use
> this new atomic feature.
> 
> IMHO it'll be a pity to add extra complexity and maintainance burden into
> fork() if only for keeping the "logical correctness of fork()" however the
> code never triggers. If we start with trylock we'll know whether people
> will use it, since people will complain with a reason when needed; however
> I still doubt whether a sane userspace device driver should fork() within
> busy interaction with the device underneath..

I will refrain from commenting on the sanity or otherwise of doing that :-)

Agree such a scenario seems unlikely in practice (and possibly unreasonable). 
Keeping the "logical correctness of fork()" still seems worthwhile to me, but 
if the added complexity/maintenance burden for an admittedly fairly specific 
feature is going to stop progress here I am happy to take the fail fork 
approach. I could then possibly fix it up as a future clean up to 
copy_pte_range(). Perhaps others have thoughts?

> In all cases, please still consider to keep them in copy_nonpresent_pte()
> (and if to rework, separating patches would be great).
>
> Thanks,
> 
> --
> Peter Xu




