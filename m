Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C912C39D7A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABF610E861;
	Thu,  6 Nov 2025 09:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wOa8XbSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8E610E861;
 Thu,  6 Nov 2025 09:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoQ2bmpZ2i/a+9UX5otvn8SWAFn5X6eZHFhuXDWFSKsNsjCzGGOWd0XWKyrMlVaNazvTbndlxQ/9XcXq74xXw0i25bVmeXfURa9hN9D758bUkukL3P2iQ2edFfA9uM0WRK9p51+PaxIus/SPRGzmC+b5/N/s6ruNyGeUnrf8XrjqI6MpQwzObM/tskpEelwKkxE3KO6QdUHdV+aT22MFzVXVD/6FLmZHGiG2I/Sm5lMuFdb08qjxsSAyxV3gM5sumobmq1eZF3gcx9/5PAEzarKazeYNGMMZyLb5ZlkJ7MzOKmCBoHrj/2GQ4JGeJz3IeROIdEi6WDCNyynARSQRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xPMpl8VEA8QBzh65oO2lBWtlg4Tp/boL50io4vE8rw=;
 b=idm9p2ew8NDWby3D/y98ZzKZpvxC2XUVLbnxFbJyAN0cMhJ6X3jx2OGMejGuR1AM4VKzcr44iAc6ffdM9csV1zHFI287R5Jb7IcF09sBfcaXglTmxTd3eCQG/8xh7KX0S9KfQ8T7IQ5uR5pBHaTnWI67bpB/5PVGStYTZ05CH5RoN7s4f/NKPdjMzddiRQGH4b9N+3g0vHYY1NXteCf+EgFCR23g4QXp/z7wdZLnZnu5VKa1/29bAbOftPPmY9B0m3B240vJCXfCTmF/NZjvaN0mx6qmXzLnJzqHAi5etL4GNTGNU0VGyfsbCc1H6FuOhqyG/xYz0yvtflRt78QOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xPMpl8VEA8QBzh65oO2lBWtlg4Tp/boL50io4vE8rw=;
 b=wOa8XbSunSX7jruMaA+jhLWBD3xY/JCUnIt5PYUs2UOV9btG8IoZ+R65JhceP/lloFQeuOXL8ipkOXKCG75QinpFgE8KQVdjnlQF2JWDGxaZ62GEWHzVPMjdffZufvMCJKfzWtJR5tyZg9xUnU9kFVqtHlt05nT9gGxemYblKlE=
Received: from BL1PR13CA0353.namprd13.prod.outlook.com (2603:10b6:208:2c6::28)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 09:40:21 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::a8) by BL1PR13CA0353.outlook.office365.com
 (2603:10b6:208:2c6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 09:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 09:40:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 6 Nov 2025 01:40:07 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/4] drm/amdgpu: add engine_retains_context to
 amdgpu_ring_funcs
