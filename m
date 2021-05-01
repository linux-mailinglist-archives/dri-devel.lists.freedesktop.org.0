Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414D3704D4
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194416F637;
	Sat,  1 May 2021 01:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17956F636;
 Sat,  1 May 2021 01:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnFrHVi+qam7t0yeEEeG+v5+cXgcGpyR5D8kcLWfpw6yAdLxtAPkLo2iV4Am2twOWaoIrzfRuOC1c9jX8fD2CxwmQLOcy6QtNoRnjD8bsh/cnYjYjSlcocPBy6UlVrRP6xwCN0enN9/3zDKbfAU81e/FfWAHEZKu49rHFZ9gy8X5AJFjjdeIGwdc7TZm+ge/fIZtHxzVmg9tov85uDu4AtZnva3W3GTElVErVMA1BU00SmGJ9/r8YNhvhqRMvn2k/7DM2LzwXRoVhxdXTeJmK6RiTejLP9YS+Si9PzhV7A1if96kfjbi+e7hJOS542H/vYa+S9RQL8S7SXlytZ6EUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3q/MjEL1tMUIjXd7tzk38queuoj3wKPes59TV2J/J8=;
 b=L7n1lbVXZqB6SZeWwQHm+Xi1yNFe5Vo46eKplfG4pwO+jzmPCDsbtv881D3uqRGg5+QDvZ+ojEWHbQ+nUgq0LEEMAXBzx4fXNJLdIjEoL6CUNC3kSh7O2YTCVu1vwerhgwF/85B1DMu1996bB/2oJLAMbzTqxd/5e8aaovUW7PpTQLVCh+m9ggjcUK4Dvlfn33fX1BADUFOvQDbpIZ5rqUvWODTGhQU9dnHj3rR+s+yt4pd7CRURlBcGFSjkkQ78bAjJ86W6KmJnzvUz8Y6ktXoLYphm0I8ZAFt45froiayORrl4zdUYCtcN565WODXS02qpILStc2YhkJRqeNUXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3q/MjEL1tMUIjXd7tzk38queuoj3wKPes59TV2J/J8=;
 b=aGSpeGyDcYeFGZ6i6Rhd8PXDi8CNTIwDFLrPEHFetfV+gYqZ+oX643LrWJptfpHjveKAP1TO53oYSn9KjGdLY9bQx/K++gKQW9Y7UIUtEy53pJ0zAIT5Ul6Y/O8lPOTtR7O1nrhMo/wPu8f/uGi/HS2Zyxu2Sfi5PpFvOowx2sQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:27 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:27 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 10/17] drm/amdkfd: CRIU restore sdma id for queues
