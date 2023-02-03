Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824D689E7A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750A10E802;
	Fri,  3 Feb 2023 15:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189210E7ED;
 Fri,  3 Feb 2023 15:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCQpj3Edwr9bMFTyytw+kMo9vmTlVSDl87YTmhCn06PTFl5s7hfGXf7Toe/esNI0l01VePITHCqWIPJUIkYY2pm6hvK5QzOgiR0VTNy0J7NebYLEhflS4xomCmZkyHX0yqRS7olnCFT9y1jzisdyxPm8MIdnjfloyeVDvq2huR44aJXlAwdvm6MeAMBNTcbQBtqEBKwLHSko6wQB0TiCMC8PkY2JrQfJPgaduDNpzM54KDis+NVilLGIqEaupve8NOq1PCd49gAuiqBWD6vh4YjTKZgJ6rOliwhDZwfvqpzmErGWaFJ34uYHdXNYqxB5xSVVv82AdxNDXNRHuS6jSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tvFa4UZ7EKWdjweqjLTZaHO+/AlD/06jwsCf1pmbrk=;
 b=BEGYuImRNSd8+PZhRTWnupHyn3Q0ridia0o2+EqVFALBrqCryDqdUOgWSPX4nfqZHGtVeVCZpW7CzkIqPSx4sLx9M9ZVd6FfCprEFdb048w79HnOwFF6blFiuRfZRVgbCx/s7uQIw8p+sjFReRmlCaw3nmWZmAlVIM3BvmW7jUCojrMuCgUXMgBdZEZLQ+BPpEgq9BbuRd8eSMLjQqi/Mc8RkRCAQaNHVcOsmVVe6Sum/SY4g7mIpdDdqOGnUqNw+Vra0NsHKSBgw8aAf60z5i9TuxkLXahN1gy4wWpwd1yiOU0qQZu0wu3APnrsqammxQDYx45x0HJAPNG8zhTj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tvFa4UZ7EKWdjweqjLTZaHO+/AlD/06jwsCf1pmbrk=;
 b=qxFLEcBUm3rzoIlNpYFwE3jY1oCoyr+0Ufk+JTBmNt6b7Wz0F/SnuiLEUvSlh8ogrlLz/hadwv1b6Mola/DUFHjJ8huJ4pQOjz5yhLjXS8MamYI6t22yWXTtFhsm4Xv/pUoIpnSSi2KEWz9svhFOIZRTJzPPgZuiv02VD+G42xU=
Received: from MW4PR04CA0119.namprd04.prod.outlook.com (2603:10b6:303:83::34)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 15:42:44 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::67) by MW4PR04CA0119.outlook.office365.com
 (2603:10b6:303:83::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31 via Frontend
 Transport; Fri, 3 Feb 2023 15:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.31 via Frontend Transport; Fri, 3 Feb 2023 15:42:43 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Feb
 2023 09:42:41 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix read errors pertaining to
 dp_lttpr_status_show()
Date: Fri, 3 Feb 2023 10:43:26 -0500
Message-ID: <20230203154326.76121-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT019:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7ed046-9756-454d-2a42-08db05fd4a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vL15wKUZzlXCUOdPVE8XOVQK9t719ZTGMMAgYOBXKiNlHaFG2WEVHCdc8VRQe3EPbG5h8oVWGZiBk0JSkvWiqJucj124n9OMMe45U/Vu9vxYXgBlxMiZbel01qSVewEuB8mAGda+pVwUA3ylj/7NUlKfY17+XR9Kt/R9IWJFN0ZmoE3CNdIfgP/hsMjh3tX9fsUmZYajPTG6lCjgeXBFyTkxEeVXdmb1ibS0r+FEQJ9ASSXsz0u7xwv7wOntFIli2MhPfAjBLap+9Vs8kzuu7sucg5mctZqTErCx5N0yMVuML1oiApZDoNJnI/vcYCzJpGjINMzGmRB0TGcLcbdduopvVZdgs8h2Dwfdt19URy/WenKE/ej7ztFQgdEtTRVuW+M9ubsS+LYLKUDXA+0qB3ar5hGIOZ5BYPE3QNVkaMXRRcNVNemfWzBiKmULRZ7nwgd8fX5kQ3gXuQ+z5+Q4oKN0toJcoJsWo+lMkNAzH5+cUaXF7EgRL7CSLRxRfDydl17zgPl1ia49+gReesRiLU8NOB18hw1BFXOXoiOu13TfHYq621UPhYBIIU58hfd498xsn6gtR6BVdPU7i2Ov5A0T2L6cUYKHZKsHvjHhyG9advU50JvLvWTRwQ2wHXRHcHuqnLpJVmKdM4Q1oSXOjfBxumABfun0kRI+DA4ZkgsFsVLkW22nwE7V1qV7B7bWXfWjAYqKoivA+siV4cy64iL/W45cKCbA1xpzsM/ACgVap8PmSyua4lGGNFdYJxcv0uqgrbX6C31T2tVBkNZoA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(82740400003)(426003)(44832011)(40460700003)(8936002)(1076003)(478600001)(336012)(2616005)(83380400001)(186003)(6916009)(26005)(16526019)(70586007)(4326008)(316002)(41300700001)(5660300002)(8676002)(2906002)(70206006)(54906003)(86362001)(6666004)(36756003)(40480700001)(47076005)(82310400005)(356005)(36860700001)(81166007)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 15:42:43.7714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7ed046-9756-454d-2a42-08db05fd4a96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418
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
Cc: Alan Liu <HaoPing.Liu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wenjing Liu <wenjing.liu@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, it is likely that we will read the relevant LTTPR caps after
link training has completed (which can cause garbage data to be read),
however according to the DP 2.0 spec that should be done before link
training has commenced. So, instead of reading the registers on demand,
use the values provided to us by DC.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 72 ++++++-------------
 1 file changed, 22 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index e783082a4eef..cbc241596c1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -36,6 +36,7 @@
 #include "dsc.h"
 #include "link_hwss.h"
 #include "dc/dc_dmub_srv.h"
+#include "link/protocols/link_dp_capability.h"
 
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 #include "amdgpu_dm_psr.h"
@@ -418,67 +419,38 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
 	return result;
 }
 
