Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648E7E5B59
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564C10E7B6;
	Wed,  8 Nov 2023 16:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A6410E179;
 Wed,  8 Nov 2023 16:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW+1Z2O+WmLB+l4ulAwpUIa+WphrZZdgY44xc2nIVJ7h63NGhLOxraBQ4j5Yifso5gi0RvZ/xCRc07GYWZqKiRmdJ8AIBW06DNGMIzgNdd1vqoiVLOi9DFwHRfinhjxwegxaWTFoB/cckBx9uM8UtdD+yj5Mir4qPhsBLcxSA28WO42Pyv4s+sBi3HU6jGF31hMF21/Ucnd1TpxwhWD2MRmR64pKCNEk9Zyq02KpYNdOW4M9zMRrzsucy2CHdn9lJPjE7jp0rXdU1DWlxT4wnDYbofLwLCszWIXrWxwX7QyWmmdHUATiwPdss/HNmNxFllzjOwuV9RQ1SFESAOWQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ptg/5WPQZUiaB2c/PzsJ5YaeIQpY14kb26HP/fvidg8=;
 b=HqXCz+V4SsCcGSWT7LgmiCsktTH1WH734JtjsQq8b4Bpdz1LI5z1nsjSotdU7Wjr0PtKo73812mPoCk3fbVi8NJPcD12YuGQabn8xD+r0t9iTgGit0isSNQIoIaKv4YbJTH2K8b1Jy7yoWJpSYXMbk3wcl7P0bKvpvdDWUkL5S6q+lciUvnCAf3QM1NjYmb4ctZnC63gZ8BoelleJJzbpXuJS7/Pn1ABzdpXBnM4mcklt6OBVByX7O554rK/B/x9CXm91cQeKiELcPDiM0V98d+Uq4KyjZ/I5eJGXL2lPOva0cZvnI3zbnOOK+fPMztUqQcKul/4LlmQReBzRxvOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptg/5WPQZUiaB2c/PzsJ5YaeIQpY14kb26HP/fvidg8=;
 b=AXi/W4hAjQoIxXRm7l/J2mgjywDo8HoHMS2iCG48vgLB0YXiXulMa0jS3qjpqNKd59Tcr/kP0DG/9awWay5XNKTxVmPpsycjEPesFDnchrntvcEPYOMG82xxbsdM2aVu8v/7CPLcj20kkjxP6TzVbhRB3AmKR1B0SS3bIdvtsgw=
Received: from BL0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:91::30)
 by SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:11 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::75) by BL0PR05CA0020.outlook.office365.com
 (2603:10b6:208:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:09 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:09 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 01/23] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Date: Wed, 8 Nov 2023 11:36:20 -0500
Message-ID: <20231108163647.106853-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ1PR12MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: d06cfe86-7fd2-4a89-c05a-08dbe078f481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/7PsFsVeZglwkqs2Xj6zzcVwOYH2KLXndjlov5g5zn/HVn2J1qWE7/rSLjGUhDCckf8Z4xVNacxzJtzO/XUUTMXSU/mJzjdh+UPSo5SzBXok23qoOoMufCjJ003NsUGuS/ziiyO4DETls/FVBWqYU5p8xt+NAJ63QacsH4wVle0MgCgOqjFOK8wZAJkzJxe7IXlL02HgqhPluVpsMHioaSuequrd2qh9o49OTVGGsDHuGqcLcgaANcjYxNdxP6/rH0paqj7dZGSK40YgRnO+lqDBVZfJdAU920sRP5BWBtZvs5Kn5b+ujFUBLRZi2QNHXP5Ud4hXrhvkxCrHEg1DpWSe0G70qgv4r+KPxtwrODzwhu9rtK5W9qhegC+LCRwyB7meFC6uOSDWQ2OdYiGPliJagVcmKU3dOylb4gBrhHXnJGNnm0O4/Kb9xyegvBJj9pNMB+kr9qCcFUbb/L1DPRErYz00UwcJlZxvu2hIXnwFBOR2MsCpIypq2Sm4vtVrHGeArOEgnniwgLfHO3WFaVSvNx1b/QjJyh4T0Wf0/osQs17NHvXhe3HMT6bbgQSYN0gbmDIb1ApPlpfl4tTSgLnTr/v36rEcVUcOeNyVDe22cG5/CiiojnoYGRrSLdVDhbybl8QYkdgjXXZeCYUPHbxRNTcX036hOmLcuUjFnbHWu31ZAhGTqbJzihVz0hArR1L1Or9L7N1Y5GhhFrSp8pPL517GY55vosnbxxynq2v5jCRiYSwFPA4s8MbupD8IFq4qssOJym1w1/ltDtfEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(36756003)(4326008)(426003)(336012)(5660300002)(8936002)(83380400001)(8676002)(26005)(316002)(70586007)(70206006)(6916009)(54906003)(4744005)(41300700001)(44832011)(2616005)(47076005)(478600001)(6666004)(36860700001)(82740400003)(86362001)(2906002)(1076003)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:10.5429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06cfe86-7fd2-4a89-c05a-08dbe078f481
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unit testing this in VKMS shows that passing 0 into
this function returns -1, which is highly counter-
intuitive. Fix it by checking whether the input is
>= 0 instead of > 0.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 include/drm/drm_fixed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 6ea339d5de08..0c9f917a4d4b 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -95,7 +95,7 @@ static inline int drm_fixp2int_round(s64 a)
 
 static inline int drm_fixp2int_ceil(s64 a)
 {
-	if (a > 0)
+	if (a >= 0)
 		return drm_fixp2int(a + DRM_FIXED_ALMOST_ONE);
 	else
 		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
-- 
2.42.1

