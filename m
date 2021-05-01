Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C093704C8
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C246F627;
	Sat,  1 May 2021 01:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0DC6F624;
 Sat,  1 May 2021 01:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3rmGNt2cXa1iIrV9+RWh+dqtGMqt38ECGuXO6qKLO7TwTw4NoI4kBgtVaj2ai/aoBgb1tDpiFskEL1AJCShL7FWz7xRkilVnDtKd4+Lr6YriVeGWjuRomWnd+Pmyye/8DgxnY5vvKxqusnnd0BQD6ibAqTUTtjFt7zyD+IX8UzB3BRLBzmC9Uqa9F48E+1vho/WvCDI2vfAER6RTBD37SXizWLLe+oBvF2HUWIMa7b5x/y7qBFjuezUTJFR4TZu6KEvpkJ4I2wL5LAHijC9e7VT4qOtFaEaozKh62sTjUj7rpWN9kS6zh1pYA4yRTYy9nGQ+r5xeMZXzxQmnKAhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZtBg1o6o4VoLsm3mvQqAex5ekmH5ZeWXTZahq+fP5o=;
 b=S2hwC5rfwVi6mhK2M78w3YVKWsJuvCsLu3CRxWE0zcJZcnVBvziwNQS3+aanw3Nn5sPyy9u5bJ8BeC8dM4br+/EN3aSSaT03yDJBvLIGtRblPd5/QWINXUUvtcGivado9v//J8Z2HlY1ohut0+Ce2syXzdLNWGP/CEg4yl21hOqgfwXQ5eDPvALBctqMYbEMuKErxjqVb/3vCC4nZYFowEjKRyhZBNoYEgV7YO3YRSeOA3yynvUd+6nCelMhp5OB7FlxO9LIOcWG3JoGKDXu0Fbn4PU7iamdyAlhMVEwOsUA+Ail2D6zAmrz8hUw5XrHjmeiBwsDo9rJkU3PmIZ8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZtBg1o6o4VoLsm3mvQqAex5ekmH5ZeWXTZahq+fP5o=;
 b=S7if88dS3Drd5CCVI6YNQAld1oi65u/wOTVc8hlZnZ4xNLWI1KJC2QEQrnw8hc5j3h9gimA4E/rKrJ/b10nT/CzozenEL1qLv/gsdVsv6lPZytOjRf6s0Nq7KLDTdJlbJ6Ot0WOM+CUhqzy7LUoLLM70Bjv0n2QKrl3iPvBcuHU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:20 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 03/17] drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
