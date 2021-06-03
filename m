Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11A399FFB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0D06EA03;
	Thu,  3 Jun 2021 11:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7F96EA03;
 Thu,  3 Jun 2021 11:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5QYTg87ElbWpzxPOOzEeKeG/Hje/m3Plj9en1TVQ5gava1v/t1XeMVN0KmA1MIPv4/GbaLotEvOsJDQSMdUB1bo4R0qMgdIAAMsf9vEJvmEY374J7/Xr21lDUXkQY0hlBaIDP1NAastqHGTpLAjPS6H3+OqQUB6I8hOpgLUDS4FlEKdEdXZTSCheNGE2CAOmNCLBtjbQnPcNV2txVHFajp4UYdxV4Ops3ZZvg75Hl9wAnJkCzHkYP/03SfgQy52bLFC2uRTxGtVtj4YNXoye2HeL3kOQHVR2BqcxmIp2DNup4F4kk8dtSGjPKFukOWGgGSQdkwvINE3HWDV2hQ3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+nRT/IplMZnWnH1VX2m3EkwFBAgRY6eDoR5xRm/YeA=;
 b=iFSu4pUL762OyOiSEqvY9MSsgc+jxr1bqh9pBb/kxFyzALh6UwbJE3kxBT8eeU8wCwT/y8FYnEMWdtPm5NfCvz6zahhs38wltbwfPG7xX2O2SJxevZgCm6XVYniRkksjhRKV+/y3BC19wjGKhp9bGwQVPM/Dz6pe/vM6ZYhcoQcIhWaopzPMPGgse2/3wbShTUzcKdOt4pqGo1xZfOPg/VZBFL5FE4Wa3Ds1SWN3HqEKbQ2LJgwEueEmnC2pEX1zV7yFYbopM0o9MmyPAr4mGmEY9SPKzaeHjE3NLK1G4DAaqHPoG2dJ0n8BqYMJatTSWNPCBi/jEhQhKJVe6+nmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+nRT/IplMZnWnH1VX2m3EkwFBAgRY6eDoR5xRm/YeA=;
 b=eCvIPhUhJV5Ulv7Znv5x6twv4LvMgvvxL3dC9svdMZKkVQomqg7eNjsf+UKHNWvzc3zpWjfQW6tDBOHE0bB0tp/qaPydgwwAIDl5sIzIiqYG6NV71xLbo8jZJ3cYgbD91ouOhx5fWRESe6haYdH7GtMOxpfUXxlqVi7NWZhn+T+V6vXwC/sAW/ggkMx2aemYbr6rvd81rlyufy3tnCu82Zj83pP7jj7E4RW5h+3eUmGcnzZiatCeIcxCIs5bJKS1yDXnzqCHyeMYXlIRNlnONDO0ROdqc6AV+xzFw3eKTL8wWCe7Ad5Os7TVFDzUaexkaAzh1QhsbHrK7YYLkb2aag==
