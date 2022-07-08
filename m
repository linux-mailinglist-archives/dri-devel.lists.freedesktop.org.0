Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559CF56C1A1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7910EED3;
	Fri,  8 Jul 2022 22:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6C10EEDA;
 Fri,  8 Jul 2022 22:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhh4r9weg9b8HGrm3+i0zAyVHFmHqPDEDGPYKkwXOa3hfH7GIVMfTedDSYJJioBkvYhPxfZfquG0ILUzyqtb6vsVXCaBJ6TofzxzJB29aloajez3rDOCaUHgB2I+0BaMqLZScGJAE36Zh4SENl1C61VY9RE/BAmuhO8Rp0NUL+ccuKpaA+g24r9SH28gmW4+nr0UaseC7+uQ35aDqLPukdVKXGEvFLKUIEdcUxx2Y8AzYyR9cGVBeC7q29enHv1UbjgP/bmDm84ABSRRWm3qm8eruGFtsZzIE86ijbdGWzeEt8YpPFh51SKtyLYsmo6aANUs6KL+jaVYlRVgcMVfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enOyPnZ9fYhAr282GGKjIU3HUlbzSSr36trVXmy4pkg=;
 b=nRlYvrvP4jwgChRSXa21tDvOjrHMKd3TAe+fWxw4FWZt79oE5n+a7Q6B4xfdYmDXy3y/9Fl6Elph1vpvMDWI4jxKuCAFGEnGd9OTi5Z+FRGwNs+SPYawTQTd/9XLUKCpKMqezUxpSVseQlvLNzY+Ums5EfJqczAQmd0lRF+9z/Szs8Up+y5tRbXWP8Qx2okdYGUnQIq9v/KFiLemVYkP2dolqSf6wvmp+lKbsULTqUJWUNq8IUUexONIU7Jqz9TCFlVWYYYZa7JmC2rQaEzmwkmpxU0fs/tQe1op+1TC9ruMIogNWd9iVzEoFmGQhXpJ1rFgVAj9Qm1Gsv9QPBaxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enOyPnZ9fYhAr282GGKjIU3HUlbzSSr36trVXmy4pkg=;
 b=GLoojFHIKLW6pq11jvWyi6IqMz9GBxxT/0G9O0Px1sXIJicp4G5tOFYdpRshFUbJkZyw0rRwiXTlECjD8bHqWWHgdkKVC3VpOLXW1B8Vag8FKR2630pvAimVLIzaOB+Ck0HrWCGGvD5It1EMOZveBJxjLo9ErNQP6N9U7c06rK6ELeYtu9AHRgVZooPW+KmNKFScenAx8WCxRcz93egmxsidzleTMZ55Iv50qjN8C2khzR8yxDedT0yH4Swnu46y3kDjQeVEurcHrrvY9oQfxbtZ+eHp4yZUF6irHaJ1YOY9PytiXLbFDC0pZyGQ3AIt0CQ3ZmIeTwX8zfje+Y1xQg==
Received: from BN0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:408:e7::24)
 by DM6PR12MB3049.namprd12.prod.outlook.com (2603:10b6:5:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 22:44:38 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::cd) by BN0PR03CA0049.outlook.office365.com
 (2603:10b6:408:e7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:37 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:36 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:36 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:34 -0700
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
Subject: [PATCH v3 03/10] vfio/ap: Pass in physical address of ind to ap_aqic()
Date: Fri, 8 Jul 2022 15:44:21 -0700
Message-ID: <20220708224427.1245-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287c0baa-72f9-4ea5-a819-08da61337025
X-MS-TrafficTypeDiagnostic: DM6PR12MB3049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pAKfQOdT9gTFDXJRRNnNesQ+rqCVKHWRPz03KQp0ceXbe2qSSkzFOnp3rf5VkuQTyKX6EIxINK7AMDpfnbijX77RNEZ9ap/+Tz3dAeOVoGNb2ZMqPJNhTd3iVbgseyPa1k0WzzORt7EIM0mIgik6fA+13YZ4DM5CtUPW8pfJc/Ev/D1YscwqQj7eM7q2No2V8cnAEq+O+svLw8+gpd3tfXYek/34sjZxPeXy7Og0WrlErUc5eDHU9ZDc88ce11jbggIqEZbUBZKJNHviBpk0GmrbVg65NXwr8j0NNxFQ/OO8uzmPzVIpjVIW1M0tr/0DBiHc+15h31pY7HSaOzX2hGltON6d4PLltbuUN4P3I7XAheHHs1msk/rAWvWf3MTQrEXBjxfeSP/DLmRjy26PF/7CMw+KpuSAsX45lqDbaFTQXt4jE4LtdydixuQHyM/PmxXFWs06OxYMTGH94Dskxp2X7UJWR+/BwEpeC5vgBrfPBmeJzjZsxEBpyd4D2GMJbgZsZxCxaVy028qv3dJU4qQV5rJ4YuryRUvuefOWpZVRdxXiTtYefkjQvg+XlKBwNAZ47TTYoPkQ1pJxicMNkFswNkxuy39GPBBQupfWQ/7EC5uOcEbgEn4oNQ5UGIsFqytTAN58oU4onWcS2w8Qz5Tk2AqYz8jJ+nGjQH9L8DQGdPA5JrUIztGR8ZcPg8VlppoYNAw4COSDYLfBKv2k++UG6mW3sEUFqvjPqf5hn/q2rcnML4rS2uRdkuBSzmg1R46NcJlvihNTa6YNUudd1lhuOfWRLGfCSQJHxgORRY68EW+HwjmGlk2XSSMStUCWu8Mq5ykZve60/8QxDLOGv3HpCIoMc3rg8Nful8k1a9ZxKonQOaoeikAgUzJz/hRpDQeiydZwyxPJmYIvYOCym5Qoa5hvIiOq3CD2vgD2saQ=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(40470700004)(7406005)(316002)(70586007)(70206006)(83380400001)(110136005)(7416002)(26005)(8936002)(478600001)(54906003)(5660300002)(8676002)(36860700001)(40460700003)(36756003)(81166007)(336012)(356005)(82310400005)(4326008)(921005)(426003)(47076005)(86362001)(6666004)(7696005)(82740400003)(1076003)(186003)(41300700001)(2616005)(40480700001)(2906002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:37.7214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287c0baa-72f9-4ea5-a819-08da61337025
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
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

