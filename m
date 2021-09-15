Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FFF40BF57
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 07:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7CD6E8CC;
	Wed, 15 Sep 2021 05:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEA76E8CC;
 Wed, 15 Sep 2021 05:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr6iGmqcDa4O2nxOFBJ8XlM41yLt4cGJZDFyD1pryl1euprUHAuQVq2BG0+JSFRPttqmWXJyo2fKIl7UuUeGJGlLKAcdeYc4/mR+poV7WMfQjVi/S6hcwAewyxqJW4MG2OxKiA9ueetCe6WNXndUM4nOhwBvJE+5rtnnit1hjZFBcOSVLDdE933KDsbX5pZG972+LOlYQ/bTLsE/Ezo/sQaV1I+LqgLKr4t5HKs8jh09BNZTY0nbxoJi/Byl7v3S/0R7KKsPiy5uFzJVPmd+gS1hssHTw60cYzoFh5uCOLQ+MWxVo2Wa+oC7hFh8Pc7OFSNLGaaHsKu4Jbft+Gg+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hSquNODS4hXGxXgLhLyM6e1QpD6QLO3SsEEymAnUFHg=;
 b=i56AUAiZEKhK9tZcjE/kO8RxgvcfxMkPQih9JRVgszqXOBc1epRHF3EcAbEOQaWC418qnwSzoEBOWSV0zLdAtHcdFLOeSXm8zheNyQ/1LOPBO9vcO1uCeCCNgDN1aszz5Tt1X1kk8YVBfWssfBv2Tb+ZJqC6oSzH8B20Bsgp4lBejdDL6QQdCE5QkB2e4S76S81P6TbTxhksBJXcKl8dHjhDH5A2kB4Hbz0pr8+7GPBbBsvbpoKxrmNTPCWyThwceZt2JjzW+yET11bqDFTlkHpZo3ahZidOktlTJwQKV8qm1Hq5g2NUXp3VH7iaRBWpOTgo4L9Yg+snQUzpNSClHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSquNODS4hXGxXgLhLyM6e1QpD6QLO3SsEEymAnUFHg=;
 b=m46JH/XKdoTIJ8gJmks/INtmRAKRWt7elatsrwazXWGIZrg4mWbP736dvXZxfeyzEdapdoFKZiZbKtdrPO41V/TyvFWmd/V4t8T3ug6M6Lxu7plwr5kAPduVx0pWHElawKWa0lILAnj5DTd/z0vZEzn2hdrfRc3P09bDSxdgdtAlVCHnbh+q2+vfqx1lFJAAB4WcntA/TU4QOq2llhFSsNBPsvMQTZ5/ANefoouhSauzeZVfsfh1RSU3+9b2ZdzqaiQFC0f2Hyly9o7Ztxwd0foh9AqzOAkoqhgq/LYq6RLpdgwI7dTZhFw+A2CCFgF42VCoqJkv7SIO2BxgKsjlyA==
