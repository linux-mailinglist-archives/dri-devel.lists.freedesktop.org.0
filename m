Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C3AFE040
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDAB10E735;
	Wed,  9 Jul 2025 06:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FYJbhbuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F98610E737;
 Wed,  9 Jul 2025 06:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyqmykfvESh6aetbT/UJ+Btg5OVt7ag7860ENS9Cc+qhK2S7T7u4vD/3PK9bpS6LMgcqHJew1IWmWOlyz37gQqT8O7k3nbg8o1TQmJUlZxasccEO7NSiIR6X4wKOfGiQ2TICG+lk+E9k//NUPxGTxhFfAtNmnEgZ6C9AJOAUrKLnx/mqjLuCfwf49XEy7mKa4wAD9hDRvWdxqmm1hd2cRT+QPAxxSOmMwCcXetEYtIa/SmO+oHwTAf5gTVuEZpZ3dTXCpB8qT+lapS7v8qAd3mmDFhZ4/geq9M+sR/PFbcR6PsZrfFHtjwy7JIMNbS0MBNDO3oUJiRxM9okB+pvtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljj7zchQsTgffJ177SfkG1Fp1JkVAGve+OKBjCkBdnc=;
 b=ARh7MgH1Ye6QmSBPqzt66lsXO4HdU4UMcJ8QbOHrqHv7K1wp1KV9cTzZI+djlF/6wSXaOPN19IHTtG00HRwvkKZjstl318exHInX7kUX1F6jF3SSJq4JZcY+cyZIj0UDA6PsPAy0N1cwZv+wiXvgYJSznc3tS3znC1/rOxEmO1KP4bzlBLNeUQ8H6Yerm69M3OuR/GCEI0+wygVXiVTTlbdf50cD8NY4uMNobAN4nT86xh1JYpcs7oooYjY4P3cRhV9hyk3j4+KtXrP60TlHsclnErTfdopjZ+iioR8fAFQsIly5LTrFgaNq7OB5iXhOQONm0/mU50Bw+sCdz5oa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljj7zchQsTgffJ177SfkG1Fp1JkVAGve+OKBjCkBdnc=;
 b=FYJbhbukfMctJrVI89lk0RGTMsEWAGwfPDz0nbLuG13gXp43OdF7LwuX9rZZ7MvT+cfwaJCvfOkbdOAm+sR0mYqYtLxdl/uwyYV6HYqlsrtksp9Qeg5+Knp3GI4sL448NBOEm5V6DV1JDvw4fwDAarmHXYI9vGCaIsJFz4wqix4=
Received: from BLAP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::6)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 06:44:41 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::bf) by BLAP220CA0001.outlook.office365.com
 (2603:10b6:208:32c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 06:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 9 Jul 2025 06:44:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 01:44:40 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 01:44:34 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v4 4/5] PM: hibernate: add new api pm_transition_event()
