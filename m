Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC974659D4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5C6E488;
	Wed,  1 Dec 2021 23:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701A6E453;
 Wed,  1 Dec 2021 23:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8xdIalxlek3aWjBqjajTXMEkdqD3Y16vvkZN35/ey0+OWwAH92emV88wj6OaY12YuFsifWeEfmskU/z5VxDpyKUG2SwXvW6Ox45aoSmrqjzhypnI+b9ZrZNY+b7hrNNSDXIhmjZFUVhBFTme3t5g+kvpdE6mhv1ZS4KlFu1a3RtmKUDe8FibKLBIKmOzmtyYE7gup4SHmJUbVtGg9ztqZQWT1HcwTjOYr40Hy9MGVaQ0oIdbN4nO5z8h4Xrs/xcnsd84gpauTJSbhY2FI36nGhX0ee2oNiq1qfrwH9b0ogRNqW8xXsIfp4vxvnZE+/gSvfu+0QtO4EKzClPujtyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVULz9QYbpek/tmEdk46jO5i7zeTQEFMHhweybrVbQc=;
 b=bwOE3d74OcqNtTuPk2+7Qu+D1snAkTOBP1VWJ7l4/jDjRQHwrMcJ4xX3iMQDVbSiyHHPF+TvDaqQjgZB8uYzUou6Kp5XhUzR2lSmcsKn20Lmr9gzZSLCZc3tcD675Kbrkj2rsccdYIkBRDejEcqLtl++gBTtjaY4D07/cgJddb3XYK5cH8bO8lxf8fgN1VZ6ZqX2CLcPBqn86O1tRBRZOq0Kol7LtcxlBpFpUFXMIxWCCqVZll08YGw56CggjY9IKi+oqz8eH8mKLdyjykG/jXTapjfTQXXrCDFSiEspMG3+7R2lCwHpzBxEhZZboEl/y231doInFHfZGxGO937i7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVULz9QYbpek/tmEdk46jO5i7zeTQEFMHhweybrVbQc=;
 b=EEd6e2s9TDIiYbNr0Y9pSFIF1nV0v+p1nB0hXIPoKSViKqirhJRGVkNMvpWpDw2CGWLj+pzL7louuk/jBr9AT9zm+VxZvYjc1LSXYjIOci4fPrTKw8RUDbYTUH3snqBheAstHebEMNIQZkxVZu6lM+NUP9zY/cRdovmMRjuw7Ew=
Received: from BN6PR17CA0023.namprd17.prod.outlook.com (2603:10b6:404:65::33)
 by BYAPR12MB3191.namprd12.prod.outlook.com (2603:10b6:a03:133::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 23:28:35 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::2d) by BN6PR17CA0023.outlook.office365.com
 (2603:10b6:404:65::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Wed, 1 Dec 2021 23:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 23:28:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 17:28:32 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.16
Date: Wed, 1 Dec 2021 18:28:02 -0500
Message-ID: <20211201232802.5801-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f9b67a-fb41-4045-9bc6-08d9b5224b76
X-MS-TrafficTypeDiagnostic: BYAPR12MB3191:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31918BF78CE88BBC3BF8E07EF7689@BYAPR12MB3191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRTw6gfSwBWspBePNzuzfQA82Zcj/TBTygl9+lLVLNu+omlESiV+JP3CqYxH0vpNFfd0ygEyVf6bQFUXGJ1nTqahADyESqhuFezQkA/WklGOl3moj5IIdbcGpl+MfqAn0Fmt6DCENYng71tQL/K13S12AjXSWcQvW+96MZnfa9NpquBQZ+0aAAr93K2OMpongRVcozJbxoQ0KZ73TJhsMczxhp9qldLkTUU5fSH+n/fvDJvGEiLnkrFI66Wu+OumjnVniu2RxLEEBDumcpQjuWwE5ZUukSXykdAXdvmQRewIdlrP7aP1DN1uosAis7WkBV3FO4KSKEz0RHkN2hPzAowOoRSvX/tFN9GAOAVzRB7w3ZsjgJFK7LQHFKSSy3nL0uQfRhtwfy+akCGyE1LOnISd4XEpQIyVAmGawzDsPfJDSvQWgoRw6CtLQPSNr9/dyr6166gmE//+t+jX7tzhheXlD2rbVVL7oURvhHA1GJhDe40PmShmqiPpZln8WexnsOsuT8PKC9HuOp4L9k9HTOPb7JcTIh3/pOoYdzIQuhMFZ1U39sx3dc44RsuySG0XRVHMJ/84iAIre+RdxYZNzQmBvWJKpLviqNt0auNZdjsrT6l3Drc1UnClULA75PAKQoECdQX/LQ/qAFRPp0sSNhgUYTGymVyU1RK35ww9Yg3Eyb9ElaSExaWmKYDlErg+6LcV4X659RdB3FlOjun/2NFINNeodONkg6NFOGRl7L8h8f+1sk6zp+nFE7y9E5QuLIaYINMQNeyIEoQeHT1Y/loPmldYMVgJwt3pXflSjhE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(82310400004)(356005)(26005)(16526019)(110136005)(81166007)(966005)(316002)(40460700001)(508600001)(36756003)(186003)(4001150100001)(70586007)(47076005)(7696005)(8936002)(5660300002)(6666004)(36860700001)(86362001)(70206006)(1076003)(4326008)(8676002)(336012)(2906002)(2616005)(426003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 23:28:34.6871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f9b67a-fb41-4045-9bc6-08d9b5224b76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
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

Fixes for 5.16.

The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-12-01

for you to fetch changes up to 3abfe30d803e62cc75dec254eefab3b04d69219b:

  drm/amdkfd: process_info lock not needed for svm (2021-12-01 17:09:58 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-12-01:

amdgpu:
- IP discovery based enumeration fixes
- vkms fixes
- DSC fixes for DP MST
- Audio fix for hotplug with tiled displays
- Misc display fixes
- DP tunneling fix
- DP fix
- Aldebaran fix

amdkfd:
- Locking fix
- Static checker fix
- Fix double free

----------------------------------------------------------------
Flora Cui (2):
      drm/amdgpu: cancel the correct hrtimer on exit
      drm/amdgpu: check atomic flag to differeniate with legacy path

Guchun Chen (1):
      drm/amdgpu: fix the missed handling for SDMA2 and SDMA3

Jane Jian (1):
      drm/amdgpu/sriov/vcn: add new vcn ip revision check case for SIENNA_CICHLID

Jimmy Kizito (1):
      drm/amd/display: Add work around for tunneled MST.

Lijo Lazar (1):
      drm/amdgpu: Don't halt RLC on GFX suspend

Mustapha Ghaddar (1):
      drm/amd/display: Fix for the no Audio bug with Tiled Displays

Nicholas Kazlauskas (1):
      drm/amd/display: Allow DSC on supported MST branch devices

Perry Yuan (1):
      drm/amd/display: add connector type check for CRC source set

Philip Yang (3):
      drm/amdkfd: set "r = 0" explicitly before goto
      drm/amdkfd: fix double free mem structure
      drm/amdkfd: process_info lock not needed for svm

Shen, George (1):
      drm/amd/display: Clear DPCD lane settings after repeater training

shaoyunl (1):
      drm/amdgpu: adjust the kfd reset sequence in reset sriov function

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 16 +++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  7 ++++---
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 13 ++++--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  8 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 20 ++++++++++++++----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 16 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 24 +++++++++++++---------
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 ++-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  2 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  2 +-
 16 files changed, 90 insertions(+), 40 deletions(-)
