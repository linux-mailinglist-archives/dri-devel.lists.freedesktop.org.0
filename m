Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A912FAC22
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF786E5C5;
	Mon, 18 Jan 2021 21:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523D76E5B6;
 Mon, 18 Jan 2021 21:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3KDIdkY1Nz26ijLTpw1jtUtEa78jIGPd7kYEudTpX/D964UPTT5yrplJw20TEANTMB0zZda/t9oOuohB57KZQM5PdpjWOC7xhg9BzhS4seSu4BlYFhKhHLkorn2ehCvVNvTVjt4TqsSR2jmvWY8ZK6VKNZ/r61pzQ18gzpiyl0zj4P/L6PqsMeGAe5Ov8JDZfaaaGvinxI+MhHvHVJfZ5sY9mJQoCVfGQAZCRoaT1XhWkuvUlOPdsuEmmMvXW1e1eb26bkUWybBXWCp4DPaCmhudRPK4pwMunDCTSuKjQOUt/yLJGHaC40XnIneOsuc2xWi7YFWaz1aHol40M66zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXXixyby5649rHgUJ4L5NHbYCr76Z9/oOHEt5mIK4Xw=;
 b=EE4TZHfPquuilesk/qR9cnBDyJpdeh0cOFvXEH2McAl81NueH8qQPHTDR6L2QIeSDQ2il5h5OjnZYZ6rO8MzIiM0vPIWVBALJiXmxx1yXS7zya1OAxwD7Ju03UqpTGBOMjw5LjpzhcxXjRI1U9P4FWW1W0DpVSVq3dDPRkeopIePTn5/OiRHm5NNqmD+T+Bi4CfHKH5ZGyIYoYdvJJp4iydZIN3u2BX1bQRUmXN8fywRwSsOlN/dwFKzvPzPQTIX8jZTLWD8yE44U2CNZ7ropvywSw2iByRT6PJpWdAhSk5+c9op/jpt8YGOwo2ISWgASsQSW/2yErwRZsCFTZzLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXXixyby5649rHgUJ4L5NHbYCr76Z9/oOHEt5mIK4Xw=;
 b=E1wPj1788oGUhxVnNdM5p8HGrYJ8irNfFyFyI4f4X5CHX4dMPO0YF+XJrAJom0omOy/NLC5e5+1/nSZnuCtPSuO6e1iMrSoPK7YnTMF4XShpU8yIHcqluIdEnsCZ9Tt/JapgubcUN2UbvpxkC9YBUUafDrvtVS9EA7Qu+gTpgZM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:37 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:37 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 09/14] drm/amdgpu: Remap all page faults to per process
 dummy page.