Date: Wed, 9 Jul 2025 14:44:03 +0800
Message-ID: <20250709064404.839975-5-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709064404.839975-1-guoqing.zhang@amd.com>
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c216511-c823-4808-15b0-08ddbeb414c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3GKu4RGOLFFA5ijRwI27ZjiGjNYAfxKHBkxXaTQTRqJgeYnqAPsXMiNn31z9?=
 =?us-ascii?Q?EjYKLyY0X5M/llIspEPlwqM81r6dxrmlrY0AN3wfavlvcN5P0wTNyx9yiYus?=
 =?us-ascii?Q?vYlzsgTZLDfeRFRSxhYnLvaUw/W+54iIQ8xJdfYHvxvRTQI27bRu+KrZmLOe?=
 =?us-ascii?Q?W1VL+wUvCEa/SBMaavZdv2OkoCDaqDCn4DVcziiG38ASVSsJw3H84PtcNr4H?=
 =?us-ascii?Q?WZ3ugn7IZBPzCix624Z003iOdJflxH8ON62KLoQwri1pKOvCePmBOqtuRzmG?=
 =?us-ascii?Q?bcJgSde+EreEQ2IdcsulGgu4ieuI295tw8JK3JCZcOkw97SZR1mANPQfSL7Q?=
 =?us-ascii?Q?0PO3/aT7EdWbUy0u0W91q127pBzj0XHXmO00N05khb/Gd8CNgSTZZL2a62td?=
 =?us-ascii?Q?9Ztk39E4S0kwxp44KBbTfBY+hAFJ0XkDvOHipukz8OvYpEoFLmOkrOVTTUfC?=
 =?us-ascii?Q?C6EG2aH8BdO+U3Hu3b542wtyOvezLEQiJzKiftyWlSeJSsMQEOIt+ISJtc2L?=
 =?us-ascii?Q?H8/pbNQMe80wp+GHilwt2130x1rMl/F1P2q4qO3B7/WVMc7Pt7XHk85EXtx3?=
 =?us-ascii?Q?5CMme8fqDGAELC7fs/gjRAvlp/Hn+raV31/VPr7NLwEcgew9jI2QqTNzd13K?=
 =?us-ascii?Q?WSSd0T7HBwX9c8ZDHI7YEZS100AQp5DLSruDLv/63ztsfHBB1GXFyL79R50F?=
 =?us-ascii?Q?0H8Vs6lm0IzkK7y2pAzMkpsMmAJCkJoxgSZN1wYn/itfU+8YiVky6FdSj+va?=
 =?us-ascii?Q?HLzlTAKtvYMlWMfCrEC27CWEsyR8GyIXkrMsT9pcugfu6vNgap5ghD5QfVlA?=
 =?us-ascii?Q?7XlQyldxbFDbXBcDsV0qkN9TyFDmtYytSe95tiioGLtYAt66a01pkASihADS?=
 =?us-ascii?Q?8Cqceleiiz+YYWMZDL9pSFBQR4mhZcwcN5ZzPLy0ytA00uhSGvJgM+zHfWCe?=
 =?us-ascii?Q?VaA0BqT2qHIJrV2n0NpF7+Nrin07SJsQ5bKds4aqnONciicGkuHKGnsCRC9q?=
 =?us-ascii?Q?ZgynbxiysYI398a9wg0TKwYkf4k820lb4YnN4Yt6gpkUA1B0QwPm6XPEOkXl?=
 =?us-ascii?Q?GgqKWT1ORbcExi095KEhCvrxLrVPwfPDzGi7g3MoGGHMcH3crE9v3XPKynS1?=
 =?us-ascii?Q?LsihOSp7DGP3YxIDRLyOoaFYkNJCoFPQbyTzRkIGIwcPnUwUot+NoFBouNxL?=
 =?us-ascii?Q?tMeNSTYkr/ObYisHDPuzlaFpxFc/AB8yT0HtqpJ2/+8UeMDE6iMtqz7yPyha?=
 =?us-ascii?Q?LJXVkMwijNf3vwlz4i17QzNf95dr9zKTH55TBjt6XjBmnWSlaZgdDVLiXAsY?=
 =?us-ascii?Q?JiAaqncKFDQub+hdsNJ6cmyKu+eQ5I3ytAV7eBF6XdaWEmkSeMXNR6snHqfq?=
 =?us-ascii?Q?QARrgmsPudj5AmGZmRZmkCblftjf390ZBTjJpin/jZdrOghFx9mgMdeuHhQi?=
 =?us-ascii?Q?iZXTx+oUIltiEWHUMw/7tLE7BcQxmPsy1No6kxBJpNV1al5BDY7y7i3dSe0j?=
 =?us-ascii?Q?ccY/3KrgoTBPLwTyRH3bDKx03R2fVHClxr5kyirHGqmE6xdly4soXWc+rQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:44:40.7752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c216511-c823-4808-15b0-08ddbeb414c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765
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

dev_pm_ops.thaw() is called in following cases:
* normal case: after hibernation image has been created.
* error case 1: creation of a hibernation image has failed.
* error case 2: restoration from a hibernation image has failed.

For normal case, it is called mainly for resume storage devices for
saving the hibernation image. Other devices that are not involved
in the image saving do not need to resume the device. But since there's
no api to know which case thaw() is called, device drivers can't
conditionally resume device in thaw().

The new pm_transition_event() is such a api to query if thaw() is called
in normal case. The returned value in thaw() is:
* PM_EVENT_THAW: normal case, no need to resume non-storage devices.
* PM_EVENT_RECOVER: error case, need to resume devices.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/base/power/main.c |  5 +++
 include/linux/pm.h        | 85 +++++++++++++++++++++++----------------
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 40e1d8d8a589..7e0982caa4d4 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
 
 static DEFINE_MUTEX(dpm_list_mtx);
 static pm_message_t pm_transition;
