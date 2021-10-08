Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB1426690
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01916F463;
	Fri,  8 Oct 2021 09:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284D6F41C;
 Fri,  8 Oct 2021 09:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH31UFubL3zwSwctdiPuXfC3ZMKRoLtM/V1zbVrwazd+JuV9+DzDZvg9eGHyKsMVq1ac382/WpFEo2bQoF3hZonxJoqh5Cs9cf8ASwUvXFvu+uY2F4KCDAEkSt+O2b4gKr7US6uw6KLrp4CqysOBtRYabEYUVdEE+sxpXQlYXrIXf25eWAQ0pTblefBbtHRPfkbWin84fu5spF4zEPHv91b/2i0gSMUp9cxN9tkKlBC4ACIMFoEZSvk9f+hU93iNIlBIOgTH7pXsOjLKWPmnFTa2RMvPFL4M8Cm3iR22/PBvNAD2YrS6IC9GsAk0WEuiLyHBAN4Q6DYJcWntvsPkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ELd+NLVY+PiXPNN8OXyDZYbp5CdVhjzfdlUUHK0QlM=;
 b=U6PmzHyAI+o+HinHGJmiW6bQWgiDugIFpqyUqL9ltDXus9UM1hFlNbDuDzRDIrxw22OszM2XC/heku/58/uNvihR0fox0yn6bMu5PbhndpyFCzhECxYtTV47/ZzE/7pSTgDzuooCJMaQ36J2XKM+uILOUahX55YNAhueHvJY2zkde/Q1ohDyqGFOhV5DZxGg5ZysQbvkraL2eUur55HGFqCNfSUJ+vKf8KGuRcFbbt3MuSxXLAjkVexWpFAAGYlQuXaJC2hv5u4y5gJp8f+jM4KL04JlwdlnC8WxIlzTjcpfK675Emv0A6Y3iaAduoGFFo4/fby+CrhXAWKRCCVh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ELd+NLVY+PiXPNN8OXyDZYbp5CdVhjzfdlUUHK0QlM=;
 b=MzokpLt1ADenGoW0CDOO/ljOOB1LCzuk+pSghZbAM+ixy973IO2x4xy8c7f71pSHliykq9WHyiHvbK57ebLGE7GR3/P7jXNYrGQJZ3m9G++ole4c+GEFCkru5ch2yT854kVbrby6MO8awm+yeMExEQ3UT97lrbYaEHbwRIkMtQU=
Received: from DM5PR17CA0065.namprd17.prod.outlook.com (2603:10b6:3:13f::27)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 8 Oct
 2021 09:17:26 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::33) by DM5PR17CA0065.outlook.office365.com
 (2603:10b6:3:13f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 09:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 09:17:26 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 04:17:24 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/5] drm/tegra: check root dentry before debugfs init
Date: Fri, 8 Oct 2021 11:17:04 +0200
Message-ID: <20211008091704.27094-5-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f9dc84-4ad9-4ae7-2e7b-08d98a3c71e8
X-MS-TrafficTypeDiagnostic: MW3PR12MB4474:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44740BE5E61EB59EBA73A2818BB29@MW3PR12MB4474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m1trmWtWYd01qWzrMuiO7hUkiy0EKXXKM0PXzjWI3fswGfulWAQLvJcUhcEGkAONHKkTP3gkbxGMrRd69M6ePE5lpVG3n9/tOhOAWWt2bLvnlfri97/qT4m3t/9iNsI3BQaA1jY0dA4hjWfsMGCDECTZoUOQhA9CF4ho8tXjedNo886kDvIS4VUTrf9AHkQ5VhCVy3wwhg+fOLJarB4jF/dd+hJuKP7SitEsyXKHv7CcUXgDtqoIU+ytmMUeX/S0op/DAkc1GfRnUoYPr0RA8nUHj+ue+NvnUfiBNQHhrxyOyzBadwW2ehmz6ztuutz0VC8JEDgwzclWzs9k0W1wyOJRklXu1+Dt5dvNwboAcn8SDuyRJd0gbHKQ7Bb8XMPJq3xhiA7cMbxq6azecp3IWYlUh4FWwHfxx9+uhLLEZbSrcd23PJkuU1/VObhpJDqfvjH5OKyRE5T+oFytkzA64yYjWjYpt0elINZ6BH2mK2bSpMmu0cWhy7f1ZtgB7ooQrzNa1H1OUYWoDSUh8fACSmenm1EsQJYqI0Uq4FAZdZuzxfdZySa50L5wdS95/e5aHlPW+xs4wjHYCzbb8OGvb4keH6DB9c73m6tunlKfX82CvR9ivqecYuJbFEtYInpPAIdliWl2xbJkrqfhGV6alL0XBjmulEKV/fsWmHmbcMMcQXzVn+rEgtfv/MZTBbPr82emGDfWPU+j1lQPkz8bImKxCZC6qnmV9dvFdfCQc44=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7696005)(54906003)(316002)(44832011)(36860700001)(508600001)(8676002)(6666004)(26005)(70206006)(86362001)(36756003)(186003)(16526019)(1076003)(70586007)(82310400003)(2906002)(4326008)(5660300002)(8936002)(47076005)(426003)(336012)(6916009)(2616005)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:17:26.1889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f9dc84-4ad9-4ae7-2e7b-08d98a3c71e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
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

Return early if crtc or connector's debugfs root dentries are NULL.

CC: Thierry Reding <thierry.reding@gmail.com>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Jonathan Hunter <jonathanh@nvidia.com>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/tegra/dc.c   | 5 +++++
 drivers/gpu/drm/tegra/dsi.c  | 4 ++++
 drivers/gpu/drm/tegra/hdmi.c | 5 +++++
 drivers/gpu/drm/tegra/sor.c  | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..87eeda68d231 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1623,6 +1623,11 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);

+	if (!crtc->debugfs_entry) {
+		dc->debugfs_files = NULL;
+		return 0;
+	}
+
 #ifdef CONFIG_DEBUG_FS
 	root = crtc->debugfs_entry;
 #else
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f46d377f0c30..f0263165e261 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -236,6 +236,10 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_dsi *dsi = to_dsi(output);

+	if (!root) {
+		dsi->debugfs_files = NULL;
+		return 0;
+	}
 	dsi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
 	if (!dsi->debugfs_files)
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..400319db0afc 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1065,6 +1065,11 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_hdmi *hdmi = to_hdmi(output);

+	if (!root) {
+		hdmi->debugfs_files = NULL;
+		return 0;
+	}
+
 	hdmi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				      GFP_KERNEL);
 	if (!hdmi->debugfs_files)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..a8a3b0a587d9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1687,6 +1687,10 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_sor *sor = to_sor(output);

+	if (!root) {
+		sor->debugfs_files = NULL;
+		return 0;
+	}
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
 	if (!sor->debugfs_files)
--
2.32.0

