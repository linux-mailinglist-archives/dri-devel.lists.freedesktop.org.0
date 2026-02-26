Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FiNNtQUoGlAfgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1D1A3948
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5510E86E;
	Thu, 26 Feb 2026 09:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pmCOdmMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDCF10E86E;
 Thu, 26 Feb 2026 09:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Leqod92T0b45K3e3PoaRZ27tJ8+TI6mRjKISX1xR/F9dOnT3bT5t7smWZuh811aMaeVTt9R3gltUNRPcoQdiU72l3sBlw4bb58ley1bNZ7Liuir3V5WrHf0ibli/m6hCylJEImLr46cOs/3we3yshgann1BkVRFicrO2GzoszqTKRYFs+iOuhMDvP7AB5usKpnewoqhtlGvqLoBfKXfZv1NJlFKuYk8Aq8c9OqRQXL7C0K4Gcmf4ZMzJQLeQGAV6kABg7Y22/m5u+ulfHLK7uwG0UPM0sXFbRw9E0YvkVFzYvDmy3kfPvmSbL/z5/c+1s2zNo9HxwOB9ftkf6Ab5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMfRkRFlyhqkfak4BrUxNUlUGUjSbbVvP3WBgl2mk4o=;
 b=NPI05loib6xTtc78ilFi+OPihTqmKUM66FvOzYwGdEGOIUBHlr9dWve2IEKrMYMyYYNn6nbAbvw26jCkfQpYgBubSJOYGp6yWe289xO6m2B4u/JXBH7UXV1nq4xqfH+1Zcf+0HcoEpTKLHKWetnT6ndJ4K0GOz74gI5lZ0VBQi7bVmfaeSNMAxKO5rjwIdArrmXPNm3Jn9bGMy23Km4rBPThu9pl5VhoJudwMR5qpUG4UtTdcVPlLei9uvpHFlKEhvKM2mgEoag3X1OgREZQeFvvW6cbd3hV313T8WdtD3HHU4pUwP9h/L9sZvh7nN7wg2aS4G/qRefQRfdgRwzW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMfRkRFlyhqkfak4BrUxNUlUGUjSbbVvP3WBgl2mk4o=;
 b=pmCOdmMZZn6tkTAEwI5DsZThm96hte/R/A1QFx8HlaIeZ3gc7MD1mQBxXt0FOJvRpo0Q0q6t959qkP9IEkysL5Jiwy2nKxPq6YYLQyKEpARPVfv1NBxeOWXh842WQ6eVe/86YYVW+cDO1fcyh/xLTAraOIbvCRChkA+M9w1YL3k=
Received: from SA9PR13CA0049.namprd13.prod.outlook.com (2603:10b6:806:22::24)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 09:39:24 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::c6) by SA9PR13CA0049.outlook.office365.com
 (2603:10b6:806:22::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Thu,
 26 Feb 2026 09:39:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:39:23 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:39:21 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/6] drm/amdgpu: move devcoredump generation to a worker
Date: Thu, 26 Feb 2026 10:37:20 +0100
Message-ID: <20260226093727.2584-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1662f621-c3ba-4255-5ee6-08de751aecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: O+OPo1+449rMazGQau3YOm16r1Xfyhh9tQuxYKd1+vDgSyP/UniVeysxJT/TOo4W/lsSH+IxvOa5mxccQm1lhOfWCsGJGeYQlYxg6rHyR3vzpRq60mKYNeS4RCgAdgyHzGszcjCPNG6UmBePGBxG9EjpPS+NljFFlqHXmstEnN2gZZvJ8fjR7/omgPrzjP6Y+aBkRH/oGOflNZQp+1OcqTmRtNTWY1N0DecnW/7ZyNFp4W9x4EPbC9TFaLtqLnvQ6NGljKNkWEQ8AMo++zA4VMI47iu+qbsdvizgsArlfwhAwBLQYKZyu97iRVQ3o/Ih20tAwHNrp/n5W3ZwEzehx7GDwvhg92FJyIlBxO0Acq5XFwSmZMvdhMZSIEarp20TghC6qZ7Eug/ULYDkhNNXH0NWkihbcZHgZPkUQGkLG5xnYKyX+lBPnQgwUy0Vz53XnHxkuxbJrSGGpVe29fcXq3eDa0bkD2D1BSYOttpROWuhjIEKoX+2xH95oawBjv9NkcI8Myy+frSRekC7y75FHHqt1kUBykbGfek89l5JShjVTwu2wkRzIr0P/wrmCYv1bGGaliFNdshq6dB7YTPs7L+PfxDOG/iHg7LyubWD3PMNh1p+augbGtRo80no2+EiOwlv2OgwKZcIiFIOSrGeGwT08RJYyHREfPAAZcrgJxTh919iVSaBNeVkZd9NC8i1uJBn129xWnnwpCUDVvV1+Hcnr+6hP3/BJPOCrMCFYL2Vv097Am6eW9wlDPDu8yHHvWMNggQSSMTGiKzSwqUeT/MDsvw3NXQ/RJpA9yehcLhoeL2nBtlHxuZJbFdszHbQRZSvMZEDeJamfbJVF/+cHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qWkoL36Sgsa4pMKrwcvlwfbwODrYiocTpA19+uXXjQzJLj7m9VkGO7FwmNdDpgjWytKwYFq7Yw967lcR8KB0ybdnQQByaOKvzCTW9Dq/6v2SaDMtfahWOn0YQuYK5jlx/bd4mdnHB1K+kZpANQNS6eoMuWN87K6yrYo7hPUzM2Rrk662P0Vj8bRUgQl77FxNKzYZi3XLFt7rSlSDsKEQA1OwpTUIa6Y9u6HspL6Hqifn689+DLwZQUHclmFhD4qXMAegv4rTWq6PigtWrjZgNsm+oiANj4qJcAPjRDNVxLD7yWQfiJv5sfCcNzxwOVbs2+gqeI10cwbotK8TiICPEDnnUY0R3DymW6dOvhOlykmxjLNEjxpYwn5SdQtqjCIKM4KwfbPTNByTVDgEeEwrT4Jffdx8TA03XUZlky+g4n95ycKd0YjOaAaSYvT84AU8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:39:23.7747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1662f621-c3ba-4255-5ee6-08de751aecf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8DC1D1A3948
X-Rspamd-Action: no action

