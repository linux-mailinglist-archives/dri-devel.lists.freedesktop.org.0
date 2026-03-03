Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGFrFk8Kp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086461F3976
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4110E845;
	Tue,  3 Mar 2026 16:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="108X5uCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF5310E845;
 Tue,  3 Mar 2026 16:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXW61ExU5gYB8srxocW1LeJkdtlLTP1Sg6Wp5qyjQ3p4odJyTAKr/W+Bx2Cl5kLJIZlKwdFZLqb73DJpLFbO8Y+vUN55z2RouLLtIRaqrNyS72b0TYQVvWDTo5NZoRZvVvUndT2USSyUyohZkud+SulGmKaLmEoOrgKY34N/Zuo1UWnSolGvkt3+1UZ8kzIZs0uciV7jZ0oh3sOxXxyuegZt3qJF2EG1oiKDWxXC0S1DcW5hgry9nqAu14/bYc1Y5ckbrjbrfIp+qiURQ60ZV1l3947gVroQIUE1xxtddyhUnywXAgiKadoSXXrC7Uo7RrXuV+mKTKk6P8AZOYPYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkEdmwNR8ckXtW8pIg4ynDGB7M1H+OFLJKZu51pmxOk=;
 b=f0mD676CTT9iZqBZUpvCYUlEaCQYfynd1CdJCRKFVMjNdFYWq+3VtknWLV+m3tyatPU9Tg0UlXS11QFiIBeH0hFozOJaBv6i0PvPfjqcwQe9ZZym0OQdV7qLL6HBVwh2K7J7CH8+/oF0JadbbGzvEwHGw2E/Nf5Sc2whJ9k6e7g/9J2AmRBj6pRSShWKYu6ytX4PpTSMqauzTwn9pbjWfpH2EnGVvpgUEA/m0RXqJ3UhNQNuPBPxLbZo5Ca79MIUt1XcReV6/h+de5T3Zc5SwhYer+bUWkmWftH6iUnAwS4I8/Af1ZrdpRuH60MyIeb4MubP3ccrzApa3qNylZbu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkEdmwNR8ckXtW8pIg4ynDGB7M1H+OFLJKZu51pmxOk=;
 b=108X5uCKU2knpVu/QkOIRPeWQvgkvdgcpKo7jNqkeLqBBExscJmuJN5/XBUFTqT1p2lkNic3iFQebDrsC3vFx14/GPkVkCYyvMWL43wrzOZ4Wi7CRT89fyL8U8kxcMwnnVf7PXYWVYnZgi+sbpCaiRCc+CfY5AJUb0+pLVfhGjE=
Received: from SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::18)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Tue, 3 Mar
 2026 16:20:21 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::a1) by SN7P222CA0004.outlook.office365.com
 (2603:10b6:806:124::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:20:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:20:19 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/6] drm/amdgpu: move devcoredump generation to a worker
