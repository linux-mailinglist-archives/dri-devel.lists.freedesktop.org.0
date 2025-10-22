Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2577BFE64D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA5F10E1B3;
	Wed, 22 Oct 2025 22:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PWoYjXYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011044.outbound.protection.outlook.com
 [40.93.194.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973410E1B3;
 Wed, 22 Oct 2025 22:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPFJ6I2LobwXn/P+jBlZQzJBPurfPumREIKvjFqLYyaBDKGRKmc2blnLt6DA9n9VQlFDpmSgEATeVfxS/maH6w8+4QhxrtQ5y9XfiUROWEdsLGwhIhQKn5qDzO5rRwnZcfy3x2d88EmDtSJgMOWzo+PR6kpkmLLsIs0wCVQahNIhBXuUU3uAz5TyVfQHNAuCIIL8ghsL5VD0kbHW+ycBjRgkHyvbF2+fTdtB4mvKl/ZowPeJEhumIBOja5pKzpntlT+iagtM453TpD81Zx9r7YYZ6Tu0lrcHwyjrNHh/a6wgfgWPNPx7kEyQse8u24zR3NfImWaeJumpH3BWCaCkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEoHgo5AwMztVHJtR+qDeFtmBsfks0/4KNNgyQO5ACI=;
 b=v8qygj80FkLFCY16KGr3V+2eNjmJs8dHnBsTCPzYZZbfxVuF+3Sd8FmiQC9VKv4Gyzi6ILkC6fYsS6dsEl2ECszbVS5qMt8eCr0mDefO57Gw4z7WZOsf6KA0rb5LJeVB7Hy/X3pYbiVO3UDYju5ISvlOPUeBnJdQRULthYPLFCp7N0cywjT/4XjR6ivagptIt1UB0uEjb5p1492RFMV4ZDcxeVT/7dRuyXhNcsRY3WtoG5r1e2boQJHeg4O4eyM3rzXmg/zXm52CBkEHTCck422S8iDoQkG7zgf67+qjSvO2nO3/7gbR1aqqqNumOoH8m7XFgGU9YcrPyhJbbrI9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEoHgo5AwMztVHJtR+qDeFtmBsfks0/4KNNgyQO5ACI=;
 b=PWoYjXYREKbfAGpzHpCPBP2QfweaoxN+HW/Aolt1oDjuTNP+F4mNkoNhwZHtixpi6uOwun5J/+XOaGjgulCFVXeQVvN8xcuNx4AADpzz1daQ9BBL33cWdIRBUwbk3SLDRk7ShrYwqIOTxJ+VzYPRZdJ1z5ybbEqj283ypMt2rKg=
Received: from BN9PR03CA0538.namprd03.prod.outlook.com (2603:10b6:408:131::33)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 22:20:30 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::bd) by BN9PR03CA0538.outlook.office365.com
 (2603:10b6:408:131::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Wed,
 22 Oct 2025 22:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 22:20:30 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Oct
 2025 15:20:29 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.18
Date: Wed, 22 Oct 2025 18:20:05 -0400
Message-ID: <20251022222005.1787211-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 79389c7a-e928-4164-3f65-08de11b935eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x9l4HTI+iUQKRjMa8AmvrEzP6J21IIsDNj1WKZLLd7pAtUZ86PlD9HWnHqfQ?=
 =?us-ascii?Q?Jklgmws4Xvjyb8uplr5PyHriKZRR71uK/tVW3vhqFT4vKSnRVryMqFJnv31H?=
 =?us-ascii?Q?hWc0aizUUptS2wko+X054lsoIl0QLTuvKq46J2Vp57ND/MlhFISR8QpinJLV?=
 =?us-ascii?Q?MNRAJp5N0ObIy1F1HxX7vaYcYL/yHAQuW9ub18ScWBxyOwGK/DvoXdvKVurq?=
 =?us-ascii?Q?M8GMHHOlvq3PF+dDQwIUFyWgR1dg1/Tzt4gN/g51q8AI4914WKw0b/+3qOeg?=
 =?us-ascii?Q?A3bWXT6PK2m+rwc28WcSatKiMVhlYaAnvmH7SeZQ2P9JfJk5KWEplgYwJqdS?=
 =?us-ascii?Q?f3vWRh1RBOWbbyQLC6CrB5UroFHLoetPgJklUw8cFo6pcKPYMH1/nTA/OtIZ?=
 =?us-ascii?Q?ocOjthOWbanAC+eowwrHN+UuXOMeD/kL/smdJZR+GoMT+Am4mZOCKBuj4YTo?=
 =?us-ascii?Q?l6xE6YvpYmNmGAjsUnixS9g/VoQ+/rcYiXiBl19CepUR52KfW/HC3AD66dBe?=
 =?us-ascii?Q?THZ8kS1YlsK2jtKTIA4paZjyBGHwsrtfIWX8FkgckXAAHDA/Vz/ecmDOPVXs?=
 =?us-ascii?Q?iD1Hica9hnE0tZKQX++Xre/Hg/gy8yOTE1/3ihT1EN6I4qpqZiJkqocDckPN?=
 =?us-ascii?Q?iJBWddGFc+VR7TJxP2gXamJWoIVw3rLQ3q5E63SFnBNX+eGHMO6muUvRt5U1?=
 =?us-ascii?Q?jVl3v/VhGmIe0b94BGnyk9fLS6zm92baYRb56W3uzuWajDH8BSmV7oFs9ez4?=
 =?us-ascii?Q?k+b8f/q5p/z3AFIm0XNCWe9VNli5/117OcRcswzS71uOA1dA882m9gjgUMNT?=
 =?us-ascii?Q?+NAha3ecdPQE9DO9nf7yia0deItXBdo+OyxfI8tV/bIrjwD4ajZaF0U9SR9O?=
 =?us-ascii?Q?AfUKdhNIwghPdu8VcpnSMLWzI6YoLRmP37h5fYmhbg+hwu2a+UyOd8t82zDd?=
 =?us-ascii?Q?VfZX5vVy4yCBjOE5/VXq35JdS/2osjbmWTIOlmGzOxWUaK8js9J//7S92HCT?=
 =?us-ascii?Q?aHxjdwE8DjGlRToSuE0vxYHiVjWCtjAiWMsyK7dw+OS1z2LxM8CgK4QrO4SX?=
 =?us-ascii?Q?qnM8tooOff8U2zuzSDcFD0y3sCPrp2xmFr1ZgeyLMwck6stD+kn7kSeYtmeo?=
 =?us-ascii?Q?gNalCNW1B2CesamDrdXnf4u5CHX/GmagDctSRJjEE3MU80646ze/i3WlQ8w9?=
 =?us-ascii?Q?KA0N2IuqAk/IoJLcOrLLARVLFjJssAlS3yWMlv0NY58toc1r+0BOLxzvR9KW?=
 =?us-ascii?Q?QvHaZZX9JVMZJJeA2het5Y52BQY/K2cTeLtXSTtIO2pmVseDL1kBYVvSKPBC?=
 =?us-ascii?Q?AQakC6E9akDDcBG72u9GSuHqfOxZQVfHQeu9j5EuaDj55clm6D5UxP2e7xL+?=
 =?us-ascii?Q?vTCGixjtSSsz0mxe0qhjghU6vxZM+98Wcf2PVxaldG7ogI4wqoRRozHPGkY1?=
 =?us-ascii?Q?ZXOb4RXOHFPKYVHFhCq15FwLpyqjize9phgqnR0m9b3lGanvmNm6TlkrXTkn?=
 =?us-ascii?Q?8Q4ephomBlFZoRFd1RfHSz3uDcLh4MHRTSbr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:20:30.3990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79389c7a-e928-4164-3f65-08de11b935eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271
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

Hi Dave, Simona,

Fixes for 6.18.

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-10-22

for you to fetch changes up to 72a1eb3cf573ab957ae412f0efb0cf6ff0876234:

  drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler (2025-10-21 09:52:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-10-22:

amdgpu:
- DP MST fix
- Fix DC max link count
- DC interrupt atomic context fix

----------------------------------------------------------------
Aurabindo Pillai (1):
      drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler

Charlene Liu (1):
      drm/amd/display: increase max link count and fix link->enc NULL pointer access

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix NULL pointer dereference

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c             | 4 ++--
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c     | 3 +++
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h             | 8 +++++++-
 drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c | 3 ++-
 4 files changed, 14 insertions(+), 4 deletions(-)
