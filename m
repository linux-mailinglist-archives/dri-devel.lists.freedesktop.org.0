Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1C9F8FB3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 11:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A249C10E14D;
	Fri, 20 Dec 2024 10:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PQILLCcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52F10EF5E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 10:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azS/nsIhSCIjlwlB0jx2R2exb8Sv++etq+hGJzx/gmEjs3gTJTkclP/i9Zw8eT52nkMAtH80QHLn7m/Wtnc5exB6Q9NfS+S07M0hCYnytFRNA+q/hefkCuPR/u8/GfbQ+yf08mP98EhCifAW+jsz1JR6+Kh9sFKfOJQ5VBtW4I0qb7q208Nd/IB6Pd/JSYVpp6g7h1a+EJZIFYu9hRy3+jHMx2Qhax04G1JtEb/e3vyQpSXA3fegn5qF2MsQBkIpx+BfXZHZTQPqel8pF+MHaLRCW9/pwzzYh/6fD01lJObYIg9Tan4W7kHQNdzCvH510p844UioyIOLd7UWH+tSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz9qHFH07VCF/w1pHtRrlle9YmLvpw6IU0lonHHo7yI=;
 b=Vj3PDxAX2jZ1hoXwT54tvEjbrzAHIJvjuo9F1AvRSc2UyCnb1qHjPc35uoQd4OBTU916VcuVrr/yXr8VaaWBAMHZ7k8fbOkZIzesrhQaxq6mgMLMOCGq4KlwV7+EHV41r/1wDbYwMnpSWPSnvEuO1E94pnzLCuJ66lEvq+yhsV4Fy+Dne1anT5FMrC68NtoGzlcSNmO2HKUDrcYm3zUwjy6/6zmIZNBGCzCj/PJzK+L1WE+2nYMKkQn2vztTYax8tIOHIvrvCAyrAvWksOmm3DCbTzSPeH/Ep/NzNqiOVd3xQrqtmARmMX2WPtfqx0DIeWX/zysc14pQrjredThxiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz9qHFH07VCF/w1pHtRrlle9YmLvpw6IU0lonHHo7yI=;
 b=PQILLCcpeD9jr+yMmOeKrFCvjxLZY3D5kKpj2QTs3M6xShmV6yuH6KGz2AY40SfHZOoVHDRumunXWPFEjHENk1oY0kKXMjp25RIhZdF3q23aGVjTqo3VqSCS9URKqYRMXEc+m1ctyK/1U52HivnJBbWy4n7s6rfgVOKQUCruj2c=
