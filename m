Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34B57EB65
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F1192F66;
	Sat, 23 Jul 2022 02:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C98492E43;
 Sat, 23 Jul 2022 02:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6j9Mg7mOKV1ygjiqMvoO5xiEuCAemtPnstmBlQ7rxyARhic3HELH7/Hb4E0Fp4BjnQxCLdEtH8JXPmXMGnXpqnwYs3JEvKiygShunF3/MfYjpACjDSFYs+sWpgI/Mkh6t9oLZnXMQe6GoXCpDUmebLa/m+ade4ZLR/ntrtGkNag8uOpzole62wyMVq+wtQaSGDJesajiBfvMcpGPKUKoNRGJFUn/o+4F/zffiaglDxd6RXtRABCWBbHoxCsizS3trIiao410JRY6kNLUkdvhKmkDwZPtBlsHvBjlebT1oFRdN5Y1Mk/ByfclzsGC3tsjjzYd9U3PS0HlokOvpkPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Ueh5ZIRe1c7jfu0thPGJb699aApUXrGyC8jbWoOYY=;
 b=DIeyQyVQxPPGmOrI8i4FfSCWfpjmCz9IIKJURfTlkDg//ofjYQjbHwBR5oEUw4jP1/7i8b0O/q/OqiAzs3UT4W2aYc+X7JjW7+Efr8C2S8ydN4rtSZjcCtt0hZRTaaw32jJgld9Hcey7F89B3+m078sHjTA4fNnIcFepN4YdyjjDvA7y7XyCvSxoNIVL09f0jF5oH5F8urr/YTulX+91i4/qXgVLD7g5W9EgY1PYwxJda1tunBNg62IUkNRDT9X0iohVJJHdo/6NBLfnzZFysWvKTDt6SDIJ3ZLIAXDfChtbK1NqOLPVR8h7441Ba6/fjY8XlBgEBi5uiiw6YjPjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6Ueh5ZIRe1c7jfu0thPGJb699aApUXrGyC8jbWoOYY=;
 b=ek64Fae0kd0L0UxyrrFdy4DB1ZLrpITmSp1EhC5MS94R8zPod/t197Dba1GBeOEXXXFa5399ob34IJ68kmPshHyV7Oom7b1V42sQKgq3JdDnUokZAFNlBoSAFAZY3U8wK1S9z9tkpyBjJExCUNBoEkpHYzAJrOpuJVPYtRfpqtckgXVz0ePB4QFSVY4I48TfSGuxcVRpTOJKAE5qmRIDc2WJ2/MnFyrWzlg3bBwVHPia5eR6J4BLZ65iiWy3xjTFS+OneDGvK3pL5IK0ydkkIzQXUDtRMSmv85Ba0bgNDjTOtCwE3cUlJnvH11JjzsCnOrjf6IQ7MLpVH92ZWQAACg==
