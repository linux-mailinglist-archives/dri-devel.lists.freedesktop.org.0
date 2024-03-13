Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF487A04E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A973610E1BF;
	Wed, 13 Mar 2024 00:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TvoyY//d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26410E1BF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA7oeTlTiWnyrN1z5k36NNh0oPUeLvdREpVpdZXvodXxl6oHlZU/SwZnpwHPMa6ZIcKvFCd2oW7nRmbIj4Y3uOwb8MUBVc6wtNy9nQZWYwrpbIPK+ZJm3Jq6p2zRT7k9xK0soSc98k2xpJhMrcNTDevBpHz1nWRrU3eMJTo6Xt7C59VvdnA0RxX1zd3by6dF0pUuRDzKvkOZUTFR05ub8e0QGq/+SlgnyMrDUuHKg1SsrieQN63NwYyUTNKmXYLwavThbffO8mknJ7UAH36NcU9gLnVUZHL6ufOprdLHardIzykVGZIsi5sMqtYwg2st1yZY+Sj0xgri67m/Q4jVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHRMvU8kMi/1UkduRp9wDCPVGWQK3nevIzzKbZVuv+8=;
 b=iItSkHxyup1tUnfnf+TjnjopSrYqE3ZVxZ4KuQ3Kc+CtYkZ2s3SaWLzOKVkpNOKCVFHzVcL8a4IZp5QNu2NsFxAlLfbIunKuX8nSGGKdnfUTpAdum4AYcUVGN8K9qbwzAp35YNNYPFDwemDu2362MX4WqL+wIjlfydnV4tGwIjnTZWh8HuR87xJENXyUPLDmjOshRAmxzQWtVTHn2EAsaZ4aKjqcLjXSyeghkA4a2BwEJXbzdnlU4KYtcYZghWY+8E5AMmKe4Ed6KGjys2TNRTp6AxxRzD0uM9zwIe0n0yaMVRShjNZz+9JGizclCzIlcXaP8W0dcmFv1a0xReNmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kwiboo.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHRMvU8kMi/1UkduRp9wDCPVGWQK3nevIzzKbZVuv+8=;
 b=TvoyY//dXsoUYFxUd5PJZEHmoqGhYgeyNUyY/ot8g4rqm2FnadgsxYzQs6Z8PvYJgWzDg5Jz679An5Nbyd+/9Z2cZIQewMquwVe759N9R1uUVcZlb8YrEi9nwHjWMsYvIYQItiNgAycOYjuDmDvtaz9Y4uBPqOZp+bgDIcBjfEs=
Received: from CY5PR15CA0127.namprd15.prod.outlook.com (2603:10b6:930:68::10)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 00:55:04 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:68:cafe::a3) by CY5PR15CA0127.outlook.office365.com
 (2603:10b6:930:68::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18 via Frontend
 Transport; Wed, 13 Mar 2024 00:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 00:55:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:02 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 12 Mar 2024 19:55:01 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH v2 0/8] Setting live video input format for ZynqMP DPSUB
Date: Tue, 12 Mar 2024 17:54:57 -0700
Message-ID: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGH58GUC/23MSw6CMBSF4a2QO/YaWqAFR+7DMIA+5CaWkpY0G
 tK9Wxk7/E9yvgOiCWQi3KoDgkkUya8l+KUCtUzr0yDp0sBr3tacC9QbvigZtG5H0bJOymbuJtF
 DeWzBWHqf2mMsvVDcfficeGK/9b+TGNY4y141Vgxq0P19cvqqvIMx5/wFQXcfmaQAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: de7f6418-3046-4d85-ba5c-08dc42f837d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10boaD1XIE901Ffs08s9X6EGn1TihkSv/nFc5DxOTYYO/vMwXOWBJL4epZassPkiBcRD6u2TFVKBS0EVOTjoTr9r9iB2n5PlIQ44L8SDkwmwlKvF3OQ7XrIjvyroPAiNEUueM5NVPQ9Xj3kTKLxTnFn9K5iJZXrjmVzzwZHt8NQcV5S+vr7ilQMJN/IzzsLYBu8KSb2dYEHYLdIN0vpKtqCXHWcQ6KVk7AkBAYh1+e49FRseABLhGoiq2+A2UZhNtQ1KypbMAXIrdHkSloD7SwHbrTT2fllK9oJSi9MPt6TncZEGwhZSlbxFRMnglR8CcI/E4a+sL5ZxuYaFOPm6WdSe7ksqkFn074XjC/oEknYIx1nE+S0NxyOw1x0evCwhgmBDh40ntZ5mwmxLuZxXY2TO6frwmTzNIC5vQbsJZr1IwnBdMV/5hz8NVgFfM4I1s45ETIvnOV3++QXBhU2W+yhFR4eIEKtfsaRdFZLKi37NaQ5lI/eLUYu+LI6k41I/FgxbGcVvA/BKaFWjf4YTaXl2HqPi2B15fd5wEunt6cGaRBZUA8XkZHg3DAJjCm7ikceSUL2XN4SghA53nsx1ZNAedsHjYg2LtyFPfJ9j9mHrfLpgru4MJYmlsDuMX87Rb1wjLdMFOhsnMVQZ6Z4iIcQ8jjymE0xwE0Z6BDsV8PwTXSj7gVJgLXEu6lXuZ8K0cybxJxB0wuO2adbQvNZNFDaSTGi2AfnOHbTPC1hLLRs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(7416005)(376005)(36860700004)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 00:55:03.5012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f6418-3046-4d85-ba5c-08dc42f837d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Implement live video input format setting for ZynqMP DPSUB.