Received: from BN0PR04CA0174.namprd04.prod.outlook.com (2603:10b6:408:eb::29)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 10:04:31 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::73) by BN0PR04CA0174.outlook.office365.com
 (2603:10b6:408:eb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:04:30 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:04:27 -0600
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
Subject: [RFC PATCH 2/3] drm/virtgpu api: add blob userptr resource
Date: Fri, 20 Dec 2024 18:04:08 +0800
Message-ID: <20241220100409.4007346-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220100409.4007346-1-honglei1.huang@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c0f6ca-5870-4eed-411d-08dd20ddb268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W4Rv9YKUXbkjoUEQRu4sg1sWyKcR367srSVXKsK0J8Wit6MY87Sht/lNs2cc?=
 =?us-ascii?Q?tGutBz/aaXwik1x6mqhPqYq4V11QMZ0WcJwFXaFQCXsK964ekZ/J8/VF6Ic/?=
 =?us-ascii?Q?DA9Z34h4/UtQZ/udsMXqF5Zk+aexTjFdT6l+BQWEeNfORyrXqMXYNpJJo5YF?=
 =?us-ascii?Q?sdyvzlr4idWMQvx3Xtljxsq1jr5SqFwf4YODkf94lhE4RIahg+stxXsO/C0O?=
 =?us-ascii?Q?6vPciunwVg5dl6XCClDF+pGU8v6Ew5B77SWoePOE21x8tCQaxlFGQUsb3CVh?=
 =?us-ascii?Q?/WIA+PnaggVGQtKfbmbR2wkKeBipdgUTcISxFdcTXzd7xOg+3IWrvEfpTARM?=
 =?us-ascii?Q?0i7Au3ri/DvbL8+bDU9bo94mI7JhzZYb52DmVE7eIujEqHv94rIpM2gZViph?=
 =?us-ascii?Q?aCwBpk850CndHltFXUAX6jyy2GHoK9IhlmJpwqYpPCpg+uHI+vVdXwd++kaS?=
 =?us-ascii?Q?wGymynmo4WzjDcIsgTCY3hchGQxITwsvSUpQC3V3aRqjryVTaGXlm8q3OWf3?=
 =?us-ascii?Q?NgmE5VID4dFqHx9NFB6nO8lu7tkOI8vL7boHjyouZW7BCzwB03WtZ1aKZEhU?=
 =?us-ascii?Q?rZzcN63FSPy5e7ZYuYxV+kJHdOC9y6ayTCos24E7zBUvB5PB7iRgOrMmHNTM?=
 =?us-ascii?Q?dbQc0HSIWr8oLgm7M24S4RRRJALDwNAXNWaCptyv40i2FPoTGA7P7F45w+C6?=
 =?us-ascii?Q?KeZvOMouKoUCsd4jtUBxDg2lCVtTyz3KluqGfNLWyKPOeupxav3pS32xK4qE?=
 =?us-ascii?Q?dODIxCvsLrbrHh2OIlm82dCYTvHRQyk7iuiJrtUF2ZHXnqMJeDp6Nj90OB7d?=
 =?us-ascii?Q?7Rf3uyxk7m7jnhxRAM5F0pUFA+uwkqF7xr9IDs3ucKqthpn0VWgRgyoiVI6O?=
 =?us-ascii?Q?q5FQ+4nRq3f8rZ371biO3z6mgZio5DWEnURwegB9utlL9kh+NL2C44PKbiaq?=
 =?us-ascii?Q?h8BFPpStByF8O2K8U0hytjRdAMSIbjrNZGNCZCTucLy3wmGNGxJpzbcEBgKu?=
 =?us-ascii?Q?JrmFSE6KXYmpP1+nxQ/cO30v2l9QtmH4KMzAjApIrD9ALN9t+ObghwBU5mUM?=
 =?us-ascii?Q?iKgm1UuX0L8P9WyY0Fittl5HP4b3P+SbHrqnkVTVsjPFowlpQO0TtxEjGq4D?=
 =?us-ascii?Q?LQMhSvQuE0O2AlZzbDB3F3oguKkJ/9HS/pv1v0SoTH71RJUQv7zaIW0mG2/Y?=
 =?us-ascii?Q?aYN1CqTBqVzShf1/5G/sWHdZ9HAmbwQAAgKftTHa/FmeBNchzpUT5t1r3Pxi?=
 =?us-ascii?Q?QiT/34ig/FRi1DfqfYMLBwNyjwPCEf3RsCkwRwcb4+BQGEigjwvb358SjTFD?=
 =?us-ascii?Q?3cbp3CSve3N9Dop2ixDO2ua7MXxw6obdona3IzLSWdI5uUpnBJYAoLQHBsi7?=
 =?us-ascii?Q?Z04sd/oDn4OBya+GxOCqPox7J58nfm0NcA/geS3f63TTRFAAlT8IeBfbOXmB?=
 =?us-ascii?Q?tOKMxNftFQg2J7M0bSZmtWhwFjjis6vmoD0TDUAFXHdsZcZdUd6mEhObQiTi?=
 =?us-ascii?Q?p6l77KtdL384JB+VGB7WZHsTNNcMNJRj3iUx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:04:30.8891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c0f6ca-5870-4eed-411d-08dd20ddb268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328
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

This makes blob userptr resource available to guest userspace.

- Flag VIRTGPU_BLOB_FLAG_USE_USERPTR for guest userspace blob create,
enable this flag to indicate blob userptr resource create.
- New parameter blob_userptr for bypass userspace memory address to
virtio GPU, like other SVM design, virtio GPU needs a userspace
memory for device access.
- New parameter offset used for the already created blob userptr
resource to get the address offset between the create one.

The blob userptr resource is used for SVM feature, in compute side,
this feature is must needed. like in OpenCL SVM feature also called
userptr feature, it is for let device to access userspace memory,
a very basic and important feature to prevent large memory copy between
UMD and KMD.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/drm/virtgpu_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 2bb2d3a0c7bd..19fced75708c 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -181,6 +181,7 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTGPU_BLOB_FLAG_USE_USERPTR      0x0008
 	/* zero is invalid blob_mem */
 	__u32 blob_mem;
 	__u32 blob_flags;
@@ -196,6 +197,8 @@ struct drm_virtgpu_resource_create_blob {
 	__u32 cmd_size;
 	__u64 cmd;
 	__u64 blob_id;
+	__u64 blob_userptr;
+	__u64 offset;
 };
 
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
-- 
2.34.1

