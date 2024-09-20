Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C997D368
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2560710E7E8;
	Fri, 20 Sep 2024 09:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XT+dT13b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5EC10E7E8;
 Fri, 20 Sep 2024 09:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmH5ryaMAXHuzygWLbl/oMKFbORC2BmyGUePL3YKzx82diRlOGy+OTqnj+OTEOipUyLWX9FS7vCY0LhlE9Zmnh+rll3TJr53z7h1qmopDkowK1kiIkhLfhmHBeVasaifMBY47Wn1aHiUwuUo8dFyj7BI7sBt1zpflVBUlHggeqy2KbzqX9PnjMOymzFRmo7ggSGFOwpKA8HA35YrbKC2cCJ5BhvoSl6jM4BG18eqAH1Ixgk3iwgf5OEMgB8/n7rfhl0RzilK21MFP8ddkPO21ALxnSTlQZJ/szDwuWkCuxN9jLNYsj/vlZUJnxxnmNK7SwJHjHZk0/aWxe/hSY7Bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41q39kXnXPva8W/RvA4hsrqiJHzL1JsBuYPHxqjYyKA=;
 b=AoC7pEOhUbV+P/Vh+AzNdJfeb+g9DD+e5cqv5uWmRG2hUw9psYixLe6kWJdG46Uj5Rujp/1IUr3nspNrtihL7SbE2k67XyBO+b2+rq4Z005ugnEj1JKDWlK8z7M5peo3nzploJwk7EnPANVE5k31wlzLtkCNyzpOysMO7yOqE3Y9N1Pfv9/hOpFbe2Kjh257NMr3064I9i2FU/mR1/K4QyyERMv3qc41BGkqzfGi4lqjVeKt2uQCZE1JEBHlMm0bHumVL3sC1UC9G/qCRSSWXvt+dFS3ZKWa8TCgUP613TS+f5gSZqq26dRFuzBf7kmGDzWoBpVa99P9M8GYTJi/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41q39kXnXPva8W/RvA4hsrqiJHzL1JsBuYPHxqjYyKA=;
 b=XT+dT13bZ/Mmb0cgFuVALAO36pCcnD0Pt8LkUKtGnKkRwzdgky4uBRpChDGS/bnjwFZSY1i4TlfviyMIXa2BJ+BYMW22i2xrO+SlOr5xCCauYcvapwvzdjNhah+K4cYGSazjdeVNdNlvFT2hqm+vOLY4tWHC3Z/47at04wqFysk=
