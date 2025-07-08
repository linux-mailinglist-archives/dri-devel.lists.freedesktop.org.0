Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2783AFC49E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADC310E5B7;
	Tue,  8 Jul 2025 07:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u1l/KZC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A44910E5B5;
 Tue,  8 Jul 2025 07:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGq4uWCK1QfU1QCFS3sptApn3aYgf9J3Hq/wWeBSTGfX1zmWC09JX9UYadQwQlwoqI5M8+cPrz9u4tCfDcmjvKyeEEuWGVXyeEJC8THEOC1UEEvD81+IhjThuDiGV1rNf94iUpZUXsNkigX5UT/F0/0/Nk1Tb0pxbtBfPK/Eb6Q97snOhoVvVKXXU7dS+EJ3JNdSr6KwAPVVwyP5exmdYlkJRDx43qu2Gxda1hNPZSla+GAPYJkbFH5U68x2xFMmCXUOFaeR4jF7EpOjJ/3NnpoHVRdyGfrxfBrgQye06dSwjnCgXb+ynNrcFcpC00EZYZn3yMhFxlP5oFv/NIfGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xym4mZavriymwDV6mHeMq+tNK9ckXmzB+clUJPzQqXM=;
 b=dMuoatZqucOff3ZeWXGhsjb4mfUDNfmqMA6WWk6WfR749B6XF6XPv9pC7pqhm/9zJPFxgKk97lcJNx5uZrmhOHMCQBKYsgCZY+DvqcFbwSOCgaZVEc+j3VzwuYnj7BwR+KJc/Roab1Pqno8VYlKm4Oex5wVHPifWSkorOUdYSXR2IIqu8tqPPQdycRbVLVfrIFHemkUPXWP6zxMDZ6flwTk2zefRzWovyZVjZyIoQu5Ix1UYTNFMBkPFYkU8RUle2M1NaC+21ZM93EtFHoQs3UsBiZHd0Bb7MhHIqYxkkPVRSRYprxvrdU5nr3rvLfR5eg5kkShemczG9rDlKH/eLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xym4mZavriymwDV6mHeMq+tNK9ckXmzB+clUJPzQqXM=;
 b=u1l/KZC5o8wI/ug0OrXzaYOuZxpOeI32gCAPf1ND6+9c3qXvA30hKNYkckhUDCx6PTiCnI1g7Ek5076G0+fuWiUswJy4NeUiddGcLg3I11n46HIyFTcFagwA2dMpqGk9U+kZNNndWEFPnAGtG8NcOiVQ8rmL13MNl/4uivW961o=
