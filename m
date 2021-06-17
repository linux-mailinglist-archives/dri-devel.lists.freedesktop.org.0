Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C93ABC76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF046E99F;
	Thu, 17 Jun 2021 19:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EF56E99E;
 Thu, 17 Jun 2021 19:16:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmuM5C5XDlyTNwb4KafuYmulLOUhUV1swTehPP0Do+sj9IzyfKEEdsrdKRjtSSVoiYSxVevCbXUfQSYzywB5ATsG44Cnz/SgAaFb/uGaReigaE8r1ibgTmqqYbAgwEpTz+aIXu7EdmUtmoXur7aM98ELENhAeZim1Og0lrbbne5aRwVfiyw/QUb1ZAQJDv7a8vwvBPo1Ys9lnZaFFZjatPBvrYVD7UnToJUUmrV6FmIVKokpzj8BldTAxwTlxfKwisQYpiNEYiXO+xIckoqUZh441h8urmefzNgcqVygQLKsppeJ0F8S9wY7PQuFlIKUqccTYFJij6N425vwwXzVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er6biy0GT/y0hF4WRc+gPEjDNsO1r2+lSw1wRirgPjc=;
 b=SYI/Pbw8YCAaqxgU1WCpcgeKrTa6gHNVlep55kRHJl6wxeRKZYf/GSngL60WcDasK2zRc/3SNQyP46UELW93DfgpNpGI/gCw60mdfFvbmJKymX8PSI3TCeokiEsLmEXX5O6az6pvOcIuX79inNIifbEHFiA47ajsF0mADlAib88IMM7tURuvLz8XC79Zao12A19eqxgfKRy4qiayy3eFUpJkDb3LK7rIMquuOVI+x2lTvjtbYUanSdjuBdr9CxQ+fIIdYY0uxOjyJww5s0b92OkXijcJ6zUeGm3lgVpqrQtwtJe+KPgy2oPGlpF+qCnMIa+AxvKw2oBb5Ru6LH6n+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er6biy0GT/y0hF4WRc+gPEjDNsO1r2+lSw1wRirgPjc=;
 b=CS5XyBIz8csXQ77rM+8jEqELjMPMqnnoffxwUyCI4VZyO94Ep41pGr49X1CmmYUzvbRYQYhRtdqTObdT6OacCTcEvgispQCwiKINVtqMULRYjW9+iNnb309XXuAZFoOhcnS/gZOK/jYWZ+JMmWuaKrtzfMm7ttOgcE5+zyG5zvfWerHOtIgOusYjyeTbhNT/p3u3onVrKKdpPAo75vpb9W2OzeBCiBkhvoXWHGCpXIE7Zv3KT3J38P0FIUA8JeNqLYc4UkGWGJ4EyBzceKPAzSlrdoPqoWtcaEOaTOWH8YZNsqT0DdcHCTEoWI+28mJv9sRwOfKOimGWX5xLEAa6RA==
