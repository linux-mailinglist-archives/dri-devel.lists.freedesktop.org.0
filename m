Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD286C50FDD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58A10E6C0;
	Wed, 12 Nov 2025 07:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KDNqq6ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013006.outbound.protection.outlook.com
 [40.93.201.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E410E6C0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCceP5009mkgMJxCcZItIqXdbLX7a/FVrdw2ExQh5BA116fdyWveSFlBjfTRhXWDMRroeNQbE97oXLl8vWe+UfxoH+exAYVSvNTxnzTl28/gwmpfH12ZP6+uc/wiIVIXvfAU7cDcXhFRxNCUBouI1/bEFUWGAozAwyP8gb2pO+lK60BKqTPx5SkmP1ciMcifeqCERZ995wYoz4D1TYrkMZoku9dovme/nhwHPePbF+nUzcz785lYplaoKJy6+Q92aSYItEUXIo9FnuGr06TooXlTfM7rqq3iL7WfiY9qu3s3OnBsLQ/t8/77K5XO9wgyqSPOXxFgsTpfPzAsDx4m0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSuyEk/vwDt0hWiUh/efJsZPXqfW9kAZcpGk/fgkGbY=;
 b=OZZ44w9iRnvH5iIQ1dJbVMjnbzuumjY0JH8hhDY8VngZheMk5fvK5gyhl507Y16L9CBns/gCb/CK8ZkyUlfjSmrSI4iVt4KMNLPDXxczGXdChJmchRli94yDpSX5aU9RsId7wdsMBU8l5lr9Kxv21BM+darLQO0+ksjUwL3o3BqLG37PIUmr/X/1AKUxIeTTxKXh9ZkYo9kPFVoFLs/ys6N81NODC+gz7wNwMYaaEe7tG/3P3qm/gomciZZ9vjlbEVgN48S3TG1dJA2k5/vNtyass3n9eP6SBtysMO+Gn0wy8E9bx91Vmx1RgOFKYXuj40hAs1eEDCFm1iojWX0U2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSuyEk/vwDt0hWiUh/efJsZPXqfW9kAZcpGk/fgkGbY=;
 b=KDNqq6eyfdaX/FmcBXQaZ3xJekTQK5MSbec4VwvixKxMTkz0C55UebZ9+l0G4e1LmvExuJ0zE25fOfkl1FkaWgt2Kmo6ME++/DMrE3glDO34qohQ/55M06P/zm0pDTwhIHSgp10DJN0MNl4d+0UwHpRwp42cqLkW44fwF58Wyho=
Received: from CY5PR15CA0058.namprd15.prod.outlook.com (2603:10b6:930:1b::14)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 07:46:17 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::dd) by CY5PR15CA0058.outlook.office365.com
 (2603:10b6:930:1b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 07:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:16 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:13 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Honglei
 Huang" <Honglei1.Huang@amd.com>
Subject: [PATCH 3/6] drm/virtgpu api: add blob userptr resource
Date: Wed, 12 Nov 2025 15:45:45 +0800
Message-ID: <20251112074548.3718563-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112074548.3718563-1-honglei1.huang@amd.com>
References: <20251112074548.3718563-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a56a715-90ff-400f-1b77-08de21bf8fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sz8onFBbjw58Uf7nDvvoo14dPYzYGv+meIxxsUjz2d5wzu9dHWf03kHUpaWh?=
 =?us-ascii?Q?pgllcVB5FMCUrBITzqAeWbfk8/oNyeD4YGH4YDXcniMb0aj+uJRCcJowAhXj?=
 =?us-ascii?Q?/EEFVxgzCY+ihm67Wethqqx6J8l9bidA0iiglypeah0G6miHHKLnvhWmUgP6?=
 =?us-ascii?Q?L0o1BvdBNvyRKRk+wwvmlFyOH6FZN9o7YmAdh0QQ1oPQOkTzaqG8QtelAKyC?=
 =?us-ascii?Q?u/72xSQ+PnBvfzTeHv8WA8eUYmmU73h4ya2xYnWHLjkxauqBTb2kBE1bl4Do?=
 =?us-ascii?Q?N8eP5SnLv8gCJNNZDvHU/RM8NQCEkN/e1IGfak1JyExpR1y59sXqbe0Bpna9?=
 =?us-ascii?Q?fWnmpIRcLXZdFOJwwscN5nUsWeBEhv5+Fb9NsbugriZUMIhZ5bm3gvwoLKCL?=
 =?us-ascii?Q?kIa7thZcj3KIV490BgCvgB7UdJJ/7PCJcQznSjWzLwqlXc8e6adymo+/wUdi?=
 =?us-ascii?Q?Bzer5kFD08Xa3LLziy5W5Xs7httgDNszAtdixt6ej9Oe/zK1MhaONYRZQLVl?=
 =?us-ascii?Q?g9VJPvhPpO0fys1+4PMpkb9ZvulM7ML9UK4i/MVFtER7OJ/xGxKiGFm4h3Fd?=
 =?us-ascii?Q?/O/RkanIwFLn/Zpen0aPWlWLigR5E5mMuqmdceXOrSkBAUeDZYCqiEY3NPr3?=
 =?us-ascii?Q?bgp5wIhIpaTAx3uxJu4zjydfr8rAdAuOD2yYpED6usZSAmc+AzBVLRzNb/na?=
 =?us-ascii?Q?f10MdA5EPwKeuysb88Oaw1CtLf/K3iYte8OPNwk1zQ63IHZ5wRH78H2awrnC?=
 =?us-ascii?Q?0hu2mJlB2kjdfXK2ncIp248J5hcfZCqXixcq48GMVGXeXBVVAwKiSQ5E//9y?=
 =?us-ascii?Q?JJEGQJYt1HeT9QE+ioVOU5bN6XF+AYfobf17X9qmoqAlod425kuSnENZpiRV?=
 =?us-ascii?Q?QO39wYqFNjrkGTpYEyeIgSwk4B6+7xYOXFAoFvqV4HFKWXECLc24Ic88zOuZ?=
 =?us-ascii?Q?tEXzD5Sq2Djpq4K4NeZ8MwNKeJN1R+9etanjnZX9giZMQM22zcKwAGTILWRC?=
 =?us-ascii?Q?fPrLf1Y91ah21m7zRSzoejqS1mZGrQRJqiWeOJakAsomBrcYdF4G2Urd0Rq9?=
 =?us-ascii?Q?/A/DoaOXw56cfea17ZNjzR5BnrgQ81aJrN/DyLTwk/WVefsiXeMiKq6vkZXw?=
 =?us-ascii?Q?SXMLz9DCX/nPzJ4jrLh5yPilq/ClZyy/NHtJME/uq9m6lO7jHHVX/pK4NIgb?=
 =?us-ascii?Q?P6gKC/wl6irc0sj5mQD71d+2X16/TVlRpgWVa3+7L9JDFkgKKz4d84a0wFTC?=
 =?us-ascii?Q?NLxW5o06VaMMG40XAf2LXbJ/3FPXanAeFYwmVRrLNS/YkzX/tQBlleUhpdzI?=
 =?us-ascii?Q?LyZFXOpcz1q/03WjjFq1MmmKyu60H+/+1sVM6rrDlhnimzWGO1gl+9tnei+t?=
 =?us-ascii?Q?Hy016a9lPp0SWOJBDu/kSYBCoC1ArLOlZakfquJbZ0MX6VtOKMon+/fHMvWf?=
 =?us-ascii?Q?YfwWjlFxPQi3nP+Sm4Hn+0Ody/QWXIS8yfmIR2mli3fwc50NkF+FiU7WF+xs?=
 =?us-ascii?Q?bChr311WDPQ+HHXivW13m8s57+ppm3dn+NcDMgljUKiGPcuzo9APwvqheXvO?=
 =?us-ascii?Q?5RzofIbK9Ny3LccrJ2k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:16.8736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a56a715-90ff-400f-1b77-08de21bf8fe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593
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

Extend the virtgpu UAPI to support userptr blob resources, enabling
the host to directly access guest userspace memory without data
copying. This is essential for compute workloads where memcpy overhead
between host and guest is unacceptable.

UAPI Changes:
- Add VIRTGPU_BLOB_FLAG_USE_USERPTR flag to enable userptr mode
- Add VIRTGPU_BLOB_FLAG_USERPTR_RDONLY flag for read-only access
- Add 'userptr' field to drm_virtgpu_resource_create_blob structure
  to pass guest userspace virtual address
- Add VIRTGPU_PARAM_RESOURCE_USERPTR for runtime feature detection

The userptr field contains the guest userspace virtual address that
will be pinned by the driver during resource creation and unpinned on
destruction. The driver validates the address, pins the pages, and
provides the physical addresses to the host via scatter-gather table.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/drm/virtgpu_drm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 9debb320c34b..02be53262f05 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -98,6 +98,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 #define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
+#define VIRTGPU_PARAM_RESOURCE_USERPTR 9 /* userptr support with blob resources */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -185,6 +186,8 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTGPU_BLOB_FLAG_USE_USERPTR      0x0008
+#define VIRTGPU_BLOB_FLAG_USERPTR_RDONLY   0x0010
 	/* zero is invalid blob_mem */
 	__u32 blob_mem;
 	__u32 blob_flags;
@@ -200,6 +203,13 @@ struct drm_virtgpu_resource_create_blob {
 	__u32 cmd_size;
 	__u64 cmd;
 	__u64 blob_id;
+
+	/*
+	 * userptr: guest userspace memory address for VIRTGPU_BLOB_FLAG_USE_USERPTR.
+	 * Must be 0 if VIRTGPU_BLOB_FLAG_USE_USERPTR is not set.
+	 * The driver will pin the user pages and allow the host to access them.
+	 */
+	__u64 userptr;
 };
 
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
-- 
2.34.1

