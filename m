Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6E429745
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 21:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98326E94A;
	Mon, 11 Oct 2021 19:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA426E94B;
 Mon, 11 Oct 2021 19:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em/OUhISLEejfw47cW2Y4pRmA2uxbJUmygrhqk9vDa0au/E8pgO1K3RhCYYH3PwOzILVcIHLatQVfX2mlmEEoNp2MaJvQ+d7gqCnx2lvmTgsV7TGPoHbLpHJDX15NvuqZxxE+LlM7onFgzWsEv59fNnf83zl3vclxYS0rvIg6NuWYqBmfm/7KSV9nYoYdowLTDOK+j1XADi6FRJD2M4UR5J7hTSYy8QMo19QK9vSmxWVsuA5yEvEUm4rSUybIsqZGjAUDtJzUAp2xRGWpaUAoYbhD3AYefaK1jSeZJ859QE5WhRMbGbJPD2FmkS7zyl0zmMneIzQ/UENrpIi3xUFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4HdPZCjumm9oelccI9dnuSZ4Ye025zhV4VIlx2eUyE=;
 b=Fi8jRrZDafeWTFhX7Yx9swFEgedKFGq8FWM6ax6ClnAuchSaEK1kfgdpbCHaC9ZiOJpsFLNIgtiIMc+SRfak8kwlv7X5Uf5/NuD443W7Lip02nBHNKAJMJkMyfCTGUNFxhKDSd9dTKdwQC/HyNDk9vb3dzX58FHLg7NZsi6cgeBliYJwUKfWZY9FRbZYHjaM8l/eLNQZN75xTG+bJV6rA32sLwS25Lod1iBBkUXmGOTs0xSeo5wZbh0Qz+wrlIaAhpGR+g5DMJ0O13NfqXSYfmAfF2LLAeeubES+rbPdwt4ah3ktGzSKFwzuQk1bPzm5gnUUYql9P56Gc065nuwJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4HdPZCjumm9oelccI9dnuSZ4Ye025zhV4VIlx2eUyE=;
 b=Mmbuw/iWCCc9iwJD9a+sOXq8OMzZpCWk+cnczhdgFKa7QHZtqQ4WQUI33LLAGH0AFhC1TE1mdgdDwzs2YZcqXs5K5aMFBYoPW7YG/JvzuCbmWq34LBaELs98y2bpxbV809aGGXd3wy6rQy/tISL5u3YrB1WTEoU5f/C3+53dR/Y=
Received: from DM5PR15CA0062.namprd15.prod.outlook.com (2603:10b6:3:ae::24) by
 BN6PR12MB1476.namprd12.prod.outlook.com (2603:10b6:405:11::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Mon, 11 Oct 2021 19:06:34 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::dd) by DM5PR15CA0062.outlook.office365.com
 (2603:10b6:3:ae::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 19:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 19:06:33 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 14:06:29 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, "Lukas
 Wunner" <lukas@wunner.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
Date: Mon, 11 Oct 2021 21:06:07 +0200
Message-ID: <20211011190607.104618-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211011190607.104618-1-nirmoy.das@amd.com>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fa6e686-b3ae-4672-76ac-08d98cea3e0a
X-MS-TrafficTypeDiagnostic: BN6PR12MB1476:
X-Microsoft-Antispam-PRVS: <BN6PR12MB147600371FD9301BBE7AB1908BB59@BN6PR12MB1476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDiE2j57aUlmMCiwGHEFEcPbR9dUPKGa3M94DsV/qVkDf86GPzFQbM4xpIV3a/QiA9RnJSBl7dd84t2LbLaXpYq8cT0i0b3TWH+VTJyQo+W9ov+LQ/8qOMSb6mQEAv+fLtqEYgiygT0L09sLfEAAkv5uXk5XOSZ3yWc/mC/vE+TdmXn/6vMLY5EcdOJCFck4/w0vTGSpyluit9NA0Pqi1VhrK6lRMJXKjG6IGH/F/ixR20NZax10Tz65QKLwkrrPziUSIw/E/2O/40GhdIc3X0WYhLANknpZGFcskDke2LiFmX0NcjPpBw8Q34922ArFvc7iSe1EmtZzRPvIdn8roI+wSzmR2ziAwT5B+efKEnIqo/Bau6h4hnJ3iyeyiKR64KLiBQTMUuB/e/6AzZ6ypTfM4KyRc8mzpNASU/nXv8Kmm4xOL/RhMqnaVYC6+S0HVQEJxdaOxDJCKYNRE/LbvHrQfJtYJ5LFrfXj/CH+Fsoa0SWV/vb7MXYNzliOySlyEzJpCP6tMyA+5vRS1qKuEAmfBxW1IS59oJxbZL5cIi9WoKvr6NC3Bmzlegmt4r+nS0A/6HInYw6zeE6arfkSIc9yjt3On9fb0fKmsfYVFcluwe0DSn0Gqbkn/eARtxIPvI6BKukPbwHn51o+/hP1H7676h2yi5S/omk3Sn8eEuMetFjNdiF2lYWrQK0iCrpCAL4ydqcGUdmjzwA2bUGA3Z0PMkXIe87czT/odTXYxgs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(316002)(508600001)(4326008)(336012)(81166007)(6666004)(186003)(70206006)(356005)(7696005)(1076003)(36860700001)(2906002)(70586007)(8936002)(26005)(47076005)(83380400001)(82310400003)(6916009)(5660300002)(36756003)(2616005)(8676002)(16526019)(86362001)(426003)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 19:06:33.9935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa6e686-b3ae-4672-76ac-08d98cea3e0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1476
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

Debugfs APIs returns encoded error on failure so use
debugfs_lookup() instead of checking for NULL.

CC: Lukas Wunner <lukas@wunner.de>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 365e6ddbe90f..a331525f0b32 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
 static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
 {
 	/* already initialised */
-	if (priv->debugfs_root)
+	if (debugfs_lookup("vgaswitcheroo", NULL))
 		return;

 	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
--
2.32.0

