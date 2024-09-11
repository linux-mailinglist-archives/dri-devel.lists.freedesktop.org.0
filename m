Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8F975641
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65F10E5EC;
	Wed, 11 Sep 2024 14:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UQPxn5w1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300B010E5EC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAfYFY8/qrzAJM/dytusH1+WM+FDmcwmFPY3+f0M5G1ytRKwwXNQdMZugpJn5cyQo6Q7e7+rlSCFuXvV9+IaTKuWD0dGUj6h8THzRQm4EYfTUcdBZ2t8BpMZ4NI2fHb7fxg3atUMip9mkKAyudn+ZMBZ00HDqqjEZ1+b4yVSdDygLXo33HHJyT4ILAc8gviXBaWHvLPiPHnRsSiUqk53nzvFvCNWRmEBuIXgYtCpWL6Yg0GJwrAxzHtXaTgP05FKxcSRInColUrp9R7Ju7BPS6oCmCw8lQ1Ah6fv+bwOpuShzIjQfoYNZ1idE8QoGyOIiP+TAkfzkj3JGThp8Ve7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFmE5v6recG0aj44ta6SFAQGaKXxChJ+9iQ5Y+Z18Ek=;
 b=Fww+EuIKpnwnh9JRlN9Pu5puTCFJDn5b41qcRdUKKClM/k5Iy0LMsXLOu6IzHkbydMsuh7Ovr+O6aPQUQ+J4cKDs8DGdGQzoGpHfcxqor6IJaMeTTHakqS+WKdBSMFfXw8tj8mNZBhHWFbKShzmgWB7DMNqTI2deKV/P7/NVhJB/oj5SBPqEoxSennj/iY4eClVX1m7nxUpAeSu0QNaRCIg6CwkQoxS4JZq5SsudHlthxx9ecmxZt9GZdaYcdXyayaJ/NK1C84HzrhmXt7tArqAQH0ba2Jj4knAbD7a6yrW+fvWxPuOZKVhieBZXHS4azQtHtnmXY4OyxGDaOwABjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFmE5v6recG0aj44ta6SFAQGaKXxChJ+9iQ5Y+Z18Ek=;
 b=UQPxn5w1wY8qRmj5PHPC0DVv8UNMGcSXxgTNwVo3vshBDYahLTRwjbQDbHVJOOVOwlYmrfwDmn8AzW6WW6sXnXdZtdnjbGQJKT0+MTyZXvwyndTM9ZFjBV+kyCZ7y/Jayu2iHjDWR/NzQ+5QqjnO5w95yHu2zt/9CSCFZN0WlJk=
