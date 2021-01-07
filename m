Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBA2EC8CB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F726E44D;
	Thu,  7 Jan 2021 03:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E8C6E3DF;
 Thu,  7 Jan 2021 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDlSpjv+LqXly6R57RVHdngbARq2vuiilZr4LNSXKl+DgcEC3johaAPOLTDiq8wQAbdcN0KP36Vn6jPPYe30guuWPdcc8fXHmB7sGOqDbqP/2Bzvnks7e64L7Aar/O27oHlejI7ohzDKQscUqpqdFyXzUGwsZLHy2qQTsN+hl0fBId9BfMoerFf43FIdN8HxQyw99gswDLpvtLhydKUDSc8gFQCE9NDPRYXIg0NBdRgShzZBXDSjSGjvnFz42ntEBSbANIm060O7YE6YZpTgI+wtt1cX01AxoRxCIoY4/qpuZrvAAaoiqqFGc2+t8qUAltk/4IgJ/Ay48oBhxHa4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoxOxd7OsZEi+1jywroviTOClk1bPUZ0DPJwyzvuaS0=;
 b=dzbTK6jUj52Qtr/3Qvnm4haN9hvLGBSGKPa3/O5eBeNnPyz2jBArEVh7yE57j/lL6yaMwXeDzzeUKdYDKdTmkmYxZl46MdukB0fpGcl9qBcGaZ2noPvBGxMIiaScZnWaopmQ0OLeEY1wE9btOAR+5gcr28h+QJnlbScZ4hpRuk130dnFTO0gloqNRR/6PVPyYr6EKzg/QZjsgr8VN/MzdEAshydiypW2pJAYEiHJCkcrLf7kCcc+LhI36RI86MM3lbIEChA8I/NQtFwMU6P55e23CdOclJeHTm4oG2ZywL8n6OG30I5kEQC5uDxjF1DJRNKrD7jwReMXbiHkEGEQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoxOxd7OsZEi+1jywroviTOClk1bPUZ0DPJwyzvuaS0=;
 b=npE1cMM90F83M6eqvaXfFb4JN0eXAsb8vReQV37lgLYJ6kU6LSi+HF3KqS7PlJMqJ2ffac3EKH1e5nVFQ4cDjyTkOdoE6BwHuDr7iG32YnRBWpNOYieqVNxZrYYoT5PbmrtvO/PQz4DK9tsPYjFzPRKNhrIvzkWLjEAtTJMLhig=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:36 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:36 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/35] drm/amdgpu: enable retry fault wptr overflow
Date: Wed,  6 Jan 2021 22:01:24 -0500
Message-Id: <20210107030127.20393-33-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7916b8af-6aef-4ae4-8080-08d8b2b8d387
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408930F3109654C47D7E23392AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2ZZLwUbQgOrwXXOCi0JlJM9VfPo26NuBRXGIkgjOEHa9rwaU1FYReHliJLEqBa65p++OzZyE/m0Y5PHs2cxzd4oFqaSx4zlWoVC+ySFwJNgZ7d/BCnGxr9JLXzqtLwMqiAYmonBpz8bjyhB1svCF2atkaT8f8cmcylMhRCaxSGDbCl0KRn7Vq25S6InBKRyN2lmZ1g8dvJQMdngzihZyyIgdLa+WwpEhekB3X2ZJcxGsOiVViO26sQNBVrBr03cfuMke7C9iMo5Nde1QUpMeV248a8Kzemyw+79Y//d3k6MhRZhNB9zr3hbzPaQG6/IWFeLFK3xY/01NmYnCuTB3mlA0Ccc6lMSLf9nVeavM2A/GspZqeuJs5sgUiN5OstH6WlVXhRQl9Qpp+ZYNOPG6qqe4T7dBiOd/PuCJoIZG3IfG6MWOxR0qOUoQ92LUQcC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?du2LqJPaRLiN4uomttHPy6SCVVemqMJlRwOJ63L8XOCofXesqSbdVlICoB3A?=
 =?us-ascii?Q?gqtUcRhkAuV5T9QvJAqT73UAl70rH1JJFS+m2kVDzpTc8X0hEPljXHP4k1RF?=
 =?us-ascii?Q?sQ1e0ROL9WcTfYhpnuDQwu9a6XHyuZNgWKNp4hKcrkqC4W9dQXL2Dt+ZGq2C?=
 =?us-ascii?Q?mhfHG3BTzSVA+tVO8R+ZouUnTUMwcAIm7M5BK4H3lyN18GN9Bf4X507iofNv?=
 =?us-ascii?Q?y6oTNGochARRm1921UXZlUigHbfQswAG6Ezyp4ayb+CU3tqgiaaT/xgp90uE?=
 =?us-ascii?Q?1kQn4uMkzwawmL3RQp4meDND/9m8959EBq350hvigDlsjxJJxt4Iu+TLaSnC?=
 =?us-ascii?Q?kMv9a8kL2X/SJI+iMpQRCExJS80IKPPwum+6Lr25pugs4xcN3Uu7r4GZgsw0?=
 =?us-ascii?Q?+3fWl8Bkw7mgClZwJFv5wfVXzRqlWkcklbmlpIFM46RmbFcKVXZUVHuoM5nL?=
 =?us-ascii?Q?/BNJjkB0IDXlkRAEpz1/ClVvwPmJAMxzqjOdJhqFx41dKnLBzSXE9EW964vg?=
 =?us-ascii?Q?Cr8BNRfX3CxPkOMPRD7wDJBWTrbAFY5OJZuIQljdRYDzxmyM8MZEUX+SXurf?=
 =?us-ascii?Q?o7hayeo1KYIA6KV2OTB5DIWQWZ5W2+aMBcyuxGLsEWddzJlQBuDJoEXYJDSr?=
 =?us-ascii?Q?uq6k1qZg5gyf3Xfn/p1h3NMm3klNo7BPGOiFh+2mVKESeuipytqHdbEbe6Nk?=
 =?us-ascii?Q?AO0QgqR5coL/hQdF2Uc5xk7P+QfgUmgBJcgmDv3gCnq8D0EDi7zQpy2RXTPm?=
 =?us-ascii?Q?ZR36uBNBrd+l6YigNOJ50PNZ3kRE8dx2mPYUDEdtf4zBayzenNmXM9EqUKkA?=
 =?us-ascii?Q?aYbviRdC7hSiCqPEp8ZJvR5KJZMYPjFjQ4AJCzoG/51EPU39uBvveGkh2Z/m?=
 =?us-ascii?Q?VLpuGXT/hyCpSM4nPkOkau2SXDW/nr44JBJqCcgnhxfA1PGHvNGCY5sBivBw?=
 =?us-ascii?Q?D4cqrMVKt+iAEfwH9WRiif75Iy+WS8SdpXWyb1Og/nW1JYdm0nhHSdJ4XAxa?=
 =?us-ascii?Q?Ae98?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:06.4756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7916b8af-6aef-4ae4-8080-08d8b2b8d387
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1orUNXBnlbJlVi0DkFULpeATk1DeDpQh1/j8vpOYQ58cZ2kQZOkipGmiPWiN9agqEdod9j/DVFTxCOz5kl6VxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

