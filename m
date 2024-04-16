Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1168A759E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FCB112E50;
	Tue, 16 Apr 2024 20:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vj4pNM3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F263112E50
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdkGkRM4B6vGP9kfqi+1VTCAdLOgOGrI3BwCeI8ta8knBBPK6dN8MG/kq17pWLmQztz9ypxizwSwGigMZIvIaYMaNoXgHQrFrVRZK2870p00SSALbVy4ArHAC7xOtsUOtnTDYJaknJbuusQyXCM55Jaqr1toUsAexWMCGbcbNXJvi+vwmPO+E1uaTbZUl5kPd2BfeLAWQxVtiC4GQunq0tZhxFj7TWCpP9uJFVsC6k2SnX8uGJvU05QWDvsC98d9QnfWEekHp2SxL9d2hHBGRgX6xtBwiz9kdX/D0PGcO5F8hjcRzVK9Avb68BDAzcLxfL2S6QZ4/pFgdnR0dwDIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vsch8lBPn05eQqKoGjMdg/0WdyN2jO5IGZeTMVGJ7A=;
 b=KTsyslBlmjc4oZJ1ewsw/JF3qrohu+NORnaPsQuNi3L0xVUdrF5hTFGaspWKJZnO9sSbLwOtXQhUG8ZVig8/q04YKZuukIcgblJOuVW1ffab+KAX4vkduZg2H1JmwzEpM+aXi+FEmkv1q4ZMuPD62mlDZhZtHd/KxT+cdIFgfshGftFUz8GnKhrt5raAb6kJF42pHu4WS83WpmCPbtAVNUpkkulk2v9FFE+Lp9U8p2zIh+6zDxNUe1p1WmyhR2IyYxZscLfikxAl0As5vqrQ4jkrBpl5jeubzI+I12IenJ76HeQ71h6blbozBMrlEYAKxL0SiR4xNMxJuf05RUMljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vsch8lBPn05eQqKoGjMdg/0WdyN2jO5IGZeTMVGJ7A=;
 b=vj4pNM3hIDhX0D+c6NUYGOHRLR+QNTgTUKRjdHK0ffPzkILTHGsG307bkBomZ2DNcNhI8gs7GWqkJPOyJdQKfLh1bfFLuXkHzAiRrJJhbYAB/9meqL9HfOoIj3YwU2vqA2OJi7nxt/Z5IXNOnfmTKY8g/x8FVagF7sRV9ZJmD7c=
Received: from CH2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:610:4f::11)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:31:51 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::87) by CH2PR18CA0001.outlook.office365.com
 (2603:10b6:610:4f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 20:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:31:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:31:50 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:31:49 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH v4 0/7] Managing live video input format for ZynqMP DPSUB
