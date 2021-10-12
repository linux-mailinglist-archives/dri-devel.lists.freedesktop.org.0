Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3742AA7E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72B46E5D2;
	Tue, 12 Oct 2021 17:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71516E54C;
 Tue, 12 Oct 2021 17:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElxrFIKixq4P/YTLDcvbR9geyFyuLV8vmVdpb+QCzvoZVNXed+YmlQdvX9ZC81ttnNkVmH7hUK8ujOygrUC6lUSAAt3ENFV1FD9Yq47WC0e7cdqz/Lw6lhJMA0GBBTO+F/Z3yzAcoWE6uGzupAWHTyB3iAPRe85sPJ7pOqbQdNjYdPWbRMhY5BMKKuS/g1ILRA+h/eSZpzYy0Kx8AiGb00kHJohlwFxbwyifqvnm5YWMHelQdr4Xj51rB8Qsf3NtDvx225B2oEAHLU+4eaFleTAoaqtC2wwQwqvsTD45NDNLkA2vOvSLjLzI2iuRgIJVTm9B6s5tLZJF3c+aCQ2UQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpwMDrMZOL20IsyI4cMiYJ6Nkzt8TdtjHg3iBTGaHag=;
 b=XG/IXnW6plnJG5S1k/kcueRGFIUzjbyf6ekfyeve9Xal3s+EJ2XwNo8znIxuhf+Me93e6oeFxg3+912INmzBr9d1E9SEZfwxF0BO4hk+zQTdUsYwE0HmElytfYrNiYsmahas1Wl3YBblByERI4AXg6oV5Kd5v6It5F7l/z/W/+4p6/C6H6gmi8yumh6WmPdw7tqa3my5aazxxS2nXdxBrYFXRW86SUliNWtwtzpY3ljMKU8sC58xo5rV6YXcx1pTDgSZHEQ+IAIq1Tnlr2So2wqQx86twuS/V5lrvq6FhwZl9NPXnQjiNKwAYlBoIpCEuUZvWcyRs82MVHKG9rfmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpwMDrMZOL20IsyI4cMiYJ6Nkzt8TdtjHg3iBTGaHag=;
 b=XyqPE50mOpcnzHpCK0mwez1uSfgH5dmuqBqPgN4muRqtyLBhA0eHQ4kO9jqRNWrzaNHkLqhdMqZwJPcL4wrx5EHTJ6xnybm/zg6dMHt366SFhmzBOR1lbmkvD8gvoBlOjS6cvC9wFueEZeHJuPoVxwKYrtPdQC8uQcFSIlNnApw=
Received: from MW4PR04CA0276.namprd04.prod.outlook.com (2603:10b6:303:89::11)
 by MN2PR12MB3071.namprd12.prod.outlook.com (2603:10b6:208:cc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 17:13:06 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::14) by MW4PR04CA0276.outlook.office365.com
 (2603:10b6:303:89::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:02 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 07/12] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Tue, 12 Oct 2021 12:12:42 -0500
Message-ID: <20211012171247.2861-8-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef5a3ab4-7f37-4c2d-630f-08d98da38ebf
X-MS-TrafficTypeDiagnostic: MN2PR12MB3071:
X-Microsoft-Antispam-PRVS: <MN2PR12MB30712A09F22085B505AB8A68FDB69@MN2PR12MB3071.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aSzRj57sfXzgGxoQpWnRXV998YZ5cE7gS2ZNjc2rxrFb2PWasoNdskMs7aheyckkatE6Pfc1fDo8Yg2+JN/Su6pPcYqR+n4zSq9YHMDXM3PWJtWtAD4EQ0zxyo5e5vtVQd7Jw3AZBlyMwq4qNp6W8/uTaNrn6Ht6HflEBEfzSDdyg6jnaOcu8tgi6EkyeT+Cu9ZMLpDsOYWxVxWtXGb8AEu5RyEHcqM4SJJyMC6WhoFza9+XKIU0pqV6zwSWwqwTFmdK06BTShQmfaTNYatAQ6hRj//hb/4RZOCTI7O1XL0JpzHLTtHEdkTrlC9nP8oQiUQwUEWkyaCNXzKAhzn8ToeAq3J4ASRQfVj3UjuTfdmwXT1nxStR5fLj56m5GUnm1OhUgG/ioZmls+sVLMLEhjCkEuPU8L1S4koz4xIj6X3wFy8z3Vn9r2QoKeb4q5Ux2xGRAmt4G6/fGIKUxhehEzLcobzx14DeO1XwBwWrWXjukEtSHWrwNm+WNQsONiBkC9XVuxL3nPHi5dMLjLd3+MhwsMp5b9L9L2atYOWLgc6a8hQYoTTHOwkOceCQ8EzyyVux0p8Qj5cPMhMGtgGDbI0FrP4X0F6ypnKBzXfuxLpQiIpxYxZ9NTIdoucFg8Rnxa5zM1lmY6m3rpBhjsENLoXBSBDow/eNqWXPsOzcC6yrLMlHSCVzKBHDSE4v5eZmVA9Nf9oGZ69cCh00A5b6rLO7YO8yyoXTvZiW1mphTEE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(81166007)(5660300002)(426003)(47076005)(1076003)(86362001)(54906003)(110136005)(4326008)(336012)(70586007)(44832011)(7416002)(316002)(356005)(7696005)(2616005)(70206006)(186003)(16526019)(2906002)(508600001)(36756003)(6666004)(26005)(82310400003)(8676002)(36860700001)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:06.1830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5a3ab4-7f37-4c2d-630f-08d98da38ebf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3071
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

Coherent device type memory on VRAM to RAM migration, has similar access
as System RAM from the CPU. This flag sets the source from the sender.
Which in Coherent type case, should be set as
MIGRATE_VMA_SELECT_DEVICE_COHERENT.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9efc97d55077..4ec7ac13f2b7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -617,9 +617,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