Date: Thu, 6 Nov 2025 10:39:25 +0100
Message-ID: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8b0eae-df25-4779-5a73-08de1d1880f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PSfD2bvi0Xl38K0kuFQb3lvBXEGoE+WJ+b274Q+INZMi6XJRUTur1LcvgoV0?=
 =?us-ascii?Q?XY336fIFBafto5cwEEtOT5p+kSL+hgD4YXwwUpQt2mwESoe7jzyBxVYZxyx3?=
 =?us-ascii?Q?IjadJIRFafNXzuQiKKRFPiZAUwlLR5EA1yzf8JRDIRVFuz5MZRvkWskZRepR?=
 =?us-ascii?Q?AAhOQylxfXFhFSY2H/jgU5tznPc1WAx+BEVoqQgQr/mZ3kaNq/yB0DtjupQw?=
 =?us-ascii?Q?rlalOL0S4RclTLLpAeforb/YT+u6dljMPJU15+uJO5LuFlawnsxAhONGsw2a?=
 =?us-ascii?Q?OLKI6HMTTB9Q2KE+YVH9cQg/gF5dGTOAAaCj96ragE49ZdlDGLU2McHiAu4a?=
 =?us-ascii?Q?q6dbEPk0OrPWZx2V23lJZhOkx8IvVYgMmJ099WNcP7HeiGSnnmgEm/GaiiJV?=
 =?us-ascii?Q?NKl+LRE4O8Zn+MSVXibT9tQd4vPX2nbMD5V49ZXTemh54mzzbPGb2rWUusSO?=
 =?us-ascii?Q?f7oAF1kzxXg6LuqRwa+dTc+FcVpNy0VoiB9FUorrLQuBw1fsQtlCI2re27If?=
 =?us-ascii?Q?aiZWpdtT01nse75NHHZ4ul640i70PbYbu+eMvWryQ0Fw0nULIjKW5PnHM8SM?=
 =?us-ascii?Q?dKBHy/iGZM1T8cLQzBPcM9BxT5joBQOPQZyHJtbWdbk/SGm46eT/Xxd9w7fi?=
 =?us-ascii?Q?NLGPrCXWAfpilueGbC7nzZU9oVNyAaMRplQ2e4Ph6hOaDJchrMp5nKLxQD4i?=
 =?us-ascii?Q?cuIU/iRTu2kNatlJ/6yqKGLo5uFDRc+cAb92fsr19r5wds6mhW9gMrci2f74?=
 =?us-ascii?Q?3BQT3/LG6IkIxfQRSfv18MANiTVOFM4dpyN/qtUojenpRvxffAqQTac+15os?=
 =?us-ascii?Q?0nzl0LasQdq4DZC6uBv62Bs9Na8KhqV212cRyaQR7raVjYOGtJ2/Nw95yCaO?=
 =?us-ascii?Q?vVsSpHBMCe/G+lJ0svq0YSEyWze9FzoRSs1x1aSTPeUtc0EdxnsqJ3Bicykp?=
 =?us-ascii?Q?FDkcutq1SNTkvJyqPUPFrEwjMC6samLvSmUAjULXztmVu85vQkrytMVjb9ij?=
 =?us-ascii?Q?0095v/t8xfERmKEJ1cZ7AOFa+5FngsQOtlGpAPgRFbTVyQbWoHf3h99hujjc?=
 =?us-ascii?Q?Fv0u/DC5DRvsrGMiOyjB0w7zC5SZfIIk9MWkgWvpYGSO5xo+vFZvksit0raD?=
 =?us-ascii?Q?xRlY52yAz1zgeTt6h/oMt5QciMiFLfreQTBSe0to5dGbgNQwmdPWGkRPDfzJ?=
 =?us-ascii?Q?Q8Srt+QjVVJLPloWt8b0uXrR68Wf0rhPb3SDe7rB48O4bboGTvcn1RWK6Z+w?=
 =?us-ascii?Q?ZXKZT+o1o6MxeAVKpJKZo71SVGxn84a9Bd63DWuprzvoqwgXflaj6K285ecG?=
 =?us-ascii?Q?rutaMHfefYx3slu3GsJpMQZSWCKZKRVdt2c9f6D4p1rtK3NqfNDimQiTgC3L?=
 =?us-ascii?Q?rIHJ7++1X5ppJ2byNH/S2Jrz8j5+mQPNM5AcPIjLoFPS9xwBPr620aKjt0tH?=
 =?us-ascii?Q?GIUf1fvV17oH6whwuidYjwiHRPjFEByvo1opTP7k4rV0yR8ffEyLCQhUhmdz?=
 =?us-ascii?Q?1jxG5N9oKtyqqau+8bEtHglOib8xpSrmCzCwpqum0pxep7E7RKeBxwg1dRsk?=
 =?us-ascii?Q?DWhDHVDjxvD3MYiqpjQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:40:21.2661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b0eae-df25-4779-5a73-08de1d1880f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751
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

