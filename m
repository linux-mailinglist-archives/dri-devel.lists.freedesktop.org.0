Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B878282C80B
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA0F10EBAC;
	Fri, 12 Jan 2024 23:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC9B10E948
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTdh0TYAW9YSJcocg+gL1GqfKMHVCQZFOeXZQ+gEPBm3ixAJI92D8UpoK+lRT40fMeX4/6AR6dSmKXi+IHy6UjXItMqCJsFV1goz5YHNa21CsE4I/01ghcBE2aLXKD6hOeCi9KJf1ECp4iLTWYVQgDQOYX67zFgZU7apkPXsYD/oziwcxnm4nGauuhYIRkcwghDntdAB8uP5L8oF9XZBBW8Q3cg/ODGywIfbHcfEirPeYa7RW6Hy7x7wG0ZmiPVHU1aiOuOTq8tZTePyaer/W9kk/aALINfoaova5iAo5u9NdPHkjKI9iydF4i3YueKG0I2mnBHHBD4EV4bOe6hCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJSd29Z+ZrfAwCFTwgETttHBvJJA6uoq53jzh2OsD/Y=;
 b=JEWowwowOweh3DCNaFWbGqcOnuIb8gTrN1Ewqc8J/PWz2wKfKX3GOfMCgzruGutgiTo4LgX5taWLmZa4zhgeSIxBu+VA24cHKlFA9SSId/hUmhQZ62EQlNZOXNYUPkuJRTuZAIzEByMk1ZW40tCbtuiE+xqv4wpMPHPxar5PdcqhxfshgCwF0+Qj/uhWod7/+dIF9ROT8qJMmBufteNzx3IOdtImdJc92gJOjWsICHXKApU29bm9sLhZSzkM482YnVHm2TyShVucvW+hCVEFee5mEnxNRbB0QUlMetGLtxOcTpjMgL65h+2c9hH8LAyMRZ7Hg6utoFOt+G8Sinxtvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJSd29Z+ZrfAwCFTwgETttHBvJJA6uoq53jzh2OsD/Y=;
 b=I6ER/h4AEEXJgrunS8lVsN3zCPuxaAJS2fmzknRNQAq7OKMQ4zPdKaVX/dOS7EKo0IXUAxKIuk9BlD+Kh/79p/dNWu+ae283zym2aWmj3dDajBO7F49MLEpH14Z7eI8MDyZR3qNypUMnjnrR3oke2cKwmhgdnT8djzKRrbxUNf8=
Received: from PH0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:510:5::18)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Fri, 12 Jan
 2024 23:42:27 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::bc) by PH0PR07CA0013.outlook.office365.com
 (2603:10b6:510:5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Fri, 12 Jan 2024 23:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 23:42:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 17:42:26 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 12 Jan 2024 17:42:25 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in live
 mode
Date: Fri, 12 Jan 2024 15:42:21 -0800
Message-ID: <20240112234222.913138-4-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ee41d7-6294-49ca-b366-08dc13c82296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWpH8F0YFS7fGEAbqYsXLi6PoSPKqgY8Fd1TjA50SzcQ1gd8fOAQXMyfs82QwugRpbE/82FSulZHIuJ0RqBJGTHOs7tr0pFUYuZJ2kJHuxxF9gbKyEDP0ons6wdscVwZvHjJ5MKeMnVXuYuJn7+owvV1npkN/c5ctm+xjt9EFgH+K4XO8nSeJ0fm+gngfW6KpVvmVsTBY3zd1p78mb9g3CkARtBs1j+kRgYCW4zQ3CGXUudFFvqndnsfwsV9m0qJOA/LSr4imGX6YNL3bpkWcCpgD+SPabdvfVDFAHCtDUI2fyNYzgyVXEn4Ae3+F1qUXv9tgTF0bMvEPmwArqNs4KdK9AUm0hvyXJVVPTzuQoke7XC6ocndCcMoh4vFn/QQ4+UtvEHqcOHjcc06zA2nkLrx+sGQnP3/vs0xlHsts6BfBmKk2a7YO2yQaPmuHtSthdWDFB7QX2rskJ2Hjjqyp6TpvZJ5AHr9VUJRSyzYoIx6McI50nd8mFUXhKSve0Bi/zpWqz0R5rQmKm+RK9qWgrbZYWmULMWObaySl0c8kQIx0QcdnP2uR+SGiIlROaSCGchylqZCBzM9BYQdqfT45cP3JSUXPBX2SonoylME+rpj+WdeLXsuMeTDGJP5f79kF+F9UZaAoIAxJ2gzMWaR4UFgNbsTFY2t9M1d+mNIAu8/vwPgpYIENaFx6YLaN5iP0GN9j+n0YnE+mG5PrrlD5mDYt1F/b0gumSvZBbU+7+VrHV4VMFYQllMxRDZFF/3iB4OCDLO6S4HVrG3RKdyg2fd9u2SMdyXL/rqF5dQhMVe8p3W3RTa9Jc3ZRHb6iu0tc/r1WnH9Rap1HOviueBzMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(40470700004)(36840700001)(46966006)(83380400001)(921011)(2906002)(110136005)(2616005)(82740400003)(1076003)(26005)(336012)(5660300002)(8936002)(426003)(81166007)(36860700001)(41300700001)(316002)(356005)(8676002)(44832011)(6666004)(70206006)(47076005)(70586007)(478600001)(86362001)(40460700003)(40480700001)(36756003)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:42:27.3831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ee41d7-6294-49ca-b366-08dc13c82296
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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

Filter out status register against interrupts' mask.
Some events are being reported via DP status register, even if
corresponding interrupts have been disabled. Avoid processing
of such events in interrupt handler context.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index d60b7431603f..571c5dbc97e5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1624,8 +1624,16 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	u32 status, mask;
 
 	status = zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
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
@@ -1634,7 +1642,6 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
 		dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
 
-	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 
 	if (status & ZYNQMP_DP_INT_VBLANK_START)
 		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
-- 
2.25.1

