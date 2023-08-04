Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD176F9F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1308B10E24E;
	Fri,  4 Aug 2023 06:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0487610E249;
 Fri,  4 Aug 2023 06:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfGJzQMEdhqhEXtGv5lZDhc7DTlrhVh0FLiMyuLKHk8PRxOz5lDCXyq/2a9ncc1f0xfKlqUC0gu0ALpgIoZL89QXd+q4J/sKgXfUPIdmnr0pOPesZb9awxpsDase6ba9/kIWLkTNrga8N8xdV+h82yleaOzH/gKM25jqDuoD6UzTpxy0jYFN3gwKKWrhll8csh+tHLZB0fJPY9hXMxOoalkbDfWkE8ycTqqGTFFyginge1OE5NL2IH3F+sJFOuVnkQe5+Vw4DA1ATDucsk0QDR16d1Zhf+yvSxidJk08QxLxvDwJld11uEpldX8bvrhGCvjL6OUtPIUiUHhHreNw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2bcSKrnn9Iyh7/KN7IFBu9Npu7/ZSAOtTD8Fsyy1wg=;
 b=IdjPG6d3obinS6dvoNo5MDVFhhZIFjIe+k1tVnBwKUzECfpqRCoJ9ZfZCcYpQbYt73lyTS9GvYC+Z2H9QsfhsBKzZA5+rbhtOd9ZXJhrvdIWz+Tyv+vEWWDObfTu62l5i7Vh+1qK4Z34Mx7NMeV35MMJABWMHQRpej5uimSqEPbLwKyyZXNRWpwqF4Bd7iwx9+/BQavFU30XUz3Y0fqhQV2BYmLrAbznCJirJCW17VMiRP48XiR2RHq+ft2TcgLohoi5CmPDg6v2I/ZcGbfTY4Nef1O8H4v/fucJWZEgfpQZ4ZWFGb/7fu+2FowOcR7wQPwVvdDJqKw18yZi6Sy3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2bcSKrnn9Iyh7/KN7IFBu9Npu7/ZSAOtTD8Fsyy1wg=;
 b=33+ZMz9Gnv1v7jKHoKbQdpFTflaWLcjydauz7qcNhWtM+i+9jpCUTyYVv572/YzYUzaSGAM/5kHabWyTaCr0qr9qIhicJt2gHMeZOShNKZ8voyD7qqNop/ZD2KeRqTVmvB1bNe1DGagayRUcScQdT3e2jo22aORy39s1/PgGO8E=
Received: from MW4PR04CA0153.namprd04.prod.outlook.com (2603:10b6:303:85::8)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 06:21:02 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::bd) by MW4PR04CA0153.outlook.office365.com
 (2603:10b6:303:85::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 06:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 06:21:01 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:21:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 23:21:00 -0700
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 01:20:56 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] Refactor and clean up codes of mst
Date: Fri, 4 Aug 2023 14:20:26 +0800
Message-ID: <20230804062029.5686-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|DM6PR12MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: bcef7ae1-893e-453f-b099-08db94b2f9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nH5kRCAzMwFbTRrIkBwXMVph6PBDVqKtxIECOLY+FqsOcPPnCqGcg8pNDkO/2pBoidySy9/SQkDNjmTukWFzInaihlxXZCMVEDOSUKq3P+kM1o/PjPTSef2gT3SME3s6ro2iNZMO/XMWOwSqwzHGDoY2+MclJBUG1Hc+bfC2A9MnPQoJlXkvXWCF1G6F534cO0URU+D1MrQuoGTl6WaR2JdJGkkG3GpZP6mlWttUOhQ2Je+F6ms0MAv7x5OrSxWPAtu1QKNHbSe7vKIgkE8mB+aVu5Thzxh5BJrvoJNKTRYBPyX095fhU40eVm6b5kemI54uEbTiLhWuibSdKeL1arUxBlm8QTMrnvXKNGKojbADhH5I4ymht0Arf3cjOIUyxi2dZTEMK/diYfJks42ySvUEl0VWPtQ/7WdLZ3hpXdISJgND0wYzCmo0MKUMUnp9rd9UJA9OmymXb6LNGX5HVM2biqQHJPfWgeSjCxOrjCJIAav9ED1qAGUjUIUB//i4WsuSZiXpRRe7m7dIrujSSyc+J2MqVUXm2/2o0Lds1lRcscPW34xXO3yWH5oA6qaOO2p8JEnEVTaI7mdl7kFaxgEHcqrGC5m/IVMlH2ZyxvGpMT1ukFfsycVXp8E6ENxGvIpmedA1Hlf9uNFi/o2GOe7YbNrJXVk0CI8othGsCFr7FZJIL/uiTXrHUDbpuOf5d3iybabvYZixXEAdddeDYhIY/7Zh4XF39zS/s6yRTMZMCB4sv0k5oC1HVyUyhSsDKAUVmzJkPKB8TlmlsJC1Gg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(82310400008)(1800799003)(451199021)(186006)(46966006)(36840700001)(40470700004)(40460700003)(86362001)(336012)(2906002)(1076003)(26005)(47076005)(2616005)(426003)(36756003)(83380400001)(40480700001)(316002)(4326008)(70206006)(8676002)(8936002)(41300700001)(7696005)(6666004)(70586007)(81166007)(478600001)(356005)(110136005)(54906003)(82740400003)(36860700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:21:01.8664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcef7ae1-893e-453f-b099-08db94b2f9db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is mainly trying to organize the mst code today a bit.
Like to clarify and organize the sequence of mst payload allocation and
removement.And also clean up some redundant codes today.

The main refactor one is the patch
"drm/mst: Refactor the flow for payload allocation/removement"
which is adding a new enum variable in stuct drm_dp_mst_atomic_payload
to represent the status of paylad alloction, and then handle the payload
accordingly. Besides, rename some drm mst fnctions to better express the
behind idea.

The other two patches are mainly to clean up unnecessary codes.

Wayne Lin (3):
  drm/mst: delete unnecessary case in drm_dp_add_payload_part2()
  drm/mst: Refactor the flow for payload allocation/removement
  drm/mst: adjust the function drm_dp_remove_payload_part2()

 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  60 +-----
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 189 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  13 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  11 +-
 include/drm/display/drm_dp_mst_helper.h       |  22 +-
 5 files changed, 158 insertions(+), 137 deletions(-)

-- 
2.37.3