Received: from BN9PR03CA0125.namprd03.prod.outlook.com (2603:10b6:408:fe::10)
 by DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sat, 23 Jul
 2022 02:04:21 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::ef) by BN9PR03CA0125.outlook.office365.com
 (2603:10b6:408:fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Sat, 23 Jul 2022 02:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:04:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:04:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:04:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:04:18 -0700
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
Subject: [PATCH v4 06/10] vfio/ap: Change saved_pfn to saved_iova
Date: Fri, 22 Jul 2022 19:02:52 -0700
Message-ID: <20220723020256.30081-7-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d6bc7c-f711-46d4-fa52-08da6c4fa86f
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0201:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCb0kdsVky5sIvtT0Cm/J+lz/4sjmUgErpLohUClDcF27afRHjHjdzc4JEKG+VFsys09C2aPAJUKZCeb9746R/A/Zj/l/Ok6W56imf8KZQS5mCwWolzwKvOj3zNxVC16kyB4aMWpaYzJn4PR8pjvz//ol+ZuOjNEaG6DFQXk8HlDSogN6xAIKalWdCbMrtcgfIqUCG1qaFzmEeH212xgtkP5qEoSkrBmts0MPGSG4RD9tba7H6N+kykphWNrWAVIZM3usrnjTrBI1ISbvvQOeDBvFDukZq/8//4kkZVXCCYMEfdymca8LrqLNM183Jbx5JsOVGx2nim90Sz5KYg9c+OzNNkPg8NEPArW3s83odKGGptE5PVsVUnqIP5tCG/xX7AjTWLzBZqIyOvZuPNaeHmNwCyt1Qb+D2k4xcyuq88Xor/oM9vFDY8HB2cKBzveEc5oAtr6AATL5b2BRxCpCIYueYjwiSM9oQfIN7lsJQn1iPKQePM7asxe4QAiLuBuPWRo3kan5ldLWCaJ1WmYyn8BpHnV3bUqLz0SrteB1eUzeKSTyNxL4aw6excodgUXzf1MCrvczsYhpqgnQiFc3st6OcytnorEURRC7sVWGSjIfZwRSxjD6xRiwNED/Gd4dgF0Cyp4DyZtrW9pL7CaqvzcC4wl+vl0Cbc4yvbjbwnob3v9sWy0vD3aZ8G7BK2/+WJeoq+mVBjzridRubFSLhlyfdLWewutEUtoqv9NIvwuKLYE6m3QfYdOqlYMNvG3dbBdvXQFyy1inmqf1dou+eXl8Lwrzy5BTZEj2WTmnuVMB6VVByyrQi1sC4d6M0J+iAoqTWUDtfwGJdPefmGwcFjlYJuFamcaAYBYoOecjJwIdmMgeo2Ae+nhBJ4IlthwHi785gQJsKF9P1jRGbLewA==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(36840700001)(40470700004)(426003)(70586007)(5660300002)(8936002)(7416002)(7406005)(70206006)(4326008)(82310400005)(40480700001)(2906002)(8676002)(83380400001)(36860700001)(86362001)(356005)(1076003)(81166007)(82740400003)(26005)(478600001)(316002)(54906003)(36756003)(40460700003)(2616005)(110136005)(41300700001)(6666004)(7696005)(186003)(336012)(47076005)(921005)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:04:20.8598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d6bc7c-f711-46d4-fa52-08da6c4fa86f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0201
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

The vfio_ap_ops code maintains both nib address and its PFN, which
is redundant, merely because vfio_pin/unpin_pages API wanted pfn.
Since vfio_pin/unpin_pages() now accept "iova", change "saved_pfn"
to "saved_iova" and remove pfn in the vfio_ap_validate_nib().

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/crypto/vfio_ap_ops.c     | 42 +++++++++++----------------
 drivers/s390/crypto/vfio_ap_private.h |  4 +--
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 70f484668ca0..d7c38c82f694 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -112,7 +112,7 @@ static void vfio_ap_wait_for_irqclear(int apqn)
  *
  * Unregisters the ISC in the GIB when the saved ISC not invalid.
  * Unpins the guest's page holding the NIB when it exists.
- * Resets the saved_pfn and saved_isc to invalid values.
+ * Resets the saved_iova and saved_isc to invalid values.
  */
 static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
 {
@@ -123,9 +123,9 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
 		kvm_s390_gisc_unregister(q->matrix_mdev->kvm, q->saved_isc);
 		q->saved_isc = VFIO_AP_ISC_INVALID;
 	}
-	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
-		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
-		q->saved_pfn = 0;
+	if (q->saved_iova && !WARN_ON(!q->matrix_mdev)) {
+		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_iova, 1);
+		q->saved_iova = 0;
 	}
 }
 
@@ -189,27 +189,19 @@ static struct ap_queue_status vfio_ap_irq_disable(struct vfio_ap_queue *q)
  *
  * @vcpu: the object representing the vcpu executing the PQAP(AQIC) instruction.
  * @nib: the location for storing the nib address.
- * @g_pfn: the location for storing the page frame number of the page containing
- *	   the nib.
  *
  * When the PQAP(AQIC) instruction is executed, general register 2 contains the
  * address of the notification indicator byte (nib) used for IRQ notification.
