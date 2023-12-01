Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A508017D2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9001D10E993;
	Fri,  1 Dec 2023 23:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839DF10E091;
 Fri,  1 Dec 2023 23:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhbrJy82AOGTRVJ8IQmY73dWgMKOyYOXIvkC0yGNr8Ff51+Zmmk3teQtSodHTI2+PCtoM20sDlC0RuPLcGkcvLiL0xo9LzPf0nQy48Af8kOfer/BhebltRArvFvo7BhdwRJT0M1bWIsi8JgR+W4TcL8Lp/V+eYYaxbelFEXFoX+Oz0nyd8diUb30ehJtN9aj6Rngqy5YyfZEc539lMSs6qPvyBjm3ekf3P/P6SPG8rdQGeiUixclY92qkzK33FZLxKnIIUkjBOvLzBSWuFKAUJHkONy+vOfUVqEiYsS/+t1SBiUuGogtRf3+wMfn8CQNCmqjcfZGeGTVSMVTo8oQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq1H8WCJuAL37SctBUPuPK3Kqv6ruPc+2YmbD5MHcdI=;
 b=VxCfwEwC9ASAJzOIBVBW+XnuIdblmZJxCkVkAMIAobhQ8klUopeq6tjjxZOw0mz80DXSh8IjXoWsv/ra3VGLA4qMCleSZnEjq5UaduVVQIzJezJkSs5whgdHM0CqniCQzypXtimxgqI6QcfFWWHhf5192N+Mg2/r/P4zR9p8mZ95gxvzxjloAbuxP2trMWnxDcANATH6h++WlyiVFcUNFYHAuTOqmLCUPGSyDFvhATaIeiFXm8eLYFju+H95GeBfNOMkU+8uuECFhSH4n2/PpEt1ZnADLxzBwi3+9Cj//YMK2A0Hh0td8CFinStLpReQMCINm2B5dGgNnjRiU7MMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq1H8WCJuAL37SctBUPuPK3Kqv6ruPc+2YmbD5MHcdI=;
 b=nQtDCLhd1LHY/k2SYVaxxBT40QrdMpjt7i95HuXZ/vMWsoN1Dvo3GF+eaKZdxezxRp8dHqgpl7rsp+efJ6eFSCr8vJAC1IH9FkEP8qj+EGX1yKnVvyL5ZRUL+BqI5AgaFXiYtpu6ey6S2l5jY5lwmPfOD8VB6GXcx/kn1HSQ8eM=
Received: from BLAPR03CA0100.namprd03.prod.outlook.com (2603:10b6:208:32a::15)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 23:36:07 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::69) by BLAPR03CA0100.outlook.office365.com
 (2603:10b6:208:32a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27 via Frontend
 Transport; Fri, 1 Dec 2023 23:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 23:36:07 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 17:36:06 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdkfd: Bump KFD ioctl version
Date: Fri, 1 Dec 2023 18:34:38 -0500
Message-ID: <20231201233438.1709981-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 1379b0b8-bcd6-4e42-e371-08dbf2c64a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/DzbpfPqu8MAvm05IrbnlDNzHJDr6e4XnN/UDd77oJ0nMO8Lb9+dG4Uy7z47mbbB5EeCJSmn+g7pOVt3+No2Mqte59tk1OK0SgDDQ+5c1SX3FocITZEOSobD8sYpALMcLreKWg6HaeV3VNC8KnsB8KcQU1byhig0Sx6GdaYM3BLLWP5ABO9dfI/T6CGKrKBT1sRA5a6JQs2hcMD4v7oberEktSRkz1lplkofAg4hf++khdehoqelTOMPs8ytDwHKV+PMir4SW8mPHT1QVk668VU4Fa3dnWKscygsHvZM6BtlCZAJ4WYrIvLYg4ULt/84LPIy+B+s/0G/5rIJOpPH78vPSO8qdV4pTFFtRv2dDh2Fyy+u/PD+LcH3uvi3Y8E2n3SwdLKFFThLu/FI00lPKcEee1ArcrapV887O00U7zOebyEK1xEuqyf9sobbsRzVufofQfy65IK9tu+Tswotk1pKZc7JR5MNYcoqSjLn68uVAcOgiRcufbt2iATAGTIwrKlpyguj8TFWEiQDflJH+cjPU3q/T7KWMlcFkYxTgwpn0X5/tszxvbPxRCGMLK0GKiizb1Grubhe3hU9uYRLQZBeutEZfuSFlGCecX14yTBscNr/XfIIXMgTiOA560o7ifHygGUNZh3KXs1Agebure0w2I1X1RBPGWfkWQ6fc2REnZRt0Z994YFONoXFtpTDTl9pV5wfEQRf+0XFIhyWu+6IgI1nDXJVYvwkVrDuySStD30et4v80VI9WSo7CPIeXcG8EqUhV45NNleii10PA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(36840700001)(40470700004)(46966006)(40460700003)(83380400001)(86362001)(26005)(1076003)(6666004)(7696005)(2616005)(47076005)(36860700001)(41300700001)(426003)(110136005)(5660300002)(8936002)(336012)(8676002)(478600001)(4744005)(450100002)(16526019)(2906002)(316002)(81166007)(70586007)(70206006)(356005)(36756003)(82740400003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:36:07.0323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1379b0b8-bcd6-4e42-e371-08dbf2c64a85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075
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

This is not strictly a change in the IOCTL API. This version bump is meant
to indicate to user mode the presence of a number of changes and fixes
that enable the management of VA mappings in compute VMs using the GEM_VA
ioctl for DMABufs exported from KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index f0ed68974c54..9ce46edc62a5 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -40,9 +40,10 @@
  * - 1.12 - Add DMA buf export ioctl
  * - 1.13 - Add debugger API
  * - 1.14 - Update kfd_event_data
+ * - 1.15 - Enable managing mappings in compute VMs with GEM_VA ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 14
+#define KFD_IOCTL_MINOR_VERSION 15
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.34.1

