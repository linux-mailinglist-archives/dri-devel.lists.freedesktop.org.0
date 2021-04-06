Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4E354A7B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880B46E54C;
	Tue,  6 Apr 2021 01:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581796E22F;
 Tue,  6 Apr 2021 01:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjE4eZQwExl3nGyDvou234WG9fpxYRGc3CkIlUrOLJ9OftIrWZ/jkOKH83JLj0WDLPAQP8gInhvq9xOW+qNbENwUq+EEQ64aF/obqqmiZZtd75T3d+b44wdR+QHuofx6REObJyeBa7ackEaTpT7LcWDFK/6yc3iEr3F0XfvyUP+zlnn1FdXfYeEzR87ImyfMGrEAgnOKLBvrlGzkNZlJJdTrQPtLv74Wq+YQ2XK7htA1+vxp3qqh6NKAlGA16Z5ZsxLIxMk2hTBj280S26UI5hCy8ZS80o0XUXbqfM5ryRI3qZ0kujzqBQZf+bNx1CtDProv4JIF8ucFc9RRpjMzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVWP1WLlBmfpqL7qphhHvUsjdSQOpI643oNlzmXbvc=;
 b=Yy74F6kvwl0vPT0LxTxAsqudgmbiolqH264bao008v7johswq9XKSBoMBdxeu4jgAukj8XmkBSAxZ/kG88ftD4xo4SWy+d2Nbh7jAGmfCIx3fpWmYJSA8PPFAg9LFecMC70s5GABR6uvcrH+bhhWY35fE9OJl7ApkPzxKTXHvSoOpqQhTBHEQHtwxJTtz8zmYwiFYEc0Vp0nxdrZ2ylOZf0NxEd1Srblao1WrDp3r/c9lfekdjDEo3uUAAezy0nPZ0KaHy2nQ9adDkL6zsEG3rU+vdexFoQTPfWGMAxrrx2lnMlbeVmenNSwBISVBHreDBxSlIlRP3frMgF+yqf12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVWP1WLlBmfpqL7qphhHvUsjdSQOpI643oNlzmXbvc=;
 b=rao4DSbULNIdnqBZinipSpBaqKPHXZ3PGQJX4jlI3nGAfsqqCb+QMNGa/CDso48BQ8MIx6SxfvMWBUWLWm+Mk2qkyoypz+aoYi4F8DMIEqc2bI3vNUuaHTEYA3sNetEgT4OwMu8z7B4NAa0COnaagcPh4dN+DNiOXU0s+Vy52UU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 01:47:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:01 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/34] drm/amdkfd: add ioctl to configure and query xnack
 retries
