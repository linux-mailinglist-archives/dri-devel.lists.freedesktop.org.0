Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABF67BB6D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3310E847;
	Wed, 25 Jan 2023 19:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645B310E81E;
 Wed, 25 Jan 2023 19:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4uFylAqOZ7kflyVuRIIwdrypObbj96U8osOHzF/dd2FTHJYgroqTS2K2NnvqP7WNQWkNh+RKDGLgYK9scKJYS6ROqJ+fKqq7CDjKLU3q4tyCSMQhi72uZWGw8Mod5CA9CmChTfd+t5gK5KfFVGN6yr3hEYIjWNTr8MotmBDoclaA0hxmouSc+Dcy/qvs2RtuodGzH9sd8fWtmJgPhTT2jfAJtMUPLk2uwZJq/Jafp8lITfifZ8nCJawZXpPwFn4bTLWNXi2/OIG+2CEEJYaIWqOXJX8p0Ihx/+OakneD8Y9NARxAyZziGw5Prg6tOu7b794Rswf4sl5JoqqaCjFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo0v9hgPui8bsBCaWf8RE0DegRGP+IdMaROE1EBUXRU=;
 b=jIhz8dS5qoQe10WHvFUiVfGUiEOkSVxPwJKnVyCBFEZnYW9D+JHJ/Q8KrVcVqEmrQ1dQV/rUsuKBlrTZyCpn6TwV6o6yziR6l2Stpay8We0Dx4unwoAqDzmM7PC39nJBGwAJPUwlaGeA6/KrSMYhWpWK1VJN2uBr/JvfRRt0myrWy7xQHk/KVCvd2C8eXEEo7C3Ka2QUA+erJPC6Dm2dLGR3eyoHz1FbaSumr8PRkUnTlH1arF4z7x0sIvMLpdR3V/uoBGvhVB0DfmqAygRUKIOGdbnulJ1wZt28RECSIswXcQQc+lVIzDvZelvdxN+4AQXPAweVCSW5NWcuKQevUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo0v9hgPui8bsBCaWf8RE0DegRGP+IdMaROE1EBUXRU=;
 b=PBl5H7YJSfO02PADQW787xKYg2R4skqVU52R8DgzUO+WXBAdvNXXh5dWhbsaW7dmMTSNQVy9EfH/21c8VFS7fmoGvEupoDBX0AW+Tv/Dk4hY8eoim8g2VezGMFGEPcNd8GTNd7e1tNxAnBp7yngFQUKBnmus4LX7Qo6UZsLuC90=
Received: from BN9PR03CA0692.namprd03.prod.outlook.com (2603:10b6:408:ef::7)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:25 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::f7) by BN9PR03CA0692.outlook.office365.com
 (2603:10b6:408:ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:25 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:24 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/32] drm/amdkfd: add debug set and clear address watch
 points operation
