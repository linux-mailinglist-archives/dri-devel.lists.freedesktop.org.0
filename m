Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04537C6323
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69510E3F6;
	Thu, 12 Oct 2023 02:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D1410E3F5;
 Thu, 12 Oct 2023 02:56:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTw9XzEh8cq72PqV/6GFv2iBUtNOM+5zKRhPTXBYbf345HgB/bTVDvu5dTZ9BFfforN/2QiWmV0K1nNtK6zPxdenz045l2c5WsAflMx34MTWV7ENS+wHXh+V87oc8mmBdiNvzGfoIaJdkvjYMlyE3kxVIAnbSiIg1IGqionHwXkqMaiN6eZI+8it/yJBf+ATOj99FEKW9vE8wEl3Nqn7bj0w0ceNx1Qq4OQD+abukH/ZgMqsdO/09lle7PAdjeyePsTpWlI/DOnF6bQzEG8LG98rgh0E8JPUUsHTT1gBXOBIkL1C2KCplVoAcOR5L8nHoLLpUHDZEupVtjK/f6sfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiTquzk8ScPqnzEI6utqNm+5hDeTGgD333q0QRdo/U8=;
 b=OWU+ffE7Nmj2WRRcpU0Ntaxx2sWofFn+OWppSDudFwCp+8W53mBjZbWa+zV6z97pWXcDdEjW2kyInZeaWqL96YHwG8VObjbG6e34gInqgG9i23QLoyuIasuqkqaLuwroyq+BWEBI5g+WYrAP9P5KrURbrlFcRLqBex35RpCsoFtfniG5ZNkB77xSUqNQh0kgeJa+8E1am2mbyKj398MXddF0ND+NiY1eqglqUCe9GT5p+V7HCA8Vh9lU8OPVVCwpwB6LoV3I+rK9GRtBkV/FRv1zxlDfqIbUoQOcmRR2F3yK8m3OeaRhAsHwgN60HIjjdu8WHS01Bw8Cp7XxNnS0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiTquzk8ScPqnzEI6utqNm+5hDeTGgD333q0QRdo/U8=;
 b=o3gSyEF143rrKhiadclz/AgV/I9UCVnlxNVS3V52SK7AJ6VSz7hO4vt997RJI5fNM0DLokIROxyUHEb5D+f2aM0sCOZKpJM3Ew3cVQ7IgLdZfVStL2PnrExM5IvLZPl7dEcHQ8/Olb1vHb5dwUN0c+uEzP6swizeGbDibflshQM=
Received: from MN2PR17CA0007.namprd17.prod.outlook.com (2603:10b6:208:15e::20)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 02:56:52 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:15e:cafe::15) by MN2PR17CA0007.outlook.office365.com
 (2603:10b6:208:15e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.28 via Frontend
 Transport; Thu, 12 Oct 2023 02:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Thu, 12 Oct 2023 02:56:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 21:56:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.6
Date: Wed, 11 Oct 2023 22:56:36 -0400
Message-ID: <20231012025637.7783-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5f4868-29dc-4d22-047d-08dbcacee319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7tpwNHpVegt99N7kFxsem5+GTurNOgxdZ5WdxlywO1qm7bMhM5UMWqFIkClWFt0zKIB+cW6+TaT8f9WbwV0Y4L594e09+szu7oWhviiwwQCNDYo0OD6ISuZSNKAu49DXJwUVWoqJ0iGANKYk2UXohb2+s3P8Q3w+lMyVlMbCh6fja2t0awu5Vk4pcjwOqHyIhfmO9u8kE8Le0siKQUVAYZ8QdBSg99Lkozg+byfzirijqInDx4Q3+IpM982xAvj1VQ4GKyWgt4oaGbTMSMAG40Nr4c8JQuRjm06bVVv8iYDNLR3sLmlVetnBpdnmqfj2JXnGFFZvmnJr8s6KnAO7TNXGTN4hpvRsEu73em7nUPFpPrAuhwamAf1A9NcW0W7sZIE2Lta0YpeZrIR5J0snnZcEK1pS39JEU74OyDnKSfwitciml1RpAkw4hrHFkHWibHBPzPr9avZ0ONoVjy042VETWZxGNmCaALR8DCu8hJTYmzDGuYcABWt070sjzB3KVjNhTWAnwwh/jmiuzw8AdcUK/zSNGz/rsNTgBrXgcQ/JGQHUYInAfHopry1SWBbNRhykv9A+p6ERjN6qDOW0AZal8ug3/ZnIsv+bLt+vlh+o/YC7rgDuufi4t2bvShJdFF0PiZ97oKldnjYjyqRPnUmyWWkg3/45CHTQyfs+re14zw5VeJQsMLBCXAKK3m0pKt2R6eXrQV1pxcLXplh/IRVnP1Dj5sA3fCGnIapH3/pbUyilT+yvwd3LtmW5Xmur
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(82310400011)(186009)(451199024)(1800799009)(64100799003)(40470700004)(36840700001)(46966006)(1076003)(66574015)(2616005)(83380400001)(426003)(26005)(336012)(16526019)(40460700003)(40480700001)(81166007)(5660300002)(356005)(316002)(8936002)(4326008)(6666004)(8676002)(82740400003)(70206006)(110136005)(4001150100001)(70586007)(2906002)(41300700001)(478600001)(7696005)(36756003)(47076005)(86362001)(966005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 02:56:52.4885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5f4868-29dc-4d22-047d-08dbcacee319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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

Fixes for 6.6.

The following changes since commit 94f6f0550c625fab1f373bb86a6669b45e9748b3:

  Linux 6.6-rc5 (2023-10-08 13:49:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-10-11

for you to fetch changes up to 3806a8c64794661b15ff5ed28180ff9a5f79fce8:

  drm/amdgpu: fix SI failure due to doorbells allocation (2023-10-09 17:59:29 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-10-11:

amdgpu:
- Seemless boot fix
- Fix TTM BO resource check
- SI fix for doorbell handling

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: add missing NULL check

Daniel Miess (1):
      drm/amd/display: Don't set dpms_off for seamless boot

Icenowy Zheng (1):
      drm/amdgpu: fix SI failure due to doorbells allocation

 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c         | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)
