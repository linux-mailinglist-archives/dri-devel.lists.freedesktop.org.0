Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B45855555
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4A210E78F;
	Wed, 14 Feb 2024 21:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1OgsIgDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223810E7DD;
 Wed, 14 Feb 2024 21:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIT4i87p6+igZSg7zZehRj94hlWJFA1tCnROgpErcKaF3p4gE8jSBPRNtjHSeT7tguVAEx7rmekizd8rfzwhLKPYsq+rofDhNe/VPCnDnpqcRaLJG/X5I0JqwJzxITpGXhsB+jakTxeM/vi48w7I23QrtAeBN0Ar9j2f/bqo8MFBdVnZ4p8EjrzugdHP7Y2JXvbvSw2cCK20cWBFYCoVwOoqo3UfK2ftweBRDQl3Ko320D/AlBNzv14SYt0hFO/BSk66cH2A+ysYz358TeeakV1/KB5s9zYpBc6gZ4fhXyVegZ9BJXdJ+/kY8ILL5TwATNz9PO99cRnDac4rIRvOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ORp1B0GDlx0yhtKVHvd8wLazCIEidsG80UXdSSW/bo=;
 b=FsdSjcECuWXoriZTjVx8Sa/aGGN5Zcvmwtpm4KAGuDfYsapWztei7wC9cssv2xA7H2tu57asLuPmyWL3ccfr3vgi4sejhLGNwL4ZRjmrJTnZJwR+L2JSlrjqfMGzIZ31aqm990FkI4L7kr59jk8CVZRYQvx91vmfzh+NbCoDP5TRo302m2fNA7hMNrVOo0fZsIS6OSIPo8ENXGFWGdkdB7ZcQM57lHDSa5jaDKRwceF8fCyC+8lPtzUCgYJt6yJF4g1EI/yIUWD1gt5bmmBuwi6C4s2yuvsgD9K0HiYIVRPfFS8XEyJWS6BFWIdvjElz9UEsua7eHm05QsYIcj/94w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ORp1B0GDlx0yhtKVHvd8wLazCIEidsG80UXdSSW/bo=;
 b=1OgsIgDKz1C6AyLXEozEznA7ftBeHVsXCHkF5pPYMe1Hqp2e/a6Z5feiQk5W/gys4n3VFHMX+KmK+BnEND5hcE2EWuY6ijQfE0MS3of9Lz1bdU4Kq/7EL5NheQV3PdBDRjInopfIlpdv7Tkiv5742i1d+P2Up70nIfklOtZOJFs=
Received: from BL0PR1501CA0017.namprd15.prod.outlook.com
 (2603:10b6:207:17::30) by SA1PR12MB6920.namprd12.prod.outlook.com
 (2603:10b6:806:258::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.18; Wed, 14 Feb
 2024 21:58:30 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::5f) by BL0PR1501CA0017.outlook.office365.com
 (2603:10b6:207:17::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:30 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 4/5] drm/amd: Fetch the EDID from _DDC if available for eDP
