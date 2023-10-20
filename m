Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711507D0620
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 03:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5B910E571;
	Fri, 20 Oct 2023 01:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79EE10E570;
 Fri, 20 Oct 2023 01:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOTbr89B6Yvyz2Wi5CVjNrKZ+hTqJvDvWuHrqtqXgWurvA3nCFW4fGMlADe+xZ6yL7UD/AVoQ4wqI7nrHGAEs3Vd0iS0Udq5upXI2T+M89wL+cwvdMOCjMtKzEWhj9/d3I3jwgSFVFQS43qWeWLoo9m9RUCIUkqS6su0JeSi6sl+cheD0NYhEDKxeEhYFil7KGGBm6MxKvtp0wIda/xeeMAzwGL2ybwM2Zp0oJcwqG3l+FU6DxDk/JxnD9xQ11yblDHg8S9G7BhSpgu72Dbv2fLvPyRAtqUbm0ZxQZy9+HUJghl1mx4iOgOlZsBL5jf9WH5cVh97l8hKsMeFXGg5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4TQvXR7Pnyk8swD95PZMujgWUe4pWq89A6ncVZbwjk=;
 b=dFQUx4S2VZVIAUFsjZUEcIkUhfWg4y/yPLQoXeR3vMDBY++QeMla57+FoIXxeudiQneC3WQTzEmAnpli+RDr8xgDxwSu0zRoswWRZmxMef3KxOXOnQzHJYpfkJKgxcAWyVEYd9qI72hqOMttrDPY1W9pAJtd36ZBW0WvQ1MOfQ6HgnuRLqGnplETAnbo7lgGdczG7BSlO4WeNSryv3CFo8rQawo0ftVAl5xIhxsGKg5PaL9LC8kZ3A0XDm+AGbMfB0zr+7jZAvKt3+XQL2bDVHw9LmM9IOf7NSR+of89xUXJ/i+Hd1XluAmQ2bzBxiX8TEyJE9uC3kNtaqjivgI3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4TQvXR7Pnyk8swD95PZMujgWUe4pWq89A6ncVZbwjk=;
 b=kmxr/OFxY9hs1l2gzCWOhGdWrzb8vpbGUcrjT98Lp8+taBK+VHBmGARxHOY8EWsKLOmOYJ5ATebwTwCN2nBkcy4ByOXQw2yyWVkKFXWHkPtrA+S7vJN7shi7Fl/qORtxkrvj2TRWnnchSU6Ns6T4CSWUQD4MWBWFaghfdLtAyE8=
Received: from BL1PR13CA0073.namprd13.prod.outlook.com (2603:10b6:208:2b8::18)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 20 Oct
 2023 01:24:32 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::71) by BL1PR13CA0073.outlook.office365.com
 (2603:10b6:208:2b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.7 via Frontend
 Transport; Fri, 20 Oct 2023 01:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 01:24:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 20:24:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.6
Date: Thu, 19 Oct 2023 21:24:17 -0400
Message-ID: <20231020012417.4876-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: bae43cc5-4c8b-484e-eeaf-08dbd10b4f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XFpAwyKEODmMijkkfbiMn2mK7GZMTGoTaqUV2NtC4zDxYNtwLjrt4yQpc7z9TltPXE10iIpADLMK72sxWGhtvXTDhyYaesrgcp70fYwyAre31KTJo0TM1Mj3BTFq9Jg8BFwlpys21rqN4ehc+6Qo01zuQGMVu+5jm0DBkKvirlbH9EULI6qMtP3JdzI9nrQ7asNsJ35J7Upxm0kYOHAsBDvx3YBn1b2qdyrJuQEoLurbM2nkZazRg36Qygy/y2U8A0aJCPvKbw2TzXF0vG3O8EOFEf8Zx9TVRuojFRftGjBdNSF2ZQPsUVWaz0UFjylTiEyTn7h2olEcKj3cdIsqGcMMjkOdfkxkBQGQvPDMi8iPKdR7OCmBSDqFOGRAF+HsI3sFItAgIRauWg5FGQt/bhu47DA+B6ShCzDiD0Xju1iJa9MLHUMl1DzQHuDLcxxqSLfItCq6b5vM8KAWbdM36SyRGha34wmT4PP2RkOVSA5FRT7SaDDaBUwL/mHBz/gkSm3Gli42OrCPA3VR4GjKmuPGVRf1tlk3r2DfkE1W8r0Gv14GRarzE+HXbvlsUclzEsjIYybiWfT9C9QeZIGZo9DUt8DorPXbu5aBjNkDB7DmHYj92+l9ZHVm2cO1W34VGMrle0Kqe4NJnvTaf+oYC6SOyWXekHwK0lcJddcOphHVMuc4oa/+BQ3AsrUy+bwoAjLMx3ceTERlUtHM5a45RyIlQu/bUPO7DTHaM9crhQrWa624BbdRdfytDd8RBBP
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(2906002)(36756003)(4001150100001)(40460700003)(41300700001)(4744005)(316002)(110136005)(70206006)(70586007)(4326008)(8676002)(5660300002)(8936002)(356005)(1076003)(26005)(82740400003)(336012)(2616005)(86362001)(426003)(83380400001)(36860700001)(16526019)(47076005)(478600001)(7696005)(966005)(81166007)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:24:30.7508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae43cc5-4c8b-484e-eeaf-08dbd10b4f44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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

Fixes for 6.6.

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-10-19

for you to fetch changes up to 316baf09d355aec1179981b6dfe28eba50c5ee5b:

  drm/amdgpu: Reserve fences for VM update (2023-10-19 18:56:57 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-10-19:

amdgpu:
- Fix possible NULL pointer dereference
- Avoid possible BUG_ON in GPUVM updates

----------------------------------------------------------------
Felix Kuehling (2):
      drm/amdgpu: Fix possible null pointer dereference
      drm/amdgpu: Reserve fences for VM update

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 5 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)
