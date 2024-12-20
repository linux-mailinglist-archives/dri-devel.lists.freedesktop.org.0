Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD39F8B71
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC2A10EE9A;
	Fri, 20 Dec 2024 04:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eSjou6UL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFC910EE9A;
 Fri, 20 Dec 2024 04:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzhKxZWQUK1B1Rynf+YCBr/NpXzlR3O0tfYh6bmCh2ZlSzpYBq6QTqUEHzH1eKEPPiDuip3ekXBxA1JYQ+KmiWfEsn9zzWoabdnfTKI9rCJ1c8jQEmBUx1Mug49tzMCiCJwKmCvm10JTsfjU1jw5+lC3R0+wdBq5a5ylPSQdX2gaEmm7R0d97agEhS9r0pXbW97XtBCAiys7YEQIncZ9Xpf08mgCUi6ylhfGBq1UuxlNiIR1wi/VDk/i0SUWpi2GHT8Pwqltacao7uE8J61ngTO3X91RGjDfkLInKBnOlq83RgWaxVOpt3Etm3vxgLdkJ3MahVsLhnL8u+/gO9D//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+8Buo6hcCmNOaMaNfivezW5wsMDNGEYsIfnjyl3EAw=;
 b=kpgVcu23REeE36hxMmDQabeLOOF5a8HQtDMNoanCftmUZHai6G5NDmcA9vdOSjdivKjujHUG9aVOuSpbnwezLwLYjysgOwzUnaLp0V1pquU/VBb6hL7lDDX/LLbjMXTdinNS5PrutKKiOB7NMoixd4KF7PtqyvMujSXWuw5S8O9gL65G/KrPR+0P/QadPJV1srHgygrG5kBttM5tDpF7M/jlGUqGq/+FOFDDsKki3DIU3EZHkm/SHI6PTyCcMt4al/Y+xm2KK564pPKWVa954YMo86zDIXbgI2npoVQcLY1WjzMLSfePto5HQfRki3Bnn7QnNLbFLzo9iKrAZG0HCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+8Buo6hcCmNOaMaNfivezW5wsMDNGEYsIfnjyl3EAw=;
 b=eSjou6ULBdLYXnBkGS7MQOQo945Acx2DkpZ4JiPvIa3APZWbqGJGklg6vErhqbz5EDb6rx31PY6Nxnp2qbuICH6VOtHadZiFYiPNlrf/xCRFMVkFcLc0BA3jGSAxYzeAdI44I5Goa0U8sbDX/mEUV3EvKUNTTxWJUYSiIeo2ilo=
Received: from SA0PR11CA0032.namprd11.prod.outlook.com (2603:10b6:806:d0::7)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:40:31 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:d0:cafe::a3) by SA0PR11CA0032.outlook.office365.com
 (2603:10b6:806:d0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Fri,
 20 Dec 2024 04:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:40:31 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:40:29 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 21/45] drm/colorop: pass plane_color_pipeline client cap to
 atomic check