Received: from CH2PR11CA0015.namprd11.prod.outlook.com (2603:10b6:610:54::25)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 07:51:46 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::1b) by CH2PR11CA0015.outlook.office365.com
 (2603:10b6:610:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 07:51:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 07:51:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:44 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 02:51:39 -0500
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
Subject: [PATCH v3 4/5] PM: hibernate: add new api pm_transition_event()
Date: Tue, 8 Jul 2025 15:42:47 +0800
Message-ID: <20250708074248.1674924-5-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250708074248.1674924-1-guoqing.zhang@amd.com>
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|BY5PR12MB4163:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e8bc69-454b-4b2f-283e-08ddbdf4495e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3l79lFPZ2GZvQMuKFCrXroNydL5O94MTrl0ir3RpYBR7zuHylKaobASKJmX7?=
 =?us-ascii?Q?8jhO9CrPVJnwUWxgvyS+TTnXE+fR9ZfDMU0u3jHC4YYMTbRFAtAgs7kJVaNW?=
 =?us-ascii?Q?kwagH/raLy5F/VJ1OpEicn0LASlGhDUN4MqarD6yh6IoD5Her4aoyjFXVJYV?=
 =?us-ascii?Q?pRaPPe1Aswq07iWZ4Hq6P/0XIWZeW+R4QGxN4gQCfq28G0OL2AP+qA3sHckk?=
 =?us-ascii?Q?2ATCaBiRdCSI7Tx+BvcrIDqCG6h9M2Vy/G5q+uPhFnSXb5nvlcd5VgXFLnL5?=
 =?us-ascii?Q?H20BNmIRz6Bv45BMToScWzRNo0vcaRuQF3TmWsmJMxUJ7GEkos2BNvEAfBnd?=
 =?us-ascii?Q?gws0otksiEpVwtgMlcr2DdY/wsh6k3Y1bbn35SStddzua4DdC0n6qela/tpA?=
 =?us-ascii?Q?G87b7Y75ELO5hdeg76tDaQaHMgY8xzPu3PcVWSabrZdBXOF9BuA4Jb7H9TXT?=
 =?us-ascii?Q?AmuikNPX1GQgy6jKaIWB4BRhJ+d+26jrqczXT+wGNUSWa/1r5PYGt44Rx2LF?=
 =?us-ascii?Q?98YTEaGAkkLTjsP1FOANmjvtPN1aCKWaEwXmA2z9YxahPKT5xt2UQmtjlw+N?=
 =?us-ascii?Q?/Y12Jn5PdZCURl9Aqkn91e8TCOaa0DjwManX6a3u1Y4Hrz9lD5Z2lgC6Afs8?=
 =?us-ascii?Q?TJLbHrMrgE7K4dNOjyMj8RSDRRBXgZC2yQ5Sqqt851gFKdOm4SzdKQYygocR?=
 =?us-ascii?Q?d3XRNObqrA8OuRYeZlM/KqJVTkGBw+y6P0+KNy6YuwRUQbJf3A1HIGGz0YbU?=
 =?us-ascii?Q?cZ/mwgxE5Q9K8qAuJhoHhVaaXdv6fx/j+a7nlkRmdyBEY7rP0FxXSXuF25Jy?=
 =?us-ascii?Q?GW1hs+re2ZageyeQoIsHIFSd5LAG9lT2cH9eDH8SyflJ1pkbr85RN4wvbncS?=
 =?us-ascii?Q?y0xvudBJ5/hF+iD6D966HXfkS+hi3t+Tl8Z8KDpdSy6xrgQcCNCJJu4eCIuo?=
 =?us-ascii?Q?gG0iNuThfBmmOLXgGuZcIMoBw/PjTKNFegIwtBUZUG0VbqA1Dnv7NH7I3enL?=
 =?us-ascii?Q?u1CYBfHtCGz1Tfpa3YmcJI3/nS+uJjlwBXci7w0KzOCbdZFS8VciNVXZrNnf?=
 =?us-ascii?Q?F5wRreoCur1EMNWBJDugamaXv23knOdh8iRPvUlTPYQuNDi7+O1JZbQAOdFG?=
 =?us-ascii?Q?4kiltLbCBAQwbSvELfNpnTXbdymAgNbcxCWKg2n09jDTu/Y9iKa6SrkzUMKa?=
 =?us-ascii?Q?6+SwLARaUBunErvVMnyj6B6luWRbEHlBYOftTAPZbSlJMv2q5TU1r1bzCz7Y?=
 =?us-ascii?Q?c30gXFQoDAfh2xJxrjtBgzScOc89ogt77Fg2bCJpXrQZmLNH/kEmL6gfajpq?=
 =?us-ascii?Q?+rzJH0YzNULhiIeoyuRGUoJGr23XFTQKSeTXB2/Kxv3cftyfoRvi0a7ll8RR?=
 =?us-ascii?Q?j9DlJEdgBDuFg724v0yI40TMac5i7kmZB1ZXSFergdlIZOJoo5vNbjpI3+2i?=
 =?us-ascii?Q?9jROOnfhPaap1sWlec6AeERVr9b/4WpUKINmAULm1kYvFYPtLezRFr+c44py?=
 =?us-ascii?Q?zw5QuIdM5MrhJzGEC/iRiV5KA0iX5bGcHLmJH04MfTQMA/4thVcU1IHV+g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:51:45.6310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e8bc69-454b-4b2f-283e-08ddbdf4495e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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
 drivers/base/power/main.c |  5 +++++
 include/linux/pm.h        | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 78855d794342..d1cb77ede1a2 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -657,6 +657,22 @@ struct pm_subsys_data {
 #define DPM_FLAG_SMART_SUSPEND		BIT(2)
 #define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
 
+/**
+ * pm_transition_event() - Query the current pm transition event value.
+ *
+ * Used to query the reason why thaw() is called. It will be one of 2 values:
+ *
+ * PM_EVENT_THAW: normal case.
+ *		hibernation image has been created.
+ *
+ * PM_EVENT_RECOVER: error case.
+ *		creation of a hibernation image or restoration of the main memory
+ *		contents from a hibernation image has failed.
+ *
+ * Return: PM_EVENT_ messages
+ */
+int pm_transition_event(void);
+
 struct dev_pm_info {
 	pm_message_t		power_state;
 	bool			can_wakeup:1;
-- 
2.43.5

