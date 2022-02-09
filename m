Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B44AE5DF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2010E359;
	Wed,  9 Feb 2022 00:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91310E2ED;
 Wed,  9 Feb 2022 00:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg8i9SlmyzT05D/pR45H0YScf6CDtr/uyuzvzU3qzcftKWHVKHxdRkQahEAgTUSPSGdQahz+0JLlmZmwEzEop10g5hdVB7OI46lkeM+9mAoieGbzqNgD81pVNb0EVzryUPzPL/FrvTF9qalHJecD/KciNnP/26IYcfpqfWWTBEGHy3gMnJHO9u/n01ja/VwHr+XLBiPKDWq5Yx5TibtTFgya5Mivk9lCAIXEtsPWYnAybZmFSjGuDx/nWlv5tPMLXgKCxd+z7HB6HCw937F6WbngZKRJr/Qi2nOoZNexpyoBtVvLzGgRRZtuIcZhRk1YVI3LCKlfb9TR4hIGijzotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO2Hhob9k+M78OUsKbTKF9Etdd5LOC8rzcwsn+iLqNo=;
 b=QsTtoFQQLT3bLg+au9JxbdpJ7xpWPs+sNRo3vzvysV1LLrYpT5w4urxVczHtXd5UoCpLE9+DZNDvUelGawA4DIFgKy6r3pRS4LCwqXdlmiXA3RISruSBOy1v/hfeFHzGNaooVr9pTlsuSRDE2C8jRdUph05PfWEMGwxCkcd+wL1fxTQqyFqPHYqQixC5D7BqO53LrGxCTgvdVndgrEeIBAJmdquAM31mxV/H77YDPGYrcsVzVH9uvGqczf3aD7rT2R9Ks5YrBPyyLgr34X7NWD7Mu1i9IxE3NA7BskgSe9dlwwTM6Mn4kJQTs3e7W45r1oNYYBZz5z4w/JfkQd0lRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO2Hhob9k+M78OUsKbTKF9Etdd5LOC8rzcwsn+iLqNo=;
 b=jyNveQGm6N3b6WCPc/H9Ob9PJq6d+p6eF+H/ADN1oHcj84Va6WHPUCD7nnWeQX8dHQsm/jqQbdDXFJ0DCi5E5yJqcgWKcG/rOik0OM8btfdG+cTwZ0NB83kLlJdVmZWvMLcLgLyAwnSqvHCQIi7UxeOsxZ1cjTi5OoTvYak3e0Q=
Received: from CO2PR05CA0108.namprd05.prod.outlook.com (2603:10b6:104:1::34)
 by BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 00:23:43 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::27) by CO2PR05CA0108.outlook.office365.com
 (2603:10b6:104:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:41 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 00/11] Define and use reset domain for GPU recovery in amdgpu
