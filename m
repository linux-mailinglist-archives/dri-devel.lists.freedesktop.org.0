Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8CD2E22F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C8D10E831;
	Fri, 16 Jan 2026 08:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RSUlWuHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEFC10E82C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiVc5bnae3iyLbJg0PZZrNsrjfQbQwghssTbEicMRLhKlmslH5ZjL+Z2BN0re957y4q3TWW41XkWe1CixYReMxbFuoqd2e9xm8rliLae83llMsr4Kudq5E0qzAZbJmeWfBHWE31b8D873VKzwUBjOh8DP/5wqUajX+Pyf+N/rejRtF49QSKnLJJnCmO8PU3jPK7LyeHv4XbSP5X6KOMLGehBsmObHtPQjmxXaqHmysAoZ98rYIaOhDk+sOphO7C1Uhf6O1/t3uaxEuVI0TPi0y0xs1aNAeJcRIAFvrh4vbcfWXGZ2AmGhs3nuXHDPCOM8moZsBnwUbga1DnZp/Gj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIoHtz/iYAtbodNNogBL9NxXmDhehLIpLmN/K874AaE=;
 b=MNX+F/sM626JdstaUxt6eBIopjKMgdx4ihCdwtMWU1GMRy6i9yNaCVSdVYr5JcV3I6a+KPniFkCiEl3lU/RNd5lKNk+aaA+8r+COWt2W60mZKRGax0N0tMDJGGBTkszvmL9vL0LvDVMNG3VGrzgKvprej3EXb3MzjHgvVw+2um9IW6ThNqVuyuVIXYQLEDyB51pSUMrSIobOCbMXQ1/Jk3GPicux41qD3U6IMjjcX/wSJO24xhMzhkEnhnIANj3z7dCOLhIdzqZ0n6uO7xftbCGVHz2fGt7ZY+zdcCems5kT4/27E3jty/tfuYsxI8HEKi8tkkuyeaLuXJxMDFWZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIoHtz/iYAtbodNNogBL9NxXmDhehLIpLmN/K874AaE=;
 b=RSUlWuHH04XczHG3UF3Fxl22UkokOlG7zy27hsHuIdWCrvvEboMyO13mrPK/Aago331gjdC4wfnUREYl5Z6lAWGTHYCLq6oSsdm1TwaXUb/UdPSYY16PbkHsF6LPfDprRt3EsM+nSeq8ZCYC+Bgo6dUTJRDaAPPLYtzm4HKjAMg=
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:39:05 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::fd) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 08:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:04 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:39:00 -0600
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
Subject: [PATCH v5 1/5] drm/virtio-gpu: Add VIRTIO_GPU_CAPSET_ROCM capability
Date: Fri, 16 Jan 2026 16:38:04 +0800
Message-ID: <20260116083808.325180-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116083808.325180-1-honglei1.huang@amd.com>
References: <20260116083808.325180-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 88080667-ccbb-4911-9ebc-08de54dab4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zDTGjnGoryn5H1+fpTnVin28EOTE34yfj4lalQ9qmtzLRuE/l2D9czML2N8X?=
 =?us-ascii?Q?u3kDKLUJo8gZygDkDqcEfyiUnSjBy1ZAy0U/y3MyV2tHB5nTmw4EmlJLL9ue?=
 =?us-ascii?Q?m4RomUKy58D70WcDRNlcavgooNTq6hobguuCuSiD5/freCNheK3Vl6xOQ5qn?=
 =?us-ascii?Q?vVAxq+r3OUx04IXlI8JlhhQH+2a/aazh+/baHybE6gplcFsS++YHxsVObh0N?=
 =?us-ascii?Q?yXDX6V6VpgiFofxfyJ2THVlE+b/JYVVnyRJr7p5jCNq5zCOnTBMDsWrNYm+r?=
 =?us-ascii?Q?/QjSJ5x3igSgERLq6Sr/fCnks6yd8GrEmzevXUuANlEEJiQRjNilbv7p5OTe?=
 =?us-ascii?Q?ns6c3F37spePXsAUDyPkufyckjZuUWXxPU4OfyQ5oIzoubY2d0wG3AAXbren?=
 =?us-ascii?Q?jp1SZCvCijTZ/hBZXViOE4ZjUMYYmoIoPT8MKp1RjJQUgCG+kl/1uuTD3AJV?=
 =?us-ascii?Q?q4gx8tw9TpHRGYD2FV4dwMZ2ylxEizHcupKTPmHzPuK6k9fCNznvHD5S3Cns?=
 =?us-ascii?Q?d/I2Ao0gGpZ1QwH2BMHy163yakpiXCNZZ62UcWaBNCDmaSNaZgejMDppb6Jb?=
 =?us-ascii?Q?mBdvAJZG3eWQCPWIQCCZengeWZTcdtWxIzwMmDe3bRhdzmZzkK4o1OtaZeWb?=
 =?us-ascii?Q?iXmh8KsKPVmZnBbuCTkH5RX8MB5Dp/B7eLggNZOIZKt1fqI8CeTnx813gyb/?=
 =?us-ascii?Q?dkpXax0Re67x3siSz1JOonfQwVgbd57j1trUClja0baP4wcAPPD4+izGQLQQ?=
 =?us-ascii?Q?xt65FNBN0jw+lprhkmYotI7vw9wdCyYjrEhqBo0Bwz6xnfW2dE8yCcsH+qrv?=
 =?us-ascii?Q?adQICgFVNEIeDB8ZHwxmFm29EFiqOgVqk8YhAqJaSYUWTFDGUp5RSWQnT4iq?=
 =?us-ascii?Q?ukGXpicKVr8UrFUiYuJOnquGRiEK2kPWwt6C4LzNf2pQ8I0rk5RDO6NvGOjQ?=
 =?us-ascii?Q?0/QQarB73Bh+LIdyEoGZ1RMkzOnxp8F6ftKtUiYGxfcDhl8W4s9TViHaMPL9?=
 =?us-ascii?Q?gA6iNSemMeRc4tgJplLmoZabsNNYYrFChxI9R48pXuKG4sbTTZAnqhylhYEU?=
 =?us-ascii?Q?rqspzNCdXSJkMpCvunLJVvmRN88RqGuYPz54ZTKrkwLvqelR2gddmVdCxrZ1?=
 =?us-ascii?Q?nppvuz0RhniDqIpuQNtmptlA14Hqh57ry06iXvTwWdUe2r2dU8y3hVdxEOuh?=
 =?us-ascii?Q?pG207OXkWWMXv5WaOMDvYZbMdZBMJDIiOYHZ1LlI3XV1UHzdSL7oW2taD3rk?=
 =?us-ascii?Q?OMRz2PzFYyPkxa5b/TQ4y1i5ucIXFR+W5cqbSvmHipfwdth5Zwr+uKMf9+Yq?=
 =?us-ascii?Q?1O/TmgfxzgKbDS6+duP6dxOIJHpt5BQy+F8HxSS6Fb98MMYVmnFlQp+qt+Ws?=
 =?us-ascii?Q?eCRQ89HC6DuC9k6kX4eIZWtDUuZLiRCQn1kJHHYYijabYEKf25UwDFyItyUr?=
 =?us-ascii?Q?0UTrnJjuX04LH02wMlZg9uD6bB+ZDQWdrTSjrgMUM206KZv84ISWCjVbNBh4?=
 =?us-ascii?Q?/cuGewB76sO4fN1c2Wj/bnwEkS87vFYXXQfuEUjwzGhkROe/82q4druStax6?=
 =?us-ascii?Q?YJC93GH+Mb/77pzFG/GI9VVFDaDN6Du+guli3TDfQ8VdPWCUkBNvmKDWCSh4?=
 =?us-ascii?Q?M8rZ6ojHEJG+kdHRnAZmp52DsOqaaw5YzKX9haKlOb84SlOWnD0b4LBpc42a?=
 =?us-ascii?Q?jWjcjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:04.4416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88080667-ccbb-4911-9ebc-08de54dab4b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860
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

