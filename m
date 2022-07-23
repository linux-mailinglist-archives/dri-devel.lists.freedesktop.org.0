Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271FF57EB44
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F129E92DFA;
	Sat, 23 Jul 2022 02:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCD592CCD;
 Sat, 23 Jul 2022 02:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC0g7TsCj+jppLKRRWzHD2raGr3tRQ/F0VJZHoD2OlkFBS94WzkNvrtl3JGCVF2Gv/ykGFZzDM4Vs0hJLnv5K6H5n2yyTu0hsorq1ohnJNbQwAtL0f+EuwV2F73OImiHL7JPzgej5mTE4xTdKOKGjgUs1jvEeJrfpK1JmF/XXbE0OyoWN1TZkOgRJYDF5m3O3Vxe6OOkmd9cVhSIFHoMNZn23iyTYIIvlrjbMtmKgcmJpSkqy1zZcpHDjPn6NPyC8X/ytXgngAj7YgEYVq4ia+7wN+/ZfiLrTF6GmuoMSrSqqNUxq5KNC74Fxzp/JP5n+5QHqhjY38DN1PTpUGwtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=penYKVGxjl1jd5IFx4LfrtdCcwzEeylJscCPqynjoNU=;
 b=abFG6UjB/+OUGHipUep/0n5hMWQdJrAigqCE+9xMXuT0h8mskhyEBYQ/vnZ83Rjus/923lGjxjNnNGf4v1zjHzJ08+M2Bch5SydrHPe5+IOLiAZrGZmGwA2zZs6Gt1ilsQklmeFxA7tcjzj+UOugvmv4OLkyJve3i9NPGc+0CWKWXDwffFScr5znR3veXURLgM3dmwQxOV+uI5Z2EY3R5VXYYqFYyKc3Ew8nCG5IUVNrPeH/OYGKWlHu2+RB2CKQVT4FhPfIij5FlFilkZut9aupdQe+F94ndX5ubFBc3qVK3aGN7O3ur0sTIWcWTd+U/pLFRaZKnSOBGNKJykeROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=penYKVGxjl1jd5IFx4LfrtdCcwzEeylJscCPqynjoNU=;
 b=VhFQl85CTUj3ZVSsE0tq5tsU2x49B41EQUHu/LJiipI2pUyA55O2/P9XEzzBms/Tl6zYrXvrYfuqnj4K6BT2qoCqSofQaa3/UvE6oZQbIIdMKxGHEeIJ40P+vQ+b6szUtdXqi6fW245EAw+mNs7cJyNFZcH3h4HcwrD96X1JHugk56a4eSpESZVP1H/IfWxGPUfY9t89OuvmJ7y858qFWDfM9DHoPLF87FBgz8zhTd2qPJyd6LGWu3MnrDF85o7gnzSsaKtusSO+sskimRk6Rt7MrobQVC//s+pDOh07eM8MNpV38diBRVraCf3dzl/THhii30O+aZfxlgT5d9E12w==
Received: from BN8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:ac::43)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Sat, 23 Jul
 2022 02:04:16 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::35) by BN8PR07CA0030.outlook.office365.com
 (2603:10b6:408:ac::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:14 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:12 -0700
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
Subject: [PATCH v4 03/10] vfio/ap: Pass in physical address of ind to ap_aqic()
Date: Fri, 22 Jul 2022 19:02:49 -0700
Message-ID: <20220723020256.30081-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53928bd3-d69e-4944-809f-08da6c4fa529
X-MS-TrafficTypeDiagnostic: PH7PR12MB6786:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkaBhx0YduWx2+qWH3bL1xwDSLzlRAeLKIGavvpjJWoW90V0zieCrJh3EgqpaM+18BmPhuAfJpIAvV8oFdLXqLbSTp/dd52oDaMTLfaplFTV6zsLy3rQKAsgLPmZUqwciDAhf7J6abSTTvKmUHM4DOUy6nlSrAMxCBtYMyqLEapqj6AO/lMJQDO8zQTKDS+UamXy/hyH1R6vdfI/m/55a2L4auqzSNrHgZCmWTTaMMu22ZpUDdKz9fW9L/q7dEcpXA0VugFw2uAAIPNVNeMM+ngXtYmpsTZMd5eJo2f+qAeQ5hCK6DHxKVrfz43QleVmi+mYMtbToIepkZCqVfNVXvvdNajDT6Pdu54sHDIWTLVyEzl+7axCct59dK3vTEA1pj8ej0lakcd8zGFv2gxj+R9c+irkqxwPXWhsy53wZdBGk4/jjYSS2NJOj1s2Tj6PAidgP3/uWGcvfFyFkjo2BB1/xfVjUSI3DleYz3uOBp6xtpUUzxxkmaHoVysyNKEu1Xr765UcClGOxvpKU+Hnf5Xb5NklyqU7niQpd+lM2OxLCqULvgbZjpzfXNmE/hewPyr2v/TaaRN4prd8MhNcBRken+fZkWZp3/RnqTZwfHxQSGYqJ1vWIJdS+xD3wZMfjvH/0w9v74yWeRSuNC2eM+2IZb9UKxXfeq0SndDbKlMN4+C1stYZZL2ZZqg6X3dNmqZZruTdRg4Xs64ll5MuFl3H8eufpkWzWr3d2sBAXqxGkXie4jEKxF1SNVg5F52sLsTxr6UsWaXu4hgEJFKiKcHoTmng5zDjc0cbqJwGygKhKoX1SbcV2CvjQbi9eBP5pZgpBaWEdM8E5h6K+I+kAmZe3iWtHx2nTdn1AtCScxShf0PZ8/k8FUO0hQYfKgeVrr2R30fDyGuNKZrWc5C3cg==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(40470700004)(36840700001)(40480700001)(316002)(36860700001)(356005)(81166007)(86362001)(921005)(70206006)(82740400003)(70586007)(7406005)(4326008)(8676002)(82310400005)(7416002)(478600001)(40460700003)(5660300002)(54906003)(110136005)(8936002)(2616005)(1076003)(186003)(83380400001)(6666004)(47076005)(426003)(336012)(41300700001)(26005)(7696005)(36756003)(2906002)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:15.3804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53928bd3-d69e-4944-809f-08da6c4fa529
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
index bb1a1677c5c2..5781059d3ed2 100644
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

