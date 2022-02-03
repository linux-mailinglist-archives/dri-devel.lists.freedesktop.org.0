Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28A4A8534
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AE110F7D9;
	Thu,  3 Feb 2022 13:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D610F7D4;
 Thu,  3 Feb 2022 13:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfY9eGB+A1K5jFUzKXcQO4+K5P+EVJ8FkXye3ifp6KRUbn2xLbfuN0jr4cZl2NoTRLjPBZ+5z3/cGeyQ8scCUDYb4zyK+GRluxhCnJaiZ1ZTzhPJNT0Monb6RD8sXB21IyQtgqjVfx8rmfXRaYtI0UbR7MYY+82lF/4s5G3a3Ld6Sdz8/kI+nsejNO2wcuyOQ8ZBvJI81IPMa/6ql7SuYf0itAhdWooCwB5RFxnpxCSSZT8jcT6ebLfgK2Gk1IgZV52h2s5vy+UhUQ/52oTIWHpwqk1sQhRzLPMI1NYlvd3f4qVoQNFvaeabdS3+4Xh6CwCxWQGzKv47c5pcbYADRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVQWvBK9iMhnvZM4af0RCR4osVo3aXQ97WI30dRV+cs=;
 b=ZxSGQKCqFfkOhTPuxwh9q/AwgrNo0m1PaBReCKGoyVVrwDaXIqb2KKV8TLpiKZrrWBhjgxa+IIDTfrDOcRfRLa5s3aLYZzDwcS4Sq1+fkyzkpGJunIynzJi/sKhEtRYPMgzsegp3QiBKV5fQSrpGRXRuiFXU4WhIaBQjf5CHb6TjC08VS+2p+l4Ba1O59KhP7hQuKf8pEi6qTVBI4ib7dQxDcePxsdTiV9Dsb7TZx4nD3AFbo6tsDBntAI1aGqL86hMhRyjnTXdILKSSDW6ui2vQ55mX2VqHbGUZZi94Z2lErcg4rGrGBCp5LnqHV8ZySa1vUqyfJHeR1ekGeunkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVQWvBK9iMhnvZM4af0RCR4osVo3aXQ97WI30dRV+cs=;
 b=g/ulytL809CzIi6WjHIQqHrilr+j3gv0Z6FunPDVbi9QYcAqiolL+ntS8KdKEaCQccWv04ZetWeUXcoAT+96p/vMGvJc+uAeMRCPkrWu7zfYAzC6ElG4nCSfD8I5fJ9gNwucyo41jcKK+Dw7DZUON3nf66uIAqvJpLHGc+3NVmQ=