If xnack is on, VM retry fault interrupt send to IH ring1, and ring1
will be full quickly. IH cannot receive other interrupts, this causes
deadlock if migrating buffer using sdma and waiting for sdma done while
handling retry fault.

Remove VMC from IH storm client, enable ring1 write pointer overflow,
then IH will drop retry fault interrupts and be able to receive other
interrupts while driver is handling retry fault.

IH ring1 write pointer doesn't writeback to memory by IH, and ring1
write pointer recorded by self-irq is not updated, so always read
the latest ring1 write pointer from register.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 32 +++++++++-----------------
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c | 32 +++++++++-----------------
 2 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 88626d83e07b..ca8efa5c6978 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -220,10 +220,8 @@ static int vega10_ih_enable_ring(struct amdgpu_device *adev,
 	tmp = vega10_ih_rb_cntl(ih, tmp);
 	if (ih == &adev->irq.ih)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RPTR_REARM, !!adev->irq.msi_enabled);
-	if (ih == &adev->irq.ih1) {
-		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_ENABLE, 0);
+	if (ih == &adev->irq.ih1)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_FULL_DRAIN_ENABLE, 1);
-	}
 	if (amdgpu_sriov_vf(adev)) {
 		if (psp_reg_program(&adev->psp, ih_regs->psp_reg_id, tmp)) {
 			dev_err(adev->dev, "PSP program IH_RB_CNTL failed!\n");
@@ -265,7 +263,6 @@ static int vega10_ih_irq_init(struct amdgpu_device *adev)
 	u32 ih_chicken;
 	int ret;
 	int i;
-	u32 tmp;
 
 	/* disable irqs */
 	ret = vega10_ih_toggle_interrupts(adev, false);
@@ -291,15 +288,6 @@ static int vega10_ih_irq_init(struct amdgpu_device *adev)
 		}
 	}
 
-	tmp = RREG32_SOC15(OSSSYS, 0, mmIH_STORM_CLIENT_LIST_CNTL);
-	tmp = REG_SET_FIELD(tmp, IH_STORM_CLIENT_LIST_CNTL,
-			    CLIENT18_IS_STORM_CLIENT, 1);
-	WREG32_SOC15(OSSSYS, 0, mmIH_STORM_CLIENT_LIST_CNTL, tmp);
-
-	tmp = RREG32_SOC15(OSSSYS, 0, mmIH_INT_FLOOD_CNTL);
-	tmp = REG_SET_FIELD(tmp, IH_INT_FLOOD_CNTL, FLOOD_CNTL_ENABLE, 1);
-	WREG32_SOC15(OSSSYS, 0, mmIH_INT_FLOOD_CNTL, tmp);
-
 	pci_set_master(adev->pdev);
 
 	/* enable interrupts */
