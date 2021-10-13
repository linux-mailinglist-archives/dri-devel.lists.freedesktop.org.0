Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A842C8D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B46EA59;
	Wed, 13 Oct 2021 18:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C46EA59;
 Wed, 13 Oct 2021 18:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUbU5IbZ1UCmXM6zvZl8Y/jEPQn5HeCTrdYMfkxq4kyB2wAq9n666XX+E++YlaQ3IQP+uHwEItar0TQVt8tyjIlgSO1yoSG722CCyTMVMsf6IOrwKuR2isomrcgA/UrkcxOVfYrzuuB5gyFgJZxqNmph2j9Ma4byuvEvsGhhhsb7PRVSsN4ow6t/Uvee4HbQkhxxYMOm73XqypQiMDcA1i15O3bSH8N4B4VPLKSqZdqrphC0Go6Y3An0ivJ3P8jrlniAG9j1iL07wvAx0QQLcQFJFZs9oy4AydHwcvZQ3TxhK8mvccSNNHtwBhFzDOe6MnSOpTxTBHbSE6rVmKZ9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PChPYKluv1+6J4BjNoAeGkFBOyp8sRIIzfHwgLlDEbY=;
 b=j8hR8cJHGxHBkF54+MZhyRdcyFDKfFtst+DsjKDurCoVoRF7S/s3F89/ckAesQpaz2mH/+xQuMWqG5nJiMlJqVsSjAi4tzQspmRya6I5vuPFQrZmlp+oDy9KgDDHhE/D07dHxbs9DamgOt/j7vici4fubjt8gX0PwbyaUwFoNHnddZ5x8SBnNPzWSLYAxSEo4lpeNs1EOQCTD2LjzyJ73PBfQGI7H78G+aQDBcAZOqQ8LfpqrFin9uSwv2Drei5lQoZNT651EmWfRDUDgJ8RmI2ymS7sO2+t6rNrZEvKEgLb0O2EN46WrpRZE7EJu55obQCfmwsupKU+Qhc+w2FuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PChPYKluv1+6J4BjNoAeGkFBOyp8sRIIzfHwgLlDEbY=;
 b=1rCnPFiRTlWRw8vKGE7lFkHz526Y2KmFVz0txoJIQh5oWq+b13K9EGjqkM7mv4EyNSNygngICccZGwyvAtPgpZa9DJkyc3hJbouxt2gErkIP9YZrv8m0s4xg5sJuCapGn9wJT69yufW0DgziXYkg8Six+WorOpsX3qOxHeYJlI8=
Received: from DM5PR16CA0044.namprd16.prod.outlook.com (2603:10b6:4:15::30) by
 BN7PR12MB2689.namprd12.prod.outlook.com (2603:10b6:408:29::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Wed, 13 Oct 2021 18:36:19 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::88) by DM5PR16CA0044.outlook.office365.com
 (2603:10b6:4:15::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Wed, 13 Oct 2021 18:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 18:36:19 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 13:36:16 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, "Lukas
 Wunner" <lukas@wunner.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
Date: Wed, 13 Oct 2021 20:36:01 +0200
Message-ID: <20211013183601.16514-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013183601.16514-1-nirmoy.das@amd.com>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177737aa-b870-4b48-7906-08d98e785931
X-MS-TrafficTypeDiagnostic: BN7PR12MB2689:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2689983E784485CEAC0B3B008BB79@BN7PR12MB2689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIOIGEBUHroLAI4JLveqWoL3I6XrUyFTU86sSJIO4mSEgX13viqDnyTjhaeuGAZquoIWjpepmenQgg57dgRIZ11N7DIY5WEdQmONswP+s8ZCBbZoBkvVG6yWeaKq3AVIyJnSSvZsc9FlKa4mBspX7hlydfXyLCfTdp7qXD5WL0Et6wfluMriZF5ddbwi1nkK8JVMN17qg145sd6pQoP3UzIY2oFXTHtfe3IUFKU0RyWR7kOMFLe4AwRqstfML588gWCuUnOnM0LeX15qEM8lfL4u7D4azSsY7OknDsGU4XWp5upbTm4GQSlCxihAoOaCscukUXHeo2+jWFbswFm1CPYh3ly7/UufhvXMZDfNbjmK0vu5NRb0JiH7BsmHyyTqjRF1bdPTk9blB8sy5bUZ86H+g4kBjNvCg7dc7+UG+x+TdmcTkQG6d+vlJUZFxo5+nqG0d+oD2t0a0cXDnIoqwwSLwsbqy3/s+rmlko2lxn4k4jZIGjBR71iovq9rggX6PjutOv0Rv22HHQNI2nB6lamZzjYI+w6gqyS8skjqnnIkZy2zMncdIJwXgpRINTvZtHnE6DoPSYCYhUXKGrw4EEDK/M6SP/dPTAQEMQ2mt5sLuVLMC1mue0/bAN2+c1td5BMxtm3PyEkzHNmECLaChl8qlM0O3yKb+aRVQM8DoyWF2ABF6FN/ycyVHOrDfMaf30ZGtw9wwM6hD3RcWxz/VhWhfGEAqKgrp8Rxb7arkfA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(1076003)(36756003)(47076005)(2616005)(6916009)(86362001)(426003)(5660300002)(186003)(83380400001)(8676002)(2906002)(81166007)(7696005)(316002)(4326008)(16526019)(44832011)(82310400003)(508600001)(6666004)(70586007)(356005)(8936002)(36860700001)(26005)(54906003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 18:36:19.2460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177737aa-b870-4b48-7906-08d98e785931
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2689
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
index 365e6ddbe90f..07ab8d85e899 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
 static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
 {
 	/* already initialised */
-	if (priv->debugfs_root)
+	if (priv->debugfs_root && !IS_ERR(priv->debugfs_root))
 		return;

 	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
--
2.32.0

