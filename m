Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C67B3F56
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCC610E1CA;
	Sat, 30 Sep 2023 08:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E031810E1CA;
 Sat, 30 Sep 2023 08:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrbS0oYyA4KZr7gnmXKVyIKCK9x6TgMtywfiyogYc9ykQb+76F6zjj8pPvqi1rOgefp8NWHn5uPjrbOEiIAF30kEfamGi//jLPvMAZLwW9mTRDl8yRFDjr08L8QhwN39mBgMo1OgLx70Ng8i9xQXL/omZeQVqyW7yfThfcru2d9RszZyb0ROWlJ74WjICojMXSe04LwYL5MYsyFqrsja2L3/6HqV5kOkZxi5mW1NMHGZHxiotPxJzRWcOLL4Xr69c//1muANJhKw17WL7EG0dMcNcl+zHtrYnJUWhw6eNkJC5p/54wPvej5fO+wrgQX/VxQf6Krwykc6KOK6KznhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tblJTI+tITqnfmJndsWv0Gsmx/80H7qotc/ZjwtLX1Q=;
 b=bVD4ubdwXJ68iKIP4D4/WT668hamMMqMUD/Enn45eF67lvpQ7/fzLblEBgO3wymUPCZzBkaDcZveDURf4tTmsax2GCQ/7Q7jNp1zyhmClxYcpxHYNtP8oYR0bIfy0TgXiZjWx0IZbig6xBB7w8P9wO/A1EYQu7kQQ1/oZZW+iTEHF2FCx4rPNGRQ6za6yl1qFiVOVbmSXBCOIW/+BAKwhgmRuz7j4Mk4B2zS/g0LZ7nhFwCuL0JJ0h8ZsY5RlXC8U2nsIZa38fZcUUulgTrPlT1Te9D9tJZS4VnxIuAvstQdjpxYsuQ88g1qrefGy9gyyB+biQEvCmUJuy4iHSOkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tblJTI+tITqnfmJndsWv0Gsmx/80H7qotc/ZjwtLX1Q=;
 b=HLzW2z6s3LcgC/gokU685j3c2grL/QV0Qt03M+a3OsV/a5iqZ2CN8ov/MN6sz6cUlvvUc8iQAjAPtkoLtwWDndF5NNbrJ95SLEYuxNDY33wnqEXvfmScKIJXxdHnDWchCtzscMUdjsP+D4uilksU6kv1jToOL2yszmB+HU5wrKg=
Received: from BL1PR13CA0122.namprd13.prod.outlook.com (2603:10b6:208:2bb::7)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.35; Sat, 30 Sep
 2023 08:39:05 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::ff) by BL1PR13CA0122.outlook.office365.com
 (2603:10b6:208:2bb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.17 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:59 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 08/16] platform/x86/amd/pmf: Add support to update system
 state
