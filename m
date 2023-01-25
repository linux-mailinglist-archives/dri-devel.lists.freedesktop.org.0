Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5A67BB4E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562FB10E81D;
	Wed, 25 Jan 2023 19:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE1D10E13F;
 Wed, 25 Jan 2023 19:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwUjeU/Uq455ckvV4jPZX5KjOxfu4lDrkKCTUgtuM55R1uVsdAUydwJOp3RM4zdbywmHeSbcvUtA7dNO9ce0QYC/TjudjrWPYWVjpMZQSEqjzDtqjSzbs/OOBugdYNGASTnPEGdG35fdVeulyfTQsi5jHeAhgFWU1Qy5nEUE0LD1Gc3DRu1CLNDgrluLUrxjge7Qx4mXIQ7CZDGnERJkexTgdx5/gyCzx0s/86o86sc1ymBJQH8ffbfgX3hTjH4SxQa5CuKqJchNVAT/zGhqdraX6vziKyZdcbKbUH69q8XamclyCs1giAfs8EJP7gTCwS+7PtM0A1JbY3gzep1J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq1OH3hIVL6d2nKPJAwoyve1yl4Yw4/VhMh6AWxj1mM=;
 b=VKjY/HW590L7oEbqvF375/pH96yNBD6JFeboSQAmNkKRjJqsr2M/CXyre1FueQwAzYSVRGEQUlUNkfxbt4CyqgpOY5x75Tle356rLW2UyGF5TEMiGDT0DEKtLNrZ6FQqmdHY3a8dTDqwDK2V5J1bkkB573E/EpGZmZWk9TjWCw2uThPpqgdUhZvns6g9vrJnc0fuVu6XKSABV+ltT+073CcBdGHWRd7K/q/pMUQ/ggrC3EAqakVs+pUdIpJzcmb/opYG/6cPcn8lUTG2pIK1J8DHSnFxiiu1iUGfZ5ieHJrUAL2ZUVjF+binfvTnpDyzSHhfCM8uKFkxX1GVkyGNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq1OH3hIVL6d2nKPJAwoyve1yl4Yw4/VhMh6AWxj1mM=;
 b=UX4xnWBI8pFOsqoTYTk6N77gtF6RDuhdrXlYKNLESM/1Eg3oUP+JCZ6NQ9vDPcI0KaoQZI650OXb5oqHWdmD14T6CdEEBKRifoErc1X8qzVBkGmagmFzDti8GEl1GG1Smus0GZ54OGFmmP7WByoxsL70dO0u/qwdmrgYUvE6mqk=
Received: from BN9PR03CA0789.namprd03.prod.outlook.com (2603:10b6:408:13f::14)
 by CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:16 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::23) by BN9PR03CA0789.outlook.office365.com
 (2603:10b6:408:13f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:15 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:13 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/32] drm/amdkfd: add debug and runtime enable interface
