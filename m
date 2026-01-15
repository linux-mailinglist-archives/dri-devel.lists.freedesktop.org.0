Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8CDD22F90
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B5210E6EB;
	Thu, 15 Jan 2026 07:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2BG+vRc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8510E6EB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnOo37jWHeKCTHWxwsyRfH3xM++sZ4x+xBof4HvETxaK57KkNnHWN/IDdVQRPrBVWI6yb6O702x+1zqFkizSAt3QuUPkQh8YfxdA+ChVQ73ylKZgBJnoJj+fq8bB92xInfWTMN+vCfGGWa5SjxXjwYM0pvqeVywaE2pOK67fdZ/Ddnqm/mgChqMY4+kemBhprC4MUFhMqum3ndFHiTvf4EImk+Q2lvfHV5j+N49SQ7hbQb5WV6dbnuvZQrU4QKSHX8w2/cHWnJ0QW0JnEwtWVt8pVM8bIPBxYMcveH62yI0i6GYugbbDWWwNMHlT/z+3hl/0qBP5uNVIgmoth6cTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIoHtz/iYAtbodNNogBL9NxXmDhehLIpLmN/K874AaE=;
 b=liDkQna+jvBHTWmfyJEtRLpLd6JDiHWUllHLzHbZmwymESvjhsuDYw4MpicphH19UwF9YTx9wbsLVMhGbNrRsqxT3xPSpOgyg+N4PrmoHx2MC2s2g0rZXnYlRGe4BfH6YC3Wf5R5MHsbeXtssyiElAd7NGIEE/c3XxDJ9ln1adke0ZqX7lfR++KJo34ifprFcrBpH7sdtA+KxaierLd3VV1VaUs/qhfv2A/+MuVkBWZsSENmODDmmQysyg99gMdYguTu+NT2RnePIPbymfun1CTKes0R/gck+GWhiSMPm96/jrnAUEVSafzEDXDEW6s0fg4QjCpxqmbuUXayVUNOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIoHtz/iYAtbodNNogBL9NxXmDhehLIpLmN/K874AaE=;
 b=2BG+vRc2u1/2V8U0KzDx1i5ny6Je46DF27lWh24ZAkE+aS4qWzwpplVj5stWYt4vaNwq+Xcq4wVY6KxoQ40B+cbBuprFKSrS8mwkygswsPRM5bydJxglD12ys6I9ti+LBIi+vEZZ7dZEyLzzdUkjLXjw9TTzCHQ6M/r+T7wlZm8=
