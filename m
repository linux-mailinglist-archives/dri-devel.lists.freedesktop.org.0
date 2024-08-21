Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3C95A3DF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 19:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC0A10E68D;
	Wed, 21 Aug 2024 17:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q7qH8Z7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1E010E690;
 Wed, 21 Aug 2024 17:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYRMtxPBnnFStZ50qiNr+kgS9Csxyq4BNIvS3treX+5/4DDP0S36oSPS2hT2FrrwkUQaqAqLUMDuZz9eFc93CGGDKGIA0OkCxMKMPqE3Gg1MMnOnR/TBHwiEaE0SG537zcRh5KduBpVe3GvnNzr4b9My+VCCwMD0q1sepiU5N+Byrp2/tZ55rn1THlo0yMAhJsAaDc9ZlwIvHSbjlHMvpsIZUFv8Tv9ZfxbahBPpgkLWLaKNRNNvrN8kCTgZWB9s2p9FRbmNgztWLf+Nu0HipGqIsl6XWkLTRfMjgh0k9flfjLvAZ87fBEnHWzmR45dAKhV6qHCipnRcg49l6Pbrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/YZ3VVmtvb6KUCnR64cJCjwZJ0pDo4AKCJVQrTTel0=;
 b=uOLTHPCJ4QpTF/BGE4xoWWnkYEOxKNDmI9l98Rq8O8iTNbProwVmhKlyj/KbeRLiPeNJLtABGRL6HEOxZnWAy81cGNyzxBUSpJDVEE7PTajW8YI6j4Tkdr0h3YitIe1jY2NmFgpERyzLQgF8Jdb4Kr6sHGrrP76q+/+O32JGeKAisGhoY12sXsSgZsJgcZodMCjiIOP84RZTXXvdmro8mwVrhbe7wu8xseiKCqFxhnSoQm8K2G7XPtpM687d9ByCE+sadDEGpd69ED84e4ZGFud2BmIJE33W1EUTVMg0J9pfqiidneU2FLQ31Fsrw0FhXTNFgvDQ8rAu2QJeAM3VMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/YZ3VVmtvb6KUCnR64cJCjwZJ0pDo4AKCJVQrTTel0=;
 b=q7qH8Z7KUQSsdyO/kPpo4fiHD/42mlVU9jxfGaP2SHX0rg+31OBboWFN8kKwqvdgUvAYfIsq11lG17dn/kj0HlgOEMTUl+8RVMvEQ/qHF/tej8o4b8oStdme9ORlYw2shYGa2Q6k1S2fLb/fzB0b9+2H3UXG4u+Tr/SM5GjWpL4=