Date: Tue, 8 Feb 2022 19:23:09 -0500
Message-ID: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e50dc8-3221-4d54-1b39-08d9eb626d92
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB511079D9363A34A91874D8FFEA2E9@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggQaqSlkE7rRyTsU57RFWHa0cv2RFV2gh7Os0XSZUB72TMaD8pADp873KReaZry9o1WsRHPQpyz0N07ePWQ25w1wpucvJizL87RTAY/GmveORsZV3BwSQkSp2XokBGySP56W+7UOpQeexjZdL52yHfhJnjIe7zPA2VvrtrCnzN5tBitqgxN/S6XHljrJ7drjntwMIeWcPCI6eaF3xucOWMzC2ov+HY+xWQNblPjZQqQVfh4iv6fTHYeNjihujRHiA4mKpq2lppzaxx2xXENw77QTXBu7P4ukifN2nVeqc0EzKR5KsytutVowrAbakST1N1Rq65fTDUDNBd6KztVjoIw1iqzs2PvkC8iOGfyih8mFzc+aL7no8bZqCivIxCQi3+ID4h58UGAYfBjr0DL/sKAZVxHodLJrmjJvHCVaHrj8uDuc7QVY246nAUkcOBJSUNXUmHUTJwE6xrrr88Ip3m3B4Rpx/X7abq8L1Ft7zq8DxhY1jmFCvGB4COH8P+7HE7moP2snsFJsV9PakGdcvZhBUwhRzHdcqlFSG+zncvajT6aTnWielGkctpUT7CM7gFYHoQsyREUStCBLS0BxWcMR5h9DTxXgX4RPqGOR+d9ELzrSoRm9qAATbclOHmUkqX8srm0s9Jbg4vfSeOT3L4wab1Zo4fkHjC1AFNl7qRN43aHIK6BgFYR4mC8F2gi+eQ57b+9tXrd2ZnDS7TXEIct/kEX2IA39/YZw5b3ynrvhf0GoIH9WNsJgzE5767mwEOGC8ILUy2LqY5jxLCvSsOIJ89XCd2vOdZbVslitNvQEB5BrvPFLm5dy7qHK0W9yAqoIr1E5KUK91vFkODeDZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(426003)(86362001)(2616005)(81166007)(7696005)(16526019)(110136005)(1076003)(26005)(336012)(47076005)(186003)(82310400004)(356005)(36860700001)(36756003)(83380400001)(6666004)(8936002)(4326008)(5660300002)(8676002)(70206006)(70586007)(2906002)(44832011)(508600001)(966005)(40460700003)(316002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:42.5531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e50dc8-3221-4d54-1b39-08d9eb626d92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on earlier work by Boris[1] that allowed to have an
ordered workqueue at the driver level that will be used by the different
schedulers to queue their timeout work. On top of that I also serialized
any GPU reset we trigger from within amdgpu code to also go through the same
ordered wq and in this way simplify somewhat our GPU reset code so we don't need
to protect from concurrency by multiple GPU reset triggeres such as TDR on one
hand and sysfs trigger or RAS trigger on the other hand.

As advised by Christian and Daniel I defined a reset_domain struct such that
all the entities that go through reset together will be serialized one against
another. 

TDR triggered by multiple entities within the same domain due to the same reason will not
be triggered as the first such reset will cancel all the pending resets. This is
relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
those will still happen after the in flight resets finishes.

v2:
Add handling on SRIOV configuration, the reset notify coming from host 
and driver already trigger a work queue to handle the reset so drop this
intermediate wq and send directly to timeout wq. (Shaoyun)

v3:
Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain struct.
I followed his advise and also moved adev->reset_sem into same place. This
in turn caused to do some follow-up refactor of the original patches 
where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive because hive is destroyed and 
reconstructed for the case of reset the devices in the XGMI hive during probe for SRIOV See [2]
while we need the reset sem and gpu_reset flag to always be present. This was attained
by adding refcount to amdgpu_reset_domain so each device can safely point to it as long as
it needs.

v4:
Just bug fixing of reset_domain refcount on XGMI hive boot and some
cosmetic wrappers to reset domain refocunt.


[1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
[2] https://www.spinics.net/lists/amd-gfx/msg58836.html

P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.

P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.

Andrey Grodzovsky (11):
  drm/amdgpu: Introduce reset domain
  drm/amdgpu: Move scheduler init to after XGMI is ready
  drm/amdgpu: Serialize non TDR gpu recovery with TDRs
  drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
  drm/amdgpu: Drop hive->in_reset
  drm/amdgpu: Drop concurrent GPU reset protection for device
  drm/amdgpu: Rework reset domain to be refcounted.
  drm/amdgpu: Move reset sem into reset_domain
  drm/amdgpu: Move in_gpu_reset into reset_domain
  drm/amdgpu: Rework amdgpu_device_lock_adev
  Revert 'drm/amdgpu: annotate a false positive recursive locking'

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  34 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  43 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  37 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
 16 files changed, 335 insertions(+), 198 deletions(-)

-- 
2.25.1