Received: from DM5PR06CA0051.namprd06.prod.outlook.com (2603:10b6:3:37::13) by
 DM5PR1201MB0154.namprd12.prod.outlook.com (2603:10b6:4:58::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22; Thu, 3 Jun 2021 11:39:40 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::21) by DM5PR06CA0051.outlook.office365.com
 (2603:10b6:3:37::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Thu, 3 Jun 2021 11:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 11:39:38 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 11:39:35 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Thu, 3 Jun 2021 21:39:32 +1000
Message-ID: <3853054.AI2YdRgKcH@nvdebian>
In-Reply-To: <YLeXqp/U0DgylI/u@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop> <YLeXqp/U0DgylI/u@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da1a8c05-f034-472a-f7fa-08d926844524
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0154:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB015468AB4EEFD3462C125280DF3C9@DM5PR1201MB0154.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu5nmTyoC00d68XOsqh1ADdwyt77dxqxpI42/gA5/B3/ASBG/rsAud0QVEkLap10LDrGld3JrJEoOUuXSA9goMPnws2u+HNyp1xvLuJ8PFxZbQc3qrD0MFyZtZKxTpeRAu1+vkjz2Am+VOGMSUNDiq6rJHvS0lst+wMhdWqPCSvM94KxePPcmqOpfh+TClvZosvcDd2aZDHC9hJYlalG9DnQQG3uat+IhmmsEfcz6Qa+YcjFS17404C+jAB+f2gtx9VdQTcXev+2O5jSBbkOqCjzJe9AeAVZo9OZpPdvyPePpjI8u466D1NhJs7L1qrx2BIAMs+d9RBfj7h8xe8X/05vVYD+sAMjT6W2cQ4xXWtMHFH+ECmF/oFeP+L+jrMpCFuwlnBHQfp/p/hFpKG7E+ux0fvykgPqmSTz97kB3oOsq4Kj+2so/+f491DxXHNfljP3UYedhKSc0Gk1vwv8J5/AcHu/uW3uZO3kFfczjEWfdSq9a0ILxv7Xgi6GaLERz6wG1942E5djhfqBou/VssvXeOQAh3WYTFkL7XLRWGg8/+nSVQhveNuV8Ju80iaq5ToxBOUXsopILunu5fHim87oHOSykbl+Ox3rThbmZ+IaVzC8ufwOfMhmB4TFtqRUJCEgUCBySc8SvU7LLAm6Qaj1J4tcJXEFapuNNmDOSIcXUpS6vcJwGjSm38KFWhcnJ9PEKZ6gWF9qqUuyYaiNdyJKu0qyiT4LSvcAopRSibZZm7tsgJniCWyjxm18FLfahliV/nyM2xtHlxioLlsHbOydu9//3hvAc4mJZ6p+mVY=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(36840700001)(36860700001)(5660300002)(6666004)(83380400001)(36906005)(53546011)(9686003)(8676002)(426003)(336012)(8936002)(7416002)(9576002)(2906002)(82740400003)(4326008)(316002)(356005)(478600001)(86362001)(54906003)(6916009)(82310400003)(16526019)(26005)(33716001)(70206006)(966005)(7636003)(47076005)(186003)(70586007)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 11:39:38.6137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1a8c05-f034-472a-f7fa-08d926844524
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0154
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
 nouveau@lists.freedesktop.org, Balbir Singh <bsingharora@gmail.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 3 June 2021 12:37:30 AM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Wed, Jun 02, 2021 at 06:50:37PM +1000, Balbir Singh wrote:
> > On Wed, May 26, 2021 at 12:17:18AM -0700, John Hubbard wrote:
> > > On 5/25/21 4:51 AM, Balbir Singh wrote:
> > > ...
> > > 
> > > > > How beneficial is this code to nouveau users?  I see that it permits
> > > > > a
> > > > > part of OpenCL to be implemented, but how useful/important is this
> > > > > in
> > > > > the real world?
> > > > 
> > > > That is a very good question! I've not reviewed the code, but a sample
> > > > program with the described use case would make things easy to parse.
> > > > I suspect that is not easy to build at the moment?
> > > 
> > > The cover letter says this:
> > > 
> > > This has been tested with upstream Mesa 21.1.0 and a simple OpenCL
> > > program
> > > which checks that GPU atomic accesses to system memory are atomic.
> > > Without
> > > this series the test fails as there is no way of write-protecting the
> > > page
> > > mapping which results in the device clobbering CPU writes. For reference
> > > the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/
> > > 
> > > Further testing has been performed by adding support for testing
> > > exclusive
> > > access to the hmm-tests kselftests.
> > > 
> > > ...so that seems to cover the "sample program" request, at least.
> > 
> > Thanks, I'll take a look
> > 
> > > > I wonder how we co-ordinate all the work the mm is doing, page
> > > > migration,
> > > > reclaim with device exclusive access? Do we have any numbers for the
> > > > worst
> > > > case page fault latency when something is marked away for exclusive
> > > > access?
> > > 
> > > CPU page fault latency is approximately "terrible", if a page is
> > > resident on the GPU. We have to spin up a DMA engine on the GPU and
> > > have it copy the page over the PCIe bus, after all.
> > > 
> > > > I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE
> > > > would
> > > 
> > > Yes, for now.
> > > 
> > > > only impact the address space of programs using the GPU. Should the
> > > > exclusively marked range live in the unreclaimable list and recycled
> > > > back to active/in-active to account for the fact that
> > > > 
> > > > 1. It is not reclaimable and reclaim will only hurt via page faults?
> > > > 2. It ages the page correctly or at-least allows for that possibility
> > > > when the> > > 
> > > >     page is used by the GPU.
> > > 
> > > I'm not sure that that is *necessarily* something we can conclude. It
> > > depends upon access patterns of each program. For example, a
> > > "reduction" parallel program sends over lots of data to the GPU, and
> > > only a tiny bit of (reduced!) data comes back to the CPU. In that case,
> > > freeing the physical page on the CPU is actually the best decision for
> > > the OS to make (if the OS is sufficiently prescient).> 
> > With a shared device or a device exclusive range, it would be good to get
> > the device usage pattern and update the mm with that knowledge, so that
> > the LRU can be better maintained. With your comment you seem to suggest
> > that a page used by the GPU might be a good candidate for reclaim based
> > on the CPU's understanding of the age of the page should not account for
> > use by the device
> > (are GPU workloads - access once and discard?)
> 
> Hmm, besides the aging info, this reminded me: do we need to isolate the
> page from lru too when marking device exclusive access?
> 
> Afaict the current patch didn't do that so I think it's reclaimable.  If we
> still have the rmap then we'll get a mmu notify CLEAR when unmapping that
> special pte, so device driver should be able to drop the ownership.  However
> we dropped the rmap when marking exclusive.  Now I don't know whether and
> how it'll work if page reclaim runs with the page being exclusively owned
> if without isolating the page..

Reclaim won't run on the page due to the extra references from the special 
swap entries.

> --
> Peter Xu




