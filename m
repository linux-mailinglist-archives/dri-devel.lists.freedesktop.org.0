Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBDB41E52
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E33410E7BD;
	Wed,  3 Sep 2025 12:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="okuphiP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013000.outbound.protection.outlook.com [40.107.44.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19BB10E7BD;
 Wed,  3 Sep 2025 12:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnECnru3khx+gu6SuIVyWCI9lGy26hvtBkhHBRlh48eVaVfAempwY2m2juq1r+OHy1L8bwP5DNLS892+GdT5AkYjKftdVoZUW7oVDK61uy/Vqa12lCiGX+acYG9QcLLASs378usEPGMx3B9UzLKvrChrXctv80F5IWDUasJLsIyIFVSWupADruFTuMVvlGnH3eS8OpGLxq9GN8XaO1irIG8rIWKjP8TjTFUbLUBUTdxkSgoGLxIy3oXbbHqU2FiYORw/xzygPy5vw9lBs19jWdpTUF1U08bswGM1f5YWPfJwboYSAKi02gBBzLMbua8hb0kt+HiTuelKhGzQA3RYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui92/Vy4Xlx3iRYyXC4VwAmy+CnVhQhHtXuMfsYSra0=;
 b=Urdm1QfFC0/gGanz1Q1u1qIzChvGBAVhp0sM94ahYDRE0r4ANzimBUTBSHbtTvCuGb+s8l7TcY9nlSm1aiTAhz9/LhBNtmjssAjdUH9V+Fy3oGW7zU5W4iME+c7FgCzYr8D8jmj9BqLlz+vI3ZndzRwZu9ricZj+is6QAvW28+1JnUcj6OQR0q61afX8c4+WyhjEf02gSr3R6u/UPSiQn45t0ERHKSkk5d4bHcikfUyaWbY9zNaUirc/7qzy3NyqlUcgAuOsqMPdzC62VaDMlGTFvUzBuJAAq/antE+L7UIrixOePYgmvhutVgGRAs2lEL2gHTqMSzoCsr/nyW2RYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui92/Vy4Xlx3iRYyXC4VwAmy+CnVhQhHtXuMfsYSra0=;
 b=okuphiP0cjjJv0whOJyZ7VkGALT+akkdNlZhV8nB/OL0A7FqDCtqpRJMzokaa0qeoQF3wnYBQ2F3PBBRR8h6FpmpqrHcemFuAzVslgH6Zfa80ajJzs5aHuXZcOkn9jCMYfPnAsmOLHkqWipiAIBDwAVmER7C3VsD1yM1DGoeKwVm5wy8S8SMKSXGM3fvLkkiWjEHSGZM0Wkgm59yeUV+2szeHH9cfycdOjtZpF06Tb5rtlJ51ZlTA7RppG/uKGkJcZlHVec5j+o7oQoX7Ur4LYSDqV6DO/mTG6ssSUcNDZDcYMbuNEB+VpAz/voOxUf712Cu6yzbWR1BFP7QcgW1Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:06:29 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:06:28 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>,
 "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Leo Liu <leo.liu@amd.com>,
 Mangesh Gadre <Mangesh.Gadre@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, fanhuang <FangSheng.Huang@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 5/6] drm/amdgpu/jpeg: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:49 +0800
