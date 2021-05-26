Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251C3918D6
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA18A6E4B5;
	Wed, 26 May 2021 13:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689B6E4B5;
 Wed, 26 May 2021 13:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB6o8mFJAUPIc5h23BlWsWWQsyXXwNjKu4ZG9HLWgj+Ujzvcqm3A7Gn1LN1T99FMNx+RLzQm4qb1gskYWeZJRfYMJ4W73IoKgWV/2dBMzapuCVJA176rJOf7kzfkr9YQOOSfhAnBcJgiFR1nRoYxM8kyBsJ0VHy8XnBGX9NvBExt9oClXG3gsGWhU+FsI1r6K0tmcYQTUM/bcEKY/nmp2mabmOK0gMMwYx0TgAoiV/mFVGTRow5pFs7XJ4O7kyaSWxUBwtImBLXygPT6wyhUUlF1Pe/xMRYgpaLj+dT3nkSeyz1yde3GbEPdy31+KiCozdk6AF1p4pS6Vm/NImWi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXZ7nVZreomlWJgXxkw1HoGMAC5o8Vi6LPHQcMubhDw=;
 b=HGZ6rc6BM7riF7dGpsE5vM+uZJOcdp9TliQRAVaGDCmcwLfKX1y8toqTb/5tXO6KkjbrxH9UvLWlsgiisHDudMrEq6fGRu+K1XU7mb1gOQbH5ZIjr7zm/rkYcHglFgh+nWx7VPqVyUubWUZ689vBs+2vloy7otW48fUwPnAZaA4WZUc5oIinO9RMtiU+/jh20ziJyfWsnxH3BHWXKtintEN/4OfNDok0Sqc3kXN23k3YjL6+PdINnqaTfzjf8+18885l9JYxaDTaFCx6EVLYFyZK979DRVsp56loUEcJUzC6FeW874GmwBNYjuZk1fA/skJTERVnAgn7YIcE8olgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXZ7nVZreomlWJgXxkw1HoGMAC5o8Vi6LPHQcMubhDw=;
 b=HGs5YnT2JVSLvUonnho38j/bN9uCxc8Y7ca6kMvotDGxMpYR62HV5dBkYuPxLlu8UGcQR/CKvkEU8TX8GRK3yJX64SZWCCxIscFcm4ygS7rspZhi2LXFE9YrZFSWwkGjkujbZPXtasUjkD2X0b+msz7Lr26vtblObLbaZOO53HzJ7LjISGgQSQ7YKUS0ImWhLy5l3+ap/8wbX1OX6eSZHB59NrAY02377nVMudKZVRP89Wzd8dsJENPr7mXy0NuSFvHmkQ6XQF16L2ake0ruRhMqvu0q487hIUdyr4q/sIfQizvG75yyerqF8AXlO5esCWvTBLXQPn7UN5fZGXFdeQ==
