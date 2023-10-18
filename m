Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0017CD509
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F11010E39D;
	Wed, 18 Oct 2023 07:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF9210E39B;
 Wed, 18 Oct 2023 07:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAUAIaXiIT0IZZhnWYCHtiUh8JF1EfMKUfQVql1b+cb0FabD0J70rPPb1HciaKRMsYDoctQM6IEJX8+fly10NSCR6SJq0RQ7GLzZdSXaz3kKP5pYqGQl/AbiH4UceGGCVCXxJlq9FEqX/mrQmcOhZgMj5A5FauWYRDNTGHZ+aMtD9L7zZoIm5jCdStvauA/ZUaLgzNI5CHBc07t4veyhtAAyw39ERjuCnrcuwFi9NOaBQORLlmb8nlLhxI9Ys1cAweTQiFCtwkdOEsxUCsyDuvyCJT8W0H/uVcAQ6FSeUew8zq/RvRHZrz4g7Ooh0fzCp36yNvh4cPc3veptZxkZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYA5KfGG/0L/i7CPFFShfUwwWmK/hp6SSBbzVgnEYqo=;
 b=botN3DkQ8Q+3PbPRqdikW+dWo9Ryye4iAm4oyq42lBu1V8U42fNa0YfNsuus//v85ra0PqB85aTL+rQhFD813EuAAFX93RoZ7gy56zr/GdDl9urhlHwU1oLGm0bbqgnLYsZ0dXavkmiS3AdpR/YLCebEtDRLby2Ck9hqPNBZrpwSsR/hYnbgvcignmJ0kFJRcjkU4hiSov6ymoVT5W5uGhU23a0cV2g0F0L01wMO/ajyqT5jg9AtLxDQ/6OAmN8bof5or/Myt8GcFvOV42OzzeFniUH9Vlly3Cd6qw1o2A2YBICJ1ioru+b6qTz4+DOd5WaQAaK0GrWKtSXh0Nt35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYA5KfGG/0L/i7CPFFShfUwwWmK/hp6SSBbzVgnEYqo=;
 b=OmdnDHEwOycSJq+o2An26EAOBeFa+bc24KEXiGh9dcPSB7LlhnZVnni1vw6pdtZcY8hElGzNMVMSr5OCITDfjvJVh0SOr7HDc2LTRERzXilAhIt7YsZtTe+koEZXw55DELhNm+sD8CfEh/PVtmUqIYcRz7B/sG/H7wqciAa1FdU=
Received: from BYAPR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:74::40)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Wed, 18 Oct
 2023 07:05:10 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:a03:74:cafe::18) by BYAPR05CA0063.outlook.office365.com
 (2603:10b6:a03:74::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.18 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:04:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 08/17] platform/x86/amd/pmf: Add support to update system
 state