Date: Mon, 18 Jan 2021 16:01:18 -0500
Message-Id: <1611003683-3534-10-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92a2c8c4-c457-41f7-3de9-08d8bbf4624a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767ED63B5876031FFF71961EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQytVmqpg+Cnj/y8ts2EZYXVXU12nYFYqb9Y2AWooaiiabM9pQ2L3Mnzq5K11JvAnpQwg5XLVuy3k6MvcoHEX8K/CWzSrnH52HGzkVyBSS5BuBHX+EHVmy/U6azweeLw/w5WF6euU4lR8nF2/sXyr8BXSMVBOlerLwnl+WQ9+fomGKhlGYs6pBioVAPh5oBtTjGsGfLrbApZdDp9SCHQjZs7Gs/XH8nOkEfWR6KSkJ6Xi3qp/ZzuehCLBA9c5oJIIsTuoYb8oOO5/TaRfBcTLb/aGMMTa9INipH6QUcWMliqN6SYU7AYN1Bzhsc32aNwTvb2OwEwV0gsc7wlk0vA5kJBIEq+Kw0MU3wFBgGphJT9rYLmlcBGXD9d8EBw52Vmr1Cad4zNGty+X7sYJ5zmIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4Kl2gWI5dsHq7C0BMZQmQvdzq4U0WPIXFsB8IAW2dgv0wYiCVmEJQmo/IX96?=
 =?us-ascii?Q?F5Vpkkjqmzsqcvs0h80tecyHkxC2ubLgol9bHoKdkvDlYQBYAkRZ+6sqbOrX?=
 =?us-ascii?Q?xgqUOgan/DnJSp9JR1BWOgc2Zcg2uKKfGu91WnyBx5T/rJ1kSkEjb2+OrVnu?=
 =?us-ascii?Q?E6N8EGP/bbjx19eir+r/oeBdFvVQiReMntzyBtatPToZXoNaSV0ZY2997i6v?=
 =?us-ascii?Q?Si1bBvHAO8N8+NT32XWp4FbU8YANHUNreQdel6rUN4gMVgpCqNIGpDGfQCgB?=
 =?us-ascii?Q?LryOKeFKz0BfP7kxIVOShXJNUPI5YgfhuE7voudB5WX4pMflWA2aMpD+mqIZ?=
 =?us-ascii?Q?FoHtt6TWmdkCNm+CeHOgFhnzVBBuRr4a6j3rRdYeMEh5KIXmOdvuQ+lctvsu?=
 =?us-ascii?Q?OczX6DsoQkDxeZ91hiCqNGfmKemXZJqWwS4C1qIcXRglxI4eFKhBg8AWVrYe?=
 =?us-ascii?Q?QCTIggeByWgnCXHZSMFFiMLRtmezmmRfL9uTyVi5S/5xIPMd+KVagR4vKp37?=
 =?us-ascii?Q?6h4avjlA6DS4II2gRV66vc9kt+Qg0ZlxmcMQ9caumtcWK+VqwcbJnSMMo0Bc?=
 =?us-ascii?Q?9sNPjHrNaxyVZkyRuT0BxIGhZfAsTqYf0DSSjRCs7DQ0FbCK6RRGIqc+36xq?=
 =?us-ascii?Q?q0chvQa7R+oynYufScaaLscD5C0vzjkzzwPzldbpjRkctTTBxyQvwIJl0BZv?=
 =?us-ascii?Q?9I7BS7yTsGx7eJjO9lm9v2CQEDMYLg7h3eBElFp8H4FWKuqqLTAM/B1r4oeg?=
 =?us-ascii?Q?I8rI7i3o0YYoqsZwfmc2AzfRbhmjQctWu18aBsYElJ/4q11b9OfLLDE08bi0?=
 =?us-ascii?Q?9+cqGfJkMsOXn26E7PIjcIHOm3w2rejnswTZvgUu90rEgrWQ/qG8S2ENvq1R?=
 =?us-ascii?Q?Cw9MQozxiw47WbVUEw81kZLjcXxWVJTZyVNUGktBNG1edOWkLbCVkoOtitKU?=
 =?us-ascii?Q?TuPINROSdb3Tq20TMuRHrNZCz/G4Ns++Ch9qQcD+E7wAceFV1A8cfR4LOxdF?=
 =?us-ascii?Q?mrLeVq7SLoX2CYw6xRcdPKIbxkU0Yju1U2FzrTUl8X4vXgoyvzZMMZ8GYv8g?=
 =?us-ascii?Q?QwdJJlA3pbdyT+CGBu/0XXC0X3AiVtdnsMCXI3TLkqtufO1SJIC/TfFkE3Me?=
 =?us-ascii?Q?tjRWC+ZciVbM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a2c8c4-c457-41f7-3de9-08d8bbf4624a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:37.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwQHwvlU2l6oDf/n0s84643RDL0SS6wlIylj2+OqlPK2qKUdyJXWQk98Hn6KC4pOKmyRSrKwLvLbdG/T5BB79w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On device removal reroute all CPU mappings to dummy page
per drm_file instance or imported GEM object.

v4:
Update for modified ttm_bo_vm_dummy_page

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9fd2157..550dc5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -49,6 +49,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_object.h"
@@ -1982,18 +1983,28 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret;
+	int idx;
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
 	if (ret)
 		return ret;
 
-	ret = amdgpu_bo_fault_reserve_notify(bo);
-	if (ret)
-		goto unlock;
+	if (drm_dev_enter(ddev, &idx)) {
+		ret = amdgpu_bo_fault_reserve_notify(bo);
+		if (ret) {
+			drm_dev_exit(idx);
+			goto unlock;
+		}
 
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
+		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+						TTM_BO_VM_NUM_PREFAULT, 1);
+
+		 drm_dev_exit(idx);
+	} else {
+		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+	}
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