Date: Thu, 19 Dec 2024 21:33:27 -0700
Message-ID: <20241220043410.416867-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af1f7c4-6b91-4192-06ef-08dd20b06f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLPX4Cc9yusnqZxNq3C9guT3M5rqBve7jUugUeLPiYWWD+QqYyY2+u6pco9Z?=
 =?us-ascii?Q?4xyzTBqu2wyKGOLS6dJTPM3zV2RzlnoOget1cuTR7P4EscqK8eC9gKqkhOKg?=
 =?us-ascii?Q?GkYl6rlESadtDLAbsFnP7Slo2acrOREK3qa6uOQtt+SPEw2utxMpRCukcEKv?=
 =?us-ascii?Q?YkaHecxfxbOLnwKifs0fxoiQtYgYtl86KSe1UYFKWX6hpupcgb8XIdzrdbZf?=
 =?us-ascii?Q?GeqVw1ZN7UNRmv6DJPlFTjx+CwXSX7M8aQDdKQPePqj6RCQ9+tM+q2hbyL2d?=
 =?us-ascii?Q?BOEk0PWuTYqhFKh02Y2rkNf8x9U4fh35e9CwNboeRAHAUAvx3GB95cCBJ31C?=
 =?us-ascii?Q?sBJ0+80QIbvxvDVA4vxknc3kHeDDmgRohzgZLYLIoeE9ooJTxGEcELgdNu0A?=
 =?us-ascii?Q?/pI4EiBgguIyknekyf8dn/8h0+hhV6CGa22l/cFsTv+mdYrRI4DpJc1KISae?=
 =?us-ascii?Q?EzkKcDukBl+A4G4kkt73F1xn8NZUXo7m2qFj0xO7OQBhrSfgg6vJM1+GzcBR?=
 =?us-ascii?Q?DFERTSYzzJgx71o8u3m1lyJZJTyc3NH6viQS3sOawoI+JC2IKp531uRRtb7w?=
 =?us-ascii?Q?EAwPpvI8NoMXQZFoEe+9vIx8uvFLd4+RySbdzzJ0QG+dtC9kmdlDEaT+Oei1?=
 =?us-ascii?Q?aCl+8lRVNfIEwZJmxCMrtlsSEYPNO/VE9Ul4rSRFulgtW+rqmKfGbyoUAa/D?=
 =?us-ascii?Q?9scWhy+U4dwrTtxfA8KHJo2CPR5M5SC/QNF4/rknRbXaBaY+9VhshflRL4t3?=
 =?us-ascii?Q?hsQTVus5o5cAy+8MjKTYGKkQIOl4cEO6Z+wU9ATjoQhyFA1ah8GjlBWNnOvY?=
 =?us-ascii?Q?cmvOq2FtGuVW+irlaDaxEUSHSMfGjagCW5KwMboKrewklsT3zYXt/PvJM+ei?=
 =?us-ascii?Q?jZ1KMomyJ7+DxRDWVp6TcE0/lhr60SAwish1GBxDr8bGT2WCICGj+rHMWL0a?=
 =?us-ascii?Q?wAICfGJZyTvMZQeXqFlXzXToxACX27zq5LmmgxgZuQLxe2n+32ghQK4kj+p3?=
 =?us-ascii?Q?WL4LS4BUIIXzTqWlDLJeG8K79UHkpQlHfSKxhZytdk7zkQlkvto5EmAz/8C/?=
 =?us-ascii?Q?i3hNca184xEgASihBiK8/bNY9icufC6EPZZ4HltJfgh2532+xfrI+3ETCzyw?=
 =?us-ascii?Q?SX2/qN51+JmA7qubsyia3kT3SVYlOxRDCH0vSGRc265nuhfl/UoIditSMGNj?=
 =?us-ascii?Q?Ufq70emxRHNPX+uHouxfHUsoh9Jih32wFWnFgG2J2IuGbt4rgWaArMXowxtZ?=
 =?us-ascii?Q?kdDcwSnC11jhRljI2J3L0kNDZ2R/6dZLUM/AO50V1UQrxPKaceUkZQYmO8Fw?=
 =?us-ascii?Q?VrS7RbfOl0HjmnW/lm3g4nFjkWTkXTtIgmWL8psTmVj9ao/Z9vKq8H+z1OKL?=
 =?us-ascii?Q?yGrcsWQlM9HwrIMd8x/TXfQl+P2AYsJUI9QU/BlYeTwiic7fGljL+d0NNW1k?=
 =?us-ascii?Q?a8FDHMM8p4ZClBw33oLhlxmW7ExRL5t3fj8/ioj7PqeMUbcSsL0xaehdx3C1?=
 =?us-ascii?Q?3dud2kA81zRLrvc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:40:31.0316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af1f7c4-6b91-4192-06ef-08dd20b06f57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
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

From: Harry Wentland <harry.wentland@amd.com>

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7bc4978e5441..a3e1fcad47ad 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1572,6 +1572,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index feef16fd89e2..f3afc1ef3f81 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -414,6 +414,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.43.0

