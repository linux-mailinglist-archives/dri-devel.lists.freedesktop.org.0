Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03016CADB0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0298410E718;
	Mon, 27 Mar 2023 18:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2580C10E6CF;
 Mon, 27 Mar 2023 18:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gfn+XL2A3vYDo9ZDjfosFx+SaWrzqAX2kCh8S3NOACm3ScIhp4g3Eygs0kXjwI0jt6nV3dH2gU0ByK3/QLkAXA31txngckbPywewYFY2YgXQZwMm9WeXELWVt5jRuC/ntVVaVyrN2eKQxKWbLYMYQ1Lczj2jf3qfVWpvESPSTdrc95snr9UTiwUMAi3gZckKBiZXpw6ItRZqP0T5L7Q8JDWF1qNu+v4r9iPKzLLpgWqnwLODQRLNVyNpkryA+Ly88scHENML/8sWgZ3xC2IDtAndjrI9rzhzmRHgxtKF8/9b26BU2Wzrgr/PtcwZL1Ibdo+zu2KYkbmrDwbKtBwrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+GHmS3I2IftCAvgwqxNn3cl13rxedb1jSrk3ivwK/E=;
 b=BirXuOTt9jkfYWu28OSOnqxbFt/8CZUNLem5FGAt88VDnEykl0hhdo4MXWVteyWzcTAfAnx/5eoPYLwmUbh55IWho34k8Px/sz7J1ABcnTGzmCbtB+xJ0MjrgAZL/m1WRFCZ/n5ePBHg+VsFL6ehniqmg72B95Rr2KS0jnryuGcD1yQyP2YSDmrdrifokwqXbzZIlv17BYyHmK0DHWNpk6t/TSjkzzvGbfTVriRO95DmuIGBSkA6BM0qcrIbj7yLfBpgUjxaTuMvauyj8PAbCsW9a9VFHxwFhXkjArb77ADJiIbxv1NWdftziIPDcdxXSvwczFZVUjCLsh0CB09sLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+GHmS3I2IftCAvgwqxNn3cl13rxedb1jSrk3ivwK/E=;
 b=U8lOoa0+VKtJmhKPtUNe8m/4bEiShdjDCn9K8LVUr8uRrUdmbeesF9yo7mEKgZh/ROz4PmEiMS9Zuyoh1wZJ9JLP+PeUw9V5H3uO7cXwFFyX2kWSZdPUCWSKkVNj9jWFipmwpPgu1fTSqXd+gendP/j8M98i6uuyIDcFv6y2TdQ=
Received: from CY8PR02CA0002.namprd02.prod.outlook.com (2603:10b6:930:4d::16)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:59 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::2d) by CY8PR02CA0002.outlook.office365.com
 (2603:10b6:930:4d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:59 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:58 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/34] drm/amdkfd: add debug set flags operation
Date: Mon, 27 Mar 2023 14:43:33 -0400
Message-ID: <20230327184339.125016-28-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 03446f49-10e5-4114-6d27-08db2ef33a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6M0IsK0w03VeIbdymqOHlmU2eX7Y2dkGoYsHR9mLEQYwnA+6+Ansh4w/Ep5N9GXC4ocYwJqn+n1W9+ycUgxg0hVYuDHmPwWT4zDuQpykteH1TK7HU8S5A1jbP0YzHU0fwTAI/TARQBDNSNOTZUivD4M9HAaotDeGO6QKcS7fOHY3iRf8b3CKl1fFHiI28ShfPqIsLPYI+vE2Erzt1iNPXVOWee50xMJPbpZYtmPFMLYv0RJX3gTywJbFuFDsfd1x022bGupX8SUpWUWxu2052O6Y0FS/qnbYsj3uchiG0mittkwAcvipwnd9Vfc7i+ZU7xAPUDzCd62Ai3WhQgGfrafuWt9Om5P3f2JfI19/HUypwuR+ZpOPNYI5PtatHOvlaXFK0mwEhRIL1QuFXdMKgYvFQkM7crH3MIl5FhFHgVwHKmYkZfuKF8eDrfidagfnEerYY4oH8mLXUUeobC2+Ceh6U9Me8K7tzWWlzVWaK937PLDTkHn3K130eNNB1dfB11sQnblBDZeTsxxeeESj7q2fa2W/sv19aQDCBj2Fw+cPdZaK+opoVrSdCh7eNEk9seU8QXNOuGgSDLHgH+U36AlLpMivp8wgRllWvgFUE0eTpUl1uAA40P7bzCq5rVPzoZmV64GNTC2jIItcrMeAtc6qLFow8nFDabb+z8MhIHNifFkyf9Vs5QDWX9vOz+xzTdLECOGTeXGnqlUP5/9qMacys1cBtA3XCYUFghks/s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(6666004)(316002)(26005)(1076003)(4326008)(54906003)(110136005)(8676002)(41300700001)(47076005)(5660300002)(336012)(44832011)(426003)(2906002)(83380400001)(82740400003)(81166007)(186003)(70206006)(70586007)(450100002)(36860700001)(356005)(16526019)(36756003)(40460700003)(82310400005)(8936002)(2616005)(7696005)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:59.2218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03446f49-10e5-4114-6d27-08db2ef33a52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the debugger to set single memory and single ALU operations.

