Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3A331785
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896116E118;
	Mon,  8 Mar 2021 19:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8103E6E0EC;
 Mon,  8 Mar 2021 19:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAYNsOBnD9K5j69ZJklHkEVi0VpZHBJPqe8Jufrj5CssrOMafXJUWKcdTRbrEbOJFU/s2crRrjYRJk0VM/ErktJwaIt5KE46MfdW08TZJUzksC9LOUMRNBk6DleCmQYoMSNMT0M2qzvTF/1izzP3wNtQJPKVYKQDEKKGBZaTD2AmHFzXpJ5VC45qQE8Un4mdfVkzXKUPrLskqFFb1IfbjIS2f/wEUa3GFHLYXEIRLltxRNr9iApJsc5yoKoOP4VhSsHsSRjbZh0gcNCdcsT/LrmSRNhiwwD5u5+E6efQd/m9jXrg9lDbdWQlalt2S3tkAO5iVchMUPlDp2o4oP/lkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXuweIGZpD1rAhThKm38YbhcqQzcbfCPzUVNuMMHetw=;
 b=Hmvzvu/HdgxHB4BS6yrQhECzhGkwNKTVlJIYeDrNuYUhG8vQz+yudofJE72XFLSGmXnsGD1n8r8cz/dY02YHhqAEr643/LB4yEZfgyt6vdHoYUWsS2VRKoAKK0Vpocy+urgXWKj2F+3YVW7hc+gG+rm0rjxOQ83rrtc0z47p+W6SWdhcFf4a4QFdQU4QXie44mMWbwo0g2wECfUvjQj8LhGHPdKDOxTaZoDWR3fTCGDPTsJQm0klzdFsTys7SIK9xlEXzwBoA6vgSPOaCgTNBVu6df7il5BF67Kk4fHnADsslXMDxD/OAmMUD7CTZlQmC9eOhbbhgjgyHiCvncrfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXuweIGZpD1rAhThKm38YbhcqQzcbfCPzUVNuMMHetw=;
 b=vzCe6fH/JRQN44a0pSXfUMc/FX5IiaIRpXA1KM8zAC9g1auma6fGY57wcD65/624vI8vdF4rXHYNMZ6BdPqQjCIIKvh2WXAAoLbORdefDrsIEC26UZoTS12KoEWT6SdsbSmIlDYQKv6jPosxnUO97IvLkcCnCCdXv4gSQ0VzB/Q=
