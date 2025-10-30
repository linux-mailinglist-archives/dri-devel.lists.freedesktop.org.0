Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF0C1F33B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B7D10E8BA;
	Thu, 30 Oct 2025 09:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PPSA4cyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C9810E8B2;
 Thu, 30 Oct 2025 09:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qY25iiBFEpl6veGQ9i7bdjGF3vYrAxLVlLtYHFXFSg5Y90IzHBWoR1/MF+/1ajQXF5l0MQl9szszvTe9UZMSfVy7yrqMZanZ2X2JHq44M0qpOPYEG3xXt/SCyhQ9IWUhA6FlKVGQttZdPvkNKOp6valL/qF5k2zBI1b1f9aGHoStt+9O7cTvbQCTasGqFtkWwL+G6Dx/bLLa9g93X9edrXWgs7aXEE9Ei6uPt58DN/Jv8uvlJTb3zg01/l9JwejEZZmTFaXDEOoBXhwzyGw0S43hiU2zhtoVAp80b114+VzpPkJv+QoyYEqEBTCurntY34XQ7DbIO8sqBMl0a7bTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xPMpl8VEA8QBzh65oO2lBWtlg4Tp/boL50io4vE8rw=;
 b=lMbP4k5fAybujqbBdAjZ2GqoqfShTrjsnH2dYICrSYjKZodFcu8nO5olEwI4xkN7w+Z9ZhxRkzLNowmtU/rA/RDVqFqp9nrt/7UZEgnO++NslLSBNoOhEOJDrfx3g4BJzeZVNdBMK3jpgLe04/OW8X0PFqUUfah2GUvtMw5LAGkQeF1mf9iWl55w5lBKvCYa92iicauC1m18gkSTT8N7onnMtkdmI4J6y3bfHYfbuWvCRZW/DNC0qRjjlZTDUSTlMEwjmLYLbhvQvSEHwh4k0vqRjlv0+xTHRnRBTj87ZXZLUWWgygS4D00KLR9JSMKmS+OqpB7BAdwXNSZS9MusMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xPMpl8VEA8QBzh65oO2lBWtlg4Tp/boL50io4vE8rw=;
 b=PPSA4cyHAuaab+Cey+CMpuER5Fao6EbODggTcHIJ0sF5iL/T5GXIJHYjbKwhtlbaMN1HP8XFG++L+fY+tBzmnp8DGfA3LwNDqlhQd+L2o/0yEb++8DsIOhTNQ5SbeesJG0HbXnBXIEXIfyf/xBQUNm06uMoONWOReLp472YO5oI=
Received: from MN0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::7)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 09:11:38 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::26) by MN0P221CA0001.outlook.office365.com
 (2603:10b6:208:52a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 09:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 09:11:38 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 30 Oct 2025 02:11:36 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] drm/amdgpu: add engine_retains_context to
 amdgpu_ring_funcs
