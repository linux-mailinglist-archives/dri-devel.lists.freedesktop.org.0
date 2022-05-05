Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2282351CB2C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863110F95D;
	Thu,  5 May 2022 21:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CA210F95D;
 Thu,  5 May 2022 21:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzXG4sqOH6lFrTZOipAHwo9e1egBxB9YNWhpW1+vfdJRqdW58rjUvsB72rkmsOG5JYqMHXPC5/9CT0TTj4JSeoburaYrsvNs087YJ5eMpUMSz3jlml3vilgkaUrd4QQ3XvSeux+d1LMVPloDMhu0Olyuc3AkaPM4v3JRm55l2V8FCf9m3gqQg5LPdEUbXRCU75iUd4l2BSJw0c/nVR1+Ycl7/XTfLs8crMr9SX2F0m8Kd4OI4mkpmrXrkDJZyxZHE+VbhemrhQAXwydWaZIkebwu/zhYjv1kk16znSX5ZY9lny5gGk46PriTHq0YDQt63wB5mvtCogG/TWE3gTZ1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYbAtd0kToehVPLGYK7/o/+Q5EJHAtvHQwnJELfJscA=;
 b=DTmzbaR6GRbdUxC5kVPZHKllpYMBt9yUFOYdlsjhGYd1r1BfMuHlyzu/fbIHRQepCk3q6WGh/7H/RF6tNCYa8VsY5qemkL1+u8/vBgL8UrDCiJnsDxclVPzC6XRUiYvWit610Jrj29ahDsbhIbXjLoMFALL09lVBenv2N5fnWoZirLIY0TfvY7bLB+y5mP9L1FDi0TFT08c6jnNTT3eOjtViZYvreC/jg8kTpx1d6/JaBF1zhk/QoEQtpxlVHW++szmGBJTm/PMRi78zPzySkL7123gs2Qkk9qhtNiPXOgeGr+s2+n7/1fe+aL9wxGZ5PS8mCRiLJ6xdC56gV0Zu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYbAtd0kToehVPLGYK7/o/+Q5EJHAtvHQwnJELfJscA=;
 b=Broi0jYz24Wav6sj9iDD1kL8878IUR2x4kxJdj9sjCkgRYJaJu2ZPwPDtJFBcijyafpxMy0sTofGRZ81fdwCplTP3gzvJ+fL7wnB691VJ7FKQ391wgSoHWQPSAGX/gqJ0leV3nx+PgEewxrjl1cF8NF4inEuY072D8hWtG9OfYc=
Received: from MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::28)
 by BY5PR12MB3826.namprd12.prod.outlook.com (2603:10b6:a03:1a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 21:35:00 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::ef) by MW4P220CA0023.outlook.office365.com
 (2603:10b6:303:115::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 21:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:35:00 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:59 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 07/15] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Thu, 5 May 2022 16:34:30 -0500
Message-ID: <20220505213438.25064-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca766d6-35f4-4135-75a0-08da2edf1be4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3826:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB38264F278D0EB473758B93B3FDC29@BY5PR12MB3826.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syfprjBHeZv3SQRTOX9/jrEkRNX+2KrLdR4P8rdvfPxyowKZ5YRD5ooyDvSiTnOOKKuIWQrHa41IlDKuVeSk7vI90YiqXqycE8nvqAk8QvpdG0JalnQ4wMVCInJyLA2iu4ve03K1RKwaT950/q9WUZ8RmR6NW28tffmjd37J73Ntau3Qen4SyAbY+5VlvrOGNNNmAiKNHfUMz3vnb63BT1rC0d6mP1S5Y4sQ6v+5c8tmxwNog6o3oePY/a+tq/dxRXkYqc9guvmkmUYU9DEx5j972vgNw07b0MEEzoIGWH3gatOlcTEa6Cm91+Jt0s5xS8Oy1khOpoLfK0uB/5UrXKLeP15ZTTrXaCVwyWYwnwzs8+vvNW9tWGODFrDIRNzchwicv5wglR3ah0Au4z+ABQDYlPeqXA4RTp5ExPb5f/Cdg0GzX+JTuPkk8ZzyINu24mpKUOFiXQvLkubpGDeX9/nmFD+FoTVoGR0XcUvhlSs2TfFir2F9fYFiu6Ag33bk6wkbNNV73B6CWQII8VwBKqitrXO/4yLan5ksxvfzb7usnlorUMl4+m0tHsf1elThrHYWh/qkdBPQ3yvKqVx3zJxydNkVm7l4SmbWchSZUu+k7ElM9Nu0GE1aMCAbPc2oZ2IyNIB5PqpD1Bhmtnp9fc9l2BzqcqwOE1BFlylaj+8jyqWKNx1fcK+9NIn34Du2vN9RFvbhr+YR/pMjBQpMXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(4326008)(356005)(7696005)(2906002)(426003)(83380400001)(2616005)(8676002)(186003)(54906003)(86362001)(26005)(8936002)(6916009)(316002)(5660300002)(47076005)(7416002)(44832011)(336012)(6666004)(70206006)(70586007)(36860700001)(508600001)(36756003)(82310400005)(1076003)(16526019)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:35:00.5169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca766d6-35f4-4135-75a0-08da2edf1be4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3826
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

Coherent device type memory on VRAM to RAM migration, has similar access
as System RAM from the CPU. This flag sets the source from the sender.
Which in Coherent type case, should be set as
MIGRATE_VMA_SELECT_DEVICE_COHERENT.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 52bd3fa6a582..25c9f7a4325d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -673,9 +673,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
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