Date: Fri, 30 Apr 2021 21:57:38 -0400
Message-Id: <20210501015752.888-4-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51b3a221-f570-478b-e815-08d90c449847
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41423E447DA3C1D46FCE47F0925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wIisM7NDG19Qy9CUbkOWQNs8J/ktocR1RZtHKPljCf2UEGE8ltle3CCtXiOOZMlT9Prge48F7R5xHuI4WQgOOLdi08KzA9z/9fNbibdZpGRA4ex8esAg3IU6TPAPqjPMl06OJadEYMA/i7P4tmJ/ZMUgYthcSkeC5ItTI2Mgm/nnEUgj53SPlHKOc9XfO64Z1Duv4JqQMJ0KFx9hZcZ1DyXYz9Adpj7tVTU5f3kkbm5VTnraykwftgmG/VrdtPOH8MuDYB1WiI8AKf3Y7ROs3t5ILNSbmuUoCOCKvLA90W/lj7al+VPIdzhJWLiILwH3nKFSYfFNcWuMli7CQNj/nIzYSOFpRwA+e586+smAMJNWRHAqFeDycTb7BiPRKFyUjH39XsnMcK+7709Zr9j0cdEbV1TRr0sbOcCDUveHmyBIPPH4qg8z/4ZPa2Pe8M/pI95MSAXOkWcu5XxJB/eHsdczIeQbEorro4E9n53BT3EOhBBpSJ004cBk6nh9zjRdnK13mJg3LJr1MbecbV/InnK7d0Uo2mw6a5f3dS7u2UkMpEUeF5TwEdWLAlk3YQsSMTH0SKJ7WWZWnymcKpqSfI26FqW1STtWwFInmv/VmsVfpjNQU3yK3uwI7Di9TgcMtCto3gAA+mW4DgeHA+T3VGHIo+pNMJm8l3dEeqxNcT+8r4Z9yHJq9MCU97c/gIl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(54906003)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PLj6MVzJd7aY2/Zngos6326drFZ3/ijehLwjNX83DyGtKmpt7fREvFHjqpe1?=
 =?us-ascii?Q?pP/6FzPis7DpvMr9nR6jJQL/gTFY4oze2jMb0MkpFZW4Vw5Ey+vvkMVtccq4?=
 =?us-ascii?Q?HTS8/2Bq1V6U0PqJyR3SEYAnt6LvXaufCVR2lPVAIWXeJIwkCzi6H3bvprO9?=
 =?us-ascii?Q?OyhFOI1i+o+req2ain/Gad2h0v0gNJEtC4jkzMTfvCJtRJo8AZlaP1BrqKkB?=
 =?us-ascii?Q?QoduuLW6iaUh2lnDarwsdR937A/wJ1UhnYfL7ZdJwQjuroouDj/OFRsj/uQp?=
 =?us-ascii?Q?gLLwq5YlDKbrmLFtlfQWjFK3iOo8uC0tZa2t6fHd0FgXNJv7g9RrOORfqBpa?=
 =?us-ascii?Q?KIexTdBG6UTXq+CfzBBqVJ2aFytLrtzllSseE7rU/UCM9mYZSTPABrSN+JBG?=
 =?us-ascii?Q?VjI+aJxbJJ0eRiUj0eiSRKuivodoZdw+MIkYcdLWZoObe6b/qWFWMcPr9TB7?=
 =?us-ascii?Q?TQDsONAKYnU6bFf4vB34FpSYtZh1xv1ie8N0oXZC5lxyvub/hhmWtiX7peEl?=
 =?us-ascii?Q?59v3BrjXCmnE/Ko+7lvy9oLqmhZY+MQZmRbdDdNfAojRLP5D2DYq1iM7LhS9?=
 =?us-ascii?Q?Qebr/WTAaxRaZbBpl+y7WXtqENZ5yLGmqPqd8HqtSoMnoc3PTuqJZUkcSkqH?=
 =?us-ascii?Q?afwea2OP7j9I5P9Uqu4Qt8Etwpmg3jXGE4S6kO0yuLYQgshbb7Br3/ofLxfo?=
 =?us-ascii?Q?XQZoY73D1wChlbE3ISPKJi85Bw9D+BXo3kyU/HvY8Kphu5CQlj7T7kwl/K8H?=
 =?us-ascii?Q?6YAWotiXVx/1QxTV20kacXCxraHKMmyJYn20/Dltd6IZ+SYfVm5XrFl1AKhW?=
 =?us-ascii?Q?Xxgw122qdE5KB5W6SiTrP9WAyFzaoF5lz5mxjsT8p4suty6tC5HUOukZ1iDm?=
 =?us-ascii?Q?wgr4JPYzM2vjs6G1wBfbvOOtZMDeCQt6QlX0GSsBoMVsPlcHpsKhRhY96K6l?=
 =?us-ascii?Q?QVfi30ldlyaG5M5Zu3iZjj9NtCTeSYiSykFjIq0Q8OKszpEoUNT1WgyBUMld?=
 =?us-ascii?Q?Iif1ISphhpviAnX9dU4nREF3l8DvQ3qDWQyfAut+JMPqRiayFimFNgeWyIrU?=
 =?us-ascii?Q?4DDW+1yx3EALViIKcpyrVJ1EIsr/iNlJiryeDbte7JZPgSm9Xp3nK6hSR1c4?=
 =?us-ascii?Q?QAugqfpRqdCyx/b9XlXu6aZRN8w8NuCyHbJi1psizwnKu/7yr3y1W5tn3txF?=
 =?us-ascii?Q?HDzyCAfvRRYgEPSeO73rsEAxBUz7cVdnDnVzOx5wBi5/bd5SLCC8POERGuQQ?=
 =?us-ascii?Q?RL4g01MQ3qcvUMoLh05BFR6Vi4gv7nysLbLCIYFLcCl7LMEmb53DqKLs/T2H?=
 =?us-ascii?Q?K2c/xrM1/iJtKxWl+fPsze5D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b3a221-f570-478b-e815-08d90c449847
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:20.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wssZp2olIJkgU2q1a+L4OmnvRz3sMllG91qVTUDINqoW5/Nx0p19Vgm8ZBzExTcPS75KxiutM8UXpve+yj2OMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Checkpoint-Restore in userspace (CRIU) is a powerful tool that can
snapshot a running process and later restore it on same or a remote
machine but expects the processes that have a device file (e.g. GPU)
associated with them, provide necessary driver support to assist CRIU
and its extensible plugin interface. Thus, In order to support the
Checkpoint-Restore of any ROCm process, the AMD Radeon Open Compute
Kernel driver, needs to provide a set of new APIs that provide
necessary VRAM metadata and its contents to a userspace component
(CRIU plugin) that can store it in form of image files.