Message-Id: <20250903120449.380087-6-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903120449.380087-1-liaoyuanhong@vivo.com>
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY1PPF568C2A376:EE_
X-MS-Office365-Filtering-Correlation-Id: 40423649-902f-4162-9e83-08ddeae25000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4kmdsFN+cJqhbukkoKSRQsFEB0UsC8HluFw/gavlPTRLO9SD09qyMTuKAT13?=
 =?us-ascii?Q?wgbzHY/sXbVeSy04CTqJos8EqoeGHqoCpLI0ecBlpzwl9/xB6iEjeBrlK9QC?=
 =?us-ascii?Q?XMHVvelw4Up2G4pEYUlrsRaOV6LzMCiUnJhhIk9TPyUUon3VytpKoyZvz91Z?=
 =?us-ascii?Q?yhFYoqr7V25YlP43PHq+hSZe2zvie1DEfRZTKwQVkWdCXdQfmuMUdujcylm9?=
 =?us-ascii?Q?n6bEGGrOM8Ov/f59DPJi/1B7eOrFZTmn/285oVGqdyUk2p/fZtk9HLWqgAur?=
 =?us-ascii?Q?lEzgi31LAS7pw76hvquuN1WNCTDfoXBvfRQ3+O51SK3pssQC4TNXFeDGx1dT?=
 =?us-ascii?Q?pZxxPdzEGWVXnkmDDfXJcqPtjHSK0djMNxnfknViZOMQtKWEay9nEAFgJxSp?=
 =?us-ascii?Q?KREz3RRu1dSAkCgwIgH2rtRnjwmxjXvxz4yBxhS5N73IAS+03nJCmDiuhVCo?=
 =?us-ascii?Q?tSj/hsLcAjWl2rpK0GXLtRN8+Uysz9WHrfP2EvUMPOGx94Op3lGua+qENzhp?=
 =?us-ascii?Q?DRcNP24m9tXRkLY7Xdq9/OqHbo/VphTapgydhDzh5E2xfmg5/ESelA0dDMMz?=
 =?us-ascii?Q?Q2Sjn/KpnMAtg+J+34DNZGMSz4BavhC1BF7B2D9loHf60XZY+Lovik2A5t6y?=
 =?us-ascii?Q?vfLATWtjGMXeqTxbuHzBhx9+eZVysTKHnNMpO6hJqjb2h03wVGmc2l4uZk9U?=
 =?us-ascii?Q?99q0l9O3/4mmUVie/cqNBFwl1oZWiY9zhAztPk0PTVCwY4yi7ekeNrSm6VlT?=
 =?us-ascii?Q?tSwOmIom+zQDDToSSprHhvMqgr8H/k94VEwga5yQFLWCIidiuvryZHX3IPXr?=
 =?us-ascii?Q?7SyoaBgusqjzTNKGUzMpUdxC1PY8WxD1d17H9f4Zhd/FEwnygd2HoAx9zBz9?=
 =?us-ascii?Q?0eI/2sXGby6k/KB9rrNlrpkj+QUsIoHSEgvRzuQ6C6D6F8IJj3OgxFnV9xk3?=
 =?us-ascii?Q?wV8V4Lo/VSOeVvn2r9ZcCs0419jC8F/JwohI5P+yGrWy7c77zWf8FEX4ELNv?=
 =?us-ascii?Q?u4T7RiFsYOxd63vzUyGoc/X5vssBwKTS1Fo1oQs6zqCGmSL23NpdYc48uNNB?=
 =?us-ascii?Q?d0zew8jC8PP3IIhl+qj2gcELrUdO9iUdmNb0rr1P0Zrf6cVLMzOpDA8Sq2vg?=
 =?us-ascii?Q?f15S8328h6fjSwEB+v+EpqPaY51bqLMzXOiXZcWr9tf63rdBAxtgkapdTA8K?=
 =?us-ascii?Q?GH2yf0pv9amACWTt0og++7eMV2ryVHg0JufrTgBNLoYn0iCuiS5Pbhy+MOKB?=
 =?us-ascii?Q?qQLvzqsBSX9JLMffZH70TuRPK5FygnWDBWkGS7wv+KOrfrcjsIDkpIsk3A/S?=
 =?us-ascii?Q?UiwJ7/Z4xGulu5encusLRIt8BNMAlz2lhd1QZggj+Ib42f+PEguliz/iU6qY?=
 =?us-ascii?Q?YAk1ioENwPahMXGikRwW9ygGBrtgfSu1DSreiv4C0udPLzt12t9mAcCbiFGR?=
 =?us-ascii?Q?j5LNvFk9+uNg4eyp//j7aJcNvq5CMVqRJ8W7sU2rGg3RXsvuYaoAr74b4m1R?=
 =?us-ascii?Q?dqU5SAHER49zj/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/GqYSIQyVWxdllaX5oVRl4fNaiYqRdkqNgb2S2FN5uTSFgZ4ihxulQJ8iM9Z?=
 =?us-ascii?Q?kq0oOVX1iR7bFnyj4IZngZyEsGKjwo6RucOrkJ9bN6psiA10oC07g7EFRPtX?=
 =?us-ascii?Q?dM+zs8LTL9PbQB3DZUR0tYcmXUFwzjMI8enx31jckZIzAXyzsNCCyWHnBfxQ?=
 =?us-ascii?Q?1JqBsbPkmZJgr1X1FDDShfS5t7Ljbm/QxtGNljVgzuRkqHR/h3e6RIfTX967?=
 =?us-ascii?Q?4IBoPLLunpHt+zXYg7kTptDNfO7+s39p4+MPp2lWoAfoZzB8EW+wiysgc42S?=
 =?us-ascii?Q?6tMEV1x5e4SOnbrwvCWjOlWw0XEGcB+kvH+RxGC4NE6fNtNhvw+V7uNvj8sq?=
 =?us-ascii?Q?GGdvn3BwoWD/wG1dn0ciFUHPow4HUkFqOrzDyEQ5qtORi/vZgABjZG7IksvN?=
 =?us-ascii?Q?BdB0baoeSpIEksEVpraHV+pDu+Will2oynj6okD3riDQDnvnURRyOU/Myhrr?=
 =?us-ascii?Q?uxhTCMtbgawlKfoy4OCOgGexAuZt+RfOjg5bUfeFkSUlyXPw+5v3qnyB4jRU?=
 =?us-ascii?Q?8hJ5f8YmqsfoWDfnhenxjAzrcmx3ApXuHqnBijGuEgr/pyjRgfyte51KlPyb?=
 =?us-ascii?Q?AqJI8FwSMkW1aD9WCiCvNThzIS0uJEdLs8Zi7xy8IufeHsSkQ4snmhn7fL2M?=
 =?us-ascii?Q?dLz7kCS6P5g783PyyjfrAZvwCPVTrxTqrqGcLzhGHBjXcYmLteFE26HxTpd4?=
 =?us-ascii?Q?To8CiuOrwPuV+izgyxrTKoncY5XfqXKXo/r1yDsuDZ+DWhuNpeNPJZ9OVb0u?=
 =?us-ascii?Q?vHNnUIxj3w1tRsDOLL5Kp9gTU0jq46bg1Ydl2Ow99CrPaJ8RodEcN89iTamA?=
 =?us-ascii?Q?o1lSCi7yd+pyyeszrbukP/Q1/AfZVvAvWGmmu6uptZU5DwrszllRIpRP/MXa?=
 =?us-ascii?Q?lrRg3vUUAKRqKxQ0/9vp3M1gzXTDgkG1G+YOkwcCLtkp/cWtkazw2qhl2ty1?=
 =?us-ascii?Q?ouOBxkXWdBOPCY12ODc3gz+F5uBZzWziTbHprGBhj+/o1/Set+QQygR1ENHx?=
 =?us-ascii?Q?fJ3jD8YvJL9b/W/O5PGP4eV2QRadx9UCQ8dJzc0avY+nm/7DykwdzHd5BF+z?=
 =?us-ascii?Q?anGFelHcjQnEedWxBN7cr/KwzGi3/i/eDZOMfClXFoUw2HXGmyQGs3ag/gam?=
 =?us-ascii?Q?nUDACxYddFT1EQ28JnkXdfqDYohXM745rLio1QEuVg2p+/iGAeSzz4n7qsWd?=
 =?us-ascii?Q?wZqUGLBmXcImOVuyT0PJT80svtDd0pUaYg0NDetgiqBioSMZUD60XWdktGuW?=
 =?us-ascii?Q?YjYCq3C5UgPosZarLAFUZ5PQIiHfpL4TXL/d7TT0yXfVVFbn/S+TbYLwMsX0?=
 =?us-ascii?Q?gmcxY/C3wT3K5ZIICNS9olm/7zN7/vCNhM8bFY3giypo+DMlU/Z65gatqjMA?=
 =?us-ascii?Q?cwQVxtAc4mB1XgSCaLdF3hTfi5YXge5i946GKilhNtXwWl8w/oHyUCTWbAyD?=
 =?us-ascii?Q?Rb4K/blZEOi3332s3mu6ErshR9nz0XHcgCN8eNeWtbdbXZenrkUoU+6xZlRo?=
 =?us-ascii?Q?Rk8HjZ+n4l8Yug3xj9hhjVMm3HpIuv0u3sOCE24c6N8x9Lsdh+8PDF68r7es?=
 =?us-ascii?Q?4SWxojM+VuNZI7XBEffChu3091DAzxfudBFdVfTE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40423649-902f-4162-9e83-08ddeae25000
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:06:28.8553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnJyNGdE2QjhTgFP9z93uCx9ys4HA4a6R+u1tZvHXRSwsQrYM/+rozW2kGyyVBMkEyvRy1c8WbP/SLCfCb6IaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF568C2A376
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index 481d1a2dbe5a..5d86e1d846eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -686,7 +686,7 @@ static int jpeg_v4_0_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 	int i;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index e0a71909252b..34c70270ea1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -584,7 +584,7 @@ static int jpeg_v5_0_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 
 	if (enable) {
 		if (!jpeg_v5_0_0_is_idle(ip_block))
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
index 47bde62b3909..baf097d2e1ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
@@ -697,7 +697,7 @@ static int jpeg_v5_0_1_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 					     enum amd_clockgating_state state)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
+	bool enable = state == AMD_CG_STATE_GATE;
 
 	int i;
 
-- 
2.34.1