Date: Fri, 30 Apr 2021 21:57:45 -0400
Message-Id: <20210501015752.888-11-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f07178-386d-47d0-7130-08d90c449c91
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48989319777DE30507BF78E3925D9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNPOffaSKZ8sGgdkH/+778IBgicE/8AoHp4nT6ILXuRtG9B3oMA1BBQ6Fe0F6vE1Ctlr77MDZDIlLjPNoDxpt8LShgrJEGSMjZweb5YiytWUdMwB5w0DsFvGVwDSNw4kFDb30LAozLfJWkBqNmQ1/bnB/AJRyZmjWP7pCOP8TEmmo0Kvkh89wNbZKmxWRq5c3lu7LxL5YdD3TfNuc6fbTPUuJF9g1PJ1aXHEkiPXrQxcy8XmlZLcHFM+j88lTaQMQQvovjjro4RkUj+nvSXzz91a/Ejq+/wSXWDsKn9RCCtf5fy+YR/LHZVART4QQRvx4TLwJOYeDgrta0DI+NkFaZVofMpi/c8DE41ATe6whdPDVEs6SacCacVZKCWVbWm47qBbZGILNV74Vx+UjDqvJhc1iwUFVCo8LO7bdq/7XEs8gkubvvEufCeHfdnIcGHHG/oelchTvMK1jQAxTn1V4BYoMm9xu9NiQoqGJg4GashKxYZPgHFGURIl0/fa0y+8u4zO3ck3HmPZV6f/fTeIJK4iUiP58TURT2UYNh1d9fRzw6j6gC+qIgjpd9kirh3WazF8WT3AH/Vnuxs9ZNy+MI2igazYzK6vC4/GF3hbVWEv5Xq9ZUG9El6YkPwsexo7WpoRoQ3aLC9+G0ux5eDP+TaO79wSK0f2zliE6MB60VRw5MwAGhCLim7gcY7GKbK6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(36756003)(66556008)(66476007)(66946007)(6512007)(86362001)(8936002)(52116002)(478600001)(5660300002)(8676002)(6506007)(6666004)(38350700002)(38100700002)(2616005)(450100002)(4326008)(83380400001)(1076003)(2906002)(26005)(16526019)(6486002)(956004)(316002)(186003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aCjfFLHuB2SgN9suZ9y0nbIRi8yZpeyChLejRnBRN/+mqQGyOQh0eF6ljX1o?=
 =?us-ascii?Q?czLmyMdaVVQ8jK1WuSMdr+LdGt1SNDykVKi5TfQGMT3QjlRdQS5oOBIH6l+E?=
 =?us-ascii?Q?mwf16Myi7pCIzRI6n/sWNhwOnQRRNEhJH+Ef6rflEWt/qcaR39YxnFhuNJZ+?=
 =?us-ascii?Q?B7wgitGANb/CJ1izalGLK+RlxGx8/eS7n2lXfcnKlayHeI5fHYWa03AyC4/h?=
 =?us-ascii?Q?3ezNDpA92GUyBY3a+yVSuPfKypbYNnVf+glW9k3yu3SH7NSWhXbm7OZmQZHc?=
 =?us-ascii?Q?Cv8mtEO6/FibR4DWZzaPvHMOCarjPmDkTCGCJET05ZmlYr968xQHUPhbSFhK?=
 =?us-ascii?Q?XhvCtzQWHvrMlOu/GAGdmrtzkg8PM8DrLcU9Tpt3DX1QSDdHTHnXZiFAxEuu?=
 =?us-ascii?Q?LzI59xnfWTXWNg4aq9RLg7s/PGZ2eSmKbYN2NFPpE2RZW+wcCbA6okWdP73z?=
 =?us-ascii?Q?jUiOpeeKRXsjaWgdSHB9bNdQGqubWr4jg+XaYtXAhK/sZCvMtoWXg5pJFv90?=
 =?us-ascii?Q?ZR9UuAKZr0LnX1VRkWQvIRrakWZYelG336KRPslPNyPCYO2QviV6d9S9nwYW?=
 =?us-ascii?Q?qFspLn1Jsh9h6VNPVU9klPwJ+s43CqpyOvGLByb1WJ7Z6aUwcz9GNESurUBw?=
 =?us-ascii?Q?U5bUKKeL9ijUiKs1V72E5ruKtmYYrFsgLSgBmECh8JoNPvwZH26h77qjA31S?=
 =?us-ascii?Q?TmC8tgc6fhKZPlgICWZWIJ1kN39pwM/z6y3V/omxRLz5zHVeBEISYvhCn/Du?=
 =?us-ascii?Q?+gECWz9YI/zfyYpo7IuZwEDM0D3+PCJskMaY7U+FG7Ccwdbg+KYiCcOkSkQM?=
 =?us-ascii?Q?HEnBUmSkGhU+JPt9qKkJEyNlBrWd1Dm/odYmkPz8jjDWb7Mk2IA02nCLBe0x?=
 =?us-ascii?Q?Rif+Uifli9EbpaHI3ozEDQhPinLnFEsIGjDymr7tzISsnrQU2O5jPMqeelwy?=
 =?us-ascii?Q?S5IOlwwFRcIdr6wLNRBPBbd600WQxWkguVzkrzBtBa5JHqwrgr4axkAGPkh7?=
 =?us-ascii?Q?sSO0UntfZHWN8lXNyh4PM0gmaNF4WRb8Th4skErqo+hxp4w/NfMHOGfiE9sa?=
 =?us-ascii?Q?Ccv/yqw0hB35GvMOVhaXuOZsXKyF359eaB9cW+ZU1XEI2Tzb5GZ2JIcPvCUD?=
 =?us-ascii?Q?bG8zXKgnFax3+HfcrtevFRIysJLCpezDbZ3o3DiLuLsNYv/73F4dGr5MrccZ?=
 =?us-ascii?Q?i85DcXkozSNvCvqdI8FKNlL58/F5SJ1AJC4BEX7OtYs8t/VQrU3OMIj3Gtju?=
 =?us-ascii?Q?24dZ1Ex6qcXW3nUmrlMxmetC86jAVtClbBqqyFUDxHJ4Gz2eqdUDOC4bwUvo?=
 =?us-ascii?Q?+0Qi1xLbEHYyM+z4ultxxp4E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f07178-386d-47d0-7130-08d90c449c91
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:27.7376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWi5aBEJd3ssFFYiELKC/yGTd4wkM7AU3kOWjECshoFVMuJt8QDHCZcAWSnbbtYuFNnP6AOFLp72I8sT6MVWQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: David Yat Sin <david.yatsin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same sdma id value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I8ed667edb8b9b7b5089e59b78de9be80493a2808
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  1 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 48 ++++++++++++++-----
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
 .../amd/amdkfd/kfd_process_queue_manager.c    |  4 +-
 5 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a21d32ff0730..afcbdae436fa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2152,6 +2152,7 @@ int criu_restore_queue(struct kfd_process *p,
 	print_queue_properties(&qp);
 
 	qrd->qid = q_bucket->q_id;
+	qrd->sdma_id = q_bucket->sdma_id;
 
 	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, qrd, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 98c2046c7331..cabdfbacce37 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -58,7 +58,7 @@ static inline void deallocate_hqd(struct device_queue_manager *dqm,
 				struct queue *q);
 static int allocate_hqd(struct device_queue_manager *dqm, struct queue *q);
 static int allocate_sdma_queue(struct device_queue_manager *dqm,
-				struct queue *q);
+				struct queue *q, const uint32_t *restore_sdma_id);
 static void kfd_process_hw_exception(struct work_struct *work);
 
 static inline
@@ -296,7 +296,8 @@ static void deallocate_vmid(struct device_queue_manager *dqm,
 
 static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
-				struct qcm_process_device *qpd)
+				struct qcm_process_device *qpd,
+				const struct queue_restore_data *qrd)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -336,7 +337,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 			q->pipe, q->queue);
 	} else if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 		q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
