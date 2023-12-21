Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5981B301
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 11:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3C10E32F;
	Thu, 21 Dec 2023 10:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0ED10E32F;
 Thu, 21 Dec 2023 10:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0Ew2dtPc6oQhx3eoWAqf8xS+o/P51fetzU5kg6vzv7t7UkWPiFnmB1j03D4bpUeyRbrwvyYFj0qCCy/fxBhJzFExLja+jpMYQiW85jWBTuLUSK64lbJXLx1Ex/ffBIrrZc0SPnL621G72UnPeQkfGPzzdtx0r26GiAABvMgHR8cGZR8PC29mZjFfIhfaodH8o4nCMp6V+tcs292HQrS3SpaHNRNd89WqRnQ0maS72NlF/r0n/J5rbEZG2+edlNK02NJauyj4g0vS2IG2D5HUieV4fUSRvfHYb6/IY9wuODXjZDy1J36lhbb42byV0ipsvlNO/BZWUayezsgyVTJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIqUW4wHlwuRx/2Dx9D0HbGlKskmFLu/rdd8JsqSDDs=;
 b=H68cHQQkCov2oOJiQmTpx66K+a210mScsnT1noJrghaTDeqhhs1Vn+573LRO1oDzDBJikfaRbDuNor/2GHV1Wvj9uZ+d9iXN72V5QOlSGZieaskYKRzl4kMTylP1MXuCCqodQdiOQj5lS+F/VuNtdf+UYkZL/FyrtmQSItpg7HUkYWeGlMuDwX8fRKUbaXfAOVmUaDCQnAdu2IPSnS73GCc8sAJp9xtbK5+yac5aei3wYs1C5geMlyOboXrb3FpvXN0RtMszHXmuB2WNfToZ9Y0Y1J87AFujDwHM7LH87qOjZfyC+vHTsdtwPdsLb3w6rD0bitd0nr2QQd4Nyq0NrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIqUW4wHlwuRx/2Dx9D0HbGlKskmFLu/rdd8JsqSDDs=;
 b=z/ryT7sPSUO0qwEFyXZqhKPGBi00EHlymTyfoL0nbsaaLxIlZ/Ui2b+/eXmWPOXw0fHhHxdxWZtAkLjXZv59vaO2kjMGGCgbnSeQcfhDXWTZyr46wZup3QMwb2SjHLtye1v/mpyE9A4aLjb5JJn42/azZ3w82D3VxarjYBrpOMA=
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 10:01:12 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::22) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 10:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 10:01:11 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 04:00:45 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH v2 0/1]  Implementation of resource_query_layout
Date: Thu, 21 Dec 2023 18:00:15 +0800
Message-ID: <20231221100016.4022353-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: f21830e3-4559-4470-e980-08dc020bc2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PywOhVOVcwjMNVb3y3nXMhFDc/0kzY80NASvX0DG0LmxQetXCP7S7v35WNG8CZa2+vimDBy7tJNLXDkXp12WPiGJBjdSISz7anAVPEP7XQoZNpIzeNkS+eAp4YdXQQo+F4nkhLU741QtCykWQRjcAqpzARq5k94KbTeaq6DJ/Lkl7JyIRXHpAyF/UhlaaQIfdPe1qIDW6ZniSxzhX1FiMNFvjuQq77dVhysnOGB0SnQuJ1uXRwrDmTr76bv8GEs1OAeIuPHYi6p3oyjPRqcMBSiXd41JG2LM4DBdcHo/MGTTiM2uEsXkZ+Qua1DOrXu8ymeZsZjr6ITW38jBIHnzsVtpVD3ERwEef94i7welivNeyb8783DCPTB8RvM/RFJjEESFPLHmTjaxfO1OcEeaGhfcbOmgA9bhmXAwBb2UJTkAz38jqsUDk2VnjSMa6SUMS4LV1nY221rHrVcPf1LRzpfDQ5tI8kEo55S2wvFJRksxoOoyIOGjDcFyQjSL0PG9/aMCZiPuZMU7hNERfCiLXqSJsBGalHwyD0HkDSN54CbIGUbdyK15rxwNx+qNnwV1f5w5UMgACJ54HlBScZWbcfY/USz3qMl5ZOBqCkuOk037DOUdlbwXCUarGUAS8F8AMqlNW6V9Dwybe+dR7KH/txU+1HScvmfsWqS46+6Sw2woQJ1SSvXfgbiQ5yjajS9WLmOBvkGWWxDcmd52fjEvSbqrQCidYzgjBW6P2yREYamCUaLLgHvnjlvgUbaAASUYMi6AQw8dP+uLfjpwqq3Yzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(336012)(6666004)(1076003)(2616005)(16526019)(26005)(426003)(7696005)(7416002)(47076005)(83380400001)(478600001)(110136005)(8676002)(36860700001)(4326008)(41300700001)(54906003)(5660300002)(44832011)(70206006)(316002)(70586007)(356005)(82740400003)(81166007)(8936002)(86362001)(36756003)(2906002)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:01:11.5252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f21830e3-4559-4470-e980-08dc020bc2d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Sorry to late reply. This is v2 of the implementation of
resource_query_layout. This adds a new ioctl to let guest query information
of host resource, which is originally from Daniel Stone. We add some
changes to support query the correct stride of host resource before it's
created, which is to support to blit data from dGPU to virtio iGPU for dGPU
prime feature. 

Changes from v1 to v2:
-Squash two patches to a single patch. 
-A small modification of VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT


Below is description of v1:
This add implementation of resource_query_layout to get the information of
how the host has actually allocated the buffer. This function is now used
to query the stride for guest linear resource for dGPU prime on guest VMs.

v1 of kernel side:
 https:
//lore.kernel.org/xen-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t

v1 of qemu side:
https:
//lore.kernel.org/qemu-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t

Daniel Stone (1):
  drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 22 ++++++++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 63 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h         | 21 ++++++++
 include/uapi/linux/virtio_gpu.h        | 30 ++++++++++++
 7 files changed, 208 insertions(+), 3 deletions(-)

-- 
2.34.1

