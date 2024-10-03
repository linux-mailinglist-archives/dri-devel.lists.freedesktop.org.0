Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C094398EF8C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7C810E831;
	Thu,  3 Oct 2024 12:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B98a9CK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B4D10E19A;
 Thu,  3 Oct 2024 12:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdXjHoF1NCdNhO3joFx04+4RQtt/XiP3a3velp7GxtBnODezsPYT/Ya6t95U9Ko+CCT3FyEexbiFZA954gtTzhHJDds3+E6WcvD9vV8JByxEloa8Wa1b724RYUVQyh8T+ZD1zwJoNABRAzGONSBhOYD0RRM1uy+0Z6h8JiygMwyPEAv1nEm8qFWUB1Z09/LIT6AYXazyJDYl+Y6rcWJzpOixstyRSR1xKznYHiWFUaOhsAcFrfJHS+sQ+CR4m+ATXhaDUko5txycrfiwRgyst9pQGImaMZj9zwEp4IZrtJOLSaZTcI1g2T2rWBcA123LOqiHoFiMWYzShgGZ9Xw05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlN4u7u3v26s09Gt/KP+IGN6P7IlrCcW0nqp7UKtfcI=;
 b=AAYtpFnp99WQCPjF7iMmFssAwGtZf688vU6QafV+P/StrFIeNxioV+EdraVKjw9vuSr5JZZDftvloh3+seKvbiU7OgjqMGx8jXGxHO7yciryOH9DOPgJ5sgjXGjxxO5T4btePV/OXUaciYbnBf4pd4qD2ZtHxRyuHOrcvLSTg2Jlbx3iVKAPmHxXfxIgBchwtBuXskNpQv3n1tT133RrvcTfy5cum5po0H3iVjIq0C3MPET8gG9QuqD2m7B94ceFpDF+UeglkLIX5uoELwJ+St58isJy/PIRyElXYgtdq/LeMXU+AXnudrF52IQAwHBV4PlGGHQyBueUUUtYHpIRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlN4u7u3v26s09Gt/KP+IGN6P7IlrCcW0nqp7UKtfcI=;
 b=B98a9CK0dNUkKnJDGOSDlpb8IkK+Ahn0Zq1DzDECXFX7ntQ1DYJDxIuI4cNsUVDv+3HqSp7xRqijMb/pWCmBDBbfZECn+uyUwZzZT9iTTd4wy+ivFQleoQRZY0x4B/2dIU1ymXGgvlAENeKVbLfg5pJglAXWWYexVNh0EmSQ11I=
Received: from SN4PR0501CA0016.namprd05.prod.outlook.com
 (2603:10b6:803:40::29) by PH7PR12MB9103.namprd12.prod.outlook.com
 (2603:10b6:510:2f5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 12:45:37 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::f4) by SN4PR0501CA0016.outlook.office365.com
 (2603:10b6:803:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:36 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:33 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 1/6] drm: add DRM_SET_CLIENT_NAME ioctl
