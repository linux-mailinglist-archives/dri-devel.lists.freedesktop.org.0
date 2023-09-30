Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB777B3F47
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7E10E1BE;
	Sat, 30 Sep 2023 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B205910E1BE;
 Sat, 30 Sep 2023 08:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9MUZWk4d+KFSxrVJv+XiQu/gbCISU0W5+CgGgGwjgKeb+waGuhlXLx9T25LbdbE9+Md+WZ9fJBMFkaT2X8cexe5fU/tDXGjPtzCgQthQ2RQumoGkCamB3/02Z897Dgi8i0F7T/YGxlLt1TjJoxKTjFy9Anj70dtYPP+taQO299jCyox1KB/m2oKX+1+F+XrQNXtZsTzBYcOC1KK7xK0ekrW8Gx9H2kuHNkmhmLCDAwwWEdQKJ1245xpkc4oVSDFDZN4AebufdxTvgNKDWPpeTBk6e74gEw1TJdpYCluRJGyPA/tTx/EBAt+qabRLDpEdaMlpbYoEhdHyIrvpVgLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z6RatZiakEQom+JeqPcbTDXRmBQFd1wd5wdoqofpvs=;
 b=XeohVsFtWnJj3JqjTm7stHiGbu45u9vgPUfMp2wSt0PS3sDHc/tasf2lh/uzLVopDz5dbyBn9porPUTop8N1tPkhH/jp8vPQRPGOogjwO1NSPyq9fLbYAATHfqK91Cdyqg8QrCBfS54AHzyLSm5XwxyElbzlKSetMSWdVho25ilrmdV6nvOMd1+Mu8kZp2/nbPQISUTf4mPVh6UrPTEBS8WcS6+mJt1qi7l1Hb/wUT6As2K9dZqKhg650V1w1U3vHedv79v7KUFKRlcXZZHCuxVCkNzMNyKN7xv46rV1nrcOrR/5N9Ag2f2acuz8M6IkoLsbm+oMktTGBGBViBjaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z6RatZiakEQom+JeqPcbTDXRmBQFd1wd5wdoqofpvs=;
 b=HnYtzkRF8sT5lORx9wF8gLdMfijs9h5E1j92UBK7PnHf0DgIJfU8H8S1/ocFtlgcaA4TlATwFUB1SjtbICPUQ/akROWaC+fQyi3IqGqQy6nRPdTVqGMCQx8W7MdBc9pHUeBedETMKYfepNjXacRWitEy4BDemVMqClAkpM/7cqg=
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Sat, 30 Sep
 2023 08:38:45 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::53) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:40 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
Date: Sat, 30 Sep 2023 14:07:03 +0530
Message-ID: <20230930083715.2050863-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH7PR12MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 5681f9d4-2e59-4866-c40b-08dbc190a8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0yTfoA/Mpyvwam6W/OjFjS9NQ4s7h6eahB4ibvvm6itvXP4WH+lv89U8FHS3MXKFYmFIriQ9/Q2Oo8eBBZlopXIeVgl5Y0eX68g8IuPuQgawLwcMJtMxWwLWB2968zx+ykWweFhhRo/OQQ0Vpc97EgqDUhkdhAK7MwpNJrNLFA7yDKlQbIvg9sPSVqMLas1ZIFXy7dUoy9VfplNSJSCnq8GpnTy8YNL3RuLLHt7q3KgS5u7wZHpE0LrKndzPcF6TitmddPIL0F1oX1ePCVS4jXB+hsEF1O3IWcIybyd5QWJj5dSaOeK0xDNDWo2Xh5Ajbva11qs7y9U6adM8oT7e6+7hQ8+7EInPqoowIdbyhL87u/MtOYP+QuP7Zpe/Wa1/2aSx9DSOwLa65rWSkzS9JvimkxTQOihMJ02bOnE/FG9oiV0uXe0zjmGgkSrBT0+ZQhM/70ZmWOfTcTZ9VmJiJgoEO3D2XwT20Jf0q1TQz/ponTIaWn8gLGhZBttAaqrzbRlZI3hBe95lvh7blSqyhLjGhy0ziDvEyPu2Mb25j772WfAQDGFueHgSReuo+b7ZPD/bDkPTrvUc9w6Ew0KrHbqhvnfKFcXUh58r7FVb+HgLKXkTN+xUBmCyhAeOSZ31IbAFTvQYo21tDotu349BNpHLff1dBVzThGLqFYhu3nrQp7d+na6NQGw5Tfl4i2oU2FvkOM35vjdgli9VR9uu3z+6w6GVQ1CWuLELSfH4Vrp2InEjonpPKz1rMIGy5czGHGS9A6xNjWy7eTUwDrM9fW60p/CC+5HKABTr3VHu28=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(2616005)(7696005)(6666004)(478600001)(54906003)(47076005)(83380400001)(30864003)(2906002)(7416002)(316002)(70206006)(5660300002)(70586007)(426003)(41300700001)(8936002)(336012)(110136005)(8676002)(26005)(4326008)(40460700003)(1076003)(36756003)(16526019)(36860700001)(356005)(86362001)(921005)(40480700001)(82740400003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:45.3114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5681f9d4-2e59-4866-c40b-08dbc190a8be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903
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

PMF Policy binary is a encrypted and signed binary that will be part
of the BIOS. PMF driver via the ACPI interface checks the existence
of Smart PC bit. If the advertised bit is found, PMF driver walks
the acpi namespace to find out the policy binary size and the address
which has to be passed to the TA during the TA init sequence.

The policy binary is comprised of inputs (or the events) and outputs
(or the actions). With the PMF ecosystem, OEMs generate the policy
binary (or could be multiple binaries) that contains a supported set
of inputs and outputs which could be specifically carved out for each
usage segment (or for each user also) that could influence the system
behavior either by enriching the user experience or/and boost/throttle
power limits.

Once the TA init command succeeds, the PMF driver sends the changing
events in the current environment to the TA for a constant sampling
frequency time (the event here could be a lid close or open) and
if the policy binary has corresponding action built within it, the
TA sends the action for it in the subsequent enact command.

If the inputs sent to the TA has no output defined in the policy
binary generated by OEMs, there will be no action to be performed
by the PMF driver.

Example policies:

1) if slider is performance ; set the SPL to 40W
Here PMF driver registers with the platform profile interface and
when the slider position is changed, PMF driver lets the TA know
about this. TA sends back an action to update the Sustained
Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.

