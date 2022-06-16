Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525254F196
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FFA11A910;
	Fri, 17 Jun 2022 07:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83A10EA8C;
 Thu, 16 Jun 2022 23:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWc9RgsXklkBAstmxV52BnXyx3FDGiC6pGIptvUnO7Wr+f2wM1iQALyD/+SrY5zReWq0ztsy8K7xFRBvzAv8PzWQ/1T7NWXFkgug3Qx4EJQZLR9pulh6DuBTfpLsQalerk/NXUt7jCRijJ0nbr633Ei+MXESVJqGi7NkaWI/GpNS6WOXHyKWtdL+stZYadi4d+zO6fT9pGdQvuBqd3OM4YtBDyEYNIi3vigEemoMkC3SkFkmG4oVLszNY7LacRKh2UDQ6fbTIH0rVeCledGkCyEiz002mBtUkv9Oz4uLWT5d2x9bKSKoA6ub3a0YkvISmrD5JbmhJHDt4wEMmuDvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT5yWGb0jGh6LhsHb59B+ZhEM/xx72d1xm2Lhhf0t0g=;
 b=Tb8Z1vjFVS6KHxp7oTvmldO4NvV7l0jEc2M8BB4K6/saOIxCVPYm3VZz2OIrF1/Yt0UJfOokGEZvM5QvMj+SUEVsuOkf5D7hEvRI5AFr4exGC/aJOGj9dZ8DfArFOjbSoABWAt3GvHBXsll8YJQJd42euYnNIYx6egjp8WVMVg/Jdqs7h35aoGwE29yL/2YrpUi/TEAv7lDWSjh9EAdVloMi28oEaaKu5PlqOLunCpz0bcsJi3/wg0d1XGoxQjOkfclf9SxzDqG6KmiDuKvHpQp8Xtn0VKN7qyQ0HvL6l8+Qye2zFH4ix0fn1nG9HrJ1LCbwhWCjRoCAoyi2jAY8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT5yWGb0jGh6LhsHb59B+ZhEM/xx72d1xm2Lhhf0t0g=;
 b=srkUKKk7r5o736rLRFdKnMdRmM5MuT2CmoCTmuP6ZvyKsS55Bi+ATbbOaRPMl7hYS1u3fQ9WzSUmCW9beMHomu/zr+KdUuNBhzhrPPPm5Er6MoK3MtpG0XVgF/l/PfHTWxjaQbocx+/4WAh2i2ySRnuHtYteT+XdDseJSfah7hhYN3+Hh2VMBMUENgrSLmtVLL7ijrJAZi61xxUzKB2X+QIQ21oJIPT0B43PjsL5YUg1PnjXIcRyyYF+xRaiTNE2eR4H77gDLy22VhGjhK7L5XJtCdt/8Tr6ikktVA357tnNkN0t8Xv3jnmIH1kPkU1mBTDiRi5koWZt95mEWObPBw==
Received: from BN6PR22CA0034.namprd22.prod.outlook.com (2603:10b6:404:37::20)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 23:53:17 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::de) by BN6PR22CA0034.outlook.office365.com
 (2603:10b6:404:37::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Thu, 16 Jun 2022 23:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 23:53:17 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 16 Jun 2022 23:53:16 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 16:53:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 16 Jun 2022 16:53:13 -0700
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
 <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [RFT][PATCH v1 1/6] vfio/ap: Pass in physical address of ind to
 ap_aqic()
Date: Thu, 16 Jun 2022 16:52:07 -0700
Message-ID: <20220616235212.15185-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616235212.15185-1-nicolinc@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09aaa3d3-c271-4b3f-3adb-08da4ff3627c
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB6237B579E2F79575F3F721DEABAC9@DS7PR12MB6237.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WH510TbybdS99Mc9Iw2z7JW3y0qTnjZK/h9lSsY+I1cEb8OLxdqL1GyzYNkSy1a78DErSs6MbMlPirf1SguyxThIwMrjXw1JLR2kEyWNQs+7TRzo4EYONgzBXUOma8cQaFzKL1hcWNVVZyv6PUe4AvDvqvASaHkueKGFfnjMQ2G+Nr3NgpPOIu11KkmqYleK61Czxkca6KKugPsLIMIj0VuJQm+488OX7kfoFaC2hjiErB7ai1LslGjMKfNDdhoPLQlAPlCGPKSYsV0v7OhrfY0WjNjunnFbZSwu+gJqpEtkrcAbODeWQTbJDHBNxZHHR/DaplOQzwjllpWne4BvOIPxSgWcyKbuknmeJsJ7GuNuidmtkS1q0MUmLdOo9JmSk03lGkV8ps1T8c+hJpL2ZBvz5xHsCj/aFq1sblFHqGSOiqkE5dj7EeSqiPHI/j5Dvsk5PdHeWbtU50Ns15DMSneNAPvso6fyRv+d+66lS3xdbfV9U0l2eDb5j1PDkSm3I9jk8//wShFm3/D1HEfyAzzIjH/hf/FWW6iK0Pmp4Rb6L6RwcXHRZ+kEIfEjG26rPs5hAOOQ9/vOKFj7iF4TNH0QzKoqFU+h2HCDtMtwEx9XcmF/h1KYkt7um0SD6O88PB79M68en695N/s4ptdma9Ixb+hFcpHWm2n3NiXqEMQHJOrv47m+Hkip+Hg4i5Mi3Da1NZiP68kCNNHQKqJxIt9zfE75GInLuVSOTSyACku2n/j4zQdPNxuk9PSX1yQOJy63gfDfLEtTERlKQfBBsQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(356005)(81166007)(1076003)(2616005)(186003)(36860700001)(110136005)(36756003)(83380400001)(316002)(336012)(47076005)(921005)(7406005)(7416002)(8676002)(8936002)(5660300002)(2906002)(6666004)(82310400005)(7696005)(4326008)(40460700003)(70206006)(54906003)(26005)(508600001)(86362001)(70586007)(426003)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 23:53:17.2583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09aaa3d3-c271-4b3f-3adb-08da4ff3627c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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

