Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359949D8F9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0D210EE10;
	Thu, 27 Jan 2022 03:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708310ECAA;
 Thu, 27 Jan 2022 03:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZHyVm1ZKvTSvBB9UZIaQgSpOPA0VkxDIJ04TjLalAwdBBhjH9f9joWM8xbKrqtj33rmqxrxkTfARMxnyBPXLN5qJdyv+G1sP5iG9g07fwDF+9K+lLNZFjv6ZfzQntqEg2vlqG9qjzNJjrX2bMDwdsTktx+hDDXk95Gks0mGEz7M2nMy4zp98PJJbP62LJkuXqQrq0p9JXssgAZK77MF4FMz+NATcCmbt283BrwCP+DZmOJbSXi7dHMe7vfey7tSul1zhQNdL80LUWlXcHWAX8WNsjJyIFa/RR7aYsuDHw06whnoF27VpNdLEj/dJNfSp7IMv17/L9/mGI9/Ya+Gnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4Gx4O56pz11w33yhsqgpm264AySA+e5Qi1ku8UkUqI=;
 b=kPzq+TYwM+FFpZi6lqOUd0cbbrf6kGPXIwpfjTK/41xIjNnp6OBvDGt6YEwPbQHRfKjsFg5k6wH89OIhBmuuThFdqXpinWl+ZHchE08Vw+hzNBDWQfBZ+swCupah5oYCZSmzPAsnCCj6d3xk5wSMP7JUxVmpYjh+otj8dyh2GLkKHb4S2akD1moboPtDna1UVDeetr+QRxKtOxRAZjerRItgc9KzHJJXBi89TiqF1B+99rcdq2CPJqbyzBURklvvhjZIIs8jkQYFLolXtMF62k4tBmzVwd7iTBE9aUrZekbW3ZUabLMe4iGvC4NU87O5f8EqVgsIjvwxFCqR164HIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4Gx4O56pz11w33yhsqgpm264AySA+e5Qi1ku8UkUqI=;
 b=jrnIxJhE5IXiqEAh3Z+6KHvDXzUNpWiB42oDgORewwnCmEtBCTiPXHoLOyo7wXlTc069jQ12NqTFACQfl4omBejzBN0c3HR7vSwnIk2/jejwtkdTKSyHFWxZlFq8YgEiEuQzTgp986J/ejY3E9Hg5lTVmfHxwN+rrZ4bWRO+qsg=
Received: from CO2PR05CA0104.namprd05.prod.outlook.com (2603:10b6:104:1::30)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 03:10:07 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::23) by CO2PR05CA0104.outlook.office365.com
 (2603:10b6:104:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:03 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 06/10] lib: test_hmm add ioctl to get zone device type
Date: Wed, 26 Jan 2022 21:09:45 -0600
Message-ID: <20220127030949.19396-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d93e32-8eab-42ae-55c6-08d9e142855c
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55556C15C0E0874464C897BDFD219@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgLPRb1Q5leI1mGEwMAXiP64r1MD9uGPRdsg9kNjiLePxrlTBwG6J4gDlDe/QcVRmtM8JF9uIBYFij0BPQ5PcC8xGuauV6L0hckEE5CjUalQDQfcMOwRFS+nZyAzTxvudmQF2LiqlM7MFN87G9kPM2eU1hiYRTrq/XVH4gyZ+hs+GUJcUVO4WYHQixsE9wChJDdKwltR577gOF2kbQmnAz6/W36uNWyL9tasXd7bU071FqshdhqU3CZDCeE/Uzp0latAwhqsa3ug4wExjuDLH7T80qdDBbTrb9a7ePlseovC+u6mtGMtrpt7mG983KvldwplIm7U+iMQUuRX+g3HG+tYJrsudAr8m2TeTsV8+l46IDW3/wzw4uollgaheSVK3imlyVifQcb01RFi0Alg8BYyzMl5aXHNokKkMLtD7EGZqwttKDs5vnHw7nFAyTzg6IKgwEsLC7gkmNsC3IvFfCW5PTQtvcDnYg0X+PFCJkiWW+enghmyjgxOujC1B4UNU9fTUNuhaqyaoe+ogFr8abO9moDEBtv1V3YzkT2MzqYDR+EB9fieLu9w6Fb+pazXd2PiMyLa9Hswo2y7SfLtzPfAtM/5Xw9OuLFgHXua0xlNv/yy1bMtn66369f8rctLdxo8GVpA7KY9DqpjXUT1VhIL/R4ue6biLNbUwHmDyKNDaWiNjEK9onzvCOJ0ltCzm9kMSwFrEJ3gjk9LVb8mfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6666004)(44832011)(7416002)(86362001)(4326008)(81166007)(5660300002)(7696005)(82310400004)(508600001)(70586007)(70206006)(83380400001)(36860700001)(8936002)(8676002)(356005)(36756003)(316002)(26005)(1076003)(47076005)(110136005)(54906003)(40460700003)(2906002)(2616005)(16526019)(426003)(186003)(336012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:06.9273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d93e32-8eab-42ae-55c6-08d9e142855c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 lib/test_hmm.c      | 23 +++++++++++++++++++++--
 lib/test_hmm_uapi.h |  8 ++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c259842f6d44..fb1fa7c6fa98 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -84,6 +84,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -1025,6 +1026,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
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
@@ -1075,6 +1085,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1235,14 +1248,20 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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