This introduces some new ioctls which will be used to checkpoint-Restore
any KFD bound user process. KFD doesn't allow any arbitrary ioctl call
unless it is called by the group leader process. Since these ioctls are
expected to be called from a KFD criu plugin which has elevated ptrace
attached priviledges and CAP_SYS_ADMIN capabilities attached with the file
descriptors so modify KFD to allow such calls.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit 72f4907135aed9c037b9f442a6055b51733b518a)
(cherry picked from commit 33ff4953c5352f51d57a77ba8ae6614b7993e70d)
Change-Id: I1b25f6f65ad44b897752ac2c771a95157d0b1130
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  60 ++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  28 ++++++
 include/uapi/linux/kfd_ioctl.h           | 110 ++++++++++++++++++++++-
 3 files changed, 196 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 059c3f1ca27d..1fa2ba34a429 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -33,6 +33,7 @@
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/ptrace.h>
 #include <linux/dma-buf.h>
 #include <asm/processor.h>
 #include "kfd_priv.h"
@@ -1802,6 +1803,37 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 	return -EPERM;
 }
 #endif
+static int kfd_ioctl_criu_dumper(struct file *filep,
+				struct kfd_process *p, void *data)
+{
+	pr_info("Inside %s\n",__func__);
+
+	return 0;
+}
+
+static int kfd_ioctl_criu_restorer(struct file *filep,
+				struct kfd_process *p, void *data)
+{
+	pr_info("Inside %s\n",__func__);
+
+	return 0;
+}
+
+static int kfd_ioctl_criu_helper(struct file *filep,
+				struct kfd_process *p, void *data)
+{
+	pr_info("Inside %s\n",__func__);
+
+	return 0;
+}
+
+static int kfd_ioctl_criu_resume(struct file *filep,
+				struct kfd_process *p, void *data)
+{
+	pr_info("Inside %s\n",__func__);
+
+	return 0;
+}
 
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
@@ -1906,6 +1938,18 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
 			kfd_ioctl_set_xnack_mode, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_DUMPER,
+			 kfd_ioctl_criu_dumper, KFD_IOC_FLAG_PTRACE_ATTACHED),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_RESTORER,
+			 kfd_ioctl_criu_restorer, KFD_IOC_FLAG_ROOT_ONLY),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_HELPER,
+			 kfd_ioctl_criu_helper, KFD_IOC_FLAG_PTRACE_ATTACHED),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_RESUME,
+			 kfd_ioctl_criu_resume, KFD_IOC_FLAG_ROOT_ONLY),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
@@ -1920,6 +1964,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	char *kdata = NULL;
 	unsigned int usize, asize;
 	int retcode = -EINVAL;