+int pm_transition_event(void)
+{
+	return pm_transition.event;
+}
+EXPORT_SYMBOL_GPL(pm_transition_event);
 
 static int async_error;
 
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 78855d794342..7e7b843ba823 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -471,58 +471,59 @@ const struct dev_pm_ops name = { \
 #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
 #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
 
-/*
- * PM_EVENT_ messages
+/**
+ * pm_transition_event() - Query the current pm transition event value.
+ *
+ * One example is used to query the reason why thaw() is called.
+ * It will return one of 2 values in this usage:
+ * * %PM_EVENT_THAW: normal case.
+ * * %PM_EVENT_RECOVER: error case.
+ *
+ * For other usage, it may return other values. See :ref:`PM_EVENT_ messages`
+ * for all possible values.
+ *
+ * Return: One of the %PM_EVENT_ messages
+ */
+int pm_transition_event(void);
+
+/**
+ * DOC: PM_EVENT_ messages
  *
- * The following PM_EVENT_ messages are defined for the internal use of the PM
+ * The possible return values of %pm_transition_event().
+ *
+ * The following PM_EVENT_ messages are defined for the use of drivers and PM
  * core, in order to provide a mechanism allowing the high level suspend and
  * hibernation code to convey the necessary information to the device PM core
  * code:
  *
- * ON		No transition.
+ * %PM_EVENT_ON:		No transition.
  *
- * FREEZE	System is going to hibernate, call ->prepare() and ->freeze()
- *		for all devices.
+ * %PM_EVENT_FREEZE:	System is going to hibernate, call ->prepare() and
+ *		->freeze() for all devices.
  *
- * SUSPEND	System is going to suspend, call ->prepare() and ->suspend()
- *		for all devices.
+ * %PM_EVENT_SUSPEND:	System is going to suspend, call ->prepare() and
+ *		->suspend() for all devices.
  *
- * HIBERNATE	Hibernation image has been saved, call ->prepare() and
+ * %PM_EVENT_HIBERNATE:	Hibernation image has been saved, call ->prepare() and
  *		->poweroff() for all devices.
  *
- * QUIESCE	Contents of main memory are going to be restored from a (loaded)
- *		hibernation image, call ->prepare() and ->freeze() for all
+ * %PM_EVENT_QUIESCE:	Contents of main memory are going to be restored from
+ *		a (loaded) hibernation image, call ->prepare() and ->freeze() for all
  *		devices.
  *
- * RESUME	System is resuming, call ->resume() and ->complete() for all
- *		devices.
+ * %PM_EVENT_RESUME:	System is resuming, call ->resume() and ->complete()
+ *		for all devices.
  *
- * THAW		Hibernation image has been created, call ->thaw() and
+ * %PM_EVENT_THAW:		Hibernation image has been created, call ->thaw() and
  *		->complete() for all devices.
  *
- * RESTORE	Contents of main memory have been restored from a hibernation
- *		image, call ->restore() and ->complete() for all devices.
+ * %PM_EVENT_RESTORE:	Contents of main memory have been restored from a
+ *		hibernation image, call ->restore() and ->complete() for all devices.
  *
- * RECOVER	Creation of a hibernation image or restoration of the main
- *		memory contents from a hibernation image has failed, call
+ * %PM_EVENT_RECOVER:	Creation of a hibernation image or restoration of the
+ *		main memory contents from a hibernation image has failed, call
  *		->thaw() and ->complete() for all devices.
- *
- * The following PM_EVENT_ messages are defined for internal use by
- * kernel subsystems.  They are never issued by the PM core.
- *
- * USER_SUSPEND		Manual selective suspend was issued by userspace.
- *
- * USER_RESUME		Manual selective resume was issued by userspace.
- *
- * REMOTE_WAKEUP	Remote-wakeup request was received from the device.
- *
- * AUTO_SUSPEND		Automatic (device idle) runtime suspend was
- *			initiated by the subsystem.
- *
- * AUTO_RESUME		Automatic (device needed) runtime resume was
- *			requested by a driver.
  */
-
 #define PM_EVENT_INVALID	(-1)
 #define PM_EVENT_ON		0x0000
 #define PM_EVENT_FREEZE		0x0001
@@ -537,6 +538,22 @@ const struct dev_pm_ops name = { \
 #define PM_EVENT_REMOTE		0x0200
 #define PM_EVENT_AUTO		0x0400
 
+/*
+ * The following PM_EVENT_ messages are defined for internal use by
+ * kernel subsystems.  They are never issued by the PM core.
+ *
+ * USER_SUSPEND	Manual selective suspend was issued by userspace.
+ *
+ * USER_RESUME	Manual selective resume was issued by userspace.
+ *
+ * REMOTE_WAKEUP	Remote-wakeup request was received from the device.
+ *
+ * AUTO_SUSPEND	Automatic (device idle) runtime suspend was
+ *			initiated by the subsystem.
+ *
+ * AUTO_RESUME	Automatic (device needed) runtime resume was
+ *			requested by a driver.
+ */
 #define PM_EVENT_SLEEP		(PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
 #define PM_EVENT_USER_SUSPEND	(PM_EVENT_USER | PM_EVENT_SUSPEND)
 #define PM_EVENT_USER_RESUME	(PM_EVENT_USER | PM_EVENT_RESUME)
-- 
2.43.5

