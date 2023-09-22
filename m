Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C557AB849
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC2210E6E3;
	Fri, 22 Sep 2023 17:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BFE10E6E1;
 Fri, 22 Sep 2023 17:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3n8Z0KywdDi+OW6lW/y3tfVRf1jiaNWGGAZvskt8WSDdxRngyOvUwqjwod0wlCFrHpn7jUEj6Tr37VLCEKq2RTqyA6PvAWwi3be/tnxzqOtWxAf3Lxg94bF1IrAePiUDKlJE9SAlvRBVwqe+pfF8q3cvbsWzmfHviCwmJ2/gaxw7EZTlmHZNDtLXz1ZDSoDptKsQ/MnOyE586WUfLL4aQ1+MV3tMHZZNggFTjfT6E+drG0xJ/TafC6/YdwbpXgcNHvhAXvKLhcrI2epdy0fszN3MTM2cSZjR2fgicTWBUojEO1ua33jWNVo2q/d9Gc/Z+co5XGwqXN3AQDLCyDHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVzCcDukQBAZIUv9/0ZmHEAnTKpwYhoFBQoviqaAF00=;
 b=NPJGpp7mEI9AXsruR3jE316N+ozhItRca0F3I4X71Gdd8khQlRg/cVAjK/8CnGzxFNA36KTCkELsoHGVEsp74biCYtyWvcVWDHovTYmIZuDZsUQErTokVSgS4R4Hzrrc1ChfSqI/WUsCf4IPZikDqkvmOILqDgNKoh28lj31D5PzVZ/uiwBZtRvXkz7lXv3JutNHAjKio92HEGKve8pBXVhjDU0/dfQml+gQnBYGsvIDjPhGpf5HfKFyZthERuceA5MfYUDl/sJyWJtA0+nZIyrbpczRhuvr0ZS6cyQuAnpEKb4XchXCf49EoYJnyIMX7nZNmP69S3IiIfErskQkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVzCcDukQBAZIUv9/0ZmHEAnTKpwYhoFBQoviqaAF00=;
 b=4pHGh7N3hdbc5F3oLLxSP47F2V/n1oXiwocDFBzgboKeXc1orTH+xHHZfbSf27Qy646UEYMN1e0Gxc5gc8yQbUFjps7KlG2X/t0vj/MScrehzqEXeFokUP6xjpOqKJrkrijajSmTRTHaoqxvl/csfSVIZhlHTukAEOcW/URx/Pk=
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 17:52:22 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::6c) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.12 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 22 Sep 2023 17:52:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:17 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system state
Date: Fri, 22 Sep 2023 23:20:49 +0530
Message-ID: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 36898169-fb95-4a5b-3acd-08dbbb94ac07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: raUPHbLlkVQEL/Zk8cxcO1kJUaPfMYRDJFU+HhIuEHbfqlxe5QHDC67kaNIv+LE1tKoU2WciVTqQARpFqf43YZ+hRfrZMCmve7hNTBIbVQ9vLUb7GsquzNkdeA2hyB4OOCbE/ZyjJ3Me/0ogaLnLBM++QBnYeYaHcQHjb1b6ScSu0os8bgig8VgY0unQcI3BA4PafJCZOQeyi3r/SsLOY42Jx6b3PcJAzcP4w5hQ5REB+zB6T2xv2ZMo9/tW3/VQrrl+hyIiB1Hc+0ITkKQ8gGWn9ARuHv4abRx27wgDTQEcHRMGAFdJU+I0rtrL/5tacPE0JZRblOUNRr+zU3/V5mT93qak8CxIoXD5a+dJHx4zhtuGHvxZF0avCHTouZhKVBi5h4ov6XSlsT6HfbJBmjWeHvtUzmJplSwVnR9mkToMUgnUTWmwrJ0y+aIy5+xMviwFX56JEjFtb+HrTViiNzo7aJmXRWDNHE5UpBUoijVF7wqPfV21m6d6WusUWpnfjeFI5qOtWuKhe+uT+mmr+U1KCNtMFYY1j6MhlLsS3Vjyko3W77hopMYASdSYo0102u7B2yXuShWA0ITinQF7kkp0UAwMqdrk9h1fFurrdkU7KLIq6cZf10K093q+OHZH6gvslC+lC2D0pSO2RRyPEvXRSeNUYql6KfUgrpy72RU+Ca3iDvtHFrvoXunBPaphEnixFNbH35/JYFg9lRw6svBMQELuE1bRVED6d+0V8uWYeTh+SkFZRtd1nn30lTIRnmgYX5wxWbMP0iGlCCw1LJ9MplKD9YkTEWkl2a9a3X+qm90qez8Z2gavim1aqZQyfnhWDzYlXXcRkpzaozS6uQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(82310400011)(186009)(1800799009)(230921699003)(451199024)(36840700001)(40470700004)(46966006)(7696005)(47076005)(2616005)(6666004)(478600001)(8936002)(16526019)(26005)(7416002)(1076003)(5660300002)(426003)(336012)(2906002)(15650500001)(70206006)(70586007)(316002)(54906003)(41300700001)(4326008)(8676002)(110136005)(40460700003)(36756003)(36860700001)(86362001)(81166007)(921005)(82740400003)(40480700001)(356005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:21.8297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36898169-fb95-4a5b-3acd-08dbbb94ac07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
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

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/admin-guide/pmf.rst     | 24 ++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 40 ++++++++++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/pmf.rst

diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
new file mode 100644
index 000000000000..b60f381410c3
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
index 897f61b75e2f..c5334f1177a4 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -70,6 +70,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_SYSTEM_STATE					9
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -436,6 +437,13 @@ struct apmf_dyn_slider_output {
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
@@ -467,6 +475,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	enum system_state system_state;
 	unsigned long spl; /* in mW */
 	unsigned long sppt; /* in mW */
 	unsigned long sppt_apuonly; /* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 883dd143375a..1629856c20b4 100644
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
-	u32 val;
+	u32 val, event = 0;
 	int idx;
 
 	for (idx = 0; idx < out->actions_count; idx++) {
@@ -113,6 +141,16 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
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
+				dev->prev_data->system_state = 0;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1