Received: from CH2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:610:60::36)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Fri, 20 Sep
 2024 09:09:56 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::7b) by CH2PR14CA0026.outlook.office365.com
 (2603:10b6:610:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Fri, 20 Sep 2024 09:09:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:09:56 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:09:53 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
Date: Fri, 20 Sep 2024 11:06:43 +0200
Message-ID: <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afecf10-5624-429f-0015-08dcd953fee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7IAUFE+LiKM4CbQmgYN2+RGvpqqeeWz1JZkSomGHfQE2fIZh9qK1cidDG3o?=
 =?us-ascii?Q?x9+eARd2g0xIfl/m4iVHuOZBymvbWYtZYZxAyC6hmYffq0UUCScrSliyyaCs?=
 =?us-ascii?Q?jAy8lt37Ec+h03GugGO1mdp43GMQSLoik1OZqTsgPP5KganlJmDUojtC94FF?=
 =?us-ascii?Q?+qfd3/PBfrMiad3q4ECLxPDvDh7kXsvBoCvAGpJROYtapLWqF5hL30zwz/JI?=
 =?us-ascii?Q?3IWhph2hnr7rc3KZygwmtXwVqFbyuoxIhw74QO0ERcRXp9sURpPIfvxy5eoc?=
 =?us-ascii?Q?aiDby67IpdDp168It3fpTwyrOfCPnqCOibvimxrXRGU6pMdKZCbk6NnwT9NJ?=
 =?us-ascii?Q?4MDlsne/kGtXrpbrHzo3DcnB7wt8VGIdYKoxWMmG+QwaRyGMfXvCnQwAEJ9Z?=
 =?us-ascii?Q?wLdTOIruNJgZWkO12jieqezg5AglDXnxLG0FxA/PNHI4qvVqC8yeZoZqxDXX?=
 =?us-ascii?Q?w/4u1+pn8fJ+fv8h9kaPLgIW3k/STxQv+9EaqVvs3TECZvJOngVaIfMkNXtL?=
 =?us-ascii?Q?3pNgQjPVq2zHvC+WzKdmWyiBtsUj2oqYL73ZVpAoHhMNSiO1mRKmI0qpp5kT?=
 =?us-ascii?Q?+ysgJ6+s3rnZj0qmNkIlOjgWyNkn7CX3FucECraYya7gDKiE0/+BHFbznZ4b?=
 =?us-ascii?Q?/16G/QvE9SgCvxJoPULpETbeW3/EEfy5UYUDMIdKL0DKGWAnWlPZFx3Gqcoi?=
 =?us-ascii?Q?tWvEztSD60ZgzsIDDDTt5VssK3Wp53GpfsMlhquYiIEWRjEtTrc7qnLK3S6d?=
 =?us-ascii?Q?Ofzxg48DHJW3FPOVf7OC5+6Fe3HxzZqFW1gkBEBAf3XbsuM5cgu9kBTc2d+j?=
 =?us-ascii?Q?NfFCM5yNuaumZS8faZbF37w7Dvl7shZmcExHUf2woD0hwLhMjQF7S6ilahgc?=
 =?us-ascii?Q?vt5li+N1i9IXtmrgLLYIlIVbVoBPk00CRKr+OfYKQucegkkrGvh5Ms+/EW2s?=
 =?us-ascii?Q?tdxBwgWhYjMDaSjV/O7nCIhf+U4GazIQ+Px26nmoWlKiTYIHFUKjh3fsbGhZ?=
 =?us-ascii?Q?vMZ6bk0cbPf16HSnctWEemJMngPHwZb2Ehx1dZqL/91a/xcDgHV8G5ZqDQCF?=
 =?us-ascii?Q?V1W6RaPy/K9jrjrKC7GmJM6TwIRfhpcRrS1M/i7/b0TnsXYJoAZcgd/UfXCf?=
 =?us-ascii?Q?Uu1siWq3d+9eEph6dLo+oPuFv1oIvhhumvd3/INnuv9878NcodUhNrwCOZ9J?=
 =?us-ascii?Q?f0O+I8k2mlxVPslHddQcMOgmMrWacwCQdRLQjNQJDJiMSOhoKqJmvZnQgiOa?=
 =?us-ascii?Q?g75Pg67pFpDyoMkrBhwpahqTy22BT6XTc347AyDo102S1SBO+fboqB+RQyva?=
 =?us-ascii?Q?TdmrGZNoGzLRHVRPgKf4Cwe/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:09:56.0723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afecf10-5624-429f-0015-08dcd953fee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Giving the opportunity to userspace to associate a free-form
name with a drm_file struct is helpful for tracking and debugging.

This is similar to the existing DMA_BUF_SET_NAME ioctl.

Access to name is protected by a mutex, and the 'clients' debugfs
file has been updated to print it.

Userspace MR to use this ioctl:
   https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428

The string passed by userspace is filtered a bit, to avoid messing
output when it's going to be printed (in dmesg, fdinfo, etc):
  * all chars failing isgraph() are replaced by '-'
  * if a 0-length string is passed the name is cleared

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 12 ++++++---
 drivers/gpu/drm/drm_file.c    |  5 ++++
 drivers/gpu/drm/drm_ioctl.c   | 48 +++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h        |  9 +++++++
 include/uapi/drm/drm.h        | 17 +++++++++++++
 5 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..482e71160544 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	kuid_t uid;
 
 	seq_printf(m,
-		   "%20s %5s %3s master a %5s %10s\n",
+		   "%20s %5s %3s master a %5s %10s %20s\n",
 		   "command",
 		   "tgid",
 		   "dev",
 		   "uid",
-		   "magic");
+		   "magic",
+		   "name");
 
 	/* dev->filelist is sorted youngest first, but we want to present
 	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
@@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		struct task_struct *task;
 		struct pid *pid;
 
+		mutex_lock(&priv->name_lock);
 		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
 		pid = rcu_dereference(priv->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
-		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(pid),
 			   priv->minor->index,
 			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
-			   priv->magic);
+			   priv->magic,
+			   priv->name ?: "");
 		rcu_read_unlock();
+		mutex_unlock(&priv->name_lock);
 	}
 	mutex_unlock(&dev->filelist_mutex);
 	return 0;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 01fde94fe2a9..e9dd0e90a1f9 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
+	mutex_init(&file->name_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_open(dev, file);
@@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
 	WARN_ON(!list_empty(&file->event_list));
 
 	put_pid(rcu_access_pointer(file->pid));
+
+	mutex_destroy(&file->name_lock);
+	kfree(file->name);
+
 	kfree(file);
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51f39912866f..46dadbd1bb35 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -540,6 +540,52 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
+static int drm_set_name(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
+{
+	struct drm_set_name *name = data;
+	void __user *user_ptr;
+	char *new_name;
+	size_t i, len;
+
+	if (name->name_len > DRM_NAME_MAX_LEN)
+		return -EINVAL;
+
+	user_ptr = u64_to_user_ptr(name->name);
+
+	new_name = memdup_user_nul(user_ptr, name->name_len);
+	if (IS_ERR(new_name))
+		return PTR_ERR(new_name);
+
+	len = strlen(new_name);
+
+	if (len != name->name_len) {
+		kfree(new_name);
+		return -EINVAL;
+	}
+
+	/*
+	 * Filter out control char / spaces / new lines etc in the name
+	 * since it's going to be used in dmesg or fdinfo's output.
+	 */
+	for (i = 0; i < len; i++) {
+		if (!isgraph(new_name[i]))
+			new_name[i] = '-';
+	}
+
+	mutex_lock(&file_priv->name_lock);
+	kfree(file_priv->name);
+	if (len > 0) {
+		file_priv->name = new_name;
+	} else {
+		kfree(new_name);
+		file_priv->name = NULL;
+	}
+	mutex_unlock(&file_priv->name_lock);
+
+	return 0;
+}
+
 static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
@@ -610,6 +656,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
 
+	DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
+
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 8c0030c77308..df26eee8f79c 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -388,6 +388,15 @@ struct drm_file {
 	 * Per-file buffer caches used by the PRIME buffer sharing code.
 	 */
 	struct drm_prime_file_private prime;
+
+	/**
+	 * @name:
+	 *
+	 * Userspace-provided name; useful for accounting and debugging.
+	 */
+	const char *name;
+	/** @name_lock: Protects @name. */
+	struct mutex name_lock;
 };
 
 /**
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..f5e92e4f909b 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+#define DRM_NAME_MAX_LEN	64
+struct drm_set_name {
+	__u64 name_len;
+	__u64 name;
+};
+
+
 #if defined(__cplusplus)
 }
 #endif
@@ -1288,6 +1295,16 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
+ *
+ * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
+ * and debugging.
+ * The length of the name must <= DRM_NAME_MAX_LEN. All characters that are
+ * non-printable or whitespaces will be replaced by -.
+ */
+#define DRM_IOCTL_SET_NAME		DRM_IOWR(0xD1, struct drm_set_name)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.40.1