Date: Wed, 25 Jan 2023 14:53:55 -0500
Message-ID: <20230125195401.4183544-27-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: a04de2e8-779f-4cdc-c1df-08daff0df649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+WIhaF+ZEJuCDPd4qGNVlI2L6931St74/Sh9DOsAfnsfZ3H2i9TGzPromvy8IaRvKn2EqUE1s+9/okwoYaTQ2aJzazTeYRbBkN5W4b2w876JEr587CEi9EJLWrUsmHbWrW5eZBui+GYFK5Lghgiyznv0UCMgaF9o/GoGLul+phEGAZ/u5kSnEwZD5yoYbOT2f7lp+YZIFafd+YhBpzOtJwHNmz0N4NgFOEb5hf6Am9j8IypHqbQ+OvFRghcyaDB1ShCz6iQcG2QZsenB97sUvmCINV4+8SYBhHPknrcs2XzaIikSlM10w3gw1eBEB7v5/Kr/0MHx7TT3RdeYA37ZqSOXEyhnCEO/LM8QZKx4vyF2m5/aYxP/D1QqX65BgfghUW3LJ4yQxeO0MJGOFFVJZw/735ZWsHi3ScS/XpluZj5QqnVg61loqDJ2qy9SXMnph2hjIGb3fQXxumAq/jSn9tdm2Zs/v8UHQzxL1WMBab+ibucB93+jZvXr2uYECrU9dsEd5T5TszUYS5lhS7U65dsPFmzCRidO8N31hIAvOvuIw0rsfbu+LD+7BmWfYC2NzF16hw6/qmmggRb2l+W7rqaGkb6xKKn09iKRcXpMqgGiPC/stlwRYb6RDFmMa8xQ+M2riEkSK5qRKMBJ88fovvdZWqMgp2qfiQSYAMz+IvsR7LUvSl7kS29ewQtJ/smPKkHIQZpIlblF/Ra+jPvN3TOugfsmkrmHVGaBwC/zLc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(86362001)(54906003)(110136005)(6666004)(82310400005)(450100002)(316002)(70206006)(36756003)(70586007)(478600001)(7696005)(2906002)(44832011)(83380400001)(1076003)(4326008)(8676002)(5660300002)(8936002)(82740400003)(30864003)(36860700001)(81166007)(40480700001)(356005)(2616005)(41300700001)(26005)(186003)(16526019)(336012)(426003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:25.7564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04de2e8-779f-4cdc-c1df-08daff0df649
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shader read, write and atomic memory operations can be alerted to the
debugger as an address watch exception.

Allow the debugger to pass in a watch point to a particular memory
address per device.

Note that there exists only 4 watch points per devices to date, so have
the KFD keep track of what watch points are allocated or not.

v3: add gfx11 support.
cleanup gfx9 kgd calls to set and clear address watch.
use per device spinlock to set watch points.
fixup runlist refresh calls on set/clear address watch.

v2: change dev_id arg to gpu_id for consistency

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  51 +++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  78 ++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |   8 ++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |   5 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  52 ++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  77 ++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   8 ++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  24 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 136 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   6 +-
 13 files changed, 451 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 4de2066215b4..18baf1cd8c01 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -118,6 +118,55 @@ static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
 	return data;
 }
 
+#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
+static uint32_t kgd_gfx_aldebaran_set_address_watch(
+					struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 6);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	return watch_address_cntl;
+}
+
+uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	return 0;
+}
+
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -140,6 +189,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_aldebaran_set_address_watch,
+	.clear_address_watch = kgd_gfx_aldebaran_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 500013540356..a7fb5ef13166 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -413,6 +413,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v9_set_address_watch,
+	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 7591145bc69f..c9246370984c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -878,6 +878,82 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
+#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
+uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VMID,
+			debug_vmid);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 7);
+
+	/* Turning off this watch point until we set all the registers */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			0);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	/* Enable the watch point */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+
 /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -966,6 +1042,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v10_set_address_watch,
+	.clear_address_watch = kgd_gfx_v10_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 34c04a2bb83b..334ff16e25db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -39,6 +39,14 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 					 uint8_t wave_launch_mode,
 					 uint32_t vmid);
+uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid);
+uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id);
 void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 8627c5458973..ee36ba045dcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -676,6 +676,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
-	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
-
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v10_set_address_watch,
+	.clear_address_watch = kgd_gfx_v10_clear_address_watch
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 4fdc25222dcd..358c219fb704 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -736,6 +736,54 @@ static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
 	return data;
 }
 
+#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
+static uint32_t kgd_gfx_v11_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 7);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	return watch_address_cntl;
+}
+
+uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	return 0;
+}
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -756,5 +804,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
-	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v11_set_address_watch,
+	.clear_address_watch = kgd_gfx_v11_clear_address_watch
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index a3c8f5578788..43296b78d888 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -814,6 +814,81 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
+#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
+uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VMID,
+			debug_vmid);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 6);
+
+	/* Turning off this watch point until we set all the registers */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			0);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	/* Enable the watch point */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
 /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -1085,6 +1160,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v9_set_address_watch,