Received: from CO2PR06CA0064.namprd06.prod.outlook.com (2603:10b6:104:3::22)
 by MW2PR12MB2539.namprd12.prod.outlook.com (2603:10b6:907:9::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 05:32:38 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::5b) by CO2PR06CA0064.outlook.office365.com
 (2603:10b6:104:3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 05:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 05:32:38 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 15 Sep
 2021 05:32:37 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18 via Frontend
 Transport; Wed, 15 Sep 2021 05:32:37 +0000
Subject: Re: [PATCH v2 02/12] mm: remove extra ZONE_DEVICE struct page refcount
To: Alex Sierra <alex.sierra@amd.com>, <akpm@linux-foundation.org>,
 <Felix.Kuehling@amd.com>, <linux-mm@kvack.org>, <linux-ext4@vger.kernel.org>, 
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <20210913161604.31981-3-alex.sierra@amd.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <66933a59-9761-7f03-80af-4843c9210212@nvidia.com>
Date: Tue, 14 Sep 2021 22:32:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913161604.31981-3-alex.sierra@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da02288f-f7f0-45c4-f738-08d9780a3ae4
X-MS-TrafficTypeDiagnostic: MW2PR12MB2539:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2539E2F1E91B0CF37C944E8EC2DB9@MW2PR12MB2539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aw/VgQdMCN5DjsJ/VEXzOaxN7S5fhxS50gYSNXqVmcuO5Bg3I8DTPuzD+rzcgRaDJAlSXALd6JIkMHioulGf9ibjGYdPFO+7IRbjePv511shDBkrzvXFBm/PXeptqCzyPxmZpnxvV393HNAJXlLLFY5g+Dh01uVC2MpIvq1eFpog2epj28c+eMgjrLX18FqTQ6IVID2BlgDKz4szsRW/hOJ1vjN1tHJO8JZpJdPKf9NLlMq5pyrBorVj7Fq9bvWjA/Cn3yBAkDhSlgPNwM9NDhGvRWCG5lCAz6nn0eDOjT9R8ucQNSY8aYWE7oquDQsQssHhSMDIZhVGM5uRR3+L7ykJQRfMJ5tqiJV1PIE/5QE4mkbgvhm/UfxdOZi93yYUXPNBLBqWxqjt35CTeXqFvzlcu5hWGhCVvzxUs0plM+vtavkDuRwyoq+1hj8VZNo8SdGFFIJB8sW/6zBwH5x1i3JUk+Bogj5hTxrQBbLFbaVrKqFnGKlIOhKjzNgZJiNaDHQmWNByaoq0t/eoeKg4nHq1r2DcaN8HpX9T10Zirc5kE0oxxPu9B0UA8J5iQVHf1KVYyWUmPTEJOJ+meg43WbBb3m34sO4iO4CEIh5vlJjWdVQai9AfgxAG+xcPdcwQAvDOpVkspV90V8ckV+2SAJqpDp6uofRWti8dGQXqEYvHltuMST4hv5uPk8e9KZNxo+ujdmMxMQlCD4nzhGfrnjQTpzJqaq64tcg5Ci0gJ635VxaKw5gnoCgjTRGhSKtIRbc1HgqPxIV7fdsjTdtpn3ghCZndBkh8wsCQ07pd9j63iz87sgA5/1PhWDcI3vXSbFtKyv6UiceqX+n988xbFICKANQib9MbS40ibVZPvE7AFrGWHBNfX+66lkBeDVld
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(82310400003)(36756003)(86362001)(5660300002)(47076005)(110136005)(26005)(356005)(4326008)(31686004)(53546011)(316002)(478600001)(70586007)(70206006)(31696002)(8936002)(7636003)(336012)(2906002)(426003)(186003)(2616005)(7416002)(82740400003)(83380400001)(966005)(7696005)(36860700001)(36906005)(8676002)(54906003)(43740500002)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 05:32:38.1666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da02288f-f7f0-45c4-f738-08d9780a3ae4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2539
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/21 9:15 AM, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
> v2:
> AS: merged this patch in linux 5.11 version
>
> v5:
> AS: add condition at try_grab_page to check for the zone device type, while
> page ref counter is checked less/equal to zero. In case of device zone, pages
> ref counter are initialized to zero.
>
> v7:
> AS: fix condition at try_grab_page added at v5, is invalid. It supposed
> to fix xfstests/generic/413 test, however, there's a known issue on
> this test where DAX mapped area DIO to non-DAX expect to fail.
> https://patchwork.kernel.org/project/fstests/patch/1489463960-3579-1-git-send-email-xzhou@redhat.com
> This condition was removed after rebase over patch series
> https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>   fs/dax.c                               |  4 +-
>   include/linux/dax.h                    |  2 +-
>   include/linux/memremap.h               |  7 +--
>   include/linux/mm.h                     | 11 ----
>   lib/test_hmm.c                         |  2 +-
>   mm/internal.h                          |  8 +++
>   mm/memremap.c                          | 69 +++++++-------------------
>   mm/migrate.c                           |  5 --
>   mm/page_alloc.c                        |  3 ++
>   mm/swap.c                              | 45 ++---------------
>   12 files changed, 45 insertions(+), 115 deletions(-)
>
I don't see mm/memcontrol.c listed here so I think you will need this fragment too:

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 389b5766e74f..0cc9c7c71e79 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5541,11 +5541,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
  	 */
  	if (is_device_private_entry(ent)) {
  		page = pfn_swap_entry_to_page(ent);
-		/*
-		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
-		 * a refcount of 1 when free (unlike normal page)
-		 */
-		if (!page_ref_add_unless(page, 1, 1))
+		if (!get_page_unless_zero(page))
  			return NULL;
  		return page;
  	}


