Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE50539798
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3E010E56D;
	Tue, 31 May 2022 20:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E310E483;
 Tue, 31 May 2022 20:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBqJ3p6xdgR+qS677tDUMWsdyiCFGBbL0MeRWvh5+hluNaPx5xt/mJ59RfJialinO44SQoELM0HPZ+B6PYaoAX4SzJd2zsFgA+I+0cIpj7wgkWKdocKVgw0bNSkaGYhLPugX32chenEhWCH13iXFcWTCaijtbIUC/YpdFnMAWVsI/FZPZP4GJnCVWT0Hdonqtgdf9k7QU62oZlWRpDeWt/t3KGp+ygvdqXTq92Lf5PpGD1e16SUSvonZj0JFjU02YOI8viF/lNh7TUtca1L0wh/0oLwCGtrTQZdDIqx4HFvxac4yrMaOmcDZKj+thcgIn9VgR0yO5X7Erhba7CgL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8lzcu9Uc51zZ3prS+uZltVgKEco8VgkJ2E7O9HgaPo=;
 b=gxGWWgbkPk2pDhDm+vJe5UC4woYaElG8nJ/tQilfWd5lIEdwVmwdYdHj9XClZ2fTYeeLJzf3AZpNgYERUdV3ow6Pl2p5qwo7Mp+Lj2mVWmRWihP35eO6uL8kR7GFMkBzB9yPF8zk7X77kW+FoktlzlvpOkyQRpvL1BU+MgLHvaUe9ipyLLm0gzP36mRVVQXMNr3yukPnZJaG4DKQVqC/ZfgFxQaVAQ0BVkjtl3ZkC2eAbufAUArw9VjdbiRX81FAR38zOR6Um4uXx5pNd/3AH3zyX6LetdXv2SfLdX+TzzRgu6DXu9324njpzeUalbiIuzSYT2nlSUE5HsJujCJ59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8lzcu9Uc51zZ3prS+uZltVgKEco8VgkJ2E7O9HgaPo=;
 b=nxI4OPymo3q7x4JlT7mZ4bE3Mx55DMMwx8YmerVcULA6FuBudqltM9CRwiKGy4+D0BgwajpkbXWu/CZrxC/UgkajUZEDadha8M8fjAAqcRq3cfNYFIgxGMuBvCzZPy7WjZDYn8KTLhAoaOk1uz7zg9qMrl16P5uSmq05Iolpj38=
Received: from BN9PR03CA0396.namprd03.prod.outlook.com (2603:10b6:408:111::11)
 by BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:01:01 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::1c) by BN9PR03CA0396.outlook.office365.com
 (2603:10b6:408:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:01 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:59 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 07/13] lib: test_hmm add ioctl to get zone device type
Date: Tue, 31 May 2022 15:00:35 -0500
Message-ID: <20220531200041.24904-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12c6977-aa05-4e81-46de-08da4340495b
X-MS-TrafficTypeDiagnostic: BYAPR12MB2822:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2822784EEE37E3727A6687FFFDDC9@BYAPR12MB2822.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEkhA4w75PzhzcVQP+PvWe6aFB/TwIWmkM7iauwMqtvY6jcONXyslRDo/eRD+MA6qabreliCSgpYGaxY4FRJXVvA440p8UAE66XAiTNZDXXVefT/wd3ZYhP9D9Z+KJ8WcMWKMi2xSc1+Rpl9k2kXsFyAXQzarUaBnSjPVW7vov4+h1v4juGr9E4asMjmnuDn4CQPRLVodC1NSndiHb2ezbLzRvydxfzF8X7O2pGNeNzKShET3Ghyh3XK0F42tNEghjNgE2+xAKUC9TMREKG119Kn4LFum2ojNsrtQRCP7E0YV3xjAO4UNGkYyytaQnr4TvkqcxFTT9B9tvpPRCuSTFOhGuhjb3RTB+8r9Y+6iolg3P/iXolez0lvCWJOle+wA5ZZZe1TI3yXPjHnmzZR5N1oLhpt+vg0d+7P4uIa7JU+VGomnMogdpapwxNPN9Lzqf/DCT6StLPQvJarKMEdd9bwcjL04OhAosRcDO0bwoUWYG0HabxQGAEzlolG6++L9nY0hs0TR9UiN8loIiUbOeorcAKxxMAisQa1vWnnSLDMAjwY6b8T5UySsKvgW4bhjxSPU8yZo5paGYOa5RbC2BQpzyw9F292SvyVKhkQVoO11R4itKTChAcAoLpMpR+42zHR8wtDGXB0EoU4ysFDG2T8Jjg/84jKg47+qsudnSBe6Bi1xv6Y3EbO8Brpaaz0Wzg/Qu2H7malZ2i8K3czew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(8936002)(36860700001)(54906003)(6666004)(5660300002)(7696005)(6916009)(2906002)(356005)(82310400005)(7416002)(40460700003)(36756003)(26005)(44832011)(81166007)(2616005)(86362001)(316002)(70586007)(8676002)(70206006)(16526019)(336012)(186003)(47076005)(426003)(1076003)(83380400001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:01.3251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12c6977-aa05-4e81-46de-08da4340495b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2822
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

