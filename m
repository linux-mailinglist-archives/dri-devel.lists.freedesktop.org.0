Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B43868281
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943710F0DD;
	Mon, 26 Feb 2024 21:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zLsw21uF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72B10ED21;
 Mon, 26 Feb 2024 21:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXiA/tDjbHvsGuf03zyucEqPm1ijog/wUYHp/CQz9+e8AbCVepM64rqYTyNRshPw+GuWqnuMQotUB+Hmgf0mQO2RHZ7QjRNIX0xAy2H00/LWUt+6R/GSemDv5NZnBnuLiuqd2MTV4icd1icIMjDRGXyTphrN9iiGSzX8/gz0nTK2X5nAJ/pdj7ETNgHpu4dI+mYBrVqnLFvBHyX3KcsXKUFoWk8FcE0cbV5303sXgZh8aDvBeQLTnFgCW9ThARtU+dwKl3V+Xe3MEuf94R+11P/bM66YXC4snHdbAtQnhveTDuvBgGrH4H+J+SYT8fu1cvqWj/qi2NnM57AFKAaqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svwd9RqL1Uysq7fHNO8bS3QZPRBjygpzxq05j5/AQX4=;
 b=e5r0qPOZmoXeExGBQSf81SxWBlxWHq1kkvJDRxzmFfvQXyrmrv5a4XHPZrYdhi9zhjwtJbLxn47WFu51kLWfKfJNKJqZ6MsgH1bu2+WX2u2JNv2fv68VgIf4OYIDRA35w9bJVWQUf9bEbS86qJOJy1QBMyZi5+OddKaGCL1Dd6YzLANDFiIUveoxTZE/lHT+80JjFVh+RGhvWYh1m1HZhpVFaPmxkwigTOSrKl46MM/wTUE5lwy1Ph9DulIQv6pdr9NZ09W0YCWw+ee1orB/weGTT79MPVKALzhJIS0ctZJ92Jw1ZvKhIBjerqyFSDnuFl5FyVyhH6VVA29R+Jdchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svwd9RqL1Uysq7fHNO8bS3QZPRBjygpzxq05j5/AQX4=;
 b=zLsw21uFWnRS4rqvMB3rZW761LrJwpNkqKRQo45fEzBd2vNP7WS4SF/mIotcDtLBIx8n++fi2TgD2Tr1lJgnYrV6aUQfqHTBn5YBQJPeVd1xeL4V9yDtISI0oO1cjQDLmZeL7kaV38uEVsh2sZXddALcG82tdjcp/xuG/atMg7g=
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:07 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::60) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:05 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:04 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, Melissa Wen
 <mwen@igalia.com>
Subject: [RFC PATCH v4 01/42] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Date: Mon, 26 Feb 2024 16:10:15 -0500
Message-ID: <20240226211100.100108-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c963de4-90e2-47be-7862-08dc370f72ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiIzScEDSwzgrOyvBg/DNCAn5TQ2LDQcVz/R5Z+T8a4YNE85LQJ81vEg7pJ0kRft+59DdZSXWphSayy87yPkGdGbnxk8W/Tv+iR21QTvBN98vMFVjXorN/WhQRlpXWo31wktxLLnHm7EtYuYIgGfu9X2UXn/g7SuAoQhEwEorZWFl5v6no6p1rCOPzwhhNXkkTKi/lRX2pByqziFoLKazL4kFnu+9mEunUrqV/2ckk67v6Z2BC5G7nNLR4Dx0hbatRPJDfr++YAR40YZbW69LuvoOu1i7JzCPGdfzfw1Fl/OgHfowBGnb83s/vEMaO/sKox7KVV1kOb74yBbl2gwhQEZ3hlF7d2f33fcxm+eVzKdaIU4KVmfTUKytDsE8lXE/vBOU3PKhhxCBmqkYdsCFeEZJ+pLBgN27OqhDPL0pCdpiS7QDRg7MXwkSD8K8zZwHCiqqmW1bHEJIHT3xsSU0xG1xjGZ7ruQex4O+lq3kfz19Z4kzrvHeGP5pG/6zv7ZvsxdkChf8Gd7IFjsygNdx3vDuuZEVscQ204rzj70Phbxa22HQ/Hzkczjf1yKOLgNh5aP1mql0RhV0/0jO1QNNXlRnc2izTUdaHs1g+LudJMRRmWAwRV6YvO3QhERmNHZjs88rL31MkjDe17PJe989uYkn4vRNouXjbyxOGyGd1PUekaioQFU/XhQDsLxrELmCipxRmsvTc2xt2l0Psz3QTg9fo8Qvv9erBSnOg6MA5RxBI8jBmIcwgHKEAx/Nsh1
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:07.0992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c963de4-90e2-47be-7862-08dc370f72ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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

Unit testing this in VKMS shows that passing 0 into
this function returns -1, which is highly counter-
intuitive. Fix it by checking whether the input is
>= 0 instead of > 0.

Fixes: 64566b5e767f9 ("drm: Add drm_fixp_from_fraction and drm_fixp2int_ceil")
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
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
2.44.0

