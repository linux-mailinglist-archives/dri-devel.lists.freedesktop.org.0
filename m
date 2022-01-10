Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD548A301
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1A10E5A6;
	Mon, 10 Jan 2022 22:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54F810E5CA;
 Mon, 10 Jan 2022 22:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itY2gORGyS18Dld8UP4X+k7d+43YYxZxqc5cWH3IRAkkm8dG8dl7wdT+mYacP5OO2UN+9QjxhI8+Abc11cdrwFn9UVHbCZdL8wo/W444oYa6WUzEgNbq82QNkhS6WDgTjM+a7/CaIHbEEoymyIe3r0zG36vGOpy9hu1fpihml6oE775A6RwHtIPtf5QEK1ZRsVEUbJG3GvuSIRqgdvICbAIUA+2CFjhRC86ZRfkYkGOzEno1fX1X1I0G5ClBuZ16Fv3Ot2wbyuqoAKLMLiFS0+9h54D+qDF+D89HQiaflvBpmi3xx3xeas7yYtgH30tqHMV/9cG7jCCDNxwy45xwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwyfkvrqkcGGIiwy92gf4v9B4DW8sLVxpiKKrb85YDc=;
 b=AKrngDXr7lLbQ8cdScQzgHI4CQ7RiY1loL8QD7kNYd8osI9yD20fAPwPpS2qkiuRLbmnxDMH9BURyxZeb7Arab8dy0GRJCKqj7iJ238uPaBPkuJ31e8XFByuLdHWz9ipZydRENsFYuFE7S2sQd3H5QycJ9deXyJolQJBMfkVKlwNU0EpTJmkC654WDrXzswxySzqSDJounng2K7bH95o5jDGHyu4jwTfewTJCZXuc4ZQlWub25pOHB7N3ScP+GZYlOsoIGqgTSA6erQSPiekmWoS3q17QOgmBNlqeHmwnYB3LSbHp4w6KuGElw4jjBbJjp7osI630tl8ZO1/HI1pTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwyfkvrqkcGGIiwy92gf4v9B4DW8sLVxpiKKrb85YDc=;
 b=nAfGgoHB0OXht25Qbs4UybT1aNNodmQ8IOAtkUCq1CZTFqxxbCIZmkIeBlu3PKjr+R+Y4h6nxiADJfW1/Iyj9f62wD2WYShDoOzVIuxDDru2HoAM853WiruILBifhXuc1zDe2p6gwCSUZ4yGoXxhsQzTTrDeMOaHStX+5c90zC8=
Received: from BN9P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::12)
 by DM6PR12MB2972.namprd12.prod.outlook.com (2603:10b6:5:39::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 22:32:16 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::ba) by BN9P221CA0004.outlook.office365.com
 (2603:10b6:408:10a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:16 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:15 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 06/10] lib: test_hmm add ioctl to get zone device type
Date: Mon, 10 Jan 2022 16:31:57 -0600
Message-ID: <20220110223201.31024-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 673ab353-c247-415a-80b6-08d9d4890e3a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2972:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB297232A8DF67A1D6F14AB98EFD509@DM6PR12MB2972.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FKYiAtvEhujek1KyTVtaYoTer6oe0Vi8EBvRebJqqChi5ygAM1Id+QDgZlgWcd3QQhzmNc5hin3XPvlF54MohvY1VxEjg0WuuMmUtLlqS7S+Oh8/EuxIBcPcqfS/XnxkiPI6yGT1bJY5Nmqi+BZxQPDJ7gt1nLc8+69C/5XrGy7pEfSp07lnt2OtxOFTVE8Wv5FJCNIPZoyTTal+IfIvGmeuCHvZ8Jxq0j5DcY7YHOTla/x+/a48MGEHDs7E4qNX0pfUIoaq5us7Jj40WpnEZoEVdDzaMW2qwcfmHuyk/m61bQ0CQw2U2JgHiLnn7paMgq8jhYlj5E1/BHjlCtCAODqag+GhijkFgTkuM7BxJLjH8qqmt+tSnQi80PrIMz0h0v6lhSnJXLHVXC9Vs6cHmpqQ8GRfHYxRT9FSvjhV0Thuu4BYRqXU82eAP+sYmOAlmNZ2hZEjYVxtph44BrOsqTBvR1UVjeRrq7QX7VxWnoxEXFyuVEBSKbdBQX2Ty9CWtLxCQRw75aczsjsPvBT5BWiS10HAbzcGwe9ayY6wKbfcuIuNxmMjn50NzqqFvzM2GsafVSvhETpNFRhCCSh35xFpGsC2r1jb32IzPkRpdFlvszrsaLqzdJrw40CCyCQ6cT9CNOZd4Pq46mvkLCfUqhXmj1uMknkYS/yjE4+uXcVLy2btwNLOEk2jJ5f2EYHDlMX9qm0CckHVYEL/QQ2tUygBg/SC5pGrAHVH/Vde7xThcT7sVYibmCdCx26oQrgI6vYVz7sh9Q2wCDx9oVooVBcbbX7/0Tz8AudtHXLUkM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(336012)(426003)(47076005)(36756003)(7416002)(316002)(508600001)(4326008)(81166007)(6666004)(82310400004)(186003)(54906003)(1076003)(110136005)(16526019)(83380400001)(2616005)(44832011)(86362001)(26005)(7696005)(70586007)(70206006)(40460700001)(36860700001)(356005)(8936002)(2906002)(5660300002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:16.3490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 673ab353-c247-415a-80b6-08d9d4890e3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2972
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

new ioctl cmd added to query zone device type. This will be
used once the test_hmm adds zone device coherent type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 14 ++++++++++++++
 lib/test_hmm_uapi.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c259842f6d44..97e48164d56a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -84,6 +84,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -470,6 +471,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	if (IS_ERR(res))
 		goto err_devmem;
 
+	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
@@ -1025,6 +1027,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_get_device_type(struct dmirror *dmirror,
+			    struct hmm_dmirror_cmd *cmd)
+{
+	mutex_lock(&dmirror->mutex);
+	cmd->zone_device_type = dmirror->mdevice->zone_device_type;
+	mutex_unlock(&dmirror->mutex);
+
+	return 0;
+}
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -1075,6 +1086,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f14dea5dcd06..17f842f1aa02 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -19,6 +19,7 @@
  * @npages: (in) number of pages to read/write
  * @cpages: (out) number of pages copied
  * @faults: (out) number of device page faults seen
+ * @zone_device_type: (out) zone device memory type
  */
 struct hmm_dmirror_cmd {
 	__u64		addr;
@@ -26,6 +27,7 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
+	__u64		zone_device_type;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -35,6 +37,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -62,4 +65,9 @@ enum {
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

