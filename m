Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029238FDAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362816E9D2;
	Tue, 25 May 2021 09:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151C6E9CF;
 Tue, 25 May 2021 09:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOv8Yn/bWSBzf0d2UDyBdAoyZiFaV5kc+B4u+3Qkwgt3bLkYZCcJvZamrlL/w228im9MiuvfBZYoRWNXNdBw9H3ij5MulTZ/ZkFCnKMlxJkz0XdOzPmpto/BLnOly2EkcNXMsj76y5yFyjcM0BfxxZ8WQHf5MCai73VsDDsMWLKFuJnLGNpT9PLTyY19am0mbq6kjJul6MbXL204J6jWMin5CCDHhL3nCMxXebSqa5frCWu83QSRhi7ltiadAWwJr6vtfOmGvCSxiQ720J9aCfO8yMJdtfiQ1GPX0JtQ+Cbj3e5YtKVhLLkYPd+13VlgOecgMRjtwctIycXN511eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq8qKKgUYTpAWwe3J4TtLPIAkzziAbBGrTvUYSoeAXE=;
 b=S9CdOCx6ghPbTp2lhLwWrXs6UA3flDZ7//tfsJcC9g2EW6aDIVKIirj1lofRcoVgTclkPstENXE8DPLD9illPO9PXzZSgRgp4r1nv9P+9rWHD5Ti5OVsMWf2vblHlNNSzJAzJ+gF0W7lso+bxqQICF+3oCugXeknqFpsU7q+opiyeFlyRvboIBRwu7KkM0O0pnFhwNsQjdWshyK2fftHQxjlhY10ff12Ld+KuuR7Ur9nY6831RG7EPy4MFMDv9716mt/786oPcxgxes0BEPuWqiBFJpyCPGEzDp5n+ypGi2deLHpY52LF3u52piVQLB9YOQ374cu3WI/hsPzgRRggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq8qKKgUYTpAWwe3J4TtLPIAkzziAbBGrTvUYSoeAXE=;
 b=pFVJFmUHmmDbjim3En+Xi1lVsbk1yCd7mnVDJHn3rJV4JrYY/wqEEN5J9nMt4lgk4y3B7xQ9LdjF+ajMkqyL3AtpozZtiN7+YFWd4wuvL1c1c/QLT0jHQXGZVpu3kXSgght6Ez09Ndvm4ajhoD5okhbB+YJWoAEAF56Zo7qP+IRoBSIPPreNwSEV6142/qimRZkpm0Js/LlO0OprD9Lsr+fxf5yg0jj4giGhoMKjN/p4GsFHH8nRGQrRfqKjEmnHaScCE/mL8pXoMAYdewUL6DBUEjWaAQIV77jJCofD7iXXqovIqWqMvDGBOPKL3BrFi6fvPxlUGHjEffbi92Iqjg==
