Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C955BC9F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC0A10E1DF;
	Tue, 28 Jun 2022 00:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96F10E5EB;
 Tue, 28 Jun 2022 00:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJmWxqYnkbugdzvbUmgtA4Jul8GpXyMG+6JKZholdijS1FxV++KHFybIV1kXUbyZcT3fP8m5giMgUOdPadNdcfnK1pYl8aTXZ4HJ8U6xnSzEBWO/fO/oMSF09Udldzg/WeZ3Aoyco48oq3jG9DpqsX7r5J4eH00M2bBiDBOhAW2QRLaFsP08z9jtiw33/wkLbS5NvAVgpaCCV7KIGktsSeKudvSPCtezYkwoC27aTfSZidPKiVPitomCR6HGJYswy0NaxjPATHKwgHuC+I7RUwbLkh6XiS5qT5Ckx8A0gmgA5nlLArLb/CkboOm+uxI/s7Mhd0GJv9RIVODFrhsosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=UicCErbq5JQ9LDUgL3w5jd5oyfd14KPY9LWn5iUhKABOf8A2Ew/mClZJFPQZAlN9SrDEEz9mrOnFxwCO8FeyD5bHHd26skNvZZMgJanNgr/te+R5UUdtcl8mXNBEahuUJ5u+koLJvdLdCJvgI1qSCEoHSaalZlFu9E1URCelAxVBDFehCGuWiksJhRkqtuITcObMSr1Z1HaMM5h5+2GAHx8kWyZtZjaHrc6/CB9GZXrke6+t9YKcRmjjowOX66935rAVlyTkHO3uJXZDt1hU9cl4tSKE1GC+myYB/7OoKRqHlziIpKLBJOOAMYHZ5KpKFT2R+4u6PuBq1iRQRZOkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=qrjM2r7rjaWcAd6iDxh8RVACGrlw+jZcT7ziuQ0wJxMtIXi0zlvmrPnq26RWlNfu/6B8CJtpuwe+9tH7Jz9OVKtBXIHahrFFMwggGkR4vUj0IUb9qJaQigj1QL80RnbXmAr1ZCj+Wz1fUBci5Nm2SNXwjwJ38mLvzzU+LktHiyo=
Received: from MWHPR15CA0062.namprd15.prod.outlook.com (2603:10b6:301:4c::24)
 by PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 00:15:23 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::f4) by MWHPR15CA0062.outlook.office365.com
 (2603:10b6:301:4c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:22 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:20 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 03/14] mm: add device coherent vma selection for memory
 migration
Date: Mon, 27 Jun 2022 19:14:43 -0500
Message-ID: <20220628001454.3503-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ffa500-ca13-4826-641c-08da589b4b31
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZ4PBMWihroTxDyEouPSwgLVWP3u/e90ABhz7W0+/TK2ZIo7SThhhD4xjMbAE/BFmsKjOL6WKqzVJtHVZpVj8oM+eaLfV/sME1yugiCbKW25/PyYzT/Z4Mqe3UE1KeNX254NYmsnZjAmDjJw0kD+14N9ORg7dFK70+Fy40OdKx2yJx7TEX1i5uaTFoVTLj5e72fwO8sE/qluRG24FBeMxcBn2Crakf1z0fZesp2/wBvE788Q4qQxbt7F4rWNlAkuXABsOm3cQ2MV59j9JV5sXyL1OfEKiF2ux8rX4iXiGbR/gKblxx5f14K5oasQh0NAb1BSK3sDOwitMWzRc6g3dDxOVYUvx6FXMnLORjNSGsfEM7srTgQz3GJSb1fp3R2mvC6Lca3iR4MCsxA4IWSLiruGmU5BtlcFmHulNq4+zFOg0yJIyXEffvll8j/Nw4F8tnbQigDKV7XdWm8/Nnm7KmAjhhElqDKmfSHtMHk28h94icbbKk72Grh2n4QyXHiQkDJowzqIde4tTx5K9sggfL/vK3/ZqxwY9vxWDBsZtf7qK10q+qKpN/fVzSGz/j5rcKDaw7yYfDBLre6P+jTdaLkU8XM5ASyRjEoxl5AgBoMHUGKHVytKzY3rkB3dtrRp9ZsJ2FnDLu7orwpbPtXulYuIiOlnWiVUYpBX0rAArUgrIVDYC5yR6yTgkojxgkL2R8Cx2N/jQdypaxYMWLi/YQc5xV5vwnn5FXANstHg6qKrLQt/pQ+x0DD+dzaPRp2JJZ68zvP3YVMnoiXg+FSBJ2VCWpQ32lq/fk9YMthZYnTVeFt4pbqKecDtdXf5wJ6ig6W59wHpcm5mXLJka8jWWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(40470700004)(36840700001)(46966006)(16526019)(336012)(47076005)(4326008)(70586007)(426003)(2906002)(1076003)(8676002)(316002)(186003)(82310400005)(40460700003)(7416002)(86362001)(41300700001)(70206006)(7696005)(2616005)(26005)(5660300002)(478600001)(8936002)(44832011)(6666004)(54906003)(40480700001)(83380400001)(6916009)(82740400003)(36860700001)(81166007)(36756003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:22.9174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ffa500-ca13-4826-641c-08da589b4b31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This case is used to migrate pages from device memory, back to system
memory. Device coherent type memory is cache coherent from device and CPU
point of view.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 069a89e847f3..b84908debe5c 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -148,6 +148,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a4847ad65da3..18bc6483f63a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -148,15 +148,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
-				goto next;
 			pfn = pte_pfn(pte);
-			if (is_zero_pfn(pfn)) {
+			if (is_zero_pfn(pfn) &&
+			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
 			}
 			page = vm_normal_page(migrate->vma, addr, pte);
+			if (page && !is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			else if (page && is_device_coherent_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