Update the way drm_coredump_printer is used based on its documentation
and Xe's code: the main idea is to generate the final version in one go
and then use memcpy to return the chunks requested by the caller of
amdgpu_devcoredump_read.

The generation is moved to a separate worker thread.

This cuts the time to copy the dump from 40s to ~0s on my machine.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 ++
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 66 +++++++++++++++++--
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  9 +++
 3 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 057c8bd2ad89..ae81a428cfb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1200,6 +1200,11 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_domain	*reset_domain;
 
+#ifdef CONFIG_DEV_COREDUMP
+	/* If a coredump state capture is in progress don't start a new one. */
+	bool coredump_in_progress;
+#endif
+
 	struct mutex			benchmark_mutex;
 
 	bool                            scpm_enabled;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 42a969512dcc..0808ca98ccd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -34,6 +34,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 }
 #else
 
+#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
+
 const char *hw_ip_names[MAX_HWIP] = {
 	[GC_HWIP]		= "GC",
 	[HDP_HWIP]		= "HDP",
@@ -196,11 +198,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
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
@@ -208,7 +208,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 
 	iter.data = buffer;
 	iter.offset = 0;
-	iter.start = offset;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -323,11 +322,60 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
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
+	flush_work(&coredump->work);
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
+	struct amdgpu_coredump_info *coredump = data;
+
+	cancel_work_sync(&coredump->work);
+	coredump->adev->coredump_in_progress = false;
+	kfree(coredump->formatted);
 	kfree(data);
 }
 
+static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
+{
+	struct amdgpu_coredump_info *coredump = container_of(work, typeof(*coredump), work);
+
+	dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
+		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+
+	/* Do a one-time preparation of the coredump output because
+	 * repeatingly calling drm_coredump_printer is very slow.
+	 */
+	coredump->formatted_size =
+		amdgpu_devcoredump_format(NULL, AMDGPU_CORE_DUMP_SIZE_MAX, coredump);
+	coredump->formatted = kvzalloc(coredump->formatted_size, GFP_KERNEL);
+	if (!coredump->formatted)
+		return;
+	amdgpu_devcoredump_format(coredump->formatted, coredump->formatted_size, coredump);
+	coredump->adev->coredump_in_progress = false;
+}
+
 void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		     bool vram_lost, struct amdgpu_job *job)
 {
@@ -335,10 +383,15 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
 
+	if (adev->coredump_in_progress)
+		return;
+
 	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
 	if (!coredump)
 		return;
 
+	adev->coredump_in_progress = true;
+
 	coredump->skip_vram_check = skip_vram_check;
 	coredump->reset_vram_lost = vram_lost;
 
@@ -361,8 +414,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 
 	ktime_get_ts64(&coredump->reset_time);
 
-	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+	/* Kick off coredump formatting to a worker thread. */
+	INIT_WORK(&coredump->work, amdgpu_devcoredump_deferred_work);
+	queue_work(system_unbound_wq, &coredump->work);
 
 	drm_info(dev, "AMDGPU device coredump file has been created\n");
 	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index ef9772c6bcc9..4c37a852b74a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -35,9 +35,18 @@ struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
+
+	struct work_struct work;
+
 	bool                            skip_vram_check;
 	bool                            reset_vram_lost;
 	struct amdgpu_ring              *ring;
+	/* Readable form of coredevdump, generate once to speed up
+	 * reading it (see drm_coredump_printer's documentation).
+	 */
+	ssize_t				formatted_size;
+	char				*formatted;
+
 };
 #endif
 
-- 
2.43.0