Date: Thu, 3 Oct 2024 14:43:09 +0200
Message-ID: <20241003124506.470931-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f37ba1d-04ab-437e-37ab-08dce3a9477c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jisvpYs9I4DGQVgrqp+XhYCKjrpjEAGNOgZXzxtgItnMn6VOksHitdIyECdZ?=
 =?us-ascii?Q?/2Jo+NSDyxC5Icm02tuGrIWh1TFe2GFI9fWakmuj6upyFzdWhzvKDw2QDI//?=
 =?us-ascii?Q?8MSDem/ioQxPPuw+5MPMZdZNdzwQ9SC+3gU1u4xdaaKJjQPXiEPkq2pxQXSA?=
 =?us-ascii?Q?vqSzhT6oShciiB60jLRyObMHhYFbvIXsxPgGhWTziflowmghuXvoqpK+ehLF?=
 =?us-ascii?Q?4XJEkbBOayAc1maXaN0ik74DT6dUCELwDipIX3MEyQwdF5FjIUrJiETeWJTV?=
 =?us-ascii?Q?7CW79khOefauekFbXu8uTQnZwzGi6OmdG263jDas0ZFJ88HzC9yoVUpzxHFI?=
 =?us-ascii?Q?bWJTDfMhB/7paMBjTFzY1Fr3/iw+eWisgWqCxMAWVK1laZP8x8UxRpd1XSa8?=
 =?us-ascii?Q?+ETMas3XFERvae3KAn8vrxFJdHHwquKp+E0DmQXAmMJ7zA4+geMvZ2a1ltCo?=
 =?us-ascii?Q?1oOxRfCOQNlnwzxwsAxkj7ThW8DEggwgxAbTBy9FVxqCpdG9SiHcMzMJNbYL?=
 =?us-ascii?Q?0lhC2B6kPq/Vqi82VKDC74T1B4J5lku2iCafSl+/z9tetA6njoH6WnXZfcnQ?=
 =?us-ascii?Q?axJzMnSrD/4/o3SaubFPRHpFfPPmmki16fhnQ2HxBQBkOfg20gXlcKHD1fD6?=
 =?us-ascii?Q?ar2c4jn1XZ5D/qyPzCvi5a605WNFSPEshQydh5eQCFgtNjWs8M4kAO3c82Io?=
 =?us-ascii?Q?24uyDG+FsRwAj7zwbdVcItQYssRbjO7Lw1/UBUjHG4OUwYt289rEjORBIPn7?=
 =?us-ascii?Q?bmSBlgZJD16qbFg2Bn544XfxOPoVBlDfQgZBC4F80dj0yPcyBBo/lQJMMnHW?=
 =?us-ascii?Q?ZRaM6dDel2bthF6ql41d+w3vk+VLfDMXGSU7Xh+PiUGdOr5fl2s1O2yGHbLS?=
 =?us-ascii?Q?3+ekLOogvquqsF2pV7RwZZUDbKmplztTwTyds3PZARXYUsaExDX1C6VaX8E9?=
 =?us-ascii?Q?7FfXTn+RDixqgkExGCetVq+mOCJUTvcYsj5LEfspw4G9UDpRFo5yxSXanyms?=
 =?us-ascii?Q?GFPqlkC5P9wIXRoN1ICyrS05JoeNaekaNTzQa912FUzQMcvFVQ3kFnpOsbxs?=
 =?us-ascii?Q?+SfjwdEmSfMBVEczXlwSydKGHPEI5Znnw/ix7tS0Bapby7KyWKpH7pQ9Bf6+?=
 =?us-ascii?Q?pUElLmop2brV2fJj+PaWNh85mJjGJn5CJVPRVzPKtwm5Bd+eZRmBqtLkhuSh?=
 =?us-ascii?Q?rk302fRqfVh3LZR953y2ykZKaA54/jtB8RCbZn3WBP5jfI/l8WVxuYvI4x/a?=
 =?us-ascii?Q?JEYuyyo+h9IbEpwGh/48jMjUKZmD07JUWWZbdc9aJ6bPDKZOEhS19cUp0aZ9?=
 =?us-ascii?Q?NR7exAakvX2deDAr/su0sbIQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:36.7287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f37ba1d-04ab-437e-37ab-08dce3a9477c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103
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

Access to client_name is protected by a mutex, and the 'clients' debugfs
file has been updated to print it.

Userspace MR to use this ioctl:
   https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428

If the string passed by userspace contains chars that would mess up output
when it's going to be printed (in dmesg, fdinfo, etc), -EINVAL is returned.

