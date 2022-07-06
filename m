Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8002567E60
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D6A10F94B;
	Wed,  6 Jul 2022 06:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B515710F944;
 Wed,  6 Jul 2022 06:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4WaY+e8DSV0hbHsxLFyoN9ggnz5kYfQrdznW6Q7BuvrKK7t0OJMuvaTJx1PAX1tyuRF/wLI2UP2U5rLgGpG+yRN+b3ufO68PnqqstvZi6WbXCMJ2H6pw1pBNpO+VJUUquCEJ6fKnlSmuouZ3yMfkAl09fM4o+Uo77wQDhdeBst3H0MB2iZqHxV5DG7ugryW6IzrBrcKoa68EuZPYiypD162kekfmvD/xeXpNIk2B64KzRxMOw/U1evWNz3d730asCdz3bMYdxAv9lGHojJTYvZykXNDkgcJMKJLxUK3/4t6yCVNPBBuW1j0RwBMuyWFOAlvRoGJqKbLazBvb+XLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4kdBZcskGq8MyJwaD3o+aVa1TdDmCibteJCPIZVVrg=;
 b=mQsAGv8u9cSyAp0NS7hwDZcRM3goWP+rJ5utgaoOQenXCv5QS/ghgicEgG1AhD931VKGdwkSJNwsBro0H2cmqvsHlslu/+n8KZPg5ILo5pkp66qpozGQ0ax0TsjBHb5UWNwLQNn5UeMOS8y2wybObetIkWBilpS76Bp+HKGbAkCim5gVuDzt0OD/OornRJb+Lt52KQj3p4fHVN9R7FY0Lj9f00ab+LVdV6WL5i54/JQdBcxbGfrqeJiF8I0h+nUEFa25PCPHn+w4UM8Kixs5cmME9sSVRruIYnWbOFAfc8ajHHSEvnpXOiKjD62W1dJ39n6qhQiNK40ifsUq3oNcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4kdBZcskGq8MyJwaD3o+aVa1TdDmCibteJCPIZVVrg=;
 b=QoUMzUKquSwWHxSE5PMWX7w5HPcfZMVhf95m+A/RY7HuleRvKRgRnhafIHnNSOk3axZdFgtkzsNNlDCF0auLnmFiFruy2TNIz5/1jjSXeo37fM3Nr+K9AuPUwcilbtUhcEVHtlfwADhCRUHH/yKvLmeXPh+ehnX/Mf4Mn2PgEUSO36f8UIdipl7Rew4JwpxPLWLQIdzIJ/OFU3Zc+IDbaNwlH/cMStsPP9cFPxV+3zt0IqVxHpwBJSEek7LUYqM/cQZrHF7YooDR+xkOSW6VyL4PLCuWPuIeKGkWtPvViTXu8CyI7563J3I6qyV5bYAOrpNXL/su7d9SGg6+stF1MA==