- * This function parses the nib from gr2 and calculates the page frame
- * number for the guest of the page containing the nib. The values are
- * stored in @nib and @g_pfn respectively.
- *
- * The g_pfn of the nib is then validated to ensure the nib address is valid.
+ * This function parses and validates the nib from gr2.
  *
  * Return: returns zero if the nib address is a valid; otherwise, returns
  *	   -EINVAL.
  */
-static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, unsigned long *nib,
-				unsigned long *g_pfn)
+static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
 {
 	*nib = vcpu->run->s.regs.gprs[2];
-	*g_pfn = *nib >> PAGE_SHIFT;
 
-	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *g_pfn)))
+	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
 		return -EINVAL;
 
 	return 0;
@@ -239,34 +231,34 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 						 int isc,
 						 struct kvm_vcpu *vcpu)
 {
-	unsigned long nib;
 	struct ap_qirq_ctrl aqic_gisa = {};
 	struct ap_queue_status status = {};
 	struct kvm_s390_gisa *gisa;
 	int nisc;
 	struct kvm *kvm;
-	unsigned long g_pfn, h_pfn;
+	unsigned long h_pfn;
 	phys_addr_t h_nib;
+	dma_addr_t nib;
 	int ret;
 
 	/* Verify that the notification indicator byte address is valid */
-	if (vfio_ap_validate_nib(vcpu, &nib, &g_pfn)) {
-		VFIO_AP_DBF_WARN("%s: invalid NIB address: nib=%#lx, g_pfn=%#lx, apqn=%#04x\n",
-				 __func__, nib, g_pfn, q->apqn);
+	if (vfio_ap_validate_nib(vcpu, &nib)) {
+		VFIO_AP_DBF_WARN("%s: invalid NIB address: nib=%pad, apqn=%#04x\n",
+				 __func__, &nib, q->apqn);
 
 		status.response_code = AP_RESPONSE_INVALID_ADDRESS;
 		return status;
 	}
 
-	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
+	ret = vfio_pin_pages(&q->matrix_mdev->vdev, nib, 1,
 			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
 	switch (ret) {
 	case 1:
 		break;
 	default:
 		VFIO_AP_DBF_WARN("%s: vfio_pin_pages failed: rc=%d,"
-				 "nib=%#lx, g_pfn=%#lx, apqn=%#04x\n",
-				 __func__, ret, nib, g_pfn, q->apqn);
+				 "nib=%pad, apqn=%#04x\n",
+				 __func__, ret, &nib, q->apqn);
 
 		status.response_code = AP_RESPONSE_INVALID_ADDRESS;
 		return status;
@@ -296,12 +288,12 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
 	case AP_RESPONSE_NORMAL:
 		/* See if we did clear older IRQ configuration */
 		vfio_ap_free_aqic_resources(q);
-		q->saved_pfn = g_pfn;
+		q->saved_iova = nib;
 		q->saved_isc = isc;
 		break;
 	case AP_RESPONSE_OTHERWISE_CHANGED:
 		/* We could not modify IRQ setings: clear new configuration */
-		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1);
+		vfio_unpin_pages(&q->matrix_mdev->vdev, nib, 1);
 		kvm_s390_gisc_unregister(kvm, isc);
 		break;
 	default:
diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
index abb59d59f81b..d912487175d3 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -99,13 +99,13 @@ struct ap_matrix_mdev {
  * struct vfio_ap_queue - contains the data associated with a queue bound to the
  *			  vfio_ap device driver
  * @matrix_mdev: the matrix mediated device
- * @saved_pfn: the guest PFN pinned for the guest
+ * @saved_iova: the notification indicator byte (nib) address
  * @apqn: the APQN of the AP queue device
  * @saved_isc: the guest ISC registered with the GIB interface
  */
 struct vfio_ap_queue {
 	struct ap_matrix_mdev *matrix_mdev;
-	unsigned long saved_pfn;
+	dma_addr_t saved_iova;
 	int	apqn;
 #define VFIO_AP_ISC_INVALID 0xff
 	unsigned char saved_isc;
-- 
2.17.1

