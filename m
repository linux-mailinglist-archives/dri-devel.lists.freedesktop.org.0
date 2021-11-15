Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AED45122A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975126E863;
	Mon, 15 Nov 2021 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56836E84B;
 Mon, 15 Nov 2021 19:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWaC5OQWnX1XLdBLt/t5EGDNXh6sw0iSJnjFR4BnBLqj1XJRcvA8fBjkGgYnMxZtz7xilehBZl/PFeHwbbh6IqvjUe0oKmEYvhZwSgVEY67NvLOXI4nrXXHjcuzP1tzLv7T2IkSxXz5E5FpU8EG0rOexokjjKUrmWMZyhQLVV4id2ZF8ZrHT/V4A6dotTq6Ko2J456W8BAf8ITRhwLI7b/FbOizYLhJ9bwSh8q5TIDj0YyeZz5NX+tymLBRd8pn3b2sckOApXBhfozQUWcHiCkYe0E6w6ZDh2p/1Y5cn1px97oBy+CEuTxCvLPXwbiEnfk7j9mZVLT4heg7VROSpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=KPmOlExTWYsxxrvh2yP1PViTj4I6FyGw7COIZMtF8Dxq2KwLeHtvAsh5OdfSSTHm7P/UJ1q20JwrVQGuT0OaP5FE1MG4H+3RO8oLEgzQJgU/rfV2G2bkZu9V9jfCj6uKYTctUa7eWDlTfRYTdgnXhuGazAI9qyuc9XaBRwfMbuzGYZRcrn6gqSH/LJbxBnGjTT5kmiwDdP5iHb6b7t1UJTmGwDGL86ZmXHTpgoRU8uSWnd2v/cH3J2+su5EFgeVVvuDM3IfSqonkPypd6lYAR6hMIWawdcDSe2wAXS4muxydgKhhBtTdbWdMdibUu4ColuzQrKES8B4HX0paeXoZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=P3TAI2Td3rFCyrCEwCW9EbqfFnPqCwc9F7OBnT5t+1OXGI4r5W3xIN/dQzeN6KVgyUBrTqBroM6u/Sy4Ei+ciusg2lN1adwlxYJzqrQmqc6qEMECC7xupn9U+6G+qizFRCqZIWP7F952wLs6j705G8c+YqGHZcOgIjWwOg1KdWw=
Received: from CO2PR05CA0108.namprd05.prod.outlook.com (2603:10b6:104:1::34)
 by CY4PR12MB1848.namprd12.prod.outlook.com (2603:10b6:903:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 19:30:50 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::82) by CO2PR05CA0108.outlook.office365.com
 (2603:10b6:104:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:49 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:39 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 4/9] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Mon, 15 Nov 2021 13:30:21 -0600
Message-ID: <20211115193026.27568-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da237469-ac24-4039-7a6d-08d9a86e6e47
X-MS-TrafficTypeDiagnostic: CY4PR12MB1848:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1848F0C22FD4A7224737AFFBFD989@CY4PR12MB1848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d96pwRs/8MrNKUH3RTAXFsTEgmfbGVzVDUpjP/PhLKsS+yCX9sAsqsXB3hO/bvq6jCp0bocG/rxr/Oah7TloXXIlvIB3r+zwCMIgmKoiRN7L1zofMoZ7jZ0llaSLVEjmLeDUwyeeyh8R7VubI2z6SzLqNPsbayLwFiYy4BGn4BPur7ffC+TQzIQp/D2PugS2JwbUNjRDfzZR0jZq7F2qHua5q/fCjkblN0LBb8N2clIu3wABcsOPhBSPUUhbzf5X3StDHQYvcY5JGq4FqulblNyt8XemzUR5WvDlVrrje4auYBBaSfq5zFk1v9mlG1muSKytKhLXoL0f9eimSRgQob2P34JPXVryQHsFY6BemH3JdhZhxpRWfK1qA3WxIgkmE0JIWL4Yzd75LBkEkkjrP3q8svr01wtUGlbYh1qrWwqscapYmYI3wlqS6XvHpR8SRpvllNPq05N/tJcTrWO1EujdMZaiYnNh1WCw90RfXEMww5qEBbQn2OODx1+mekGW7BgDQgc44pnFjX68/76jMiSB1fTY+pdKXYrwWXaqUn9tCrxos7+++jkyQ9C5bydF8uHdF+5zRBH80cqEImvjI8yzu0BFjrEXtmnnziBSLWtq3S8g9kH+ldlsElGmEc1ZDVY10tuy1eTrIH9A+oh/9FYlJLZwHGzehqtG4/AdXMhG5XGtrafeLkQKa0urK5+2XZkYdBQZE0ecMiYcy+JLL67quqtnYt3EfCVjCs+BhT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(54906003)(36756003)(110136005)(36860700001)(426003)(83380400001)(70206006)(7696005)(8936002)(2906002)(508600001)(316002)(8676002)(5660300002)(6666004)(1076003)(336012)(44832011)(7416002)(2616005)(186003)(16526019)(4326008)(86362001)(26005)(47076005)(356005)(70586007)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:49.7944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da237469-ac24-4039-7a6d-08d9a86e6e47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1848
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
index 9e36fe8aea0f..3e405f078ade 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -661,9 +661,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
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