Date: Wed, 18 Oct 2023 12:32:32 +0530
Message-ID: <20231018070241.2041529-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acee6cc-5ca6-40d3-6637-08dbcfa890d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpDPma5l+gn5TsdlWu/0wpLBIm/MJVHOpMQlQ6y+uKM+qaiFf36Zp3FQU357aPpzP9bF8KLlspZXPBMHr2pdjV52IKWMe4gT0jr6Q2kQ+6Wo/b2WTtSEvUr7UV8TB82QxMmZd/lZW3qGJHQoIXnvN6jcDiJN4DUs6RgeafPvDhzlZQ9RB4HPf7htcAvyFWKBCVF5NLS8WAopLkABuh+ISRNSKFIsUykhncytRNGUgvK5O8WE9fL5XvO7KH+MPlSC/rf45utTDePEYn100Om8RjD/VNr8a34pV0eG0PRBVh4fjtfpv4dHjBJSe99VVTuhbACAZtYY55zjH0zBUszYiZsggBrg+YUVngwDTuNqiD2j7XXbxDx6Sf3N3aJfVAx06hEo2Ls5WaySHulP8Ja8FQc+MPm2rFb/QVGqT3CrIfntcytr/HqOs3yuJEIyrrB25lUODt9KY9twRC5IGfeRj1HZpciFgqtYgM4/gtMF7CW6ZWpiB0QTmQoF7JIC+n/KTe7r4KECcYMEQeOv9nJCVqZe50YVzPHtnPONWhtVbm5YHOrMA2HxD4+FkLs5Fhu3UEmgPgrjcO5ZBxfeOehjVVAE7/7+YDv3MZnHjycHXCwW4PG3Uk9df9BjphIh2C5LGvIqr7aCcC6O40jlmcrm1kZz/Qgs5rQHoC+b428hzEscyxmRXpBiqmZj0Z3EyFb0v1Bf8ba17U7S7Z6Fz82N8moQMgxhwGHV7e5FxpoNTJhAUed60Ca4Vn6uNcDkc/iN3mcI875Svt0X2CUZnk7wGWWtonT/7jrTa01JQINXXC8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799009)(46966006)(36840700001)(40470700004)(8936002)(26005)(1076003)(54906003)(16526019)(7696005)(2616005)(110136005)(70206006)(316002)(70586007)(5660300002)(83380400001)(426003)(41300700001)(8676002)(4326008)(336012)(478600001)(6666004)(40460700003)(7416002)(47076005)(2906002)(15650500001)(40480700001)(82740400003)(81166007)(921005)(356005)(36860700001)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:09.2970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acee6cc-5ca6-40d3-6637-08dbcfa890d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PMF driver based on the output actions from the TA can request to update
the system states like entering s0i3, lock screen etc. by generating
an uevent. Based on the udev rules set in the userspace the event id
matching the uevent shall get updated accordingly using the systemctl.

Sample udev rules under Documentation/admin-guide/pmf.rst.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/admin-guide/index.rst   |  1 +
 Documentation/admin-guide/pmf.rst     | 24 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 34 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 Documentation/admin-guide/pmf.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 43ea35613dfc..fb40a1f6f79e 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to your liking.
    parport
    perf-security
    pm/index
+   pmf
    pnp
    rapidio
    ras
diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
new file mode 100644
index 000000000000..9ee729ffc19b
--- /dev/null
+++ b/Documentation/admin-guide/pmf.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Set udev rules for PMF Smart PC Builder
+---------------------------------------
+
+AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
+like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
+TA (Trusted Application).
+
+In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
+sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
+enabled.
+
+Please add the following line(s) to
+``/etc/udev/rules.d/99-local.rules``::
+
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
+
+EVENT_ID values:
+0= Put the system to S0i3/S2Idle
+1= Put the system to hibernate
+2= Lock the screen
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 781989c7dddd..fb9ce2593236 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -73,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_SYSTEM_STATE					9
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -445,6 +446,13 @@ enum smart_pc_status {
 };
 
 /* Smart PC - TA internals */
+enum system_state {
+	SYSTEM_STATE_S0i3,
+	SYSTEM_STATE_S4,
+	SYSTEM_STATE_SCREEN_LOCK,
+	SYSTEM_STATE_MAX,
+};
+
 enum ta_slider {
 	TA_BEST_BATTERY,
 	TA_BETTER_BATTERY,
@@ -476,6 +484,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
 	u32 sppt_apuonly;	/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6f4a59950b27..d48f980fb1db 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
+static const char *amd_pmf_uevent_as_str(unsigned int state)
+{
+	switch (state) {
+	case SYSTEM_STATE_S0i3:
+		return "S0i3";
+	case SYSTEM_STATE_S4:
+		return "S4";
+	case SYSTEM_STATE_SCREEN_LOCK:
+		return "SCREEN_LOCK";
+	default:
+		return "Unknown Smart PC event";
+	}
+}
+
 static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 				 struct tee_ioctl_invoke_arg *arg,
 				 struct tee_param *param)
@@ -42,6 +56,20 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	param[0].u.memref.shm_offs = 0;
 }
 
+static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
+{
+	char *envp[2] = {};
+
+	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
+	if (!envp[0])
+		return -EINVAL;
+
+	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
+
+	kfree(envp[0]);
+	return 0;
+}
+
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
 	u32 val;
@@ -113,6 +141,12 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
+
+		case PMF_POLICY_SYSTEM_STATE:
+			amd_pmf_update_uevents(dev, val);
+			dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
+				amd_pmf_uevent_as_str(val));
+			break;
 		}
 	}
 }
-- 
2.25.1

