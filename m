Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E530B4A60AA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90D10E6CE;
	Tue,  1 Feb 2022 15:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A1A10E69F;
 Tue,  1 Feb 2022 15:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUoyonWhQ0Yb4Q1SD/i6edk79HycyzECMkucScUFhKIe6zrBSKRXCvuujvV5ywWkEXpKajQM07s6Lnryyur8CAp6Y0bC1u1wl4UgNkIK5AUPSRFYtL7BfPiLRCDITz+dpesagKsXmrFK2VLKcnkbAw9cjvCF3akX5VXJ92pQ6IOLx/UfX7qwWrtkpjZ17thIR2UXmRpFPU6CODHD8v6f6mAV1VZYuf9H7SIj9h34IURqDXQ37Di/3DO3Ntjp+BILEuSh82hs7ediIHpra1rKx3/gT6bbzorf74RNd9v5FGQSGliFfL9SbNSiSqAB3eRGUDVPPCnCcf5kXj8je/cynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B2SEKvTANX2JRyraqAhhc9gtOSoTtrAVSBb1B6KPZM=;
 b=X/49pYKE+VY7RWQc0H6ZXrqgY6vEx0MNjB2PbUkj/f3Y5WZzZFYQcQgMg3xShuaguvosHqlDvCHcCLODDh03ivW3ZPAbHvO077JsTck0orSjrB5fSmFq2zz3W56WaHlBdqXWFfJty1qSL/tm+Abq8igp9BaoydFfq4UdDY+o01dYQOJj8jGidx/CF7jGd1Hayod1pVxci5V+iIgOrJFlUCAu1Of1rQxvvGi7FSY3UUabIky7XlfxfeQiV5RejPKnb+GJBhqRotfk7qGHY7byBi+fuyraiqTumaa1ZNaIoPxfASVJbq9LxTD4KYVYXkzGP2apNHRCYySDR5+zuumlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B2SEKvTANX2JRyraqAhhc9gtOSoTtrAVSBb1B6KPZM=;
 b=xbJVxBTFd3I3la6wJhtfJz3eyRYHMaVRJHcu7p1HQ/1hUnRkxVy9HHE3z9jlTSYCLc6SYzzVMW2mzhOWsnSATzubBr/wzNudRHOar8MUtUlIXgN6CB1iBwJdKzod8BPWXDar6SHiN1hXrQSYqGw43N8iLaj2PaHpu+DepY2AcrA=
Received: from BN0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:408:e8::23)
 by MN2PR12MB3824.namprd12.prod.outlook.com (2603:10b6:208:16a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 15:49:17 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fc) by BN0PR04CA0048.outlook.office365.com
 (2603:10b6:408:e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:17 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:15 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 06/10] lib: test_hmm add ioctl to get zone device type
Date: Tue, 1 Feb 2022 09:48:57 -0600
Message-ID: <20220201154901.7921-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95ac99f3-db3b-4d7a-195d-08d9e59a679b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3824:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3824E739EED7BC03D785BC8EFD269@MN2PR12MB3824.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klz3y3Z97OtwByucdbobwC1/v8C1EF61+KTzAlwdyzB08lLseQ8GVgilHlgljgaVLjTQQpCxdpedNcZp42/RzHWaDzdkVYkO6+8skTAfLFXItbM1hvFkKLyC3k5T9gjmo3C/wxin5NpLhkrIskdkbUy4wllFzl14zkdp5ffC2OD8y/mbP9qoLdphCYnSt9hzwJKnTKNqNcgm8y2BGMufb8H1DF7SvrU+ig+5agmzHSXjjXQr/oOnLgFf22GrUDy6oLwzhWDMrTi+D7/M+vAFgk8Ew5FJ01tT57owOwXHqtBsaNCv07cvxV1JN79OjaBJvaceWCN7BPT0thwU+1wz2C0G+kMUzDDXYKfmaWqX2QgT0tAVagEDIP3KcJW1vnmguS1XxVrukUijqbklWgkN0zuhWJiaJW02N0TRowKTQOP2GEqPVL7WCjQjiQlffmift3yrdik4tdUXjAFLiTNpqr1fw+m9ObHDsU/aJfdzgPnJe3P1z3ZaTQpJxQsGnqWw+7/vKnvVA3GsA21dn9K47QArlJYyFY7+1CEifaaSWG9dS0ecDG5dqmUrdgATBH9Cwlc54quMlCzfgS/Ib5zwMl9+HHfoEJcNGosaZ7+En45/5l6rTfE0PcXZ+YUuO2/dr8Ok0A8l5e0bC+i5/Mnk8yRar6RW1zazWLGlmvdfRUpwrJFSTr/INFpo3MYHOl0PFtBsClNDizgOWgBJomU8/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(426003)(336012)(8936002)(316002)(44832011)(4326008)(8676002)(81166007)(26005)(16526019)(1076003)(186003)(86362001)(36756003)(508600001)(40460700003)(83380400001)(2616005)(2906002)(82310400004)(54906003)(110136005)(7696005)(6666004)(356005)(5660300002)(70586007)(7416002)(70206006)(47076005)(36860700001)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:17.4796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ac99f3-db3b-4d7a-195d-08d9e59a679b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3824
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
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
 lib/test_hmm.c      | 23 +++++++++++++++++++++--
 lib/test_hmm_uapi.h |  8 ++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 767538089a62..556bd80ce22e 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -84,6 +84,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -1024,6 +1025,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
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
@@ -1074,6 +1084,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1258,14 +1271,20 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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