Received: from BN0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:408:142::14)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 14:59:00 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::5f) by BN0PR08CA0024.outlook.office365.com
 (2603:10b6:408:142::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 14:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 14:59:00 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 09:58:57 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
Date: Wed, 11 Sep 2024 16:58:32 +0200
Message-ID: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bc8005-06b4-4cab-a5b3-08dcd27244bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jHk2ebvEzismeZGK0qDD5AGJMkAIkZJgJg5kjWuwkPZGlqd4newiq8dB96zn?=
 =?us-ascii?Q?A7NtdxTf90z0pFewZ+qqJwo//4/AiCajn7hBC6sS0/NFImCqh+yFklnTDH07?=
 =?us-ascii?Q?4lQARZw0Ao102AuoqEq3XWgp7i06Hr555Rp2cJXPlNhzyxMaymzF8gUDfLzx?=
 =?us-ascii?Q?/IQEFZ4lQIB/94CXzZZVRCn/dwv7iKEbnJCcymVVFBfqiqiekGZvWBxznVJ5?=
 =?us-ascii?Q?dfdbK4vAIA/cUcO4lKNb600e3nmbqBZU9l8QhZziazZ6EO8D4DrPoeZvfG2Y?=
 =?us-ascii?Q?WW2nFRZN3q6xUKUo6TXKq3rGXwg6Ry4DR88+j2z0f0NV1tmFNNlKxuwq1Pbb?=
 =?us-ascii?Q?/FAPAGML0A+Dnqrk8cO1VUa2k26E7rbKOjhMc6i0urX2tR5DuUlzsGc51I/r?=
 =?us-ascii?Q?80aENWyHjbP+/NLKWaMpYw1VxGSmaJWePHQmWk3lzgXGYJ5/YfVg+z834Ihq?=
 =?us-ascii?Q?fcqGiM/ip+8AtdFS1WNlIudxMhpPWvu0C/DrTh1RgrYNT/BtWs4dhom8YYFC?=
 =?us-ascii?Q?p3bBNEXqyncJ2BTuNSkJyS9LBbpIYeT2ErjUxUUwOtbTdZZZRI7Tf3Ms4FOn?=
 =?us-ascii?Q?4T2g0vDRoaWP6zMbaUfqe2qhKNhllfQLtnN+pEdbuk7WSWTylMnTdv7CRbUd?=
 =?us-ascii?Q?CHZOafN0oI9STXQKEDy187Ir2Ji1lrRsBQameIuGLgiigsJFwRDjYovNS62Q?=
 =?us-ascii?Q?Quk7RvESStB80xUln+n+FvvM2DPlFNMVGvFRdx67Tk59ioZ4sFQXJp7qaYrw?=
 =?us-ascii?Q?CI77t6YRSg96pDEPh5uPITpcsP42O8/u2sHkyiJBjE2wKoJzVjZhTk8B/Zgm?=
 =?us-ascii?Q?FH9uQ/0dQbHr13Z9Lx9aqNIo/45FfewWx+OBfkVfHxOCDG5bmLbhdETRZJhu?=
 =?us-ascii?Q?d+zgy+x8og3sAv014OuQH3Jzu+rqEUrbsXG7H7L7r79T52OCKY8oxDEdJQc6?=
 =?us-ascii?Q?pA8JxDxhYSXiUpSIJGr8wHF9P3SC9EylwxbLA+I1E35afzSK6aLZUrMPvFwZ?=
 =?us-ascii?Q?0LM9yrR7tjLhn875pe4vbuRVunX8KqHTdTm5F9lt8ZCojd54zJSwXUMv03/l?=
 =?us-ascii?Q?q5j1uRvaPX1WIwvJMvxMDNKYwdebbZ3U3phN+Rcnf4+7QESkDkle8lNTyjbf?=
 =?us-ascii?Q?WGN+ahg5tTcFQHuoFAddhAGQPTmoJkMWeSOLcrJjRjQkjas/XzRmqcUGdGP1?=
 =?us-ascii?Q?41xwJ+QN545nLfSPysHPrtDW4tlLVumqnyBZw6S8BoYW7x8mi+B0TnVLpyOh?=
 =?us-ascii?Q?2WB3YVJ8GXDn2uV6ztTlU0qHBPup6/HBZ1fZ7kWbGBZXxSQmS4fbNOZJFNhm?=
 =?us-ascii?Q?+IPAux6dN/KWtdfMPosUcudU/d60DERqeEm1TwL4u6zFkREnHIe81c6yz1tv?=
 =?us-ascii?Q?UXH5CxfuUvX7uYvBe5GZ1BXGYwLl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:59:00.0345 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bc8005-06b4-4cab-a5b3-08dcd27244bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 12 ++++++++----
 drivers/gpu/drm/drm_file.c    |  5 +++++
 drivers/gpu/drm/drm_ioctl.c   | 28 ++++++++++++++++++++++++++++
 include/drm/drm_file.h        |  9 +++++++++
 include/uapi/drm/drm.h        | 14 ++++++++++++++
 5 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..b7492225ae88 100644
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
+			   priv->name ? priv->name : "");
 		rcu_read_unlock();
+		mutex_unlock(&priv->name_lock);
 	}
 	mutex_unlock(&dev->filelist_mutex);
 	return 0;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 01fde94fe2a9..558151c3912e 100644
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
+	kvfree(file->name);
+
 	kfree(file);
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51f39912866f..ba2f2120e99b 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -540,6 +540,32 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
+static int drm_set_name(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
+{
+	struct drm_set_name *name = data;
+	void *user_ptr;
+	char *new_name;
+
+	if (name->name_len >= NAME_MAX)
+		return -EINVAL;
+
+	user_ptr = u64_to_user_ptr(name->name);
+
+	new_name = memdup_user_nul(user_ptr, name->name_len);
+
+	if (IS_ERR(new_name))
+		return PTR_ERR(new_name);
+
+	mutex_lock(&file_priv->name_lock);
+	if (file_priv->name)
+		kvfree(file_priv->name);
+	file_priv->name = new_name;
+	mutex_unlock(&file_priv->name_lock);
+
+	return 0;
+}
+
 static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
@@ -610,6 +636,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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
index 16122819edfe..fc62bb21f79e 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1024,6 +1024,12 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+struct drm_set_name {
+	__u64 name_len;
+	__u64 name;
+};
+
+
 #if defined(__cplusplus)
 }
 #endif
@@ -1288,6 +1294,14 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
+ *
+ * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
+ * and debugging.
+ */
+#define DRM_IOCTL_SET_NAME		DRM_IOWR(0xD1, struct drm_set_name)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.40.1

