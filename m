Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D073704E4
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D9D6F877;
	Sat,  1 May 2021 01:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD046F63A;
 Sat,  1 May 2021 01:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeHTkRbYTZFZZq7gpqRuHM/uDrlth+bPfa7Gm40kNiMLOdgttQnMfCV68zQJIIUp7MSo+j3iwHZiuWvNJXnA2WeeKFGELj+fIOmBdhgiXSAw23LxO+idwUtoiiP5T6A21gZQdr25Yxzy1Ea1ryPg9n0fkjhjv3URaGHCTbPGgNPHdphdCirE48ZVA4tgePuGYsK2syQQAXo7NfBcZH3tf71V/gJKrtAyIQWBSMXLvRGTE/B2t74Y7LLMlUPTw774O0fSLqlMQqWjzfYgB2CrnrU0DauV9+0rc0ZBGKpZhE5xep/1gqa0h5S+5DzUcWLxLwm2frg3XLhngRRVIBXz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmHEtqMQAX6LZ036Gn4ezRqXKjdS02j0KGFo5s4rzkw=;
 b=MFJtC4u03awgq2pFwhSeDdq4WlaT5k4Z7eThBvKTACWc0fKNku/JTqw7K9eAoPczACnzm0zXX8t/MaUQcuwENTIuTmYPf4H4UMs8JP3fH2hPKmSAunsBjLSrLMXxI3uRArlDrKP5TTNr8/hC90hbEQhEQjD5nO9OMohUb0Nca1wdsagyIzoEGTiF2FzlfnhB/fLIC7d9yAVCuOPXUE3dNAEhMCUmf1TDJTM6WFWCfHFhO1K+cb+wLw6cAO1/rP6aDDP7kE/vZlCFIerD3DYmjN9ENXMW7nCiZKSi8bQLRefOJOiw4sBTDS/5b2TeJ7s7aZ7Hd9wwo1e8dS5lD1pyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmHEtqMQAX6LZ036Gn4ezRqXKjdS02j0KGFo5s4rzkw=;
 b=Tt3EA+mVZ5F7iQ/qnewy+gWfet6U0R60EtOshuhxDYob4rWvO76V91PuO0XxUmv/+teX+XDzEJny63apKOPnp3NAMAJjGnFQ0upgYJQkmbZ57DVQTUlrJg/Gy++brwhRlasE6HheamlUEmwDDOFkvTtxXQZR1Vf96YZCczCQE6Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:34 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:34 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 16/17] drm/amdkfd: CRIU implement gpu_id remapping
