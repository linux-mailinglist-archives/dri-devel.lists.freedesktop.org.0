Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AD78B02D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEDB10E2BB;
	Mon, 28 Aug 2023 12:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC9B10E2BB;
 Mon, 28 Aug 2023 12:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Orw6kDSYLru+fXR4Zl7M6Em6Iv0RloYvrMIpc3qKxbbK7Bn+sRSqXGQnLh+pTqlCWpPF7gFYnLGhaObtgnkWUwxDwiEGKAOSM3kVzRfR1Q3B+Gl7jLL5lCgOqHkUhkC7Vk4G6CHgBRPARlcCs5BDSwG5Dd249nagVCru2GWQnYbxLqzqA6b8lEB2Cy1iXDrXyNudNXYwvxr0P1n3I7SYiCAiCMn4WOFucdFXTLO+OVol5vrj0Ll3FrI74lE8ixSLvUxxdcfvbw0XjJe9dEq8Z8InBPJFL4z0IvjXM94ewtaHRL7RtWrsjGsCzGLgM2qfN3fEsPjfVEJ81r2i/V1akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2mfAMYY1C7O1oxmR7e3415v3jbP+A6sd5TbuJOgwcA=;
 b=EU5yQqLpvqMkTFd3k3RRBN6O4TmmHmJ1955TA1cbA9EQ/UtJMhS4oR5AnK1ImHpVmfBOzRjYsrCIKcVjGWfALCcKfaYz8CjAELaPgiN9e2ZCULmhFtM8hWsm+QPRSV3t5jUFjSU/oF0ZVf+1MDlksVbafgv/lcfHHl/6uomCGdphga/Iq3hZxlST7xV6NMIlKoGANY7SeTH82gRdhpGWSIRxVQnsLCgn0cmIvF/X6ToojiDUBiNbmKrLdmwdqSKn+5JFn49J+LRXt7xmy+kBBhzZSUJL1SoJUD1fk3xTatef8RXqta6h1wLgKPuQ00o3+YMIlnynxRtnxLosdvJoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2mfAMYY1C7O1oxmR7e3415v3jbP+A6sd5TbuJOgwcA=;
 b=Txv+zp/T06pO8rweCC+/A5nGZL7rYq/rXDFD8BsU/ehlqj8Q9th5iaM10LvQyQ9c8l38KQhDmvw3ao61aNkTcJKjgct+ohPG8TJKM4nmk7qsNLoQW6XYanzey9ftiPVfp2OfdQjzJNBdeGEGiNVB4x2nPsCOR2OceJovjD90+rI=
Received: from CY5PR13CA0001.namprd13.prod.outlook.com (2603:10b6:930::34) by
 DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 12:29:20 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:0:cafe::cf) by CY5PR13CA0001.outlook.office365.com
 (2603:10b6:930::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Mon, 28 Aug 2023 12:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 12:29:20 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:29:16 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 5/7] drm/amdgpu: Set/Reset GPU workload profile
Date: Mon, 28 Aug 2023 17:56:12 +0530
Message-ID: <20230828122614.3815122-6-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: a34ac73e-92fa-4e29-41a5-08dba7c2675e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veL3hQGTFhGfA1tNXhRjrMciyRE2pS8rM6ywBsxD7O1AXdPoRDvMzQgtHe1YrF5xME4uFtsqHrJdcVfoN8ruRbqqaZ4kAH+quNE598lA/K1pFGfgGFW2LY6RxSBMB5I+qBiA/JlL6e3GSnoMOYNRsHmIsXzF/USOtrbwafK1M9UsCLkh5xVDfwm1Vq6+Iudt0hEHh48kbDTf4+jHAmn2968DvqsaL4Ppq9+uPJD4aHmOlxcr+9rtg27Rw1yeEps74Zzp0UitTcwM1QrDYmBpfXHr/JIUsy7wBbiBxOmvcnCf+TBSidg5bkn/zUBaVYAjVAeVvLrWt2YBl0M0mKeSdiRCnXrb8yf6z1mNrgOcmonjfK1BjF84I756Bv5ptvetwBF1+nabo8WFtbZ37XQ5jH6D8DzcyMTRsRJ3Gs6zT7eJa3amIiAF7L/HnUcb/qUOzvGP5V5hKa+S2gKqK+ueC1L6OBfDqYJpg1eUd/bJXHeI+YdHKr5fF2iuD8zwdiqx9hHC4ZmvfiW3V6UOYUScgJTgI26yQifRYzLgKNMWLhYq6xHdXK7Vay597P9k5rEmiDv9I4WjgBgXNMRr7z+LcPvKxaO/mcnlOd7mzcoJy8r9jvkjSBOAX4lNIkgp3FTDOjKD8PvPRfdhwjJkNzfzbmtfgiHtFBRpSgwyKI2wsM31ddzYtWimjqqpKB7Suzw/b5ou2GBEHYcKXX2SB8U+2VYa+llnrHPXyEOJPbbbJGMhYJiEQ9Wwx20wjvdV5Cozz2mIogOIPhpOpRNOhCkCww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(6666004)(7696005)(5660300002)(70206006)(40460700003)(36756003)(86362001)(81166007)(356005)(47076005)(40480700001)(2616005)(82740400003)(36860700001)(2906002)(1076003)(426003)(336012)(16526019)(26005)(478600001)(110136005)(8676002)(70586007)(8936002)(54906003)(41300700001)(316002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:29:20.1687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34ac73e-92fa-4e29-41a5-08dba7c2675e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to switch the GPU workload profile based
on the submitted job. The workload profile is reset to
default when the job is done.

v3:
- Addressed the review comment about changing the function
  name from *_set() to *_get().

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..c5032762d497 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -176,6 +176,9 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 {
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
+
+	amdgpu_workload_profile_put(ring->adev, ring->funcs->type);
 
 	drm_sched_job_cleanup(s_job);
 
@@ -295,6 +298,8 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 			DRM_ERROR("Error scheduling IBs (%d)\n", r);
 	}
 
+	amdgpu_workload_profile_get(adev, ring->funcs->type);
+
 	job->job_run_counter++;
 	amdgpu_job_free_resources(job);
 
-- 
2.34.1

