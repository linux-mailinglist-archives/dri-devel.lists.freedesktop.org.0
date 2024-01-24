Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE77839F95
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 03:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C90010E8DB;
	Wed, 24 Jan 2024 02:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7FF10E8DB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ05E4X0S8HxCKFSQDogyX+tx7ukuL6L43WmTNJdcVphTWTadtckbWGCYJSIOnGpxKI9VUiOUG8RPe89p0yHKndjqrEaB5sH6xp5gE1fURM/l+v/S9tnay/3wNzy0cTr5lhV1mgF3OutwPWbyf6KWDK4JC90haNzJGlVwJw0FWJa0naTTdXRnHq4rtwLHSZ7S4D2uW4bW2PtR8L6Qcv4Wjua5+nv45hzRzx/LlYUYSpZKd0SC9DP4C0zrQm3pYo+aJs6nJ6LZyfehi67Avf1fkjDDmMpdgP2hgn9U4eC4o44mdFNY4cYl9no5rV0SoViIPxx5yT/c4dntnWgar2rWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro1x0XU0Vy+Jr6q29q7S5YrkHI5kVh8EnU6b+srSyEU=;
 b=iur3kL0sL9i/xCEvSGBOzhah9lafCWdj9ABZ9YtNW7/UrHqw3gSOGw7nxlFNKdEXoCYJzy5xY8HzjJoo6noo/+atXtu8IG93CIggkOWqkeHEc+uvDxlS3+1V9pTSFp8JwsKZt47ebR3SFYd1wKKkUDy5WM+jtYpHiVXbpSzs4VHU9gTrfJUeNxmOnPZj5rI0gUKB+wNKd/hzKEFVmU9JqSbQEd16X0JaPNj0aLPXFRckbv8pRky5qJW/VoqPSwRTLsxRtWK9V13BzsvFzpbXi2DhI10bIVNhc1BbPEzOMFDnlFGOOkCzHp6xZFyEZN/d01f84PA6ctPAabW3+jObFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro1x0XU0Vy+Jr6q29q7S5YrkHI5kVh8EnU6b+srSyEU=;
 b=D0lfzworJQ0Txd+MPmTrVqQaiW42+i9sgT8umbO0kcZrSdlTYg9IRlA6aHqVP1xZjKbnFS7XaBPOZYEIR6a99wgNxRl0imwnEi7Dq1Gwhh1abKfgwe2uvcgZWA4QlrTrtmJYdREvOjisexWT5wAR463ryO7zbJfdQ1yeaCVlYLA=
Received: from DM6PR07CA0076.namprd07.prod.outlook.com (2603:10b6:5:337::9) by
 SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 02:54:08 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::91) by DM6PR07CA0076.outlook.office365.com
 (2603:10b6:5:337::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.38 via Frontend
 Transport; Wed, 24 Jan 2024 02:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 02:54:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 23 Jan
 2024 18:54:07 -0800
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 23 Jan 2024 20:54:06 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
Date: Tue, 23 Jan 2024 18:54:01 -0800
Message-ID: <20240124025402.373620-5-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: dce21088-766d-4d7d-9e93-08dc1c87bc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odM+Yc3cLGG8DTtI/A9rC9xp60KpdTBtqCFTotbh/DXm0b4wOYcAtoFzofuR5jQ4IL9xlTOV8NNEDJTKah4Gt7Tw3XkfVcA1lQ7lpW6azA75rV+xrSMjNNphtslLKkp/LtcCbFByTkyq7BSAWN80LIOEofzGiPpakW1gmx79xjUlhEmR1fkHqntmuN+jnj9EbZ8W4WNfwvDdNAbs/t6q7ZPNc2BmaYpVatLk65Cq96VtyKxOoIuAiSAipeLtyRhdwuo2d28t3y43QU752MxQ6hqa8mkMVmoIgIVK6M6DzF46qZ+UhOuCIP47Gv0ukq8AxvdDmmhM9Yx7AGWK8LS5exQavd7erf9B9q2kH4POCj+hrmLxKPvy6MxRY4cDux71q80QJL/WDOXVpC80PzPKnbqaxq4iP8PCATVrlt4AABtrKUoYhe5d7cflh4W/TTf74bIHdrX28ZNDxF+0HuVjDpFytNOSbyP0jFQvRsu5Xfrt2d140Hfbp3x+AAS4mIbEXAOklpPvmLT58SqSGkmLC1GbNemdpbsNBFhlnaBMTHhYmyGU7tb/Db7aBQVZXZHXVCuwXeSb+/H0ARiLQFNay4f7KCtaAMWFohmYNDcG+Joz7s2XNNT+YzXozvF1upckU13qJW1i9nUEKWJS2bN7QO214u1BuFeXQXPeR41vdkt1c1cDy9YawgdkdewlVDu1zGdFQDL+lZt8WLxwRH9LoFhAcJvTlESsj3nGsibboeMBb7TYS5lkVlGNvguz9ffrTS9tZZ2MNSi6eJ0SUKAW6Wyj0hZVQYsyCsLAULHKNjBsiDqMJBhEIsMbW2z757g1xvboZVTansUrrZjWaiLFmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(36840700001)(46966006)(40470700004)(40480700001)(83380400001)(40460700003)(1076003)(921011)(47076005)(26005)(82740400003)(8676002)(8936002)(44832011)(356005)(70206006)(70586007)(110136005)(5660300002)(316002)(86362001)(478600001)(336012)(81166007)(2906002)(426003)(36860700001)(2616005)(41300700001)(36756003)(6666004)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 02:54:08.4115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce21088-766d-4d7d-9e93-08dc1c87bc47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
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
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 5a3335e1fffa..9f48e5bbcdec 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1627,7 +1627,14 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	/* clear status register as soon as we read it */
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
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
-- 
2.25.1

