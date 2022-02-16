Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBD4B7D86
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5A210E60D;
	Wed, 16 Feb 2022 02:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD9010E610;
 Wed, 16 Feb 2022 02:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOq+DMp+km0e8HC2+YOpSh5Gwp4M8cd1XIaXl0eMzd685Hsf37HUX9Ftcy0eh1dj8vybK/8scw5odBI8P+Vvj18G6FrHCWjBfXCS3Xph9SOq5wdqs/HKcUiOO0X5/xGivCU78J0xJoSwv45K/uoy6iSGUd1XGxEz1U355va7aXkLxmtw59FUQXipkRrBDrtu751ACxKN82eBXH8fM+ApB/4/7y12/0WaPyHh/I4hEu5v9Yt8oYZmejX8+aplxY1ZKlQVjrJX8eoyMdUxgPBOa9TZr2/u05G4QSA3MPdMoD0Vf5Y0MD7LKbPX9+pezHf6H4fOBmIKqZg/6mjecMinJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6u4KSkTaAdZ3Y1/l8px2yzaaALzD3TCdjvTMQCo2v4=;
 b=Du6fNXqD+8bNhVh4c4+cIp+kHee4jgxmCrjhH4gi2YYlzIuDc4FTpf9w9Y4n+7lWfzU/keUjEwEArJ3e4TjKSJlFxlwzn/RjC0m+E4rGxZz/hxzo3xZblPeyXlA0oLU6iJqr3zKgOvAX+SVI+1Gkl5Hr/p3qvw5pvfol2F6o1rQOra+rXcZatJaeMMMzMBu+1rs3j1w/zB2ARfyq+qfjOrQBAgj36TCHv0gVOSNDyX1fuU4o30BomCX3qqpUs3fvmSM6iTFkbBwK4/j0YZ+I0OVhAQ8jPZhRxe/0Tig8ayBwAQrdxc3EC8OHL4N83L3/C+lk9S4QoLHCDXK1DyETFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6u4KSkTaAdZ3Y1/l8px2yzaaALzD3TCdjvTMQCo2v4=;
 b=tgfdDFWWlxNy5M/lNqnnti0A+xqc4dBOgi3czZyG1cSrQPsbrNka3/ktzS6Obtma9gjQzrVWQf/C15gJVzzyd2v8TOVcoo3Hn+voKYABKN/5pPzOz+m7RHaXKJ5BizU4RPoJonmhB8ZQ5VoF5dz0oykJKDJaag4EN2hopO6FqqOM8PLWltWIxa/OMIxMQOOcL/9QziAhfy+rwrfwZwSUmfGDgSDkByMKoGrlHHQrnVIwn7yen0IL7QEdiO3N4Gbvcp9Z2VugXAi/YQWijRpKlKUd+KQWunHs070aZk6WMl6NhGgiLD5qsisRF+o7XkeELqFunl08kt0kl6mEqr0X/Q==
Received: from BN6PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:405:4c::31) by SA0PR12MB4559.namprd12.prod.outlook.com
 (2603:10b6:806:9e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 02:36:41 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::d) by BN6PR1201CA0021.outlook.office365.com
 (2603:10b6:405:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Wed, 16 Feb 2022 02:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 02:36:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 16 Feb 2022 02:36:40 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Tue, 15 Feb 2022
 18:36:35 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Wed, 16 Feb 2022 13:36:30 +1100
Message-ID: <6156515.kVgMqSaHHm@nvdebian>
In-Reply-To: <20220216020357.GD4160@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4567b3-3ec2-4bce-f67a-08d9f0f529bb
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4559DE6B57412D6F45E1243BDF359@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zsrOwL6/Kf3cPfkQvFEIIPX5y/jZRCIMCj36Vr2HhNJpmB0Cezj7+ECiJ5DSu3OQedMMcp787FeP3t23OKux5BTWCtIyuD3Ef28tTVFtJCby+h3qiEhTucR2pMWd8iLBjxfE4wZYTV4coDfZ0iCi11yl3zkdkL1/+qw+OGBYQUiMo7/SHj8JaLBt5EGYXx6E7WjAlK8hvZoHrHog3gYlE1g6+tNSfjq4IXKwNsuGmC7mDncAuM6s5whOhrlEWEJTUq6HrUEyUcj1J5Jra1UPOjzc0rx+A9X7wUydwJa+CoYXYdM13ic/Dmn/zdUWtPfCRnEhrHoIHFWFdWtOQ8cv/RHahJIAHyBALv4wwnGAAZr5abdww51T66Chfif8Voq354Gxm80hiw3mRQhOikEZ2/iNBS6Gt0W0PlA+t1z4INZrk4W2VJxm/dK+MboJeX81ezEFlgmZe4+aSeB5jqoRcZpXjEP13SRNYsBsrqIu1rHNjbcMHuPBOe9cFNRuTgPoyKxwLRs8+Gb21P2TDPGLe0c24DOQQKN9QGdgYwzA+w4j9jQpsqWtFxd5+AiZ3mi2oNvrYrcy6/c8P6FTjUESC7iAhiDRLw2+E7X/GKT89RDt9w5x+Ark1e1zpqOXt+WTmn1Qha6Rru8NJyJ5u2zzObNeyD23RjwvVglbdNoZj2jnqfJLfvh+QBAyoXrNJ198JtS/HYfJ7475xbAfpL/bNg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(70206006)(54906003)(82310400004)(426003)(6636002)(16526019)(9686003)(26005)(8936002)(316002)(40460700003)(47076005)(336012)(186003)(8676002)(81166007)(70586007)(6862004)(9576002)(83380400001)(86362001)(4326008)(2906002)(5660300002)(33716001)(508600001)(6666004)(36860700001)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 02:36:40.5755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4567b3-3ec2-4bce-f67a-08d9f0f529bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 16 February 2022 1:03:57 PM AEDT Jason Gunthorpe wrote:
> On Wed, Feb 16, 2022 at 12:23:44PM +1100, Alistair Popple wrote:
> 
> > Device private and device coherent pages are not marked with pte_devmap and they
> > are backed by a struct page. The only way of inserting them is via migrate_vma.
> > The refcount is decremented in zap_pte_range() on munmap() with special handling
> > for device private pages. Looking at it again though I wonder if there is any
> > special treatment required in zap_pte_range() for device coherent pages given
> > they count as present pages.
> 
> This is what I guessed, but we shouldn't be able to just drop
> pte_devmap on these pages without any other work?? Granted it does
> very little already..

Yes, I agree we need to check this more closely. For device private pages
not having pte_devmap is fine, because they are non-present swap entries so
they always get special handling in the swap entry paths but the same isn't
true for coherent device pages.

> I thought at least gup_fast needed to be touched or did this get
> handled by scanning the page list after the fact?

Right, for gup I think the only special handling required is to prevent
pinning. I had assumed that check_and_migrate_movable_pages() would still get
called for gup_fast but unless I've missed something I don't think it does.
That means gup_fast could still pin movable and coherent pages. Technically
that is ok for coherent pages, but it's undesirable.

 - Alistair

> Jason
> 




