Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173A42AA84
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F94E6E7DD;
	Tue, 12 Oct 2021 17:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8E89FCE;
 Tue, 12 Oct 2021 17:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxT7Tw/YHBWwscOTW0ilEmzwNqPVraCh+nXwflV6bbOgCKSc9BqEmdZK7BnPzI0yiDlPLbeo0UuTgmG8IFQJL4UH670W0Bk/Y08nejPvcuuoE3rIFUlOrhlRXbUVW0IRkDGbOn5mbDq3cQ+A+ZVQRfCjk+Q3ApouK5xZ2Ivh2bgzP3+yzg6uU5mX/CcpY6knKtHsZ7+v/YTG+cnz34ptHQfv8mho/Qt/DHempeX1pDux8GxX92TyeoqpVMb3SacCOsJNnj/53Rf9itjWYgdLzyqrJ9SX2QsmxRccp7hmrlh1R5DMtFRVx4N6X30D8GXGYxsd9szWvU2uANDRBkRstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtslbnmgwcmVuw3/IJPuNMBAqQP2tzGnRh8lFmQvcmg=;
 b=f+7UMhoys0ApBE7c4PxiS8LZquJVqJAyfdMyVZ/7qFXXmkWYamlUC/jFOKLS1qp8ps0SV+s0oWiwOs1uK8tL/LIRDSrHqtlQcw2dYnjmTZU4Rur9cK9cCNZ3Zal793PJw34ccNH3DIiv0N3bxSNoZb0enAKawyPomOxVA4292Ry6qeq4yXin0okINTRNf/PHqqGQjKz8RXosa39tyKQs3VpMEeZF1PVBB4P9G8pu5HaOFZ1TfBYFX3cnKEGIPZ5N7hmBsVmsgI/hlpNrL56wgnYEhf+lnqPQZlig4mOXMqQqa78g8LFQ9h3QsIIMjq7khm1nJ4Di6MBW83xgOf6dAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtslbnmgwcmVuw3/IJPuNMBAqQP2tzGnRh8lFmQvcmg=;
 b=OPj7eoDwJoIzd/lMBQTq0Q7YPkdQ1CG7vWUnAXG9A3FFK66OS4QWmW1RhwDoAXY3R0Nk9WvuZlyeV0BdXC1agj8YaYk6CpDle8PpqXHBxVxjL45ntH24qbN7v2aaGaodpjODO9jXx1yuCy7PLpCca60LDRUDwsi2zGMI5zs+L/g=
Received: from MWHPR14CA0008.namprd14.prod.outlook.com (2603:10b6:300:ae::18)
 by DM6PR12MB3594.namprd12.prod.outlook.com (2603:10b6:5:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Tue, 12 Oct
 2021 17:13:05 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::84) by MWHPR14CA0008.outlook.office365.com
 (2603:10b6:300:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:01 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 05/12] drm/amdkfd: ref count init for device pages
Date: Tue, 12 Oct 2021 12:12:40 -0500
Message-ID: <20211012171247.2861-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012171247.2861-1-alex.sierra@amd.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc95e13f-c8a8-4adc-1f4c-08d98da38e1a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3594:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3594975E9EF6F81FD4662FF4FDB69@DM6PR12MB3594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tKsKzOAYs1JQQa1w5DuhDViXpEtvodwEajnH32omiP9w6Nvpd1dNAIKcAp5AUOwYuJFCeUsX28GHArFKJ5dP1n3QliI/wHa96xYGJhpTbaOtY9p23sHsN833R6XqgDRFA57deHpYkrbAYhQz4HzAH9i/lsDrTxgFbh1qkSACYp2jtDo2CAwofUreSRMKvx8Yoju/FgdO/OsFwpr1t5vVgv2QXsEoBmO5CqqYcnUDqtJYhb49Z99r00kWa8Z+BVdGz/KQnUhvevcAi6NwZzZLBh6h1oi9SaAUjqAZ1j6sFLXRZj4FgyP135ty23rIVZ67ibLobtMtVUn0pYEFgBvMCYp8DD0oUX8N11SlzfFg2NKXVI7jhKQtdA3/Zeg5BLWnr5SfOr2607lTm1I0tQ0Et5LxUEuHUxeTcvSZbxFB8UXvpMBSfdtGNj/FGDRnr3VlzftpSEVEN92j50htxffVWFzbP/2WtiKZZONRl1tkku8hLj7/Lkn9e3T6lrZ5yu9xlaKXls9Nt8BSkubguWXwyKXlb9TWn+u1z1mB5xQGH12aiTBSdoJtIosVgg29Ghq1Ag0HWPFnXFzHVeKQl6K5wgVOEJWp1xEFLH5ybyhXFHgkOUehx7y2GxyeAp6n7f2G2RBodfXykmJTShF4LC1v2mPWIg91cKl/1Hc4ISoXdWH8aKXpxU7c8h98Ohy5IWClxuz117153DxaDEoa1TKQ0tHa1jFulqfpOaZDaoYhag=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2616005)(4744005)(508600001)(82310400003)(8936002)(2906002)(6666004)(316002)(36756003)(5660300002)(4326008)(70206006)(7416002)(36860700001)(356005)(7696005)(86362001)(26005)(16526019)(1076003)(70586007)(8676002)(336012)(47076005)(426003)(81166007)(186003)(83380400001)(54906003)(110136005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:05.1111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc95e13f-c8a8-4adc-1f4c-08d98da38e1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3594
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

Ref counter from device pages is init to zero during memmap init zone.
The first time a new device page is allocated to migrate data into it,
its ref counter needs to be initialized to one.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dab290a4d19d..ffad39ffa8c6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -220,7 +220,8 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	get_page(page);
+	VM_BUG_ON_PAGE(page_ref_count(page), page);
+	init_page_count(page);
 	lock_page(page);
 }
 
-- 
2.32.0