Received: from MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33) by
 SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 07:59:18 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::6f) by MN2PR01CA0064.outlook.office365.com
 (2603:10b6:208:23f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 07:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:59:18 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:14 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>,
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Chia-I Wu <olvaffe@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Honglei Huang <honghuan@amd.com>
Subject: [PATCH v4 1/5] drm/virtio-gpu: Add VIRTIO_GPU_CAPSET_ROCM capability
Date: Thu, 15 Jan 2026 15:58:47 +0800
Message-ID: <20260115075851.173318-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115075851.173318-1-honglei1.huang@amd.com>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 34761198-7311-4e31-128a-08de540bfc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EoyCFRgSnQerll87b/mY8koL07riuw/n4cACGdxjHZmXf1wp+wqnsui1SwH7?=
 =?us-ascii?Q?ZBim7TxYz11cn/4rwRfq8he7EW2XjWEdylTwbZ5YNWK+nXtFPJt5oc7WSmkb?=
 =?us-ascii?Q?cpPMvg+dlo48c5RulqOzbj4oCY61E5Y+FPEplTtBCBp1w82xC80notpNUgQ/?=
 =?us-ascii?Q?4HaVfx+zu2z+uYTqHjGUo9oTrjNpC8aoPqVEA4gY7Qngf8+z/owI20x65lOd?=
 =?us-ascii?Q?D1IT2IuEleYBnz1cSkjVFNKR0McnSSbP2Xy14QaAp6nclJ8wCVMXOUW6821P?=
 =?us-ascii?Q?ex+jeZ7db1i89grgl7Dai3lWNkWC72/2oZ8EWNAXCsAKd7Pzvt1KrNfXpBNm?=
 =?us-ascii?Q?zWmjF+2kKL834byy5yHZJp7Dg+tticqnPACJDgRD5jgvqjbZOMV0w+Q1fxna?=
 =?us-ascii?Q?2F/XbAOsBB+1fq1OpmaAALQF7boFcTCJRG+WvSHAAEeIZZ7ZfH6MkZa2YJ5f?=
 =?us-ascii?Q?SSk1EVDe8OBl5Gxl/uih0RuJ0RiIsPwPjwc9rtqgZf0q8OFK9zNZ0SPCyDBV?=
 =?us-ascii?Q?aDyoqKUSiC1qngg0PkL2Qh841tvl0P6/05CkEp9sLf64huSvBgIDHKsP3tNW?=
 =?us-ascii?Q?ShDNTGU39SDSmUThDASq4tEojG/QAJoViXZ8XKcrug8HqMIwDqat/DhLPiVu?=
 =?us-ascii?Q?YpfcO8BMzCveJLbkTMJXWm7/dzClQjNtsQFXiKjKeHW29579JLXLnN0yV4Hz?=
 =?us-ascii?Q?5owEIXW9G4ggXwzCOAgwZ13zGDpG+/rA7IgtPUp6A6UAkVC2m33JRJL85DUu?=
 =?us-ascii?Q?TWbutOU0w/IaL5XJQzagm3GCblYPGbBkMXaQ02RBCPNJAXze7FBNFLEUULX+?=
 =?us-ascii?Q?MKzlon58Qs8034O+ECSVWKmxzQnt48salYLXUR0yyN0Ep6yCi4nEOuqdGx0b?=
 =?us-ascii?Q?J9cxj2KfaRo1vkyWSo2VRundjy1U+6tLB51c8XXTUr9e9IYCu9VzQmJhGlXT?=
 =?us-ascii?Q?0/iAbfrALEOrJNIo+QPvEcAjJZrvXFiKvGQp9m2jQX12WmJ0M2mURkv3zlVS?=
 =?us-ascii?Q?WXdYWDLlc5WlT8GEIMEOUblfDubabRYhV7yUos9WYABQWmYCMZaA+a0aneNt?=
 =?us-ascii?Q?NV9z0VDHIGlRuTxB79HR93qbI0InxO3aK6wXh5me+PwUVcjIAcec7+dsq4S5?=
 =?us-ascii?Q?7Mmhru971gqOeUf9wh26W+ylA0VWwdtX77fDRFfi22WRdwiXi6G77YYDRUju?=
 =?us-ascii?Q?SESq883YbzDLvbZ/Pet9BuXGWdt9e9++uxFG95+3XWNQuQK8jzz8Cz1wD2A4?=
 =?us-ascii?Q?YWnAThKK4yZha8FfAifO6CZMNyHL67KbW5P3D+/7MT6mQnHaSdeY71ASrcSI?=
 =?us-ascii?Q?l3LNf+lt4uQ+3xkDvDizJEhrgoS6PGi7FN8Fv5ERiNxf0ND8OTSSe0cEVKP8?=
 =?us-ascii?Q?xH+CiapEMGS561kQ8oiacSOyL12W0HNl83Eas/D4WmcUTv3cD4LM1jk9aViy?=
 =?us-ascii?Q?7AXklYqgJPnGyAfRsZc1ALUsz3tLPI7gplegqYv3gyJ82hThU5EM3KqfuxdW?=
 =?us-ascii?Q?t3ZZzXh4afIaRQvPrqbeyoGVKp5MxRWPE6tmo3BS4YHSEhg2rqlYNIbsNz8x?=
 =?us-ascii?Q?eKGuSNH0hehldpqFQlc/5LOrWnfN00wb+8Djkr7XvbfmWahE+huhdPcfexWg?=
 =?us-ascii?Q?ZCT6liCyKgfhuV8jLda6C38ddkpyFwJoQc14H68nisNjY4WfIPDU5eq8KTpe?=
 =?us-ascii?Q?GGhXHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:18.3490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34761198-7311-4e31-128a-08de540bfc17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321
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

From: Honglei Huang <honghuan@amd.com>

Add a new GPU capability set VIRTIO_GPU_CAPSET_ROCM to support
ROCm compute workloads in virtualized environments.

ROCm (Radeon Open Compute) is AMD's open-source software platform
for GPU compute and HPC workloads.

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index be109777d..fbd1838d6 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -313,6 +313,7 @@ struct virtio_gpu_cmd_submit {
 #define VIRTIO_GPU_CAPSET_VENUS 4
 #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
 #define VIRTIO_GPU_CAPSET_DRM 6
+#define VIRTIO_GPU_CAPSET_ROCM 8
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.34.1

