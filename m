Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB7A98F778
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C04A10E8F2;
	Thu,  3 Oct 2024 20:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hFYVe6bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD25110E8EB;
 Thu,  3 Oct 2024 20:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQR5xYzFBStR9KeFfD4NqImc82EBxa+CZ5oF9MvmKehiNWsMG/TKuk9XvWRphouNkWtxnDIuiB6cKKxevAV0BPvNP2q4XcUk3fNyfvMKcNHe9PC/bUondWatuYm/cbfcbipblzLVlm8/COO8xDXt4dnPo6u+nfkIW/FVS0Tsc5Hne2zgHRrqOyvkNnIO6w7xfW05fNd9NeK4mwATbMAT544owvFh+KBJvRnEq6XtPVd99VHmi5pzuTvh1hy6MphUBy3rLNm7YxeAleBS6X9BlWsabLYn0r4RUP3uYhVXybGazl1iUlg5uGKImx4ZbCdXsJezrj3N8DtDwDaq8gaItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKhFuF2R67lF3Fx3qUcWAp+7TtXF1wlCDOCZIn6ep4U=;
 b=yrQEJyj3soHt1zxI7i0woB5zAgbIuDsMX9JG9aRdWv1aXMTSXcKfDx/5GzeURt9aPL+4BSRlcadQqs5O9HWhT8mzOdUToPF4Gf8iWGi3kWYHon0ASA2hingLTlF+95/pJ4CpesB2oagwdTWmeFJPAHO2JCKS7SV5nizd/+VVO+OAUv66FwNbPqZ5fjxLLlkSzuhqxrxzC6un0WbmNvzYCYBO7M65wIzhr8vYcnB04Dpr6E1rqxUz2E5PBM50YzYE4nPjtBpWV6qzsO4aXo6XBq+MedjJ9B32WbMImW+kaCQId+s2fCO7oVxyrmhBike5tx+FiCb53MH7QwGuXdDUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKhFuF2R67lF3Fx3qUcWAp+7TtXF1wlCDOCZIn6ep4U=;
 b=hFYVe6bZYOECxLutabLoiOB8G7190Lq8aUrrlTfBKFf7f+vsAO4jPfIYHkHHBWtmwxgEKUqykruxZKRbNi0FvL/NJxifQXvv9qP8LM70yD62jBOFoi30dca2/gQlHF0SkF2V2RFiHEEz7jAhvgGzykmWiGUmx0mlr/lKD8Go1mo=
Received: from CH0PR03CA0066.namprd03.prod.outlook.com (2603:10b6:610:cc::11)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:37 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::1) by CH0PR03CA0066.outlook.office365.com
 (2603:10b6:610:cc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:33 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v6 02/44] drm/vkms: Round fixp2int conversion in lerp_u16
Date: Thu, 3 Oct 2024 16:00:44 -0400
Message-ID: <20241003200129.1732122-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 508d94bd-86fe-4150-af5e-08dce3e6303e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i5IUu61E+iCtzkvDRvirIEfe2YQ9K7pxZ63q4icrncxOs/zAL8ILG+hCzQtE?=
 =?us-ascii?Q?Nbqw2XGzTUGgRxnbWD/oKlKnTpv/Hja4JsVP3lxkjF0GehXBgA3LjlSDoK3V?=
 =?us-ascii?Q?1h550z5TsDAqvRR+SgVyzpsXjM6/sGuBdckCU1LlFZU49Hz7gNkQKmOfbl8u?=
 =?us-ascii?Q?sY6/eQQhABP1geAkaT6g1Lm5Sr83+QrGPJYoD8GtK0KoG/6CaMEQ2LQIx+EH?=
 =?us-ascii?Q?K7aJMv1GDlWJY50wEh1mYGaVyiwYU8JIy8ltCJR68z6lXQUVZ5ZYmksc11n7?=
 =?us-ascii?Q?+KEDd8MysU7+L++y+vQzKoLb/rvAhrecbsZ20/94WB49qlFDiqE+94jEiWwr?=
 =?us-ascii?Q?fcNzbbi6zlrv/q0LvRFefjIWwhy9YOm1URDaxERbUn+sHOH9bIobv5wGlJvu?=
 =?us-ascii?Q?/CTjFk1N4+aZ1Q+YhAIyppWwlqSoa7r70Xe4lWfU0OBGWH16bkXJUyYyGd5v?=
 =?us-ascii?Q?uAqTXYtRCTdYHvcb9rHm8AJr6nxywcwSEQPBzOB/Oc81w8P6eY6RBB/W1j4i?=
 =?us-ascii?Q?T9Gth1eCB9XfI2LxjEQHRHWHdnT474O+JqZqp1Bvbt65qqHOk9I7o0dGfRg6?=
 =?us-ascii?Q?m1nFb+PZc9HpFfN0euJl+D8pBFGKFt9DhI25nZD6mQsraRZwJ3bg0alPA28l?=
 =?us-ascii?Q?hbt1SvoJ8jsKNjnhz0QeFWkz6jGH/c8wNM6jv5+xrkJ7CMs1aVSfdsHT0Y9s?=
 =?us-ascii?Q?e3Oeqc3sUcaFnfK4EbbHlviYYpa9IdQLUBFOKrmagIxGo9qdSr0C6Gb4i9mv?=
 =?us-ascii?Q?JMwFK99IJp+I+GDiM52tC1YPpzrL8DBuvjqvBcRJl4CJl86O9bcjo3Xp/Om3?=
 =?us-ascii?Q?oyvCKeci3qmHRjK4hNXIVXAu6l3LPj7HNegipfCiquEGO7d02o3sdS0DLn6r?=
 =?us-ascii?Q?Rx/4BLXu6/mAevsDXJvb0l08dYOeYTXf3yPobkM6FBQ1dhlYVil6JSwYUJgK?=
 =?us-ascii?Q?9f6yUapFXK6H3VaO8Pn4OlXKmiFDRASv3XhmJwg3zqpG8Qjfptp8LJrCDUJq?=
 =?us-ascii?Q?CyWONr6phgTrjx/lXisgdyWqK1N3DwJxgJdtaLEc+Uyf1gGnPrwKUuPbiUBi?=
 =?us-ascii?Q?p1+2jTvzhNO6G7pHizGw4trGnkoI/GWSWQDk97L/nwPn+Fl+WD85su1u2Oh8?=
 =?us-ascii?Q?7iKaVdOzUqAX7ivjVQFc26vhpl5JeRf/9aqVHqxLTNWBA0OvaXhXB8TgFlwI?=
 =?us-ascii?Q?p85i+X9ki3Eum4nWbt+figFOJq5Jby74FVOOi608u1h3AixNCg2T4ul+GCsi?=
 =?us-ascii?Q?EHW6NqzaQgL8KZEeQHrtHEAQcm1vkDDInKGffRwcHLbOQVMqurs3bqCfqg5f?=
 =?us-ascii?Q?Dm7eDD0Gxdgj6nyiWnFyH4XinHlEtQkdCWX5oBM/CjgA453QmMkAwQm/Z1Jc?=
 =?us-ascii?Q?pvTl1G5qZxskPS6+3cNf4DgRcrIf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:37.0070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508d94bd-86fe-4150-af5e-08dce3e6303e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859
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

fixp2int always rounds down, fixp2int_ceil rounds up. We need
the new fixp2int_round.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..3d6785d081f2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -98,7 +98,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
 
-	return drm_fixp2int(a_fp + delta);
+	return drm_fixp2int_round(a_fp + delta);
 }
 
 static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
-- 
2.46.2