+	bool ptrace_attached = false;
 
 	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
 		goto err_i1;
@@ -1945,7 +1990,15 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	 * processes need to create their own KFD device context.
 	 */
 	process = filep->private_data;
-	if (process->lead_thread != current->group_leader) {
+
+	rcu_read_lock();
+	if ((ioctl->flags & KFD_IOC_FLAG_PTRACE_ATTACHED) &&
+	    ptrace_parent(process->lead_thread) == current)
+		ptrace_attached = true;
+	rcu_read_unlock();
+
+	if (process->lead_thread != current->group_leader
+	    && !ptrace_attached) {
 		dev_dbg(kfd_device, "Using KFD FD in wrong process\n");
 		retcode = -EBADF;
 		goto err_i1;
@@ -1960,6 +2013,11 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		goto err_i1;
 	}
 
+	/* KFD_IOC_FLAG_ROOT_ONLY is only for CAP_SYS_ADMIN */
+	if (unlikely((ioctl->flags & KFD_IOC_FLAG_ROOT_ONLY) &&
+		     !capable(CAP_SYS_ADMIN)))
+		return -EACCES;
+
 	if (cmd & (IOC_IN | IOC_OUT)) {
 		if (asize <= sizeof(stack_kdata)) {
 			kdata = stack_kdata;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 64552f6b8ba4..a494d61543af 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -121,7 +121,35 @@
  */
 #define KFD_QUEUE_DOORBELL_MIRROR_OFFSET 512
 
+/**
+ * enum kfd_ioctl_flags - KFD ioctl flags
+ * Various flags that can be set in &amdkfd_ioctl_desc.flags to control how
+ * userspace can use a given ioctl.
+ */
+enum kfd_ioctl_flags {
+	/**
+	 * @KFD_IOC_FLAG_ROOT_ONLY:
+	 * Certain KFD ioctls such as AMDKFD_IOC_CRIU_RESTORER can potentially
+	 * perform privileged operations and load arbitrary data into MQDs and
+	 * eventually HQD registers when the queue is mapped by HWS. In order to
+	 * prevent this we should perform additional security checks. In other
+	 * cases, certain ioctls such as AMDKFD_IOC_CRIU_RESUME might be called
+	 * by an external process e.g. CRIU restore process, for each resuming
+	 * tasks and thus require elevated privileges.
+	 *
+	 * This is equivalent to callers with the SYSADMIN capability.
+	 */
+	KFD_IOC_FLAG_ROOT_ONLY = BIT(0),
+	/**
+	 * @KFD_IOC_FLAG_PTRACE_ATTACHED:
+	 * Certain KFD ioctls such as AMDKFD_IOC_CRIU_HELPER and
+	 * AMDKFD_IOC_CRIU_DUMPER are expected to be called during a Checkpoint
+	 * operation triggered by CRIU. Since, these are expected to be called
+	 * from a PTRACE attched context, we must authenticate these.
+	 */
+	KFD_IOC_FLAG_PTRACE_ATTACHED = BIT(1),
 
+};
 /*
  * Kernel module parameter to specify maximum number of supported queues per
  * device
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 3cb5b5dd9f77..9c8a77a0ce0a 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -467,6 +467,102 @@ struct kfd_ioctl_smi_events_args {
 	__u32 anon_fd;	/* from KFD */
 };
 
+struct kfd_criu_devinfo_bucket {
+	__u32 user_gpu_id;
+	__u32 actual_gpu_id;
+	__u32 drm_fd;
+};
+
+struct kfd_criu_bo_buckets {
+	__u64 bo_addr;  /* from KFD */
+	__u64 bo_size;  /* from KFD */
+	__u64 bo_offset;/* from KFD */
+	__u64 user_addr; /* from KFD */
+	__u32 bo_alloc_flags;/* from KFD */
+	__u32 gpu_id;/* from KFD */
+	__u32 idr_handle;/* from KFD */
+};
+
+struct kfd_criu_q_bucket {
+	__u64 q_address;
+	__u64 q_size;
+	__u64 read_ptr_addr;
+	__u64 write_ptr_addr;
+	__u64 doorbell_off;
+	__u64 eop_ring_buffer_address;		/* Relevant only for VI */
+	__u64 ctx_save_restore_area_address;	/* Relevant only for VI */
+	__u64 queues_data_offset;
+	__u32 gpu_id;
+	__u32 type;
+	__u32 format;
+	__u32 q_id;
+	__u32 priority;
+	__u32 q_percent;
+	__u32 doorbell_id;
+	__u32 is_gws;				/* TODO Implement me */
+	__u32 sdma_id;			/* Relevant only for sdma queues*/
+	__u32 eop_ring_buffer_size;		/* Relevant only for VI */
+	__u32 ctx_save_restore_area_size;	/* Relevant only for VI */
+	__u32 ctl_stack_size;			/* Relevant only for VI */
+	__u32 cu_mask_size;
+	__u32 mqd_size;
+};
+
+struct kfd_criu_ev_bucket {
+	__u32 event_id;
+	__u32 auto_reset;
+	__u32 type;
+	__u32 signaled;
+
+	union {
+		struct kfd_hsa_memory_exception_data memory_exception_data;
+		struct kfd_hsa_hw_exception_data hw_exception_data;
+	};
+};
+
+struct kfd_ioctl_criu_dumper_args {
+	__u64 num_of_bos;
+	__u64 kfd_criu_bo_buckets_ptr;
+	__u64 kfd_criu_q_buckets_ptr;
+	__u64 kfd_criu_ev_buckets_ptr;
+	__u64 kfd_criu_devinfo_buckets_ptr;
+	__u64 queues_data_size;
+	__u64 queues_data_ptr;
+	__u64 event_page_offset;
+	__u32 num_of_queues;
+	__u32 num_of_devices;
+	__u32 num_of_events;
+};
+
+struct kfd_ioctl_criu_restorer_args {
+	__u64 handle;   /* from KFD */
+	__u64 num_of_bos;
+	__u64 kfd_criu_bo_buckets_ptr;
+	__u64 restored_bo_array_ptr;
+	__u64 kfd_criu_q_buckets_ptr;
+	__u64 kfd_criu_ev_buckets_ptr;
+	__u64 kfd_criu_devinfo_buckets_ptr;
+	__u64 queues_data_size;
+	__u64 queues_data_ptr;
+	__u64 event_page_offset;
+	__u32 num_of_devices;
+	__u32 num_of_queues;
+	__u32 num_of_events;
+};
+
+struct kfd_ioctl_criu_helper_args {
+	__u64 num_of_bos;	/* from KFD */
+	__u64 queues_data_size;
+	__u32 task_pid;
+	__u32 num_of_devices;
+	__u32 num_of_queues;    /* from KFD */
+	__u32 num_of_events;	/* from KFD */
+};
+
+struct kfd_ioctl_criu_resume_args {
+	__u32 pid;	/* to KFD */
+};
+
 /* Register offset inside the remapped mmio page
  */
 enum kfd_mmio_remap {
@@ -740,7 +836,19 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_CRIU_DUMPER			\
+		AMDKFD_IOWR(0x22, struct kfd_ioctl_criu_dumper_args)
+
+#define AMDKFD_IOC_CRIU_RESTORER			\
+		AMDKFD_IOWR(0x23, struct kfd_ioctl_criu_restorer_args)
+
+#define AMDKFD_IOC_CRIU_HELPER			\
+		AMDKFD_IOWR(0x24, struct kfd_ioctl_criu_helper_args)
+
+#define AMDKFD_IOC_CRIU_RESUME			\
+		AMDKFD_IOWR(0x25, struct kfd_ioctl_criu_resume_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x26
 
 #endif
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