Date: Wed, 25 Jan 2023 14:53:30 -0500
Message-ID: <20230125195401.4183544-2-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|CH2PR12MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: ec99b3f6-f0a5-4c6e-f0bf-08daff0df074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyIZmf1LXv2M5P0bpgxLrcjc+EaRuET5bBOYKGdTb0eW5euyw/n1GH8CWdHUky7FxYmyTjS+x2JhvMgfZJcM+rdg0KnE/eZR4l08HiBPDEP4FqsKaXsBeBcTHw/ybEFZiiQ4a/1OLWZrBMqVUWdYIvCAvX7AC6GR/DvyjAb5RZyWoF2z497PJgbZbhn0pxgnqbr5vcxJMqGrwQWndNHSmhwuH8alSVesTi7kAyBd8o2mGy+t8rgEKbifaKLqIQFGUPciy1mI3hK3sJX2ZmULqsN0U9uSau+jLp+VtiUlJPWEdqF875tIZmFquA2tG+Rd+bSbJEBagrqb86Qsdarh/d4ksRe9AvSws2mn/Jssm3oU0y6rxZL6XpqrVQpF8qQNks1OgJjE8WH5VALyCrhZ3Jb308oNgKH8Ibr5e6+gfvx5+wBVIRszO8XK1Y18HpRl8qBWh3bUdaBEOIk83QCPvNk2QBCCvRx/oezZHgOcF4+MKwCKPsFrOuba7C7cSXxYSiOKaaIa/+c3vZK54sLdI4tnvaSFmTG/8+CYJJo17Aptz/Tw7ZTrLyIEckKtIsBxZwIsbfnv6u/dLGoOIaPzWCuf440e8/9mNmTFSMOvLqLF6Z16/Qs7LjegUSryVmg28XccRygsTPpEqwTu9s04oor+dckMlD1zkvcwvUobxlSjpdcxx04Mx7I48ZfTMAnywsNMBZYsCQnxA+JNeOTFwaSzBDhV4WYvE211AE4kFdU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(40470700004)(36840700001)(46966006)(70586007)(36756003)(40480700001)(2906002)(40460700003)(81166007)(82740400003)(82310400005)(6666004)(36860700001)(83380400001)(8936002)(86362001)(41300700001)(44832011)(30864003)(26005)(5660300002)(186003)(16526019)(316002)(8676002)(336012)(70206006)(110136005)(7696005)(1076003)(478600001)(54906003)(356005)(4326008)(47076005)(450100002)(426003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:15.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec99b3f6-f0a5-4c6e-f0bf-08daff0df074
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4956
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the GPU debug operations interface.

For ROCm-GDB to extend the GNU Debugger's ability to inspect the AMD GPU
instruction set, provide the necessary interface to allow the debugger
to HW debug-mode set and query exceptions per HSA queue, process or
device.

The runtime_enable interface coordinates exception handling with the
HSA runtime.

Usage is available in the kern docs at uapi/linux/kfd_ioctl.h.

v2: was previously reviewed but removed deprecrated wave launch modes
(kill and disable).
Also remove non-needed dbg flag option.
Add revision and subvendor info to debug device snapshot entry.
Add trap on wave start and end override option.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  48 ++
 include/uapi/linux/kfd_ioctl.h           | 663 ++++++++++++++++++++++-
 2 files changed, 710 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f79b8e964140..d3b019e64093 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2645,6 +2645,48 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
 	return ret;
 }
 
+static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
+{
+	return 0;
+}
+
+static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_dbg_trap_args *args = data;
+	int r = 0;
+
+	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Debugging does not support sched_policy %i", sched_policy);
+		return -EINVAL;
+	}
+
+	switch (args->op) {
+	case KFD_IOC_DBG_TRAP_ENABLE:
+	case KFD_IOC_DBG_TRAP_DISABLE:
+	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
+	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
+	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
+	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
+	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
+	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
+	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
+	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
+	case KFD_IOC_DBG_TRAP_SET_FLAGS:
+	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
+	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
+	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
+	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
+		pr_warn("Debugging not supported yet\n");
+		r = -EACCES;
+		break;
+	default:
+		pr_err("Invalid option: %i\n", args->op);
+		r = -EINVAL;
+	}
+
+	return r;
+}
+
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
@@ -2754,6 +2796,12 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
 			kfd_ioctl_get_available_memory, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_RUNTIME_ENABLE,
+			kfd_ioctl_runtime_enable, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_TRAP,
+			kfd_ioctl_set_debug_trap, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 42b60198b6c5..9ef4eed45c19 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -109,6 +109,32 @@ struct kfd_ioctl_get_available_memory_args {
 	__u32 pad;
 };
 
+struct kfd_dbg_device_info_entry {
+	__u64 exception_status;
+	__u64 lds_base;
+	__u64 lds_limit;
+	__u64 scratch_base;
+	__u64 scratch_limit;
+	__u64 gpuvm_base;
+	__u64 gpuvm_limit;
+	__u32 gpu_id;
+	__u32 location_id;
+	__u32 vendor_id;
+	__u32 device_id;
+	__u32 revision_id;
+	__u32 subsystem_vendor_id;
+	__u32 subsystem_device_id;
+	__u32 fw_version;
+	__u32 gfx_target_version;
+	__u32 simd_count;
+	__u32 max_waves_per_simd;
+	__u32 array_count;
+	__u32 simd_arrays_per_engine;
+	__u32 capability;
+	__u32 debug_prop;
+	__u32 pad;
+};
+
 /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
 #define KFD_IOC_CACHE_POLICY_COHERENT 0
 #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
@@ -766,6 +792,635 @@ struct kfd_ioctl_set_xnack_mode_args {
 	__s32 xnack_enabled;
 };
 
