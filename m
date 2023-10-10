Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B677BFC3B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D2F10E350;
	Tue, 10 Oct 2023 13:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20110E350;
 Tue, 10 Oct 2023 13:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7Pks+nbG5XtpPsBaTTp67trBH4JzbXR8wpHfDHZD06IzBGJxZqVV15jp9sH/3P9Hx4o+hiaHEqE9H3pVR9YbMQVs2lXsm5A/u0vpAClujziKLkArSJj85dJcJ3sAmnzMke96hUJ/M2i3A5z4zkJNWNQm9yjwX1Wf28sp6sB3UjsD+UzoRnkqqm+D13VL3d8xmN4MHruWMxGqYwAMP89LnX4q9z9i6PtXjEaPJCMaZP5LJRU5Ml975NBk5B+uv46LR0TF8GqgaCmAfDFCSyqjCkn9LxtksDWsDVfZMY+5x91wy/W6BBI6ukkTUJ0ymakGAzcCEw4JoKx3t8n6fhlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vHcw55kGZu3osCXz5E3S9oPvDFmpVOkhuD4IQgIX3M=;
 b=GZeB9s2xo5RrlZBuIVWIKG+WLtzyPaDqcrG4W+FnnBcrWKGFJKm1o/TiIJSxZNuHKOUDCd8msz5e8bxt1sDjjAcEguAfWso0TVtuS5bAecaf2FC7W7Ta7Y5apPaOZhGu3EKg69Audyu4WRPN/qTb3uZiINRepVpBNT3ikpiQa11QG1SaRoKtZOtkIzaNCeR53R9dJ9La+4jeMjSwqjmvdw8gVBtysC2AmffKhpbpKnGV9lT6HFlqUBLpX5gJmG0XRMtovimY5ppuB8gcLJ+JslaeaRxLGSqS9UfY7pgyfqOT76ycEMjK8L6sQy1ZpDvtqhZRmLwOMNtQIINK6V7Iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vHcw55kGZu3osCXz5E3S9oPvDFmpVOkhuD4IQgIX3M=;
 b=ZhwjVPgWIcd/YxX2fpxb0QrXCrQGEw2LlkJT7KynjARMKBruScbZHSrGlyGHVhugk6EGg67OMkUJCzuuIx57iZXfEKyfNGi3RhhFF3Q9aJXsBBRvWV3EOAAeSccEfj4JYp/9rdfK1EDLwiu1jlu2Agyr3noqMiKeo+WWYL7xRpo=
Received: from DM6PR04CA0025.namprd04.prod.outlook.com (2603:10b6:5:334::30)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:00:32 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::4d) by DM6PR04CA0025.outlook.office365.com
 (2603:10b6:5:334::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:27 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 08/16] platform/x86/amd/pmf: Add support to update system
 state
Date: Tue, 10 Oct 2023 18:29:09 +0530
Message-ID: <20231010125917.138225-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b49e7c-d04d-40cb-33ae-08dbc990e312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oB4D66LFSsXUuXsv+pkmoX+dn54GkU9fzKtmIYovj42pPJ0yQUkH6s9ijrILex8gD9wH4a6MVkw+WGGdZhGsXCaUwReLEOuzGGf782y1ieQWjDMiom57y6qBJ5c6ZgOrYT7RB/iH5JynSqviCqL+CEvXTfohx1TQgkEDiqcwUtI97R6TbU7qx996zgHwBXKOYoiK8SQJUrsTxCqZZJQJyhgqKK343MxdtwmLLaMZjsMROdT8pEiAv3NOhRAZlI1q/Wnl6zR1G6drL4arc9O+fahXFI5mSlOG91bbbFSGsHMVrfsaZFHm1nSPWYg3moML4opj4wekDVTBmsHVc7g1dGesURHpiVMWOUutjiTXLx9LYs+FWnGInfbL7GAAxvyUkcewPtsyAo3muJPcrd/OTCpBXihDsjVb6j5Ws0G3OSZurWzTVE99DahjDyGVC4vFKihEcJc7Mjv2ZdnwWvrMbA43ocwqWhzBGhtfIIKiCuHAne5OJpmbMQhkBWk4VwXnVO1qfNSnDf0YRjWmv14btHaSRSyKcosOb1WNEj4dBxGfnkK481XSSWqhxXR5AG4C8VDL/8ZyULdIhuQsqo1Aqp1+o2KJXNiaAA4aP8d1u+vljtVeFRiz8nbkeNLRlIfzyx1smz0huQy7neHAvC1st0A5DZihbQigjN0wHV+pu9yfNladetBUF/WJd8bata/im11gbCnILAnVRH0WWQJ4uAd7ngnG3fQJrdq5GwCzzCOiAl7/DC3D9Y5SXR8IZLaBi6511ttlF5LNsEqehRjMv2vULpcgz629qfX/w/KWJE0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(478600001)(5660300002)(316002)(41300700001)(7416002)(83380400001)(4326008)(8676002)(8936002)(15650500001)(110136005)(70206006)(6666004)(70586007)(54906003)(7696005)(40460700003)(2906002)(1076003)(2616005)(47076005)(16526019)(40480700001)(36756003)(36860700001)(336012)(426003)(26005)(81166007)(921005)(356005)(82740400003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:32.4370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b49e7c-d04d-40cb-33ae-08dbc990e312
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083
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
 Documentation/admin-guide/index.rst   |  1 +
 Documentation/admin-guide/pmf.rst     | 25 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 36 ++++++++++++++++++++++++++-
 4 files changed, 70 insertions(+), 1 deletion(-)
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
index 000000000000..6985bb5b9452
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
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
+
+EVENT_ID values:
+0= Put the system to S0i3/S2Idle
+1= Put the system to hibernate
+2= Lock the screen
+
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 20f3e16b0a32..67f11113d5a7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -73,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_SYSTEM_STATE					9
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -440,6 +441,13 @@ struct apmf_dyn_slider_output {
 } __packed;
 
 /* Smart PC - TA internals */
+enum system_state {
+	SYSTEM_STATE__S0i3,
+	SYSTEM_STATE__S4,
+	SYSTEM_STATE__SCREEN_LOCK,
+	SYSTEM_STATE__MAX
+};
+
 enum ta_slider {
 	TA_BEST_BATTERY,	/* Best Battery */
 	TA_BETTER_BATTERY,	/* Better Battery */
@@ -471,6 +479,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
 	u32 sppt_apuonly;	/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 92879ae4f8f0..c08ef13a1494 100644
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
@@ -113,6 +141,12 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
+
+		case PMF_POLICY_SYSTEM_STATE:
+			amd_pmf_update_uevents(dev, event);
+			dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
+				amd_pmf_uevent_as_str(event));
+			break;
 		}
 	}
 }
-- 
2.25.1