Date: Tue, 3 Mar 2026 17:18:15 +0100
Message-ID: <20260303161824.7765-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3f2c0b-99a5-4dc5-5b67-08de7940c469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: zJ/xa2C5bhJpgo7BMf2Za4ZD8awF7rNAiXfDTOnmBv9+7247iFHM+a+GdHtrGZMM9LsMW0+fLpH5ycDnxPf38dGbAbzWLyHNiD7myz/bsJiEDJnYW+QO4V07PLGcLamzuyGoCflIuecFKSsfpyO7Al5UPxvuqPb4yYboT+yOJRWDjcRSRuaVTUOIHFecrWorBBscWo27h/B8GVPgNPV8rWZQlMSx/mVKntCBHiqzmJuaDA253d0XUi3tKUej0EVolWcLXDS4pYmLuWWVtB69+8DT3nWA53MxMpQ0Gpm2GQF9wiv91bJ2t1bdnmksgTNfadx+Ne+ScZOaWazub0v9CIdSHHDRY5oIYmAznMOF/tMkOKF9oRJ/O8DV1zoTQL86E5e0b977ELgHWfOBVSmjl/C+z+1hjk/zhVVp5Hhw83K/iDgYLLO3iI+gp8hCFDU0IqzfAMvfgky70g6ao3KRyzW0TWqmw5BwoxeK05RcQteTy96eTtoDNndKiz0t3b4ucR3ZohPucf/8nkOZUaxK4vHmIuqg+KmncH8Cszwm9Po8Xz6FW/X0dh3QDgPi8IJxsPTwHD0X74aofAOnTvnu+H3xWo3ixzGqYqqq570z2SkSjiTwWhj5WAqGF5+GDVLaz+nCUzU9MuHrGyEW0aT6XBFVw5dMZEfmC9ImO6Q+6+1JHJodUPvSWjKddRU1YTXDiHtQqAPphRXS+l9EH5wlN0SR9OcFGAHWgQnsjS9uIXK/NVkenEA2kv1J/wiJjFGycmR99ubqvPBN2wY7kTFe4KxPrqgs88oHHg3COjN7quGzgV2Bfxs6UIlaAVUKZANhGJkcCGEJWZX2yKUJoUa5NQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0c+Wc85aWQognW/VPHF4dLMxfEIcf74SxbuJBGAycaM4AagbQJXE0W0ZH0tsp2RnD8Q+CXwMl9BPIakmJOmVObKX9qvBqlUI5go16nRj6cMOOPpswBsfbRpuPeaNXpPBpoeN+4gSfHmTDxKz+NAA+h9xMe2ZxKvseGvuK6e9m8EoQ7EY3sTpyLOYcERzX7kh8zw+waEostB5HC+Z448fix2GmNYtQfMIofB4AF+Jhq5B93Y8QZWVweCfAMY/Ub+jS9yG1BaRw755isgB956UufBB1REhm/Gn9YChcneI59ZQOVyutLhFwSnleg64REcpT+ACOOxbU9gpTARUCFCftxzFyydEqk9YqnCFn3fxYaSENOhXg2NC7xtHv6qsdnjw9rwEpeT+Gio4vedOmpGurBXanJaYisW1SGnb1cwKFzw5vL1ogxcmrdi8moHYioJL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:20:21.2646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3f2c0b-99a5-4dc5-5b67-08de7940c469
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301
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
X-Rspamd-Queue-Id: 086461F3976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Update the way drm_coredump_printer is used based on its documentation
and Xe's code: the main idea is to generate the final version in one go
and then use memcpy to return the chunks requested by the caller of
amdgpu_devcoredump_read.

The generation is moved to a separate worker thread.

This cuts the time to copy the dump from 40s to ~0s on my machine.

---
v3:
- removed adev->coredump_in_progress and instead use work as
  the synchronisation mechanism
- use kvfree instead of kfree
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 ++
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 83 +++++++++++++++++--
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +
 4 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 057c8bd2ad89..e31dac2421b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -328,6 +328,7 @@ struct kfd_vm_fault_info;
 struct amdgpu_hive_info;
 struct amdgpu_reset_context;
 struct amdgpu_reset_control;
+struct amdgpu_coredump_info;
 
 enum amdgpu_cp_irq {
 	AMDGPU_CP_IRQ_GFX_ME0_PIPE0_EOP = 0,
@@ -1200,6 +1201,11 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_domain	*reset_domain;
 
+#ifdef CONFIG_DEV_COREDUMP
+	struct amdgpu_coredump_info	*coredump;
+	struct work_struct		coredump_work;
+#endif
+
 	struct mutex			benchmark_mutex;
 
 	bool                            scpm_enabled;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 42a969512dcc..0c7fc3800f17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -32,8 +32,13 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		     bool vram_lost, struct amdgpu_job *job)
 {
 }
+void amdgpu_coredump_init(struct amdgpu_device *adev)
+{
+}
 #else
 
+#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
+
 const char *hw_ip_names[MAX_HWIP] = {
 	[GC_HWIP]		= "GC",
 	[HDP_HWIP]		= "HDP",
@@ -196,11 +201,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 }
 
 static ssize_t
-amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
-			void *data, size_t datalen)
+amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
 	struct drm_printer p;
