Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA95294F7
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8B10EB33;
	Mon, 16 May 2022 23:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C81310E2BC;
 Mon, 16 May 2022 23:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrC5bI8PC08ZbO+rkM4cBR0Be01kxRXwr+QXvkGlsFoIVdvwL3YK5f9jFlZNbyVOphfkW1TDkCHpKc19Jbkf0TuhXFhWogzQ9JVMD0VH6GAFo952CsJVMEU5nIlsm4rnNZq6FxrJpeNn7HK6XuN24pvwmyHz+EI+m82EwG99XjevGO43Tq1/94dz6K884B4Q7Rze4bPtogGMifbWuum6SLNyN9H7hdL6EiMKaviGQddmeQ42TIKx/2Y8MYmr0W7nbJb3id+/rJEd4z+smfPAvzZ/5gPNtFFXuerfAX2913FG47WXQAY2wjultxXBJeXAed1ER3HnCN0zEICVScZMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO1XgdLChGhcmXQYgQRlktGItGh1h3zZzS9U0EV0V6A=;
 b=BJjf1ginelt/sZwoIk+7Zsqia6FGiD5LZevghgnw250YI2Fm5vrk10Bpl6O5xbNEdvASgUayEZESfibJgLakVjPvBOJH5PE3WfXyd1h3Neq9S4rtCzd3kIKXuBBORUODy/KNRfAsRnm9qqRUGJr+HnIbJKdedEpFCBHuJzfC0Vz2Q2ZlSPHad8s587KEvuk+k0Ff6kOBeixu89LNsin9tCqEJO9H6LJIpr85uFX9tCBrvnsLiJqWHr6LQn+Bywktm9oFhIAwIKCimycxr+cUdrFyb/pAS9bnPtq/dbA0+xgtUSisBpPWUtIPPrqSlvF4bj2Hp+9U/tfzqilBl3QxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO1XgdLChGhcmXQYgQRlktGItGh1h3zZzS9U0EV0V6A=;
 b=CCgUYQG3x1TLvpRK4Qd6fpfEhmjTtkt0x67TdG72bLORK4P4OEojCCUjPWt85mwJF6yWGJnzMoHtQlahueF5cFy7CRzz71pH2qUTGLvh4slRXe6Tsp0ZZPqtyNODEFr0hk51rgJTPGIvGJqhlI9qeIDZuk02r19D7AqvvXVtRlI=
Received: from BN9PR03CA0386.namprd03.prod.outlook.com (2603:10b6:408:f7::31)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 23:15:01 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::85) by BN9PR03CA0386.outlook.office365.com
 (2603:10b6:408:f7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 23:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:15:01 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:14:59 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 06/13] lib: test_hmm add ioctl to get zone device type
Date: Mon, 16 May 2022 18:14:25 -0500
Message-ID: <20220516231432.20200-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb9f560a-7a9a-4cb4-beff-08da3791e6f0
X-MS-TrafficTypeDiagnostic: DS7PR12MB5863:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB586374033C0AD9AEE5F0A043FDCF9@DS7PR12MB5863.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Hf0ginmzvh8sgNXZpekH1EM82s/mYPXEIyasvq4iMnXeH5Tmadkxm0uwFNUDkuIjawjrhZXyDCOik+pHoXB8N+kZLzzB/7i63/2h8WnNLTiuNEgmce7dX5eC1LSJBdggg5vytjzT47VGunPddeAUbP337uk16L80zFyeOOySW0N4Qm/c9qDJWZd3cSCr6dZ5Tm4TLHv6zvT6Q3x3e7DXNQ4pKTGq6Y+xVrP1SOgpUC0s5RGzZOOnEYB3jOIlF1u9IyMqKsLdG1DnZD/9MjkiPDebOX6fXpLd9hyXj2xORjTeprCiY32tGBGty6fsWlvvuejibof2xI0e9wadcYxQx7QFN59HUTquKwZcPwM3dsSSvf4TJ3Tpzg4KgFngVn/k1UnSwlW0hd8cByEj/qzgXa3vB1TgNXuG3mOKLYN5CW2Pbwykn9XDpWQgJLopKO9HYjSJNzttCiCTW14kwPa1Q+ODrZm0rjIjIM5ub685T66bQdF1FHVtqNdqYWu/LrN8+1/KVtYuMPOELtQmcX+URBzoefPYRKqrVLco/pBCtA0J6qBmd0AChZrxjcHmQMO2lpX8nVy8ftBQX4CTLMAIzXQvo3fLHYoixo3WwCVbc878yt0IXSEs6745usycGxt2wG8uEPf2eP1E97wdAvtgsKuprBWU7I3QmrlezQItSkMbCAPgpgtoLmGzyNtP/PoqSmj9dhe7VWKzBPRUxz0/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(70586007)(70206006)(81166007)(8676002)(36860700001)(82310400005)(26005)(54906003)(6916009)(40460700003)(316002)(2906002)(1076003)(36756003)(2616005)(16526019)(186003)(8936002)(356005)(7696005)(83380400001)(86362001)(6666004)(5660300002)(336012)(426003)(44832011)(7416002)(508600001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:15:01.0044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f560a-7a9a-4cb4-beff-08da3791e6f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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
 lib/test_hmm.c      | 23 +++++++++++++++++++++--
 lib/test_hmm_uapi.h |  8 ++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index cfe632047839..7a27584484ce 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -87,6 +87,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -1026,6 +1027,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
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
@@ -1076,6 +1086,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1260,14 +1273,20 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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

