Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663289E6771
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 07:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89A610E3E8;
	Fri,  6 Dec 2024 06:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gBTOshJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814A10E3E8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 06:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teLU0BLeLn0j4e3ZzkoloFJXirvYaZGfol3xQAcEWlmWdQOenNPQHk8hG+px/+iEx16QKGUTUICMScHnu5wOGG6B7DixkI2OpwU8XmLkYaKnYHdPJwXzGtyFQfLUfhExyNui+zGsW5cFL4IU53JvcqBgIPJZiXbrwY+4LJSUYUot/C4kPwEK2ORgr2y8hl3JvmY54ua42J/D65maOW/sp/miaQr2JTvmgu3UWGY4vDIOoxdCYNYlG3b/5A31ko8zd0yg3hgVmRfA2rb/R2OT/T4XOa5padBHRUDeV9RIklI93xJGZoz6way1wfTbVbsgZqK+50ZaWyV/rbyrG0YJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftTg14oqZ4LpvOVkie00ox36pc3c2/g1lXj62DcXBqY=;
 b=mauuS8fcRHf6OmqGcGsQl4GVCoEDgl1RyhyNMJRs5FbqkcFmNHPfeKuGjzeoW1YvInDHFpSPKLMvwTfzmiAZnkWtflqKzGfBJfN6f4X8emdp0wI0aBtmUjxJZn/78lfOHck7ul3bmY1wpch1KTXABbEDRgpBIlI7OUFH8JalPB/WdKzDu2U89ToT8+qfReiv4lYVZNcZBOtsaUdMy7v5E7GUBRTh4txEoh/MjCsRoOGVO9zPhbXffHNERNZb86eiyXyvHcA2x096+8auhbV0Uj84BmAquB0rr/WONSvyMrQz/xrQMlhLVsjOKRfXNF9laN+o521amDIXZNTswdrMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftTg14oqZ4LpvOVkie00ox36pc3c2/g1lXj62DcXBqY=;
 b=gBTOshJmf14Z2XUXwpzz8Ur+5PKXy9jw9Z2sNVJi+SrXJWE6mQgXzDp+29dtAn5JekfDdLU79JsoQpXzzKz3p6qmVxLqdOgOuCeckIZZ//bX6ZQY0/MrTDIOncbpcnIh2vWtuCIdog6RqUAwPz3bkEfZa5EcdheFUOuO9ApvlK4=
Received: from PH7PR13CA0003.namprd13.prod.outlook.com (2603:10b6:510:174::14)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 06:51:14 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:510:174:cafe::2b) by PH7PR13CA0003.outlook.office365.com
 (2603:10b6:510:174::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Fri, 6
 Dec 2024 06:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 06:51:12 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 00:51:08 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: Huang Rui <ray.huang@amd.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@redhat.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Lingshan Zhu <Lingshan.Zhu@amd.com>, Demi Marie Obenour
 <demiobenour@gmail.com>, Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH] virtio: Add hsakmt capset definition
