Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D446EE19
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AD310E5C4;
	Thu,  9 Dec 2021 16:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1689ABE;
 Thu,  9 Dec 2021 06:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFwamrN+acnf51V9itEVZaabZQlA//DmD5xMbQZYVL/IDVmE6LhuaMWHe0v8fLa8f4CFNmJOFK12P3gmjvh+/7wIQVTPFkDl2cuSUxyJ3hPWQYhSIsyJyQF0qLuR8+BrfIsqv03KVu/HfLdafSGu5pyEE5HNmFgxPvWh27xU7uM6xJ3t6sw+GWCaAIi1/IVDqVnQcK3lwuMKRpVoalaoTor07M/XTlKfjqYW7sSwW+X5mzOVDO3peSf0rjRdUw/9LtpxZP16X3hBK29bQeBD012sjP7yPxNGE3VoQBLqd1fyTKoippLyYlSsaB7AKaVbz37olJTf01eQjtG6pjCKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwUBwTTD6eMyUmidV+05of0MgoF7nwOYHtAHvU6N0Sg=;
 b=ZdCVrC+RevN0RgwhiK6sZRPh1HTUMOD+knMMYP+OjaHWewsw13Szo0FI93tzLBM7ov7ntoaZzG9YGnGN8fzBTAuDwVEbwInKS48crhFJHVO0gnsew16RcEeFSu3F13TSdRz4R7sKg84sjQ1ydrWIVsCqUWROYW0gyAbBoZOySqe38r/wMhEbLeHCV1SKYKA/w8BZkS3FSTF0yriiaCG2k6h9mRszuQEVOMvaY+FVBPcxoX1d8/K/FB7nGgtuzACJuG58g3Mqb8F5uKSTsAQvu9AW2lGrySz3uTMtc3vnMerWQMFrkFF692313qe1uJjSmsgXZYCINRoTwnO7u3mouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.12) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwUBwTTD6eMyUmidV+05of0MgoF7nwOYHtAHvU6N0Sg=;
 b=nJbux1Qw5Je2ZWXKLkM0PncpYRHutKyOrXE7GZZPPPEzvdtXi4QxzST0o1DSZRd7ZIJMhOqRv8TKwX5Es3/h3rvkeRUyNCxfaJ6HNwikte6rlq1Hk5hF/PgbB1XzjynpPV3g5mDVWt24ns79WLOb9HErENvXG1pShuHEnaqjWmIUKBksnJ4+7VXCZ1MYD+eStInnK5pM4FgHOJZ99WMNMJVoes5PoPXE0qjjbt5STkZQVu8SlEhlf+06kqoXmNbOboUItghW/kuiCs1dtR16pZAcWhLniKMJ/58yzeXBgGuXKJazHZubwd1DDl3am589kE3/E3BmPy1BfCNkwqTKpg==
Received: from MW2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:907:1::37)
 by PH0PR12MB5465.namprd12.prod.outlook.com (2603:10b6:510:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Thu, 9 Dec
 2021 01:45:33 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::73) by MW2PR16CA0060.outlook.office365.com
 (2603:10b6:907:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 9 Dec 2021 01:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.12)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.12; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.12) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 01:45:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 01:45:31 +0000
Received: from nvdebian.localnet (172.20.187.5) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 8 Dec 2021
 17:45:26 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Date: Thu, 9 Dec 2021 12:45:24 +1100
Message-ID: <117075453.Ddeq1f3ylz@nvdebian>
In-Reply-To: <20211208135345.GC6467@ziepe.ca>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <2858338.J0npWUQLIM@nvdebian> <20211208135345.GC6467@ziepe.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8face818-25b4-4b88-7b71-08d9bab5968e
X-MS-TrafficTypeDiagnostic: PH0PR12MB5465:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB546575A97EC67D418FA8DEF4DF709@PH0PR12MB5465.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61859y8NJ0Ntt5/r7EgRvwsDN5dHeI8FzC6C4ACjhC9FHv00bR8RiZUS5kibLdzaok1Jz+mrBX/HdjCg6tpuB7t5R096gQdQ4/khv+O+b9jWmusMJfqnc5CTJsewQzS6NIqqpo58psmtnN9neaAOD140LUDE/IveJLCaqFQ89xSQ0p8W//jAGseHgU4Zgm6v5L6wUnQ75k1L8q57Fyve/of+Y1SFJlfzEjlLjjH/o4ilTHkiQRIzAVByyEunum87q0iwV1EEZk6yN/12+fctos+sPHhNbPZ8FXFvW+QQxMGoYCkLuSZdAMvHTT3tbezmCM6z2+ZWK1OAzPvVDM1apj8w4cnIp/GuEeMwyTtNugUT+dnW0ORUx6GimWqtLQX9OT8HsjzuNlC6FbLvUZ23ol+JUqsbAYRFWHnUA9viafRqzdb9KPh/T8/KuYlDs6I5EV4CGTFi/2jD0oPc+FfLrd7I1EY1JVFNECcdEqEodeBsWV7EOrSmV8CS4JA+lxp//0X4DesoeS01Q7X/kpRmL2hDGlOZC34S7SIrqPSmQuLaHbbZoT6kYVomB7GJTzJHhL6kIJ8ZM3I8VdE8rBPe/cCRgCL1/UbxUwc80lRLUSk3ZzNqyiWgFq+WGFX4WGjY45Cxcg5NX4hkIyOAd3kIxWSXoMlbKThmv+EqQXqOnd9Nmg5cCYz3ytp2L0A3TBWyOYbAROFX3UQirrStNV3X991HoXTn2+4OakoN9+wu4PTkpvgjDPa3tqQIhgaLgEwRTfOExXN+4F/JaLQUn924Apa0XgSg/6Kq4QPGSQnnE/S+H2JixcHL7xYcieR/cppNc/Xduh1UQItjGrlRsHN6gT/GApgtppMQPvoquk7EqaQA/lp8eY5MWB3v0pUCOV9+
X-Forefront-Antispam-Report: CIP:203.18.50.12; CTRY:HK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:hkhybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(4744005)(6916009)(336012)(54906003)(426003)(7416002)(316002)(7636003)(186003)(5660300002)(966005)(70206006)(70586007)(26005)(47076005)(9576002)(8936002)(16526019)(8676002)(4326008)(508600001)(36860700001)(86362001)(40460700001)(9686003)(34070700002)(83380400001)(356005)(82310400004)(33716001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 01:45:32.3904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8face818-25b4-4b88-7b71-08d9bab5968e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[203.18.50.12];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5465
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
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 9 December 2021 12:53:45 AM AEDT Jason Gunthorpe wrote:
> > I think a similar problem exists for device private fault handling as well and
> > it has been on my list of things to fix for a while. I think the solution is to
> > call try_get_page(), except it doesn't work with device pages due to the whole
> > refcount thing. That issue is blocking a fair bit of work now so I've started
> > looking into it.
> 
> Where is this?
 
Nothing posted yet. I've been going through the mailing list and the old
thread[1] to get an understanding of what is left to do. If you have any
suggestions they would be welcome.

[1] https://lore.kernel.org/all/20211014153928.16805-3-alex.sierra@amd.com/



