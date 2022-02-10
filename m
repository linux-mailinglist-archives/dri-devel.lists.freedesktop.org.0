Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373674B03D7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 04:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A177810E2B4;
	Thu, 10 Feb 2022 03:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53210E18B;
 Thu, 10 Feb 2022 03:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJNntRH5kato85dtNn0XHnxPn2HJXezxBJyJvGk2WLkxAmvjECZH1omseNOE2VI1aou/+1R9hWXcgLv0NlnZRd/3uEr8sBAc4m9HeD24kppMo4siJFCVH5UuBQGLi/JRAVWjfhFBdNPB+WlBypkTUQXoyQPKgUBHl+/ZzQ+4jnFWnjb6hwC7aaXWAy0BGlKqVswlw48W72tQ806g5KnvrK0qIwgTO3SvSr5j5+F97yLcmr26eDZJ5+n6OSkJwo5mFlTrElTClCev/1pXT6CBiiXuwsY9qAd1KymcveXiTBOnq9mlX5jNNIzWpgMaTPfr2kB0oCfelYCdfHGlAVg9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvzyQRKHG9Gh45a9CgkQD2xCoyfPCGlo6iEkod9z0fE=;
 b=FwcSM2rR5Ev3lscjiBel7QHe2x6K2y0Ey62SlHh9UJZ2L58B/yo8SM13BdInDxoBectwG7nN4wOpGkhuaep1tsceuw9W/KKVm2T+5z0ZgMitnfdGvF2vzSDdacFB32YtoCUcZcTO5F05NYr8LlXq9qpiguCquq1JwOLuA9Xf22jqMhp3YgCC+qEYAcu1NXESuDVgsFd5a0xR8RxeR77s9fwKUki1YbNS+VclAcqfrQJ5ED6mB/DwHlPVewnfmX87XgUdfHGNNDM7RMtA5PAi2DB+IMKgLkMFZ3X/YIEYOQ9ogdo8WZky9UJBqVacZ8ER6mzzdlKTOCh1MNh40yP+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvzyQRKHG9Gh45a9CgkQD2xCoyfPCGlo6iEkod9z0fE=;
 b=iVXvEldrBtD6nFsA90ZV3CIUoI2VhIhWGoTYIDTAyz6NoHXrzjr2CGSurzFKIkMeI+M/ofv4hZrMQbbOk6MLxWoI0Dk/qWrkUNwrUrjE45Cgy57tcXSGw4oi5ISGzyTSW8Ea+HKXqpxudNMsiuWPYdwZUtA/upv451T9NEBB0mw=
Received: from DM5PR06CA0027.namprd06.prod.outlook.com (2603:10b6:3:5d::13) by
 CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:6e::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Thu, 10 Feb 2022 03:17:37 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::cb) by DM5PR06CA0027.outlook.office365.com
 (2603:10b6:3:5d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 10 Feb 2022 03:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 03:17:37 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Wed, 9 Feb 2022 21:17:35 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix compile error.
Date: Wed, 9 Feb 2022 22:17:24 -0500
Message-ID: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99a2174b-404a-4e70-df59-08d9ec43e35e
X-MS-TrafficTypeDiagnostic: CH2PR12MB5018:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB5018360E9C7D233882CF92B0EA2F9@CH2PR12MB5018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mfyi4EcE1CSvsj1tn4HnEHZaQTiAvENXTQHJhSphv8VtbNb1HeDI3pL5ulrpbobd6VqGz5cPddPm4kkrXDNOLu3xn0cmrC8ptlwfMhOvCvSi3BfWxRZUuabYDf7tILXbMoUQBdWP2H6ot+I+rOOTVrUYGsWVGL40ZzQSOHDwUnALVyquTookBi3UsOMgmxLOF+IYYgETNyFQVIEjjq5r6cJOKf3HSdhmIaFPCmn5AuW2mAp3VGeGqHClIYD1MQNDBWbBQIIm0MGUykW9KcoN3lW64AEyVUrULsmNS8ShSoEyU7MlLJVPiiFGyb4UEThhqL48in5EnJmVbsJrtkjD6AAJQaw0lnRS3D9uvHhWqrvrZnxwjPmeh/gIP/MoL9+UG8Mp2aAb2sGIWV9Oj1zY0w3LqAxRmOrKMMklpcxExCKSEKZglRz8y8fEsopiK346Q9z+dyuUK00MaX79dFi3XUdCQCiX8nJYuLQq2mfEId1sX+BraTM7lsVbzJXq43BCp+Bp4nQ8Qjxxh0xLM4DXzya/H4qf3rJCRo7YOebFVj6l1d73YlDgJzFUXSEyXi55W/LwtN8txef6I9gFxTM5w3PB/1QYs2QM6CDkq/sXmhf9dKF8w+zFF6gmbpQZvpaOAiLrLiiP6Z2qTU++qVzN97PL/zT1lhHuwhUoPtFgOwPEqOMaHn7zV6wipXlopMUvw9PLhFjata/DCi2WYEaXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(82310400004)(83380400001)(47076005)(7696005)(2906002)(16526019)(6666004)(4744005)(356005)(44832011)(81166007)(40460700003)(54906003)(316002)(36860700001)(70586007)(86362001)(26005)(336012)(186003)(36756003)(8676002)(2616005)(1076003)(426003)(508600001)(110136005)(8936002)(4326008)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 03:17:37.0151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a2174b-404a-4e70-df59-08d9ec43e35e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018
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
Cc: kernel test robot <lkp@intel.com>, horace.chen@amd.com, lijo.lazar@amd.com,
 jingwech@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems I forgot to add this to the relevant commit
when submitting.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 92de3b7965a1..1949dbe28a86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -118,8 +118,7 @@ static inline bool amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *doma
 	return queue_work(domain->wq, work);
 }
 
-void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
-				     struct amdgpu_hive_info *hive);
+void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
 void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
-- 
2.25.1

