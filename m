Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1FA6B5A2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EF810E6F5;
	Fri, 21 Mar 2025 08:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YnllYsYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25C110E6F5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8xADcvb6E9fPh+lc2U7WgH2qiR9VO+qXnEfgzVXkCdCnaLizOvZmHq8sPXB8fAU5RUZKaXAzeAY9NUnx0quFC8Q8K/6DgbbVwEfxW9udbuEFCofFuJYs8EQcvrK38pbgEQEcPZsO/O5p3khjINfAlVaaKRpfpWlcuJNgw3cvuqU+qyIq+YKZ9mz05ZC1L2DJP0sRb9pXJou9WgNW7uICOVhZP7OzLZ8/KgvEMuM56AV1zsmAwPLwUHXGm8ldzJkdpyvIcB+zlmG/AYZ31+EP6nLhArhzGj4SwdBQdSRR/ATC/9ogh0k9RYZTpq7/RPaz5NXxSOgdLBG+b5IfxzVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rP4J+rSkCAMxM5BNaJzGL+atZEpGwcy+WPWtgapITs=;
 b=afLPuJTkaNrs9S8NX0ODpqdCcJumMBFtnKB6CWdbQeT1V0wbNjATTSbRtxjF/HayF/TPebvDmYipdACUIyH/feHcbIk7SjY5iFy3QlKg/Y3yQFInxr4Eo1o86LrAp0eqv92eQ+Qv/9BM4CHYhHy+6BbkIdGPsJki+77ewdoEKVDrVI3QRhDeXPgiLZKeB8vtIACSM0c5GqhAHyWFrbKxgkcn6BKy4OJpiMW30ffQ7hoqlwvGPqf8DEhICweXn285EiCvkWmi/bpCNr2zNVVhmsppoG3ne/xqWtIWHxaIheMcO84oHRKemuDMRXCjXuUc7jI5QrsKlTe3CEZ6cv7zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rP4J+rSkCAMxM5BNaJzGL+atZEpGwcy+WPWtgapITs=;
 b=YnllYsYISD0Swf2bttqEsYb/Vsk7vBG5fXbstE94Rf1RN62wdu5y4PO3wI3AK7aIWt2t0McRPmKE90qDD1dgYgl/3YhQqVNc0zl/4IcUi01wHPcBsIsC6bysZB1shPdQEdKiAjOuVNIzXRefaxGxq+iaBhjx7E2e0Kz1NTD1H+8=
