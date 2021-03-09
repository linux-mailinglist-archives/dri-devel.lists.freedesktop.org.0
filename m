Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33510331C2D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 02:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1C689B30;
	Tue,  9 Mar 2021 01:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4389A6D;
 Tue,  9 Mar 2021 01:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMCvPrL6ayveLzdYZDl/To3RwmQTautnZVcJqx2Pb1dhSoRqn4nOiFbl8RMRWfSD90ZMy1MNRyMHNO2iq+JyKs9apkVo8qWDH9B0LR/a9lDsRyRGsfRc/0JaUXifULNWgH7AS5XgkFWtuI1sWNkLiGOjQu3KzKw0U3cKZsajZambbCXtNznxUQM1+WKsYwyvKzGico/9SP78zlB9ephVg9TuwyTNRHO5VZGVou/uNeLyW1M+9uuZSu3qkVsoDT0EntCs+4uwjWr99bCONdMW1FQZJjMcRataawWj9TO2OqmYkBXNZKC/1tKcTTsnt5St3COqT8TI+2Kar4X72kcraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tQXbMYeq+FZ6yArCaBTCoz8d2g5YR1FNHecZRJh10w=;
 b=EMmgB/Cq+lCGY2lxJGcSwL61pw/86nSohMF9S4qlW9Fe0Guycos3I7xDJuCNFIeIuSkkXC/Rt9VZ9RfbMD1zdo+fb/EKvUfRA9Qk2QUtOHAooUau2VB875m3vx3fR7kokkk2fYSCIGPsKT+Ukwnl65wUAt+ifvu7lJ2KlgSI+HjpEnpnhTTm1i/AlkBViIGsglKr57Yi1RjX22hMfdfD4D0QhQ9thrxrUWzpRFcKTd2q2Ime9YttCSSsk8pSmJDHeU1br7lqasdJ5kaNpxq99wBhdT/1voIrK2TgsJhCeMUAp67rdxri+zA5O2ji4Y+W53wE/HGgVSUv31EE8kbQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tQXbMYeq+FZ6yArCaBTCoz8d2g5YR1FNHecZRJh10w=;
 b=vAKTd7FC3IFahMO8cW/JhqO+D7evYrlqcu7oKeCj48iTOmB1bKRyXnOW4WAw4nLE40PQ7CQfq5aZ4GMtdnYExesTGnrMD55mj/M49YJ+d3ykVrFRib6LHYHf7fDUvB+aVfdcFu8AIupeOylZCOvihIgOHdNrEURG0GCohcYHu98=
Received: from CO2PR04CA0136.namprd04.prod.outlook.com (2603:10b6:104::14) by
 MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 01:17:21 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::16) by CO2PR04CA0136.outlook.office365.com
 (2603:10b6:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 01:17:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 9 Mar 2021 01:17:21 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 01:17:18 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v4 5/8] mm: Device exclusive memory access
Date: Tue, 9 Mar 2021 12:17:16 +1100
Message-ID: <1795020.LnfgZAJ4CS@nvdebian>
In-Reply-To: <ac380c1c-20f4-7c5b-dc5b-be6e1e970921@nvidia.com>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-6-apopple@nvidia.com>
 <ac380c1c-20f4-7c5b-dc5b-be6e1e970921@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9550d66-14b1-4073-5590-08d8e29916d9