Date: Fri, 6 Dec 2024 14:50:29 +0800
Message-ID: <20241206065029.2386702-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7e039e-25f1-44b5-4b3b-08dd15c25f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fzYTGtJYiEgZVYmRc6pRqj9Iz8ZmehfcQFfcBIYrI83jQ0fvutdJ9FQM1RUV?=
 =?us-ascii?Q?PhsEMto/352RwX/AaX0BNaxcdRGlHgFVBodotZVujN7L8yXEbGJx3rDSHmop?=
 =?us-ascii?Q?c0T4TiJaeL+zLc1kSQWzBsjZOy5t7tx+9EcSPA6nmY2PNMg0t4bW2en994vl?=
 =?us-ascii?Q?inOeDU1PHRwg2Npb2tChswhnpx+AsvmUjmAbo+4w2KkIUfuTWx+0Q5yxOR5y?=
 =?us-ascii?Q?guw6n7teOvzyKHPyw7GTIzGpIpu5Lgj4O3yt6V9wzGNOwIIBlUCpPljQUJQ7?=
 =?us-ascii?Q?GbPqSNCAxMvLfF4Tz65nasYJMheKBjjSbeU61AGOJIGQqCjbMPQbVOO5gMgX?=
 =?us-ascii?Q?fdejWcOVXeRVUcx1qCn8saa4evv19hdufLJvhmkMigdjfegQKVjIKCNQELGU?=
 =?us-ascii?Q?9iOqxa8UG8ztPhk5PAYZR5prQGQy6ep631XfFOJb7PUCVREQoaRvpudNQeR4?=
 =?us-ascii?Q?nmv0Vy9+wVgMgpuExXnNGA84QPZDn98D6VceE4cLGbkFp+UsgCmVDooKdl6B?=
 =?us-ascii?Q?+6up92DNgJwT6hWK1Dg0dCvrpx4ndDbqID5LBJU9meQTI3g819l89znUwJVx?=
 =?us-ascii?Q?7392DJilb9Tk5VDMNODnz15zg8glb4xD+KGDKX/dY0I6FM69YNDPDM7MpQOM?=
 =?us-ascii?Q?LXFSvm9ulP5FDRanTLPU2C2WqYlaz98QQCHoJQfjP6N0zbuo8JAPjBM1dUh4?=
 =?us-ascii?Q?+kb9+5MqcgU5OegLWihHvXBVOQVFJCo0nkbpj2Fltlwrfy/zD8/N+W7jd+7n?=
 =?us-ascii?Q?FJvJ1ZI3YlwFpdbGCadUIZLNwb45K8LgEs6LCQoOMrpckpnRe/TNIPlCWMqd?=
 =?us-ascii?Q?tCvjAAEBe6a3z9Fpgqa7Sty6uo26m3xaProGJULESsSUeLElKB0C8K0xejj0?=
 =?us-ascii?Q?v38AKhcewtaXY3UfVw6zJUpHJE3UUub49uWhURL9JqFLWK3UrlpcTO9Zj9rW?=
 =?us-ascii?Q?79K3GdK8Jf7Ez8qqx+3IX7p9Mzs/hX09pWb4EtebWbgvbCiHuAjgiECuQsYr?=
 =?us-ascii?Q?23VnUO17qF5K7xaZzsV8kp6G/0wrRM5Vr/Ar0s41y85U/8EIB62nl6E0GAZC?=
 =?us-ascii?Q?aEshp1JxbtlNdkauOTFdVwRC55miX0ev9CDboIwZ7gmXwpuva7SzHbl+bVEL?=
 =?us-ascii?Q?rT26Knz4pv34ZizNVc/gF7vT1rWySr62xlGlb2I5BEPEHYnPjg55Tv+aP//A?=
 =?us-ascii?Q?UjJH+niFLkdh9XRbf6eERhUQaslGYjN5d0EBPFgwAMSR9TS32HWah+8auiuC?=
 =?us-ascii?Q?UBycnUGftfqwbnzjAxm21GQBzk2yGRpMnMHsDQh8ApOJzEqXI4tKK2ZRitqb?=
 =?us-ascii?Q?YlhJNLV5Jw6dXjb7fg8Cb1ucsy18WaWt9JWlBhy+wUGKZcAK/yvlWYYMtTMm?=
 =?us-ascii?Q?id+UE+xoQlksJAjVsKXplRRP01zN12IwWtxcv6tPBViEcyluOfQe3EZxLlwJ?=
 =?us-ascii?Q?AAVlc7t2UTU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 06:51:12.4342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7e039e-25f1-44b5-4b3b-08dd15c25f76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066
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

Add libhsakmt native context capset in the VIRTIO-GPU protocol header.

Virglrenderer related patch:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1450
OpenCL based on libhsakmt native context patch in progress:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1370

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index bf2c9cabd207..183acd6c885b 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -312,6 +312,7 @@ struct virtio_gpu_cmd_submit {
 /* 3 is reserved for gfxstream */
 #define VIRTIO_GPU_CAPSET_VENUS 4
 #define VIRTIO_GPU_CAPSET_DRM 6
+#define VIRTIO_GPU_CAPSET_HSAKMT 7
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.34.1