Date: Fri, 30 Apr 2021 21:57:51 -0400
Message-Id: <20210501015752.888-17-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 060bc2b6-da93-496e-a04b-08d90c44a070
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932904D5973D38B581F7D52925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3WRS6Srso9uV7X9D06L7zrZBkQ2/6BWdZEGvdcLgb4cyPnPP5lbQEN8LeX+PBgiAn1Hn3syIAzeJhjhIzej0l+ABmZldwVCEuH3jhAZFr0JiEMgz9B8WGQrDnq1LHM3vw5M1Hb08W8zZgC+qas/06EwpPikhKZp9PfJllnyR5iUjTADL6vBkr+jz+tvSPj3c+8L21xSZmjsNOQgXgxVTaE6DNTWRBivr882ZEwDgHhnr4x+JsdWP5rTK9qoDxcy8glqAGKnpvsY23mzG48GX6gW1SG/z6Vw9YCnKgR+dxJgN078R51vUmeUxyAvpKUrqyCOhSYHCfWckoeUC9Cxv0iiuk81bKoRIfyXsByTJ2ioTDz2yTD59Yw/K3PrzURUkkB0xl8kq5+Oy9+csNcdE8GhTUXhAx3Qq0XlwPk8xm37ydZB77SNHV94CwDwC8dzehCOpB/rSOnZs7NWmyIoD0Kb1Olx/IviAM8pms693xcBKfmYrZvwMmspp4CT2ysj3iMmaW3ooLZa8x0sjB+szM9SnteuHedOaRtkCOTlGetpg6X6+o3LWqlEt2Siv8J4KWEyAEiGApuUJvTwX6Js8qAuLxC1JlfwqLMQqJGVDO/oWmlmP2ryvxAb29saRGedni0spr3aK9lPFVBnVSFxrBsZkWkLnhPflG/nV1cCCPiOs5NU13FEwgBC6jsh/44s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(54906003)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(8936002)(30864003)(1076003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XdLcryE7uzpXAtr8NZSuU5uiCTnerR185saBHHoUJ7nIYi2sc+AC/gkji6A+?=
 =?us-ascii?Q?2+2/xBij+WT3ZuyehYrE28uk5/vyzAiLIDGKGdCqxafrZXoWCdd++f8Pr1Ru?=
 =?us-ascii?Q?QlYaH3sqFdj0OkgtRiUQ5SiQuZf81jc2dsxyS4ICnDVnPktZkDG3Nm+/Tj5s?=
 =?us-ascii?Q?hoaqyQb2lkgsCdwFhr3clClVkzv4ZdCPAJKm/zeOqRmaICiZBXmTb1/gGozi?=
 =?us-ascii?Q?bkn/TQuGUyeAKh5pSRjizlhRiukKk/OwYIg83NG/AvBvrTHXXBYb1KlAwcg8?=
 =?us-ascii?Q?i3cuuyfm2UNL4wR9ng3yAMBfs+3PzOnxfYncd9b2MOgRa9DsoevllckMFlQd?=
 =?us-ascii?Q?CAZAhYl3TsN5VxUAOhKk4YyRt+OnbfpHVeNhcqJzC087Wy48xtIK4I5i+JhF?=
 =?us-ascii?Q?PFIpSUuf0wLxKiZw2DgQfUJcAPLV/++w97IRVUIR1yssatpFT8+Hcp6IFB1/?=
 =?us-ascii?Q?supwT9jGqZfMwT0jWbg+gpRS0wd+t0d2cJkrTA0q6dJ/O6AtYEIp96Bw/ISO?=
 =?us-ascii?Q?zq74XE1lW+2DE2VK+HSZ+/efVIM5btMw81BzUUjo6wT9ZXBNbIfjCe6l2qMY?=
 =?us-ascii?Q?rBZOiMu1yeBxxuTQpVyXcMXh7OYDdobunPv7rY2GK9GoAVCyBhBO8+mRPdMg?=
 =?us-ascii?Q?ugq0EaKAtMWt5nXqrdnKRsHL7QkmCGQmyyvGSrGWZEg6zDtJT2ze03qU0LJf?=
 =?us-ascii?Q?ZZ7fGXPIxX+VcoicfP0bCJSFtSRSNtgtHaWrUDGjGSLaUhS1Vh5vByBQKkLi?=
 =?us-ascii?Q?YV5geOT6ZpJaajrIfZx2F9uJkFsruc5NC9yu+Up5xcxe2MWKEpS4PP3s1iXZ?=
 =?us-ascii?Q?Fk/KmxwS3liDZ3A4AUDPxftzJUOhCBrBEWkGCHrl8YnsjHWyEKBMjw/+uy1u?=
 =?us-ascii?Q?wkp/Ns9YVlr9Kkd/NGBCT3xZWwJc5xuBuvtjQY4tFr95eg6VWSDggbe+fax2?=
 =?us-ascii?Q?OcBLHRSBNg/ZVzvlhU5/FshS8xhquMWaIHCNcxyed1QzCbzWmCz3TTfjFzSq?=
 =?us-ascii?Q?rMgegqcrUoQ4BNYZb3GgGJXk39gRI6N34nRugctxsVgZVCaOcccR8c7EHSC5?=
 =?us-ascii?Q?PmRzs7gRfKF8lt/lSHB18d/UxQ3j7aqggxUqFKfAqCw9tSJmqFkIDJxpzAIu?=
 =?us-ascii?Q?4UMIgAc8wPukStmw2/RzbEIAQ7YdwAE+dSvhPl2O65RRj2DSCVvq5S308OdY?=
 =?us-ascii?Q?gVGo0feAJOTvss+GtevLmOXOAiD4C5I5T6F+rZzpRErlZuukA4bgkoOcis/Y?=
 =?us-ascii?Q?eeu0zvKQlJYhwMl0HdjzZZ4nJodHMJJKrNea/HusIEnI2x+OxTyMmYLW0Rsv?=
 =?us-ascii?Q?9zCcA0ETncAn0bHWJL0pGCXd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060bc2b6-da93-496e-a04b-08d90c44a070
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:34.0184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8BWk8hW4dyRkzwSCAoCICZi3WKkU8pQspvD0Q+ZFQ8FWKDL3kBESI+T/qT8wBtPYuueLCeCxeASXEbUxYpmrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When doing a restore on a different node, the gpu_id's on the restore
node may be different. But the user space application will still refer
use the original gpu_id's in the ioctl calls. Adding code to create a
gpu id mapping so that kfd can determine actual gpu_id during the user
ioctl's.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Change-Id: I8f72afe847c9ef7b25a902b30516e9043f1b5834
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 245 +++++++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  18 ++
 3 files changed, 157 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index ce511b246beb..8e92c68eb9c5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -294,13 +294,14 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 		return err;
 
 	pr_debug("Looking for gpu id 0x%x\n", args->gpu_id);
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev) {
+
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
 		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
 	}