X-MS-TrafficTypeDiagnostic: MW3PR12MB4474:
X-Microsoft-Antispam-PRVS: <MW3PR12MB447431527986E9024242BC63DF929@MW3PR12MB4474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eT4AfXYctdZI1Qch7dpjGj/ixHJxf/TSKb4C2DZByuS67WaNxcrrR/VBBhxJuJOg3WwzcdjzyISVndRO+fI+hmOugxca5Z+7V+9JfFcXGshlfkNJqquz5FNmkIb/ACS+qy8y0DCxZm4+Sf6t/9yKn5TlED2pSrIaXSSAifCsVxwnGFRWSuCblXa5BtWOGTmjk6X7vz3fp4z/oRZS5wDM2NyXWEQSGqQKR/c47tgRhbOjoIRNzUgKUqSOfvKCoY3GJHRyyiqIDJslxyYyyxmUz9tI4g8AM79T7lEmqO/lgVIzypkjCP3DSQdouWdYUfrjtcDhtVMTnP2MAcMN17wVgim6P6U4rTbRRnqweuAG5D+OSKsYIBtpsnjZgKlKu5W+diOM1bgjG0Rbb00xl+sCG+uz3xKDKXL6dEg1mlPW8yI1MMVtK4uttRzIW+oO8GMujQPMk3NR6fh4nWRAvmdjQupN5L5QavEHA4us4WNdOUH/Xiu+BXwq4imKTpaFwNkrpkiJeKkX/Ztw8E78SsgnB8131O+R4JYPbGzmegcR54ZFDpOo3agWwq84qZ6i3pJG7ZEy8EryrLpiXD7ZKMPfwrq/ZEBaLHbCHQfr/nbPs3CwLFiIY+cQG/sT9uAx3KwfIPjva/q53eks+uohsFmurz68PJnAHgMBe7c4RHXtuWB7KzOWr38VGs2gwMJEBF08bIb947zwSyAsykRbw/hCyQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(36906005)(86362001)(8676002)(426003)(16526019)(8936002)(316002)(356005)(478600001)(33716001)(336012)(5660300002)(54906003)(36860700001)(47076005)(6636002)(2906002)(186003)(83380400001)(34020700004)(53546011)(70206006)(6862004)(70586007)(82740400003)(9686003)(4326008)(7636003)(26005)(9576002)(82310400003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 01:17:21.3001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9550d66-14b1-4073-5590-08d8e29916d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 9 March 2021 6:44:41 AM AEDT Ralph Campbell wrote:
> 
> On 3/3/21 10:16 PM, Alistair Popple wrote:
> > Some devices require exclusive write access to shared virtual
> > memory (SVM) ranges to perform atomic operations on that memory. This
> > requires CPU page tables to be updated to deny access whilst atomic
> > operations are occurring.
> > 
> > In order to do this introduce a new swap entry
> > type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> > exclusive access by a device all page table mappings for the particular
> > range are replaced with device exclusive swap entries. This causes any
> > CPU access to the page to result in a fault.
> > 
> > Faults are resovled by replacing the faulting entry with the original
> > mapping. This results in MMU notifiers being called which a driver uses
> > to update access permissions such as revoking atomic access. After
> > notifiers have been called the device will no longer have exclusive
> > access to the region.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> I see in the next two patches how make_device_exclusive_entry() and
> check_device_exclusive_range() are used. This points out a similar
> problem that migrate_vma_setup() had before I added the
> mmu_notifier_range_init_migrate() helper to pass a cookie from
> migrate_vma_setup() to the invalidation callback so the device driver
> could ignore an invalidation callback triggered by the caller and thus
> resulting in a deadlock or having to invalidate device PTEs that
> wouldn't be migrating.
> 
> I think you can eliminate the need for check_device_exclusive_range() in
> the same way by adding a "void *" pointer to make_device_exclusive_entry()
> and passing that through to try_to_protect(), setting rmap_walk_control 
rwc.arg
> and then passing arg to mmu_notifier_range_init_migrate().

Thanks for the idea, I had missed there was already a way of passing a "void 
*" as part of mmu_notifier_range_init_migrate(). Agree that should allow a 
single pass without needing check_device_exclusive_range().

As Jason points out still need to check the GUP page is mapped at the expected 
address but that can be done as part of installing the exclusive swap entry in 
try_to_protect_one().

> Although, maybe it would be better to define a new
> mmu_notifier_range_init_exclusive() and event type MMU_NOTIFY_EXCLUSIVE so
> that a device driver can revoke atomic/exclusive access but keep read/write
> access to other parts of the page.

Agree, I don't think overloading mmu_notifier_range_init_migrate() with the 
exclusive usage is correct. Better to define a new helper.

> I thought about how make_device_exclusive_entry() is similar to 
hmm_range_fault()
> and whether it would be possible to add a new HMM_PFN_REQ_EXCLUSIVE flag but 
I
> see that make_device_exclusive_entry() returns the pages locked and with an
> additional get_page() reference. This doesn't fit well with the other
> hmm_range_fault() entries being returned as a "snapshot" so having a 
different
> API makes sense. I think it would be useful to add a HMM_PFN_EXCLUSIVE flag 
so
> that snapshots of the page tables can at least report that a page is 
exclusively
> being accessed by *some* device. Unfortunately, there is no pgmap pointer to 
be
> able to tell which device has exclusive access (since any struct page could 
be
> exclusively accessed, not just device private ones).
 
I have also experimented with integrating this with HMM but it just didn't end 
up being a good fit for the reasons you mention.

I also don't think adding HMM_PFN_EXCLUSIVE to read page table snapshots is 
that useful because there is no way to tell *which* device has exclusive 
access. So unless I've missed some particular usage for it now I think it can 
probably be added as a future improvement to HMM if/when it is needed.

 - Alistair



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
