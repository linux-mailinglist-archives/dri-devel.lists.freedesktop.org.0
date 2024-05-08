Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C658BF6A7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 08:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CF11283F;
	Wed,  8 May 2024 06:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jbnAf9sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61D11283C;
 Wed,  8 May 2024 06:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxwuA65C3pUHntChYcLtQnqrvpMgScSfkkAV+3actM5pmbtOuhTz1p493wDBiApqger1Y+/n1bC4zAL/0h12EWIijR9IQREBHQV0oW1dEpoZh35Xrucgw8hxcrY8uMLTGPw123YCbdMCvPRiSLUig9OjmoD8fXPpj/oq2DRaj9dx9Ti5mr+sqNfXY7Q7bTjpuZdbIq3TINxgS4Y2snube2+9+y47abG6magb1/LI/+cRxqjJaVWXR2CL8TyHUVJrmvEaaw/TEUA6jIWWW1SSqnlD5WVXi5XBOfM+aQ3LSeusPwoyShVian0pyYX+kDp/CsT2eFacpSlB56nmsiojKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv7RQPnGu+XOKJeivKGIMC0Kby47e5wQRfScDT46mew=;
 b=XEdpBNBYgY4W7r/LQU6qyz17Sekr8rSfH+vsvtjBSwiI5KWn0RsvI71sO4D5ROCewL7rPdtQlUBsI7qJgzjb6NoeklmBeGQonPiAOtTcTUMT7EFL8FFbCP2HDege3kcLJUpAdeFWkNADTl7U4RFgH4StfS+cAnor36s+LdyCSwO2iQt2inSsByNwinhHlLq11Ubfi4bz3MkYALDioC9fMpyyTEEzkk+/Li/wVDb89o1N3200QzHK/GTcixfxmSwzo9+mTdzh/KIgI5VsbH9PmuSMAr4CGGbTmEmxcE5o5ehjoCPpG+Q9VRc/R6IkTZRJGm33LMOlEcefTfpauHQF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv7RQPnGu+XOKJeivKGIMC0Kby47e5wQRfScDT46mew=;
 b=jbnAf9sKV4yevXCFmvrcuIvIUO/VweIXQRRulG3IulHyRzxB5iUJDNCd719VyrDNHYdj2PSd5Sm2Ds1AVNeXpV2gwn/UdfWG8sMNtiO82ZUM8y8HLqtclqcv5r7gdEybBOmEKQ5tFpJ7xM8qiEa35En6p0xzRY1d//ZvBmjorZM=
