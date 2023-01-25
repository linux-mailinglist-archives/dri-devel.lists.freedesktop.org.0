Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5D67BB3D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EDA10E392;
	Wed, 25 Jan 2023 19:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352BF10E38F;
 Wed, 25 Jan 2023 19:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAXYK1rnU4Fi/0h51c/GN+SKhzJUxBf3SbOmEcTBf9WfQix4/NBr9IyGKTFaIx7VIEuW+lRxHIuOJArd/RxpfwCYG/9dOPBYZLvk2Bo5/xdxQP8ukDEI+W3wefNqS6HBJSRUW220EfLHpxjoKJh0Taw7bJ1YHIOK/Sl1tG5Q+NbThoEhElcadlwYA3AvU0ZOdYZyrg+NUR1IVmb6HOXwFdricodO6UKmtYi6gVzj9O+Gsa589RZKJTg2XRAE+yYW7q67ECl0Js9Noy5iJ7YKO7Hqc9/4YCftPBL0RM/8mqZJ3IGg3ezC/aMH4GKsM2HwpPk1zhH82LFeJukDwqQm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TibBQ8VcHzNAm0R5GQlm7S/xSBM20zKjavGHvULlAbo=;
 b=lGQa6qj9058ARWVHrOeXWdtqIOEjSgJu1cwRQfdJsfglqW2ENoqpL1VvbaGbko/aKWpNoRsowItneCOFLIO/wZQNmok+c1ioZlyngCX/i3G5oS5rqGRabcBV6k8C4Pextll3MxMgPFQBUQJ87Xbm9zHmJRnd77TfwcmZ/94u896LUFgaNL/rOMZQ+nH6Y2OaSIWfxK7Kv4xeNjbyvirzDrIPxq75+yKF06A4lSVjphSH8pAkXvysg3onL7RIVfCF+U0VUVCwzuUSXWUxKOPccPkPraQcEGdR3jMrrtZeLrNdP2i3faVpLnvEyP+mBY3rFNjeovXh5a4+LQln92NvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TibBQ8VcHzNAm0R5GQlm7S/xSBM20zKjavGHvULlAbo=;
 b=jJcga1eRYiKaMWEPUUmf6/TAFvHKJnElXvcIoreKqK7nGQ36CCVq3yZOdcyflaNNTKwxqO7Ekqsnui4BRs6+05YU/lBX/M1xWhhBn/kgB9G1VVa0wq8eVDfZb6/0zV2HIKpZTR76Qz7qW6/5g4KhMbX80qM+MsLjypvFRvej/w8=
Received: from BN9PR03CA0786.namprd03.prod.outlook.com (2603:10b6:408:13f::11)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:17 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::f1) by BN9PR03CA0786.outlook.office365.com
 (2603:10b6:408:13f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:17 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:15 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/32] drm/amdgpu: add kgd hw debug mode setting interface
Date: Wed, 25 Jan 2023 14:53:33 -0500
Message-ID: <20230125195401.4183544-5-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: f8461697-5e52-4e4c-e4d2-08daff0df12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUxPsQISf9i03dXpVDwLTSeIPp1dCaWXswyu9ygQoHxa/Lz1kPoM2EOA9wESrAV0ayGBDURdZMwhgtmf0HJcAdGXlpOW8H4qq8xAWXsHo6IKi/2bX8GqksTo19RR92jQ+uNhcm6dhmZEinSRDx9jTpLBKKvl6ET84l0pdU4HhHejZLsZdcTVCxgtUQMjZ+gGbXLb4tJjH7F8f88hVpoD4IDHlsopAkYiGeNWPOajHw+tNwEZortzCIH9GGK81kPBgqhUF5JQuruXbtl/ZAmbjznTRN/f9WL381bRe+l58KmDNFyEzKbX2mIgsL9FlzJsANmv1S0BTXJ/6vB6bpDxBebHfZdjYmfCVG/k4TbgcisVXZxq6zbglzznvJvG/4DCkR5qU9FKq2LxD59i2W9+oqw+rJAHdCsC2kHeba/xANP9vx66u2yQH+rvmuZrN+bNShWhMilBe0RvQGbcOcYGb4xdbr+Tnx7D35oWzG0Ypt2WAfk/I+ODsPntI/61Py1JPk4v3k503+8Uki+x2ZFCdx5HOOYyipbwxFG/0vGOwLx1gJlsn9udzTg52Tb/soKnArSFCnZCDSVoYOG8wO4fVJuSj1uG1E8ZT12gSwjH2M8qc2dA03oEsC8U9SQY2/95KLW7uAEkoGyFr5aqlE2W2OIAztNzh8THG3gV8V2G7pLDjXS9EBn49swX8KXmDWO7LgUgzgqngiXmqhAwJNToScdv9XXq50yXDqrC/Fk2qTU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(426003)(7696005)(4326008)(70206006)(8676002)(81166007)(36860700001)(336012)(54906003)(82740400003)(36756003)(86362001)(40460700003)(82310400005)(40480700001)(356005)(316002)(110136005)(478600001)(83380400001)(70586007)(2616005)(1076003)(450100002)(16526019)(6666004)(47076005)(2906002)(5660300002)(26005)(44832011)(41300700001)(8936002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:17.1917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8461697-5e52-4e4c-e4d2-08daff0df12e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

Introduce the require KGD debug calls that will execute hardware debug
mode setting.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../gpu/drm/amd/include/kgd_kfd_interface.h   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index 5cb3e8634739..15e7a5c920a0 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -289,6 +289,40 @@ struct kfd2kgd_calls {
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
 			int *wave_cnt, int *max_waves_per_cu);
 	void (*program_trap_handler_settings)(struct amdgpu_device *adev,
-- 
2.25.1

