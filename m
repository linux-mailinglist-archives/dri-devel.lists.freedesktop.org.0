Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E39880B5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924A010EC8A;
	Fri, 27 Sep 2024 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N8gy/a3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C9A10EC85;
 Fri, 27 Sep 2024 08:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2kHi7uKugrCSyt4GWltG9etOjiCcClZ3zByJ8X82aO11ebVoWm3d/YMUyR/Z05ntq9+Q1pxXn6bNWV9EUJdW4FO3/9rJr9sPp7cyeoUppkeSfIYU2DqCslS0NcaegcARCzjiCYhJ8DbV90W8R0Eid0/sqdNzIewWz0tzOo/h7XSrP2z8lpqzloHe05pSAgKjjbR4wTm8eNMMh0i5MfAOKwUsFl2ox0v/RHrFc1vsd7d/qu2E4d79zEaMsbkIak8qFWv5cmeGz4RGb/xhRWzUnp/K7BwWcOYl0n7OHwcPyqAJnv/BiLxLDtIYLPY85zaQkOwBq679xzInxj8WvCrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TWxvS1gAAc2vuvvWzVkLgCBNimbGdd07BtLlJIAljE=;
 b=T9XKxYiC6aJOX4tB+n1/8pMYCMA/YXZXQL9SMAZQwo5L8EfaQJYsP5t3K1ej9C2DWgqFwy2BZPo13qRlHsNFxHeXnAG3BsnOJ3nFSPkR309ZqVco5+PR3ho4zysXsPa4q6ZhAyaIoI4K+pD0JdMrSyhA3NWrZnMFJ3yY8p4RQ2HhCLvvCo0ddhr5EMT+ZxNtU+XiHC91+B4YRba4d0dqRt/Cha36j+dVdjKZpnk0Mxlw4dWVCwymCSr9+c2vcz/9mFQLtbsyKBfY7kTDr8G2z0gThsOJU5i219WQ1qFsQUbvxF2zcVRYxXqzis9NneMP5jybAu93h6iCySy8bbgFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TWxvS1gAAc2vuvvWzVkLgCBNimbGdd07BtLlJIAljE=;
 b=N8gy/a3h1mgqRx7YG9NdO6yjFrKDE+QjXC+6soHo2TB5E8jk3yCGLZmIkRCAn7jesxYNm9J56bpOLj98PGU8G29RLuOUWgWzt3yLT8wXnGFFPs7oZtHwE1c1p7r0sgiOBxBcmdMp1z2KwW5P+PM5cFOZX+GnhQrzMv2X3dOey+Q=
Received: from BLAP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::17)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 08:49:32 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::e2) by BLAP220CA0012.outlook.office365.com
 (2603:10b6:208:32c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:32 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:29 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 1/6] drm: add DRM_SET_CLIENT_NAME ioctl
