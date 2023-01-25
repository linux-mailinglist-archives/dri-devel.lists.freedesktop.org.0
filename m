Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D668F67AF3C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99810E773;
	Wed, 25 Jan 2023 10:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A461210E37A;
 Wed, 25 Jan 2023 10:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgPQ4wfWRf4QKU9AoNzizI/Cl1dC0N4wK/9SQ6jYbMyFRNCBehE7NtNW9YraGi/LEu19n1XQ8t0jHj+GH3jbUf7xZKI6Hw95rLQr/DqYsgYxKcjRbOr0FeaxMWdKVro4P3sl7hSz5UQkszPgqKhWh1Rdqt+HxhCjY0POVxXkx6gpHjOiXWA2YxDhlJQJsK4hddFSAgcxgJ7lYwzc5ukyye8dBxPssru29jmpVfuVJyqoXEskYF1rF0FqUkwD1+bZDUUIejCG8XOP09Zp10SlvN9eaL/XHTH0dxPkIRDbGEwcV+sOGzVlokUHlnERJz79l4ZgvjxSFzV41JiTYc4Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upo6YJUccw0tI/B2/Tu+R9CdUn1pMZLDc3ynXo3uccE=;
 b=M/RbRPGBAsXl98i8yNobrHU6/G8rSCzvtwWxD+ukLGyir5Z0yFE4r1yr9/Xyx+kcr10PBsTz7/+AP7EzdxS1GMzaB6WuAb8EJSfpFf6zkepKGxGzFJZkw9JjZOr2CncHQdc/K3HGolthoWgzjqLoh8X5cHIXQHovGrrPXJalCbvlajs+7hrwOUSq3AvIIOal8D5twbIjVVQ6GqoMetGfOQ5R/NcH+GuteoryLxcAdUKl6Xy9edsf6OsQY27NghfathIrMq9BQUatqthYbohjLxT0YQc0nbHtQE+I2nEoW4SoKKM4ObUmtkj5f7Wd+PYs8IARd7s7eVYQpdVrPle0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upo6YJUccw0tI/B2/Tu+R9CdUn1pMZLDc3ynXo3uccE=;
 b=DYVMibzdJI+yVeSfkpc0Q1FqkvVL6f4kCNCfhEwmyEeuVGvTsF2Pg+4uKxay7f59BaGTKW50WYAJWabThhS66I+W/Mz8ICpXNIj18c+WHiwgAU0MwL0W+/7l7DLRQqyBZK6yd+PBe4yDeZYtuUTcCyxTXJT2q4GvNrB9U8kQavM=
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:03:56 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::a7) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 10:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:03:55 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:03:51 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/amdgpu: GDS/GWS/OA cleanup the page shift operation
Date: Wed, 25 Jan 2023 15:33:14 +0530
Message-ID: <20230125100315.6214-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
References: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|DM6PR12MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: 2915f4e6-c997-46bb-fb32-08dafebb783c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMPjknvUNcqZO6yoDQn/yOY+C1MfCrwVodS13VmKUmYO/SzHIHSSyAJyJelM3hrlIPZceHUNm+IAWq7gEivVmShmZfAmtfk/3bNAEFa+Wpr43YD1oGTiscS8HpHFfsxfq2HT6pGLfOP8MM8wWYuLaGG4DDonCHB71CYf/vqAnCryBi1yJED7e38kd4tl7vhLyyeQfB362KGttFZ8sgCoN3WGU32jLgX3wey1vArTnpT/kpo82AH8SnRIEz3O7a9g9cnKLqAJaKGZmkQ78VDl6EjHZ3Uk5w3xhfB2YriYBqBrQ5P5Slgc3+gMAjCNlORxnSeP5xKu9etLkdU4Jio/fn9T3VXCHTnRboCHpDhUpxpjZbSEcdLqY4JQV1+jUzYYEJ9P/89686W48UvNlL50e5jQp1KIj5dcst8/0Ts1+LkWk4J4UVNU9qpk/tDyG2TvUOHVLuxbz72VB5q8C55lsAJ5YlseCYXV8CcucjWo+GosJwD3ggZACtISXMzveeI2JoppxYFuE0HEkN+ZjYj0jt+7RK4IlQvOikwE9Ze6xAMY8MqaGyRJuZsI47b1SO6AiYh+W3TBu8Ew0ELpEMqmau7pm+VKFZXKa0oyITC5Pgy33UVfSurK4tUV+D+oYp6smsKObRdEwOmb1gEn9K/lhfAORmd55WQ/lQpQF4MkmTZsrSdv6hx/dUSCE9lOOtA9QtZqFonZ3VVIJ3cfFB9FvHrjkY9PFwtANP+gp3oW4Xk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(70586007)(41300700001)(4326008)(8676002)(54906003)(36860700001)(110136005)(26005)(450100002)(316002)(70206006)(2616005)(336012)(8936002)(356005)(1076003)(81166007)(5660300002)(82310400005)(40480700001)(40460700003)(426003)(2906002)(16526019)(83380400001)(7696005)(6666004)(82740400003)(86362001)(47076005)(478600001)(36756003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:03:55.4385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2915f4e6-c997-46bb-fb32-08dafebb783c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4877
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.
v1 – v4: adding missing related to amdgpu_ttm_init_on_chip

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 9e549923622b..2732d89c8468 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -142,16 +142,16 @@ void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa)
 {
 	if (gds) {
-		job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
-		job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
+		job->gds_base = amdgpu_bo_gpu_offset(gds);
+		job->gds_size = amdgpu_bo_size(gds);
 	}
 	if (gws) {
-		job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
-		job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
+		job->gws_base = amdgpu_bo_gpu_offset(gws);
+		job->gws_size = amdgpu_bo_size(gws);
 	}
 	if (oa) {
-		job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
-		job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
+		job->oa_base = amdgpu_bo_gpu_offset(oa);
+		job->oa_size = amdgpu_bo_size(oa);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2ab67ab204df..bbd0a4550fbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,11 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
 
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ffe6a1ab7f9a..c1500875b4ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1849,19 +1849,19 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Initialize various on-chip memory pools */
-	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GDS, adev->gds.gds_size);
+	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GDS, adev->gds.gds_size << PAGE_SHIFT);
 	if (r) {
 		DRM_ERROR("Failed initializing GDS heap.\n");
 		return r;
 	}
 
-	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GWS, adev->gds.gws_size);
+	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_GWS, adev->gds.gws_size << PAGE_SHIFT);
 	if (r) {
 		DRM_ERROR("Failed initializing gws heap.\n");
 		return r;
 	}
 
-	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_OA, adev->gds.oa_size);
+	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_OA, adev->gds.oa_size << PAGE_SHIFT);
 	if (r) {
 		DRM_ERROR("Failed initializing oa heap.\n");
 		return r;
-- 
2.32.0

