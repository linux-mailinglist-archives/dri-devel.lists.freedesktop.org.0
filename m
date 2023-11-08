Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16FF7E5B5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A70D89220;
	Wed,  8 Nov 2023 16:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05410E7B7;
 Wed,  8 Nov 2023 16:37:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLXfhrZdBpgut7pNM+EDA0vzuHu4X7nPYL6vREG9+DL2XqRLrEPD4uwXEye25pcuYrdKAWdC2LUzhj6JjVk5iE3oPJ2qJLbbU3K52gmfEGfBjfc9JWIPNRpSOmDhafjAbQFIQ7sIROjIl6PLHtnTZh7EtSvudEpRWVI2NW7e196yFO1j17Vn9vH4pJY2oxlNH/TnxlfpqYVn4JHlCMG9TIY82o4cflsUaLmkRmN0xCvJ3KAlCCtxvAuGbFsclUa//mms7MJheW6Tf8f2F+bQouKEzusU31y2luetj7gL0p/fRt4eIFnsJRTXyTx7J9snvzkMQMQ8rU8xrN3BLNA71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhWPoZoAOU9FEHfBvJSpCKaUZPtxu+K6Yu24M6A7RRE=;
 b=LU9zIa7sb0Uux9RwrUKhbYFPrMzvxGIx3Zc0mB8LO5/gR63ZTuDZ4jwEFaMtMHTStk+HvIYXp6q2nKusBUQLZ9Y1OYFT6LA6gAkyIuyYftdt/kA7T2B1uKqI6sWrYBt69SGqMwpj5SUKYFvxvV2530Iq7zZdbYgsiRPFQENnl8wNFYQ5F1xRa2cLR2XUxU20iJZknN1EZ5bKxDqeYGySaUCgC/Iwof1fF2/fFTeLuAnxN0U9NpHG220DADj8zReDImfF3UIaysS2HUOzqDBDu5YyVRpF/bqP7oa/TRtcziWoxxiga92XGtsYsdv6ba10f6+5+iF74DnRjCl837Bs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhWPoZoAOU9FEHfBvJSpCKaUZPtxu+K6Yu24M6A7RRE=;
 b=tNXAR+efd4S3yG1FoB97gopEDFF22WzHiDkvxAsgNR7VeHqLay4iI15QwNvhqxzahhKx0sP2q8O9Sf4kY+P+PVJRGPvl2z5F66OrNmggV52FJn5cP2n+YYDRpVwj8sgP/W7b9L6Nx5/i1MPy4tIbC/gWBebXGaPdMhbayzedaPc=
Received: from BL0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:91::37)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:14 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::6) by BL0PR05CA0027.outlook.office365.com
 (2603:10b6:208:91::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:10 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:10 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 02/23] drm: Add helper for conversion from
 signed-magnitude
Date: Wed, 8 Nov 2023 11:36:21 -0500
Message-ID: <20231108163647.106853-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: b88c1035-4131-466d-6e36-08dbe078f676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lWgLp2E6vbQVP9FZIBhBp0H3U3OJ0nTshrZG1LNn5hdk8scOeupLw6V7XwEKbNHvz82FZUZgm8cPa/IU90lb8zRNqhtlh+auDfLTgKu+Agz6oX0lNbNbrCP0088I3l+MB1lhA6FXLh25Spmz0KTsz/APgQkl9wALrimky20UyN7mYZKSDj8sQFehzVkuL316NepE0JY6tT+XplHn4UJGMbHDCwyhqfRhl+lv2FiSGjFAmge2RW3bSaMZbUsJpbmmwcTfVJDFlTpS6Sd9ICFrDpDwVpMe0AIJJdp2sVE0n+i+paLzU+v1u7K662trqpjUtWFFHbjzBbT8KNZcWG87SiMVEjAm8vH/zxjCgmhmtVS6umnY+oH79/zz8otqzGjz5uQDY39qgp9Tl7YcsiihgdGJz5vF1y8hX2krBxSgkGr4A4iL1SfbCohgj+S3r3bDz5YzZs0Fp+omSJ9B8CkiVRG5y7ePytxG4yFLB18uuiELcCTxjTj5rpnUSXQi7ivBrTV3BlZ2qGSsci/uwHfAabCIhLndwrF9WwDw7zEtIcfiaVm7G2ZPnzbiOY68Ifqoz3wrqA7dqadNMR6EqSGDjtBVJVE6NbN3K4UsEJFeQXTEUAOO/5LHSo6xV+W/SB5+XrW/s9PHaPTFZQ3//3xcddydRJMylMBorAe728Pkl5cBfem1PUOZriF5FE+ugRDBXa/TCqSIgyzg+Xllgm+uSSG9ZU3qojG1MGgB84fXjRk1oqR6qNLnaxpm59KPmbGYumOMTATGHtXn6CwHBjCgfQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(46966006)(40470700004)(36840700001)(26005)(426003)(336012)(54906003)(40460700003)(40480700001)(6916009)(70206006)(70586007)(36756003)(6666004)(2616005)(356005)(1076003)(81166007)(82740400003)(47076005)(86362001)(36860700001)(316002)(478600001)(450100002)(8936002)(2906002)(8676002)(44832011)(5660300002)(41300700001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:13.8242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88c1035-4131-466d-6e36-08dbe078f676
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/drm_fixed.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 0c9f917a4d4b..cb842ba80ddd 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
-- 
2.42.1