Date: Sat, 30 Sep 2023 14:07:07 +0530
Message-ID: <20230930083715.2050863-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: c41c7766-a6e1-484a-ab2c-08dbc190b452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIO1/XtHx0nu9paDo77rRke2LfBhI5gvY7giGRUWk+VBXa2lJsSnx7fKIB/teMTxAp7tXoURCFgBwq7kYeHqybnGi4UcoC9qmWdKwsIrm7VTfhl2f+2mwhmME1F7bFvk9OF0gAcuu3A8L/vp5AfCJ/JUsdnBwPzAMlx1qpm6WyHnC5rCRxSzfxlrEEMihqK8rZG7xY7oGuQ6NcqSKcDrK++Yh1BwEoOIj3ZnaS6bZdWv9rUZbuVQ+iaRtFZUIMJe6eDr1bEGv5nx1kH/z01fNi9BCm3wHm9j6Js7WgzWErX5D+jdeWrQRV/pOLGYZfQ7d1yqer7CbTjxOCUPpMzNf5K/CU92D0dfMqtVw1NKO6bb06iagEKz9zarN6uyAnnVR8Z5dgCF2OA2Gcs8JrRz7bSgBECkTkV00N5MGMTrBlwipBN/dlAJvGGplFIS+5EQKTqEjImCiaekBxj+RDK1pIDwE0O/9Dz71zd+TByZhvnFy3sU0kQxC+G71PrGc+wVOX3dHjCSc8FAWe45B2PeAsrPnKqE+iioo2Bbl4vKOTXnUyPldGwQ+azR+HUXHT/BJXdIUVsV0X8AsUZQV1adu+moT3RscV8VdbWFUgke6JKRz/FbBOrpdqFbr1UAFjUQzEu3EJnKYPVzt2fGtLeJsI/5qPOJnm0iCb/nlkq4NJDcMxghbqjtkm81AMDa2gjiY3F7xSM3en9GmaCOVz5IegVQ0gXAGfW/ALYshK8kbHbqKOxE66kxJEOOUfMrWb2mWosiG6D0Bk5AVt7BO6T/XA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(2906002)(40480700001)(40460700003)(2616005)(966005)(6666004)(478600001)(110136005)(83380400001)(7416002)(47076005)(15650500001)(336012)(26005)(1076003)(16526019)(426003)(8936002)(70586007)(70206006)(54906003)(316002)(5660300002)(41300700001)(8676002)(4326008)(81166007)(356005)(36756003)(86362001)(921005)(82740400003)(36860700001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:04.7512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41c7766-a6e1-484a-ab2c-08dbc190b452
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
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
Cc: Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, kernel test robot <lkp@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
 linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PMF driver based on the output actions from the TA can request to update
the system states like entering s0i3, lock screen etc. by generating
an uevent. Based on the udev rules set in the userspace the event id
matching the uevent shall get updated accordingly using the systemctl.

Sample udev rules under Documentation/admin-guide/pmf.rst.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309260515.5XbR6N0g-lkp@intel.com/
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/admin-guide/index.rst   |  1 +
 Documentation/admin-guide/pmf.rst     | 25 ++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 41 ++++++++++++++++++++++++++-
 4 files changed, 75 insertions(+), 1 deletion(-)
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
index 000000000000..90072add511e
--- /dev/null
+++ b/Documentation/admin-guide/pmf.rst
@@ -0,0 +1,25 @@
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
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
+
+EVENT_ID values:
+1= Put the system to S0i3/S2Idle
+2= Put the system to hibernate
+3= Lock the screen
+
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index d5e410c41e81..34778192432e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -73,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_SYSTEM_STATE					9
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -439,6 +440,13 @@ struct apmf_dyn_slider_output {
 } __packed;
 
 /* Smart PC - TA internals */
+enum system_state {
+	SYSTEM_STATE__S0i3 = 1,
+	SYSTEM_STATE__S4,
+	SYSTEM_STATE__SCREEN_LOCK,
+	SYSTEM_STATE__MAX
+};
+
 enum ta_slider {
 	TA_BEST_BATTERY, /* Best Battery */
 	TA_BETTER_BATTERY, /* Better Battery */
@@ -470,6 +478,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	enum system_state system_state;
 	unsigned long spl; /* in mW */
 	unsigned long sppt; /* in mW */
 	unsigned long sppt_apuonly; /* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 315e3d2eacdf..961011530c1b 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
+static const char *amd_pmf_uevent_as_str(unsigned int state)
+{
+	switch (state) {
+	case SYSTEM_STATE__S0i3:
+		return "S0i3";
+	case SYSTEM_STATE__S4:
+		return "S4";
+	case SYSTEM_STATE__SCREEN_LOCK:
+		return "SCREEN_LOCK";
+	default:
+		return "Unknown Smart PC event";
+	}
+}
+
 static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 				 struct tee_ioctl_invoke_arg *arg,
 				 struct tee_param *param)
@@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
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
-	unsigned long val;
+	unsigned long val, event = 0;
 	int idx;
 
 	for (idx = 0; idx < out->actions_count; idx++) {
@@ -113,6 +141,17 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
+
+		case PMF_POLICY_SYSTEM_STATE:
+			event = val + 1;
+			if (dev->prev_data->system_state != event) {
+				amd_pmf_update_uevents(dev, event);
+				dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
+					amd_pmf_uevent_as_str(event));
+				/* reset the previous recorded state to zero */
+				dev->prev_data->system_state = 0;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1