Received: from CH0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:610:e6::33)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 21 Aug
 2024 17:28:28 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::a8) by CH0PR03CA0298.outlook.office365.com
 (2603:10b6:610:e6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 17:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 17:28:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 12:28:26 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Wed, 21 Aug 2024 13:28:10 -0400
Message-ID: <20240821172810.302416-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a98a21c-0c2f-4e54-e68c-08dcc206ab4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7UwRiskx9OoocZ8cx7lopdOzqMYILOrSC9u+YsuUtS8JhYnHm+Z8yRQU5xye?=
 =?us-ascii?Q?qg0tO16P/aqE/YIfiMWHnCfIGFn/eLoKuy5Y3VB5saYMUomF3bKXQCFm52R/?=
 =?us-ascii?Q?x1CuifHkWZxWAmwRnosavVU+USY+ztdfRvf3jh20pkaMjC9jVdd2Pj6oIKy+?=
 =?us-ascii?Q?R8dY9CtMlqE904mDj2zNo6DKanpm/mkPyyckp3G4izVtdSG9NCxIO8kWJafy?=
 =?us-ascii?Q?Yfx2NycD4CjNMVgPY03QebEGnS36u452WF56DmqzPG5hG6ngf1pgXm/v89dG?=
 =?us-ascii?Q?d+T8z8QXzPsc9MEtmp6fVgObAO51qlypUCleAln70Rg8VvXV92w18q6kGKgK?=
 =?us-ascii?Q?EE7y8QNuXrL0p4hhOGxETbOiOsNom9vEaR4K2LL0KDS2HazB00bREmJiOglM?=
 =?us-ascii?Q?JXGu1qTubgOHKO7g5Ja32WqYPBZc0C+cA3cJl6qOmelBOI4jQYb4Q9ry2DXM?=
 =?us-ascii?Q?2rPTP58Vo4cRYO0HUfsO+EZ87d3RphkNAGA3xIY+rbuE3z6fCU2t4b8F85QP?=
 =?us-ascii?Q?a/PRzS6bAfyjukuDSUFxryMVRMaJKZSx/Mysk7vx57VUv7YYqth6xdnSVxlC?=
 =?us-ascii?Q?wQ50xS7Nw4RzDNuVE158Yk0iJr7HfzdUr2VTaQ4bAl5tufFSA2otWBGR2GKu?=
 =?us-ascii?Q?/fCKjT79QZdXs6i4hfGl9LgWwl1WBkQOjnHcxq/BL+R8PucVb6inHVyItlNI?=
 =?us-ascii?Q?uow4fUR/Ow1+QwqWhuNjqwpfoAEbFh4YwtkhEU7di0fISTRSFdV4lssa84EC?=
 =?us-ascii?Q?sw96EC0XKlr8ZRvCfX+POrxALBvV/rLhyIWThOWgQX0X7/+R2C0Kay2ymBqN?=
 =?us-ascii?Q?oxzOAMw7aAT0zup33qGYI8Ay5HG68h/+84fC2uypTkYnJ9iOSmHK03FFkOrp?=
 =?us-ascii?Q?zc55Pj7FaF7o75u8DDTVbeLRPRAl8I2hvNO1zTy011qjqXz11nwfgkDG7hPV?=
 =?us-ascii?Q?P4GcFHWr6XwEXwXOxU2X5cUTEIYHJQGbnLdahPf9fCXOvuXqgk98hpUEwUAn?=
 =?us-ascii?Q?KCrfga3kTJe1NCEKNjywl8QPDlq/iG+tC/336zAzF3/VfkjrUOUoAp3rWm7s?=
 =?us-ascii?Q?QhPDmbEaqWi3JRXNv7Jj7EvuL6dPCEXepkXx0LN+yd6YiJplgdPxpUc1QAkx?=
 =?us-ascii?Q?PRg4LcsLa33QO8HiN281ZSvOVE3b81RaIWhWOQiDr4DrUUll/Tab6fFoUMew?=
 =?us-ascii?Q?zgT+LStV5frwMmTVszqtNA8FVFbnrL0gLO+5ITJkHPsogLAXCWbW0n5Cge1y?=
 =?us-ascii?Q?/GhS0Qt2HLLfGYYxaPRglHcpyytt5SraExhBThKxHPUQR3/iY7siXH5iqB/b?=
 =?us-ascii?Q?ZZYBorCPALxwMtPBQsRz8KaGDiOfkzVJhcbxjWBjJKjnhtvcHxwflayty+IL?=
 =?us-ascii?Q?mlvBvzp/Z9W/TFVdUwJZalW26aribz4cVdTrTQ4EzPmnLytKeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:28:27.7141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a98a21c-0c2f-4e54-e68c-08dcc206ab4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

Hi Dave, Sima,

Fixes for 6.11.

The following changes since commit fee9d135e2fd5963a7f466cd1ef2060731a1ab29:

  Merge tag 'mediatek-drm-fixes-20240805' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-fixes (2024-08-16 13:16:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-08-21

for you to fetch changes up to 9cead81eff635e3b3cbce51b40228f3bdc6f2b8c:

  drm/amdgpu: fix eGPU hotplug regression (2024-08-20 23:07:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-08-21:

amdgpu:
- GFX10 firmware loading fix
- SDMA 5.2 fix
- Debugfs parameter validation fix
- eGPU hotplug fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1
      drm/amdgpu: fix eGPU hotplug regression

Candice Li (1):
      drm/amdgpu: Validate TA binary size

Yang Wang (1):
      drm/amdgpu: fixing rlc firmware loading failure issue

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c    |  3 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        | 18 ++++++++++--------
 4 files changed, 17 insertions(+), 11 deletions(-)
