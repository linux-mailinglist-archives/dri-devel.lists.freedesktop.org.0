Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A19252E5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 07:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375C810E545;
	Wed,  3 Jul 2024 05:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xwvjnGd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65810E1CF;
 Wed,  3 Jul 2024 05:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgZvcTUvtxHBPhWdYE1X+TiWU3O9lhM3D/uSgTnK/0cLFRJeN/Y6RhFycojp4a7KPi45rXApA25vN/Jf5BJSy2fii89t3PfGiFfcfd541it+cpZ+q47IzPMevxCkL2LQhcK05N+kvepTj5GnHYGDS4cUTh9R2/XrdwmusvGqlUby6Eq/dxgXyZgoDg7ubaQcXclxlkr19V2gNfgwGBoEs5A3cUaQVoe84iEP0ooRiFNrZTJSxLbygrIxY8mcyaSdP6hSSkHCyt8XcQCshTRx7CZLRx5ieGatHj+C6JNmRjkKv1sleHzbLfXc4GDbCh4FnXQld1rY3okjfAWD7S6AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsqezhq5MfKN9dU4xK04+sND3Z4UnCDlByc58dHT6Uk=;
 b=kd2oYFcnvun+0djFZmElFqwnHpC59134ET4HTvBzIBufRAnQYOcCcgvSyZkke5rpOdy5gFIbSrRozTp28XkXc3mDno/XyhQaphsDeVfBvsOmo7Q2Ecwi/G6qwvNpjM85Bny9YGsavPaDURdYvwlVsZhUagMJdex7NytKORJ7skltkuvfBZfLkvdt8iJFINhv1wvocUqsZ4LIwyI//4tIRylXtp+lLadg1Oz++bMGiVORq9svgZv/TBNQrP7LduNR5CoML+iDV2E6VZIc9kphaApLtQGZjcTFy0q5oShW+P9DKhw2wW0y3qN7ELp2U9iCS5C01tSCBBo+5xSZd8JbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsqezhq5MfKN9dU4xK04+sND3Z4UnCDlByc58dHT6Uk=;
 b=xwvjnGd8KBbtzvWxL37Ymq1SrnQ5159zNSdrOVUFPcv6qHCyIf3p4zZ8vn+J6HinUdr3DrU3KR+lzju8qtZ/Wr5zHlE96XUTLL9Ai65YrWT9tZUYQQfGvca1PccUUsEhR8PSvEJDyVsm4ZcjX9F2/HkvUZHy1XYYtU/3gUrulGc=
