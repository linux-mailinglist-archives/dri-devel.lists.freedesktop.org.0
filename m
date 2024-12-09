Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD629EAFDC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4CE10E896;
	Tue, 10 Dec 2024 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fd94PfQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4881210E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfR8o0wypb8KscQJXT9lyOqBtl8dJK4RoshHBzdXHU9GHHG/DjqpN93/clFz1EwIiSnDlqZQZRFoIsYAUFZTsCwmX1StooJuy4LUPX5Z6AL6Rqd2BT6yxd3k5VIkveDY4foZV98fii4gfZTQEHfu1ebFdA9rtTAPvYPoFr0P6EBh7qBlPTXaDiIeBrY6qb8XdqGkvYZ8LwT9xjCQ//Khpp+2n0smP+Byby9Paq0Z8o8DY4m8NREGxEfvO7gQ3Hes1I7LsOLXN4hsJaiOl5mdeqJHvp3WXi7jC5qkKeWtjtppeRTZxPLG7R8RzJqGgaxRWdWF55Bc1TqmpwIXOnFOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp/JBuZfOHm9txp7YbGInJWF08WSuP7AD/ch4lf63QM=;
 b=Oho5K1t/jjdmLkxtxQzJez+q70dS43Muh5BKnVQGdBL6bbqxWTbWNZkNwq0mo1ZhcKgoTVrkKwK3Xlf94+zIBbXnFyJadfjvRsLNUcMsxsQyr5nWXh0k8GleYILyO1/WuHzX19o273ZamOxXxqtdB5GpxJEVuB+4sL0MUaX9zlYbLLUqn6+SjuQuu7VSOy8t7fpJadM3n2NfmQ97/NojK1v/H6SF+qVhmuVBgDXhz4++/MgnisYOAzHKV4BBpjPGEpBp46yRuSH5ThDBIyt1potHMsNz7e/2yhBuIpRjuSzzmhwM8CjD5mpzRz+e4Co4TG5NqMWXIK58i8x2Oqsrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp/JBuZfOHm9txp7YbGInJWF08WSuP7AD/ch4lf63QM=;
 b=Fd94PfQsjm+5YbXep3VtivcsIhff9njPtnEX8BSh1yf2e85sB+Vr7sUb1+vQFQAtxodZfhNvD3ltdHutt/cxVHTCcqGefGL4aonwHa2JbhDbBA+78pNYUlkMb/Lz+ZlG8S0HHshXcMxerA4b8Ckh9VT7f5iLrB42O/+5P+EWn7xVzvJy7exksaGBvubqxFYK6dq3IMN7oHZWS972wxByE7PtUR3MnWdjqAwmOvsfqZjqAvkxnE1+6ItWvehXho4WcF2/CbkJ8ebHPox5wLS3FmMldkSxf5R8/sf8yz17AG63maJIDKW2bu4WjHkviQS+MI4jc9RZJUGwmVeN087Y2A==
Received: from BN9PR03CA0499.namprd03.prod.outlook.com (2603:10b6:408:130::24)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.26; Mon, 9 Dec
 2024 17:26:19 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::b7) by BN9PR03CA0499.outlook.office365.com
 (2603:10b6:408:130::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Mon,
 9 Dec 2024 17:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:01 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:00 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:00 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 0/5] Support host1x actmon
