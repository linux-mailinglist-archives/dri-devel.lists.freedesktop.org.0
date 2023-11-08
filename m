Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF657E5B5A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4310E7C5;
	Wed,  8 Nov 2023 16:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A435710E179;
 Wed,  8 Nov 2023 16:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPU7UH6J8f4QpYG+0WGUM3u2FgAsEVkEhGrckvUMi49kHJRkm+i0ZRilQ5YNnXDl2SL1p3Vlg3SjHcSayTAI2qmVYs2q7QbM2Y/5Mxg5O7blfjL0UZlBUl6NCuUHZTmt/PheyKirYOPd0VQipLN3s2z+SELZGyg6JixrCzeEOwhJB7jk3kiH4CmFpmnOoq/vQ4NGnxxo6tDSW5+mU83YUsP4+baKOTfsTg4uEFSgsy+H7UorTy6J9jnr4I2t3JLi9Wv8Ve0Js/n7FO/KRNr8ii5C+vcEjmZWsF6nclYlXpVZkgKkIPWNHyvXtw8cty2+oOABzyOeY1sPaifO36avSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb1coALmWUESrYJ6bSu/3GBL4MDQJ78PbxZRikVCaUk=;
 b=kBi72ftunen5PLKMhKDRimdkyRwwd0ePBW4vVp9Yv+riyPIhGhWtiP4IV0nWJrxJOrksLWqmCPXsL1myI2LVvQeDv7q+nFd5NatVv9FiGhBfC4l7FKXRc4h97E8xI6gUWntidexgypjus3HELFxxGfNENO5afj18m919aN7GNt0uP0NDGrefX2otstlSj7krF69IuiJlAMpy2fWLb54fp6XLxVMvK0PTP85vnkE/8ErLiBsLZnPwIOS88x8WGKd8aQYOehu0UliYbHUBuqT8LlzzOB0QRgvm1w/FhihO4DOnejGnmqKikaf6+ebsMptqZSxHtwiW5RdK3Wh/hbgHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb1coALmWUESrYJ6bSu/3GBL4MDQJ78PbxZRikVCaUk=;
 b=GkwPIeSK2U92fXVlwLqfFLBH++ov9uA0aClYG7Ma2VwRq+zg24TeFe8SxY5I7UsguhOf3DO0U8UrQmzMDE7lnFe4Rlq4cbI+QwT/7d5lt7liZ/BT00Fs96E+X9TzD1saGamjCLO4v1jW1tSWKLlzzcCAGtBZ5IUwV/p0AKoiOYk=
Received: from BL0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:91::30)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:13 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::56) by BL0PR05CA0020.outlook.office365.com
 (2603:10b6:208:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
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
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:12 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:11 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 05/23] drm/vkms: Avoid reading beyond LUT array
Date: Wed, 8 Nov 2023 11:36:24 -0500
Message-ID: <20231108163647.106853-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a683951-44b5-4a5a-fd5a-08dbe078f603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EncsI2///4eQ6I89eW5EkkL8Dli59CeQ5fZLnJqFhiC5wNVY2IujEfWss2xLCGDHXt0YNAMgWahjYX1Asuf4WxHJZtZdAVbWizT7VE+pgJJ7puoDBm4dCbs/+Qt9I3CW8W+Wr2gaB7e7EmNvdQxNR7Q0wKRPhW3EgH+Z9au5p1uoWGR6SSS9S5UKRknEskx30X7lHBQcAaUT3yoF9KGmfcipWCFevKrWhx3ujdsODkexdkl+Hnjyh/3SWczeTfngeeYwRMO62sDjx/jh9CSCFIWv5Fj+aI7RWatFui4XUejfgBk4xb5VYptZIqV62lNuD3tJ1JKgPySpMQI1YsE5owMwSgM1/oI2SFpH3uC28pCLa/q+FGXPjVdxEB/GObGOJtvkJHSlOnGUedVxC7t4g/bjbFKifZLCSaSmj9ws2/UVMZ/xXmX2MKlUAbsiQdJ8UJ1FoqBlh1iuKOooCfJzykGcfcAvu6yRq2k4/+icJg5smTuypLMsWzGEbGrppTl1xGbAOG+DbBXyxs1f8LXv1y07UUQELDeKN9Wr7Vv6hSonRuz+3XMOmsyfGaIfR0dhhS1I0Hx8IV27Ivhg/JacieGH/TPn2jq5NApQPSvyp1G9VOMEW5H37abIK4WEimXInhuK01sYSpMGWYZP6bnOwVuWCYCKM4aa++GxrZ1wo9fm1+04iSQQwccNBNcB9Xd/+fioK5PiiIZRifdQtSMm7CP/Q7Ej9B7GS8LQHAszst3k2mhbcMj2m9FADGMaeAdjpg1mMT1n4LV/ZfHKOKiB9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(2906002)(36860700001)(41300700001)(8936002)(6916009)(316002)(36756003)(54906003)(8676002)(4326008)(70206006)(70586007)(47076005)(40480700001)(86362001)(5660300002)(478600001)(44832011)(356005)(81166007)(83380400001)(40460700003)(426003)(336012)(6666004)(82740400003)(1076003)(2616005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:13.0742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a683951-44b5-4a5a-fd5a-08dbe078f603
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the floor LUT index (drm_fixp2int(lut_index) is the last
index of the array the ceil LUT index will point to an entry
beyond the array. Make sure we guard against it and use the
value of the floor LUT index.

v3:
 - Drop bits from commit description that didn't contribute
   anything of value

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 6f942896036e..25b6b73bece8 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 				      enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
+	u16 *floor_lut_value, *ceil_lut_value;
+	u16 floor_channel_value, ceil_channel_value;
 
 	/*
 	 * This checks if `struct drm_color_lut` has any gap added by the compiler
@@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	 */
 	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
 
-	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
-	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
+	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
+	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
+		/* We're at the end of the LUT array, use same value for ceil and floor */
+		ceil_lut_value = floor_lut_value;
+	else
+		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
 
-	u16 floor_channel_value = floor_lut_value[channel];
-	u16 ceil_channel_value = ceil_lut_value[channel];
+	floor_channel_value = floor_lut_value[channel];
+	ceil_channel_value = ceil_lut_value[channel];
 
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
-- 
2.42.1