+/* Wave launch override modes */
+enum kfd_dbg_trap_override_mode {
+	KFD_DBG_TRAP_OVERRIDE_OR = 0,
+	KFD_DBG_TRAP_OVERRIDE_REPLACE = 1
+};
+
+/* Wave launch overrides */
+enum kfd_dbg_trap_mask {
+	KFD_DBG_TRAP_MASK_FP_INVALID = 1,
+	KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL = 2,
+	KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO = 4,
+	KFD_DBG_TRAP_MASK_FP_OVERFLOW = 8,
+	KFD_DBG_TRAP_MASK_FP_UNDERFLOW = 16,
+	KFD_DBG_TRAP_MASK_FP_INEXACT = 32,
+	KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO = 64,
+	KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH = 128,
+	KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION = 256,
+	KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START = (1 << 30),
+	KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END = (1 << 31)
+};
+
+/* Wave launch modes */
+enum kfd_dbg_trap_wave_launch_mode {
+	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL = 0,
+	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT = 1,
+	KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG = 3
+};
+
+/* Address watch modes */
+enum kfd_dbg_trap_address_watch_mode {
+	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_READ = 0,
+	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_NONREAD = 1,
+	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ATOMIC = 2,
+	KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ALL = 3
+};
+
+/* Additional wave settings */
+enum kfd_dbg_trap_flags {
+	KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP = 1,
+};
+
+/* Trap exceptions */
+enum kfd_dbg_trap_exception_code {
+	EC_NONE = 0,
+	/* per queue */
+	EC_QUEUE_WAVE_ABORT = 1,
+	EC_QUEUE_WAVE_TRAP = 2,
+	EC_QUEUE_WAVE_MATH_ERROR = 3,
+	EC_QUEUE_WAVE_ILLEGAL_INSTRUCTION = 4,
+	EC_QUEUE_WAVE_MEMORY_VIOLATION = 5,
+	EC_QUEUE_WAVE_APERTURE_VIOLATION = 6,
+	EC_QUEUE_PACKET_DISPATCH_DIM_INVALID = 16,
+	EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID = 17,
+	EC_QUEUE_PACKET_DISPATCH_CODE_INVALID = 18,
+	EC_QUEUE_PACKET_RESERVED = 19,
+	EC_QUEUE_PACKET_UNSUPPORTED = 20,
+	EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID = 21,
+	EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID = 22,
+	EC_QUEUE_PACKET_VENDOR_UNSUPPORTED = 23,
+	EC_QUEUE_PREEMPTION_ERROR = 30,
+	EC_QUEUE_NEW = 31,
+	/* per device */
+	EC_DEVICE_QUEUE_DELETE = 32,
+	EC_DEVICE_MEMORY_VIOLATION = 33,
+	EC_DEVICE_RAS_ERROR = 34,
+	EC_DEVICE_FATAL_HALT = 35,
+	EC_DEVICE_NEW = 36,
+	/* per process */
+	EC_PROCESS_RUNTIME = 48,
+	EC_PROCESS_DEVICE_REMOVE = 49,
+	EC_MAX
+};
+
+/* Mask generated by ecode in kfd_dbg_trap_exception_code */
+#define KFD_EC_MASK(ecode)	(1ULL << (ecode - 1))
+
+/* Masks for exception code type checks below */
+#define KFD_EC_MASK_QUEUE	(KFD_EC_MASK(EC_QUEUE_WAVE_ABORT) |	\
+				 KFD_EC_MASK(EC_QUEUE_WAVE_TRAP) |	\
+				 KFD_EC_MASK(EC_QUEUE_WAVE_MATH_ERROR) |	\
+				 KFD_EC_MASK(EC_QUEUE_WAVE_ILLEGAL_INSTRUCTION) |	\
+				 KFD_EC_MASK(EC_QUEUE_WAVE_MEMORY_VIOLATION) |	\
+				 KFD_EC_MASK(EC_QUEUE_WAVE_APERTURE_VIOLATION) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_DIM_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_CODE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_UNSUPPORTED) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_VENDOR_UNSUPPORTED)	|	\
+				 KFD_EC_MASK(EC_QUEUE_PREEMPTION_ERROR)	|	\
+				 KFD_EC_MASK(EC_QUEUE_NEW))
+#define KFD_EC_MASK_DEVICE	(KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE) |		\
+				 KFD_EC_MASK(EC_DEVICE_RAS_ERROR) |		\
+				 KFD_EC_MASK(EC_DEVICE_FATAL_HALT) |		\
+				 KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION) |	\
+				 KFD_EC_MASK(EC_DEVICE_NEW))
+#define KFD_EC_MASK_PROCESS	(KFD_EC_MASK(EC_PROCESS_RUNTIME) |	\
+				 KFD_EC_MASK(EC_PROCESS_DEVICE_REMOVE))
+
+/* Checks for exception code types for KFD search */
+#define KFD_DBG_EC_TYPE_IS_QUEUE(ecode)					\
+			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_QUEUE))
+#define KFD_DBG_EC_TYPE_IS_DEVICE(ecode)				\
+			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_DEVICE))
+#define KFD_DBG_EC_TYPE_IS_PROCESS(ecode)				\
+			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PROCESS))
+
+
+/* Runtime enable states */
+enum kfd_dbg_runtime_state {
+	DEBUG_RUNTIME_STATE_DISABLED = 0,
+	DEBUG_RUNTIME_STATE_ENABLED = 1,
+	DEBUG_RUNTIME_STATE_ENABLED_BUSY = 2,
+	DEBUG_RUNTIME_STATE_ENABLED_ERROR = 3
+};
+
+/* Runtime enable status */
+struct kfd_runtime_info {
+	__u64 r_debug;
+	__u32 runtime_state;
+	__u32 ttmp_setup;
+};
+
+/* Enable modes for runtime enable */
+#define KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK	1
+#define KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK	2
+
+/**
+ * kfd_ioctl_runtime_enable_args - Arguments for runtime enable
+ *
+ * Coordinates debug exception signalling and debug device enablement with runtime.
+ *
+ * @r_debug - pointer to user struct for sharing information between ROCr and the debuggger
+ * @mode_mask - mask to set mode
+ *	KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK - enable runtime for debugging, otherwise disable
+ *	KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK - enable trap temporary setup (ignore on disable)
+ *
+ * Return - 0 on SUCCESS.
+ *	  - EBUSY if runtime enable call already pending.
+ *	  - EEXIST if user queues already active prior to call.
+ *	    If process is debug enabled, runtime enable will enable debug devices and
+ *	    wait for debugger process to send runtime exception EC_PROCESS_RUNTIME
+ *	    to unblock - see kfd_ioctl_dbg_trap_args.
+ *
+ */
+struct kfd_ioctl_runtime_enable_args {
+	__u64 r_debug;
+	__u32 mode_mask;
+};
+
+/* Queue information */
+struct kfd_queue_snapshot_entry {
+	__u64 exception_status;
+	__u64 ring_base_address;
+	__u64 write_pointer_address;
+	__u64 read_pointer_address;
+	__u64 ctx_save_restore_address;
+	__u32 queue_id;
+	__u32 gpu_id;
+	__u32 ring_size;
+	__u32 queue_type;
+	__u32 ctx_save_restore_area_size;
+	__u32 reserved;
+};
+
+/* Queue status return for suspend/resume */
+#define KFD_DBG_QUEUE_ERROR_BIT		30
+#define KFD_DBG_QUEUE_INVALID_BIT	31
+#define KFD_DBG_QUEUE_ERROR_MASK	(1 << KFD_DBG_QUEUE_ERROR_BIT)
+#define KFD_DBG_QUEUE_INVALID_MASK	(1 << KFD_DBG_QUEUE_INVALID_BIT)
+
+/* Context save area header information */
+struct kfd_context_save_area_header {
+	__u32 control_stack_offset;
+	__u32 control_stack_size;
+	__u32 wave_state_offset;
+	__u32 wave_state_size;
+	__u32 debug_offset;
+	__u32 debug_size;
+	__u64 err_payload_addr;
+	__u32 err_event_id;
+	__u32 reserved1;
+};
+
+/*
+ * Debug operations
+ *
+ * For specifics on usage and return values, see documentation per operation
+ * below.  Otherwise, generic error returns apply:
+ *	- ESRCH if the process to debug does not exist.
+ *
+ *	- EINVAL (with KFD_IOC_DBG_TRAP_ENABLE exempt) if operation
+ *		 KFD_IOC_DBG_TRAP_ENABLE has not succeeded prior.
+ *		 Also returns this error if GPU hardware scheduling is not supported.
+ *
+ *	- EPERM (with KFD_IOC_DBG_TRAP_DISABLE exempt) if target process is not
+ *		 PTRACE_ATTACHED.  KFD_IOC_DBG_TRAP_DISABLE is exempt to allow
+ *		 clean up of debug mode as long as process is debug enabled.
+ *
+ *	- EACCES if any DBG_HW_OP (debug hardware operation) is requested when
+ *		 AMDKFD_IOC_RUNTIME_ENABLE has not succeeded prior.
+ *
+ *	- ENODEV if any GPU does not support debugging on a DBG_HW_OP call.
+ *
+ *	- Other errors may be returned when a DBG_HW_OP occurs while the GPU
+ *	  is in a fatal state.
+ *
+ */
+enum kfd_dbg_trap_operations {
+	KFD_IOC_DBG_TRAP_ENABLE = 0,
+	KFD_IOC_DBG_TRAP_DISABLE = 1,
+	KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT = 2,
+	KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED = 3,
+	KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE = 4,  /* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE = 5,      /* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_SUSPEND_QUEUES = 6,		/* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_RESUME_QUEUES = 7,		/* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH = 8,	/* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH = 9,	/* DBG_HW_OP */
+	KFD_IOC_DBG_TRAP_SET_FLAGS = 10,
+	KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT = 11,
+	KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO = 12,
+	KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT = 13,
+	KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT = 14
+};
+
+/**
+ * kfd_ioctl_dbg_trap_enable_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_ENABLE.
+ *
+ *     Enables debug session for target process. Call @op KFD_IOC_DBG_TRAP_DISABLE in
+ *     kfd_ioctl_dbg_trap_args to disable debug session.
+ *
+ *     @exception_mask (IN)	- exceptions to raise to the debugger
+ *     @rinfo_ptr      (IN)	- pointer to runtime info buffer (see kfd_runtime_info)
+ *     @rinfo_size     (IN/OUT)	- size of runtime info buffer in bytes
+ *     @dbg_fd	       (IN)	- fd the KFD will nofify the debugger with of raised
+ *				  exceptions set in exception_mask.
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *		Copies KFD saved kfd_runtime_info to @rinfo_ptr on enable.
+ *		Size of kfd_runtime saved by the KFD returned to @rinfo_size.
+ *            - EBADF if KFD cannot get a reference to dbg_fd.
+ *            - EFAULT if KFD cannot copy runtime info to rinfo_ptr.
+ *            - EINVAL if target process is already debug enabled.
+ *
+ */
+struct kfd_ioctl_dbg_trap_enable_args {
+	__u64 exception_mask;
+	__u64 rinfo_ptr;
+	__u32 rinfo_size;
+	__u32 dbg_fd;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_send_runtime_event_args
+ *
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT.
+ *     Raises exceptions to runtime.
+ *
+ *     @exception_mask (IN) - exceptions to raise to runtime
+ *     @gpu_id	       (IN) - target device id
+ *     @queue_id       (IN) - target queue id
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *	      - ENODEV if gpu_id not found.
+ *		If exception_mask contains EC_PROCESS_RUNTIME, unblocks pending
+ *		AMDKFD_IOC_RUNTIME_ENABLE call - see kfd_ioctl_runtime_enable_args.
+ *		All other exceptions are raised to runtime through err_payload_addr.
+ *		See kfd_context_save_area_header.
+ */
+struct kfd_ioctl_dbg_trap_send_runtime_event_args {
+	__u64 exception_mask;
+	__u32 gpu_id;
+	__u32 queue_id;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_set_exceptions_enabled_args
+ *
+ *     Arguments for KFD_IOC_SET_EXCEPTIONS_ENABLED
+ *     Set new exceptions to be raised to the debugger.
+ *
+ *     @exception_mask (IN) - new exceptions to raise the debugger
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ */
+struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args {
+	__u64 exception_mask;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_set_wave_launch_override_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE
+ *     Enable HW exceptions to raise trap.
+ *
+ *     @override_mode	     (IN)     - see kfd_dbg_trap_override_mode
+ *     @enable_mask	     (IN/OUT) - reference kfd_dbg_trap_mask.
+ *					IN is the override modes requested to be enabled.
+ *					OUT is referenced in Return below.
+ *     @support_request_mask (IN/OUT) - reference kfd_dbg_trap_mask.
+ *					IN is the override modes requested for support check.
+ *					OUT is referenced in Return below.
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *		Previous enablement is returned in @enable_mask.
+ *		Actual override support is returned in @support_request_mask.
+ *	      - EINVAL if override mode is not supported.
+ *	      - EACCES if trap support requested is not actually supported.
+ *		i.e. enable_mask (IN) is not a subset of support_request_mask (OUT).
+ *		Otherwise it is considered a generic error (see kfd_dbg_trap_operations).
+ */
+struct kfd_ioctl_dbg_trap_set_wave_launch_override_args {
+	__u32 override_mode;
+	__u32 enable_mask;
+	__u32 support_request_mask;
+	__u32 pad;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_set_wave_launch_mode_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE
+ *     Set wave launch mode.
+ *
+ *     @mode (IN) - see kfd_dbg_trap_wave_launch_mode
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ */
+struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args {
+	__u32 launch_mode;
+	__u32 pad;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_suspend_queues_ags
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SUSPEND_QUEUES
+ *     Suspend queues.
+ *
+ *     @exception_mask	(IN) - raised exceptions to clear
+ *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per queue id)
+ *			       to suspend
+ *     @num_queues	(IN) - number of queues to suspend in @queue_array_ptr
+ *     @grace_period	(IN) - wave time allowance before preemption
+ *			       per 1K GPU clock cycle unit
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Destruction of a suspended queue is blocked until the queue is
+ *     resumed.  This allows the debugger to access queue information and
+ *     the its context save area without running into a race condition on
+ *     queue destruction.
+ *     Automatically copies per queue context save area header information
+ *     into the save area base
+ *     (see kfd_queue_snapshot_entry and kfd_context_save_area_header).
+ *
+ *     Return - Number of queues suspended on SUCCESS.
+ *	.	KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK masked
+ *		for each queue id in @queue_array_ptr array reports unsuccessful
+ *		suspend reason.
+ *		KFD_DBG_QUEUE_ERROR_MASK = HW failure.
+ *		KFD_DBG_QUEUE_INVALID_MASK = queue does not exist, is new or
+ *		is being destroyed.
+ */
+struct kfd_ioctl_dbg_trap_suspend_queues_args {
+	__u64 exception_mask;
+	__u64 queue_array_ptr;
+	__u32 num_queues;
+	__u32 grace_period;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_resume_queues_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_RESUME_QUEUES
+ *     Resume queues.
+ *
+ *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per queue id)
+ *			       to resume
+ *     @num_queues	(IN) - number of queues to resume in @queue_array_ptr
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - Number of queues resumed on SUCCESS.
+ *		KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK mask
+ *		for each queue id in @queue_array_ptr array reports unsuccessful
+ *		resume reason.
+ *		KFD_DBG_QUEUE_ERROR_MASK = HW failure.
+ *		KFD_DBG_QUEUE_INVALID_MASK = queue does not exist.
+ */
+struct kfd_ioctl_dbg_trap_resume_queues_args {
+	__u64 queue_array_ptr;
+	__u32 num_queues;
+	__u32 pad;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_set_node_address_watch_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH
+ *     Sets address watch for device.
+ *
+ *     @address	(IN)  - watch address to set
+ *     @mode    (IN)  - see kfd_dbg_trap_address_watch_mode
+ *     @mask    (IN)  - watch address mask
+ *     @gpu_id  (IN)  - target gpu to set watch point
+ *     @id      (OUT) - watch id allocated
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *		Allocated watch ID returned to @id.
+ *	      - ENODEV if gpu_id not found.
+ *	      - ENOMEM if watch IDs can be allocated
+ */
+struct kfd_ioctl_dbg_trap_set_node_address_watch_args {
+	__u64 address;
+	__u32 mode;
+	__u32 mask;
+	__u32 gpu_id;
+	__u32 id;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_clear_node_address_watch_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH
+ *     Clear address watch for device.
+ *
+ *     @gpu_id  (IN)  - target device to clear watch point
+ *     @id      (IN) - allocated watch id to clear
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *	      - ENODEV if gpu_id not found.
+ *	      - EINVAL if watch ID has not been allocated.
+ */
+struct kfd_ioctl_dbg_trap_clear_node_address_watch_args {
+	__u32 gpu_id;
+	__u32 id;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_set_flags_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_SET_FLAGS
+ *     Sets flags for wave behaviour.
+ *
+ *     @flags (IN/OUT) - IN = flags to enable, OUT = flags previously enabled
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *	      - EACCESS if any debug device does not allow flag options.
+ */
+struct kfd_ioctl_dbg_trap_set_flags_args {
+	__u32 flags;
+	__u32 pad;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_query_debug_event_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT
+ *
+ *     Find one or more raised exceptions. This function can return multiple
+ *     exceptions from a single queue or a single device with one call. To find
+ *     all raised exceptions, this function must be called repeatedly until it
+ *     returns -EAGAIN. Returned exceptions can optionally be cleared by
+ *     setting the corresponding bit in the @exception_mask input parameter.
+ *     However, clearing an exception prevents retrieving further information
+ *     about it with KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO.
+ *
+ *     @exception_mask (IN/OUT) - exception to clear (IN) and raised (OUT)
+ *     @gpu_id	       (OUT)    - gpu id of exceptions raised
+ *     @queue_id       (OUT)    - queue id of exceptions raised
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on raised exception found
+ *              Raised exceptions found are returned in @exception mask
+ *              with reported source id returned in @gpu_id or @queue_id.
+ *            - EAGAIN if no raised exception has been found
+ */
+struct kfd_ioctl_dbg_trap_query_debug_event_args {
+	__u64 exception_mask;
+	__u32 gpu_id;
+	__u32 queue_id;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_query_exception_info_args
+ *
+ *     Arguments KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO
+ *     Get additional info on raised exception.
+ *
+ *     @info_ptr	(IN)	 - pointer to exception info buffer to copy to
+ *     @info_size	(IN/OUT) - exception info buffer size (bytes)
+ *     @source_id	(IN)     - target gpu or queue id
+ *     @exception_code	(IN)     - target exception
+ *     @clear_exception	(IN)     - clear raised @exception_code exception
+ *				   (0 = false, 1 = true)
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *              If @exception_code is EC_DEVICE_MEMORY_VIOLATION, copy @info_size(OUT)
+ *		bytes of memory exception data to @info_ptr.
+ *              If @exception_code is EC_PROCESS_RUNTIME, copy saved
+ *              kfd_runtime_info to @info_ptr.
+ *              Actual required @info_ptr size (bytes) is returned in @info_size.
+ */
+struct kfd_ioctl_dbg_trap_query_exception_info_args {
+	__u64 info_ptr;
+	__u32 info_size;
+	__u32 source_id;
+	__u32 exception_code;
+	__u32 clear_exception;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_get_queue_snapshot_args
+ *
+ *     Arguments KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT
+ *     Get queue information.
+ *
+ *     @exception_mask	 (IN)	  - exceptions raised to clear
+ *     @snapshot_buf_ptr (IN)	  - queue snapshot entry buffer (see kfd_queue_snapshot_entry)
+ *     @num_queues	 (IN/OUT) - number of queue snapshot entries
+ *         The debugger specifies the size of the array allocated in @num_queues.
+ *         KFD returns the number of queues that actually existed. If this is
+ *         larger than the size specified by the debugger, KFD will not overflow
+ *         the array allocated by the debugger.
+ *
+ *     @entry_size	 (IN/OUT) - size per entry in bytes
+ *         The debugger specifies sizeof(struct kfd_queue_snapshot_entry) in
+ *         @entry_size. KFD returns the number of bytes actually populated per
+ *         entry. The debugger should use the KFD_IOCTL_MINOR_VERSION to determine,
+ *         which fields in struct kfd_queue_snapshot_entry are valid. This allows
+ *         growing the ABI in a backwards compatible manner.
+ *         Note that entry_size(IN) should still be used to stride the snapshot buffer in the
+ *         event that it's larger than actual kfd_queue_snapshot_entry.
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *              Copies @num_queues(IN) queue snapshot entries of size @entry_size(IN)
+ *              into @snapshot_buf_ptr if @num_queues(IN) > 0.
+ *              Otherwise return @num_queues(OUT) queue snapshot entries that exist.
+ */
+struct kfd_ioctl_dbg_trap_queue_snapshot_args {
+	__u64 exception_mask;
+	__u64 snapshot_buf_ptr;
+	__u32 num_queues;
+	__u32 entry_size;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_get_device_snapshot_args
+ *
+ *     Arguments for KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT
+ *     Get device information.
+ *
+ *     @exception_mask	 (IN)	  - exceptions raised to clear
+ *     @snapshot_buf_ptr (IN)	  - pointer to snapshot buffer (see kfd_dbg_device_info_entry)
+ *     @num_devices	 (IN/OUT) - number of debug devices to snapshot
+ *         The debugger specifies the size of the array allocated in @num_devices.
+ *         KFD returns the number of devices that actually existed. If this is
+ *         larger than the size specified by the debugger, KFD will not overflow
+ *         the array allocated by the debugger.
+ *
+ *     @entry_size	 (IN/OUT) - size per entry in bytes
+ *         The debugger specifies sizeof(struct kfd_dbg_device_info_entry) in
+ *         @entry_size. KFD returns the number of bytes actually populated. The
+ *         debugger should use KFD_IOCTL_MINOR_VERSION to determine, which fields
+ *         in struct kfd_dbg_device_info_entry are valid. This allows growing the
+ *         ABI in a backwards compatible manner.
+ *         Note that entry_size(IN) should still be used to stride the snapshot buffer in the
+ *         event that it's larger than actual kfd_dbg_device_info_entry.
+ *
+ *     Generic errors apply (see kfd_dbg_trap_operations).
+ *     Return - 0 on SUCCESS.
+ *              Copies @num_devices(IN) device snapshot entries of size @entry_size(IN)
+ *              into @snapshot_buf_ptr if @num_devices(IN) > 0.
+ *              Otherwise return @num_devices(OUT) queue snapshot entries that exist.
+ */
+struct kfd_ioctl_dbg_trap_device_snapshot_args {
+	__u64 exception_mask;
+	__u64 snapshot_buf_ptr;
+	__u32 num_devices;
+	__u32 entry_size;
+};
+
+/**
+ * kfd_ioctl_dbg_trap_args
+ *
+ * Arguments to debug target process.
+ *
+ *     @pid - target process to debug
+ *     @op  - debug operation (see kfd_dbg_trap_operations)
+ *
+ *     @op determines which union struct args to use.
+ *     Refer to kern docs for each kfd_ioctl_dbg_trap_*_args struct.
+ */
+struct kfd_ioctl_dbg_trap_args {
+	__u32 pid;
+	__u32 op;
+
+	union {
+		struct kfd_ioctl_dbg_trap_enable_args enable;
+		struct kfd_ioctl_dbg_trap_send_runtime_event_args send_runtime_event;
+		struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args set_exceptions_enabled;
+		struct kfd_ioctl_dbg_trap_set_wave_launch_override_args launch_override;
+		struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args launch_mode;
+		struct kfd_ioctl_dbg_trap_suspend_queues_args suspend_queues;
+		struct kfd_ioctl_dbg_trap_resume_queues_args resume_queues;
+		struct kfd_ioctl_dbg_trap_set_node_address_watch_args set_node_address_watch;
+		struct kfd_ioctl_dbg_trap_clear_node_address_watch_args clear_node_address_watch;
+		struct kfd_ioctl_dbg_trap_set_flags_args set_flags;
+		struct kfd_ioctl_dbg_trap_query_debug_event_args query_debug_event;
+		struct kfd_ioctl_dbg_trap_query_exception_info_args query_exception_info;
+		struct kfd_ioctl_dbg_trap_queue_snapshot_args queue_snapshot;
+		struct kfd_ioctl_dbg_trap_device_snapshot_args device_snapshot;
+	};
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -877,7 +1532,13 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_AVAILABLE_MEMORY		\
 		AMDKFD_IOWR(0x23, struct kfd_ioctl_get_available_memory_args)
 
+#define AMDKFD_IOC_RUNTIME_ENABLE		\
+		AMDKFD_IOWR(0x24, struct kfd_ioctl_runtime_enable_args)
+
+#define AMDKFD_IOC_DBG_TRAP			\
+		AMDKFD_IOWR(0x25, struct kfd_ioctl_dbg_trap_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x24
+#define AMDKFD_COMMAND_END		0x26
 
 #endif
-- 
2.25.1