Received: from MWHPR15CA0066.namprd15.prod.outlook.com (2603:10b6:301:4c::28)
 by BN6PR1201MB0084.namprd12.prod.outlook.com (2603:10b6:405:57::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 06:28:16 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::1c) by MWHPR15CA0066.outlook.office365.com
 (2603:10b6:301:4c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.22 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:14 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
 <gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
 <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>, <vneethv@linux.ibm.com>,
 <oberpar@linux.ibm.com>, <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
 <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <jgg@nvidia.com>, <kevin.tian@intel.com>, <hch@infradead.org>
Subject: [RFT][PATCH v2 2/9] vfio/ap: Pass in physical address of ind to
 ap_aqic()
Date: Tue, 5 Jul 2022 23:27:52 -0700
Message-ID: <20220706062759.24946-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce446cac-d94d-49f6-fa14-08da5f18b599
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0084:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +frek4z7uwMs1CJwII+I97Hn5RpjvCHsZXD5RmLQlmsT3f10aE7fSBt2VHoETbhn22ZK6OgV6ekZTrZt8Kj80h5TWkAUcgqXU3ZsRL9LzUz8FN0GKIjxP9tHBSGxfatSRLf6RSGYNUqXMi07+Gd83OuzFvkF93vvbxyOcv2XObL485cBt7WA+7ZThdijW36CLXXz7uHJ0DBdU6TBwdEBFqUNTGRiMn+2s3ETPgd7H4lobHSGYgX5GSMw5vMSHSelpg7sg5NbW5F39WV4pr4hh8/ZoiW701SB0q5Nh45YTqFQzQX/6PsvAUreFvT7iTP5Cx3MB0jAQ0DB8zEVFaRT4Xmrs5KpuBGW2HRCJPIPic8CwvI1FokuZ/26HTggRfoS9qvLOdtMPSHnbtvCfeiAHspMtdR7/R74mDM4Oalb0S4yXuNapqswNCys0CgaEGH9fbhaJgg0lRKUnGY9mFcfoJANdVg2V36jvUyB2rmzybNG0uZaOgYg7smfdLdO5MggNVK1L+P2ojLvNo2XpsgMTZDe3wYhByQGhIFeGJ2mhQCw5w5o3Szmj/chIWNQfhCZQfDHa9Uu+RUGX5CWfah2vfUSVaGBDshCKY2PBhwOpY4d4f9eHbpoyexIhLHIw6CpLrNtTmrE2Q47ue2cwu8nh6es5fWaPs+KG8KGBhjE+CSAqKmo9PK2IqwMUutSxHJrTS298p0ROpfZ+L6YuvJP283UZJSIABiI0m+fZJZmCg2N/RigyduNNGpwd0E4jl5yebgHqCu4uABl9WnDoiccFHB8jjsa+T19h/gEKmw01jeDEbOogSzPal0WgR73ctT560/UrNyRX7D/cVkOZBtteThszs8tYVMR+8xg3q6Vg99G4qXI2N8zOHeJfI9TvbEIS5NujK+kM8rMlj2PPK5MCq3dAhWWO2IX5h3VswdzX+E=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(54906003)(336012)(186003)(40480700001)(70206006)(70586007)(110136005)(8676002)(426003)(4326008)(1076003)(47076005)(26005)(83380400001)(7696005)(36756003)(2616005)(40460700003)(478600001)(86362001)(36860700001)(82310400005)(41300700001)(6666004)(7406005)(2906002)(7416002)(316002)(8936002)(81166007)(82740400003)(356005)(921005)(5660300002)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:15.5873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce446cac-d94d-49f6-fa14-08da5f18b599
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0084
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ap_aqic() is called by vfio_ap_irq_enable() where it passes in a
virt value that's casted from a physical address "h_nib". Inside the
ap_aqic(), it does virt_to_phys() again.

Since ap_aqic() needs a physical address, let's just pass in a pa of
ind directly. So change the "ind" to "pa_ind".

Reviewed-by: Harald Freudenberger <freude@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 arch/s390/include/asm/ap.h        | 6 +++---
 drivers/s390/crypto/ap_queue.c    | 2 +-
 drivers/s390/crypto/vfio_ap_ops.c | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/s390/include/asm/ap.h b/arch/s390/include/asm/ap.h
index b515cfa62bd9..f508f5025e38 100644
--- a/arch/s390/include/asm/ap.h
+++ b/arch/s390/include/asm/ap.h
@@ -227,13 +227,13 @@ struct ap_qirq_ctrl {
  * ap_aqic(): Control interruption for a specific AP.
  * @qid: The AP queue number
  * @qirqctrl: struct ap_qirq_ctrl (64 bit value)
- * @ind: The notification indicator byte
+ * @pa_ind: Physical address of the notification indicator byte
  *
  * Returns AP queue status.
  */
 static inline struct ap_queue_status ap_aqic(ap_qid_t qid,
 					     struct ap_qirq_ctrl qirqctrl,
-					     void *ind)
+					     phys_addr_t pa_ind)
 {
 	unsigned long reg0 = qid | (3UL << 24);  /* fc 3UL is AQIC */
 	union {
@@ -241,7 +241,7 @@ static inline struct ap_queue_status ap_aqic(ap_qid_t qid,
 		struct ap_qirq_ctrl qirqctrl;
 		struct ap_queue_status status;
 	} reg1;
-	unsigned long reg2 = virt_to_phys(ind);
+	unsigned long reg2 = pa_ind;
 
 	reg1.qirqctrl = qirqctrl;
 
diff --git a/drivers/s390/crypto/ap_queue.c b/drivers/s390/crypto/ap_queue.c
index c48b0db824e3..a32457b4cbb8 100644
--- a/drivers/s390/crypto/ap_queue.c
+++ b/drivers/s390/crypto/ap_queue.c
@@ -34,7 +34,7 @@ static int ap_queue_enable_irq(struct ap_queue *aq, void *ind)
 
 	qirqctrl.ir = 1;
 	qirqctrl.isc = AP_ISC;
-	status = ap_aqic(aq->qid, qirqctrl, ind);
+	status = ap_aqic(aq->qid, qirqctrl, virt_to_phys(ind));
 	switch (status.response_code) {
 	case AP_RESPONSE_NORMAL:
 	case AP_RESPONSE_OTHERWISE_CHANGED:
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index a7d2a95796d3..bb869b28cebd 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -154,7 +154,7 @@ static struct ap_queue_status vfio_ap_irq_disable(struct vfio_ap_queue *q)
 	int retries = 5;
 
 	do {
-		status = ap_aqic(q->apqn, aqic_gisa, NULL);
+		status = ap_aqic(q->apqn, aqic_gisa, 0);
 		switch (status.response_code) {
 		case AP_RESPONSE_OTHERWISE_CHANGED:
 		case AP_RESPONSE_NORMAL:
@@ -245,7 +245,8 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	struct kvm_s390_gisa *gisa;
 	int nisc;
 	struct kvm *kvm;
-	unsigned long h_nib, g_pfn, h_pfn;
+	unsigned long g_pfn, h_pfn;
+	phys_addr_t h_nib;
 	int ret;
 
 	/* Verify that the notification indicator byte address is valid */
@@ -290,7 +291,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	aqic_gisa.ir = 1;
 	aqic_gisa.gisa = (uint64_t)gisa >> 4;
 
-	status = ap_aqic(q->apqn, aqic_gisa, (void *)h_nib);
+	status = ap_aqic(q->apqn, aqic_gisa, h_nib);
 	switch (status.response_code) {
 	case AP_RESPONSE_NORMAL:
 		/* See if we did clear older IRQ configuration */
-- 
2.17.1

