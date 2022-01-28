Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB234A0190
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69E110E26B;
	Fri, 28 Jan 2022 20:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA8F10E249;
 Fri, 28 Jan 2022 20:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKW2u8eN2V/lb2x70V94SyGJMwPr2u5JZo/jZzuzsCwqWipXIU9jh3cIw5sH57RWJMn3fQv8WmUBp0N48IvEos4Hx9LlmW7PzBtUg4z5Y0ceDVEgqafTT60JfauJycyIkQDB9bhcO4Bxejo02eWx+ix/UVHhyiIbs44dD367EHK7lcfGtZjtxC3nySKGMWb/sbxuPfojwqD6VvqlGU5PEYTyYNMzzHCTBKosDLP/EKOJbHI3aE3fMrek/QVmOZP7VLfRVAUFfTi7fuqNZAs29V1gD+0T3oMUKbcdgbHehdHqJDhrp/K3/f586dT18Vecu45BkVpnM3UqQiZh3KNZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKdah9ociAAjWA8oWytWUkonkykx0MrDTa+hoh93Wfs=;
 b=BalulE5x/gHeqpWxONIxaixkE6JnOpBi7Rf3I4yHCpZ6+go+L30GCa/Q3pyUV34/E841lvA2d++lICsKsjJhSTC7ZE1KTEbnpVyN/x3hHpWyoovmixYab5IJtdQ2Wn5Ora/G94hP+WARw/aDHdXbMPXy5wwRS0gy6cZZYZU2HlOi79i1//yag4e+w5X93EZqWwCqCiBXgi+4ZUvVBP1BGRC+aaXswhnf89Oernmpf7RaZaFQGxPmS9AlFCfEUDER6A3qeXaapo/eR7+hsQkLEg6iPsihj3eSGZnnUJwvX7N4TUUCeOmqd1b1UP81fjftAja1fKpuencJqMZR+tIQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKdah9ociAAjWA8oWytWUkonkykx0MrDTa+hoh93Wfs=;
 b=M8Gvx6oGJiBTIIPDW+tOI8Ix4BbJCgCduQ9tzEp+UJ2Ntm07Fa5dz7miSeaXNDYtkQf1ukMHxKonDJjYVvVTSIvuE8YXAVI3trw4PS/q52zqVLuZDUFiA/ioUEOGs12uIFuN+qFsdHbFKKg/3omwL/rCECWDXUsNh6IvWF6rr2k=
Received: from MWHPR19CA0072.namprd19.prod.outlook.com (2603:10b6:300:94::34)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 20:08:55 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::17) by MWHPR19CA0072.outlook.office365.com
 (2603:10b6:300:94::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:55 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:53 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 05/10] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Fri, 28 Jan 2022 14:08:20 -0600
Message-ID: <20220128200825.8623-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a7eac3-f2b5-4dfb-4595-08d9e29a0320
X-MS-TrafficTypeDiagnostic: BY5PR12MB4068:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4068C611F62D68B895457B20FD229@BY5PR12MB4068.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivIm9OFEQDGJtC1pCqekWnu5B3EY/r8eY4s0x3DxbUwwd48NNY1oXLGCVHl68ZZMA9YU194LNP3Sm6magQqGghIkSV3FwNYjezb92n0vaL3kAcUWn5g1osuFe6STvccZMei2//Yct6J3oEmO8kCT8yEWwVglqz9tb5CdBFmhcqHUapEjJPGFkpjfrbzBx66+8xaaDYlA0+1C93TLiCWVnp5PDmqf/SwiK3ftrCjLiz+00BlwSjEHyXywEMcY13K4DQfnzCd0HMnsv2G+RqaZYOjCaGHw9PLQ6ASUw2SHPStIROPldb9dOoq+tkOzcKqW754WRjPObZ1qAgw4XfMcmvCszFu2eJ6kFEBSqGl8OiwegBZ+XYKiaUk8Q+UxYRtjHnvdda01brl4Euukcqao/e435oSBVc3alnyDblkcb8EM7FOjLEpojHOYCLh5Iiq1WJyayvMMETeQPiwRhIHZecCrnenglz+jev5RpRhptruFzJusO3dGhX18gjXNQyt4bqwzfZxW28QYwsFxWqER0bz/UhYeYGHQ/ViTm/uMJNkMY/Q8/FQFrb1izI00A9amg63rwcSCrgm15NxsnOBLtbqp9rWT0bL6q7Qv8Fy2RfYvUow5pc3vHewUa0dITdxtnVOE2KzA8EVrf/+XkFPG/ccKuwIJ1stvmW7K/pZohfzCOTd/P/Hg7IN/tGA37O01rffyXa08zehKsfAyT6P3iA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(7696005)(6666004)(40460700003)(36756003)(508600001)(54906003)(110136005)(316002)(26005)(7416002)(4326008)(70586007)(70206006)(8936002)(8676002)(82310400004)(2906002)(16526019)(426003)(2616005)(1076003)(83380400001)(86362001)(47076005)(336012)(186003)(5660300002)(81166007)(44832011)(356005)(36860700001)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:55.3048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a7eac3-f2b5-4dfb-4595-08d9e29a0320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068
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
index 5e8d944d359e..846ba55723fb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -659,9 +659,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
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