2) if user_away ; then lock the system
Here PMF driver hooks to the AMD SFH driver to know the user presence
and send the inputs to TA and if the condition is met, the TA sends
the action of locking the system. PMF driver generates a uevent and
based on the udev rule in the userland the system gets locked with
systemctl.

The intent here is to provide the OEM's to make a policy to lock the
system when the user is away ; but the userland can make a choice to
ignore it.

and so on.

The OEMs will have an utility to create numerous such policies and
the policies shall be reviewed by AMD before signing and encrypting
them. Policies are shared between operating systems to have seemless user
experience.

Since all this action has to happen via the "amdtee" driver, currently
there is no caller for it in the kernel which can load the amdtee driver.
Without amdtee driver loading onto the system the "tee" calls shall fail
from the PMF driver. Hence an explicit "request_module" has been added
to address this.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |   1 +
 drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
 drivers/platform/x86/amd/pmf/core.c   |  12 +++
 drivers/platform/x86/amd/pmf/pmf.h    | 135 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 141 +++++++++++++++++++++++++-
 5 files changed, 324 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 3064bc8ea167..437b78c6d1c5 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -9,6 +9,7 @@ config AMD_PMF
 	depends on POWER_SUPPLY
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
+	depends on AMDTEE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3fc5e4547d9f..d0512af2cd42 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 	return 0;
 }
 
+static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
+{
+	struct amd_pmf_dev *dev = data;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_ADDRESS64:
+		dev->policy_addr = res->data.address64.address.minimum;
+		dev->policy_sz = res->data.address64.address.address_length;
+		break;
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		dev->policy_addr = res->data.fixed_memory32.address;
+		dev->policy_sz = res->data.fixed_memory32.address_length;
+		break;
+	}
+
+	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
+		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
+{
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+	acpi_status status;
+
+	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
+	if (ACPI_FAILURE(status)) {
+		dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
+		return status;
+	}
+
+	return 0;
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 678dce4fea08..787f25511191 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -384,6 +384,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->dev = &pdev->dev;
+	err = apmf_check_smart_pc(dev);
+	if (!err) {
+		/* in order for Smart PC solution to work it has a hard dependency
+		 * on the amdtee driver to be loaded first even before the PMF driver
+		 * loads. PMF ASL has a _CRS method that advertises the existence
+		 * of Smart PC bit. If this information is present, use this to
+		 * explicitly probe the amdtee driver, so that "tee" plumbing is done
+		 * before the PMF Smart PC init happens.
+		 */
+		if (request_module("amdtee"))
+			pr_err("Failed to load amdtee. PMF Smart PC not enabled!\n");
+	}
 
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 3930b8ed8333..6f4b6f4ecee4 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -14,6 +14,11 @@
 #include <linux/acpi.h>
 #include <linux/platform_profile.h>
 
+#define POLICY_BUF_MAX_SZ		0x4b000
+#define POLICY_SIGN_COOKIE		0x31535024
+#define POLICY_COOKIE_OFFSET		0x10
+#define POLICY_COOKIE_LEN		0x14
+
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
@@ -59,8 +64,20 @@
 #define ARG_NONE 0
 #define AVG_SAMPLE_SIZE 3
 
+/* Policy Actions */
+#define PMF_POLICY_SPL						2
+#define PMF_POLICY_SPPT						3
+#define PMF_POLICY_FPPT						4
+#define PMF_POLICY_SPPT_APU_ONLY				5
+#define PMF_POLICY_STT_MIN					6
+#define PMF_POLICY_STT_SKINTEMP_APU				7
+#define PMF_POLICY_STT_SKINTEMP_HS2				8
+
 /* TA macros */
 #define PMF_TA_IF_VERSION_MAJOR				1
+#define TA_PMF_ACTION_MAX					32
+#define TA_PMF_UNDO_MAX						8
+#define MAX_OPERATION_PARAMS					4
 
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
@@ -183,11 +200,16 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	unsigned char *policy_buf;
+	u32 policy_sz;
 	struct tee_context *tee_ctx;
 	struct tee_shm *fw_shm_pool;
 	u32 session_id;
 	void *shbuf;
 	struct delayed_work pb_work;
+	struct pmf_action_table *prev_data;
+	u64 policy_addr;
+	void *policy_base;
 	bool smart_pc_enabled;
 };
 
