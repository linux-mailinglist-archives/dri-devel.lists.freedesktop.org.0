Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C129EC523
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C9910E5E4;
	Wed, 11 Dec 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hAAHvP4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64310E140
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDu86M3DSan61pnqxav4uiMh7WgH1iCO6Gm6c0AGrxBj8/3Wn9DudCvSqf2698C7/CedMTYdtFqDoYt6fdKRHMbj6QJR3yPBv8Kl+8YsXOaB7aF0pm94oBjTfRgI6sft8OMRdQQfAKQcRdooGE97ztYor0tOH08m3bQWwL+TBMk6qlK6pX8Ig2gKhATn5toSPdQfCoPYyWiUjizKQ2w+ijGZ8Dajct23b0RnsgtFed15EZliMtD98iHsF7EUR5i/Wsan3xS38NLrXlpaK3ukH68QusBNhhOdaAzYesVGscOWHYwdnKExTGhUJxBxun+TGOBgmYKXPKcKr6eoAHr1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7TyIOfS5xTmcAqOqxV1VvowkfL/GE2I/pYlSGYQGfE=;
 b=VGhPjIezgCEoorRsfo3f2KHLnuHGTo6mMU4CClVZ+/c+WICU5mQYSlhiTAHQi+paKdvD7HEEd32f+/lMXTTTXxizsvRTZN2hDNdeyuylHPRi6FSaKLzYYXE9MK0EAcpXxFqAq1Ca+KsNygrw26sbOzgyZFQ/CgGPGgU7069DEC54RiKmbMntcSBXmalxzCpFWFX7hZItHvUaqbGTMM8Hhaxw84oA24OOvmo6JMbPlcozgal67OM4PDwGJDjb3RXw+e+O22C+pfdWVtXN0JF9jNEeRrCuS0x11PXZmL1cz9VwCdx2QHo9dCnXcPVugavi5467oUsGU9GN3skXiE8Fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7TyIOfS5xTmcAqOqxV1VvowkfL/GE2I/pYlSGYQGfE=;
 b=hAAHvP4s4GlT1FrFPKIpsSShN90SLOl2QD/IdXpUAyt0mfTYvcpNTKVQNHn81S7PB3m33REFqgLDhxwf/tHhdk+ZgDCb+l1hDzEQrM4Cx/Y9ljJZdROy9qyOVRNhc51w24uoor9V1ZIIt5lfHaUe5vF0WPIiOU0YIH39MeGNMFLoKGxM3I1sQee+9Mk7y2WD17xnvm9V7aQohP1nq/NyNa5lTpU/bQJOOV+g4MtgyZajfgy7Hl2KXFrKwXL3Kdk4MC/P621u2WXJsyFYSXFWuQOVeDMsWzSp4JusudHDxv2vXzEWzOnXh0MhQTEeJH2wqv4KgxfBhNn7OUXYkRevSg==
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 17:46:13 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::f8) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Tue,
 10 Dec 2024 17:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 17:46:12 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 09:45:56 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 09:45:56 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 09:45:55 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <luca.ceresoli@bootlin.com>,
 <mperttunen@nvidia.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v1 0/5] Support host1x actmon
