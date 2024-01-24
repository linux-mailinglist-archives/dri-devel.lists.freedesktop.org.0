Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C0839F9B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 03:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C71610F59E;
	Wed, 24 Jan 2024 02:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C506210F433
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJbUX/jKB3HPJtMw/zVk7mzJF7Yj+hGHbMXnawP02y5SuZ4pNyEf91avnGJB15aXxy9wxqq81W43UmYP3Zs6QgBZLx0Exal+yLhTT6/iVzjpe5gYDGS8JauG+1L5+R7lpNTDS7MP97IJvh7sWrO1xfgBBHyyELA9gB4WUxz60Cs0BS1tyuX9zjtEoDm8j1LdzTI0Ay++czZc1bpe2xLb4EokFCRuE4uX7wcMkGbVlW1Z5sQVphTsd5V9/IOZj4l38s7wSBreypxPnCerGuyzPBLZ+T8EMltloNjYpXLlBxgsQK7TfaGxaF9wtY7hFjuoXyQOMs5A0DpPcJV6VvL8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbYhtGPpxSXx/5jQiSZ/ohKOZc6mALk5xxnOCV2OPeg=;
 b=AR0uVJCEAyvUUsMo0oUo17EIUoaI+WIy+yO8C4iDJ7cr38rLVjxSU5SsgUA/KV/rua1RDbwOlkqeIBYQ2nWLTzIapN/9Bjm//5DYnVdY31OtDkpKlIJ+GeGaBki9zg5UzOeU6WviSCuUwmSP5stPQoygqYCt84gQHoHswlOzARJeWt8RWYK9+1HiR5dZialqa+k/2dW7pvo0sk4i3++AQIiF38WMIlE6mnkFhrOielU5SPOZor4t8e12qG0ZmxjrXC2+fAxXDbtaNxHbrJTdlCK5K2gbmR6Ct0ngzp9C/uEhImFtpdbSB9cOfOmSy7g5b2c3n92XVprB7i1ow/wWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbYhtGPpxSXx/5jQiSZ/ohKOZc6mALk5xxnOCV2OPeg=;
 b=gG16RFnfzOGTfEGg37mlF6KvRzS1GEhvMBq/CoZWdG7QQpBeKmXiAjYQGvleF1xV0J3MU2aTSTG3OLpgR8l4aZIEIVekCCP3J0VUNAIlPYIWTJIptrbAmEMxjbuKQkymaVzRYV7BqiwCufhJv5Nd+pJfXijs2sSvv6tId5obVm8=
Received: from SN7PR04CA0097.namprd04.prod.outlook.com (2603:10b6:806:122::12)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 02:54:07 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::47) by SN7PR04CA0097.outlook.office365.com
 (2603:10b6:806:122::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 02:54:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 02:54:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:05 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 23 Jan 2024 20:54:05 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Date: Tue, 23 Jan 2024 18:53:59 -0800
Message-ID: <20240124025402.373620-3-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 77602114-7b14-434c-618a-08dc1c87bb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WNFYDaIxSNik4kLjU/J0cxkF+LY9cpRtGOIpGkFKhFEK9XWVNBb2l+5A/gf4ANv7uJKOXQmoNiSFbOht0DEu5saw/Pi6jdfS6bmaX5ii4UNU3Za0FKPLo9WtvIGsLNdqsooZ79m5RrOdg+IDQzoj1kCOo2vVXkX8YoI6dWtG68sJHab333687dHV9oTml0eGMPPuUMOKC1NBW5e0wPpXTLjvp3cXUTTlkhU1l1LKELyGW12HgU/WuP1q7NYwf6xbIMnMFarPC3vIJsfmaCpqsSCqnmKmrp//h4zC8G77hZcUf86lR9u/X++HVKb70+RF7PhwoliFUWG2qHB2zVHA7tGrBvk3590jkbgCDhGpxd2jHEyBZhUJ7IbjX7+yg/eS+bvEMdTT2q43rxDXxg4WGXzMFNEE2G6PoP/nyM9EnOPkf0fK2fR4QRmi6mONAsIHqIBUx0In9MH4Tl6aKNUACmi+gCB1jfICIb31DtJje5kBCqbUONa5Tn0vP7A+duGQXxkfov9twL/2vyr6IOhRIwqC4L9bx2fV9zUSMAGv+RCRQvE1U/HqnZGVpRPkbVf4KxsfxqryDXfk3IUchEofHwqTqb2vRm+qfSiitR8OBYbv5aQB/MgwOfLlWg5TUjMl+uovDNlMcC4oVX70/ONOiVEqlwtBNnR7S4e1u+KbAgiWrMw2J7MH75Icmgpo929VRQNWLdHbHAO3wU3LE4zAulHltStzmbT4Ov0HTWHHidgP1QK18wDjhC+UjpKQc+/7dSa2bAF+yjYWmfahOUIlPXcdrs/6vhxHpFUBAFnkfLdas+nqyQXkINJ1eCmdWnrt7Q0uVM1JhnztjsWHzOPKhc+jqyM7Zt1lsH+SO6oeOyD5CRvfV8qMQ9gnMqtk0IED
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(46966006)(36840700001)(41300700001)(336012)(426003)(1076003)(921011)(40460700003)(40480700001)(26005)(47076005)(36860700001)(36756003)(478600001)(6666004)(2616005)(83380400001)(81166007)(82740400003)(356005)(44832011)(5660300002)(2906002)(4744005)(110136005)(86362001)(70586007)(70206006)(316002)(8676002)(8936002)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 02:54:06.9183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77602114-7b14-434c-618a-08dc1c87bb61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723
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

Expect external video timing in live video input mode, program
DPSUB acordingly.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..8a39b3accce5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1166,7 +1166,7 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
 					     disp->dpsub->aud_clk_from_ps,
-					     true);
+					     disp->dpsub->vid_clk_from_ps);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
 
-- 
2.25.1