Received: from MWHPR20CA0023.namprd20.prod.outlook.com (2603:10b6:300:13d::33)
 by DM6PR12MB4329.namprd12.prod.outlook.com (2603:10b6:5:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 09:21:06 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::6) by MWHPR20CA0023.outlook.office365.com
 (2603:10b6:300:13d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Tue, 25 May 2021 09:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 09:21:05 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 09:21:02 +0000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Tue, 25 May 2021 19:21:00 +1000
Message-ID: <1713476.5JtYssUy2z@nvdebian>
In-Reply-To: <ccedcc53-ead0-a482-1ef0-3702cc82faef@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <ccedcc53-ead0-a482-1ef0-3702cc82faef@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f706055-f43b-4363-4ffa-08d91f5e6ca9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4329:
X-Microsoft-Antispam-PRVS: <DM6PR12MB432983777DE0A933A4DA892FDF259@DM6PR12MB4329.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8NwyuHfOikcijJ6VK/kYyYh7Fay0cR4Lw0UAODTPUqz8hCGdkC6/bpybe3OGlxCMFxu7aIlA0LBErIEy916FtfYVWVdl4r98t04PHR+SK7g/+3ncyf1w7Gb1ZxajwhbIUO/2aqXNLqr7sbUHI1URSDW1A8wWh2ORdCibyCmOCH9BmTMhMYJDM+zZ2b9i6miQBeibjReyafGxF6gogaaXthEVQn9Hv8gmK/jfTMTLmlGcrelBm3XmRCpq4Guy3FBiimSnBZB3icvuO/TzEBnySpSEVtUqyvJPvuLWU8IXSiB2sd9r0QMa/8h1q1Sjv1O8ZQdQmhNcwQ1dOsA0GEbuEeTD0APBBFnvY2CSg8qWlYSyzk+5MxIb6O2pNwJ/vSL+tzAwEs/w1j5fghxZhKGiCTKk8p0DSTcIyIsij7EsC8kIapImF8jjCCtsbu7wMVOYIa5d02VbuwyJyp82loKUmLRe5mJ8HVX14YCaT20LsfZPbVsdJmylctsj7ep8lPjImxroc56G3TcvmgozJ9WV5TDSfOzyFx5/SZ9FtnPcRE93qB3ITaC9OIvKoutKDw+a+ulVGk8snho6H5zL68+o6ATuLg1/afvUZ4MfwdD/8yu5bzrUuTScjFXuCkLzWaSDmCgqWzvP3a+z86AAjHYyrV5NJi0rGO1okLwIdD6iu06P+rsz2TMxSugKGGrdnd+
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(33716001)(70206006)(4326008)(8936002)(6636002)(36860700001)(70586007)(47076005)(82310400003)(7416002)(26005)(82740400003)(336012)(2906002)(8676002)(186003)(53546011)(7636003)(478600001)(5660300002)(86362001)(9576002)(36906005)(16526019)(9686003)(83380400001)(316002)(426003)(54906003)(6862004)(356005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 09:21:05.9228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f706055-f43b-4363-4ffa-08d91f5e6ca9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 peterx@redhat.com, hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jgg@nvidia.com, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 25 May 2021 11:31:17 AM AEST John Hubbard wrote:
> On 5/24/21 3:11 PM, Andrew Morton wrote:
> >> ...
> >> 
> >>   Documentation/vm/hmm.rst     |  17 ++++
> >>   include/linux/mmu_notifier.h |   6 ++
> >>   include/linux/rmap.h         |   4 +
> >>   include/linux/swap.h         |   7 +-
> >>   include/linux/swapops.h      |  44 ++++++++-
> >>   mm/hmm.c                     |   5 +
> >>   mm/memory.c                  | 128 +++++++++++++++++++++++-
> >>   mm/mprotect.c                |   8 ++
> >>   mm/page_vma_mapped.c         |   9 +-
> >>   mm/rmap.c                    | 186 +++++++++++++++++++++++++++++++++++
> >>   10 files changed, 405 insertions(+), 9 deletions(-)
> > 
> > This is quite a lot of code added to core MM for a single driver.
> > 
> > Is there any expectation that other drivers will use this code?
> 
> Yes! This should work for GPUs (and potentially, other devices) that support
> OpenCL SVM atomic accesses on the device. I haven't looked into how amdgpu
> works in any detail, but that's certainly at the top of the list of likely
> additional callers.
> 
> > Is there a way of reducing the impact (code size, at least) for systems
> > which don't need this code?

All of the code added to mm/rmap.c is specific to implementing this feature 
and not depended on by other core MM code so could be put behind something 
like CONFIG_DEVICE_PRIVATE to reduce the code size impact (I realise now it 
currently isn't but should be).

The impact on compiled code size in mm/memory.c also ends up being minimised 
by the compiler because all of it is of the form:

if (is_device_exclusive_entry(...)) {
	[...]
}

Meaning it should get thrown away when the feature is not configured given 
is_device_exclusive_entry() is a static inline always returning false in that 
case.

> I'll leave this question to others for the moment, in order to answer
> the "do we need it at all" points.
> 
> > How beneficial is this code to nouveau users?  I see that it permits a
> > part of OpenCL to be implemented, but how useful/important is this in
> > the real world?
> 
> So this is interesting. Right now, OpenCL support in Nouveau is rather new
> and so probably not a huge impact yet. However, we've built up enough
> experience with CUDA and OpenCL to learn that atomic operations, as part of
> the user space programming model, are a super big deal. Atomic operations
> are so useful and important that I'd expect many OpenCL SVM users to be
> uninterested in programming models that lack atomic operations for GPU
> compute programs.
> 
> Again, this doesn't rule out future, non-GPU accelerator devices that may
> come along.
> 
> Atomic ops are just a really important piece of high-end multi-threaded
> programming, it turns out. So this is the beginning of support for an
> important building block for general purpose programming on devices that
> have GPU-like memory models.
> 
> 
> thanks,