A 0-length string is a valid use, and clears the existing name.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 14 +++++++---
 drivers/gpu/drm/drm_file.c    |  5 ++++
 drivers/gpu/drm/drm_ioctl.c   | 51 +++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h        |  9 +++++++
 include/uapi/drm/drm.h        | 17 ++++++++++++
 5 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..5c99322a4c6f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -78,12 +78,14 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	kuid_t uid;
 
 	seq_printf(m,
-		   "%20s %5s %3s master a %5s %10s\n",
+		   "%20s %5s %3s master a %5s %10s %*s\n",
 		   "command",
 		   "tgid",
 		   "dev",
 		   "uid",
-		   "magic");
+		   "magic",
+		   DRM_CLIENT_NAME_MAX_LEN,
+		   "name");
 
 	/* dev->filelist is sorted youngest first, but we want to present
 	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
@@ -94,19 +96,23 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		struct task_struct *task;
 		struct pid *pid;
 
+		mutex_lock(&priv->client_name_lock);
 		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
 		pid = rcu_dereference(priv->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
-		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(pid),
 			   priv->minor->index,
 			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
-			   priv->magic);
+			   priv->magic,
+			   DRM_CLIENT_NAME_MAX_LEN,
+			   priv->client_name ? priv->client_name : "<unset>");
 		rcu_read_unlock();
+		mutex_unlock(&priv->client_name_lock);
 	}
 	mutex_unlock(&dev->filelist_mutex);
 	return 0;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 01fde94fe2a9..64f5e15304e7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
+	mutex_init(&file->client_name_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_open(dev, file);
@@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
 	WARN_ON(!list_empty(&file->event_list));
 
 	put_pid(rcu_access_pointer(file->pid));
+
+	mutex_destroy(&file->client_name_lock);
+	kfree(file->client_name);
+
 	kfree(file);
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51f39912866f..f593dc569d31 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -540,6 +540,55 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
+/*
+ * Check if the passed string contains control char or spaces or
+ * anything that would mess up a formatted output.
+ */
+static int drm_validate_value_string(const char *value, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i++) {
+		if (!isascii(value[i]) || !isgraph(value[i]))
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int drm_set_client_name(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv)
+{
+	struct drm_set_client_name *name = data;
+	size_t len = name->name_len;
+	void __user *user_ptr;
+	char *new_name;
+
+	if (len > DRM_CLIENT_NAME_MAX_LEN) {
+		return -EINVAL;
+	} else if (len) {
+		user_ptr = u64_to_user_ptr(name->name);
+
+		new_name = memdup_user_nul(user_ptr, len);
+		if (IS_ERR(new_name))
+			return PTR_ERR(new_name);
+
+		if (strlen(new_name) != len ||
+		    drm_validate_value_string(new_name, len) < 0) {
+			kfree(new_name);
+			return -EINVAL;
+		}
+	} else {
+		new_name = NULL;
+	}
+
+	mutex_lock(&file_priv->client_name_lock);
+	kfree(file_priv->client_name);
+	file_priv->client_name = new_name;
+	mutex_unlock(&file_priv->client_name_lock);
+
+	return 0;
+}
+
 static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
@@ -610,6 +659,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
 
+	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_NAME, drm_set_client_name, DRM_RENDER_ALLOW),
+
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 8c0030c77308..d4f1c115ea0f 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -388,6 +388,15 @@ struct drm_file {
 	 * Per-file buffer caches used by the PRIME buffer sharing code.
 	 */
 	struct drm_prime_file_private prime;
+
+	/**
+	 * @client_name:
+	 *
+	 * Userspace-provided name; useful for accounting and debugging.
+	 */
+	const char *client_name;
+	/** @name_lock: Protects @client_name. */
+	struct mutex client_name_lock;
 };
 
 /**
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..7fba37b94401 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+#define DRM_CLIENT_NAME_MAX_LEN		64
+struct drm_set_client_name {
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
+ * DRM_IOCTL_SET_CLIENT_NAME - Attach a name to a drm_file
+ *
+ * Having a name allows for easier tracking and debugging.
+ * The length of the name (without null ending char) must be
+ * <= DRM_CLIENT_NAME_MAX_LEN.
+ * The call will fail if the name contains whitespaces or non-printable chars.
+ */
+#define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.40.1

