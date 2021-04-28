Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602C36DB12
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F786EB8C;
	Wed, 28 Apr 2021 15:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AF66EB73;
 Wed, 28 Apr 2021 15:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrYwzIsa9fe1S/5HR6lZH+woSVOZYs9LrWryuc/02ONPYXbOUYzJ23geaZmiG8k/ECNxPteTqzNycvNKVK9TKdnSlnUrSaWXRftZhCmBGRg93BimbkMHqCQRks+8tNCWSLrLBuJLOVFDmcZT+HXFSMURAPvZpa/vUONeM0u4Ap5VFXtrm4D194YnhURh394v7SAQd8DOEa+iE1+Bug+u+CNl8UHWzhC5SE//i/GJUNxEqCbQvQjW6F08NLYrsPpVGyhvu4EqOm9vxdVkKjUfWjFdbVxZyrQaJqUlCIqEk8HR1piu9Duw7V9JanMYo75umgMh8siGN1lw7kEbp96S+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSHb3NhRY8x9Y0enrqhijZobX8cCyOSOvM4zW8iMOzI=;
 b=dRLXGZjheGqPYRDuE/Sr6er39oa/P1LGdOaYlt6evDdIVAkKoB8cfyn/0bKhPA3RH469Bi4JCMFU4Kq1EU3btnUq/DLzrLszVMVFo1/EpjRn/K0go+eA0SLSHJQEZ57H5YwOVGHaYovtXoQEBv4bc27CPkpxK7UQV/JqEWgzMMa216FnZyjHqThbCjEPun6aWwAQHNVcvUvl8VDN0477dqYa0G9rXbse8AFykRurXecpDlfGmsQ3AzBDTmduvDEKYExlsoJxwsnzQH6aIlW52pdYszMVvS3r1XY/o0QbTZ3A4Oq+ilGJJSx9elZONlQ96wbEtgs/2sjB+xvIK5adPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSHb3NhRY8x9Y0enrqhijZobX8cCyOSOvM4zW8iMOzI=;
 b=mWd+OsA6BGPPDwC3SUv9XPjKRsdfwKXa0C+RHRIEKXC+OInjQ8SqzP58KLlazgD3DscQ8ef3DXabdS0HYrEdIqJBICZK8xysQIH2FvtfrFdIvBtNU5Zv46DhDZryrfNgjYTHoHrX0SbvN8TGnFgdjG+9ZoTdd7gSpty+/4cu72I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:17 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 24/27] drm/amdkfd: Scope all KFD queued work with
 drm_dev_enter/exit
