Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F2D5B3DA9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39D10ECC0;
	Fri,  9 Sep 2022 17:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7460F10ECC0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWEtDherlqw7+2ZICmXlKkdcWkwnDoXlI3QMkyUG2koyyD8FLdt2ooVyIsyDUhAyizeRzJIerTbSHIMs/Yrk7A9p1cRnZHbzOQfGAbhbMwxEU6D4pE5aWgJRWoVv/ujtpgeZfG6sV55SpguHfCV0t8LlfkphKUxjGsfsrCaokDbagWmtpS1JMonADSDgkeVT4NORCdPLSbT6AmcjRfgDxxGvCdVOXp8E59gbWqHn5+0WadBtqRedvc16ct+Teij+ErYT3H/jd/b1wQ5xoPTJGhSSDrELIm2iJPqhG7HixC8tH2XRMS7vm5EFFgy7CELDiTeOd3npUNp0MSHBa9U4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqCq7BFen/lvI44nWJu+9M2Vdr4wby/jQzVN6M00s8E=;
 b=YFekF5DU++920t5Sj61K0f/bHXZbFiNYVu0C+EXDaFP3s0MANqGmZlQ+4qnS8IYSKL0kzxYHvcBJi4QN5zWkqT/Z8LYuvrm6VhccsBJhAqnIybPI6F/X/sy+Ir9xptHAuxrQpJgS9BFGHnop6rnCGgSHBwVsUmMP4UIF8T2VeFmOhUr01vgzrC4zNIA8rFLXcjbsdEnAn04kbcx7a+/scnIHEi9TvC7gMpnkCJTQpsQBO6mI0dqDrNcH2WX2NfNjXfZTtZuLM4GNiBajtl8faYBXt7L5WzQFiPWoW+oq1dSB485LgKIqOYewqMmcdKk3bAH5xApuQn7NfHgI59Y8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqCq7BFen/lvI44nWJu+9M2Vdr4wby/jQzVN6M00s8E=;
 b=XwXxFXLACItt8bKd1i4nOTX8Es1i27+UR009K+9bkqNhEsouP+aNXHo6XamRH/Zy5Qsl2nWgekOdNQn9+ns7UhXqZwh8vn59kOiatS9IeQQAnyQvCn/M1jFpQBjaCvKkJ25du3rTZ9rhNOgEIjIwT4HwrQikRNT9X3VoWeU02PE=
Received: from MW4PR04CA0063.namprd04.prod.outlook.com (2603:10b6:303:6b::8)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Fri, 9 Sep
 2022 17:09:58 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::e7) by MW4PR04CA0063.outlook.office365.com
 (2603:10b6:303:6b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.21 via Frontend
 Transport; Fri, 9 Sep 2022 17:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:09:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:09:52 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/6] dma-buf: Check status of enable-signaling bit on debug
Date: Fri, 9 Sep 2022 22:38:39 +0530
Message-ID: <20220909170845.4946-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1cc80b-be04-49e7-a8f5-08da92861f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JN2+BLvHKQOshxvq0qDI2h2yve45rEGk0n6cQuPgwFwJOl5Lz8m+K8Gcvg8FZuMB0Z4FhEgnNKexJ1ajpBo/cKGYTFHLAjNBzYJucF9PDVzs1GUvLpCxju05yL6pcYsTIdAA5du/QkwQ77sy/b+wGmUs7qW4hZN1p69iqnD/9tBdrYma74LO0aRNdKsZMdb1qJCi2SuBcdBosUh25nR0vxDXBXQFWEA47m2bCKNP0hkETkFVGzz4OXd3uFN9d64Z0AaurlVN4cNqsFr1BxMcUNQ/uBLba56ui7VWVlbBXW+UeSUjHN3aL04iPU2OVYWT2X0BVEFM/lEi+sSdYw0FOwVB7I+4txyWpWkGvvBayaHKRouQUPqf3fBVXmjWIjH4OaISPHjZcUKhD2lMC55qjnWxp57ho8zyWZSMeApqBeZDr68v3jOegfIoUXnixRbmE3ZhDJRhDbvyzJ3q3kRxAcjV8w0MGfoYO7k0A7B4gr5cfxFytqMW49RjJy46DjboK9Kq7SxAzwb/2ACCZb8hWgbydlxV/H8CgNVksCJRRcrl6b1E27AIZCMHuEsprUe//TfSQT2EJ9kh/bSPlEHEQ+WPBPN/JujuV9Ecu4yYQZsuRm75epyMaS4an17B9TAdgNmRJF04T/e7z+JoHW1R0Z6Jwdrsv9lbEQeca3veTuDeTpRxs1GaRSnjWH/14bcsN3AcrGpY8DG8QiYUDd1bOQmbof3FXDL1UdXmBW3Wf7A6spOpXUszzYSYDcPWBxjVI424wr6TlkbEbOuArc+9Kt8SP50ICF5uic3P+ncnDl4VrTQi4WKSXYm1JyTVzPXw9QhYKEcLEwebANovBGFe4SFuFnpvafFTg8Tdt0TrWUE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(8936002)(40460700003)(40480700001)(81166007)(5660300002)(478600001)(2906002)(356005)(82740400003)(7696005)(41300700001)(36860700001)(316002)(82310400005)(6666004)(83380400001)(8676002)(16526019)(70206006)(4326008)(110136005)(47076005)(921005)(70586007)(1076003)(426003)(4743002)(336012)(2616005)(186003)(26005)(36756003)(86362001)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:09:57.1617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1cc80b-be04-49e7-a8f5-08da92861f39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fence signaling must be enabled to make sure that
the dma_fence_is_signaled() function ever returns true.
Since drivers and implementations sometimes mess this up,
this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
is used during debugging.
This should make any implementation bugs resulting in not
signaled fences much more obvious.


Arvind Yadav (6):
  [PATCH v3 1/6] dma-buf: Remove the signaled bit status check
  [PATCH v3 2/6] dma-buf: set signaling bit for the stub fence
  [PATCH v3 3/6] dma-buf: Enable signaling on fence for selftests
  [PATCH v3 4/6] drm/amdgpu: Enable signaling on fence.
  [PATCH v3 5/6] drm/sched: Use parent fence instead of finished
  [PATCH v3 6/6] dma-buf: Check status of enable-signaling bit on debug

 drivers/dma-buf/dma-fence.c             |  7 ++++---
 drivers/dma-buf/st-dma-fence-chain.c    |  4 ++++
 drivers/dma-buf/st-dma-fence-unwrap.c   | 22 ++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c          | 16 ++++++++++++++++
 drivers/dma-buf/st-dma-resv.c           | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 ++
 drivers/gpu/drm/scheduler/sched_main.c  |  4 ++--
 include/linux/dma-fence.h               |  5 +++++
 8 files changed, 65 insertions(+), 5 deletions(-)

-- 
2.25.1