Received: from MW2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:907:1::35)
 by CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 05:17:43 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:907:1:cafe::5f) by MW2PR16CA0058.outlook.office365.com
 (2603:10b6:907:1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Wed, 3 Jul 2024 05:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Wed, 3 Jul 2024 05:17:42 +0000
Received: from AUS-HP-PV-STX4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 00:17:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v4 0/2] Add support for 'power saving policy' property
Date: Wed, 3 Jul 2024 00:17:20 -0500
Message-ID: <20240703051722.328-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|CH2PR12MB4232:EE_
X-MS-Office365-Filtering-Correlation-Id: b8771f3f-76de-4a4f-50f4-08dc9b1f7747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KWnWR4RXYNMDcrak8tFqVupmlK4lk08yC8BH3WUWuDtYo77S8vLVBETo8e0r?=
 =?us-ascii?Q?oFX7f1MLq7wWJb0S3JOKKGv0HM3d7EEZBghcvEcsL7h/EgSg1fnz5uL2WyRx?=
 =?us-ascii?Q?HoQWPHY9/uSgxqOj9vHdyfwXN5hB31s7my11/sICmJbzwjMP7OxoPbaTRsQN?=
 =?us-ascii?Q?LeBK5WV3UP5DcwU7i0lqaDQ9GBq5CTLLmAGpPL5XDlRCj7s/2fq2aUzC5/r9?=
 =?us-ascii?Q?jdmfX5W7w6dOmSItpbu4GkomshW3FhFpzOthHJ+9PPYrJJ/H7IHuE+aGSzQA?=
 =?us-ascii?Q?UdZYAUlIPTKt4XrGmS8HxF9sQhnLHAZIZUUIU+SJJ4GW/v5v6w+nHQvDYnv0?=
 =?us-ascii?Q?6RrKhz0n5JpE21a2r0D48B6ihe9CL87t0hHzBbOQC/kheJH7rOA6wVK2Vz9a?=
 =?us-ascii?Q?8Hc5yHd0wtfAdlKAN2d3c5X/FFKHvVZnZg1HS3eXTaBX9vmh4hKg3VCzCxv+?=
 =?us-ascii?Q?MflbSi3nbGB7zGitzO0RYP4xidqkYlE7uzUItxyWdxNq5vNN3m3WjDsPIVTJ?=
 =?us-ascii?Q?DoNxq9yOk9McIfEizbwADlQS72gKr6mRlwPKxKYUAWMp8Ues1tsZXBvbEUdy?=
 =?us-ascii?Q?nw0OmoR1LRpTmcXlpXzdWSHBLNcSJcw/fEQcGdAuRUrsvr8H+DBouoQb0/Qi?=
 =?us-ascii?Q?GWv0CfGeKZGqwbZIQC5GojUB4BuRokqcPkQZ5vxrOJ5ds6vWF8P8avbkR0yW?=
 =?us-ascii?Q?fYtCwCI27BfHZYaIR/R93d8cBGhleWgFSYkH31L4gAvqHILeVexUAlTbv7v7?=
 =?us-ascii?Q?iXCVSDCR2qGDLdhsXlYJEE7Esu+7ZBXGC5oVTkLCbKdrIgq1MvUjqMeVAXZq?=
 =?us-ascii?Q?ti5xRULf/CU95blTrrN9xpED7KOp+d1Ej386bWqiZbpYeUGgNyyPTRnxaL6d?=
 =?us-ascii?Q?PZy8sZ9YlJE1S23WXM1LCmiKBMlnVI5yu4nNx+8I/qSJsYGkiQAs8wTnYZCO?=
 =?us-ascii?Q?SZmogQI7VqR8MHyyn/8Z8iL4iHYA1HVx6efl6tCTZ8Wmwf1e9V3v2YrtjyKj?=
 =?us-ascii?Q?KjMnileOgkbd5zsxOgh8SoPkLJm+4txSDM32xf1cDw+lJLOm77D2rxk1Jt//?=
 =?us-ascii?Q?ChoRKc13xKEJ6bHOqj7yj6mNnNS6fEgGXRt4f7Gn5TorDz5goY94Sy7Yvgbk?=
 =?us-ascii?Q?c/UbxirbhB+wTYRk8jWIro94CAnZyXk3bHj51JMPp6dLKBQBxDT0nqGm5zCc?=
 =?us-ascii?Q?Cb2HuBBJ9RWF7tw1nlKzI76G2XCdf/5X56rimevmGqx6+Teu28GyEykRkkrD?=
 =?us-ascii?Q?b7177IQdzYX3XcFu6iTww+Pq5ObBPgtP5AIwaG4Mxk+ueQZ9TJk33weV7fHL?=
 =?us-ascii?Q?OZ7DUPr2EDQtMlbSGqhx0/aa0zgdLC8hmDXYHjmBorNCeF+bVHCXYlr6z3RZ?=
 =?us-ascii?Q?v3VrKad6QYvrMKkrLMiAmTcWyDzVuEhhrxr2h8BBnHLBOIqASvVxBVv02Dc8?=
 =?us-ascii?Q?KN0tYHirhXz6NY4xNxPrSzeFTfbLCdaa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 05:17:42.5034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8771f3f-76de-4a4f-50f4-08dc9b1f7747
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232
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

During the Display Next hackfest 2024 one of the topics discussed
was the need for compositor to be able to relay intention to drivers
that color fidelity is preferred over power savings.

To accomplish this a new optional DRM property is being introduced called
"power saving policy".  This property is a bit mask that can be configured
with requests of "Require color accuracy" or "Require low latency"
that can be configured by the compositor.

When a driver advertises support for this property and the compositor
sets it to "Require color accuracy" then the driver will disable any power
saving features that can compromise color fidelity.

In practice the main feature this currently applies to is the
"Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.

When the compositor has marked the property  "Require color accuracy" then
this feature will be disabled and any userspace that tries to turn it on
will get an -EBUSY return code.

Compositors can also request that low latency is critical which in
practice should cause PSR and PSR2 to be disabled.

When the compositor has restored the value back to no requirements then
the previous value that would have been programmed will be restored.

v3->v4:
 * Fixup for Xaver's reported issue
v2->v3:
 * Updates from Leo's comments (see individual patches)

Mario Limonciello (2):
  drm: Introduce 'power saving policy' drm property
  drm/amd: Add power_saving_policy drm property to eDP connectors

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 drivers/gpu/drm/drm_connector.c               | 48 ++++++++++++++++++
 include/drm/drm_connector.h                   |  2 +
 include/drm/drm_mode_config.h                 |  5 ++
 include/uapi/drm/drm_mode.h                   |  7 +++
 7 files changed, 113 insertions(+), 5 deletions(-)

-- 
2.43.0