+	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 2a2ab42037e4..ba52b61b68c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -77,6 +77,14 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t trap_mask_request,
 					     uint32_t *trap_mask_prev,
 					     uint32_t kfd_dbg_trap_cntl_prev);
+uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid);
+uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id);
 void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index b62e93b35a44..8f2ede781863 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2802,6 +2802,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 	struct task_struct *thread = NULL;
 	struct pid *pid = NULL;
 	struct kfd_process *target = NULL;
+	struct kfd_process_device *pdd = NULL;
 	int r = 0;
 
 	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
@@ -2869,6 +2870,20 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		goto unlock_out;
 	}
 
+	if (args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
+			args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH) {
+		int user_gpu_id = kfd_process_get_user_gpu_id(target,
+				args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ?
+					args->set_node_address_watch.gpu_id :
+					args->clear_node_address_watch.gpu_id);
+
+		pdd = kfd_process_device_data_by_id(target, user_gpu_id);
+		if (user_gpu_id == -EINVAL || !pdd) {
+			r = -ENODEV;
+			goto unlock_out;
+		}
+	}
+
 	switch (args->op) {
 	case KFD_IOC_DBG_TRAP_ENABLE:
 		if (target != p)
@@ -2921,7 +2936,16 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				(uint32_t *)args->resume_queues.queue_array_ptr);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
+		r = kfd_dbg_trap_set_dev_address_watch(pdd,
+				args->set_node_address_watch.address,
+				args->set_node_address_watch.mask,
+				&args->set_node_address_watch.id,
+				args->set_node_address_watch.mode);
+		break;
 	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
+		r = kfd_dbg_trap_clear_dev_address_watch(pdd,
+				args->clear_node_address_watch.id);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 730e53584113..8d2e1adb442d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -24,6 +24,8 @@
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+#define MAX_WATCH_ADDRESSES	4
+
 void debug_event_write_work_handler(struct work_struct *work)
 {
 	struct kfd_process *process;
@@ -291,6 +293,139 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 						pdd->watch_points, flags);
 }
 
