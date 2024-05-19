Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D38C94B5
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA2810E20C;
	Sun, 19 May 2024 13:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bYb9ww9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB0710E1FD;
 Sun, 19 May 2024 13:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewRidRmidkl8d4K03Jh+1L0eyQ9/WCsirnjNiw3+5S3wZQWcRaz8Ecb7GnZ46tV/aKkqaRcU/KXRXOiNZDHpVpiDQ7hC8D5SvVjMO4+Lrl95vV/iAGjJwM8BcW9jQLQ9L2RPLYiyPzl5GnNMZQlk6+cOANQACK7WDHsPM+XcnqG9z2iV4p6FISbxaOTrXN9XVetTKM36nEZsbHAsOh8UjcetAB53KL1WuBATmcXHkjbRLMi45ceuu25xi/fNj4wsGkS1evx9olFBpYPDY6/ZmT0zUMeP8B8HaxhSuyoBQjLDiE2Z6UqneneuCI7pBoD3IdqSHU2tcBRtuNjwSmyNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VrO9pp//Hr4OK8FXiX8maZfPyEvgfWcnA4gMs8vNoI=;
 b=CFlF3nRTF2geYoCpmgv4htpC9ZYSmAFhuc8q6QKUR7y0t0mx5YOS0Cyf/V3UTstiJ0koRDwkP2aoWpvJBbgPTAaTGzgFwayV67mpKHy/aO7GtUUDVEuhMi2g4TOdUdN1a09jMeHb8JdpbyA9gZrNSWhkiRkeXkWUvXqejr3/jE7ITPqGh001vMu9z4JNiPbLbTCNM/J+SZr/ye+9Gvn+7cODDS6wmF/b+5zmyo6/+turVsVgyACkxZhieAe7BNsZ/T8MhocjcG1JmZs2/BdC5wT/1O/yWZpQI0D6bpDv/gqt/+Q7PkJptEdy3eH6naR5X4SK6pyJQzqb+h8URyNn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VrO9pp//Hr4OK8FXiX8maZfPyEvgfWcnA4gMs8vNoI=;
 b=bYb9ww9QG4JaY7QcNAbqPue61+AYmLwcgv5gxzsHf+o87IpbWC4HXfWQrZyPiawqhFirkjtogfQsW6JJEtKbFoLoQ4vVKcT75+3csTWc/IpuOChTouuqig+aIae+o4YZWQkTrxfSUQZK2nvBRhU2fk30aV8SG4Dgb/XjjFViogc=
Received: from BYAPR03CA0013.namprd03.prod.outlook.com (2603:10b6:a02:a8::26)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sun, 19 May
 2024 13:06:28 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::f8) by BYAPR03CA0013.outlook.office365.com
 (2603:10b6:a02:a8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Sun, 19 May 2024 13:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:06:27 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:06:26 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH 0/2] Add support for Panel Power Savings property
