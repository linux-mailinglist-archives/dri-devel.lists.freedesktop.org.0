Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892C4A019B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460D610E3B7;
	Fri, 28 Jan 2022 20:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E210E244;
 Fri, 28 Jan 2022 20:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzF+nuoWlWPxaGBqxrjCwX7JvBCUfRZxkI4Naeqk9Xrsiq/NyGvUT9FRkpLZaOuHSsYCmsAqXuh8SxxtiM7eJOVZpKSzxtuPcGOW6gJYJO/I/tjlZX/eUvWhU7/HkE/Y5GcXkF+oRdynCQOhXh+p+leDqubcwDbNZBmnHhpvnI4pzi8Hktron5s+k6PHHYotKebo5vqF7bWEM166yvr89elRDjgaYvy4zZKEl6BXXQwgMLZ2IZGNWPHd1mNuLX6Eqmv2sZieSEof0sBxq/dzkk8EXusgr+XSbHI55zWT2BPaHrvVqoAU9rRJWb4jj4I2XczbEw0lZVftH3Uwpqar9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B2SEKvTANX2JRyraqAhhc9gtOSoTtrAVSBb1B6KPZM=;
 b=jw+59/QtZR2alkCzurfbpm3MrqB8NuRz7+K3DJ4249MFt4KV0qP7NVEdUTaYBhTBqHfkuPNAtvwY3K1EIHaO1TGFZQ8ChP+2qoJNXTAAK+J9CVTfzAjfpLKNS1Exn81aOwHbKVrDDN43utMgGsMms0hLverCwxzd2U6nGT27YL4MqLB1+u4MyhOuiF7vOouinV4gshyoSFzrXbisWUr0QDSAa9UiW/GP2SEjfEX3pGUsWpjGVx+nEsP0uIjunH4v18sXKgCmS3Pbg/Pa3BnvsNPEU0mkUZ0RqCZNp0mqHK45uovKKSrxk5MRqMEYeixwuu9My/WZC4j869geT37BFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B2SEKvTANX2JRyraqAhhc9gtOSoTtrAVSBb1B6KPZM=;
 b=heWdMH32p0SCLPqwZt0V7FFh1eJOzJN7Uca5EKlLZ19qFJbjNFaMz6ZbWQ696V6669DgIHK2gXQCIXQjOL20+RQY4WbfLi2gFtqtP7wloujP0dJBcyYhE+KmwQza2bOtvCq+9iZmya08MymLdgePV19oIgwSe02RYYAHT7ZzW+0=
Received: from MWHPR19CA0065.namprd19.prod.outlook.com (2603:10b6:300:94::27)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 20:08:56 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::ed) by MWHPR19CA0065.outlook.office365.com
 (2603:10b6:300:94::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:56 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:54 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 06/10] lib: test_hmm add ioctl to get zone device type
Date: Fri, 28 Jan 2022 14:08:21 -0600
Message-ID: <20220128200825.8623-7-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: df7d2280-7c18-4922-5263-08d9e29a0390
X-MS-TrafficTypeDiagnostic: MN2PR12MB4143:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4143B77A879A0911F6027B34FD229@MN2PR12MB4143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfwkzEQnUbNGfsv+lAGbpdauP14i8a4E3b7Z0veA/Qx9lTMardlP0B6rUyaiMHNuTGgvLgU+zvDy1dUXldfInl3eNEkUC0wgRVaAUr/6igTZWRn57VMh7hpr3IgTPd/ik0O2MyrI6WrnadApkzOiy3vk17vn3UWbSNtpG2JNCKXx9SWbGDvRdHcA58vafaErSxB5V/aKa71NTE+Hq9n7l1g2VG2P64M24OFEQGnyHtZ64eSjH8x911NbhMnsQUwFNiLZOPwjnLKhMXuaYWc3g2c2E9g0/5tPEpskpcPhqCtqRoLHy9OwGLeU+3ZPVMzqlTlnyDQBYIwezyQFrpoJ//ywz1HR6puHcSXreZpzykjqq/C5H6Nu/rziv4rHGExs1i0GJP8SeHh9yxUCmGimKQ3DpELrH0VtsIqt3ys15MB/csBg+3Ct5rpvN+/lxq+I9hMWmH8nxVHE03kg1EJ7q/x1Ymz+mTKNxxO3S0hMXoBe8NyR3eDTCFfRCNhN7Sg0Y100EsIYpPcWw0M9/5WeNClSlKmyg2faAgG1/1ZsINI3iVxehZwhK7JJu/pFmorHCHqdOOH43e9yoA+XO0hhW2SucMLWX7T8Y6qU19ubYSokIiXBQCOLw5VsqXff1rAAKG/OMY5Um0srhMdkLE0b0uJ/XYtKyCF7/DOwcijzofW+EZtDvvLVnm1+SJoLSPUheXTHJgxrjnoqUwpFE3+6sQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(36756003)(508600001)(426003)(336012)(81166007)(5660300002)(7696005)(4326008)(44832011)(2906002)(7416002)(8676002)(316002)(186003)(16526019)(2616005)(26005)(1076003)(86362001)(6666004)(356005)(40460700003)(70206006)(47076005)(70586007)(36860700001)(54906003)(8936002)(82310400004)(110136005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:56.0548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7d2280-7c18-4922-5263-08d9e29a0390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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