Date: Fri, 27 Sep 2024 10:48:37 +0200
Message-ID: <20240927084848.263718-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 48320d37-9586-4a97-fc22-08dcded14e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x1orUmQDjPG/2kXk0GMNwe71HVFGpMw76GJVjDLVQiMNMAie+eBZmF5OCBRt?=
 =?us-ascii?Q?tnoZF3XfnrZkfx3Or70mZSJAHXQKwqgsI/kXQWfUjNgwJ39p2T9kikIPZICz?=
 =?us-ascii?Q?8qGmdRRimDiyCpZU3MIih5MOxXeyR7dwkanmqIq/SkifS9o46VCMoBix95EZ?=
 =?us-ascii?Q?3+RPBq5bPs37/TQK6hi/QfbNY9j/eUS0hd5V6WneT9VyM7wy6hNtO00elbNy?=
 =?us-ascii?Q?djGYsw8JP61goMY+NSVLio60/pZMS3RpEob4G2AWgLJyRRkXoIpSOPqbEJeF?=
 =?us-ascii?Q?V11C3LuFp6wZWVa+rRlY3z6nICdQw1RML2QPmNV1sJq5IjM+S6rvJU+39FKy?=
 =?us-ascii?Q?47XGhnJ1DjuzAVDwxY3HnrNrzCaZbOpOJi9BTHV0P5iuJv3FRMZNFDQG2FQr?=
 =?us-ascii?Q?Y/0Shgv5j/296/Osf5IhyUMmEFoQHwIIl7No/JLbhYKv+SRy8+/bUlkssqHr?=
 =?us-ascii?Q?Mqof/3FMhNS53PaORuSCkKDDpzEE+pGOfx60oWNqb9qPzKYdf+8MdgbwnaXO?=
 =?us-ascii?Q?IP/IPfnlRHBc8j+T5NjE+ibEeqfWL9skLzn0pR5Y3aWdVFyFBDcziAF38ptn?=
 =?us-ascii?Q?r791t7S+fqrRAcUpUo1uCQ+lYHRKjCVV09iq3P5HpGMRqKwRWfjqP8ehgBGh?=
 =?us-ascii?Q?tBphCv1xvNQ7Yu9usjQ71K+qPTIGuY7nBAcWE8WlPt6+4lP5ui+QTKHNFhn9?=
 =?us-ascii?Q?S5WY2UJbXlcS5EkdbXdfNax2W/lfnqq730FRaMb6gi1XtxlMdbyjkI7FVTVJ?=
 =?us-ascii?Q?uJrDS68fHw4kxB8MCcU3z+Hq4ur6K0BOMvGXLUTMxYQ3M/YM5xvRPrh35x5M?=
 =?us-ascii?Q?7bXHIWkzs487B7XEWa6lrnZ+o0oUzcfeHYW69J2CfEAVnYSlYc4XtV61bMig?=
 =?us-ascii?Q?yVe94re2Ww0wKKlCH1sVj0woNEcI59R79phrm2dX9CUyKgcdViLylTbsTfYL?=
 =?us-ascii?Q?ZtHWyNSRnoeQDCGsiMb+AW2xC1HUzJ8Hlfjx0jNb9ntY4r4aXo0UnG6bp9wC?=
 =?us-ascii?Q?cUdCov+X3XqSFz8ON0Dc2ZnhMUjts9UzRgsOo865KiNYVETA5bICZEMJYaQ1?=
 =?us-ascii?Q?YB6o/Hmau96qHj1d3JEWAxc2d/ejSMnvUP04geaaKW4e78DY7hTAOmeihUB8?=
 =?us-ascii?Q?uuUcBZ3x1HOJkxrbmoaYv9fx/0t62tJeuNwZmzoCK1xvbbO5+mLESyjAycAJ?=
 =?us-ascii?Q?0HM2W2Y1r7cz+Txk7s1Jd/lLIyOLha6TjdctqvuaCQ0c58PoDVK3iY0QoLt2?=
 =?us-ascii?Q?2pXicAVKwiltbAsnEL5eHXfspYkuKw9XPFw0xUHIh3hhkXVb+RbVRgErNYr+?=
 =?us-ascii?Q?jG/VRk1P9TzICB9DiSQtHM02?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:32.1858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48320d37-9586-4a97-fc22-08dcded14e47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 14 ++++++---
 drivers/gpu/drm/drm_file.c    |  5 ++++
 drivers/gpu/drm/drm_ioctl.c   | 55 +++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h        |  9 ++++++
 include/uapi/drm/drm.h        | 17 +++++++++++
 5 files changed, 96 insertions(+), 4 deletions(-)

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
index 51f39912866f..df8d59bd5241 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -540,6 +540,59 @@ int drm_version(struct drm_device *dev, void *data,
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
+		if (value[i] <= 32 || value[i] >= 127)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int drm_set_client_name(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv)
+{
+	struct drm_set_client_name *name = data;
+	void __user *user_ptr;
+	char *new_name;
+	size_t len;
+
+	if (name->name_len > DRM_CLIENT_NAME_MAX_LEN)
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
+	if (len != name->name_len ||
+	    drm_validate_value_string(new_name, len) < 0) {
+		kfree(new_name);
+		return -EINVAL;
+	}
+
+	mutex_lock(&file_priv->client_name_lock);
+	kfree(file_priv->client_name);
+	if (len > 0) {
+		file_priv->client_name = new_name;
+	} else {
+		kfree(new_name);
+		file_priv->client_name = NULL;
+	}
+	mutex_unlock(&file_priv->client_name_lock);
+
+	return 0;
+}
+
 static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
@@ -610,6 +663,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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

