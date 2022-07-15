Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F4576ED7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F037410F64D;
	Sat, 16 Jul 2022 14:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B997010E06A;
 Fri, 15 Jul 2022 15:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5M9No4geiePklwmMfBMmz/xEnMrvtHv6hW4QCULhd3/oshMVNadTBoWjWXjnM60Q2VQbb6B5tBEgoD+KzUpyW3HkThTrdLtvhcqO/7k1DhxDlsjR2KiBiqlWAN00b/NnOQ4gXKKu6NQG8LM4mFo/mNMpmjad34PqIWSq+a/DxZbHorZG/Zfw6C0Z/HHz5ubMbRbqycEAWYhRAAGIC08chIcQjpp6UZWr8zrUOfYF2UD/6C4OfAekqj4AoByHAmmLFOnUl8SJnGT3tQG+wWoOKQGUkXYLKDBhelqmUaEvwHCYR2OHbKCiF2VtRVUf0BgI6CdcUkbgV3DtSfrScQoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8lzcu9Uc51zZ3prS+uZltVgKEco8VgkJ2E7O9HgaPo=;
 b=SAA6ZJV0yHUosCi1y+61teVyyJYa899BHn17bBrVn7QWQRsCepnGJqKt2iEJ6L+STgde+6lxW2CN8gyCpagZ7fwBvRdUnAwflcypmPh/jXkgkXiJI7IjmVqBhH5Xx27ss228dLZZRaViSkodrqhIrODyPgqE37Y2mMcBkIh8EujIe/SBMG6EKboJ2EVqGGJD/IbI/7AyegzxKJm1RYa4mqQFv3YOpYJNvX6XxszMiexDHSCYBaXlPTgKQVb/3v2O7kC5+1YL2ppAd039euSMcUOaCdaeWFqEz2pHW7PwJzlOz6dtCo9w4vDiXeaUISSfda6zDBg0tMQrwiJkn/xKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8lzcu9Uc51zZ3prS+uZltVgKEco8VgkJ2E7O9HgaPo=;
 b=QEGXLUC1KK+U5WJng+HhzJNljtPLaZIA55bRf34M8Zyh+DorlY0vFTnjGIPGmcM8CKn9/B3z97f33ETX9tgPeW8YkAT07FVr3Uqs/PCrS2yNebjA0BPHFm3pG3QG6yAMAoCQ7x/7sXoye+CczmFYA0jbkRnwHi5ojNk0l0uRTYA=
Received: from DM6PR07CA0057.namprd07.prod.outlook.com (2603:10b6:5:74::34) by
 BN6PR12MB1937.namprd12.prod.outlook.com (2603:10b6:404:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 15:05:48 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::da) by DM6PR07CA0057.outlook.office365.com
 (2603:10b6:5:74::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:47 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:43 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 08/14] lib: test_hmm add ioctl to get zone device type
Date: Fri, 15 Jul 2022 10:05:15 -0500
Message-ID: <20220715150521.18165-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d23c36a-44d8-41e3-593d-08da66737fdc
X-MS-TrafficTypeDiagnostic: BN6PR12MB1937:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QpAuV0rNSBZN+20uXTRBBkk6sZZzgGTg5Ijp4jl2IpAA7xtAAnOldNIOXTplX4p0UbI0DjvK8w/nbmZIEGTNE8VZdv1JGBryl4+EPA2hl8xYFaf/HezOxEwJmZF3NMQX2SSK0EME+46UO3RzTbP9wbNPNaFJfim5IhK8QxrGhVX91Hql1u4CKFt/xCSDbJ5ubH6X+QnWPlibn/WEo0LVw5uQ73V2IR1TTxWR2p68kCiiytk2QpfgMVwFdLAM7Ce+JDbqkMKEeejXRkzmDA7yv3M+tk7KTBQ3T/4rddmmUuIBNQbC5/IguXC+MDgVv410odUEy6qgZ8dxj1zb3SHlyEjEiSAq0rN1Dz/XLPTHTn2RCjUDw79RChvTCgvmeokumsWutwoB5Rql1O60vdaf90O2MHjDtyUBm4sTsm+oyEELyMjsXnijM5lDp8zSQwEuFlSCZdK/8MRIqPt1uHu87s1aabxQtAwTfIoKgdYAx57e8aM4jhlls5R4o/3BhRB9ypulLV7TKH3hUSL3zLnaPBJS+HQpouGoR3IVXCrFkap0JocWZ/FrjKkYQ3XdzzWmBR1t8x9Iw29g89ewZ0w13y+NNW/dQJE3EoBs48PNxGhdVWauy2t4grHZWZhSC/NCIZIhU2LJjOcuW7r5j4Oakd11W5oQZQqVzn3K5IxgW3ifu8LwI16OXF6sr9OT9WR6bdV3OeiHPQeQyqa0dzdpW0sazzeU4+LhMcoL9IsHN0lzzfpzGQBG9yDrdpTY5Ckm7w2POPaG/TeGQ3YmZ1uNNPmSu2v3XSoWupGPawI3p7zw4+IIpXz7jUTGDQmEMn4qMfpHcVWLD7o7jEwJ8YcTAgWfyazorrzJurDu6ehtWKE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(40470700004)(46966006)(6666004)(26005)(7696005)(70586007)(478600001)(70206006)(8676002)(7416002)(86362001)(40460700003)(4326008)(83380400001)(316002)(81166007)(82310400005)(54906003)(41300700001)(2616005)(8936002)(426003)(336012)(36860700001)(16526019)(82740400003)(6916009)(47076005)(1076003)(356005)(36756003)(40480700001)(186003)(5660300002)(44832011)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:47.7672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d23c36a-44d8-41e3-593d-08da66737fdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1937
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

new ioctl cmd added to query zone device type. This will be
used once the test_hmm adds zone device coherent type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/test_hmm.c      | 11 +++++++++--
 lib/test_hmm_uapi.h | 14 ++++++++++----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index cfe632047839..915ef6b5b0d4 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -87,6 +87,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -1260,14 +1261,20 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
 static int __init hmm_dmirror_init(void)
 {
 	int ret;
-	int id;
+	int id = 0;
+	int ndevices = 0;
 
 	ret = alloc_chrdev_region(&dmirror_dev, 0, DMIRROR_NDEVICES,
 				  "HMM_DMIRROR");
 	if (ret)
 		goto err_unreg;
 
-	for (id = 0; id < DMIRROR_NDEVICES; id++) {
+	memset(dmirror_devices, 0, DMIRROR_NDEVICES * sizeof(dmirror_devices[0]));
+	dmirror_devices[ndevices++].zone_device_type =
+				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	dmirror_devices[ndevices++].zone_device_type =
+				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	for (id = 0; id < ndevices; id++) {
 		ret = dmirror_device_init(dmirror_devices + id, id);
 		if (ret)
 			goto err_chrdev;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f14dea5dcd06..0511af7464ee 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -31,10 +31,11 @@ struct hmm_dmirror_cmd {
 /* Expose the address space of the calling process through hmm device file */
 #define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -62,4 +63,9 @@ enum {
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
 };
 
+enum {
+	/* 0 is reserved to catch uninitialized type fields */
+	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+};
+
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

