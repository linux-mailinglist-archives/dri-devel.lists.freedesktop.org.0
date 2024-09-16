Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664C97A2FB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805CC10E36C;
	Mon, 16 Sep 2024 13:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EKFemAxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AAD10E36A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXkrLEMiO3qj4FnnlLBtZd5r08GiuyfkqW7y+NKNsSQrV3yEhQTS3qXVXcDoJfydX0hI6PJXGgTyRU0Ajq/VO1Hk7f16uLyn8AVbyn2OPxRSl+eqw3e2cDTVjDJbGgrs3rclFi2iwMS2iFrTjYK2UOPszcomBaqCf1ZoHXslzzWz0hutjfVeouRWSnxPzMuoRcMr38hsoAUi3ctzl6ln1vVrElrY7DyufluFp9dJkCcsn9bL1OyCr7eDGkeSPKlLHEyWj+Fadx1uXC84DK+LML1cxHH6KS7p943hoEqLJNQxkhEkNe6guynpz5RkZ7uv71AgNE7MuoRT8qSFxoGxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxBin7TpvrxHy4N5ztwKpib9uUQIoIcYM4Ix/WmF9M8=;
 b=KRWhbbzs5+xX5mAM95WZKuQhVr46eXKkta1G+Rd4O7L5jyJMZoGzbo5tVLVCRtkdnLSZw9QRFHVjBA8H4SvcJNAxp7+qduqf68gPh0bC00HTtE1h/S1daGBvE9xdk2zQPuEiW+hiJPXX0mro29+aIc4VpzxPDt7qLmfK1bqikztneQ63XNXU05WwWbVpQ0UrOVo6gLrmENI3HQECNJ91EmfAlYJUJRdVk1a6WM6iWmpWG+FMdMCfGmBaiKFQMLAmDR4YpPlbx2vDZLrRD/bUXQWn4ITQSS7IH4DiH1XfiFcQ+CngfrxDrY9B6gMlxAXBlK/uEyu7u1y/71L8eWkjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxBin7TpvrxHy4N5ztwKpib9uUQIoIcYM4Ix/WmF9M8=;
 b=EKFemAxXf8sstTPARPWKsesUqUF20riQH845EpweGc45wR9h8B07UsWc8Q1Y3CillBs72YPiMT6sqtZo6WTxuZUoikUvRIIzbfY6iSVUICKq5//4FG7cqP/7ILdmq1Kzv9NkRyEv9U5yrdZBnRITvpXXT2tX/uK8ssbdh72J484=
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 13:32:43 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::cf) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Mon, 16 Sep 2024 13:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 13:32:42 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 08:32:40 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 1/3] drm: add DRM_SET_NAME ioctl
Date: Mon, 16 Sep 2024 15:32:18 +0200
Message-ID: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8543d392-412f-47fc-d3a4-08dcd6540b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cj89A9YxtmjdMrKj1CXDzDB6OAkqA56ETlWveVA9QVJZW9c280TA4pRC+VRT?=
 =?us-ascii?Q?TVmzBH8jaBAffEHaJY7ttSJkMaOpBDOKnk8jIcjCLNCMTWVnhVjI0ZF03ft9?=
 =?us-ascii?Q?9/lxigDoHVtg01ybzw7qir/8svrcM0dc9N5whvkSV1SYcKbHR8Es4hAXEv0b?=
 =?us-ascii?Q?nTBPixMV1PFDV0xum2preHw7Tggx3uqzQI6nHEmu1eA2JGM2qyZq1KoBIHDx?=
 =?us-ascii?Q?t9pzAclsppnpGznUmPw1d56nLFCsV67aj/onBa2ZcI/paYaF86q6yQd+QaDx?=
 =?us-ascii?Q?3FO3H89LUDeQY3y8GFEdR9B539XUJD+CLO+IKG+oNQy8gdbCNwzBtp6chSVe?=
 =?us-ascii?Q?+gE5b0uzjx3UXRcd0gxZCRFTYc7zdR83OnkRL+uPQMZsarGL29YmcmqgkT/A?=
 =?us-ascii?Q?r2DVaG3YYdrn7vDbdN0IQ6ACkAKmkerAPFb1zx36augffPVr4DUKwY8MvuYK?=
 =?us-ascii?Q?qeQT9FIa/woivlsdhe0NGN7LDaHQ6ZRK+gg1gzkGP0vAp1gSkhvEJ+BPEjWl?=
 =?us-ascii?Q?MWc2mzHj86IWpVWRgP/rVUyjEJKxfsKGMlcu0BP6DuWFw29kaovxKALuPI7V?=
 =?us-ascii?Q?otZUvy/les6GBJgqEeo9P1wZ+ZfEeBPKORg0wu5jDAlKiQQRjzUYuaP4iyOj?=
 =?us-ascii?Q?ZIZ4gKwdnHzjnYyHNbgaqUWFsMZKBsQo0L7YTwPL3s0gQ1zAtFjQ7+9bqwlB?=
 =?us-ascii?Q?5QhVWwQGM7klAmpUctYUId2KjoKc7hze91PrP5zklz+AGyUmtQkMFLAWsyEr?=
 =?us-ascii?Q?Ohv8GEInlUyQs0OTI37uTYOAhvdz+tnkXxzPE12WMHmS0TAHQ+YC8ovNtW+6?=
 =?us-ascii?Q?dsRU2+60GBDVwpW3NSK9V7qbVfeFQt1F6K2flTfRHxTbPxdqPj0f8l2wFsxQ?=
 =?us-ascii?Q?Y1XkS8tuByV59hideZEIH8LViqO0tFgYXTYv4/Sgys56UAipeILFen7evyui?=
 =?us-ascii?Q?Iop9gq59H9mAVOQAlMciIfmy9PhU8A3MNQtLhuXJZ7PX8Gf48cA4b2oOnY/o?=
 =?us-ascii?Q?VO6mXoQdNfZLgV6FiZJXRQIAkaAOHAOYvx5oPG395PsMqUO0zGAHwMZX1J4a?=
 =?us-ascii?Q?xeCnTm7X0hn3ewTkrvXs9zHPR7TEcNB2JGYTdLyuRvGK4uvnZ3Xn5A59cb/Y?=
 =?us-ascii?Q?v0IKch8/DJYsWRJj3+7D8etlVycvAqJKcdscffSejYY1N6qbhWdFaxhOEMw0?=
 =?us-ascii?Q?86B+Iwy+xBGfXn7o/USchxfNOLM9v7LBNyFd3vGYtiDxd66njyB5t/dxiAXu?=
 =?us-ascii?Q?2MZMkMadMzyHUwJGAi5weJ1yq3kd/px5GNGElRw8ejlS/TfoFhcoYOUJDsbj?=
 =?us-ascii?Q?DIy426CO8YasyuMVvOSRrnis34ZGD1WL0PxcfgXVtUW//WmRHRzxyND8KBr7?=
 =?us-ascii?Q?qt26r5Hn1ym2kACZvbbkQw57pP3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:32:42.9474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8543d392-412f-47fc-d3a4-08dcd6540b02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
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
 drivers/gpu/drm/drm_debugfs.c | 12 ++++++----
 drivers/gpu/drm/drm_file.c    |  5 +++++
 drivers/gpu/drm/drm_ioctl.c   | 42 +++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h        |  9 ++++++++
 include/uapi/drm/drm.h        | 14 ++++++++++++
 5 files changed, 78 insertions(+), 4 deletions(-)

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
index 51f39912866f..b7d7bede0ab3 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -540,6 +540,46 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
+static int drm_set_name(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
+{
+	struct drm_set_name *name = data;
+	void *user_ptr;
+	char *new_name;
+	size_t i, len;
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
+	/* Filter out control char / spaces / new lines etc in the name
+	 * since it's going to be used in dmesg or fdinfo's output.
+	 */
+	len = strlen(new_name);
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
@@ -610,6 +650,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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

