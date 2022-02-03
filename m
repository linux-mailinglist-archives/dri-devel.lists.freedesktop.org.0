Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4E4A811C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5210EB1F;
	Thu,  3 Feb 2022 09:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA210EA8A;
 Thu,  3 Feb 2022 09:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfc2V7FcxMZAajLraa8+m+IVC0H3xuMDOkDVG3niJht2wbMogZaOdPZSwdyjkGksC5v57RoxQroYse05C7EN9YnYiqepOSaTpCc9P6UN6u23qU7bbpB4HKJm3diGMY269dRWUb5/gpR9trRM1qV6+3Svkps9N0qDeZUW4AsBl+k/K6UjgV6tr1umT6qJ5YH177cFYhnQL5G1NF9wWNSeVgNlKhY0KXWpU0R4sv8VxGsmWI9lFFHsX2+/WUAa7URCAmfhWJtUlgV8XYNqPsmHXA+gSXmU2Ai567/AOm4m1nADSWKrdYq3CyAVE9Zbd7XexpdwZxwHs/V1a4Dx5PjgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbSH23+x+aKVw5ei0mnBhBlYj493VV2xdEqJZ+9D7Oo=;
 b=VnIMlCe8l2D51Ro685F7bPB4yif9122uCNXOvIYgCpwGpGYkF7zrrvg5ImmB4Ttqfi96H+Sncvq5/FRyPhYe5jn2x9kPLGOAzyjjgtyncnUWsmciqX1kVf1RdpR+PeWoNNuEygWE/qcVHFKQqDFZOXRBNKHoRnMn3v9hbiQ/HWqx6giHwg2AjRk0YxIXP9ZTt1jR5qCYg7sQoeO9+trmyLDGvmzySqDXLt0pdSR7YPEUlEvrympKY/38ZlIy99ItGtExQ/jNfM8s9N1Qx3RBLDqK05WOFhhj26dtMViiNf/Jqhs42jh1eHdAdcLyYQDEjHBcBeZldKvXOXOzA+1AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbSH23+x+aKVw5ei0mnBhBlYj493VV2xdEqJZ+9D7Oo=;
 b=LnM3fMwxgfDgRjg8AtGu3c4M6jFgMhtwDTliVg1zRRC5ZyXfur0NtiEX0J/qhHx7xwhcfeAQ0299rPkm2utcVqqRG8zpP8jk65Nv9B4iDFKGi44/SjHnMjYoKH1AGQVuvmASGzDMhAy45/M1ZcTnbNkT3Ow+o3BzNcvBWNq5r5s=
Received: from BN9PR03CA0370.namprd03.prod.outlook.com (2603:10b6:408:f7::15)
 by DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:44 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::2a) by BN9PR03CA0370.outlook.office365.com
 (2603:10b6:408:f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:44 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:41 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 17/24] drm/amdkfd: CRIU checkpoint and restore xnack mode
Date: Thu, 3 Feb 2022 04:09:11 -0500
Message-ID: <20220203090918.11520-18-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bddaf36e-75b3-4d87-211c-08d9e6f4eb2b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2779:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2779DA5242A1C05680649D8EFE289@DM6PR12MB2779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQemcNpHnzwAzpxFsj8Vk83JITANZP8NAGEIddWdjOUbugQFsvF9Ud/LfgoCBHhokWjW0hD5o7XJKh86pz7OcJLgI1kFBvBcNjo/S/zKj8n6T4W+eruYh91+oacJIqJ/9g4YkS+Ot5NiFgTnW8TVhOJinRBxh5h/2YBRvgCUrvgMEAs/J43WsTD7FnXWqdAk/nO9rQnxAPjEbiWsOr4Phnb3xzoNyovh5e0RZpigJPHKP5Mk+5TKKt/tfEwIxnlZosQg23VnRo7iUSUmDwzLuM9T9t9VbGucsG1yLhamqatAOThEDNRd1g9wg1kQD9sBcFpxynqDI3alvG0kCtpwklBdO5ZN/hFIrlh20VVKfWXq5i3FgvTVj0avzytQTVmN6Fe8suirA8XVAiu70B5P4xBtw7YZeS7ZJpfQWMlVmbpQCQ8iXpwhngUJzKzKU/iEpp6ArdfMdhb+lvBdmBS5W+2x4jonAuFuH3AWRhAiZgtdTjH9SnTP+1MfpKlBR0BAwK6MweqzTLfftIYDIASLpPlKskltOmOH9yPfxKEEhaip7MVt4wUfT2apJdRqddTPFNpmOjthqY75KxPDCwySRfbUCD/6p3a4HR+r2qqVXhpivrtDJyAwAKRD8EsV4jr0EIA6ktqn+yjkRjSjBEAQp5/fVUzZ6KB4uIKQ652wRmlzX86TXIoepnkMWU1NGp8XgdR3x0KxAellOEaWOaZQfQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(4326008)(8676002)(356005)(82310400004)(86362001)(70586007)(450100002)(70206006)(81166007)(5660300002)(6916009)(40460700003)(47076005)(2906002)(316002)(36860700001)(36756003)(508600001)(6666004)(83380400001)(44832011)(54906003)(2616005)(186003)(426003)(7696005)(26005)(336012)(1076003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:44.0891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bddaf36e-75b3-4d87-211c-08d9e6f4eb2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recoverable page faults are represented by the xnack mode setting inside
a kfd process and are used to represent the device page faults. For CR,
we don't consider negative values which are typically used for querying
the current xnack mode without modifying it.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index ab5107a3fe36..3ec44f71307d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1848,6 +1848,11 @@ static int criu_checkpoint_process(struct kfd_process *p,
 	memset(&process_priv, 0, sizeof(process_priv));
 
 	process_priv.version = KFD_CRIU_PRIV_VERSION;
+	/* For CR, we don't consider negative xnack mode which is used for
+	 * querying without changing it, here 0 simply means disabled and 1
+	 * means enabled so retry for finding a valid PTE.
+	 */
+	process_priv.xnack_mode = p->xnack_enabled ? 1 : 0;
 
 	ret = copy_to_user(user_priv_data + *priv_offset,
 				&process_priv, sizeof(process_priv));
@@ -2241,6 +2246,16 @@ static int criu_restore_process(struct kfd_process *p,
 		return -EINVAL;
 	}
 
+	pr_debug("Setting XNACK mode\n");
+	if (process_priv.xnack_mode && !kfd_process_xnack_mode(p, true)) {
+		pr_err("xnack mode cannot be set\n");
+		ret = -EPERM;
+		goto exit;
+	} else {
+		pr_debug("set xnack mode: %d\n", process_priv.xnack_mode);
+		p->xnack_enabled = process_priv.xnack_mode;
+	}
+
 exit:
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index df68c4274bd9..903ad4a263f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1056,6 +1056,7 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 
 struct kfd_criu_process_priv_data {
 	uint32_t version;
+	uint32_t xnack_mode;
 };
 
 struct kfd_criu_device_priv_data {
-- 
2.17.1

