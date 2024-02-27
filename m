Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC0868852
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 05:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED7C10E864;
	Tue, 27 Feb 2024 04:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T7UNKP/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDA710E864
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 04:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2MZK7zth1G5To0mergEyxdJ0J47hqDKluHgCzDFjwNoYVntpYyhq63QKtx4qqJFoZxqZArMTptb2egk4khvPn1e9oP5wHODap0ZbghEZYwStiJw0zKRyTD5OOGL6O3O0MPlMIQcekqdLwJ5pcCYUDQ9UuNqFecGK+mLJoR1XRyl2m9vk55/LhVl9sKlrnALXy/hiobkXAAUpuRy21e7fZBLTq2wjCqExfcQtcLIRFLIhzi8+XMeBgr3g5xoEcE6gUhR4u2HcFlU6IAevxixvlD6S0Oq4vOddbnCAylNWfSBdBkVM6vInb5ZX85vbzpSQGwOWb5U5vyslXNAeDqMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe+X+W+ARwGtqVkJTlJFM4EWlLatO5T/57/b00K3lV0=;
 b=IsXjFAQGa0fVT1Tel2fZV7Bj5JZKMRn6jXmbSWCBjTGq9+mq0vIwSKekaWgSWZ5LSH3S5dKUWvXsjZS9mArI1Po/QQIUwZk/Zqvjdsd7ipdD2+SbjyLrIMGk16S4P25Iqw0V1GPeYMtMcRzYQ5AYdVj+8TK3UvNZU+I6fXAuIEzSA/G+skxTJ4hFEvQxA2x7YeSUCh0cwSnkalrZThVWjPCguZdn6xOUAI0rIxgofwepSpCDZ+pG9PHvBg3+1C57Cmnz0uYQCf2BdSV8E3thynmHdS9eDcFxxXvNLM5ttWITKmIBjhvGmOmHXzO6gomsZ9HCw/yXWKwHijKw9Lekow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe+X+W+ARwGtqVkJTlJFM4EWlLatO5T/57/b00K3lV0=;
 b=T7UNKP/QfNpuNSvJjPxxaU1YNXgXQrMXhU4yCYT2THYfPOTMXrdLHBSC7u/mOgMuu1EShemPjcvxqHo7UypbO4RA0jN1LmaD+zMe02En+WttFAPnG/UPhiHE8cuPwBWyPbT1nlLrr2aLl3K0OUfMrTM6ali2XaR5mCkBbQcmKE0=
Received: from MW4PR04CA0067.namprd04.prod.outlook.com (2603:10b6:303:6b::12)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Tue, 27 Feb
 2024 04:44:48 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::78) by MW4PR04CA0067.outlook.office365.com
 (2603:10b6:303:6b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 04:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 04:44:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 22:44:47 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Mon, 26 Feb 2024 22:44:45 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH 0/4] Setting live video input format for ZynqMP DPSUB
Date: Mon, 26 Feb 2024 20:44:41 -0800
Message-ID: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlo3WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIyMz3ZQC3ZzMslTdtNwSXTMTQ1Nzc+Mk00QzCyWgjoKi1LTMCrBp0bG
 1tQAILsqTXQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.12.4
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f2c835-3b3e-4702-6b1b-08dc374ed3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBxB9KelphFWmp075UmIZ7EYwqorCWPaE46KdJv9MQDNAoCycEcmnB8j6NqBlnDt8vd+vSpYxp8cVqDteXk5Q/8omHSZpIYnVb3wd3beGBk5TLRMkhUXRNZWVNuw3bTUfyEvRDbYIqMQxR7rZs6qQnhK90DYk3Hw/6yRFMIxGVibt400UzaFiTTyRqNTlVdRIdpAoq6L9PLZCi2JRXMvNFET1esxd+2oX4JmfcXWi1QITtkX9IvdMjezPhES+4dWUWf4E1xyrN/dhR4Tk4m/Gueq3Xpe6KB5mIXXE8v6/S6xOvdv6ObVKcTjgf7+IQ+vMkSP0RDOOP6TmXAA61y7vIvYZ9Sv7TFSM8IUbiFcV6++yzKSpr9tS3p0aQL7MfjDOy0PCBYu23I1rM7tdGX/TDXsx90Zrt1du8XersZRQvFT1ZyxQ8O/L3FDNjboVp+HaI2VJTvH6ZmHhXja1nfb85ql8hHoqew5Wm9RJ082zZ69nLuO7UMxOOLkIdZ0JWS7l/JeL89GdWpMjbMtmufZo1LVOfJscMwRSFqyPAPB0BuRZncbQSo20HMLzJEPUUMWecVu1t4z2ExN4VNU63lo/He6zER+rn32Xt1SOdTXDnnQW50RnlMXRwZ1BxYH+gdBiCh6SXG1X66RF/iojjDDPFKQOC9mWXul9MDYHCFEK9iHFGqR0hLLSmjo/GxOzcefI913aMsob9PGlJfsSwUGd+6Ff6PtB7Q/JLMoiBvz4dFKXDN0qI8QrgbE1ZlYJ81ei+KdZF3Zuntf70FPCM6kXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(921011); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 04:44:48.0184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f2c835-3b3e-4702-6b1b-08dc374ed3e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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

Patch 1/4: Set the DPSUB layer mode of operation prior to enabling the
layer. Allows to use layer operational mode before its enablement.

Patch 2/4: Announce supported input media bus formats via
drm_bridge_funcs.atomic_get_input_bus_fmts callback.

Patch 3/4: Program DPSUB live video input format based on selected bus
config in the new atomic bridge state.

Patch 4/4: New optional CRTC atomic helper proposal that will allow CRTC
to participate in DRM bridge chain format negotiation and impose format
restrictions. Incorporate this callback into the DRM bridge format
negotiation process.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
Anatoliy Klymenko (4):
      drm: xlnx: zynqmp_dpsub: Set layer mode during creation
      drm: xlnx: zynqmp_dpsub: Anounce supported input formats
      drm: xlnx: zynqmp_dpsub: Set input live format
      drm/atomic-helper: Add select_output_bus_format callback

 drivers/gpu/drm/drm_bridge.c             |  19 +++++-
 drivers/gpu/drm/xlnx/zynqmp_disp.c       | 109 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_disp.h       |  25 +++----
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h  |   8 +--
 drivers/gpu/drm/xlnx/zynqmp_dp.c         |  16 +++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c        |   2 +-
 include/drm/drm_modeset_helper_vtables.h |  31 +++++++++
 7 files changed, 182 insertions(+), 28 deletions(-)
---
base-commit: bfa4437fd3938ae2e186e7664b2db65bb8775670
change-id: 20240226-dp-live-fmt-6415773b5a68

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>