Date: Mon,  5 Apr 2021 21:46:09 -0400
Message-Id: <20210406014629.25141-15-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b331aa38-0cdc-432d-8bb7-08d8f89ddf09
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206A5E331E683E012EDF60292769@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwXulUryp3/hX8LOqIqQ7FvlUXmE3WIKWhWJM+js9Zbzr/M3TFHJjvjcc/g+0tOITyMLbfDg4oS7GydjBVl3H08gTHArftRqrmaB39f0U2WY17dKIsvwgiTasKaESSmWjrc7tm3VOC/rdxHtj5iOFdJ1ThKlUnSKxmxT5AwKujKTZxe3NTCe8vT/F1RiYpHUWYz+CYwKSvnlxiHkdz+MWn4RiA0RQ0Q4gP5OT3p7VuTZb/KNacJhAZ/Ktd0OBVLiqfNu7i2pBJC/QSaQVjSO9XXI0IfLX9ZHIRKaYLcusbzhmsg1Ra9GHC8F7Ra0Gw6+leTWibz7+mQJTNhsfwVoIop9gFA2jzcTX/2ZBtq8T4vU7QOIpcWm7lb8Pe/Gqp8JSP3Euo3v0N1yo38GQA75qxIcoyr30bZtqqvoT9eW6qJ3UDohptGKeYgMntuDRD2Rd/iSrMq2ya4l1IjWFAdhoEccSAz2hzKqXPypJ4sjBiWaihaiEBlu7W78Av44/kRzGI9eIyAQTFes3mBDiIscr+/41lhUXbqfISVqoZsRYf50IX3ZtzNdCJhwaYd/F6w/l+iRCy/NxbROMCkN0f18rWpCoanil9jg3HeNORD1N8lJPaBv0VkbjVnOiiCUyXVY1/gvNTviOAobz10G6dOU0GIkORLWgX96q4oNmtGCr9CWOSs55tRNb07dS308r5T9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(186003)(8936002)(38100700001)(7696005)(52116002)(956004)(36756003)(2906002)(478600001)(316002)(6486002)(16526019)(26005)(1076003)(8676002)(66556008)(66476007)(86362001)(4326008)(5660300002)(66946007)(2616005)(83380400001)(450100002)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lQu9EjK5e075YWcuGHZGqat8U7XJ1uL+gp11Nt+JaXMzA5+HGsHEtPP7Axmo?=
 =?us-ascii?Q?R0Hhkdo5C4N4vfrVyMPvaQQ8l2L9mYlQtDfdeCwNsyYMQrpDObUzu7Jogdp/?=
 =?us-ascii?Q?DGlRMtPgQAM8jS5GG4nZxBTbZrsMcQ86FHNaiPZaBpgbbaKLpe42eVHq/FVs?=
 =?us-ascii?Q?UbURcACjO0PjQBgdhfty+pkRII4d6cuxk6WNqbpevAvf4QEOEDdjWWSFW+FF?=
 =?us-ascii?Q?KHBqTkC3Fb5lNIIQ5M0pEOCYfYlpsVSlESeV5JoRpfwjF9WLep6g47co9ZHf?=
 =?us-ascii?Q?GVk4hqNEL56UfJ7UzTnqYL79VEDXVoozlEa6i8ByjR4zTg/cI4qw1ygBL8S5?=
 =?us-ascii?Q?7F3D4/7yW8maw9Nwe0wRiYgRSZkAFV3BJLFPgUm2SEaIia3cCQiEx5tMC8+i?=
 =?us-ascii?Q?h/CIY+YaktVsO6bBaQFa1v9qIYQ+38ah7XmPst7SYUb/U/0JP9t8gGfmbynY?=
 =?us-ascii?Q?6CX6s/gLT+H8vShXzB4Oop3l0+Fj3oRNKIaMZXYJUbn6QvQlJfPj6KArvebk?=
 =?us-ascii?Q?yGTwIKBuOLTcB331XyXlWwjvMio/gmBxldc7MC0XJJrYZ9Wk2lDaFO8P8TmO?=
 =?us-ascii?Q?vfCmDJJZqHuGZrcYI9XjQxJhdij5rlaKKriDlYBQAQwXse4gYwHSj2zUUtD7?=
 =?us-ascii?Q?aZ70d0UhZApzvSDaj1IeuTHg3mAgHo7V+OejoG27dtRwB4BbqMyGcemvgOGr?=
 =?us-ascii?Q?DgqNSRsKRKI5YhpG+DW9VbQpftcs8ODV2GBz7++xYW5yNkKTJU5HPckfezmf?=
 =?us-ascii?Q?u+zjxEASsZkXJ8Z+rjPUcewi4Ps4hekx43VBLgJnPTFr5MBNI0KoTdXv8kPP?=
 =?us-ascii?Q?l69a540EU0fgx6NDwM6YDSUxDkFf+43JOPTPDJeVHuf2b9mBc7vZ59C/ORCu?=
 =?us-ascii?Q?5H/nDgNJ7b/zMBfi0s6Fo5FC4wyGRb/DuQ/Khz8U+e7HFpmo5jxKJe39VGnf?=
 =?us-ascii?Q?8suCfvqhv+8UV7Jb/Ft6WtZ2CL5uWQNJmvhhHNRHkT9GShAhMeJdNzcaBKRC?=
 =?us-ascii?Q?rEN1KkwjZrlnTOkp5QeLJz0zmxp8UPelwgnsfGRyGylw5eAjdTDvf9fFAmSQ?=
 =?us-ascii?Q?xN2EtdAOSRqYu8Pj33Wxktkd4isB7kHcKnrRIrF+gNb2AUO98/Yv7krv7HV5?=
 =?us-ascii?Q?Gwj/mINnTwvScEEc70xzwidTnNo06nN7jFKJRbPuRD3ar1qWkoDJt59wGQJE?=
 =?us-ascii?Q?hjhzRL4rUFlBRP4gnTMJyn12KC3TH+E5+jf2F2+wVpOOcnvemsjVSE6MtWet?=
 =?us-ascii?Q?QG7Gk6+KTu4owcRARc1tjubjyGap093laoCJoqvQxNKX8CsQvTjpgSLIlKqh?=
 =?us-ascii?Q?g6s+aSLO0EkI5mPkMET6KmLQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b331aa38-0cdc-432d-8bb7-08d8f89ddf09
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:01.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpwLq4YhbRZruZ0aVVNzYROVZh83KHjgEmgAGQ7EoRCxxj1z6/2J2pRVGSAbVivOhCmZAO5ohlN0r77CVAl16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Xnack retries are used for page fault recovery. Some AMD chip
families support continuously retry while page table entries are invalid.
The driver must handle the page fault interrupt and fill in a valid entry
for the GPU to continue.