Received: from CH0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:33::29)
 by MW3PR12MB4363.namprd12.prod.outlook.com (2603:10b6:303:56::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 08:01:01 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::4b) by CH0PR08CA0024.outlook.office365.com
 (2603:10b6:610:33::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 08:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 08:01:01 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 03:00:57 -0500
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Huang Rui
 <ray.huang@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Honglei Huang
 <Honglei1.Huang@amd.com>
Subject: [PATCH v2 1/7] virtio-gpu api: add HSAKMT context
Date: Fri, 21 Mar 2025 16:00:23 +0800
Message-ID: <20250321080029.1715078-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321080029.1715078-1-honglei1.huang@amd.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|MW3PR12MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3fc7cd-39ab-48a5-115e-08dd684e8575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RJOHa/WOo3lx2mfmt9FXrbprOYSQnKdFhN0M1wE0eJTSRLbGOv4N4mT5FdmV?=
 =?us-ascii?Q?qDiLRmX2Lekj7IfI/K936L8pe1TrrzRH4zjpIR+q6BADysBG3ZXQbPlXNeCd?=
 =?us-ascii?Q?PE7L4s/uk9ZmhAn+vmIJBQhtOg5ZvaRCMfS3c5NbBXyxTZH+p9JcVgGs6q4f?=
 =?us-ascii?Q?6qQP4ZcIJaFHIa4feQV9vi261c1f2cjY4DksT7GRi3mkktTuIX0+Ar3zoFLh?=
 =?us-ascii?Q?VTQeduFuY6wXz6BHSjf/Rcjnyr4Ai+p9PLx12RnNn4BaeCfcTln9EVX4+SSz?=
 =?us-ascii?Q?7rPR+ApmUPfZjC+b/RaiBOiXrdbDl7c96XfVFir4QLu16Fv3UnG2rUSFZQcu?=
 =?us-ascii?Q?QsSZAIt6JYpjyQj1aUy6pt9Txldi8lfJAbdAcxUxjoyZ8TxVOzNa+2jmoUen?=
 =?us-ascii?Q?E9iL7yWXiSoIxGdobi6mo8FRn3DxU4mQCn1ariPK3q8Wr+P4FzM59cfw2SJY?=
 =?us-ascii?Q?KAOl4vyHgXwbdxAeajpcVOnOKE7DXwLEc3tjNSrZYeNac65+JCTMPvKI4go+?=
 =?us-ascii?Q?wuanCKTXCW79TsmRQFdrXHmgwtwKqinji0A2DBa8smf0bRZuX9OeqAnKXKVV?=
 =?us-ascii?Q?G1Ul1lhNphzIWLFY+WJutAwTOrzZsS+XCyx+JzTWpxmKX03JMmUydu8BnTzq?=
 =?us-ascii?Q?ujLJ7hJavr4+x+gNBCocQhhgVk5PR+QOC0hIuDaZFYK6WlxJYfWvGk2DA5sM?=
 =?us-ascii?Q?lfPpOIkPFnae90W9mnuZe5TrxYdlVEHTRiCtHnl3WD1w5c9dR3kNVd+SwWTv?=
 =?us-ascii?Q?c5eMHvzg4ElnGC0VT1pATLUcTHMruyD82Y+GoImR8Re8xI1Iy+xJG+/62FVv?=
 =?us-ascii?Q?b5bbvQJalC4HxlVsgw6+xkHHEsBz2Alu+4YYznHgUOGbMSDq/bL4fcHnRT/6?=
 =?us-ascii?Q?SsdfqSfvO3ZifBJIO72c3+2206BT80Sa5xnmxZGJ0GGt5xGqhMYVOup7yYQ6?=
 =?us-ascii?Q?MFnm/UXTHcJb00VQo8HJyhoyl2bi3k2fWyMwDrSpv3t6lxOSPv16RtSwbORy?=
 =?us-ascii?Q?q/rLnMMQW3sMdmkwamCPACzf7TEZGfeghTNQSB2V626OseCdZb0ai21xOWw2?=
 =?us-ascii?Q?uVL1Cz8q/G74Q7iPe6abn78pvThHmoiS764yl4vgZu+V2Cf7ZoCKi4k973US?=
 =?us-ascii?Q?kwOhD5GmTm7NnF3IVOdvTSkHjXnh26r3vdRAbz/MzPRoqdOxOFlwaELxmakv?=
 =?us-ascii?Q?SCsL+TT7OIiRSGHo0mHwItCD3KdOy1KvaREabLwO9qaosgCXmb4HeWvh999M?=
 =?us-ascii?Q?Va4e50Rb5IhIv1goW8qhp+h8L+8dRQE1+VOJQY+YBMejWaGy3ZRlV/JzEj7T?=
 =?us-ascii?Q?g0REh+WQsmBCgnp1jrqzm/CqCR0KvmMOjdeW5eDSKLK7OUalDJr3SrLrj4IW?=
 =?us-ascii?Q?GIL7GjN0zrms8qzmuA789jzwJ3B8uh0Rh6tE6riFDqUEOKngaq4zRBMxUP/5?=
 =?us-ascii?Q?AA3RNSdyGTVxgH/lRH39h+W89FudMUFvzhqASXbP8KJY60eSXm6X3scjzMfg?=
 =?us-ascii?Q?ttw3IPkAiuALqXo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:01:01.1320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3fc7cd-39ab-48a5-115e-08dd684e8575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4363
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Add a new context named HSAKMT for compute use case.

- The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
in this series patches only HSAKMT context can use the userptr
feature. HSAKMT is a GPU compute library in HSA stack, like
the role libdrm in mesa stack.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index bf2c9cabd207..331fae983193 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -312,6 +312,7 @@ struct virtio_gpu_cmd_submit {
 /* 3 is reserved for gfxstream */
 #define VIRTIO_GPU_CAPSET_VENUS 4
 #define VIRTIO_GPU_CAPSET_DRM 6
+#define VIRTIO_GPU_CAPSET_HSAKMT 8
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.34.1

