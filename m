Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD2711236
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18C10E6F8;
	Thu, 25 May 2023 17:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B610E4B6;
 Thu, 25 May 2023 17:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq0fpbQl5FeM7oWUIgrvRWs9sPcfEnRONwg52kh3xO2FZGwjLRcOJtafVoH35lFkTIjqGnxaVYKbx2THFJihI2thBIL04QQbyZ3bDOtl87GsOXwvJOM7L0IY+LDknVz3FOrEZ1n29xxtiPoT3anQivXX8TknmOBr1JRgqh+Ymoo1bzPuX7rIuBVMS/+0qJEVo7V167Z8oHJCDppGQS4i5oqpwNcQT8ggIHjMQSvfHFY9Tw5jNhnF0tBeXUudd6J23HYvOhe+OiFWZ9NNhhlSJabfIeD0EjFObXwQHO1FIfTDtPJNvv9zTASuWbq7ZlZxrUlTxFlAD8TczXslYb8iZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK46yfMdQU9cSGG5XTeYlLlC1LL/Fr0B9RmGa0nf7tE=;
 b=OkS8sJsdxcLh7307jgPD7Ni3dyjuFgEBZF/SaZKNWIiB9ORq2ou2dBJxaeZMyGPGzVaD3ZcWwhTSOjFPeYNeov6vO1K/6Cr9zMUf5yhOjQwj51kDTZAug7QfMgDyM0Vvc6EM0uREOSCsPS4+8IxAdEobAIjJprM47yuiDc31Tj0/CGwwlviWoUApMJ5FleN9GC5xNaRVc0SKHj0PpHy7E4AVaiMs+U9cQ0kb5DDFByvCDrmHrdYXBKB3qsyi45t1QOH76aDGbD7epg9rkBQAt5rPWURdDfMSDOMIW3xvwnsN8wrH6144AqTpAVnWxb0p9adSINOyE1Rl+X3NZOKaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK46yfMdQU9cSGG5XTeYlLlC1LL/Fr0B9RmGa0nf7tE=;
 b=Bb3YlzV5vZDVcKw8MFF+UnkFQL3tyi/U/8RSr2/BYwpno8BlX4syHGkPaSyc5q6D7YiqcPc7eXWJsx/OIf1jt1wPjaqCcbR1FenbCTAcxPN3MbIDtvlpcY67DBKggdKKa+NRSnvBAVe+/hQOJhZuQdYnzhZAN9sN+VHATAFKCW0=
Received: from MW4PR03CA0138.namprd03.prod.outlook.com (2603:10b6:303:8c::23)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 25 May
 2023 17:27:57 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::1e) by MW4PR03CA0138.outlook.office365.com
 (2603:10b6:303:8c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:27:57 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:55 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 04/33] drm/amdgpu: add kgd hw debug mode setting interface
Date: Thu, 25 May 2023 13:27:16 -0400
Message-ID: <20230525172745.702700-4-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3590a8f7-0315-48a8-7a54-08db5d456174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPlUzWExIBtYj9UodnoR1hpSiiz9p0LbRfyh+ovjqb5pqD46gfvvTTtMuVpkOJARJhO7tkqhPEA6bA0j4wlCxw4j3aymzhchURr3zfST201vVhG866pmkF+QVQ84ji5TcP/I7Rwl/HrJ4hoSUV4Yp8PNDHqPOSHLCu+ph5GHdTwRlUmch4mnCrKWMmENqp3T/vT+Dd+GbmqLPQ6o2ydsDeYbvZ8102EXVfJC/Gw83q9nVWazHHjiawspBq1Y0JE8Vo/MPuOfrSMhGpKe1/jYtklx1Gow5yPgt5fwuW8yQgAo29G3Rq9KnOUxSKQrQzlqpDOMCsUVZze+4gtwlBlZJvKT633YtXPXTJvZu9kZUfpPhaUHIs2o0M4gOLxYJDbeCTcVU1DdcbavGlO2bhUjm/VX5oriCC7Ix2ZslI6ku061jV7YAvG6k8JrgvZbbst3qDsmQBNStB9EADyNJ4OIVVDneuD1pTmyk2H5r17uPsSCH0IdoPv6Uijc9U/P+uVM16hE5vDhHHnS8I5QkK5dCaJk7OG+gkTYfFjApZrOyvJKl8y9r8f/qhSKCA0wtmZWDlOtohWGsvY7EKyyD7tJAQ2ENVuyqZjzaHAzk4F4CSmQ++effyOqhZBr45laNmkmJKue+jM3rjtGLt7NSQ48KXvV8h1TDhMJUHK/Uc7x4BGtRDbT0GTj1RK2gmrxO53tvWQsoQi7M+Gs5CIplw5gtLay9kAi2Xx0HFIORkoZY/1OuOdNHZJs6JA+u9+bj0x/md88Pb4SkGKHkf08kcnFgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(47076005)(82310400005)(2906002)(40460700003)(41300700001)(36756003)(8936002)(8676002)(7696005)(6666004)(36860700001)(5660300002)(44832011)(336012)(40480700001)(86362001)(450100002)(2616005)(426003)(1076003)(186003)(26005)(82740400003)(16526019)(356005)(6636002)(81166007)(4326008)(70206006)(110136005)(70586007)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:27:57.0801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3590a8f7-0315-48a8-7a54-08db5d456174
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the require KGD debug calls that will execute hardware debug
mode setting.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../gpu/drm/amd/include/kgd_kfd_interface.h   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index 8cb3dbcae3e4..d0df3381539f 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -291,6 +291,40 @@ struct kfd2kgd_calls {
 			uint32_t vmid, uint64_t page_table_base);
 	uint32_t (*read_vmid_from_vmfault_reg)(struct amdgpu_device *adev);
 
+	uint32_t (*enable_debug_trap)(struct amdgpu_device *adev,
+					bool restore_dbg_registers,
+					uint32_t vmid);
+	uint32_t (*disable_debug_trap)(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid);
+	int (*validate_trap_override_request)(struct amdgpu_device *adev,
+					uint32_t trap_override,
+					uint32_t *trap_mask_supported);
+	uint32_t (*set_wave_launch_trap_override)(struct amdgpu_device *adev,
+					     uint32_t vmid,
+					     uint32_t trap_override,
+					     uint32_t trap_mask_bits,
+					     uint32_t trap_mask_request,
+					     uint32_t *trap_mask_prev,
+					     uint32_t kfd_dbg_trap_cntl_prev);
+	uint32_t (*set_wave_launch_mode)(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid);
+	uint32_t (*set_address_watch)(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid);
+	uint32_t (*clear_address_watch)(struct amdgpu_device *adev,
+			uint32_t watch_id);
+	void (*get_iq_wait_times)(struct amdgpu_device *adev,
+			uint32_t *wait_times);
+	void (*build_grace_period_packet_info)(struct amdgpu_device *adev,
+			uint32_t wait_times,
+			uint32_t grace_period,
+			uint32_t *reg_offset,
+			uint32_t *reg_data);
 	void (*get_cu_occupancy)(struct amdgpu_device *adev, int pasid,
 			int *wave_cnt, int *max_waves_per_cu, uint32_t inst);
 	void (*program_trap_handler_settings)(struct amdgpu_device *adev,
-- 
2.25.1