This ioctl allows to enable/disable XNACK retries per KFD process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 28 +++++++++++++++
 include/uapi/linux/kfd_ioctl.h           | 43 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9511826ac8ae..9838d0cd1f51 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1743,6 +1743,31 @@ static int kfd_ioctl_smi_events(struct file *filep,
 	return kfd_smi_event_open(dev, &args->anon_fd);
 }
 
+static int kfd_ioctl_set_xnack_mode(struct file *filep,
+				    struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_set_xnack_mode_args *args = data;
+	int r = 0;
+
+	mutex_lock(&p->mutex);
+	if (args->xnack_enabled >= 0) {
+		if (!list_empty(&p->pqm.queues)) {
+			pr_debug("Process has user queues running\n");
+			mutex_unlock(&p->mutex);
+			return -EBUSY;
+		}
+		if (args->xnack_enabled && !kfd_process_xnack_mode(p, true))
+			r = -EPERM;
+		else
+			p->xnack_enabled = args->xnack_enabled;
+	} else {
+		args->xnack_enabled = p->xnack_enabled;
+	}
+	mutex_unlock(&p->mutex);
+
+	return r;
+}
+
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_svm_args *args = data;
@@ -1869,6 +1894,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 			kfd_ioctl_smi_events, 0),
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
+			kfd_ioctl_set_xnack_mode, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 247b57baa94f..3cb5b5dd9f77 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -597,6 +597,44 @@ struct kfd_ioctl_svm_args {
 	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
+/**
+ * kfd_ioctl_set_xnack_mode_args - Arguments for set_xnack_mode
+ *
+ * @xnack_enabled:       [in/out] Whether to enable XNACK mode for this process
+ *
+ * @xnack_enabled indicates whether recoverable page faults should be
+ * enabled for the current process. 0 means disabled, positive means
+ * enabled, negative means leave unchanged. If enabled, virtual address
+ * translations on GFXv9 and later AMD GPUs can return XNACK and retry
+ * the access until a valid PTE is available. This is used to implement
+ * device page faults.
+ *
+ * On output, @xnack_enabled returns the (new) current mode (0 or
+ * positive). Therefore, a negative input value can be used to query
+ * the current mode without changing it.
+ *
+ * The XNACK mode fundamentally changes the way SVM managed memory works
+ * in the driver, with subtle effects on application performance and
+ * functionality.
+ *
+ * Enabling XNACK mode requires shader programs to be compiled
+ * differently. Furthermore, not all GPUs support changing the mode
+ * per-process. Therefore changing the mode is only allowed while no
+ * user mode queues exist in the process. This ensure that no shader
+ * code is running that may be compiled for the wrong mode. And GPUs
+ * that cannot change to the requested mode will prevent the XNACK
+ * mode from occurring. All GPUs used by the process must be in the
+ * same XNACK mode.
+ *
+ * GFXv8 or older GPUs do not support 48 bit virtual addresses or SVM.
+ * Therefore those GPUs are not considered for the XNACK mode switch.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+struct kfd_ioctl_set_xnack_mode_args {
+	__s32 xnack_enabled;
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -699,7 +737,10 @@ struct kfd_ioctl_svm_args {
 
 #define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
 
+#define AMDKFD_IOC_SET_XNACK_MODE		\
+		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x21
+#define AMDKFD_COMMAND_END		0x22
 
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
