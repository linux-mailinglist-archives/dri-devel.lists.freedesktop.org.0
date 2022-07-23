Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E457EB3F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061AC92CB2;
	Sat, 23 Jul 2022 02:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E8792C61;
 Sat, 23 Jul 2022 02:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzL4gafJK8lIXLnkW1kJLy5ETaOkbmz4DmvUM4+3wrjwS5S8x0iuhrY3Pmq8SYvxO9XtDYIXKz+jWGTTGwd3UwjBgCSZgs0rD4+csiItqTgyL4z8WIgoJa4agwV8wzcdLzvtkIRO36xiBcQ8b7vzU6TsmeFp7crzz4dGKe4laOS9pbEtU4/hXLGPwJfMGPK1k0wfyzEyHiAFU2e0mj+GqfQ1SUMkI+SpID8cyqzfYvv5R4zav6bDou5pRjQmUyxPLOQ1Bt4wSQaAE88AMgtEP54NHBlj5UjQsjxxCNsJ7W7typlMQCC/QUoGPe+ecZGPelb+XuVqb4kNgKGp+5aPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYGLl2xarAtEzZfa2ZaHDrupakUeBSyblRP8+JbV6hM=;
 b=JDMBaiGE7TWjtzcRR9zj1JDslsU9qsw6HFAeK3Rp7g+ZQxhoYKe58OZxqtWjWCANdmMA3DIsCdkK6q0KNjqUqizcVkClq6VVNoWOAw1xIWfri5c+xHFKKTwYHc1NMqRn6sINWvFnN5iVLEHrc6isfsdxf8jriCOsOWJqObUglwMuu1COYL9MPCpSZqfg9OVxAL1NSA3tNC1Ba0ZizKz8EfNP/oYlJlPshW129NCPTRjkXj0Mzx89hNvqLQzBd1uN0OHQjJUzR2U7d/m8rRnaIRzDGiVeEXMWX/KujhfmQ2SPHIvBJWFfQCZzUbPtOwpe8kyRudxrq3E2NAJhpcz90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYGLl2xarAtEzZfa2ZaHDrupakUeBSyblRP8+JbV6hM=;
 b=MqL8dKeM6SB94VmE2NmdS3g/teiRDxqJIym6YOuzYySKVQWIKDKJVWhudfeufVMrzdVd0TV3f+5HLlcL1ehBQGkiYyskLmefMfnFYIjy0bmAp0/xQ96ES5pH85ULt4ET0KzkUOfPpMGydQXSNtHQ7tqoCmtmLjELgawKKAGcjYGnKsq/scfDbHGRnrLBFfJpAct4XozBPgX3U+y72FVUYAGlVEnzddoRlLnV27cwtjZcIIKd0v1kIrb8cJFyhcGkvThg5WuoLVFuNSP3z59SwAji+TmqGYnL76S40RxlLBnJpOtiwfs6qmkv5djW/6mTThcvyIvQkrejU49LhEt2ww==
Received: from DS7PR03CA0282.namprd03.prod.outlook.com (2603:10b6:5:3ad::17)
 by DM6PR12MB3388.namprd12.prod.outlook.com (2603:10b6:5:11b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Sat, 23 Jul
 2022 02:04:13 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::66) by DS7PR03CA0282.outlook.office365.com
 (2603:10b6:5:3ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:13 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:12 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:12 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [PATCH v4 02/10] drm/i915/gvt: Replace roundup with DIV_ROUND_UP
Date: Fri, 22 Jul 2022 19:02:48 -0700
Message-ID: <20220723020256.30081-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdda2033-e12f-44fa-962d-08da6c4fa3ee
X-MS-TrafficTypeDiagnostic: DM6PR12MB3388:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdNedtXhXkMhsZxYq11bTHzD0t/gRlMVrcsjGaBhMUUZg4ItqGC54M7GBcA2A4ieqO9cKQ9YjpFgCcwUCLShGgqZHyYdDE3F9axgkctt26cAK6HddDjLs5hF7JXkJEH5naJ4ONcvNv8BHiXbsMRlgMCchgqrKt1z9pUR8IY7QyPvTZHjTmJ0K71eXAH4SA+hvLuMjjpbMmZxo81axy5GKEA3JcE+C3XLTXkKGo+4N7gUU7ViiiAf2t3aAQC+hiaN0ZFRxzQXqF9BAJswzxW01mBtETzdT9gcLHYNlf6k0d88bKuxd9Px5HYHUrgSdObFOA/UqNWBfihGbGX6MMExd4OUG6kCYaGr8eI65P3PYO3YHObnSyeH/5qnQpPP+N+Ya+E7pHYMfAe+ZSTArwFA2BEBM8BFWL2Yg0yY1hFTeb6yK9/BHea95iIWzrEtfyVMvbzULHsFWK2emsKoUjwoqP1m6j90f4lYxTdtNz42Pm1At/4f6j6+XcvtXB75NolzxJdOonN5vlZf/nVKXnGrCr0v/HofUpYaJssH1VPMHUnN9iWafeGmk3SBp4+veTVHMiZgXGi7JJLh0VyPBTQLgYerbQGUiS+bQ1pbGCWBqCIYOoHNKGjDtoSoG6+iipZxKJaFy+yKnpsuNXJtei7PwhiePFTUR0ulZDhuqCstma1/TXoKcCH93vB10REyoWB6sIj1GuQOAD68fa5Q/FUoR8yRG8cjZ/EOiCZ8CDoaY5tQK60GrjMMYSferJpOOqzBLvgzmIwZfirus1qzrm55DQNFWWnzlKaFVXGcMze0APzEURvSDFAJ7Yl1bSEi73evWpS14YHzonoSvRU8/5IUFLmP0ppe24J+SmpXZfi6UE8uwbBwt/glAbWFxd1VZJCcSLdupT0wWc4bYtAm/HTREw==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(6666004)(41300700001)(47076005)(336012)(1076003)(426003)(478600001)(40480700001)(82310400005)(83380400001)(2616005)(36860700001)(7696005)(36756003)(5660300002)(8936002)(110136005)(2906002)(26005)(54906003)(316002)(186003)(356005)(81166007)(86362001)(70586007)(82740400003)(70206006)(40460700003)(921005)(7406005)(7416002)(4326008)(8676002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:13.3791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdda2033-e12f-44fa-962d-08da6c4fa3ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3388
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a bit redundant for the maths here using roundup.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4d32a2748958..2fee5695515a 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -231,11 +231,9 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
-	int total_pages;
+	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	int npage;
 
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
-
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
@@ -247,12 +245,11 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
+	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	unsigned long base_pfn = 0;
-	int total_pages;
 	int npage;
 	int ret;
 
-	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
 	/*
 	 * We pin the pages one-by-one to avoid allocating a big arrary
 	 * on stack to hold pfns.
-- 
2.17.1