Received: from BN0PR04CA0100.namprd04.prod.outlook.com (2603:10b6:408:ec::15)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:16:27 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::2c) by BN0PR04CA0100.outlook.office365.com
 (2603:10b6:408:ec::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Thu, 17 Jun 2021 19:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 19:16:27 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 19:16:26 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 12:16:26 -0700
Subject: Re: [PATCH v3 2/8] mm: remove extra ZONE_DEVICE struct page refcount
To: Alex Sierra <alex.sierra@amd.com>, <akpm@linux-foundation.org>,
 <Felix.Kuehling@amd.com>, <linux-mm@kvack.org>, <linux-ext4@vger.kernel.org>, 
 <linux-xfs@vger.kernel.org>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <20210617151705.15367-3-alex.sierra@amd.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <7163dbb6-67b5-6eef-5772-500fd2107e5c@nvidia.com>
Date: Thu, 17 Jun 2021 12:16:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617151705.15367-3-alex.sierra@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aaa47cb-8ee0-4aa5-5686-08d931c467cc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4592:
X-Microsoft-Antispam-PRVS: <SA0PR12MB459232612EBA33C2C1228452C20E9@SA0PR12MB4592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GkH0kOjFsr2wrP5Pf6OjkG52Dg6l0a6IvTPJWJlgbwzB5b5lFwvrJbOWvY31Y7N20pH4lsJqAUO9VbUZdgVDqYRXqELEnHuItbGLN4YB5ku/0UYJT+t8CtWie6/bFBg+cAqNRXb+aYNcwYM+d8+br2S7G17PTaF6VudO1o4kj4gLQYIIuN6chzhoUELUU8d8PaLCJbNbh/ZS4quEAtsr5/1VWf2vGflQS90iJYsY4pu+2s2Mu2B6bTsVAkR4rR+bHjTwc2bZUh/+3Dkq4aTLPQJk2MdEUZY7uRx9f738IN13KwzxwbL0rn/Knv2xUigA8d0e+d7zClCQmoGSRL+Eb3d47XO09/0rkmT5OKSgaOYart90TAnZps7zIk616HH86ZFxP35KSl6wnCpF/RRRNAB/LLHKniA13FHvF7USpsvvUCdEyiijdYTW7v13JsJpDMv6eepHELtnu6510DTaTA4sb32+1kSiuEJt6+cLSo38F+t1NP9Gv1yypWfFB3BW9zsBDkmkzbiyZWSQvdFySgiFYVaXQcsxL12gIksLtmzT4gBs6VvG0lMP0we/Yv46wspzAw7mDwQFIDR7DD9UJsb3vxoCsws224MaOGM2rmsOgUSqrwzp8x8v0NA0NIFYEf81xTfFvm6kxonZDQBrX5v7PaBUQNtWr80NGP1L7rDRF6KwSkumW3tsfn1G+7JjwuhhFUYotdSlvgGAy9v04Q==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(36906005)(86362001)(5660300002)(7696005)(2906002)(70206006)(36860700001)(186003)(82740400003)(336012)(70586007)(26005)(54906003)(47076005)(7636003)(53546011)(7416002)(316002)(31686004)(2616005)(426003)(83380400001)(31696002)(8676002)(4326008)(110136005)(36756003)(356005)(478600001)(82310400003)(8936002)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:16:27.2652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaa47cb-8ee0-4aa5-5686-08d931c467cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/21 8:16 AM, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
>
> v2:
> AS: merged this patch in linux 5.11 version
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>   fs/dax.c                               |  4 +-
>   include/linux/dax.h                    |  2 +-
>   include/linux/memremap.h               |  7 +--
>   include/linux/mm.h                     | 44 -----------------
>   lib/test_hmm.c                         |  2 +-
>   mm/internal.h                          |  8 +++
>   mm/memremap.c                          | 68 +++++++-------------------
>   mm/migrate.c                           |  5 --
>   mm/page_alloc.c                        |  3 ++
>   mm/swap.c                              | 45 ++---------------
>   12 files changed, 45 insertions(+), 147 deletions(-)
>
I think it is great that you are picking this up and trying to revive it.

However, I have a number of concerns about how it affects existing ZONE_DEVICE
MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_FS_DAX users and I don't see this
addressing them. For example, dev_dax_probe() allocates MEMORY_DEVICE_GENERIC
struct pages and then:
   dev_dax_fault()
     dev_dax_huge_fault()
       __dev_dax_pte_fault()
         vmf_insert_mixed()
which just inserts the PFN into the CPU page tables without increasing the page
refcount so it is zero (whereas it was one before). But using get_page() will
trigger VM_BUG_ON_PAGE() if it is enabled. There isn't any current notion of
free verses allocated for these struct pages. I suppose init_page_count()
could be called on all the struct pages in dev_dax_probe() to fix that though.

I'm even less clear about how to fix MEMORY_DEVICE_FS_DAX. File systems have clear
allocate and free states for backing storage but there are the complications with
the page cache references, etc. to consider. The >1 to 1 reference count seems to
be used to tell when a page is idle (no I/O, reclaim scanners) rather than free
(not allocated to any file) but I'm not 100% sure about that since I don't really
understand all the issues around why a file system needs to have a DAX mount option
besides knowing that the storage block size has to be a multiple of the page size.

