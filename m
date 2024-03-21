Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE88861D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3374F1120FF;
	Thu, 21 Mar 2024 20:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ttZcs6Hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17B112101
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLVkF0jxL5ab1kkExkrutgp+nnZ5zoRWDhzNDQrE4fuy4bvtJ059MMG7VCg3WADqFIqHrV1r6mnYt+CpHgLfalftmjCGPapRuKcDlO10EbiOXhEj5lPt+4af0bm5lVccvPQimOCtNmr6cncm0TC4Ejr7NqwfE+HzhXGwVaSUZimWFpnREGuC7IHt+IUSeq0dafyEOy/3SV5nnJBWuzshqlLfrApNKYm1Z+zKjs0O4ZTEybMWiq/WBL27HjnSYDFJU92mpsZQ2ZEKC2c13QTPP412o5p/OPzGcavCQsdyZs88HltMTpCNE/3w9uuNBCLB4VEwVNHPNJsHZVjllwYnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7GmaPQc8cB3nmmi+u9VgQ5j9rUoOGbwUFhhTMAJynQ=;
 b=bQbtOYJP/J3a6A5m5RlA/5EQfFPceX3Z9D/NRXEZD60FWk8mji7i15kEe4bbx6hyewLYhEEdf377/NUOoXR4RheNLcavsDAVpHxa4iaE5RjGFlH5wU4FHWjWWVgq2A77nvf5l/suQK5T5Zqf/i97d51cNknceyPDpfYWsBEs3DYHRXOABDkdHJaxCqPMVJypCAdvwUQtb9/GY7GKe5d5mZUBfANqh5QOcYnZqqDQelUAgL6Pq9KLzKm7S84ADzo54O2EWItWc05/vRwgAxlyDwkA/eYbI/UUVKJkANgJq9dNsw6mAeObzftJM5ZPQzvua15whUKaBTu0geMmFfoftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7GmaPQc8cB3nmmi+u9VgQ5j9rUoOGbwUFhhTMAJynQ=;
 b=ttZcs6Hn5XPebLB80KsUrGspBi7+HYcMjDEqH95K1+mhDm9pZyZUfgA+OWd2yn+JE/7FwKDpEbcHAJwnZfACPZUI5YP91wsWhRqWwqp++vFaAC4d8pTvm+Qp3Rz3Q6q8v6uK1d5S8osdLDMVovHHNr+eoK1WWfgtStfaBo3m40c=
Received: from BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::19)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 20:43:58 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::74) by BN9P220CA0014.outlook.office365.com
 (2603:10b6:408:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 20:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7430.0 via Frontend Transport; Thu, 21 Mar 2024 20:43:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:43:56 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:43:55 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH v3 0/9] Setting live video input format for ZynqMP DPSUB
Date: Thu, 21 Mar 2024 13:43:38 -0700
Message-ID: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqb/GUC/23MSwrCMBSF4a1Ixl5Jbpq0deQ+xEF6k9qAfZCUo
 JTu3bSTIjg8B75/YdEF7yK7nhYWXPLRj0Me8nxi1Jnh6cDbvBlyLDiiBjvByycHbT+DLoQqS9k
 ooyuWxRRc69977f7Iu/NxHsNnjyexvf87SQCHpqxItrqm2lY309sLjT3bKgkPKQX+SszS1CSVJ
 UWK20Ou6/oFMWEU994AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f52e4c1-26d7-4b40-e1cd-08dc49e7a1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IVzFjiTgSspAib4ThmmDTsFBYvRWoTkqz/2fUGOOUNyEx02ujAkoW1aFnHSO/bu37KAR6Zu0zpy6QyBu6D7/9rIuBVibW2ZMVs3ya90bNrRkydbWc5N6oOlDjH4gGidRRFjoUw1JuDg5FUU2bkkKqAPeXHXwa8wA6/7a1frpoAXe/+79CIvfrEFGwflB6wc8SGlShUqgnGQYDf6GNNrNoj22ZOE6qnBsf19h/jofG0539u6BEqVNJtKeg4+20Fjb6N4658dJsnq0xgFhEJ1rwArQ+DAzjWeNZ6INGe/rPfRX16o0oeuIiOYd6SHJ1gugaKWOaaEY98WxkXNnfYAoP6VLsokRJh0ndb2sqp0N8uBi+Duu3MrNwe+PF2NVcTLYoSyBqj6BqL/nAB5oHiX2KB2tIag7vAi72cucshzuVYCb6K/KvWbcaVuxrWGRE+W3Gi/yg3BcwpBwJFQWswHoomOMMhGp3cr5PdhhbTGUxYTzOkV7dCdIElNmHys1kei6CcM6/5IY9n9mNCjunh5GGt/ZjFjVV5g3G970bDirSjSKZFJKKkJchodnQ7jfUIMdp7oDOZADEVD9oR13GtMqD2qQDGv/If/cwWavrOReEFW0sLE2gHhbXSR0n2ixzIySddR+RveMoNSswaQIhuX+aAEVU/Df1jIhRBZkfm+/CYFcHLhgKHav2Pz+D/6Y13KeAFkIWYA1I1eQsajxkddE/PTY9y3BZBEwhAfdKb14zWw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(7416005)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:43:57.7454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f52e4c1-26d7-4b40-e1cd-08dc49e7a1bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

Patch 1/9: Set the DPSUB layer mode of operation prior to enabling the
layer. Allows to use layer operational mode before its enablement.

Patch 2/9: Update some IP register defines.

Patch 3/9: Factor out some code into a helper function.

Patch 4/9: Announce supported input media bus formats via
drm_bridge_funcs.atomic_get_input_bus_fmts callback.

Patch 5/9: Minimize usage of a global flag. Minor improvement.

Patch 6/9: Program DPSUB live video input format based on selected bus
config in the new atomic bridge state.

Patch 7/9: New optional CRTC atomic helper proposal that will allow CRTC
to participate in DRM bridge chain format negotiation and impose format
restrictions. Incorporate this callback into the DRM bridge format
negotiation process.

Patch 8/9: DT bindings documentation for Video Timing Controller and Test
Pattern Generator IPs.

Patch 9/9: Reference FPGA CRTC driver based on AMD/Xilinx Test Pattern
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Changes in v3:
- Add connected live layer helper
- Include reference DRM format in zynqmp_disp_format for live layerss.
- Add default bus format list for non-live case.
- Explain removal of redundant checks in the commit message.
- Minor fixes and improvements from review comments.

Link to v2: https://lore.kernel.org/r/20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com

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
Anatoliy Klymenko (9):
      drm: xlnx: zynqmp_dpsub: Set layer mode during creation
      drm: xlnx: zynqmp_dpsub: Update live format defines
      drm: xlnx: zynqmp_dpsub: Add connected live layer helper
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
 drivers/gpu/drm/xlnx/xlnx_tpg.c                    | 846 +++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.c                    | 452 +++++++++++
 drivers/gpu/drm/xlnx/xlnx_vtc.h                    | 101 +++
 drivers/gpu/drm/xlnx/xlnx_vtc_list.c               | 160 ++++
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 | 170 ++++-
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |  19 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  81 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   6 +-
 include/drm/drm_crtc_helper.h                      |   5 +
 include/drm/drm_modeset_helper_vtables.h           |  30 +
 include/dt-bindings/media/media-bus-format.h       | 177 +++++
 18 files changed, 2198 insertions(+), 84 deletions(-)
---
base-commit: bfa4437fd3938ae2e186e7664b2db65bb8775670
change-id: 20240226-dp-live-fmt-6415773b5a68

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>