@@ -399,17 +421,129 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+/* Smart PC - TA internals */
+enum ta_slider {
+	TA_BEST_BATTERY, /* Best Battery */
+	TA_BETTER_BATTERY, /* Better Battery */
+	TA_BETTER_PERFORMANCE, /* Better Performance */
+	TA_BEST_PERFORMANCE, /* Best Performance */
+	TA_MAX,
+};
+
 /* cmd ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
 	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
 };
 
+enum ta_pmf_error_type {
+	TA_PMF_TYPE_SUCCESS,
+	TA_PMF_ERROR_TYPE_GENERIC,
+	TA_PMF_ERROR_TYPE_CRYPTO,
+	TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
+	TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
+	TA_PMF_ERROR_TYPE_POLICY_BUILDER,
+	TA_PMF_ERROR_TYPE_PB_CONVERT,
+	TA_PMF_ERROR_TYPE_PB_SETUP,
+	TA_PMF_ERROR_TYPE_PB_ENACT,
+	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
+	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
+	TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
+	TA_PMF_ERROR_TYPE_MAX,
+};
+
+struct pmf_action_table {
+	unsigned long spl; /* in mW */
+	unsigned long sppt; /* in mW */
+	unsigned long sppt_apuonly; /* in mW */
+	unsigned long fppt; /* in mW */
+	unsigned long stt_minlimit; /* in mW */
+	unsigned long stt_skintemp_apu; /* in C */
+	unsigned long stt_skintemp_hs2; /* in C */
+};
+
+/* Input conditions */
+struct ta_pmf_condition_info {
+	u32 power_source;
+	u32 bat_percentage;
+	u32 power_slider;
+	u32 lid_state;
+	bool user_present;
+	u32 rsvd1[2];
+	u32 monitor_count;
+	u32 rsvd2[2];
+	u32 bat_design;
+	u32 full_charge_capacity;
+	int drain_rate;
+	bool user_engaged;
+	u32 device_state;
+	u32 socket_power;
+	u32 skin_temperature;
+	u32 rsvd3[5];
+	u32 ambient_light;
+	u32 length;
+	u32 avg_c0residency;
+	u32 max_c0residency;
+	u32 s0i3_entry;
+	u32 gfx_busy;
+	u32 rsvd4[7];
+	bool camera_state;
+	u32 workload_type;
+	u32 display_type;
+	u32 display_state;
+	u32 rsvd5[150];
+};
+
+struct ta_pmf_load_policy_table {
+	u32 table_size;
+	u8 table[POLICY_BUF_MAX_SZ];
+};
+
+/* TA initialization params */
+struct ta_pmf_init_table {
+	u32 frequency; /* SMU sampling frequency */
+	bool validate;
+	bool sku_check;
+	bool metadata_macrocheck;
+	struct ta_pmf_load_policy_table policies_table;
+};
+
+/* Everything the TA needs to Enact Policies */
+struct ta_pmf_enact_table {
+	struct ta_pmf_condition_info ev_info;
+	u32 name;
+};
+
+struct ta_pmf_action {
+	u32 action_index;
+	u32 value;
+};
+
+/* output actions from TA */
+struct ta_pmf_enact_result {
+	u32 actions_count;
+	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
+	u32 undo_count;
+	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
+};
+
+union ta_pmf_input {
+	struct ta_pmf_enact_table enact_table;
+	struct ta_pmf_init_table init_table;
+};
+
+union ta_pmf_output {
+	struct ta_pmf_enact_result policy_apply_table;
+	u32 rsvd[906];
+};
+
 struct ta_pmf_shared_memory {
 	int command_id;
 	int resp_id;
 	u32 pmf_result;
 	u32 if_version;
+	union ta_pmf_output pmf_output;
+	union ta_pmf_input pmf_input;
 };
 
 /* Core Layer */