-	struct amdgpu_coredump_info *coredump = data;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
 	struct amdgpu_ip_block *ip_block;
@@ -208,7 +211,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 
 	iter.data = buffer;
 	iter.offset = 0;
-	iter.start = offset;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -323,9 +325,63 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 	return count - iter.remain;
 }
 
+static ssize_t
+amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
+			void *data, size_t datalen)
+{
+	struct amdgpu_coredump_info *coredump = data;
+	ssize_t byte_copied;
+
+	if (!coredump)
+		return -ENODEV;
+
+	if (!coredump->formatted)
+		return -ENODEV;
+
+	if (offset >= coredump->formatted_size)
+		return 0;
+
+	byte_copied = count < coredump->formatted_size - offset ? count :
+		coredump->formatted_size - offset;
+	memcpy(buffer, coredump->formatted + offset, byte_copied);
+
+	return byte_copied;
+}
+
 static void amdgpu_devcoredump_free(void *data)
 {
-	kfree(data);
+	struct amdgpu_coredump_info *coredump = data;
+
+	kvfree(coredump->formatted);
+	kvfree(data);
+}
+
+static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
+{
+	struct amdgpu_device *adev = container_of(work, typeof(*adev), coredump_work);
+	struct amdgpu_coredump_info *coredump = adev->coredump;
+
+	/* Do a one-time preparation of the coredump output because
+	 * repeatingly calling drm_coredump_printer is very slow.
+	 */
+	coredump->formatted_size = amdgpu_devcoredump_format(
+		NULL, AMDGPU_CORE_DUMP_SIZE_MAX, coredump);
+	coredump->formatted = kvzalloc(coredump->formatted_size, GFP_KERNEL);
+	if (!coredump->formatted) {
+		amdgpu_devcoredump_free(coredump);
+		goto end;
+	}
+
+	amdgpu_devcoredump_format(coredump->formatted, coredump->formatted_size, coredump);
+
+	/* If there's an existing coredump for this device, the free function will be
+	 * called immediately so coredump might be invalid after the call to dev_coredumpm.
+	 */
+	dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
+		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+
+end:
+	adev->coredump = NULL;
 }
 
 void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
@@ -335,6 +391,10 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
 
+	/* No need to generate a new coredump if there's one in progress already. */
+	if (work_pending(&adev->coredump_work))
+		return;
+
 	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
 	if (!coredump)
 		return;
@@ -361,11 +421,20 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 
 	ktime_get_ts64(&coredump->reset_time);
 
-	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+	/* Update the current coredump pointer (no lock needed, this function can only be called
+	 * from a single thread)
+	 */
+	adev->coredump = coredump;
+	/* Kick off coredump formatting to a worker thread. */
+	queue_work(system_unbound_wq, &adev->coredump_work);
 
 	drm_info(dev, "AMDGPU device coredump file has been created\n");
 	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 dev->primary->index);
 }
+
+void amdgpu_coredump_init(struct amdgpu_device *adev)
+{
+	INIT_WORK(&adev->coredump_work, amdgpu_devcoredump_deferred_work);
+}
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index ef9772c6bcc9..b3582d0b4ca4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -35,12 +35,19 @@ struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
+
 	bool                            skip_vram_check;
 	bool                            reset_vram_lost;
 	struct amdgpu_ring              *ring;
+	/* Readable form of coredevdump, generate once to speed up
+	 * reading it (see drm_coredump_printer's documentation).
+	 */
+	ssize_t				formatted_size;
+	char				*formatted;
 };
 #endif
 
 void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		     bool vram_lost, struct amdgpu_job *job);
+void amdgpu_coredump_init(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 48540300b10a..1cb88955f651 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4503,6 +4503,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 	INIT_WORK(&adev->userq_reset_work, amdgpu_userq_reset_work);
 
+	amdgpu_coredump_init(adev);
+
 	adev->gfx.gfx_off_req_count = 1;
 	adev->gfx.gfx_off_residency = 0;
 	adev->gfx.gfx_off_entrycount = 0;
-- 
2.43.0