Date: Wed, 28 Apr 2021 11:12:04 -0400
Message-Id: <20210428151207.1212258-25-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cbaced3-a07a-42de-51ae-08d90a582556
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27496AA9FB202DF788EE6C22EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:289;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRfwkMQB883fKIXDAI9MYAsjQIFsTZVuwIERddFU65DHtIaCUJoHaX3oKsmL+glK7jo4te0YyDaGZouSHSdGx19EWBGhNaJS2yGugnyaSS60wa8DIjgKRcZhDzMEPcBZeSwX51rcLFuoMdawgCdNWIFl+Z3uZPqow+WVR6MuNIhnosXdQQWU5EIUp3eBW3aSTVNnboFhqc9PM4YPOzCCLdkVPQpApzdde6eoCS4G41K4hm4ve9CndX7yvsBv1eHUp69eMOerHzBgPIZzzBmWoZxh+Dkt+T1jXd5Lxn612Z+8GiAeNXmUnysmQ79nsEnrenk3kNLXk5WH2XbzOHjy1faVLwWRAF7MVPhw+Eb0cskDiUuU+iPLr7WQ4VPviAU7Za4GK5dIMmwSt1CdptFl7TMv9vQUo7hgIWeFJY5CZCoGt5r4lA8UVUuh+xQCqLmgxBkT3qQhyBV1M4+ef1wLndmTB5KRfEsmlMd88NWV4ZSHnHyLL3DOI967S9SudZW/eFcZvHZrQ5XWvUuQwy2v1wCpvzssnpqFwC/qCTBP1RmTdb807sptOGDV3K/lCOPosRyKrhKEnEEHiB1iCum+LYvMuewvOQtYfv9VqYthj28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LN7O+az4sVNRJyVOtCYGy4P5pD5BZpahPma9Mds3LDKX3SHH2tLpzkLpta0p?=
 =?us-ascii?Q?ZLtrRVtTCmYzSAoMNuTX6Z8oQRYo0hNTNJOCc806PaA6Q3PZJe/RNBj0sOS6?=
 =?us-ascii?Q?ofK2u44oSwaFEBB+zHawTNIpa21c6dbL6OJsGctN0jCs1ab3G31VHrchU1rn?=
 =?us-ascii?Q?VL6gz7a3Vba5ryxReiD62NEwojdBqiOvzoeHT2+eqSz7Xf48yafmEZ7c4lhA?=
 =?us-ascii?Q?3VNqKirbCOFTzXpg/qjFGw2GOgXr/inmMu+aWEc2CRpiCQ7TDozv51Kiy0YL?=
 =?us-ascii?Q?KihKUN1O9yLXX9HNLERRXBxn/+Xn4A6RHpuZMesX33G3+41nt1uTVXqY49I4?=
 =?us-ascii?Q?A5SZnVFi1tfBl3JYufqSDYZF7W0WkpxPbr5X5C8kZBEwJXBZJnbjdG7XUgl3?=
 =?us-ascii?Q?voHtR5ngRB5iSMIqUnSSqPulB8TAjs+NF/pWO6743BC469Mym09XdYmC4ljc?=
 =?us-ascii?Q?mq6Y4qJECdFcVtn47imUuWKF3YwjFA16OSr8kHkX5zWzq1V6dxaAoL1ehQ5V?=
 =?us-ascii?Q?XE/fhqeNI1/crUt4vFWrUxt20O8tplSEy+Rvp0yu7vjsNbcGQ+yzXeTMq8j3?=
 =?us-ascii?Q?DburjI3VxRTMZFjdf9jat3qv5YEFFTCIpSOsD5iDQieyDikGUisrDNL/qWHY?=
 =?us-ascii?Q?TxiqGNn9Hvy6t7uPwqSGNULPTHgP16EsVbsBwuyQ6gN42rzlHUxh+JbUqwX2?=
 =?us-ascii?Q?D6uGGeWamRDQ+yf9hG8xcxwpxX+p6QCLGhrN1k+jFgpiav50IL0kJJlMKCub?=
 =?us-ascii?Q?2dEifZSkZtc8ZXv7U1RJPpsXuPSml7ndsziKcYwRok8LgAYhPoEE0PEm4UQ0?=
 =?us-ascii?Q?oipmk7WcopxxjMxQohAXSKrUGPucuBs7VRIySR7U224TFg5vM6KOO8bisTkq?=
 =?us-ascii?Q?LE5lIUQZoD0kRTqr0YCQ22fyfirV1MM7jckrPfCpG6BN0AFse5Qgj1+yBqoE?=
 =?us-ascii?Q?jk9QaCJ+a/7O1hpjcxuqW9oBXJl7SxieKhnNZ6GPc+Efho93zZMlbi8J2+xO?=
 =?us-ascii?Q?yH/cclxiWvTDK4PImeEWCukL1BuPCjalb+s7s0yFd8Q1cBlJTwADMTIU6h/F?=
 =?us-ascii?Q?zWQPnyiDDiWIXhC8aL2lqMQ8sYo3o267t1xOoOVjT4rr1BjZoQiVlc5zTgf8?=
 =?us-ascii?Q?WCDx6O5hbmoyMa+ae8WPuEmIlkxqrW7tvkpQcTG3yZy9D7kpG01x5CuKPmqO?=
 =?us-ascii?Q?EDCLj7AAYk5FT2GVEXyoXcETYVj11HfH5fJXwCNlpHopn71s45XU9wDNg7gU?=
 =?us-ascii?Q?diSDDP3KtfLOs15RsBnEqRxPsfn38wNHEkU+f6uXMpq9TKA/dDV2Nz+VwIrJ?=
 =?us-ascii?Q?sXlrfmIxcq40OVNP1PLxURzreCZ3TwozI4kyBRQ0QrhFCSde7FkJh6h7bUZa?=
 =?us-ascii?Q?WdblgLcmbmBAB2lgoI1MTzCPt/gk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbaced3-a07a-42de-51ae-08d90a582556
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:15.1058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qTrlNKQWAZwSM5eVslSpxznnUVmsVuGK6Yowjw5pHHxG2MDufOf9JG7YsrjbW9LypHVY5etwqzkpqfyHaryZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow completion and further block of HW accesses post device PCI
remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
index bc47f6a44456..563f02ab5b95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
@@ -43,8 +43,10 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/kfifo.h>
+#include <drm/drm_drv.h>
 #include "kfd_priv.h"
 
+
 #define KFD_IH_NUM_ENTRIES 8192
 
 static void interrupt_wq(struct work_struct *);
@@ -145,15 +147,21 @@ static void interrupt_wq(struct work_struct *work)
 	struct kfd_dev *dev = container_of(work, struct kfd_dev,
 						interrupt_work);
 	uint32_t ih_ring_entry[KFD_MAX_RING_ENTRY_SIZE];
+	int idx;
 
 	if (dev->device_info->ih_ring_entry_size > sizeof(ih_ring_entry)) {
 		dev_err_once(kfd_chardev(), "Ring entry too small\n");
 		return;
 	}
 
-	while (dequeue_ih_ring_entry(dev, ih_ring_entry))
-		dev->device_info->event_interrupt_class->interrupt_wq(dev,
-								ih_ring_entry);
+	if (drm_dev_enter(dev->ddev, &idx)) {
+
+		while (dequeue_ih_ring_entry(dev, ih_ring_entry))
+			dev->device_info->event_interrupt_class->interrupt_wq(dev,
+									ih_ring_entry);
+
+		drm_dev_exit(idx);
+	}
 }
 
 bool interrupt_is_wanted(struct kfd_dev *dev,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
