Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95406CAD6C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343610E3D8;
	Mon, 27 Mar 2023 18:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9A10E6B2;
 Mon, 27 Mar 2023 18:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITuiTdso+VLx/y48R8mWHdbnqRyJRGBtJRv07GRUdvd1eSQAgqEfbMI73Y/LRnSuYO0TuNqq1w78vldg+wEeAm8nrRGRMXHGFFj4n32RnDHSYf996ECaIUHHmjmfK1+rQKZOrRODLMuelLGhQVI+1sVrTgooUo5vqYQze+N5Cj4t9Du2BQFF051t6EvU/2r+TjeBxNqUY4BvQF4OG0WpLNOC9Ghu90eKSIaPKeGH8fsmW+fWtQgc7p82Tm5625nfXx3wAVg+lXYcHAJQC3noor9DG8JRdrFlL1Lqfkev61oGTgL2v+JIYkYSIDB1S0S6YCYeTHYJwfItEcKuGa2EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TibBQ8VcHzNAm0R5GQlm7S/xSBM20zKjavGHvULlAbo=;
 b=OfTSfGNqcnrvpq/DgWbtn/qJcVgQJjHFel7yqrkyiuLqxyXfmV7rFoGpWfYmzlopS4W1sbentmmN+ipfVsY+u8McFI3gxUytVWscWESZ4LoO3dLvMadDOouf9TjF9UCtIPIY3nbwC6dqHmxD3SAcvs7EDuEjNINPuVEvapp+AqTCwW7mRnSW2DXrQPJb0BmarSFjzwoWQNqOTClhyQMJFjzNQW5tlNmHXIor1w+QalBNUmSsBvlzWl3q9i/c8R4N++CXGTdGpXpFphf2zDIcno/RjSVMEWget5FtzKMdt67TwKQt3zIcCMCRZlL3lTKS/Fo/7u7mtSht5r21a9hV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TibBQ8VcHzNAm0R5GQlm7S/xSBM20zKjavGHvULlAbo=;
 b=2pnwwb25TQllJkfjRGa/fz7RQdP0uVdM0VlFtT1hfIP9gSJPiTEuo5471tFQ5r/YfCf8pT8FYOk3q6lJeiYRyhEGSLuNa+gju5g1qjeCuJspMLN+eW/RcjnRNxyUBybOc0QjoyvN5AjbSxcJF5L8ci7coMscg0yKUudyZ3LcKJ0=
Received: from CY8PR02CA0005.namprd02.prod.outlook.com (2603:10b6:930:4d::9)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:51 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::56) by CY8PR02CA0005.outlook.office365.com
 (2603:10b6:930:4d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:51 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:49 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/34] drm/amdgpu: add kgd hw debug mode setting interface
Date: Mon, 27 Mar 2023 14:43:09 -0400
Message-ID: <20230327184339.125016-4-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b64322-e449-497d-d250-08db2ef33581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lsCrSdNMLdwFPuYytVqkexdKN/9MrQVCAAxAnXMu4tK8gTfOPP/NWDeeIM87hkBJdLR4EyY8SnY8n7vKQ3b0oDoz+IpkxwMYvOI7CnoJjhxMmkpoNfH7bfZg8+23hOdW3amLvZaKuCvqXCYQaeVJRdhLVKZj29GVq6jQI8UYeAA3Sq3wku7YB1fq0hmyIycEDxqLQsAEkRDVtALN+k16qCzdh0FDig6Svaf4JXY/m6/Vk/nkBXlTU1DoIjBsiTjyLhbjXyplRWDeLYiKc0oF+Po6eEXio8wtxqD3eXZLnc42NsJb8F8m9jQbCcpgjuC01jFhAPUWkfFJhDbgc2Yql4PEpwmuJgNvONB2XCbpOwNLa0nr62tyC0pp0jAo9+Sx2Gvao3gNyRJN2y6XW7u5Rdwz0kRMAEyq0LlABxDhg1xQjWqeaCeBqUxyc9A/SSO57TXHhRiET9nywvab7uvy39cWlMR59MBK5i2iMfUd+PdynCyJPrtfAp5VRt0Z036qKpUfyKiqUQN0w5JcXxBxTRqjX8eWn7+hJ7GyzWJo5u7c/va3TGXioC4WWHjtmkD7WAvkXyXwxU30NbfXnQdpZ85Xb2JdR4E9pRgp0NmAgWQ2YMKOIO6MKWEksYHg/fKcIEW4cpWQfO/XYsHvDzi83q+pzzzDgKJxvIg5cmgJOfsP8QSbyYBih1mfxM4vY2nOXnIF8UYhGI0T0lDdDH275rOfBC4XpTqPFiNSBzXFFs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(26005)(40460700003)(8676002)(4326008)(110136005)(316002)(70586007)(70206006)(36860700001)(5660300002)(41300700001)(450100002)(8936002)(54906003)(186003)(16526019)(81166007)(82740400003)(47076005)(7696005)(2616005)(426003)(1076003)(336012)(83380400001)(6666004)(478600001)(40480700001)(44832011)(86362001)(356005)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:51.1594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b64322-e449-497d-d250-08db2ef33581
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
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