Received: from BN9P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::24)
 by SN1PR12MB2558.namprd12.prod.outlook.com (2603:10b6:802:2b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 13:31:14 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::c8) by BN9P220CA0019.outlook.office365.com
 (2603:10b6:408:13e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 13:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 26 May 2021 13:31:14 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 13:30:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Wed, 26 May 2021 23:30:06 +1000
Message-ID: <1743144.c4ng0vEeQp@nvdebian>
In-Reply-To: <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <YKzk0ILRsyazMs2W@balbir-desktop>
 <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed443741-482a-4799-df78-08d9204a88b7
X-MS-TrafficTypeDiagnostic: SN1PR12MB2558:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2558DECF0C3D61C13378E927DF249@SN1PR12MB2558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foRqUTFWo0dI7eIchjpM3IfFGtr5m8WNQVh0y9rHJAsT0PfOjCS4iihKRTZ0FkJBHWfcpiqOQ4a1oEuNnVQ1F6pfpaPRP3/5qqGJijHMDZgRrwj8Gx/XVrvXCjzRZULf9Dq9B2G47brMsi3lG4O7TbOQ4z+70rxElHdhhi2XclFzvKfqF3Zysi0BlttKlc1qSkSexmohI6irh5JkE1UDhrrXctSqRNAnMqKb1fEi483wlsao0/LxIFa6BycZXEP08EupYSlnOEDL2+gj+OssDxPDrOcH9eeup6VveI3JZgzSMnlDil6kc3IaDkNIWdth+JtTlG9auEHpfYEH0aRAwHV9smI2xMSnYQuwl2kd6kZPfDBL75d35w8TAc0lyBGtOG/s3llB6Yupx5wxlZc4kl+DpQ0fU5p4Uhmhcfx5kJiBTlxtf/us6vKLm7by83TEg5bCn/KJRw7oWrYGsQrRHB/jweqOxpousH+gtoKXDRWB2B3V3GkbM7ZvPuIC34jyDdYLt57Bvuwx0dcgj8xkM38b3oW63O5xje+/BAYVpY0NIVlsvjR9oFkC2+U6UJ9q/XPFy2QYDfbRJndspn/B67/G3kbE8sMujkxJCGolOXBaM/7C6Eat5hr52unXaOhWp5bP4YBsoaKJS9jcmbUbTIPPaMUsaCMsZ7jIYFevrp4eFb39kh2bIVC+oOKJTjr+y390cWD/uvL7fsi89f9dt2XLSEHwONJYQnxzlqtTZm591p8S/xbuYCtygoUSnDtOTAgsd/7UgFWih2iqs9Koe1QcYnqU86phmMSzdXbsu/M=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(53546011)(5660300002)(7636003)(426003)(36860700001)(6666004)(54906003)(83380400001)(70206006)(8936002)(9686003)(8676002)(336012)(478600001)(33716001)(356005)(16526019)(186003)(26005)(36906005)(7416002)(316002)(6636002)(70586007)(86362001)(9576002)(6862004)(966005)(2906002)(82740400003)(47076005)(82310400003)(4326008)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 13:31:14.0367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed443741-482a-4799-df78-08d9204a88b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2558
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
 dri-devel@lists.freedesktop.org, peterx@redhat.com, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 26 May 2021 5:17:18 PM AEST John Hubbard wrote:
> On 5/25/21 4:51 AM, Balbir Singh wrote:
> ...
> 
> >> How beneficial is this code to nouveau users?  I see that it permits a
> >> part of OpenCL to be implemented, but how useful/important is this in
> >> the real world?
> > 
> > That is a very good question! I've not reviewed the code, but a sample
> > program with the described use case would make things easy to parse.
> > I suspect that is not easy to build at the moment?
> 
> The cover letter says this:
> 
> This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
> which checks that GPU atomic accesses to system memory are atomic. Without
> this series the test fails as there is no way of write-protecting the page
> mapping which results in the device clobbering CPU writes. For reference
> the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/
> 
> Further testing has been performed by adding support for testing exclusive
> access to the hmm-tests kselftests.
> 
> ...so that seems to cover the "sample program" request, at least.

It is also sufficiently easy to build, assuming of course you have the 
appropriate Mesa/LLVM/OpenCL libraries installed :-)

If you are interested I have some scripts which may help with building Mesa, 
etc. Not that that is especially hard either, it's just there are a couple of 
different dependencies required.

> > I wonder how we co-ordinate all the work the mm is doing, page migration,
> > reclaim with device exclusive access? Do we have any numbers for the worst
> > case page fault latency when something is marked away for exclusive
> > access?
>
> CPU page fault latency is approximately "terrible", if a page is resident on
> the GPU. We have to spin up a DMA engine on the GPU and have it copy the
> page over the PCIe bus, after all.

Although for clarity that describes latency for CPU faults to device private 
pages which are always resident on the GPU. A CPU fault to a page being 
exclusively accessed will be slightly less terrible as it only requires the 
GPU MMU/TLB mappings to be taken down in much the same as for any other MMU 
notifier callback as the page is mapped by the GPU rather than resident there.

> > I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE
> > would
> 
> Yes, for now.
> 
> > only impact the address space of programs using the GPU. Should the
> > exclusively marked range live in the unreclaimable list and recycled back
> > to active/in-active to account for the fact that
> > 
> > 1. It is not reclaimable and reclaim will only hurt via page faults?
> > 2. It ages the page correctly or at-least allows for that possibility when
> > the> 
> >     page is used by the GPU.
> 
> I'm not sure that that is *necessarily* something we can conclude. It
> depends upon access patterns of each program. For example, a "reduction"
> parallel program sends over lots of data to the GPU, and only a tiny bit of
> (reduced!) data comes back to the CPU. In that case, freeing the physical
> page on the CPU is actually the best decision for the OS to make (if the OS
> is sufficiently prescient).
> 
> thanks,




