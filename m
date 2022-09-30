Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E205F144E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 23:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09E10EDAC;
	Fri, 30 Sep 2022 21:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B60910EDAC;
 Fri, 30 Sep 2022 21:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTT36xWL44r2Av9iKs52Cdb1lMuQBSDVtGUzPorTJm2vsok5bTHQnxuVO5k8Y1veyorGvWHbRp7RV30DCilCSxb5M+6XDIEPO+6bHYa1vFw+bVuaTMAwuVNidajsei9wcTA1t9MfC7kFhE3zwZRwXgvfJ4QHMluhoNUVWhp+SdUzdktSTK/JXwBf7fmq5ip4QSfIYG2jcy8UTDCBUiMZ0pCRsU5X8SBmHIwkFzL9Z244NDDHN7jD1ORlmZe8IxchDPPSslrSmPIlRb59X8IXAuNjNEL1Ua6J1/omUGQUfIw2moyzea7Md086YP23pWEPRx7cqcwgKUs4PKO5vEXO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQhvd6OWattytd2Xqu4QdsoZpGu4hioUp6JXf+gvZMc=;
 b=GLL5rfKwoTMwJwWI2LJSbQQLIxN4DetDxaXkUGqk7QklyzFCm166RlUW2Nwt21pFMPwphze+sRPKbm7j+WqRIQrHt0B83Xnvil8QZ+XeMWJJYX8H1MqIODuDc3y2HVDSjG3I2oVirG9rSujRzIDNZGKhG6acia/q3WHFyKUOko5bF9mGFIrGevf7sDm9S+U5dWQratr8Sig6EBObXhGzS+WT0yhV9mgexh7dWGlMX4N0g8SYDrL/o0usLj3RL/2ZkYx7pXHkGDCk0MDDn6djTzFH+53Tzqy+W1imLhH3rIkvE2QsvaBXuUOZ8BGpjX8+hgOS74tGlAIWBg6oMQ+SCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQhvd6OWattytd2Xqu4QdsoZpGu4hioUp6JXf+gvZMc=;
 b=zhb6BqNl/wfCD+WUl9vMmytSW6yPVAW81IOHywSTe+L5iKbimyRehuvHGFQJTgjWIacvEOgPiMOrwN0pG2pJL0XGdltK2UI5I+xT2mA8n7eSruI4mJ4lA8RPCQegPQzfKeNCimQc4JFkklyDqcVXhRG6wpTZm2IQZHpoe8IGggI=
Received: from DS7PR03CA0149.namprd03.prod.outlook.com (2603:10b6:5:3b4::34)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 21:05:08 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::43) by DS7PR03CA0149.outlook.office365.com
 (2603:10b6:5:3b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Fri, 30 Sep 2022 21:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 21:05:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 16:05:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Fri, 30 Sep 2022 17:04:54 -0400
Message-ID: <20220930210454.542719-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: cf866d81-eca7-4c8b-e6c0-08daa3277488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC41FFbcS2CFYxAzBLZ3cxT6zvsjY/PpQLHFE5slij8i1oZcbK9OUJ/0zEv99R8jR3nSb0lnzj0rll4BKDkddcEMq3ek49tNsbtc6SJcBVTBdJATpXmCs1ucbSMZuCEfomnh4VuoR4CkhaokI+DP/RS7K6ZO3/4bUvZ4EaBAdURtmLv7pkhNkLM5kq2a2HHOUrvNahwjH199u5ragGd6T3LddKTUJZEJCiYRbkVROPw85crBLWRf/Iky+FnybIBL7AwUmoDUodIf6eHcOR0ZsNjbsC4poNu1nhT0+HMp9DQgqwi7u/zwlcEb2MOtgFS4la0se/8UkCcR87QCD9e1G23/ATA0ByQWiZMMgEImGSBQuDn4IC2HQ2R1qo+ifQZa895OLzpQBYR/M8yLrY7t1mCVP4B4Qat5qdajf2LAGqUloS1LWkhK1iEp8NKLxsU8vi2xamSESQ9yIQQUIDMgcijBKYdSan+1cdYBpPe0PGQ295fd54x2oWAlOm4tESjf6W6zAQOXnvgqRjJUXHgkg+rr/bBEv3W+LNVUxjd7XeK5LNw+l/hfoIRn45gniqTO59EkcJEY6d+NK6qB/MuCF3x2XO9DqT+kQPaMSMnmCu4lGPS+RgLVZFlpph84+seNhPDKUjH4eb7VdhNsOGyPkEo3Gf0G2Khs7X77AQ/k0qmvOvooCn9sFYmtApCcOg907Akee5pjnJJZ+XXXpULIkxX1JdTWEl9rt4i+mnoPoh8867XjMpWXcqvqny503s/v
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(66899015)(966005)(110136005)(316002)(478600001)(70586007)(70206006)(8676002)(4326008)(5660300002)(86362001)(40480700001)(26005)(7696005)(336012)(186003)(1076003)(16526019)(2616005)(36756003)(2906002)(6666004)(41300700001)(36860700001)(47076005)(426003)(82740400003)(8936002)(40460700003)(82310400005)(83380400001)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 21:05:07.9590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf866d81-eca7-4c8b-e6c0-08daa3277488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Sorry, some last minute changes to deal with updated firmwares/bioses and
board revisions containing new IPs added in this cycle.  It required
pulling in some cleanup patches for the RLC firmware handing, but they
are only applied to GC 11 in this case.  I figured that would be cleaner
then a bunch of local fixes that would cause merge conflicts for -next,
and time was getting short for 6.0. They are only applied to GC 11, so no
chance of regression on existing asics.

V2: fixed S-O-Bs.

The following changes since commit 83ca5fb40e758e0a0257bf4e3a1148dd52c6d0f2:

  drm/amd/display: Prevent OTG shutdown during PSR SU (2022-09-29 10:07:42 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-30-1

for you to fetch changes up to 0fd85e89b5bf18447e56099a010ee5be5dc9f2b0:

  drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode (2022-09-30 16:59:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-30-1:

amdgpu:
- VCN 4.x fixes
- RLC fixes for GC 11.x

----------------------------------------------------------------
Hawking Zhang (8):
      drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
      drm/amdgpu: add helper to init rlc fw in header v2_0
      drm/amdgpu: add helper to init rlc fw in header v2_1
      drm/amdgpu: add helper to init rlc fw in header v2_2
      drm/amdgpu: add helper to init rlc fw in header v2_3
      drm/amdgpu: add helper to init rlc fw in header v2_4
      drm/amdgpu: add helper to init rlc firmware
      drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode

Sonny Jiang (2):
      drm/amdgpu: Enable VCN DPG for GC11_0_1
      drm/amdgpu: Enable sram on vcn_4_0_2

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c   | 264 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 151 +----------------
 drivers/gpu/drm/amd/amdgpu/soc21.c        |   1 +
 7 files changed, 281 insertions(+), 149 deletions(-)
