Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA445122B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5216E7E5;
	Mon, 15 Nov 2021 19:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A160A6E7E5;
 Mon, 15 Nov 2021 19:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts9tB2/w2iiJRrMsFYrrmegmDERdpmnRYdfMv0kFWqGnQC5UJGOszA5iraes6c5eEDUJbi27DAwuc5IKdAU8U/AuHRWpCjf7aLDiIocw27GGRjJ3xkK5fGsOmYb/VJkRuZr/Vy3makwOLF+9dYNe9fTGHwi+eKaTUAVKVqrIjh5BXcFB+6GGdqQxF8TtxQVU+LCrg4MKTrEC/cjdfAA39kR8qd2goV+gCj6/s2nGOnoTvooGCFuHUMabZjuin9sOFz3U0ILsE3PWWBd0Gr4EKF29elOnt966rbXbUElbYsmBthLtUamHFH25f9drb/084Dc6HQ3S/aTrXMux6jrMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kupj+rCul7umAVCSx3q4nxa+D685B44EFa/SS+Wmxz8=;
 b=njW8onJWScK/9zy2fbLlGfrOvio138sm+YROZnFtVhMHGOgjkpBQdsK8d4jwK3gtAQa88rOTYSq7TfSV6tyhReGaUvX691a4KQ7+SAnpaVUn4H1EMa7OnCOD/x+mLyxSWFnGIs2ebfR0ZyFfntyRTC/fAeXDlvg7lqvYN5pi6iNX0n4vBJwiJzk1NyFhEqwvftXCwE658QtqN7+gGufrWMFJeQiDbhzBqO7QYxUD2aTyQhdyUv4VvUi46FCtFuJO8AL61kcP/voEGFSo4zVqte9lYBFm8wrNKZPLp3iQArAGDlBmgcvzCxal/yrL6pHjFuQK/1X16FSWxvnsnptdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kupj+rCul7umAVCSx3q4nxa+D685B44EFa/SS+Wmxz8=;
 b=0sk0zX3N6Hr0IakMb/6pMvda9c+0CbTXcAINLPEHC1swtJIi6uwm0jJqly7qlcSbfwlB+iABng1DHBWp9TgZ7XU3uU51vhErlOgUW21BhltZ1yd1BisTLgS3m9/AzA5UDi+b19TTGMGfQYj8gOyVILxlYSQK35wWee7ZdA2f6Ko=
Received: from MWHPR04CA0050.namprd04.prod.outlook.com (2603:10b6:300:6c::12)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 19:30:50 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::67) by MWHPR04CA0050.outlook.office365.com
 (2603:10b6:300:6c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:50 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:40 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 5/9] lib: test_hmm add ioctl to get zone device type
Date: Mon, 15 Nov 2021 13:30:22 -0600
Message-ID: <20211115193026.27568-6-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c70989d-0885-469b-3dfd-08d9a86e6e74
X-MS-TrafficTypeDiagnostic: CH2PR12MB4056:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4056FFA7D4C35E12B55D3956FD989@CH2PR12MB4056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZaBwR4zEXGSxYs2+pIMB4CJepKRCa2hckxXSUa7jx6sgRRsCWY+3H82/JjznfbOBvxCSx1atC5dlyqw/jBV0CVGIa9zkkiWLYR1rcQugVXCrAE/zxnyzQJTiRwl8Esl2BOEU+hNfDXmXjeOz/4Vr1DxlTquPdIaY6BzOE5qBxtA7mCml/K7T4X6gxMMk85XLLv8KT9NjX9dsIcNQtEaGrR3fTnMunq5fU4vRWz64C7E9i9Ay6s0wtjosRORrV7izjAopfVePJf+kpZYnfS6TnenBs69apJ4/rkVWdKBBw3mxsFJdkfZ6JOfb1xMG9mm1jWY5BX24jQYHU9QMEGcMnybennPitVKG/spMmfL7O0jtfk/JpVoO43/gHbDFuL89XERUuQunOHmhDWuFJejxGo5DEm8nx56dQo1E6lSb+dbg+qRd+ETyxZn53vkoWlkcpBUEcxC3cFeGermOKM+CaQszhyGIS91L32UcQel8VMubM/FSs0ZA/1Z4VMKu74GKq4qQzfHRY1099cZKdVQvAu8ALILrileyPIXCwJ7rH9csoJP4WHnf/XYRvBVhSJ4FLNybj6NUkacf5l2qknWBrjRzg1i+Q6tOaweX9VPD5i4Mpzw/s0T1Ah669vsLc5S09wUY58ZIPfkUAnKgBK/9SM6KZCiqTrIijjouOrnYfF9DhIdAEK8uIMinAgMZvruoKtWg2T08K9Plzx4h+jJluOJuY3tM+9NslikNVKdcOg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(36860700001)(7696005)(36756003)(110136005)(86362001)(336012)(4326008)(2616005)(426003)(8676002)(2906002)(5660300002)(16526019)(82310400003)(26005)(47076005)(6666004)(7416002)(316002)(356005)(1076003)(70206006)(54906003)(70586007)(8936002)(508600001)(83380400001)(81166007)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:50.0517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c70989d-0885-469b-3dfd-08d9a86e6e74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
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
 lib/test_hmm.c      | 15 ++++++++++++++-
 lib/test_hmm_uapi.h |  7 +++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c259842f6d44..2daaa7b3710b 100644
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
@@ -1074,7 +1085,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 	case HMM_DMIRROR_SNAPSHOT:
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
-
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f14dea5dcd06..c42e57a6a71e 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -26,6 +26,7 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
+	__u64		zone_device_type;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -35,6 +36,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -62,4 +64,9 @@ enum {
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

