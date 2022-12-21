Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDFA6537E4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 21:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B0C10E4AD;
	Wed, 21 Dec 2022 20:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7810E152;
 Wed, 21 Dec 2022 20:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9tIEdS1PLYQ8n9sL7C/aEZrgRuB1Qcp+/VNgHyC2MtZdPEMILjyouk83dc82vOVzzETPdjILXRir7tEa9XcEDNKXrT5hw4Cuk3Vpck7uyS7ojPCCjAv+6rgw6nR5PWtN+ksXL098JgTUbADgDbqNuxqIuYrEIB+rwy93okubtVLI00+CFOSb+AMliJC3g397Yd93GRCIjwe2yUhNI+EBxwjWY+aA+QgwCB+XHP5Po3DCGhpv/yHInuQ9H35MhFIrWOD0Zpzb5UspI4LkkT9gYRpo8ObyHuJrv0Pd8Sv0Gek9vHPfZi16LFzySC8gSIXbdFQiwnmfA8XeqN/79gGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lxxsN5iUE/VxhDFHg9bFk+ptlx/UnhhjXTVeFMegKI=;
 b=mOuMKzshMcN7qnj1HmphY9o+lPM+aS1xn7/G+rdrRawpUkvrluG7PsOILCNBdtRIrzmvw/1pIAUCcagBvie4wfa6pqr9YSavHKeEUe/JjWglO9Aq45gEdOcfthIlFnfE4d3y9k8Xs2670GPn3f+SZqzYFk3Q1aisQjIJseAjikk1fV+lPHN3buzGsFqSXuC6pdhKfEPwo3AU+DrTGazyw22Oyt8aJWKQrjDTywG1eb1KWdbxWm8KyF1255hIDrgVgnCKOuVRGpZZpw0eZq/2tAcSCN/DAeUI0PWOFW7QXy0ePU1gXf3Hq2Twme/PQfU2WmWX/ueGJ+dy6AR8y9gTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lxxsN5iUE/VxhDFHg9bFk+ptlx/UnhhjXTVeFMegKI=;
 b=N3HIQpMxNCSaN/8aqa3b0GmQSRiP83LFNNVbEN/nggiXJ6HEjpgz2rWG6L6Qrlgxl9JWB7RDrFbQgmZrMes/2gTaMTvNFgdQyE1cERH+5X1+qvvfKF8hLAFPsJrxTqDRIxbwHybnsapC+9xjrQRUGdAm9+fdOYIPpHDFUGtXB68=
Received: from DM6PR03CA0095.namprd03.prod.outlook.com (2603:10b6:5:333::28)
 by BL1PR12MB5900.namprd12.prod.outlook.com (2603:10b6:208:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 20:58:45 +0000
Received: from DS1PEPF0000E64A.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::e5) by DM6PR03CA0095.outlook.office365.com
 (2603:10b6:5:333::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Wed, 21 Dec 2022 20:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64A.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 21 Dec 2022 20:58:44 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 21 Dec
 2022 14:58:43 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.2
Date: Wed, 21 Dec 2022 15:58:28 -0500
Message-ID: <20221221205828.6093-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64A:EE_|BL1PR12MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 616c8b00-686b-427b-a59c-08dae39625f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJWxQUxwH6QhpmBwVFMtadpwigjssWvULZ2xJCjPIZ5bPhrupgUyGK8YxX3sZoGcn+7RtzEbsG8vudtMfM3B61JhRp7h0QnBfndi21Pv9U7zEZlOTkDvjGVDUVXpVviy2uAkTFOKLG5hyeHYBfdzSR+MEuF2xTLhS8zeThaOULOrLhn54zqGXmANLj/F0PB8FX1LfUY83Sawy1ruQJ1GtSeLQD828C1rn491E3Xr8o5q8eyDAqBQdSykVtPDKhbDcnkiaua8psbauSpDVHwzBqVI1C9cs/YQIGErqyKNzhn0/WlL11tzN/gFVjPF8ydt1Zh/SU+Um5JoTEP3/Ef/cO2zjwggIQ2vCT+LeKul6+4naIahwCtFoPCrbGsBcqE+ARgrnsS3GodwFs/uzpQzPQ4pNN1FBnW45Twbn9kdkO/PRY1bNyTgUvdKEkUpdZbSFDwHgdRTy0e4p1GtOeo1cd1UywJciEV5fUMZn4397yqNOW+HsUDMKZ4pO7yAt40ATDUw+3179lsjT1fWm5vZ4u/1tftjTu03mpkWN+gmsolFzYsPzSDMNnqmTyAAL9VwXQIg3V/qjh1UqumxAQ3Gv/FS9c1etl8lWFFr9XSBL9jntY11x6d7Oc37/RLeMkRIziTehZSTZlBGbm4VEDU7Co93y+Y3eNNSITUhI4xjJflqq9r5omAnzjgPxid74QWx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(36756003)(26005)(40460700003)(47076005)(966005)(478600001)(186003)(7696005)(70206006)(6666004)(70586007)(4326008)(5660300002)(41300700001)(2906002)(316002)(8936002)(110136005)(82310400005)(81166007)(426003)(356005)(336012)(82740400003)(1076003)(36860700001)(4001150100001)(2616005)(8676002)(16526019)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 20:58:44.6955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616c8b00-686b-427b-a59c-08dae39625f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E64A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5900
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

Fixes for 6.2.

The following changes since commit 38624d2c972e7692ca59d0d3b97741a3313addb3:

  Merge tag 'drm-intel-next-fixes-2022-12-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-12-20 15:43:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2022-12-21

for you to fetch changes up to c1c4a8b217213c1924eabf4f28385bbee9cc50c1:

  drm/amdgpu: grab extra fence reference for drm_sched_job_add_dependency (2022-12-21 15:34:03 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2022-12-21:

amdgpu:
- Avoid large variable on the stack
- S0ix fixes
- SMU 13.x fixes
- VCN fix
- Add missing fence reference

amdkfd:
- Fix init vm error handling
- Fix double release of compute pasid

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: skip MES for S0ix as well since it's part of GFX

Arnd Bergmann (1):
      drm/amd/pm: avoid large variable on kernel stack

Christian König (1):
      drm/amdgpu: grab extra fence reference for drm_sched_job_add_dependency

Evan Quan (2):
      drm/amd/pm: bump SMU13.0.0 driver_if header to version 0x34
      drm/amd/pm: correct the fan speed retrieving in PWM for some SMU13 asics

Philip Yang (2):
      drm/amdkfd: Fix kfd_process_device_init_vm error handling
      drm/amdkfd: Fix double release compute pasid

Saleemkhan Jamadar (1):
      drm/amdgpu: enable VCN DPG for GC IP v11.0.4

Tim Huang (1):
      drm/amdgpu: skip mes self test after s0i3 resume for MES IP v11.0

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 39 ++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 24 ++++++++-----
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  2 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 17 ++++++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 38 ++++++++++++++++-----
 12 files changed, 102 insertions(+), 36 deletions(-)
