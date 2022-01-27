Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06E49D902
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6910ED06;
	Thu, 27 Jan 2022 03:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5894310EE02;
 Thu, 27 Jan 2022 03:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFPyhWoJOyr41NNB8gRy9eT4b0XACv+neGzyo+oWFj5P05bul2fTM78j7wrcvtEgekGiVMcIPa0eQmPubaAyhEzl3BANO0ZI+b7eJ+oK1zUmNbgkZ0KlKn0Q8gkTNR61ny1jEMidGbiitKOuq/GG1bwsM08ZWRYZ25uFCyRc/lmXvWrEFmSaB1ob6qC+BBGwoCQm6I5pWrX/qbu4QHoQ7sYK4VyAb1lX/EqS+3oWMUNpptOi8EsLaiTPBUILo2F5MAfj+osv0Knh9SqaRuu5UPZSsOalVDJc0uoNL1by2HLFcL/Vu5IJcRRnQlsI8ZClZtYnd6dBOBV6/aFSY/o3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8qBl4zLIvmc52Whswdyv9hi+p7IyTpTN/04HVb9g+4=;
 b=kJBFbLe6YcX+xYYJaVd+/bvXd10QhCUkSadwwIFgitjjFAdLonEGQYCIVSOX5JEvOrG7M5aVbbwYbUuEDAZABlKyClqENXLRlx3bXqSPxpJyS+Y003p65Cj5dMBx/h78ZsNDOm2Pyl7zvl2BRo4krrzLOhmfFwMdKjOcEI3yv8wOLeyhWvMJH/VT1QMIQHRLIeJOcWhRulnDJp96f8KJq7mElfRbq2mUc4qu/Ud+xPscmrc7aGH6BnycDFzuQS4UsIfmB5uwRimIzY5lHRzsAp67sORpU8/h6plOonzoyOOHyp+9O750kgTnyxyQeZ1WQJM1W/B7ZbkEZ1xSdGdUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8qBl4zLIvmc52Whswdyv9hi+p7IyTpTN/04HVb9g+4=;
 b=nP+GVeKplRUBEeOKRYabFHxGiqBbFZLB7Z/rFxN+MtaXW+bxOlWvrjbctetHKdynt7XAqxSEcKHwR0Sy8N3VWsE8Q6149VDPA8373shFuZaolTRLm/29A7bjjI0Sjjc9s0vtqiLOoOU21glDwNZG02kGn08YwXZ+vZ33NPu4zCY=
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 03:10:04 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::5a) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:03 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:01 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Date: Wed, 26 Jan 2022 21:09:42 -0600
Message-ID: <20220127030949.19396-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d66c0973-9f16-4070-1b97-08d9e1428388
X-MS-TrafficTypeDiagnostic: BL1PR12MB5269:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB526973965C97AA22D3962E47FD219@BL1PR12MB5269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wttG2xJqVS+/RNQHtuDK1axstrKrPKFY5gtz4/7NQgjaR/X+OT3z13/3wc3Xmk7ur2x+MkjUa/3RB1V/mdYaSIvNeMY7GO07wZ4Ps/5CHCmrQKTYsldnbuJaVlJOvIsBXwEz4Nv3WzU35aQrgMe8cP7h8XTkxb7CUNgMxt0b6+QFBze02I9xio+FKZuRpWT+J3p2lUwSIZ06TDEone0VgjxPxb/TmCgn9h/e5XTNo1+NGhw4iKdYWL7YCsInc2XJ+msmU9D6yxW9wjFRqeykdlHkWkhj3NZwJjsE+3C6pvcGOhh05fY58YDh0taf/qJCBz+eI0r7fb2+S0KBvUAHUxCMrzO9oadN1hJS+pi64tG3IlvjNq70HpQJobBUn0vnbF9VLaq5+Lg+ZaXVyA4PjPsg9RxoiZqHXkjy6Ecm+Os+rdMfERaKQvyunm/HuOSdIauJUzvy0Ki+9RVAi0E0dmJ2M/7YZ+7yesezCp3heJmpqo6wEvmv75FO1mCW4JPfz2j4uVzTa3GPPSd92fZOpm79BNLggjq+PtyvbQV1ZGPiP59R+5CsOSjH+Vq5MYgIKnKE/X5ZC5u7s7Sy2hUChsBhGietzOZj1xna1viKIh/BfUagfjCpq/1yeiAHQUWYSK9VzkGDfoM6I3EYuo6OMZiFLtsU/80Jy2uwYi4QyfgbBeNR502b7tYUr9/pyY0BX0cOOKrpWoDd3Hk0ffrqsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(47076005)(7696005)(2906002)(2616005)(36860700001)(54906003)(82310400004)(16526019)(508600001)(1076003)(26005)(186003)(336012)(426003)(4326008)(44832011)(5660300002)(8676002)(8936002)(356005)(316002)(70206006)(110136005)(70586007)(81166007)(40460700003)(86362001)(36756003)(7416002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:03.9680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d66c0973-9f16-4070-1b97-08d9e1428388
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid long term pinning for Coherent device type pages. This could
interfere with their own device memory manager. For now, we are just
returning error for PIN_LONGTERM Coherent device type pages. Eventually,
these type of pages will get migrated to system memory, once the device
migration pages support is added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/gup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..5291d7221826 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1720,6 +1720,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 		 * If we get a movable page, since we are going to be pinning
 		 * these entries, try to move them out if possible.
 		 */
+		if (is_dev_private_or_coherent_page(head)) {
+			WARN_ON_ONCE(is_device_private_page(head));
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1750,6 +1756,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	if (list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
+unpin_pages:
 	if (gup_flags & FOLL_PIN) {
 		unpin_user_pages(pages, nr_pages);
 	} else {
-- 
2.32.0

