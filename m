Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0963A902C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 05:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4D6E4B3;
	Wed, 16 Jun 2021 03:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6686E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:55:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysy37rkt1EXduDWE02CQrVYPU6z4fOEtbjp4dn1ekHEBJXbhnGRHDUZffd5CDx+MHq7QzCrR9twN+/J8MLdZreYGGprSRbztC7VBCXyY53PfWFmVC+dxeCZbebgPeG9pfXxpoK2S1hyu9J661i+9zFJKfJNhUXG/1fXs3AKAk9HcZGclMGh8dL2sv4UZejfV6YGZ5I9JrK8dweT54kEeHeC48u79BA+vI0gu37uZv8BASz3BKEVMz72HP16hgLUpL2j6a2fDsgJ2d/BVibZcMSJSmO05DrTA0+lJUxMcFcS528A6eeQ8xcgdZ6MPH0r6MGr5tKqX+kiPNVYEyFzj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toc5PGQjJtPhvUZ8lT1ObYZUqpuMeM79s0z7X8uvFo0=;
 b=SnBtCZe57EakssPPBN16srB1oFhBxne9DM3U4/LnHMjZZh0BgtJV38s3iejuJRJRNSruIW9AVOCUy34++C20AZhJEbptY7g/8JPPWmWrozTPFf5WqJKPVDKIotuSz56FMbYTwumPwJmkRbceI7tinW7Rm6Yir4zMzZAlb3es7/ouraIl4XItgzzISbmV6TIQCgd64WZI3E1j1OSe8J2a7Pkx3BM/6U+7EDN2d8dIrqlvXPWyMgyAZBWLGHLs9PR3sAVzmLisurJEiOJwg3Lsrqqdn6vf4Nocf9iJv98tUiAdxjJHUwrx68tYcosXHwiT7huyGQRuJvaHCr4bdayPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toc5PGQjJtPhvUZ8lT1ObYZUqpuMeM79s0z7X8uvFo0=;
 b=nXL0nYj6GwEOsPBChJ12do2LLu5uFGJoUyOkJB/kWXWqrsmE4weK38+xqF/B+pIzIPbqIw3ouAyzDtWzOD7l/iIoQvIK3QdynwLdjW1xdwIleeSEPNuSIydAtPWpzhVSP8N/lIh4/IezTsfv6xSI1I8f95dZfcWVp2m0gmdPals=
Received: from MWHPR20CA0032.namprd20.prod.outlook.com (2603:10b6:300:ed::18)
 by BL0PR12MB2563.namprd12.prod.outlook.com (2603:10b6:207:4b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 03:55:48 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::1) by MWHPR20CA0032.outlook.office365.com
 (2603:10b6:300:ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Wed, 16 Jun 2021 03:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 03:55:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 15 Jun
 2021 22:55:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 15 Jun
 2021 20:55:46 -0700
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Tue, 15 Jun 2021 22:55:44 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] Fix observed mst problems with StarTech hub
Date: Wed, 16 Jun 2021 11:54:59 +0800
Message-ID: <20210616035501.3776-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4f828d-d626-4d87-1567-08d9307aa011
X-MS-TrafficTypeDiagnostic: BL0PR12MB2563:
X-Microsoft-Antispam-PRVS: <BL0PR12MB256389C412919C375069A7BDFC0F9@BL0PR12MB2563.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDOoJj668V+UE8//fK2XV9azUrSOWh1sDviJocjKlNHxXhTsdBpJ8qK9TfE6Wrrvsdy0YfcVxWNs+VRqNgXcxITq+P0HISmK+2Xekbm1072KS+ReS41iyCTIpL6ZeIKV4O0Zmj6F7AmPPjxx0RYSI/ZYGRNFcR+YJtxcV0cKs6W+xSbuPSY/f6NM0MFmN1/dzkYDJ9uvonYfowkvJEFCHn+2NzzvlvzTyhrh14UWaxui2zqUYeK8G3i+Z6XTWblsiv4Na7N/4HIBoFwR5+spi15/j8hZTBVAlOBvDEenisnGopCpsjv5BXSBkvfdasm8IUD8E38q2pSqE6540QmBeW28PzCsYmQWpSs0t6TPkNbheJxzhbvI+TSXCY2ObarFapUpA6XqjeI4fFT2UyQKWyOzMKYVb4WCQqhWVvekIHgMXE7k0v97b7zYoB3d3SA0q1+IWV6TSRAXX6hHuvUixJjkITcsxrSN57owwMaK4/D3ir8yDUfZc2UygsurzhdKwfSWk0wV1sbJYN1GfGb3OXaGFF9uWA5wxRXZpJpuQ5t5klIP3+6asfgWhc8HGSjeTXrJz8DH/v0lK9OQKSxOeJYRyZkkPeuEm+l4HgqcfYwvTl6ZSu0DP/h25A/Nk2ocJXJN/RrIX2QBuxIDsta22wbCmZ2tSoukHFLCORkuFhHsHfYOrPQQM4RiZese5N0k
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(81166007)(5660300002)(70586007)(70206006)(1076003)(54906003)(4744005)(82740400003)(36756003)(6916009)(83380400001)(2906002)(86362001)(316002)(356005)(2616005)(426003)(47076005)(8936002)(36860700001)(82310400003)(8676002)(6666004)(336012)(26005)(4326008)(478600001)(186003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 03:55:47.7624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4f828d-d626-4d87-1567-08d9307aa011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2563
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
Cc: jerry.zuo@amd.com, aurabindo.pillai@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use Startech 1to3 DP hub to do some mst hotplug tests and find some
light up issues.

1. ACT polling timeout:
   Which is due to we didn't update DPCD payload table but still try
   to send ACT and polling for "ACT Handled" bit
2. Not all monitors light up:
   Due to we wrongly set unavailable VCP ID for new streams

Changes since v1:
* Add appropriate tags: Fixes & Cc
* Change debug macro to use drm_dbg_kms() instead

Wayne Lin (2):
  drm/dp_mst: Do not set proposed vcpi directly
  drm/dp_mst: Avoid to mess up payload table by ports in stale topology

 drivers/gpu/drm/drm_dp_mst_topology.c | 65 ++++++++++++++++-----------
 1 file changed, 39 insertions(+), 26 deletions(-)

-- 
2.17.1