Date: Sun, 19 May 2024 08:06:08 -0500
Message-ID: <20240519130610.7773-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3aaa95-71a4-4894-36d7-08dc78047e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k0yMg/l45SqrkkSUeNvpBa4fVtuoCVBwXZ073+YQ5Nwicm9sZStg8sXOaR3w?=
 =?us-ascii?Q?Z93XfmDaLMgrUAIdEtAu8evGvsGp2Xty3TQFPhFo1YbN7vYrooa/vHNPgaWi?=
 =?us-ascii?Q?D5hSklACbcbcIImbW3kABhhuoetPVaI3xluwLraflEEx2ERGzhyxzpm99fnB?=
 =?us-ascii?Q?hhmWFHjsA3bBppO2EClzYJdJiq0hZu4A8oYLKa4ZsWqSXMlmzA4UM0OLUlvw?=
 =?us-ascii?Q?JUVTmq7d03yNSM5qUJc6jMS2uAnpO0UxFU9US82tw63yPZtLLAk3ZQ9BQPks?=
 =?us-ascii?Q?0DAliltWX66x7H8XBKFSZ6Kouon3UlhQT9Zs1IGpf1U94YTJQtegP1cerwg1?=
 =?us-ascii?Q?wEJxcT9vTuYHtmnA9b82dzKSAnvg6vzz0ydafy8Vil9UcHJkc7ZluHGn03sL?=
 =?us-ascii?Q?DLOXepRh7Pwd82N5+rsqr8LJ/0ozf0xbIXl03NMFf3NQr+iX1NN0+HC6Hq4X?=
 =?us-ascii?Q?7a0DaSx2NvyVONLivWqUaqpRMKax6PVhl8uTpjMztpzYIIbsTrohjDS6HJPd?=
 =?us-ascii?Q?cV64U2cOzwVIOvOM7o5vdITYOH/AVab8h02u4dwtqDXx5jkKjUPYVrP5+LGJ?=
 =?us-ascii?Q?LZd5cub4UVPiHLuy3Tfqq4wLRoddJTyMtREHtyPbeA2vzcVT8drciN2SbcnW?=
 =?us-ascii?Q?qM0VZupDstBdSME1uv5w2+zSUehrR1aOAZgWwDnReMUwsD2h/9wxgRCCSVcH?=
 =?us-ascii?Q?Cq96KsQ2tYSFnSz8BByklenFT/NLZbQlaH0oR7Sy/VY413+0NAEISisA5T6K?=
 =?us-ascii?Q?sjg2dCLI/1shOU9f4pZBsnMJP1bfSJ2Wr7mSWN/j5G1/OThoQLSkAqt6NLJP?=
 =?us-ascii?Q?dkyu30kNnIFMB5IzW5OhRndwHJVlf4YwCTHIwrKbxyYNPAnLi6vKzNLpVmMh?=
 =?us-ascii?Q?ZdC/YfdIYVC0QV1jL3QaFzP+TQLf8EXaTT9YeeyTNe6NTglfLfR9VYHkBgtV?=
 =?us-ascii?Q?qEQYGbvy96VTXJgAFlfxIiWqimudkDNjDT98uT0aoqf48PKdIuGvkxktPHLa?=
 =?us-ascii?Q?9mXT7k0yXNQB8f3Ll9RrRqLmp3N/UklX4ESTyQnEJmg2eEZVFMqGTbu8Mo/f?=
 =?us-ascii?Q?FOXMuRiOMnIP2fMed9ejonFoPOO7wXH8y7gaUI1HwA7Aky7eKP5mLB0rEIPQ?=
 =?us-ascii?Q?YGGtrrOSmY3RDwFzrAUzPZTIyyXELCVkOGepGOmcS9BgzwVidWRzcm7smkW/?=
 =?us-ascii?Q?xd96W4qv1c37xPYLRbcxBUZ8kV2FIu7k9rprN0GDCYroH+GAepNTae0jJTyJ?=
 =?us-ascii?Q?UgCLhBgTzfpRBOQ9qLR9KzQtWh3hILc6oAXe3zb20T2yH9/L+Sz6RROxDmNq?=
 =?us-ascii?Q?PILECT2rXgHocQd/a8A5gRTpz7xusQ34SmzmqRcRPapsFpS6lyLTNljJ1ZIO?=
 =?us-ascii?Q?K1ogwWzkrDORWh844jS+ZJ6HSPc7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:06:27.6838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3aaa95-71a4-4894-36d7-08dc78047e8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
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
"panel power saving".  This property is an enum that can be configured
by the compositor to "Allowed" or "Forbidden".

When a driver advertises support for this property and the compositor
sets it to "Forbidden" then the driver will disable any power saving
features that can compromise color fidelity.

In practice the main feature this currently applies to is the
"Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.

When the compositor has marked the property  "Forbidden" then this
feature will be disabled and any userspace that tries to turn it on
will get an -EBUSY return code.

When the compositor has restored the value back to "Allowed" then the
previous value that would have been programmed will be restored.

Mario Limonciello (2):
  drm: Introduce panel_power_saving drm property
  drm/amd: Add panel_power_saving drm property to eDP connectors

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 34 ++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 drivers/gpu/drm/drm_connector.c               | 37 +++++++++++++++++++
 include/drm/drm_connector.h                   |  1 +
 include/drm/drm_mode_config.h                 |  6 +++
 include/uapi/drm/drm_mode.h                   |  4 ++
 7 files changed, 81 insertions(+), 5 deletions(-)

-- 
2.45.0