@@ -460,4 +594,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 /* Smart PC builder Layer*/
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
+int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 1b3985cd7c08..15aa6e6e1050 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	param[0].u.memref.shm_offs = 0;
 }
 
+static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+{
+	unsigned long val;
+	int idx;
+
+	for (idx = 0; idx < out->actions_count; idx++) {
+		val = out->actions_list[idx].value;
+		switch (out->actions_list[idx].action_index) {
+		case PMF_POLICY_SPL:
+			if (dev->prev_data->spl != val) {
+				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
+				dev_dbg(dev->dev, "update SPL : %lu\n", val);
+				dev->prev_data->spl = val;
+			}
+			break;
+
+		case PMF_POLICY_SPPT:
+			if (dev->prev_data->sppt != val) {
+				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
+				dev_dbg(dev->dev, "update SPPT : %lu\n", val);
+				dev->prev_data->sppt = val;
+			}
+			break;
+
+		case PMF_POLICY_FPPT:
+			if (dev->prev_data->fppt != val) {
+				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
+				dev_dbg(dev->dev, "update FPPT : %lu\n", val);
+				dev->prev_data->fppt = val;
+			}
+			break;
+
+		case PMF_POLICY_SPPT_APU_ONLY:
+			if (dev->prev_data->sppt_apuonly != val) {
+				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
+				dev_dbg(dev->dev, "update SPPT_APU_ONLY : %lu\n", val);
+				dev->prev_data->sppt_apuonly = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_MIN:
+			if (dev->prev_data->stt_minlimit != val) {
+				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_MIN : %lu\n", val);
+				dev->prev_data->stt_minlimit = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_APU:
+			if (dev->prev_data->stt_skintemp_apu != val) {
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %lu\n", val);
+				dev->prev_data->stt_skintemp_apu = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_HS2:
+			if (dev->prev_data->stt_skintemp_hs2 != val) {
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %lu\n", val);
+				dev->prev_data->stt_skintemp_hs2 = val;
+			}
+			break;
+		}
+	}
+}
+
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_result *out = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
@@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	if (!dev->tee_ctx)
 		return -ENODEV;
 
+	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
+	out = &ta_sm->pmf_output.policy_apply_table;
+
 	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
@@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		return -EINVAL;
 	}
 
+	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
+			ta_sm->pmf_result);
+		amd_pmf_apply_policies(dev, out);
+	}
+
 	return 0;
 }
 
@@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
+	struct ta_pmf_init_table *in = NULL;
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
 
@@ -80,10 +158,20 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 		return -ENODEV;
 	}
 
+	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
+	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
+	in = &ta_sm->pmf_input.init_table;
+
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+	in->metadata_macrocheck = false;
+	in->sku_check = false;
+	in->validate = true;
+	in->frequency = pb_actions_ms;
+	in->policies_table.table_size = dev->policy_sz;
 
+	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
@@ -103,6 +191,47 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
+static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
+{
+	u32 cookie, length;
+	int res;
+
+	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
+	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
+
+	if (cookie != POLICY_SIGN_COOKIE || !length)
+		return -EINVAL;
+
+	/* update the actual length */
+	dev->policy_sz = length + 512;
+	res = amd_pmf_invoke_cmd_init(dev);
+	if (res == TA_PMF_TYPE_SUCCESS) {
+		/* now its safe to announce that smart pc is enabled */
+		dev->smart_pc_enabled = 1;
+		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
+	} else {
+		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
+		return res;
+	}
+
+	return 0;
+}
+
+static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
+{
+	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
+	if (!dev->policy_buf)
+		return -ENOMEM;
+
+	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
+	if (!dev->policy_base)
+		return -ENOMEM;
+
+	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
+
+	return amd_pmf_start_policy_engine(dev);
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -148,7 +277,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
 		goto out_ctx;
 	}
 
-	size = sizeof(struct ta_pmf_shared_memory);
+	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
 	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
 	if (IS_ERR(dev->fw_shm_pool)) {
 		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
@@ -197,11 +326,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		return ret;
 
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
-	return 0;
+	amd_pmf_set_dram_addr(dev);
+	amd_pmf_get_bios_buffer(dev);
+	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
+	if (!dev->prev_data)
+		return -ENOMEM;
+
+	return dev->smart_pc_enabled;
 }
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	kfree(dev->prev_data);
+	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.25.1