Received: from BN6PR2001CA0004.namprd20.prod.outlook.com
 (2603:10b6:404:b4::14) by DM6PR12MB3753.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.29; Mon, 8 Mar
 2021 19:44:43 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::46) by BN6PR2001CA0004.outlook.office365.com
 (2603:10b6:404:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 19:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 19:44:42 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 19:44:42 +0000
Subject: Re: [PATCH v4 5/8] mm: Device exclusive memory access
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <akpm@linux-foundation.org>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-6-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <ac380c1c-20f4-7c5b-dc5b-be6e1e970921@nvidia.com>
Date: Mon, 8 Mar 2021 11:44:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304061645.29747-6-apopple@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e57866a-420e-4c5e-84d3-08d8e26a9eb7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3753:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3753817C745F0553B51F6963C2939@DM6PR12MB3753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoIZenOI0j9Hb2gEfsRmlyXP4qbH/OX0ioNmtrcpelMEqWnTQPd5PDphRkNa3VEnwfHgW0OiSUq1ICYR4R/8QsDiuHM8crQP9geDNEPU//3U0+j233vDQWhLS+ifiQ+871Ash19UD1Lsmf4I3TSr4gvm6wsfpk9zJF93mBu+otO+B2RpyCfcG648JpQP/aRPlCRZolo0FLxf6yffXFGofag4IEuwRuRxI68Hei+WjAW2iijzvDuXlixkK2IhXILMT7yL+YCVuKY3XEwNYCjhLHPcfdljhDv0HpieRRHx32GKSRgbWY8L/vMEvTKgD6nZjiPPN6Qz8UomYx4IwzhnE679lDSina5h4aMTUIwqoUSmH5K7kMJC6uKTMxY18aPuF0wcxWwY9+jkVC1n/7xkdg/QZpJru+qUF9ZvgkOColx8Ulxjm43EFjO7q9/hyAslvKteZEQQw77pqXN2cvB7J8uBwsmASf7XHJjEXfx+5CbWYikuJ6sWxGbopwZnQEsaQi9L3gyfY4Q5TfW2aIi+lKvY7Je8O3KvyqOc/wCnGP9ve/KjFoMMp4WMRLoym5uD7nLlS+v5Jh13Tg7iosVinwu+YgZ8voN70AUk34lfOtbpxcb41FH+VlbYYkx2jFUcQRVluzaR36YRa4MByGEgZ7ktyXnyvJbrxMOFvXm9jx2po6dD/ese6zYoZ9DENbNQAguK3l9ARch6lJj/md4iBQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(70586007)(54906003)(4326008)(316002)(110136005)(7636003)(70206006)(36860700001)(82740400003)(426003)(8676002)(36906005)(2906002)(336012)(8936002)(478600001)(2616005)(47076005)(34020700004)(86362001)(26005)(356005)(5660300002)(186003)(16526019)(7696005)(36756003)(53546011)(31696002)(83380400001)(82310400003)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 19:44:42.8654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e57866a-420e-4c5e-84d3-08d8e26a9eb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3753
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
Cc: linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/21 10:16 PM, Alistair Popple wrote:
> Some devices require exclusive write access to shared virtual
> memory (SVM) ranges to perform atomic operations on that memory. This
> requires CPU page tables to be updated to deny access whilst atomic
> operations are occurring.
> 
> In order to do this introduce a new swap entry
> type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> exclusive access by a device all page table mappings for the particular
> range are replaced with device exclusive swap entries. This causes any
> CPU access to the page to result in a fault.
> 
> Faults are resovled by replacing the faulting entry with the original
> mapping. This results in MMU notifiers being called which a driver uses
> to update access permissions such as revoking atomic access. After
> notifiers have been called the device will no longer have exclusive
> access to the region.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

I see in the next two patches how make_device_exclusive_entry() and
check_device_exclusive_range() are used. This points out a similar
problem that migrate_vma_setup() had before I added the
mmu_notifier_range_init_migrate() helper to pass a cookie from
migrate_vma_setup() to the invalidation callback so the device driver
could ignore an invalidation callback triggered by the caller and thus
resulting in a deadlock or having to invalidate device PTEs that
wouldn't be migrating.

I think you can eliminate the need for check_device_exclusive_range() in
the same way by adding a "void *" pointer to make_device_exclusive_entry()
and passing that through to try_to_protect(), setting rmap_walk_control rwc.arg
and then passing arg to mmu_notifier_range_init_migrate().
Although, maybe it would be better to define a new
mmu_notifier_range_init_exclusive() and event type MMU_NOTIFY_EXCLUSIVE so
that a device driver can revoke atomic/exclusive access but keep read/write
access to other parts of the page.

I thought about how make_device_exclusive_entry() is similar to hmm_range_fault()
and whether it would be possible to add a new HMM_PFN_REQ_EXCLUSIVE flag but I
see that make_device_exclusive_entry() returns the pages locked and with an
additional get_page() reference. This doesn't fit well with the other
hmm_range_fault() entries being returned as a "snapshot" so having a different
API makes sense. I think it would be useful to add a HMM_PFN_EXCLUSIVE flag so
that snapshots of the page tables can at least report that a page is exclusively
being accessed by *some* device. Unfortunately, there is no pgmap pointer to be
able to tell which device has exclusive access (since any struct page could be
exclusively accessed, not just device private ones).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