@@ -345,11 +333,17 @@ static u32 vega10_ih_get_wptr(struct amdgpu_device *adev,
 	u32 wptr, tmp;
 	struct amdgpu_ih_regs *ih_regs;
 
-	wptr = le32_to_cpu(*ih->wptr_cpu);
-	ih_regs = &ih->ih_regs;
+	if (ih == &adev->irq.ih) {
+		/* Only ring0 supports writeback. On other rings fall back
+		 * to register-based code with overflow checking below.
+		 */
+		wptr = le32_to_cpu(*ih->wptr_cpu);
 
-	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
-		goto out;
+		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
+			goto out;
+	}
+
+	ih_regs = &ih->ih_regs;
 
 	/* Double check that the overflow wasn't already cleared. */
 	wptr = RREG32_NO_KIQ(ih_regs->ih_rb_wptr);
@@ -440,15 +434,11 @@ static int vega10_ih_self_irq(struct amdgpu_device *adev,
 			      struct amdgpu_irq_src *source,
 			      struct amdgpu_iv_entry *entry)
 {
-	uint32_t wptr = cpu_to_le32(entry->src_data[0]);
-
 	switch (entry->ring_id) {
 	case 1:
-		*adev->irq.ih1.wptr_cpu = wptr;
 		schedule_work(&adev->irq.ih1_work);
 		break;
 	case 2:
-		*adev->irq.ih2.wptr_cpu = wptr;
 		schedule_work(&adev->irq.ih2_work);
 		break;
 	default: break;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 42032ca380cc..60d1bd51781e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -220,10 +220,8 @@ static int vega20_ih_enable_ring(struct amdgpu_device *adev,
 	tmp = vega20_ih_rb_cntl(ih, tmp);
 	if (ih == &adev->irq.ih)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RPTR_REARM, !!adev->irq.msi_enabled);
-	if (ih == &adev->irq.ih1) {
-		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_ENABLE, 0);
+	if (ih == &adev->irq.ih1)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_FULL_DRAIN_ENABLE, 1);
-	}
 	if (amdgpu_sriov_vf(adev)) {
 		if (psp_reg_program(&adev->psp, ih_regs->psp_reg_id, tmp)) {
 			dev_err(adev->dev, "PSP program IH_RB_CNTL failed!\n");
@@ -297,7 +295,6 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 	u32 ih_chicken;
 	int ret;
 	int i;
-	u32 tmp;
 
 	/* disable irqs */
 	ret = vega20_ih_toggle_interrupts(adev, false);
@@ -326,15 +323,6 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 		}
 	}
 
-	tmp = RREG32_SOC15(OSSSYS, 0, mmIH_STORM_CLIENT_LIST_CNTL);
-	tmp = REG_SET_FIELD(tmp, IH_STORM_CLIENT_LIST_CNTL,
-			    CLIENT18_IS_STORM_CLIENT, 1);
-	WREG32_SOC15(OSSSYS, 0, mmIH_STORM_CLIENT_LIST_CNTL, tmp);
-
-	tmp = RREG32_SOC15(OSSSYS, 0, mmIH_INT_FLOOD_CNTL);
-	tmp = REG_SET_FIELD(tmp, IH_INT_FLOOD_CNTL, FLOOD_CNTL_ENABLE, 1);
-	WREG32_SOC15(OSSSYS, 0, mmIH_INT_FLOOD_CNTL, tmp);
-
 	pci_set_master(adev->pdev);
 
 	/* enable interrupts */
@@ -379,11 +367,17 @@ static u32 vega20_ih_get_wptr(struct amdgpu_device *adev,
 	u32 wptr, tmp;
 	struct amdgpu_ih_regs *ih_regs;
 
-	wptr = le32_to_cpu(*ih->wptr_cpu);
-	ih_regs = &ih->ih_regs;
+	if (ih == &adev->irq.ih) {
+		/* Only ring0 supports writeback. On other rings fall back
+		 * to register-based code with overflow checking below.
+		 */
+		wptr = le32_to_cpu(*ih->wptr_cpu);
 
-	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
-		goto out;
+		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
+			goto out;
+	}
+
+	ih_regs = &ih->ih_regs;
 
 	/* Double check that the overflow wasn't already cleared. */
 	wptr = RREG32_NO_KIQ(ih_regs->ih_rb_wptr);
@@ -473,15 +467,11 @@ static int vega20_ih_self_irq(struct amdgpu_device *adev,
 			      struct amdgpu_irq_src *source,
 			      struct amdgpu_iv_entry *entry)
 {
-	uint32_t wptr = cpu_to_le32(entry->src_data[0]);
-
 	switch (entry->ring_id) {
 	case 1:
-		*adev->irq.ih1.wptr_cpu = wptr;
 		schedule_work(&adev->irq.ih1_work);
 		break;
 	case 2:
-		*adev->irq.ih2.wptr_cpu = wptr;
 		schedule_work(&adev->irq.ih2_work);
 		break;
 	default: break;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