Some exceptions are imprecise (memory violations, address watch) in the
sense that a trap occurs only when the exception interrupt occurs and
not at the non-halting faulty instruction.  Trap temporaries 0 & 1 save
the program counter address, which means that these values will not point
to the faulty instruction address but to whenever the interrupt was
raised.

Setting the Single Memory Operations flag will inject an automatic wait
on every memory operation instruction forcing imprecise memory exceptions
to become precise at the cost of performance.  This setting is not
permitted on debug devices that support only a global setting of this
option.

Return the previous set flags to the debugger as well.

v3: fix var declare spacing and add rewind to failed flag setting.

v3: make precise mem op the only available flag for now.

v2: add gfx11 support.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 58 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  1 +
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 194221ab0f25..da3478b133bd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3021,6 +3021,8 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->clear_node_address_watch.id);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
+		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
+		break;
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 4b8b71b1a322..5d3193ae71e3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -23,6 +23,7 @@
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
+#include <uapi/linux/kfd_ioctl.h>
 
 #define MAX_WATCH_ADDRESSES	4
 
@@ -423,6 +424,59 @@ static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
 			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
 }
 
+int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags)
+{
+	uint32_t prev_flags = target->dbg_flags;
+	int i, r = 0, rewind_count = 0;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		if (!kfd_dbg_is_per_vmid_supported(target->pdds[i]->dev) &&
+			(*flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP)) {
+			*flags = prev_flags;
+			return -EACCES;
+		}
+	}
+
+	target->dbg_flags = *flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP;
+	*flags = prev_flags;
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+			continue;
+
+		if (!pdd->dev->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r) {
+			target->dbg_flags = prev_flags;
+			break;
+		}
+
+		rewind_count++;
+	}
+
+	/* Rewind flags */
+	if (r) {
+		target->dbg_flags = prev_flags;
+
+		for (i = 0; i < rewind_count; i++) {
+			struct kfd_process_device *pdd = target->pdds[i];
+
+			if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+				continue;
+
+			if (!pdd->dev->shared_resources.enable_mes)
+				debug_refresh_runlist(pdd->dev->dqm);
+			else
+				kfd_dbg_set_mes_debug_mode(pdd);
+		}
+	}
+
+	return r;
+}
 
 /* kfd_dbg_trap_deactivate:
  *	target: target process
@@ -437,9 +491,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 	int i;
 
 	if (!unwind) {
+		uint32_t flags = 0;
+
 		cancel_work_sync(&target->debug_event_workarea);
 		kfd_dbg_clear_process_address_watch(target);
 		kfd_dbg_trap_set_wave_launch_mode(target, 0);
+
+		kfd_dbg_trap_set_flags(target, &flags);
 	}
 
 	for (i = 0; i < target->n_pdds; i++) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 63c716ce5ab9..782362d82890 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -57,6 +57,7 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
 					uint32_t watch_address_mask,
 					uint32_t *watch_id,
 					uint32_t watch_mode);
+int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags);
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
 					unsigned int queue_id,
-- 
2.25.1