+#define KFD_DEBUGGER_INVALID_WATCH_POINT_ID -1
+static int kfd_dbg_get_dev_watch_id(struct kfd_process_device *pdd, int *watch_id)
+{
+	int i;
+
+	*watch_id = KFD_DEBUGGER_INVALID_WATCH_POINT_ID;
+
+	spin_lock(&pdd->dev->watch_points_lock);
+
+	for (i = 0; i < MAX_WATCH_ADDRESSES; i++) {
+		/* device watchpoint in use so skip */
+		if ((pdd->dev->alloc_watch_ids >> i) & 0x1)
+			continue;
+
+		pdd->alloc_watch_ids |= 0x1 << i;
+		pdd->dev->alloc_watch_ids |= 0x1 << i;
+		*watch_id = i;
+		spin_unlock(&pdd->dev->watch_points_lock);
+		return 0;
+	}
+
+	spin_unlock(&pdd->dev->watch_points_lock);
+
+	return -ENOMEM;
+}
+
+static void kfd_dbg_clear_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	spin_lock(&pdd->dev->watch_points_lock);
+
+	/* process owns device watch point so safe to clear */
+	if ((pdd->alloc_watch_ids >> watch_id) & 0x1) {
+		pdd->alloc_watch_ids &= ~(0x1 << watch_id);
+		pdd->dev->alloc_watch_ids &= ~(0x1 << watch_id);
+	}
+
+	spin_unlock(&pdd->dev->watch_points_lock);
+}
+
+static bool kfd_dbg_owns_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	bool owns_watch_id = false;
+
+	spin_lock(&pdd->dev->watch_points_lock);
+	owns_watch_id = watch_id < MAX_WATCH_ADDRESSES &&
+			((pdd->alloc_watch_ids >> watch_id) & 0x1);
+
+	spin_unlock(&pdd->dev->watch_points_lock);
+
+	return owns_watch_id;
+}
+
+int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
+					uint32_t watch_id)
+{
+	int r;
+
+	if (!kfd_dbg_owns_dev_watch_id(pdd, watch_id))
+		return -EINVAL;
+
+	if (!pdd->dev->shared_resources.enable_mes) {
+		r = debug_lock_and_unmap(pdd->dev->dqm);
+		if (r)
+			return r;
+	}
+
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
+							pdd->dev->adev,
+							watch_id);
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+	if (!pdd->dev->shared_resources.enable_mes)
+		r = debug_map_and_unlock(pdd->dev->dqm);
+	else
+		r = kfd_dbg_set_mes_debug_mode(pdd);
+
+	kfd_dbg_clear_dev_watch_id(pdd, watch_id);
+
+	return r;
+}
+
+int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t *watch_id,
+					uint32_t watch_mode)
+{
+	int r = kfd_dbg_get_dev_watch_id(pdd, watch_id);
+
+	if (r)
+		return r;
+
+	if (!pdd->dev->shared_resources.enable_mes) {
+		r = debug_lock_and_unmap(pdd->dev->dqm);
+		if (r) {
+			kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
+			return r;
+		}
+	}
+
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
+				pdd->dev->adev,
+				watch_address,
+				watch_address_mask,
+				*watch_id,
+				watch_mode,
+				pdd->dev->vm_info.last_vmid_kfd);
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+	if (!pdd->dev->shared_resources.enable_mes)
+		r = debug_map_and_unlock(pdd->dev->dqm);
+	else
+		r = kfd_dbg_set_mes_debug_mode(pdd);
+
+	/* HWS is broken so no point in HW rollback but release the watchpoint anyways */
+	if (r)
+		kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
+
+	return 0;
+}
+
+static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
+{
+	int i, j;
+
+	for (i = 0; i < target->n_pdds; i++)
+		for (j = 0; j < MAX_WATCH_ADDRESSES; j++)
+			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
+}
+
+
 /* kfd_dbg_trap_deactivate:
  *	target: target process
  *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
@@ -305,6 +440,7 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 
 	if (!unwind) {
 		cancel_work_sync(&target->debug_event_workarea);
+		kfd_dbg_clear_process_address_watch(target);
 		kfd_dbg_trap_set_wave_launch_mode(target, 0);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 0d70f162d6d8..63c716ce5ab9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -50,7 +50,13 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 					uint32_t *trap_mask_supported);
 int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
 					uint8_t wave_launch_mode);
-
+int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
+					uint32_t watch_id);
+int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t *watch_id,
+					uint32_t watch_mode);
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
 					unsigned int queue_id,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 6e25238d18f9..ca849cd051d5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -641,6 +641,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	}
 
 	kfd_smi_init(kfd);
+	spin_lock_init(&kfd->watch_points_lock);
 
 	kfd->init_complete = true;
 	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 8dc7cc1e18a5..cfc50d1690c7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -348,6 +348,10 @@ struct kfd_dev {
 
 	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
 	struct dev_pagemap pgmap;
+
+	/* Track per device allocated watch points */
+	uint32_t alloc_watch_ids;
+	spinlock_t watch_points_lock;
 };
 
 enum kfd_mempool {
@@ -799,6 +803,7 @@ struct kfd_process_device {
 	uint32_t spi_dbg_override;
 	uint32_t spi_dbg_launch_mode;
 	uint32_t watch_points[4];
+	uint32_t alloc_watch_ids;
 
 	/*
 	 * If this process has been checkpointed before, then the user
@@ -955,7 +960,6 @@ struct kfd_process {
 	struct semaphore runtime_enable_sema;
 	bool is_runtime_retry;
 	struct kfd_runtime_info runtime_info;
-
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
-- 
2.25.1