Date: Thu, 30 Oct 2025 10:11:11 +0100
Message-ID: <20251030091118.4864-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: e166637c-7708-401b-dd5e-08de17945505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aTlXEdBA4llzMEbhBlCnoD0RfpNYFHAS6UtZnphnAAge+cswvWie/Stbpp+B?=
 =?us-ascii?Q?SPZaHvMbGdBNOEReDPEAwuDxVutouTGn0Nj1v4BvWIdP01ZAcoJGkMXCDwNz?=
 =?us-ascii?Q?U3IFExE5Oe2cb1c2jXTCvM8pmOaG2DmDnhCrx/T+8hP3WgBL+eQw17LUj8YI?=
 =?us-ascii?Q?guEQECTq1fdZlK1p06tIVa5NicgeXsi71/sdHVrG74b3zwMThqaCKB9g/qP8?=
 =?us-ascii?Q?5IKYiCS6FG6EbrsLW0AqRo9/hn4BI+iwBbDakLCAziOiPC+Fpk+ShYTTjGMY?=
 =?us-ascii?Q?AFIlYxiVItn4TGiK0xcsRf5O1d6C0ZV4O2q7+CxtxLJRyG2qPwIRmGp+wqSd?=
 =?us-ascii?Q?RibSPECMoP7Hhb8fzL2/8MrUM5WLqum4QGKDPBq2QkveKDFQw5ldfxc4CiKY?=
 =?us-ascii?Q?r/1P04Vf88Mx8OWGrHvcrYwXy3BRzk1uygQFHgwqysyjQr1sEtbIOTlxUNLT?=
 =?us-ascii?Q?qNYqW4m5wpfKB5x565UgDeeQ+tviu/vNSY7lsPARYLwOf7tG6CN9Jd0dpcuT?=
 =?us-ascii?Q?mEGZ+qGJqOjxCVQLElr/w0EcYNGEYrgc9MmjWhAUuynBnS1WLDulCJTXY7iI?=
 =?us-ascii?Q?tTP6UY6SKT7SyMLYEDJlIz0wwO4SPu0BiZrfkmW6BWU6vZ41PivqDJl0gavS?=
 =?us-ascii?Q?Houqu8n/sKcftvTgKqzYhgIwECHQbT6+b85hB68yByAgSox87Ot734OFlrXn?=
 =?us-ascii?Q?jUDhMkju2ioqU86eQqGQdeIPjkQIy3U4ebYYev2a8zrjSpBnMWKU1RtUYUz5?=
 =?us-ascii?Q?UivMNOvU6ov2H8bJHxh7LSr+gI6mU02FjTV8RCy8aGrGD9bUpMaTA7toOoxp?=
 =?us-ascii?Q?TFOhK15dPJOt3TMLXjPIzLqHAaUQG97R2rSHYxYv7k5sn3bseAG9unbbpSt5?=
 =?us-ascii?Q?W3wbRLWhbFG/XDwu0Dw3tTZCHzwszu7E83wUhYicQV+dTBqzFBg7j8GlJnF7?=
 =?us-ascii?Q?o+dYLTVrfCmkjc9rhZdOrzgZavxvMP6PosVXvAfRBHwz6TXgOWx69Rpt49Lb?=
 =?us-ascii?Q?TewhADFZ5msFFV94T62hfucQBXw1alELmQoVP5Nqrz4nFG4VznIhfvgQ3SgB?=
 =?us-ascii?Q?kbnt4/wMaSOdv0EDpTu1NI1GAud52mQQpNFrAsClVw/GOUdRHbE5us3ZyTqp?=
 =?us-ascii?Q?kh/x7M+Kh6HCXC51G6KxbsBb1JozfgXiuios4XtnjqiWejjZ6wm/wVAWqh+4?=
 =?us-ascii?Q?NgjXbZIk5XbmsDO/GkHnSbXQh5vWFUb356V+7Z0XjfyK9nht9VX/XIPd9XPF?=
 =?us-ascii?Q?9z0BMttadJg+WwOG8wAQh2vjsIe3JuLzQKzUZ2TBsa1yMz8ALNJ3CipXYjpg?=
 =?us-ascii?Q?hFN+pLeTQHdt3hUnIMqAMF0FrnzRYK94SgGND0gkIQ2a/dnuxqN7vdsCNso5?=
 =?us-ascii?Q?WaDL47Psi0EZ1qgyoBwfvh9JZaXEhsKTwTKUCHRH7V6NJ8W8f388slXvFXtr?=
 =?us-ascii?Q?86qJBBgGNMSTtofc0clF8jCprlFT1PvLSP+IOVGnwQ6OTxtrqZHym/lXE7wk?=
 =?us-ascii?Q?k520J24+sRGrUYi5Eh1Hx9p1dDwETJLPHQXI7T0QoTJODyJw2cremHmeW3zq?=
 =?us-ascii?Q?X7NazOhX0k1KJYCFVYU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:11:38.1809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e166637c-7708-401b-dd5e-08de17945505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If true, the hw engine retains context among dependent jobs, which means
load balancing between schedulers cannot be used at the job level.

