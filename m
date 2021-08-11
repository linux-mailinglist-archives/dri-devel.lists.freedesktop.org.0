Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD413E9864
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 21:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926438920E;
	Wed, 11 Aug 2021 19:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C926E1A5;
 Wed, 11 Aug 2021 19:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPrmBlV9ZBcK/HBtAqDDhpPjDx32UsCDayAxVwOQycdWBzWwUjghnL2eICAX9ExTMad16lTXJ1RozSd/cCLo2yyTm1l/cnEg2e9lHXafy87kyIYs10SwaOV3SIbg+cFr3aXr9BPRjXrXqeEKCVYsgYUas/qjpvzBumfeJnCFEAdDoYvWbNIs/wZSEn+zTf0We+eDK2qdwmbowhkd2yfd+kFuSk88jm73MejgaviTDw26CJQXZX8jBYPDolO5QS6WFIL8zq98MsddG652mUs5jr4365R6YRNpD3RfcGUg0WVxG0W3oeN8XvvZl7H1Am7QIt99YjXwUJyqAx299AoPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl7KFKZV1zkmSYKbw/elQVg5fNcQ/vB8Vy9kpruRA6I=;
 b=WnJZwX4hEj8r+TcuVpFfPdhN0GwzmI4Dm0IbMjb/A2w5i597ozWZ3w6JVncuKESvqibdEz8cwu7eaaa3AeP41Ibv5/CShrVcdMOsWeTF2gO9biEcdStTVZIAOD26vqYgO2STRyfVJlRv3WXjAQZh94Bt0BbEVLUyCyuwwotG5p/GfWhqglVvHgIaQ7AOz7PyHUpU2oYgnIlTktx0wlMzksv//3kPM3LOJcjs5E5N3J+3qtfuoG4TRgSeFH0oqx4pczWQSyCPC7oHUhSdS56jfUi8sRQGZUPclUUwaV09cgs3cWUMTjsm/RG1fUTfm0FlhamBlJO5YpsncLGl2MhWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl7KFKZV1zkmSYKbw/elQVg5fNcQ/vB8Vy9kpruRA6I=;
 b=0RYmr9vUcUHSbu9+0tedDg3s929DY0Xcm3jF5tpJnqIAAfEFVpzTQhrVa9kc38dsFU/U4EGM6bSZR3XsO7sxrOfJK+4xgN7w4dp6Qm03TF8Rkuedd20HepuNjF2aGcEXCa5bC0O1oG8T2rbwcmN2C47YTxPCQlJDfx/GIcmDqbM=
Received: from BN6PR18CA0010.namprd18.prod.outlook.com (2603:10b6:404:121::20)
 by BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 19:11:14 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::74) by BN6PR18CA0010.outlook.office365.com
 (2603:10b6:404:121::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 19:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 19:11:14 +0000
Received: from RErrabolDevMach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 14:11:12 -0500
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Subject: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
Date: Wed, 11 Aug 2021 14:11:04 -0500
Message-ID: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55842ebe-cec1-4948-db34-08d95cfbc9bc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5110BCAE331E09650F5EF470E3F89@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/nnSI6gMEnjkYpGnzL061/YMhdap1XM/eE8UXPPsvkLBx4q0mnjGY6sGQzvllXIi/rRwg2erFfsJC1OM9ES7v/yzvlo4sHLTi+d7qUwV7tKaMVPdyBRivS60dglhSwifccCHoKzqVlTMCShH9c4uyKej++YWsaQDfB9EfJTwcfsH32t4eRTVPE3PxTJDDqQlC8efPDhQ5ulJIMBYxMxZ2K0i7xthkHhpvb31yAgzQtCEcUQM0jzKMX8AQFrOpVGzjEolnfe/UcrQMapVUu6zrtT0Sm+CD0BPTzZAdRRxH6IXpQwzR+8xK8BqhdEiCjRD0ggL3XtOuPWdbsxKHIkKQVU4cyiCgf52aNIyib/uQWGmXKZ1Raif/l4qmODuYw6OLoayRDHqts5QoY4iSgrnbgz+ddu0kWvt+5w73BC0qFShPDHBT6Sn+lT/rmJwOXYzizst61NXDbIh5/Mmu/WV6NQ9Rek0Cgg8IvlQImZjI6kFNYFFGttNNL86IUXLv4iMl7jaCkElVDMGAZbWujHBMyQw//QwoOyWLH3HaF/x+XKy56dVQlT4lq2CH/J/QA9NSqAxWE4P0Z283bbKyrl9bJREHkq5mcZodmKubDNJoRr5bl0JqJcgF2s9U6KzFqOWqXBqn/JrIZ4ciaQu1AmeeRZ36Rs5cVzFADNJI93S/+TU8U5SWSUxC1FF0zjDslTc9GAUunLfaMm3/jJmOGwC+Nv7BsRsgM/lMHvEWqhbceqG4Bha1UjY+MnMOCLjY57WdKRuVpHCxIQVGEqz2Bcmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(86362001)(16526019)(2906002)(82740400003)(6666004)(7696005)(478600001)(316002)(8936002)(186003)(34020700004)(2616005)(26005)(8676002)(47076005)(336012)(70206006)(70586007)(36756003)(4326008)(36860700001)(5660300002)(1076003)(356005)(110136005)(81166007)(426003)(82310400003)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 19:11:14.0340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55842ebe-cec1-4948-db34-08d95cfbc9bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
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

Current implementation will disallow P2P DMA if the participating
devices belong to different root complexes. Implementation allows
this default behavior to be overridden for whitelisted devices. The
patch adds an AMD host bridge to be whitelisted

Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 drivers/pci/p2pdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 196382630363..7003bb9faf23 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -305,6 +305,8 @@ static const struct pci_p2pdma_whitelist_entry {
 	{PCI_VENDOR_ID_INTEL,	0x2032, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2033, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2020, 0},
+	/* AMD Host Bridge Devices */
+	{PCI_VENDOR_ID_AMD,	0x1480, 0},
 	{}
 };
 
-- 
2.31.1