Date: Tue, 16 Apr 2024 13:31:35 -0700
Message-ID: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjgHmYC/23MSw6DIBSF4a00jEsDFwHpqPtoOkAuVpL6CBrSx
 rj3ohNr0uE5yffPZPQx+JFcTzOJPoUx9F0exflEXGO7p6cB8ybAoGAAiuJAXyF5WrcTVQWXWot
 KWlWSLIbo6/DeavdH3k0Ypz5+tnji6/u/kzhltNKlE7UyzmB5sy1eXN+StZJgl4LDUUKW1jgh0
 UknGR6l+JHAj1JkiZIZhtqoSvtdLsvyBdl6mskYAQAA
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
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Tomi Valkeinen <tomi.valkainen@ideasonboard.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB04.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: e39d1907-4831-4f87-3000-08dc5e543f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /UukadpY3W33qoHHNTe4tRRR/ldZQjRLthR0ihtr7nwEpNv9cE63mtztwOwbKNoBjNXsLQ4u0up63qGpPG5CGe/2pPWbw4OBkG9/hDqtXUbV+PVJbYTU88DXrctYP+q1KqI6pwYhqj8Zloe5xKfiKunDDsnQpTod0E9DQKV7sAg63qO927VqTDaCDVgOBROQKGMN1hWrxOl3ZNucCCy455reNXOHS9997Jd3BCvsBbIMA9qhB2z2Vw5tb6SaQ/ooKZMy1kSWEpSCpN4VPLdaMSBvmiCxsL0wiwOJ8KVpQegha4ca4SSdc3hn+isg+PE/F6iCyM+QW5HCC6lSgiFNslMO1rJX8QLMer43dG/YfLWovuLskN8eBN9Vh5dAZqCwwLEh9qqx2XXMw2DL2DRRWpN9SiLbFy0Xpj6gGF/vlqY31xO/t83R3/zyUIxcUiimZptY1mom4GaWKjC/eim65wKrY3cRfIrq/9DC095fG3boldDKyUPsgXdqBYR3BJKt3i7gvhFk7rs6nBYOuMcYvCIpyMei1fzTOXB+rde5zrzKSF5vGqSb4lmbxXuoKj9mW0PKmSQsPX+mcGb52YvdU/X6rrp+H2BPi4CcsC+07x3tq+OqThsCS5xfapMKgbvMjr0S1HsEBYsTXVrC5e7vGvcz0+qhtWDaVsA+KWc8ze8VSWOkmSPgs5BwMgxkfxWTbPsFCBPwCbQ4T2n3SDkqtrUczMMXc5YVm2aPjiR72Cs69wVr0bh+/mVqGzSXNus69ti704uzWfB2J728yrggNVQQcGSBPQnQSifGPrBf0aY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(7416005)(82310400014)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:31:51.1233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39d1907-4831-4f87-3000-08dc5e543f4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
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

Patch 1/7: Set the DPSUB layer mode of operation prior to enabling the
layer. Allows to use layer operational mode before its enablement.

Patch 2/7: Update some IP register defines.

Patch 3/7: Factor out some code into a helper function.

Patch 4/7: Announce supported input media bus formats via
drm_bridge_funcs.atomic_get_input_bus_fmts callback.

Patch 5/7: Minimize usage of a global flag. Minor improvement.

Patch 6/7: Program DPSUB live video input format based on selected bus
config in the new atomic bridge state.

Patch 7/7: New optional CRTC atomic helper proposal that will allow to
negotiate video signal format between CRTC and connected encoder.
Incorporate this callback into the DRM bridge format negotiation process.
Save negotiated output format in drm_crtc_state. Reference usage of this
API is available here:
https://github.com/onotole/linux/tree/dpsub-live-in

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

Changes in v4:
- Replace controversial reference driver patches with the private
  repository link.
- Split display layer format manipulation functions into 2 separate cases
  for diferet layer modes.
- Address misc review comments (typos, comments, etc.)

Link to v3: https://lore.kernel.org/r/20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com

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
Anatoliy Klymenko (7):
      drm: xlnx: zynqmp_dpsub: Set layer mode during creation
      drm: xlnx: zynqmp_dpsub: Update live format defines
      drm: xlnx: zynqmp_dpsub: Add connected live layer helper
      drm: xlnx: zynqmp_dpsub: Anounce supported input formats
      drm: xlnx: zynqmp_dpsub: Minimize usage of global flag
      drm: xlnx: zynqmp_dpsub: Set input live format
      drm/atomic-helper: Add select_output_bus_format callback

 drivers/gpu/drm/drm_bridge.c             |  14 +-
 drivers/gpu/drm/drm_crtc_helper.c        |  38 +++++
 drivers/gpu/drm/xlnx/zynqmp_disp.c       | 231 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xlnx/zynqmp_disp.h       |  17 +--
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h  |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c         |  81 ++++++++---
 drivers/gpu/drm/xlnx/zynqmp_kms.c        |   2 +-
 include/drm/drm_crtc.h                   |  11 ++
 include/drm/drm_crtc_helper.h            |   5 +
 include/drm/drm_modeset_helper_vtables.h |  30 ++++
 10 files changed, 372 insertions(+), 65 deletions(-)
---
base-commit: bfa4437fd3938ae2e186e7664b2db65bb8775670
change-id: 20240226-dp-live-fmt-6415773b5a68

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>

