Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC2808F4D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DF8890EA;
	Thu,  7 Dec 2023 18:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B620D10E92D;
 Thu,  7 Dec 2023 18:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqOr5h3wkHJgkiWQQkbJ0O+y4vrhUJz5a8Qcvjqk4sDcVdqy+m2gis5aOUqY+Q+c4pErKaMcx6/MaL0d1L2a81tLbwdN19pxAzlro4MD6q35EmHM/fGqfME42rrbdn2NdxNa2RRHvLWutuicB7zL+Z+VNwVt92HlyANYOg0hhWMsWOIjJgWkDE6TWfEomdqm2LkYnsMVbMWfwLiujtkY9/AWrMEUDNMSKH9r6iXT4Md9pxNxsC0oLjxKxAWGDJJLioGqpEw1zaHoKiUz84vDhEOwVr1iR+JS38emD9nybHpwlfjTeMDDKb9nv62xPH9QUCBEQ6URISepNAia370Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06VYMKrB/QDa38XVtZyG62t8qbXuLZG973IaTS2f/TU=;
 b=kOvUINRQ5joQQyXxzqKuqSPUaLnAvJC7aAsOVGsa1iG6SIDn1GG9sJKSKZUeo/ZG58iEnNa1Ju8PDuaXRgeBDbGSeNwzUqP4wk2UMw9NCMNtkcD9nz2RhDZlmNkcCwTrhWCemNK608ynfjN/QieH72rVnTeWKcpQ7sLzUF50OATzQ/03PM8Z45cdJZczQ7GbEHqh4XnRpR3jJiu6KRGXp6sjT7XkmrpVU2JKmEBEOszjYafIJNwOdWe7RaVH+W+E4LiMYL5RT8K8FAx3bUZ37MBWhs+jc1OyrYNcQNBYUTHr903YwstDADsOqnOjA3lRwEHMeK/ugpO4AVRDCXffmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06VYMKrB/QDa38XVtZyG62t8qbXuLZG973IaTS2f/TU=;
 b=CwMaqycrrxzPg8EcheB2MPsU3r9rUPAGy/onfA40pgIDWrDqCbi3ia/nJFT6H+WTW1namV09yr2MdxDyiU+inGYD73wr6dj6KdhLv4PzuxBvhl//f5Ks7jpz8wqQdSxtOupYAMthk46nUjZIA+Mz9xKMgUBFQZaSPzUBhzVLasg=
Received: from CH0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:610:119::20)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:02:40 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::70) by CH0PR03CA0385.outlook.office365.com
 (2603:10b6:610:119::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 18:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 18:02:40 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 12:02:39 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] fdinfo shared stats
Date: Thu, 7 Dec 2023 13:02:23 -0500
Message-ID: <20231207180225.439482-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: bd99cd09-4aa2-46f0-3c40-08dbf74eb436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wIUsUV1NnfWSZB+lzxOjk1GdJ4WJ1SpxKux3+qdfq0PVF3SOjf4pUyE9yKq0QpkYQCYDeUY1vdoFeM2cv2toaMyEqlVMqL4tznrXIVOnwTI1EzczM0eFW7O98WijOBKnT194LD1IUEkqcZTQbceWdFBBjTYwGpLR1gkL3+iM9IIYRKY2c3DSJ4sn2ZpfG1mgYeSyg+f0hH6sbgxkAEJ3gf4vP/QeBcpHjayHlq5XB7YreEuv3c3gmFjK3BkkLqEtddRm6GC4gpIluKDv+lwB0d59KqXgwZ/5cmUT2vxNXRUzNs+4CNfjpoYKnRhllXqcJonajA6QsOv5LSdWSn95oQZjGeO30jBlAfPclFwUHynTps7ES+dKJv2BQZ7J5w+iD0xFyJZgU2NYsuDS9mepGu+55cK1sxXUCdIjUQB9AOzoeZ4fr2EMqD6W7xJdgUAIHCEo2RGbuYwbrsiBRXQiDcFTvIFPk9wRiBF7WxdtAMdeEx7uimjeZv46s3AIjOPOsTW3eI81ySmSEIzcyiNPdCq0uIgZj02BWOGy5aT9BWArcXzYUgvwy5XZkyjjxRj6kkfIJjZQ3Ra5ThEeQ62+GTKzcu6CZkGdAfIiwxlfUZQG6QmvohKFt/JRkU+IcflRRVccRePXMXiy7bE/vI4EevReVIrT1RX3dZZmKR5h8acfH1AkDTT8zCatO0BibDBJhSw7jlOrUqYAt9p+pTkCCSQa/gGFAcHk7mPfHDG8TsMSwviDfTIvRLAudDL71l46XsUTrXWTBeK+Yy8idhbwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(82310400011)(186009)(1800799012)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(4744005)(2906002)(5660300002)(41300700001)(450100002)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(70206006)(110136005)(70586007)(40480700001)(36860700001)(47076005)(356005)(81166007)(82740400003)(478600001)(1076003)(40460700003)(426003)(7696005)(83380400001)(6666004)(16526019)(26005)(336012)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:02:40.5082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd99cd09-4aa2-46f0-3c40-08dbf74eb436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
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

We had a request to add shared buffer stats to fdinfo for amdgpu and
while implementing that, Christian mentioned that just looking at
the GEM handle count doesn't take into account buffers shared with other
subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
doesn't really matter from a GPU top perspective, but it's more
correct if you actually want to see shared buffers.

Alex Deucher (2):
  drm: update drm_show_memory_stats() for dma-bufs
  drm/amdgpu: add shared fdinfo stats

 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
 drivers/gpu/drm/drm_file.c                 |  2 +-
 4 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.42.0

