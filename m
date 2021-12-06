Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7146A52A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FE2731C7;
	Mon,  6 Dec 2021 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7F66F9E0;
 Mon,  6 Dec 2021 18:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAk/+/2/KXBPlQ9AmDui7ZxcwVBxh6s4vr8Hf2M4UiEw4V5TgUpmTB0BU3mqUlpZRO957nx7lhPzfxFL+6cMBAMk7QXxGoYYhJPqNfDMfjRS2cXqgKbQkuqWjpG3rg0p8y+SvC9dkNiFfEwYexbK7xC+zORAEDfvIqfKebJqDIzUMe5buUvMAGN53j2bbR/SOccnjmabh16vAwae1oSbRbRDSk+QpAGRI4m96pvhiUlheIMgcw5dNyqHwRdBO7Sa0T64/4WPePGfhLUeUU5zypDNtuU4Yi7klJOOxDh7sKLGAcpQlmb6BXF35sxlH3E/gLr2ePJsYcGWPdj7ZhEDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwyfkvrqkcGGIiwy92gf4v9B4DW8sLVxpiKKrb85YDc=;
 b=YpEltr/FWgvqSKjs1zg+PQEwmTuE1R222ovQhIqRfGL8LZoxb838BOhI49EZGDFWQxzEcgsc2G06PCg19/iEmD+2VbEnWvkXDOUCR8zsGetWiEtMVPdsz8avoMNcoSVIQLAr1NlgTESVGrQrRJCUjzboSOZOojcWBA8MCPIpM7+99Q3JQOvzKS/LhzEfyQnAFFbWZOvlTyJ/vIHsgeQG/i3x19BtOJ70V2NfeZDMZtogRsMFDj64l8hWak70dxV4gBXF0jxq8W7GMe+dq6Wy1My2YDwJp0nL7a/S621Dib1nM8grFbeelPnV7yd5BS9s895u1qfkTUvrO0WAcgr0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwyfkvrqkcGGIiwy92gf4v9B4DW8sLVxpiKKrb85YDc=;
 b=jjair4iq+xqimsJi+ne1CiiUFKuXLiBSPYSqisXgZa5GiiLsTkxJ9c89sFnIdTvcs1fT3XBn1nCQVJohw+jnPA3F6GT4za1xvLI3eEzQj03AUhCdshmDXDdVlk3PEo9dUZRScR/sBNKxfjfHWpNC/34PczooU6XkxkhHX3LD2Pg=
Received: from DM5PR15CA0061.namprd15.prod.outlook.com (2603:10b6:3:ae::23) by
 CH0PR12MB5076.namprd12.prod.outlook.com (2603:10b6:610:e3::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 18:53:06 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::5e) by DM5PR15CA0061.outlook.office365.com
 (2603:10b6:3:ae::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:04 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 06/11] lib: test_hmm add ioctl to get zone device type
Date: Mon, 6 Dec 2021 12:52:46 -0600
Message-ID: <20211206185251.20646-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba4e268-3fa1-4087-7b8b-08d9b8e9a39c
X-MS-TrafficTypeDiagnostic: CH0PR12MB5076:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB507633576C1AEE99C71A0594FD6D9@CH0PR12MB5076.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CY5iGVw28/PsCXxY0G0MGxqzbzxSbJTuSEVGuXygnR9fxwHxxQ6ejkgw0MZxX5M/iBXSJp/D3ob2U/2xHO7mQwlPPIDgIFLWdfCczuh1NBXWAvzg1B204EUxSgf4ast1YDtpcQ7zzg1KHiDXC+SJ45iOWCSeSz+bfwyBOvoE5CKSP+S3FkmsAmqLehDkjV+vO1BUSFi4yoMAxY4x4KdeAgTst0I0Ql+0YfJWFus3g823z1wBz1k8IE5kL1Zz14Y4gwYyg0M0mEgroXGO+k2erV9l9KnLyBFONwxLmVMC63sV6LOkFEqnuxsT0UAVUNhPYJ+IoUHMOpOXBT9zxRaq87OL/anFRYCMcHhIiwagloNG5B4kolYs5TlbqfrqUnTwEctDEkltbAkpJpnVI2W354p3qRDFRDVmUwFGRa4tFR1+1y4dfcmyWxG8navLzHUAQaJDUTMPEWKdZKKtu8u59wWxjlxZndzYyRKkOovlRKKNG+9v6QCi5s78Lk9jsk0KXFGk2TcIHA7xycNJqow7s26rU9XuFZa0V9znQAKoObptz7RuqJB4mxInHj1oGfSJDD5jNsOuGu64KI2AMMBWGdG7dV3RJY+9NPSqmxh6H6pAT4+4UpZMr/ot1qaqFgQMn1R5Y4BBLEY9qmpCtwvB6GAZfpWaVpdR0E54voxlTDidgwoXzE4XSSO5oypyOiUIbFHCGXAcxY4eUW7/0Z91C+XxI44fH/Nrw4M69aH4L8Dj9ihMXbYT+KJyb2t9KcbhWZ0vXQutfo9lGNoNUrL4KJRNrQoJmR+s7E2BL+wn8ok=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(47076005)(426003)(4326008)(70586007)(2906002)(316002)(83380400001)(8676002)(186003)(2616005)(54906003)(16526019)(82310400004)(26005)(508600001)(70206006)(110136005)(356005)(6666004)(7696005)(86362001)(44832011)(8936002)(40460700001)(336012)(5660300002)(7416002)(36860700001)(1076003)(36756003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:06.0686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba4e268-3fa1-4087-7b8b-08d9b8e9a39c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5076
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

