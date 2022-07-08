Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E765B56C1AC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 00:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17610EEF3;
	Fri,  8 Jul 2022 22:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16D310EEE2;
 Fri,  8 Jul 2022 22:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa4zNZVb0HUZiBB1KMYtnmAS05d2qGNmytPNvODcTwR57E2gCCx28oIirkj2+4WeijV9IXsPft9Qnor3hoSwwLjz1gfVLneGvY4600jgxgUPrhgBi2pWOKItAGy3/nE9wo49Tik9JOq21/pRERl2VyOd/WiU/ToSAMWKBXPfmcBecPMxW+9sgx5GEatS9FhCsikSwuDFCBEzIY5T8ut9Nj3WfX9kt7kVUGRSJcv+vw0Lg713Rua/v2v3zP6BpX1iuwo1tzIvNh27Srae1UicfivqvReMXkfcHT6EFzpmZuH9KoIhN5vsnzduP2J8SHVZmjq+Zg1cmnE8RsML1pqezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrpzUqe93nJ9GeQOsSbk5MfMSuxr7D8zjv3Jzfyijk4=;
 b=EsdFeqHR6aiQyo7slNnz+ljEgm/AIBnFV0zlz5/FsHQGMh8NctRa6s1UwThhEjG43gTte9C2u1bMOsiZZvmRymWN6oVh5EWnjAow4+SlQYpZ2ooJjz1sovGaiuPXajkjoZzu7FZAdnZBs9wlGoWDlV05wNcMDZ0fRg1W//CtaYksDz7nv/DOdkoLF4uh3DRnlgZJKQq/gUFJPz8q2wZMT2wYGTwDtKC6C0oFvCCCDUuJTKbTJ2+3PIuufQOVTCfu7j7/awA0n6juFdPErqm5Q/UHjAWXOWg0cplv1Ap6xuUCQP/rpLk8/+ovEM3mHmKK+l8DJ1Sw3ODmFltpOwTm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrpzUqe93nJ9GeQOsSbk5MfMSuxr7D8zjv3Jzfyijk4=;
 b=JsU3SdOsbNz86HgOSkEWX/3NFaVNVp+bBGmacI8lwjWu9C/uzAVx8byYoYoO3PejLGqv3GAIXqJEUDwFl93ThKwj+svA/KC0p4uaZ7sTI/yr62cFS/tZQXSGKKD5KBjqHre0x2lrx8W5GX0Dh3rbiOLbP/K0y3f9f6v2HHTD751TMn5aYt2DY9griioy6SM69xQR++K4rnISQFa8n6N3E3Xm2FN6oByxyDxl3Uj4dtGtzN9p9TaTfUqfBjPjFs08OZCNhEbC9o2xg7StQFmtYSnifavax08BrYUQ6BvfiHm7AR9euN0rrRxFgN/jw1VatT3NugCHFiAzxeAW6aUMiQ==
Received: from MWHPR22CA0010.namprd22.prod.outlook.com (2603:10b6:300:ef::20)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 22:44:44 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::62) by MWHPR22CA0010.outlook.office365.com
 (2603:10b6:300:ef::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21 via Frontend
 Transport; Fri, 8 Jul 2022 22:44:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:44:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 22:44:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 15:44:43 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 15:44:41 -0700
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
Subject: [PATCH v3 06/10] vfio/ap: Change saved_pfn to saved_iova
Date: Fri, 8 Jul 2022 15:44:24 -0700
Message-ID: <20220708224427.1245-7-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708224427.1245-1-nicolinc@nvidia.com>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9aaf7ff-4d73-4622-ae57-08da613373e0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5209:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEinzAzAfz0J6IHSdYvvSlaNPV4Rs4fvpIVpO6WHEv1o2dHRiiFf9/yu4Pa474RU/pNjiWVQm2QZ+j+diYzkkmzr221ZQTUee/OYm2XRMSNrtbDXExGxZQ3H+MBeOAKSBWMbxmPEncq2wJQhv1FMX3CD4JC65Xh7L90ez4+R4b0k/mYB7yTkjgviYRqyedGFxxlGEtx5u10vyqevZ0yoxerApvPo4mli5sShUEt3K9pMDbFT+9xLOiRy1t1gAdher/TxM++VAP6eteBmI0JlcaZz21RBiKem6jY8+BgrntZs1CBtrv93CU7whTBsT50taVGv5/rEF8vtSMf/RG7SrGZcco4SACVzqNrcem++GLoptMqZdG/TxqlE6wJJ/T7GUW5iVaErMji2xjTpMlenjL/Yq8eAAkyjDQjz+qA/ayYmzJCULz34VudPvijMYlzWOwk6rKwTBo9ZAs5RhCXEYKr9/Ag5aiSOPo9UQlDChM4Sy1S0jPJ6nbLN/lh4qAQx1eTzIkEbl4qenJkxNsFhBNkHPekheQ4y13A1zfhxQMt/SLJ6YIfDvFOIjrYq+Z4ujcWjoXmYqRtHkPzaeJo1LQla/HDlXUVAWNlNZPV44VGJ7lY5N89qnb9fnvYhDooxHnVk4IIdmsMOiF15es5yvoqlIDb++Qliobsty6Gs/Lx81ZlfPCkIXSdlF4+ixaZZC3jeNq2P+hkjkoFF42jkO0e1/FRHduJ/1fXhxSI5Mfbt0ZD+IQE6+AudLjP7vXW+ph9dDqI3QzDTubw0TSTTj3wla2K72p8IYl80NQUSTon/ztsaa3igmVv6/LZPLVghnYsdBixkrfiQqB7xP8ssBTrDPjlYdA28RvY8p4ccoQQZmtk2Extx38NG6pgTc7E4nwP2TRRYzzjcKiB+/xqLIJjWBIND8wRvjOJEH1KYlBE=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(40470700004)(46966006)(110136005)(36860700001)(40460700003)(316002)(2906002)(83380400001)(40480700001)(5660300002)(54906003)(36756003)(7406005)(7416002)(8936002)(47076005)(70586007)(82740400003)(81166007)(2616005)(8676002)(4326008)(336012)(70206006)(186003)(356005)(26005)(82310400005)(86362001)(921005)(7696005)(478600001)(1076003)(6666004)(426003)(41300700001)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:44:44.0427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aaf7ff-4d73-4622-ae57-08da613373e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
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
Tested-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/crypto/vfio_ap_ops.c     | 42 +++++++++++----------------
 drivers/s390/crypto/vfio_ap_private.h |  4 +--
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 8a2018ab3cf0..e8856a7e151c 100644
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
index a26efd804d0d..479b205179bd 100644
--- a/drivers/s390/crypto/vfio_ap_private.h
+++ b/drivers/s390/crypto/vfio_ap_private.h
@@ -102,13 +102,13 @@ struct ap_matrix_mdev {
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