ZynqMP DPSUB can operate in 2 modes: DMA-based and live.

In the live mode, DPSUB receives a live video signal from FPGA-based CRTC.
DPSUB acts as a DRM encoder bridge in such a scenario. To properly tune
into the incoming video signal, DPSUB should be programmed with the proper
media bus format. This patch series addresses this task.

Patch 1/8: Set the DPSUB layer mode of operation prior to enabling the
layer. Allows to use layer operational mode before its enablement.

Patch 2/8: Update some IP register defines.

Patch 3/8: Announce supported input media bus formats via
drm_bridge_funcs.atomic_get_input_bus_fmts callback.

Patch 4/8: Minimize usage of a global flag. Minor improvement.

Patch 5/8: Program DPSUB live video input format based on selected bus
config in the new atomic bridge state.

Patch 6/8: New optional CRTC atomic helper proposal that will allow CRTC
to participate in DRM bridge chain format negotiation and impose format
restrictions. Incorporate this callback into the DRM bridge format
negotiation process.

Patch 7/8: DT bindings documentation for Video Timing Controller and Test
Pattern Generator IPs.

Patch 8/8: Reference FPGA CRTC driver based on AMD/Xilinx Test Pattern
Generator (TPG) IP. Add driver for the AMD/Xilinx Video Timing Controller
(VTC), which supplements TPG.

To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Michal Simek <michal.simek@amd.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Changes in v2:
- Factor out register defines update into separate patch.
- Add some improvements minimizing ithe usage of a global flag.
- Reuse existing format setting API instead of introducing new versions.
- Add warning around NULL check on new bridge state within atomic enable
  callback.
- Add drm_helper_crtc_select_output_bus_format() that wraps
  drm_crtc_helper_funcs.select_output_bus_format().
- Update API comments per review recommendations.
- Address some minor review comments.
- Add reference CRTC driver that demonstrates the usage of the proposed
  drm_crtc_helper_funcs.select_output_bus_format() API.

- Link to v1: https://lore.kernel.org/r/20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com

---
Anatoliy Klymenko (8):
      drm: xlnx: zynqmp_dpsub: Set layer mode during creation
      drm: xlnx: zynqmp_dpsub: Update live format defines
      drm: xlnx: zynqmp_dpsub: Anounce supported input formats
      drm: xlnx: zynqmp_dpsub: Minimize usage of global flag
      drm: xlnx: zynqmp_dpsub: Set input live format
      drm/atomic-helper: Add select_output_bus_format callback
      dt-bindings: xlnx: Add VTC and TPG bindings
      drm: xlnx: Intoduce TPG CRTC driver

 .../bindings/display/xlnx/xlnx,v-tpg.yaml          |  87 +++
 .../devicetree/bindings/display/xlnx/xlnx,vtc.yaml |  65 ++
 drivers/gpu/drm/drm_bridge.c                       |  14 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |  36 +
 drivers/gpu/drm/xlnx/Kconfig                       |  21 +
 drivers/gpu/drm/xlnx/Makefile                      |   4 +
 drivers/gpu/drm/xlnx/xlnx_tpg.c                    | 854 +++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.c                    | 452 +++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.h                    | 101 +++
 drivers/gpu/drm/xlnx/xlnx_vtc_list.c               | 160 ++++
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 | 187 ++++-
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |  19 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  41 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   6 +-
 include/drm/drm_crtc_helper.h                      |   5 +
 include/drm/drm_modeset_helper_vtables.h           |  30 +
 include/dt-bindings/media/media-bus-format.h       | 177 +++++
 18 files changed, 2204 insertions(+), 63 deletions(-)
---
base-commit: bfa4437fd3938ae2e186e7664b2db65bb8775670
change-id: 20240226-dp-live-fmt-6415773b5a68

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>