Date: Wed, 14 Feb 2024 15:57:55 -0600
Message-ID: <20240214215756.6530-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7ad7d4-4bac-44e9-d0f5-08dc2da81483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xiiJQ96Vp9Gm6Xm/ImMcB90XfBvuBuxpGw5lSpy44KXkYHlkVqXlAPL2PYUGuwplk/Gip+48Z074oQlAdY+uE93olodmiLgh+NRCNFFc5uldZS2zj7kRb+kacU78oIkWNDiYE0rD+MphtCJd5VAXEIO/8lBztveLYqk3NM6wE3A8o5aP81diOFVIaz4+zDVn3yxotikS2Nqtcnj5VzrBal9GKWnIviGMFnAyYh1SEYipo0KFJsnI2EPZw+GaDU8idB886JTfZwIE01fkfNcgtkRfH5sciYd4Xm7FPJW6Diu1d4VU/lKKi2/EHH190+JegfIarmA2jxV4rWggpMPz93XDR5i9rTyGr+uwFeMAl/NMyGesu9g+V+aFZ459YMmF40mughJEC9tXsKngMDBJcBp+1GPhBhxLn20Lq8IjrjLQROu+JQENVk7Jg37k0TNfFA8e1OU353Cgw3GFs28CgRWiRVCIWt+e/IEPK3jxkX31okW9FNxkdQYfHXKneNOD3OvcMYKrfXpUkpOMSKO8fVA/imcWGmhrpZbx7t2Cb+H9iaVpW2XrRk2joXf8In/XcUXMalZNRBjho16B+g/bb7a5yPZGUP44vhQLonk2bMqOQT9KP9U2aOFDhrv7XocZhzThsI3bCdx1e7k5jr1XNUa9Wzl4zN8+jpjBUap92KU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(36860700004)(82310400011)(451199024)(1800799012)(186009)(64100799003)(46966006)(40470700004)(86362001)(7416002)(36756003)(2906002)(44832011)(7696005)(66899024)(70206006)(316002)(82740400003)(426003)(6666004)(110136005)(336012)(54906003)(2616005)(41300700001)(16526019)(1076003)(66574015)(4326008)(5660300002)(8936002)(83380400001)(8676002)(26005)(81166007)(70586007)(478600001)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:30.1237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7ad7d4-4bac-44e9-d0f5-08dc2da81483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
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

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.

Attempt to fetch this EDID if it exists and prefer it over the EDID
that is provided by the panel. If a user prefers to use the EDID from
the panel, offer a module parameter that would disable this.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                       | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c            | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                   | 8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 4 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 ++
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 312dfaec7b4a..fcec39a62a39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -215,6 +215,7 @@ extern int amdgpu_smartshift_bias;
 extern int amdgpu_use_xgmi_p2p;
 extern int amdgpu_mtype_local;
 extern bool enforce_isolation;
+extern bool acpi_edid;
 #ifdef CONFIG_HSA_AMD
 extern int sched_policy;
 extern bool debug_evictions;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 9caba10315a8..9165a199ac9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -281,6 +281,9 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	if (amdgpu_connector->edid)
 		return;
 
+	/* if the BIOS specifies the EDID via _DDC, prefer this */
+	connector->acpi_edid_allowed = acpi_edid;
+
 	/* on hw with routers, select right port */
 	if (amdgpu_connector->router.ddc_valid)
 		amdgpu_i2c_router_select_ddc_port(amdgpu_connector);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 161ecf9b4174..9676df447a57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -166,6 +166,7 @@ uint amdgpu_sdma_phase_quantum = 32;
 char *amdgpu_disable_cu;
 char *amdgpu_virtual_display;
 bool enforce_isolation;
+bool acpi_edid = true;
 /*
  * OverDrive(bit 14) disabled by default
  * GFX DCS(bit 19) disabled by default
@@ -990,6 +991,13 @@ MODULE_PARM_DESC(wbrf,
 	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
 module_param_named(wbrf, amdgpu_wbrf, int, 0444);
 
+/**
+ * DOC: acpi_edid (bool)
+ * Try to fetch EDID for eDP display from BIOS using ACPI _DDC method.
+ */
+module_param(acpi_edid, bool, 0444);
+MODULE_PARM_DESC(acpi_edid, "Fetch EDID for eDP display from BIOS");
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 467796d97313..504577ea36e7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6649,8 +6649,10 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	 * Note: drm_get_edid gets edid in the following order:
 	 * 1) override EDID if set via edid_override debugfs,
 	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
+	 * 3) ACPI EDID if allowed via module parameter
+	 * 4) regular DDC read.
 	 */
+	connector->acpi_edid_allowed = acpi_edid;
 	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
 	if (!edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 85b7f58a7f35..d570a1b6141b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -910,6 +910,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
+		/* prefer ACPI over panel for eDP */
+		connector->acpi_edid_allowed = acpi_edid;
 
 		edid = drm_get_edid(&aconnector->base, ddc);
 
-- 
2.34.1