Received: from BN6PR13CA0008.namprd13.prod.outlook.com (2603:10b6:404:10a::18)
 by BY5PR12MB4818.namprd12.prod.outlook.com (2603:10b6:a03:1b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 13:33:00 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::7f) by BN6PR13CA0008.outlook.office365.com
 (2603:10b6:404:10a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.5 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:32:59 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:32:56 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/selftests: add drm buddy alloc limit testcase
Date: Thu, 3 Feb 2022 19:02:29 +0530
Message-ID: <20220203133234.3350-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868d9e64-0c1f-48d2-b135-08d9e719b240
X-MS-TrafficTypeDiagnostic: BY5PR12MB4818:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB48181FFCD97B83E7D84F5E94E4289@BY5PR12MB4818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QStLjOjvF8gDQSKJkKH8A04W5KROpFreuZxwnY87MTfis6zTJDwGLDP0qi5Hrpgeo4VqQe77gYP4VmDlNk3y0BOz9J1p4SsSyDZHKu1IGFkMvKdyJWP0WEaJHX41rvCrG9guorLGNxSGiR6TvUK6tNlVj/mWiLMTT/EcUCAwmwjz5GUSMbl7Bqc8OgzpRdi5hhLs1NbKXxLcml8cKtjNcI2Xj7+HyfImtRqxtGqa8SKt4TbXpQmgp7dmTMpRfXDtwjNo9lUY4wBdD5vrLltQtSFgZdOth6I7K8EfntsGQFa9bSJwC8R19X1/Fs6wY/Ht5r/BbW2GAjCc3bvLk47wF4bb45Xccnt0M4MzfaqrUc5z5OJMY/cSrbWXNbdRyCX+cHZXOhf/1YsxlDBT9Pq2b6JtPevVkoxTeXddLz3aYmWgdJ5cBpAsVqrOwoiJvRQFFH7Qoe/B5SSAWaBp5z2L9bwres1fZ6TtAB/Kk3Rw+n/Kh5nzvTPx438Ujeh+EU/O/MQidqgNyfshrQICbenbLAwp40865XX5Gfrrtghr5iO/Set5z6kmMc/xdU8ofnYeuU7raa0SS35RfIPZb19iD1UVoLoPCE3OJrHYOetYEVOLKPswb8uP1Yq/G636gFMALtRF0Afx6iOUWqiy2q611uUjxHHyvLpzAh/bknnrEbShhi+hxaIrDRJEhxBPsKW0Iq7ilLChxTZeYqQTasTAmg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(4326008)(110136005)(508600001)(26005)(54906003)(8676002)(316002)(186003)(2906002)(5660300002)(7696005)(6666004)(36860700001)(1076003)(47076005)(426003)(83380400001)(2616005)(40460700003)(82310400004)(336012)(81166007)(36756003)(70586007)(356005)(16526019)(86362001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:32:59.9793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868d9e64-0c1f-48d2-b135-08d9e719b240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4818
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add a test to check the maximum allocation limit

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index a4bcf3a6dfe3..ebe16162762f 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -7,3 +7,4 @@
  * Tests are executed in order by igt/drm_buddy
  */
 selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
+selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index 51e4d393d22c..fd7d1a112458 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -16,6 +16,66 @@
 
 static unsigned int random_seed;
 
+static int igt_buddy_alloc_limit(void *arg)
+{
+	u64 end, size = U64_MAX, start = 0;
+	struct drm_buddy_block *block;
+	unsigned long flags = 0;
+	LIST_HEAD(allocated);
+	struct drm_buddy mm;
+	int err;
+
+	size = end = round_down(size, 4096);
+	err = drm_buddy_init(&mm, size, PAGE_SIZE);
+	if (err)
+		return err;
+
+	if (mm.max_order != DRM_BUDDY_MAX_ORDER) {
+		pr_err("mm.max_order(%d) != %d\n",
+		       mm.max_order, DRM_BUDDY_MAX_ORDER);
+		err = -EINVAL;
+		goto out_fini;
+	}
+
+	err = drm_buddy_alloc_blocks(&mm, start, end, size,
+				     PAGE_SIZE, &allocated, flags);
+
+	if (unlikely(err))
+		goto out_free;
+
+	block = list_first_entry_or_null(&allocated,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block)
+		goto out_fini;
+
+	if (drm_buddy_block_order(block) != mm.max_order) {
+		pr_err("block order(%d) != %d\n",
+		       drm_buddy_block_order(block), mm.max_order);
+		err = -EINVAL;
+		goto out_free;
+	}
+
+	if (drm_buddy_block_size(&mm, block) !=
+	    BIT_ULL(mm.max_order) * PAGE_SIZE) {
+		pr_err("block size(%llu) != %llu\n",
+		       drm_buddy_block_size(&mm, block),
+		       BIT_ULL(mm.max_order) * PAGE_SIZE);
+		err = -EINVAL;
+		goto out_free;
+	}
+
+	if (!err)
+		pr_info("%s - succeeded\n", __func__);
+
+out_free:
+	drm_buddy_free_list(&mm, &allocated);
+out_fini:
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_sanitycheck(void *ignored)
 {
 	pr_info("%s - ok!\n", __func__);
-- 
2.25.1

