Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B97718A0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 04:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA1310E1AF;
	Mon,  7 Aug 2023 02:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B7410E1AD;
 Mon,  7 Aug 2023 02:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxACa75TaHuPTXRDlKKwYdPFX+Wp8iTULKJClaBRr+w7twcWbERmyg5RrtKPnWJtwQnr1dF9ZY4T4NmZc0uuQxU+pzNIezYvY2Nvps7bawlqliYXrDu+wfj1cndSiHCCWh0/r5ELfiGeWU1xX5hT5HshlvVfbUW1QDc9fhKszSvba+jfs/gnI0HEEzy/A4nVPK7G/q+BSRIDZZXWU6Jg/U0rX5Cfz7uUdnO50uyCKMGOs1GHeiNHZQdtizDVTLcSecJJZiZozhfhN8C54U4Y6ajLTZO7uyZXbYVeczsNZertAN2bCEV7kajFk7xmmS6GlrM+jcR6qcBjp2XQPJ7Eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCI/X+iTk8qNchmVB2W6HWC6WXOUjqfC+5JxFXgjn0A=;
 b=OBjLSDa10FCrh8wqo/3ymVagQps//+kb6mVqS+FCvetiPTgfKWmhgqc3s6O8Vd5HisxiscMVghfA8sG/xEc5ycw3g94ZtP5Tio0NxHL8vMtk8I5sfE4URZPFVan2bMMc6VlK7thzgB8WbMbdEIhYmYifbokksYlRcRdLQ+JEKvrg2ajzZ/vJOpP8cVXdMEZU2GI9Cjh9vz9J1n5bxQ9Q5RJM1MkCUBAWJtgm+VM9iYBVqnQVpv+ip0fgBFLUtROw5Qg+Hb+K2hkKRSMoe01GJ5L7KK5+0zQZTrf/cmJoQNaoham4VF6doVXvxPkwJ9K6fHHLNkn8+g1NIDT8eFLD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCI/X+iTk8qNchmVB2W6HWC6WXOUjqfC+5JxFXgjn0A=;
 b=nGFPGfNjeXqUEbEjX70d81XRL+I9A3DN0cpEwM6dZ3MD3EzVfitTbxWfv3SlBR+xf62IpF4P913OcF1aMsa0fspH/8GgTbqABULRoapAqyQrwpNnD1Z1RvJ1IMWzTk3zFS16haxUHLLYAcfr+mqJA0SE2ZBcLLahXvA7jX8r6qs=
Received: from MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::6) by
 CH0PR12MB5386.namprd12.prod.outlook.com (2603:10b6:610:d5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.26; Mon, 7 Aug 2023 02:56:49 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::9b) by MW4P221CA0001.outlook.office365.com
 (2603:10b6:303:8b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 02:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Mon, 7 Aug 2023 02:56:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 6 Aug
 2023 21:56:47 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 6 Aug 2023 21:56:44 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [Patch v2 0/3] Refactor and clean up codes of mst
Date: Mon, 7 Aug 2023 10:56:36 +0800
Message-ID: <20230807025639.1612361-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CH0PR12MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 0412997e-e8ae-4f97-a97f-08db96f1f1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPqk8M2x1gAxK7vZFEdj2HWPF3koi85jCioG/23lA2fLH6GErNgX6c/vXosB9/iZKuswIDzQaDFfjpfxWTJLZZkPw/cV7osgLLWWne7rmG1vQGVeAACmj63XAkIS4DmHUKnPUWbRtGBYhSl5pZWMPAZA7RkRCyaRcMRakbyg6lYaqCu7Dgwhkg7r/18GKDVzeWZqr6Hh3VgKhcHzycz3KlQqjn0WBjSugqdUOF7sIO7+E6zrXc0ePDI6JdOoWa7pN4j5dxnUh3TqDJzzu8Cfte9DROjeI9/PqaUJGae2kwsS6fa2sOrxxh5jI4ZZfJsPFowXO2xBb0J4Ofa9wuZ66VY2KSIhCx8WyqqBj3A0riM13FBL18DCBuY3dbB9S1+4zI8Bk2pRYa32NlJGXI/BDHOc2vohQjsPj6Aj0X8wsTVm/icUHuLWSDp8WL9vnkmd5dGD5Xe+LIetgtha55UKcs6B6rni8mg2iZh4fdseKLTnRimEh7Lx/giuAmJGLMuur9HbSw0FYCnVT2k+iiiTeCtbhAKS3TlUHost4P/1ZTxzjUhQbF8PdhSL7Vs6H4uXgrblL6cUY1CHoFAlLXMXJCdbY94Drco79QwsW1WMITamg/KhGFAx4t6lm4hB9PsCH/QfgFAFnLzLot4nTNXCtX9u0VuwZRkyZIeOPm3mcRdq+zL7/ff3p6++ZMMDCXK1mW6hC2BeYlqD3wTpXivHamA4TfMFY3MTD56PfLUjWAARGit2b7GyrU507iNThG3SanLp0jQ1NijAfRCA8k7qHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(82310400008)(451199021)(1800799003)(186006)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(86362001)(83380400001)(81166007)(356005)(82740400003)(40460700003)(40480700001)(7696005)(6666004)(1076003)(336012)(26005)(41300700001)(70206006)(316002)(4326008)(478600001)(110136005)(54906003)(2906002)(5660300002)(426003)(2616005)(47076005)(8936002)(8676002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 02:56:48.9460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0412997e-e8ae-4f97-a97f-08db96f1f1c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5386
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
accordingly. Besides, rename some drm mst functions to better express the
behind idea.

The other two patches are mainly to clean up unnecessary codes.

Changes since v1:
* Remove the set but not use variable 'old_payload' in function
  'nv50_msto_prepare'. Catched by kernel test robot <lkp@intel.com>

Wayne Lin (3):
  drm/mst: delete unnecessary case in drm_dp_add_payload_part2()
  drm/mst: Refactor the flow for payload allocation/removement
  drm/mst: adjust the function drm_dp_remove_payload_part2()

 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  60 +-----
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 189 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  13 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  17 +-
 include/drm/display/drm_dp_mst_helper.h       |  22 +-
 5 files changed, 159 insertions(+), 142 deletions(-)

-- 
2.37.3