-		retval = allocate_sdma_queue(dqm, q);
+		retval = allocate_sdma_queue(dqm, q, qrd ? &qrd->sdma_id : NULL);
 		if (retval)
 			goto deallocate_vmid;
 		dqm->asic_ops.init_sdma_vm(dqm, q, qpd);
@@ -1022,7 +1023,7 @@ static void pre_reset(struct device_queue_manager *dqm)
 }
 
 static int allocate_sdma_queue(struct device_queue_manager *dqm,
-				struct queue *q)
+				struct queue *q, const uint32_t *restore_sdma_id)
 {
 	int bit;
 
@@ -1032,9 +1033,21 @@ static int allocate_sdma_queue(struct device_queue_manager *dqm,
 			return -ENOMEM;
 		}
 
-		bit = __ffs64(dqm->sdma_bitmap);
-		dqm->sdma_bitmap &= ~(1ULL << bit);
-		q->sdma_id = bit;
+		if (restore_sdma_id) {
+			/* Re-use existing sdma_id */
+			if (!(dqm->sdma_bitmap & (1ULL << *restore_sdma_id))) {
+				pr_err("SDMA queue already in use\n");
+				return -EBUSY;
+			}
+			dqm->sdma_bitmap &= ~(1ULL << *restore_sdma_id);
+			q->sdma_id = *restore_sdma_id;
+		} else {
+			/* Find first available sdma_id */
+			bit = __ffs64(dqm->sdma_bitmap);
+			dqm->sdma_bitmap &= ~(1ULL << bit);
+			q->sdma_id = bit;
+		}
+
 		q->properties.sdma_engine_id = q->sdma_id %
 				get_num_sdma_engines(dqm);
 		q->properties.sdma_queue_id = q->sdma_id /
@@ -1044,9 +1057,19 @@ static int allocate_sdma_queue(struct device_queue_manager *dqm,
 			pr_err("No more XGMI SDMA queue to allocate\n");
 			return -ENOMEM;
 		}
-		bit = __ffs64(dqm->xgmi_sdma_bitmap);
-		dqm->xgmi_sdma_bitmap &= ~(1ULL << bit);
-		q->sdma_id = bit;
+		if (restore_sdma_id) {
+			/* Re-use existing sdma_id */
+			if (!(dqm->xgmi_sdma_bitmap & (1ULL << *restore_sdma_id))) {
+				pr_err("SDMA queue already in use\n");
+				return -EBUSY;
+			}
+			dqm->xgmi_sdma_bitmap &= ~(1ULL << *restore_sdma_id);
+			q->sdma_id = *restore_sdma_id;
+		} else {
+			bit = __ffs64(dqm->xgmi_sdma_bitmap);
+			dqm->xgmi_sdma_bitmap &= ~(1ULL << bit);
+			q->sdma_id = bit;
+		}
 		/* sdma_engine_id is sdma id including
 		 * both PCIe-optimized SDMAs and XGMI-
 		 * optimized SDMAs. The calculation below
@@ -1269,7 +1292,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 }
 
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
-			struct qcm_process_device *qpd)
+			struct qcm_process_device *qpd,
+			const struct queue_restore_data *qrd)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1284,7 +1308,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 		q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
 		dqm_lock(dqm);
-		retval = allocate_sdma_queue(dqm, q);
+		retval = allocate_sdma_queue(dqm, q, qrd ? &qrd->sdma_id : NULL);
 		dqm_unlock(dqm);
 		if (retval)
 			goto out;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 71e2fde56b2b..a5baf50fd6dc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -86,7 +86,8 @@ struct device_process_node {
 struct device_queue_manager_ops {
 	int	(*create_queue)(struct device_queue_manager *dqm,
 				struct queue *q,
-				struct qcm_process_device *qpd);
+				struct qcm_process_device *qpd,
+				const struct queue_restore_data* qrd);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d21b7eb08a76..bd518340c38c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -471,6 +471,7 @@ enum KFD_QUEUE_PRIORITY {
 
 struct queue_restore_data {
 	uint32_t qid;
+	uint32_t sdma_id;
 };
 
 struct queue_properties {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index cb136e13baff..0ca7db288b9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -272,7 +272,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, qrd);
 		print_queue(q);
 		break;
 
@@ -292,7 +292,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, qrd);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
