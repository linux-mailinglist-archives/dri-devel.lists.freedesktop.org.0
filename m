Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80A832473
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95210E95D;
	Fri, 19 Jan 2024 05:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B323810E951
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnVDbiAwBz2F2MAwSHVueJ139CL/aBu106cdOWT92G6Z9AFjbJauLx1eb5tkIXVUtdbkm0UreKbqwpW9rSVpH/NCifEgoSmxmEs3tW4XZD9XDPxsXTTT02XCwlZiQ1OULL5ROSbOODAXhZrVwLPrct919tQEjWJfnfBn5k1ApOwlfe5ZNlpb0U5QyrJSTeLX0PC7qu7bdHsiKkfB9v2B4Ud/uGvyatANWlp/gme93bitQoPLR6S9SENwPwUqa0vPz1VJkng5mjsVINeM4OHejBiyYEGk0HbEY/Tgt52MxBqUa6rBGVJrvxfGodDGted2JnyC/3N10Yd0/RF7EFxZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGfqYKlOF07yfK5bGVkIkrxAPdfk2HmdGVScqC2dKTU=;
 b=mSg/4qE0V1lIBlJqPTxZq/unnYLzrFFQ/gCBESA83K/lmq/pIYUzMuIOT10qKJ0ceAqba1Ry2o2KdxLM5NgUY66UZUNZQj8uu5VAKgw4sM2pbbpr5+Ba4KUXYkax8g81MbrncglaTJ5bmt2VhB5a85ZiinUmE/0zFwsvO5aS3MzcM6KNaLi6hBOBm+BuQIQ/AxTlMgIvUXHAsX0QruNaps/xZARoRURRFttininL+4xtf3rL9zJVRzHCZ89mRPf2hi+MFexiPisc/fAGkfS5cISy8dtuijYULrhhKlwz9At0flJFatmd4/JCNxttqiM8s8jlFObNxCZSYrb1Op+dsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGfqYKlOF07yfK5bGVkIkrxAPdfk2HmdGVScqC2dKTU=;
 b=LQoVKSJ+eMKSH9MzGC8taTCwgwwyOWvAVZdjrCVkkl1vHfVN6D6KsQHd74D291zvxkkBQk0sr0PUoGBMxwROT9oHzqYUdCodr/P5LiWe7voq0PnIBvaTV5/bwp/0v4Jv9YmiIQ+UZYtxq4mu6jOeYDoJu9XUE2yTj+FXtsCdEPo=
Received: from DS7PR05CA0041.namprd05.prod.outlook.com (2603:10b6:8:2f::8) by
 BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 05:54:52 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::ee) by DS7PR05CA0041.outlook.office365.com
 (2603:10b6:8:2f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.9 via Frontend
 Transport; Fri, 19 Jan 2024 05:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 05:54:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 23:54:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 18 Jan
 2024 21:54:40 -0800
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Thu, 18 Jan 2024 23:54:40 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
Date: Thu, 18 Jan 2024 21:54:36 -0800
Message-ID: <20240119055437.2549149-4-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119055437.2549149-1-anatoliy.klymenko@amd.com>
References: <20240119055437.2549149-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 775e944d-6df9-4883-39c7-08dc18b32772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cij6rcgGxcRnOF8UYO3EVNQ+LQepNT2We0M+3iXPM/SZx8+aiJikrl/yaSluJobhiNMpxhORHzEmDAb3zXeSR3TxeErE8hnLyQO6ohvKOVelum4+4Ae2FiToez8/O5sOTvcgLDc0nm4b1ZR66HQzY2HC4tCuEmK7vlNCX4lFBhneUupr0g+iVMyS/PVgy48E1+gmf7OQli75KggOZlMOMDnvlo96vpl6o735ZSsbeedv5BN14w58NnojZR42p4lXz5aJLsiJ0NRMbm+PrgVqS+YtjAaq/PqP5po4+yXWMwh8ceqbaZrpb2QaQp75H/vdt9XdcFvTStYcJo8d7nVKyjcTcZul3vg0gAqY3NyaTJFgLjSPhqQny0duOA/UCxMKAuIkqahl4H042Nr6xYlz9dHirJn+gC9RuekIgBHyByJbVZre8R2suCxA7Xp/8BPHPCss48ISklS8nPyWR6xcSgElZ/hYiwqy65UNuBMzkMxTShFGMJMeDh81L2ZmDJ3xt85JmZ/FVjXzRRIVufNIXGglwn5gOun10e+1qPEEG7gfuFYc4jnFU1U3J3YUO/2rlVNXt1uIf6pJesBAsX8I3n81X3QNVgSMJaVSu/O0EmSD5/Y3cM3GrhwB3KmytWeKJ3zN1HEfwWwTxCRV5P3T0xxQQlT5F1PRRJMtOVw2hQ35cGf6rEPMoE0Fn5S4630cjvk7jY/qLBK7pDx/XVUWMXeu4Ir4t5Xaf7iPKuXpz0lYu3fQmoZNMmQsafp0ttLqOWVN0J+pW/9ex85W7MuC7V0FKV74Cgui/w2QeY3NFHD9sJcbdAOpC/OBxG4Kiar2Ypr5RNgmYO1nP7Lqh5FwRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(26005)(36756003)(356005)(81166007)(478600001)(86362001)(40460700003)(2616005)(316002)(40480700001)(336012)(2906002)(41300700001)(426003)(1076003)(6666004)(70206006)(5660300002)(70586007)(83380400001)(110136005)(82740400003)(921011)(47076005)(8676002)(8936002)(36860700001)(44832011)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 05:54:51.8996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775e944d-6df9-4883-39c7-08dc18b32772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
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

Filter out status register against the interrupts' mask.

Some events are being reported via DP status register, even if
corresponding interrupts have been disabled. One instance of such event
leads to generation of VBLANK when the driver is in DRM bridge mode,
which in turn results in NULL pointer dereferencing. We should avoid
processing such events in an interrupt handler context.

This problem is less noticeable when the driver operates in DMA mode, as
in this case we have DRM CRTC object instantiated and DRM framework
simply discards unwanted VBLANKs in drm_handle_vblank().

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index d60b7431603f..9ed12244a429 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1624,8 +1624,17 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	u32 status, mask;
 
 	status = zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
+	/* clear status register as soon as we read its content */
+	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 	mask = zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
-	if (!(status & ~mask))
+
+	/*
+	 * Status register may report some events, which corresponding interrupts
+	 * have been disabled. Filter out those events against interrupts' mask.
+	 */
+	status &= ~mask;
+
+	if (!status)
 		return IRQ_NONE;
 
 	/* dbg for diagnostic, but not much that the driver can do */
@@ -1634,7 +1643,6 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
 		dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
 
-	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 
 	if (status & ZYNQMP_DP_INT_VBLANK_START)
 		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
-- 
2.25.1