-static int dp_lttpr_status_show(struct seq_file *m, void *d)
+static int dp_lttpr_status_show(struct seq_file *m, void *unused)
 {
-	char *data;
-	struct amdgpu_dm_connector *connector = file_inode(m->file)->i_private;
-	struct dc_link *link = connector->dc_link;
-	uint32_t read_size = 1;
-	uint8_t repeater_count = 0;
+	struct drm_connector *connector = m->private;
+	struct amdgpu_dm_connector *aconnector =
+		to_amdgpu_dm_connector(connector);
+	struct dc_lttpr_caps caps = aconnector->dc_link->dpcd_caps.lttpr_caps;
 
-	data = kzalloc(read_size, GFP_KERNEL);
-	if (!data)
-		return 0;
+	if (connector->status != connector_status_connected)
+		return -ENODEV;
 
-	dm_helpers_dp_read_dpcd(link->ctx, link, 0xF0002, data, read_size);
+	seq_printf(m, "phy repeater count: %u (raw: 0x%x)\n",
+		   dp_parse_lttpr_repeater_count(caps.phy_repeater_cnt),
+		   caps.phy_repeater_cnt);
 
-	switch ((uint8_t)*data) {
-	case 0x80:
-		repeater_count = 1;
-		break;
-	case 0x40:
-		repeater_count = 2;
-		break;
-	case 0x20:
-		repeater_count = 3;
-		break;
-	case 0x10:
-		repeater_count = 4;
-		break;
-	case 0x8:
-		repeater_count = 5;
-		break;
-	case 0x4:
-		repeater_count = 6;
-		break;
-	case 0x2:
-		repeater_count = 7;
+	seq_puts(m, "phy repeater mode: ");
+
+	switch (caps.mode) {
+	case DP_PHY_REPEATER_MODE_TRANSPARENT:
+		seq_puts(m, "transparent");
 		break;
-	case 0x1:
-		repeater_count = 8;
+	case DP_PHY_REPEATER_MODE_NON_TRANSPARENT:
+		seq_puts(m, "non-transparent");
 		break;
-	case 0x0:
-		repeater_count = 0;
+	case 0x00:
+		seq_puts(m, "non lttpr");
 		break;
 	default:
-		repeater_count = (uint8_t)*data;
+		seq_printf(m, "read error (raw: 0x%x)", caps.mode);
 		break;
 	}
 
-	seq_printf(m, "phy repeater count: %d\n", repeater_count);
-
-	dm_helpers_dp_read_dpcd(link->ctx, link, 0xF0003, data, read_size);
-
-	if ((uint8_t)*data == 0x55)
-		seq_printf(m, "phy repeater mode: transparent\n");
-	else if ((uint8_t)*data == 0xAA)
-		seq_printf(m, "phy repeater mode: non-transparent\n");
-	else if ((uint8_t)*data == 0x00)
-		seq_printf(m, "phy repeater mode: non lttpr\n");
-	else
-		seq_printf(m, "phy repeater mode: read error\n");
-
-	kfree(data);
+	seq_puts(m, "\n");
 	return 0;
 }
 
-- 
2.39.1