Received: from CH0P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::26)
 by DS0PR12MB8765.namprd12.prod.outlook.com (2603:10b6:8:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 06:57:56 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::e9) by CH0P221CA0017.outlook.office365.com
 (2603:10b6:610:11c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45 via Frontend
 Transport; Wed, 8 May 2024 06:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 06:57:56 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 01:57:54 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Fix the range bias clear memory allocation issue
Date: Wed, 8 May 2024 12:27:20 +0530
Message-ID: <20240508065720.125846-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DS0PR12MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb8e123-e5a8-4481-eadd-08dc6f2c3092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400017|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GOEgJp3IbuTWi1CHJbqS11TZNWvK8S758AQulLmv1dvu9DBa5rlK9g4TnAMd?=
 =?us-ascii?Q?YSlPohxThmwB9helGzyOgbXOIYEyQG1WHVNPitGvzgURxgKXmbP3qtoebinH?=
 =?us-ascii?Q?UQ1JzNTvrU4DvCF0p8KHZGkRo93ERSKk5ZV4w+ZLmRr6AfWA/gSaGCONySKX?=
 =?us-ascii?Q?Nh2IZc44fs4eQkjkWOT9Em3Oa4Mkn9ZbHrQg7SXosyKJSWxIY7yH1oPWwsav?=
 =?us-ascii?Q?ya3TQEOS3MQTvd3ttWgtPq2d8kg1ErC+gqxP00kr3BhHa5xkRs0ctBsDStBq?=
 =?us-ascii?Q?J0ok951Ovs6A90EMROrqbfb1kxlaS3GO3IKd6VOB7nuCsrJaXaFjxEpOlfeJ?=
 =?us-ascii?Q?jpWeDTyMWKns00hlw+hPcNT7jN9gEmoV8IpZuvVVFK9YbMWIe8SGA6J2Cv/B?=
 =?us-ascii?Q?UiQSxfg4N3Tj6sva6rPC0njtlJnJchGEZ5+KSNM5A1u4BJtu12A/UR0eP6IE?=
 =?us-ascii?Q?yQu33Om4ZMtFgTmnhf6pbOnTj5rdacXQrb1tcV2Z9xDgLKDuXwNfYnGVS+NE?=
 =?us-ascii?Q?z9n/U/uKlE5ffb0kA6h7WL41wC5o0SboQDQiWnbgRjweCA8iz7pUeD7XyBW3?=
 =?us-ascii?Q?NYZNQj9mw9f/qIjMmd/d3Q8kKbQuVuCRR7CfV+d6irHIQcdp2vDab/ZfRf48?=
 =?us-ascii?Q?wa92uyQz0KteCGgnK0iWu/cnjS0dDOWPOhkf147m0jjm5tRFJeU52cTpk2Tw?=
 =?us-ascii?Q?VQ4rVb4ZwaOXJrHitCP5Zjz+vkQIxdVedYrBfR9AaA415cEfg/M7/TdPZs1g?=
 =?us-ascii?Q?v1kq0YdP+0g0DbBW9cEh1F8iCIOK7rlX+DJyCSb1knZ9iYNG2DBPQrpp5GAL?=
 =?us-ascii?Q?yKjJd2gQCPIG1NEWDweR53531hsR9Y4+IoJnU8uIgTR1JKs3z7DVvlwSa6oT?=
 =?us-ascii?Q?AN+b8aYs9pjpEohTgRZEl0W+HHSO1KaiXa4Ou2feeAlesXB0N11rrLnDbYx8?=
 =?us-ascii?Q?1DUPhg2EK2KDOxYb/TjhCZvMaww5EDKKasnArdW0TVhjPTHnpYJ0HZeGmy8n?=
 =?us-ascii?Q?/yA6YktI28MINPTU1BU5wpoXelpXws1LLTDwmXf3tkNN4Luo9eiwbh0lKnlt?=
 =?us-ascii?Q?zzv930SVoKXEJJ17fOaOnMB1bW/haNJLiNAbP2eiemJLc42aiJOXspx0rxsj?=
 =?us-ascii?Q?oMrC5Pyut6ieUUueEtjYT+KF/rmac7tjo7a80ypB9nPd48WeNFTynMKfk7qB?=
 =?us-ascii?Q?wFrlD/V3sPB9sdJfTmgYgxmajBOhHvh/+bQ09Z9i/5ogQ3L4efkkZS+qhbJ8?=
 =?us-ascii?Q?+z355+hedyWhyCAG95AVUPqHzFevvT6z8k1W7i6yICslC0D2mZxP8cnMgn64?=
 =?us-ascii?Q?Qm0GUZ3HDYqc3RwqdrsuJugfmZ+lTp0i9GLdoASmVvGQz2pbqAqoGZvh4HAK?=
 =?us-ascii?Q?dIhLE1Z1q35R1Os98HoYP3wwIUDq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 06:57:56.3322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb8e123-e5a8-4481-eadd-08dc6f2c3092
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8765
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

Problem statement: During the system boot time, an application request
for the bulk volume of cleared range bias memory when the clear_avail
is zero, we dont fallback into normal allocation method as we had an
unnecessary clear_avail check which prevents the fallback method leads
to fb allocation failure following system goes into unresponsive state.

Solution: Remove the unnecessary clear_avail check in the range bias
allocation function.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 284ebae71cc4..831929ac95eb 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -574,7 +574,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 
 	block = __alloc_range_bias(mm, start, end, order,
 				   flags, fallback);
-	if (IS_ERR(block) && mm->clear_avail)
+	if (IS_ERR(block))
 		return __alloc_range_bias(mm, start, end, order,
 					  flags, !fallback);
 
-- 
2.25.1