-
-	mutex_lock(&p->mutex);
+	dev = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
@@ -491,7 +492,6 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 					struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_set_memory_policy_args *args = data;
-	struct kfd_dev *dev;
 	int err = 0;
 	struct kfd_process_device *pdd;
 	enum cache_policy default_policy, alternate_policy;
@@ -506,13 +506,15 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 		return -EINVAL;
 	}
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
+		err = -EINVAL;
+		goto out;
+	}
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		err = -ESRCH;
 		goto out;
@@ -525,7 +527,7 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 		(args->alternate_policy == KFD_IOC_CACHE_POLICY_COHERENT)
 		   ? cache_policy_coherent : cache_policy_noncoherent;
 
-	if (!dev->dqm->ops.set_cache_memory_policy(dev->dqm,
+	if (!pdd->dev->dqm->ops.set_cache_memory_policy(pdd->dev->dqm,
 				&pdd->qpd,
 				default_policy,
 				alternate_policy,
@@ -543,17 +545,18 @@ static int kfd_ioctl_set_trap_handler(struct file *filep,
 					struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_set_trap_handler_args *args = data;
-	struct kfd_dev *dev;
 	int err = 0;
 	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		err = -ESRCH;
 		goto out;
@@ -577,16 +580,20 @@ static int kfd_ioctl_dbg_register(struct file *filep,
 	bool create_ok;
 	long status = 0;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		status = -EINVAL;
+		goto out_unlock_p;
+	}
+	dev = pdd->dev;
 
 	if (dev->device_info->asic_family == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_register not supported on CZ\n");
-		return -EINVAL;
+		status = -EINVAL;
+		goto out_unlock_p;
 	}
 
-	mutex_lock(&p->mutex);
 	mutex_lock(kfd_get_dbgmgr_mutex());
 
 	/*
@@ -596,7 +603,7 @@ static int kfd_ioctl_dbg_register(struct file *filep,
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
 		status = PTR_ERR(pdd);
-		goto out;
+		goto out_unlock_dbg;
 	}
 
 	if (!dev->dbgmgr) {
@@ -614,8 +621,9 @@ static int kfd_ioctl_dbg_register(struct file *filep,
 		status = -EINVAL;
 	}
 
-out:
+out_unlock_dbg:
 	mutex_unlock(kfd_get_dbgmgr_mutex());
+out_unlock_p:
 	mutex_unlock(&p->mutex);
 
 	return status;
@@ -625,12 +633,18 @@ static int kfd_ioctl_dbg_unregister(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_dbg_unregister_args *args = data;
+	struct kfd_process_device *pdd;
 	struct kfd_dev *dev;
 	long status;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev || !dev->dbgmgr)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd || !pdd->dev->dbgmgr) {
+		mutex_unlock(&p->mutex);
 		return -EINVAL;
+	}
+	dev = pdd->dev;
+	mutex_unlock(&p->mutex);
 
 	if (dev->device_info->asic_family == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_unregister not supported on CZ\n");
@@ -664,6 +678,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 {
 	struct kfd_ioctl_dbg_address_watch_args *args = data;
 	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct dbg_address_watch_info aw_info;
 	unsigned char *args_buff;
 	long status;
@@ -673,9 +688,15 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 
 	memset((void *) &aw_info, 0, sizeof(struct dbg_address_watch_info));
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		mutex_unlock(&p->mutex);
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
+	}
+	dev = pdd->dev;
+	mutex_unlock(&p->mutex);
 
 	if (dev->device_info->asic_family == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
@@ -764,6 +785,7 @@ static int kfd_ioctl_dbg_wave_control(struct file *filep,
 {
 	struct kfd_ioctl_dbg_wave_control_args *args = data;
 	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct dbg_wave_control_info wac_info;
 	unsigned char *args_buff;
 	uint32_t computed_buff_size;
@@ -781,9 +803,15 @@ static int kfd_ioctl_dbg_wave_control(struct file *filep,
 				sizeof(wac_info.dbgWave_msg.MemoryVA) +
 				sizeof(wac_info.trapId);
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		mutex_unlock(&p->mutex);
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
+	}
+	dev = pdd->dev;
+	mutex_unlock(&p->mutex);
 
 	if (dev->device_info->asic_family == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
@@ -847,16 +875,19 @@ static int kfd_ioctl_get_clock_counters(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_get_clock_counters_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (pdd)
 		/* Reading GPU clock counter from KGD */
-		args->gpu_clock_counter = amdgpu_amdkfd_get_gpu_clock_counter(dev->kgd);
+		args->gpu_clock_counter = amdgpu_amdkfd_get_gpu_clock_counter(pdd->dev->kgd);
 	else
 		/* Node without GPU resource */
 		args->gpu_clock_counter = 0;
 
+	mutex_unlock(&p->mutex);
+
 	/* No access to rdtsc. Using raw monotonic time */
 	args->cpu_clock_counter = ktime_get_raw_ns();
 	args->system_clock_counter = ktime_get_boottime_ns();
@@ -1010,15 +1041,15 @@ static int kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
 		return -EINVAL;
 	}
 
-	kfd = kfd_device_by_id(GET_GPU_ID(event_page_offset));
-	if (!kfd) {
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(event_page_offset));
+	if (!pdd) {
 		pr_err("Getting device by id failed in %s\n", __func__);
 		return -EINVAL;
 	}
+	kfd = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(kfd, p);
 	if (IS_ERR(pdd)) {
-		mutex_unlock(&p->mutex);
 		return PTR_ERR(pdd);
 	}
 
@@ -1026,8 +1057,6 @@ static int kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
 			GET_IDR_HANDLE(event_page_offset));
 	if (!mem) {
 		pr_err("Can't find BO, offset is 0x%llx\n", event_page_offset);
-
-		mutex_unlock(&p->mutex);
 		return -EINVAL;
 	}
 
@@ -1119,11 +1148,13 @@ static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 	struct kfd_dev *dev;
 	long err;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto bind_process_to_device_fail;
+	}
+	dev = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
@@ -1151,15 +1182,20 @@ static int kfd_ioctl_get_tile_config(struct file *filep,
 		struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_get_tile_config_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct tile_config config;
 	int err = 0;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		mutex_unlock(&p->mutex);
 		return -EINVAL;
+	}
+
+	amdgpu_amdkfd_get_tile_config(pdd->dev->kgd, &config);
 
-	amdgpu_amdkfd_get_tile_config(dev->kgd, &config);
+	mutex_unlock(&p->mutex);
 
 	args->gb_addr_config = config.gb_addr_config;
 	args->num_banks = config.num_banks;
@@ -1194,21 +1230,15 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 {
 	struct kfd_ioctl_acquire_vm_args *args = data;
 	struct kfd_process_device *pdd;
-	struct kfd_dev *dev;
 	struct file *drm_file;
 	int ret;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	drm_file = fget(args->drm_fd);
 	if (!drm_file)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
 	if (!pdd) {
 		ret = -EINVAL;
 		goto err_unlock;
@@ -1267,19 +1297,23 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	if (args->size == 0)
 		return -EINVAL;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto err_unlock;
+	}
+
+	dev = pdd->dev;
 
 	if ((flags & KFD_IOC_ALLOC_MEM_FLAGS_PUBLIC) &&
 		(flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) &&
 		!kfd_dev_is_large_bar(dev)) {
 		pr_err("Alloc host visible vram on small bar is not allowed\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_unlock;
 	}
 
-	mutex_lock(&p->mutex);
-
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
 		err = PTR_ERR(pdd);
@@ -1350,17 +1384,12 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 	struct kfd_ioctl_free_memory_of_gpu_args *args = data;
 	struct kfd_process_device *pdd;
 	void *mem;
-	struct kfd_dev *dev;
 	int ret;
 	uint64_t size = 0;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
 
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
 	if (!pdd) {
 		pr_err("Process device data doesn't exist\n");
 		ret = -EINVAL;
@@ -1374,7 +1403,7 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 		goto err_unlock;
 	}
 
-	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd,
+	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->kgd,
 				(struct kgd_mem *)mem, pdd->drm_priv, &size);
 
 	/* If freeing the buffer failed, leave the handle in place for
@@ -1397,15 +1426,11 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	struct kfd_ioctl_map_memory_to_gpu_args *args = data;
 	struct kfd_process_device *pdd, *peer_pdd;
 	void *mem;
-	struct kfd_dev *dev, *peer;
+	struct kfd_dev *dev;
 	long err = 0;
 	int i;
 	uint32_t *devices_arr = NULL;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	if (!args->n_devices) {
 		pr_debug("Device IDs array empty\n");
 		return -EINVAL;
@@ -1429,6 +1454,12 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	}
 
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
+	if (!pdd) {
+		err = -EINVAL;
+		goto get_process_device_data_failed;
+	}
+	dev = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
@@ -1444,21 +1475,21 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	}
 
 	for (i = args->n_success; i < args->n_devices; i++) {
-		peer = kfd_device_by_id(devices_arr[i]);
-		if (!peer) {
+		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
+		if (!peer_pdd) {
 			pr_debug("Getting device by id failed for 0x%x\n",
 				 devices_arr[i]);
 			err = -EINVAL;
 			goto get_mem_obj_from_handle_failed;
 		}
 
-		peer_pdd = kfd_bind_process_to_device(peer, p);
+		peer_pdd = kfd_bind_process_to_device(peer_pdd->dev, p);
 		if (IS_ERR(peer_pdd)) {
 			err = PTR_ERR(peer_pdd);
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-			peer->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
+			peer_pdd->dev->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
 		if (err) {
 			pr_err("Failed to map to gpu %d/%d\n",
 			       i, args->n_devices);
@@ -1477,12 +1508,10 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 
 	/* Flush TLBs after waiting for the page table updates to complete */
 	for (i = 0; i < args->n_devices; i++) {
-		peer = kfd_device_by_id(devices_arr[i]);
-		if (WARN_ON_ONCE(!peer))
-			continue;
-		peer_pdd = kfd_get_process_device_data(peer, p);
+		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
 		if (WARN_ON_ONCE(!peer_pdd))
 			continue;
+
 		kfd_flush_tlb(peer_pdd);
 	}
 
@@ -1490,6 +1519,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 
 	return err;
 
+get_process_device_data_failed:
 bind_process_to_device_failed:
 get_mem_obj_from_handle_failed:
 map_memory_to_gpu_failed:
@@ -1507,14 +1537,9 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	struct kfd_ioctl_unmap_memory_from_gpu_args *args = data;
 	struct kfd_process_device *pdd, *peer_pdd;
 	void *mem;
-	struct kfd_dev *dev, *peer;
 	long err = 0;
 	uint32_t *devices_arr = NULL, i;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	if (!args->n_devices) {
 		pr_debug("Device IDs array empty\n");
 		return -EINVAL;
@@ -1538,8 +1563,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	}
 
 	mutex_lock(&p->mutex);
-
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
 	if (!pdd) {
 		err = -EINVAL;
 		goto bind_process_to_device_failed;
@@ -1553,19 +1577,13 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	}
 
 	for (i = args->n_success; i < args->n_devices; i++) {
-		peer = kfd_device_by_id(devices_arr[i]);
-		if (!peer) {
-			err = -EINVAL;
-			goto get_mem_obj_from_handle_failed;
-		}
-
-		peer_pdd = kfd_get_process_device_data(peer, p);
+		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
 		if (!peer_pdd) {
-			err = -ENODEV;
+			err = -EINVAL;
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-			peer->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
+			peer_pdd->dev->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
 		if (err) {
 			pr_err("Failed to unmap from gpu %d/%d\n",
 			       i, args->n_devices);
@@ -1694,23 +1712,26 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	void *mem;
 	int r;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		r = -EINVAL;
+		goto err_unlock;
+	}
 
 	dmabuf = dma_buf_get(args->dmabuf_fd);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
-
-	mutex_lock(&p->mutex);
+	if (IS_ERR(dmabuf)) {
+		r = PTR_ERR(dmabuf);
+		goto err_unlock;
+	}
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		r = PTR_ERR(pdd);
 		goto err_unlock;
 	}
 
-	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev->kgd, dmabuf,
+	r = amdgpu_amdkfd_gpuvm_import_dmabuf(pdd->dev->kgd, dmabuf,
 					      args->va_addr, pdd->drm_priv,
 					      (struct kgd_mem **)&mem, &size,
 					      NULL);
@@ -1744,13 +1765,19 @@ static int kfd_ioctl_smi_events(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_smi_events_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpuid);
-	if (!dev)
+	mutex_lock(&p->mutex);
+
+	pdd = kfd_process_device_data_by_id(p, args->gpuid);
+	if (!pdd) {
+		mutex_unlock(&p->mutex);
 		return -EINVAL;
+	}
+
+	mutex_unlock(&p->mutex);
 
-	return kfd_smi_event_open(dev, &args->anon_fd);
+	return kfd_smi_event_open(pdd->dev, &args->anon_fd);
 }
 
 static int kfd_ioctl_set_xnack_mode(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d3265860e78b..b2ea00e7309f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -930,6 +930,9 @@ int kfd_process_restore_queues(struct kfd_process *p);
 void kfd_suspend_all_processes(void);
 int kfd_resume_all_processes(void);
 
+struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *process,
+				uint32_t gpu_id);
+
 int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file);
 struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index bbf21395fb06..604b2b398be2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1424,6 +1424,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->runtime_inuse = false;
 	pdd->vram_usage = 0;
 	pdd->sdma_past_activity_counter = 0;
+	pdd->user_gpu_id = dev->id;
 	atomic64_set(&pdd->evict_duration_counter, 0);
 	p->pdds[p->n_pdds++] = pdd;
 
@@ -1897,6 +1898,23 @@ void kfd_flush_tlb(struct kfd_process_device *pdd)
 	}
 }
 
+struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *p, uint32_t gpu_id)
+{
+	int i;
+
+	if (gpu_id) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
+			if (pdd->user_gpu_id == gpu_id)
+				return pdd;
+		}
+
+		WARN_ONCE(1, "Failed to find mapping for gpu = 0x%x\n",  gpu_id);
+	}
+	return NULL;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