Date: Tue, 10 Dec 2024 09:45:49 -0800
Message-ID: <20241210174554.18869-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c56ee1b-c8c2-486f-7630-08dd194289fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZF0pS2P8vn/6t3tc1JWSKQDzSbn2pRAatAOGhTlLQxUg1M8GvpbxpgpNTC8J?=
 =?us-ascii?Q?GBLQ6Yxc5QXUt/MOSvqcvJYlNRNCHbHtXxrV1NcBzeDhlUfGWJ9WmUICXn3a?=
 =?us-ascii?Q?on5Ki3f51b9LyrgWMR0VB4lfjf827KSXntuwBO0x2hMJaPaLG8sbM/xDBmJR?=
 =?us-ascii?Q?pnWzoX/sUS2UYw/slSgXSxBBcLWqQqnbqKfCHzPzTlxLc8wDZMvj6kLps00O?=
 =?us-ascii?Q?CdpR0I8LjDngzAoFbsyi53Eiuv/XeH6giMyJWEXWKeSv/1OoQfdjHQKn30my?=
 =?us-ascii?Q?+rCnRFU8TkhBjHvU72S+Iw5blFNEPAJ1gXLMHrnbiSWXIVvm5Ft/BUuuewrY?=
 =?us-ascii?Q?enUFXBjOjvPzGxgd0Jly7iyru8rPfb6Wub95GXrKu2hEHjADtWgkxLKTOKV6?=
 =?us-ascii?Q?ulyVaGLCA6dts52XyVC0wtvOWes76ER6GUbbMXd0pGPq3cGmeLeoycqXjX9R?=
 =?us-ascii?Q?gLujrM9PBh9bT+pEm/BOg7Dr+YzmfWndNtYifKvWLvVE9pDDSnnk8HrZP33G?=
 =?us-ascii?Q?/7Yyui3HKvrLlD+Zt9V4DazdzMfndsMBP0QPYUqanmO9go4NUTbWphj2rb78?=
 =?us-ascii?Q?9qcNULFylo+q/yrSActnxsGejNM/UQ2HIJkCH8bBQu5RP4O5Z4VSz6RfREvz?=
 =?us-ascii?Q?tjDDYZcnMc8qPCM4g/+49DTDEgIvBAjUzHq5XDGbKxoVNC/CzJpfrKRVNOj9?=
 =?us-ascii?Q?f8CUxDfRoHkwrkWj0zY7RZqBG0rA3cPLIEixWd3P8yhG1DWGGeMwNED4kobV?=
 =?us-ascii?Q?EZAHrd6dUBbbbYFhpL6ry85F8GVeQ5qSejm+dqYlFkcLKuEVQKx5ZKG6g0DL?=
 =?us-ascii?Q?6+rgdtuyv9ILXHg/03P/kdReokQxBkjMlW1dDdlQETyCETnAv40i2Eau4teY?=
 =?us-ascii?Q?T0bW4D89N8qfh9zirQtQtTNXLbomwPPIlrd1armXNP7wR45QJjKhk8Jx/JNj?=
 =?us-ascii?Q?ktdrE8em59+2zEQUU5WcDP7pptgAiJ6SLRAOw7pGLj0BX7NqEvguWhP+8Szc?=
 =?us-ascii?Q?OLD8Y6GV0W4J/XllgyrgcYNx5jUdqVFFwYqYDzyz+e6b9PlXf5Pk8gKlFvGC?=
 =?us-ascii?Q?I6zlaSTgKPne4RLdbPadf4zhoaC+oown3po+P1p6RqQBpBhLi0lBPmhkLo93?=
 =?us-ascii?Q?JcanGrLQJFaBKDBBb3otivTU6969D6h3JLmX3EogeSbvP+TvyHILCp2j/eM9?=
 =?us-ascii?Q?nqWcyjhCDwu5sU1N3HleKL479UMLnxpJtWqOZs/0Znk0g9Uo71xD85uLc8rp?=
 =?us-ascii?Q?M6lTwe4I4jueTDEMkXcgTAtAGW8wa1qmR333lZOa4vFmvQaqlF2TOPFFX7PK?=
 =?us-ascii?Q?LQ4U+Ear/Au/A2D6Tq/wgBQRN5hY+if9xNWyXsJcTEuqQw5Qrpowyt66qhVR?=
 =?us-ascii?Q?I4qvCVCxvl7siLUijFZXdS8oHFp1Uw9TlKrxZu2Z4Z29es7i0PF2wT2lQc22?=
 =?us-ascii?Q?gWXUpwMLIjfPPh77wnhbkrvf324t7ObW?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:46:12.8228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c56ee1b-c8c2-486f-7630-08dd194289fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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
 drivers/gpu/host1x/dev.h                      |  59 +-
 drivers/gpu/host1x/hw/actmon.h                |  49 ++
 drivers/gpu/host1x/hw/host1x08.c              |   6 +-
 drivers/gpu/host1x/hw/hw_host1x08_common.h    |  16 +-
 drivers/gpu/host1x/hw/intr_general_hw.c       |  83 +++
 include/linux/host1x.h                        |  30 +-
 15 files changed, 1075 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/host1x/actmon.c
 create mode 100644 drivers/gpu/host1x/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/intr_general_hw.c

-- 
2.34.1

