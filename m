Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008C567E64
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 08:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08C210F95B;
	Wed,  6 Jul 2022 06:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906D310F95B;
 Wed,  6 Jul 2022 06:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fenbwA/tX/NUy0Vv9NCZaqbRteehxtGthtgDS69teXXlGMFRJaiwoz0PmkJ7VC8wvO38rSKpMNTC1ddJuwW9aGEXnHv5q8QLneUURs3dYe2XdyD9jF6lz6Y1q0HutfplhC0d5yN8RI6A0xaemlQ81Uj4+wxkfRx3awvD+kQ8EJ9x8UJtJ+Mb+m2VKJLtgphLPL2lLiVgIUVIClJYCExYXI9A4JuicTb/z5L7E4mKlKFWMxccPBX7hcT1YsZ3UDbiR14zrRfjxLEja5nuuF+mLXIlNxE96Egw3jEW+XzzwvKPmJIJV+2wQcZw2H/NDAOQlz9htN8dvkjxU7Z3zNI2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiNkJ6cSD0IHTf0/58352H03VRDa7E+pLlFywZ+J01Y=;
 b=k72kf852SrA2fG7fUvn79YjRss96RzE9z06t23+A/uKySOn2bHBj4g34dcv0wJBSRC4J2KVq9GWsl212H/PP12v7ud7ViQlXVW1Y54q0xLoTSFZ44AgEAthRdEdbNKHVPb5D2GEoVRaRyTPzl4bEjB5ZnLVXMNvJu8vOqptsNEnzeg3XccTKwCxXh4ralZMhIrglA8ONsXFxI+MdOVpbmMtwWlqbxSU+XFWe/ZLGZGnYomZpZRMuZYho6CIBEeKVVyljm//wjws3GiCg0zLVfZVi6hRK2G4emjAYdE7EeLODHPT7He8cLUR17NXO2iMTXrjyxWHnZ5o4zOtcfYUHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiNkJ6cSD0IHTf0/58352H03VRDa7E+pLlFywZ+J01Y=;
 b=nvqSfc1riny2wXnEhAjVG4kJSZRIH4+g1X8fAENC/QT/wZMDa0gBVItnTA040ZrM/9rRWdr8qD9+8lDpM219Tbbidz27UyS/I4cOweL53q20SKDqac8v+T1bQB7I99jI360QZ6zyMgJLvHvGmDS2QZ0fA8D3MDO2ltGQaPP/uJHlsACktpyDNH7WxCRRsyzNQ4RMCs9TlqbgFD6xNmfD8wJ+ppgZBWTGr2J17kXSPHErYufhBRbH8+Fvpdf9U7FQImR9eCFoSeA+/tyno2ymHwICh8KgdChvH0DYR4hLLIMosStMmVEdU7rgG6a5ScfWuJKaR1Nw3l7lJoZizsblsA==
Received: from DM6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:5:1f4::32)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 06:28:23 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::26) by DM6PR02CA0091.outlook.office365.com
 (2603:10b6:5:1f4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17 via Frontend
 Transport; Wed, 6 Jul 2022 06:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 06:28:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 6 Jul 2022 06:28:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 5 Jul 2022
 23:28:22 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 5 Jul 2022 23:28:20 -0700
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
Subject: [RFT][PATCH v2 5/9] vfio/ap: Remove redundant pfn
Date: Tue, 5 Jul 2022 23:27:55 -0700
Message-ID: <20220706062759.24946-6-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd6811a-e7a0-4442-2363-08da5f18ba42
X-MS-TrafficTypeDiagnostic: DS7PR12MB6007:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxXHOP4nkRK8lqf/svoz30cGv+sSaODkDIhhy905WyA4ZFu93hIfKONEHeacNQ2MMKIfu3WohGzZVyXrkGCH2mKN6ntpGQ9EQpDN2yQEPzYtaVu6Htk8NUm127wcQbweSGfOba1Y4oGB0HZWZhXd4IR2xOjMpCaKwzLCrijkokPtT2aywtpVnXTjspNLAaeZADFXdNwf7hYVIauUxvybhxbBC4aR4zlJG4GqENc4+qJjiD7gREpt6KKczyeg58TkeSMyj+mIthNoRyskbRuD1nIL5qlg1Eq6qM4ZzoylQUjetfbjIu0uowD4lage9pLve5ewhpJ01XdbTnUU23lMw4oAPHGn1dH7I2SiMoqjEwSjlbdjv6yCrTAPIRaeaEvV64VZsaXEWdZG9Cu/3lQKDg1NrLqv8H4huIKTMZliNkQ289VZMcCtlDDOwyMyISQ0z3uM6zCr61FTSShY+IbHkz+dRGd1XwiiyN45wrCuPvuIJDlvhXpmAky6I3gnFeDkqXEYC4rMPwb3+j27HoemtgW609m+BfyV9JAP/humZSs4mMc1r9GK6ibFo6fUPmQ1tllP4Z8QXGuDyLCKITvKL0u3rB0eqZs2k0VaRXAkIqklAShZcx70eAXYlNpLTNJ3lbZtD8Jn504jDZtmobgCjeAfUx5Nu7bfJUbNEMU0RoZgPPYWzp2FEyKhanMbrZW5gB5p43zmhB2etcN56+pSo+U9IRhLRMB5iLZjgAbV7opTYK+CMYYRf+aFpuv9IG92KQS4KsrrZB9z8QzPpevuFb5D+b2Q5BDinAPiMraupeRI+Itq9mi+B4CftpzRr5sSrCNPc8g70+bJaZiYUNVBgAa8NJNZenJK1yTVqDTgbWeAEKp4maaFWEee3oWCm1soq6vwgGVYjjfk9Z7XqW6Xg+Ft8jOvJMCemgUpo0ROTrY=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(40470700004)(46966006)(1076003)(26005)(7416002)(7406005)(54906003)(110136005)(5660300002)(8936002)(36756003)(2616005)(41300700001)(7696005)(336012)(426003)(47076005)(83380400001)(186003)(6666004)(82310400005)(356005)(921005)(86362001)(478600001)(2906002)(81166007)(40480700001)(36860700001)(40460700003)(82740400003)(8676002)(4326008)(70206006)(316002)(70586007)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:28:23.3534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd6811a-e7a0-4442-2363-08da5f18ba42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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
Since vfio_pin/unpin_pages() now accept "iova", remove duplicated
pfn code in their callers too.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/s390/crypto/vfio_ap_ops.c     | 42 +++++++++++----------------
 drivers/s390/crypto/vfio_ap_private.h |  4 +--
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 8a2018ab3cf0..6945e0ddc08c 100644
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
+ * This function parses and validate the nib from gr2.
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