amdgpu_ctx_init_entity uses this information to disable load balancing,
but it's best to store it as a property rather than deduce it based on
hw_ip.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c    | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c    | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c    | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c    | 3 +++
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c    | 3 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c    | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c  | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c  | 1 +
 15 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 4b46e3c26ff3..a10efac2fc54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -211,6 +211,7 @@ struct amdgpu_ring_funcs {
 	bool			support_64bit_ptrs;
 	bool			no_user_fence;
 	bool			secure_submission_supported;
+	bool			engine_retains_context;
 
 	/**
 	 * @extra_bytes:
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 2e79a3afc774..4a85b5465bb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -181,6 +181,7 @@ static const struct amdgpu_ring_funcs uvd_v3_1_ring_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v3_1_ring_get_rptr,
 	.get_wptr = uvd_v3_1_ring_get_wptr,
 	.set_wptr = uvd_v3_1_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 4b96fd583772..e7c1d12f0596 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -775,6 +775,7 @@ static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v4_2_ring_get_rptr,
 	.get_wptr = uvd_v4_2_ring_get_wptr,
 	.set_wptr = uvd_v4_2_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 71409ad8b7ed..a62788e4af96 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -882,6 +882,7 @@ static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v5_0_ring_get_rptr,
 	.get_wptr = uvd_v5_0_ring_get_wptr,
 	.set_wptr = uvd_v5_0_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index ceb94bbb03a4..0435577b9b3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1552,6 +1552,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v6_0_ring_get_rptr,
 	.get_wptr = uvd_v6_0_ring_get_wptr,
 	.set_wptr = uvd_v6_0_ring_set_wptr,
@@ -1578,6 +1579,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_vm_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v6_0_ring_get_rptr,
 	.get_wptr = uvd_v6_0_ring_get_wptr,
 	.set_wptr = uvd_v6_0_ring_set_wptr,
@@ -1607,6 +1609,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_enc_ring_vm_funcs = {
 	.nop = HEVC_ENC_CMD_NO_OP,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v6_0_enc_ring_get_rptr,
 	.get_wptr = uvd_v6_0_enc_ring_get_wptr,
 	.set_wptr = uvd_v6_0_enc_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 1f8866f3f63c..3720d72f2c3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -1539,6 +1539,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_ring_vm_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v7_0_ring_get_rptr,
 	.get_wptr = uvd_v7_0_ring_get_wptr,
 	.set_wptr = uvd_v7_0_ring_set_wptr,
@@ -1571,6 +1572,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_enc_ring_vm_funcs = {
 	.nop = HEVC_ENC_CMD_NO_OP,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.engine_retains_context = true,
 	.get_rptr = uvd_v7_0_enc_ring_get_rptr,
 	.get_wptr = uvd_v7_0_enc_ring_get_wptr,
 	.set_wptr = uvd_v7_0_enc_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index a316797875a8..1691d0f955a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -2117,6 +2117,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
 	.secure_submission_supported = true,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v1_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v1_0_dec_ring_get_wptr,
 	.set_wptr = vcn_v1_0_dec_ring_set_wptr,
@@ -2150,6 +2151,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_enc_ring_vm_funcs = {
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
 	.support_64bit_ptrs = false,
+	.engine_retains_context = true,
 	.no_user_fence = true,
 	.get_rptr = vcn_v1_0_enc_ring_get_rptr,
 	.get_wptr = vcn_v1_0_enc_ring_get_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 8897dcc9c1a0..046dd6b216e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -2113,6 +2113,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_DEC,
 	.align_mask = 0xf,
 	.secure_submission_supported = true,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v2_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v2_0_dec_ring_get_wptr,
 	.set_wptr = vcn_v2_0_dec_ring_set_wptr,
@@ -2144,6 +2145,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_enc_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v2_0_enc_ring_get_rptr,
 	.get_wptr = vcn_v2_0_enc_ring_get_wptr,
 	.set_wptr = vcn_v2_0_enc_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index cebee453871c..063f88da120b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1777,6 +1777,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_DEC,
 	.align_mask = 0xf,
 	.secure_submission_supported = true,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v2_5_dec_ring_get_rptr,
 	.get_wptr = vcn_v2_5_dec_ring_get_wptr,
 	.set_wptr = vcn_v2_5_dec_ring_set_wptr,
@@ -1877,6 +1878,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_enc_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v2_5_enc_ring_get_rptr,
 	.get_wptr = vcn_v2_5_enc_ring_get_wptr,
 	.set_wptr = vcn_v2_5_enc_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index d9cf8f0feeb3..8dcc07b3f631 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1857,6 +1857,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_sw_ring_vm_funcs = {
 	.align_mask = 0x3f,
 	.nop = VCN_DEC_SW_CMD_NO_OP,
 	.secure_submission_supported = true,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
 	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
@@ -2021,6 +2022,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_DEC,
 	.align_mask = 0xf,
 	.secure_submission_supported = true,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
 	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
@@ -2122,6 +2124,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_enc_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v3_0_enc_ring_get_rptr,
 	.get_wptr = vcn_v3_0_enc_ring_get_wptr,
 	.set_wptr = vcn_v3_0_enc_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 3ae666522d57..f1306316dc3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1977,6 +1977,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.extra_bytes = sizeof(struct amdgpu_vcn_rb_metadata),
 	.get_rptr = vcn_v4_0_unified_ring_get_rptr,
 	.get_wptr = vcn_v4_0_unified_ring_get_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index eacf4e93ba2f..5a935c07352a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1628,6 +1628,7 @@ static const struct amdgpu_ring_funcs vcn_v4_0_3_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v4_0_3_unified_ring_get_rptr,
 	.get_wptr = vcn_v4_0_3_unified_ring_get_wptr,
 	.set_wptr = vcn_v4_0_3_unified_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index b107ee80e472..1a485f5825dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1481,6 +1481,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_5_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v4_0_5_unified_ring_get_rptr,
 	.get_wptr = vcn_v4_0_5_unified_ring_get_wptr,
 	.set_wptr = vcn_v4_0_5_unified_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 0202df5db1e1..2d8214f591f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1203,6 +1203,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v5_0_0_unified_ring_get_rptr,
 	.get_wptr = vcn_v5_0_0_unified_ring_get_wptr,
 	.set_wptr = vcn_v5_0_0_unified_ring_set_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 714350cabf2f..bd3a04f1414d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -1328,6 +1328,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_1_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
+	.engine_retains_context = true,
 	.get_rptr = vcn_v5_0_1_unified_ring_get_rptr,
 	.get_wptr = vcn_v5_0_1_unified_ring_get_wptr,
 	.set_wptr = vcn_v5_0_1_unified_ring_set_wptr,
-- 
2.43.0