Date: Mon, 9 Dec 2024 09:25:44 -0800
Message-ID: <20241209172549.5624-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ad89ca-90ed-495f-19e3-08dd18769839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CvBha1yJXEOmAIKRo/guPsK9vV4kmkKmZ8oFhEc9654DBUHhOdsqfE7XYP9Q?=
 =?us-ascii?Q?OAR9pqVGcAnQXjzE7hO1l/y5L/X/C1MCnlxQUuFentLqC3SZnqyCjwuQgK9k?=
 =?us-ascii?Q?a1JKCyqtwO9wfkixX/AZTouiNbhiuyj9LwDcauIP5+I7P1mboYY3IjiKAMHQ?=
 =?us-ascii?Q?/8gQmOv2amS7AQEGOU6UUmd7p75/OqQtTRRJoeFdlNqpdnUeVJo/HhWhtIXP?=
 =?us-ascii?Q?lDzr9saskNrmIGtg8CIiYIXT8IWQ8HbuVtUAnaKYzLHsrJrRRft3GY6GPko+?=
 =?us-ascii?Q?A9/2NCTRQfosLfTG0mZG+zqW4WZ3LRyRwM8rWtrXRPrrEr90iV9J/I0/+2mm?=
 =?us-ascii?Q?QyaWISrJx9IK+QP8ZPfKOnRzUkL5HfpKNQBXVlRW2j+vjm68+oPQ4gy8QDhL?=
 =?us-ascii?Q?eT/WP+/SncGX7G6gYm+lw7REWEngc/yNH6NP5B8hDJ+VZvS15Lj+mZzIl3Kr?=
 =?us-ascii?Q?UfWffMH2asGdGuTLcA083m+EdSUWmHMY9jxBjcTW3cSVEYnxjlaQwYdfL6ce?=
 =?us-ascii?Q?/FeJWYcr2PoMHLikax9YUREemwDmRdYcKD3XtHZWbNJVIaBRMM6dT4hzrDOa?=
 =?us-ascii?Q?0dgGylP2fcflqNtwA1ruwOGzKkbEnOLjn1mpDXsJSm0equeQEWLPQp+yfWQA?=
 =?us-ascii?Q?xKs8yyXKBoq5gAiMHeWBveC1pYY4a8aA6Y13qgY/xLryDrEELCi3FFiNckxI?=
 =?us-ascii?Q?WZzgeTcTq6l8FENpylw+QdQVvpasEWiNGbK25tOyJ6u88Tj1UNVoYS919UMx?=
 =?us-ascii?Q?JdqsTMwolRXN5Wp9Q6fI9er6LXEu14x/MinwRlKnTuyW4CENrNcmQDcGKMmO?=
 =?us-ascii?Q?MzowoKRePkzwLt+XGNbtKuNVM2k+qv6u0IuDIX6QnIVSVNs2L18TUSSYQ+0O?=
 =?us-ascii?Q?2YK9hE5Wz0IvaOSTeT83yx5X4p81SMVDnBFbFjucjLB/anccNgfOfWpSuKPn?=
 =?us-ascii?Q?2ewO8e14WfxBxqYTnyo6IRAf5B+a/YW+CToeRjVTiEngFmPJ5c/BPI37su1i?=
 =?us-ascii?Q?ZSI3gWLzWUnOp4ftmYtdzvwm6ugf0v1JPQCjDYvjJqvfJc3wgZuqXEcTPu4t?=
 =?us-ascii?Q?eEgXO7RbH7rDOvDVX4rNtdL1wYRqUL74WFMdpnVvtWfMLx8FFdz06+ih95+6?=
 =?us-ascii?Q?Ze6YWD58h8Y1QroBIRYUi9GLoIasCTmrh748gKw/KSEC5ItC49hG2nCpPeSS?=
 =?us-ascii?Q?/qXbYt05KM89FDCwTi5QL32yJlmFR/b7M7kN62AeB9t295T/NqQvakE6nxeT?=
 =?us-ascii?Q?z+YLdXgG7eVw8/djP6y9B7JmUFzOCvX49hvvCrjJdi68idaWwdIj5zb+HiJt?=
 =?us-ascii?Q?Gkr5NprGNlSdz9v4imwY5z36UNop50NZlWLhVa+AxL2MIXv07Xm1K6APZEIy?=
 =?us-ascii?Q?2nMP3KlahV9/PHjWJyl7vnZ+VBMbXQHG2DFv2O7n2ceQJ0ricYg7faq/RjQn?=
 =?us-ascii?Q?oRdTrv54MuM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:19.3533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ad89ca-90ed-495f-19e3-08dd18769839
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

Activity monitoring (actmon for short) is a means to dynamically
measure the utilization of units in the system to help drive software
power management policies.

In Tegra, Dynamic Voltage and Frequency Scaling (DVFS) is the primary
dynamic power management mechanism. It uses utilization information
from various units to select the most efficient frequency and thereby,
voltage that the unit should operate while providing the requisite
performance.

---
Johnny Liu (5):
  dt-bindings: display: tegra: Add actmon information
  arm64: tegra: Add actmon information
  gpu: host1x: Support device monitoring with actmon
  drm/tegra: nvdec: Register the device with actmon
  drm/tegra: vic: Register the device with actmon

 .../display/tegra/nvidia,tegra20-host1x.yaml  |  45 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  10 +-
 drivers/gpu/drm/tegra/nvdec.c                 |  82 ++-
 drivers/gpu/drm/tegra/vic.c                   |  39 +-
 drivers/gpu/drm/tegra/vic.h                   |   9 +
 drivers/gpu/host1x/Makefile                   |   1 +
 drivers/gpu/host1x/actmon.c                   | 558 ++++++++++++++++++
 drivers/gpu/host1x/actmon.h                   |  46 ++
 drivers/gpu/host1x/dev.c                      |  71 ++-
 drivers/gpu/host1x/dev.h                      |  57 +-
 drivers/gpu/host1x/hw/actmon.h                |  49 ++
 drivers/gpu/host1x/hw/host1x08.c              |   6 +-
 drivers/gpu/host1x/hw/hw_host1x08_common.h    |  16 +-
 drivers/gpu/host1x/hw/intr_general_hw.c       |  83 +++
 include/linux/host1x.h                        |  30 +-
 15 files changed, 1074 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/host1x/actmon.c
 create mode 100644 drivers/gpu/host1x/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/intr_general_hw.c

-- 
2.34.1

