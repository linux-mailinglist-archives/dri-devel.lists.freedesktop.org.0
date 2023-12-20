Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64281A594
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 17:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B7B10E5CF;
	Wed, 20 Dec 2023 16:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E80010E1EF;
 Wed, 20 Dec 2023 16:49:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkqwenoKyK0HYwp6V6BaR9wB7CxvgbF0dp36LetL/nkcbCrOkMQw12HYhIFlKx5Ih4OURYrZUvSpdBlM7s0wZOqdIZKTt5ogbagGu0tQPLArU/igxzDBEFHhuqH8f3MxKSk5c1UQVgZLpUFZTMhdGcY/9a8WCWsNhqWwNGKPpEqch9H/uOtI8VaPwjz9UJG8wWunXOCv+73ix+tqtFMyK0qNzoUftqPa5vcelx/QEa3TxVpc0zUnWAIFOb1aGVoqm6WLQl9NntrjXtcTx+bk/3nK1ILpVKPgK0p3CjYbaFFY+bpXL4Gy7WoqdO7g3ZJNaXs3OrXZExpErK6HJOtlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+45DMbE6WxFTyzrpc7EMSCnlZUYKsD50v1MWBSnvS4=;
 b=m1+FnufwCbEtiSIsNPEI8Iw4+oBBHUkjFZJyzsP50qxUHa1tIe0R4sHKs8A8DgbQf7yyIYtkE1mlsfmvr7dHBwQ5d4+4MaeOJhn+izPsbgxkgbeLrj4Y0BKgeGfVUfiJhB/btWl7SSm2S8WxhWC8f6N97vLcbHFycATVQ7lRe4iGVSKO9pwAgxS3kKDMZ7QIVZ+gQKBUnNMUl0JCe1ti3KiqBrIc0w4Akf4eFUTpLW+eDLHSMzKdSwM8kOT7GG4RMY1sZiddFKFIVMm/ag5BF6jOHNtNid+fNQZROU4lS96DzgcCctYDlxXKDqnGCFHwX36d3j4WLWxC6nYiB3uI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+45DMbE6WxFTyzrpc7EMSCnlZUYKsD50v1MWBSnvS4=;
 b=IGiUtVffpw7TK5v47BZcoGkozEijylkvn3UfUv2mDUVaXjn4YJkT+49XtJNOrq3xPLHPj+gKsVSb2A4Bf+ESvUs+xlV/KxEk8kXFK4G2i+xc3uFjU/dlD/Dt/lnroDnKZqQ+AQXrl7FttRgUeYAM8hGmvz6amLw6ijEK7ACHLP4=
Received: from BL1PR13CA0126.namprd13.prod.outlook.com (2603:10b6:208:2bb::11)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 16:49:01 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::1a) by BL1PR13CA0126.outlook.office365.com
 (2603:10b6:208:2bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:49:01 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:48:59 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.7
Date: Wed, 20 Dec 2023 11:48:45 -0500
Message-ID: <20231220164845.4975-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7deb5309-16e1-4724-a0dc-08dc017b9154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzU5VtEyzAGboM98fN1jB3C89h8JFvwW4tomAusjoG3gkDIDuhPlZmXUtv5OI8x6s+5BeLFHV7+1/KeXui72y4aKl1ZcnjinYuitSSePkW4xOly65krjVQGjbZWcVE3y3TLlMfv1+f2oc92jZu1yXfcwn42QI7KtbZ08pTkG2tumyZkoltzsQBstABvLzuB3i/mKyXlrxuZv5JOhWH6XrF8gaLzdOb11EFABdMtAXwyiiiymHbmEsmHtvmklUEMxfs4yL8gG/XhdyKg0aCmZqLoKQjLLEjQ8QKjPQJ0aLCxLDIbMnQRkK1hJrL1WEbYaBXQXNHxspFO9XjaOYrJF+dW55DtuKwKecbrMffq8akJKXmpZsXlOIl0dzYBrK89x4xGORVxjxnab2gzx6NaFIg5UVLb6FMGzjuCz30ASsPOpuWYzkQKtUghdbbEUzcvmTQxKDuqYCI5VhHMkmqTMcicB0nrYbwWutneA6eqj1xXMuzRT9YQbJJsi/tMERM9YxOMzEPbQBgzu5F+cw52NWMEOj55nINsvlw24ZgAv2iMRwEvkxTiErZl1GCkxiqYLBQvfVJWCt22RdmhirPViIKdQ3p+JMCOLW6uYBtWTznc30J4jKCjyODallPcD0CPg6l1CnvceujpVEhCRxrketvA9XTWgM4fEKTPxjmdJPMcOxEEnMcTrdkc4yvL7IGMoMyic6eZJ3XriMqVZNMFH2Yu2XCLPmgQWjwje+jHi50t7TrDU4huvgZNvm4OBaJYX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40480700001)(86362001)(2906002)(6666004)(8676002)(4326008)(8936002)(4001150100001)(110136005)(356005)(5660300002)(70586007)(70206006)(81166007)(316002)(36860700001)(40460700003)(82740400003)(478600001)(966005)(1076003)(41300700001)(2616005)(16526019)(36756003)(83380400001)(26005)(47076005)(336012)(7696005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:49:01.0146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7deb5309-16e1-4724-a0dc-08dc017b9154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

Hi Dave, Sima,

A few holiday fixes for 6.7.

The following changes since commit ceb6a6f023fd3e8b07761ed900352ef574010bcb:

  Linux 6.7-rc6 (2023-12-17 15:19:28 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2023-12-20

for you to fetch changes up to 4a0057afa35872a5f2e65576785844688dd9fa5e:

  drm/amdgpu: re-create idle bo's PTE during VM state machine reset (2023-12-19 15:28:10 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.7-2023-12-20:

amdgpu:
- DCN 3.5 fixes
- DCN 3.2 SubVP fix
- GPUVM fix

amdkfd:
- SVM fix for APUs

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Revert " drm/amd/display: Use channel_width = 2 for vram table 3.0"

Charlene Liu (1):
      drm/amd/display: get dprefclk ss info from integration info table

Hamza Mahfooz (1):
      drm/amd/display: disable FPO and SubVP for older DMUB versions on DCN32x

Josip Pavic (1):
      drm/amd/display: dereference variable before checking for zero

Philip Yang (1):
      drm/amdkfd: svm range always mapped flag not working on APU

Wayne Lin (1):
      drm/amd/display: Add case for dcn35 to support usb4 dmub hpd event

ZhenGuo Yin (1):
      drm/amdgpu: re-create idle bo's PTE during VM state machine reset

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 18 ++++++++++-----
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 27 ++++++++++++----------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 26 ++++++++++++++-------
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  6 +++++
 .../amd/display/include/grph_object_ctrl_defs.h    |  2 ++
 7 files changed, 55 insertions(+), 27 deletions(-)
