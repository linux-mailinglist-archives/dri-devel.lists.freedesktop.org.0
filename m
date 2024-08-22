Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F395AE2A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F191C10E783;
	Thu, 22 Aug 2024 06:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="aBrIiDTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DFC10E783;
 Thu, 22 Aug 2024 06:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqsyOEgMHA++vc0obXl2Gkalo4K9V1MV61hZqhOqebpQr+Qp34YdV1rlkPKO8MnEDI/hc4WSrDgc/mGdg7WVZ8MsQef8q8FptNnX0MCpHS38T3tzJwgHH2JOyMAVkhxZvHpORHlW6M58738AsqV37Ajr+guJ46E+/fQb5lhKdkdlfiHMBSRYGXYqyx6O3F+vSuqosNBiy1Mat/NnKx9vVGfUCho8OHekSBSAFRekXAbgihOqwM1Qj0KuRbAa789nY+WN+mg+cjEYECrCoUbuULO55l2mObR/fMupybTvk0RZRm1j8ySbOSKp5zACo0C83IvKnZM43SPpMTlFhsV3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=zHLiOOv/lNU1AXt3UhqVxaykd8D6aE7UQLVClC4i6QqRVIWyIB2nPuTd5a4IqfM0oGmeXgbauJUn5AOJjfOpLKqK8MiS2ehki4UXlOd92tDAF1M+OWvSovPyv52tjyyxBBPkm2cCnXE6shslSJ8shaqL90o26Zu8tc1i2lb8OwJbXXnFKCJX4SrNqc5C+ap1RiaU/JU/w0CPKYsXx9PW+XZJjOsERmuzGMR2553mHa7McQc8DiBE1upLTf9rTRJggTruOT91+V8Mf9DwVlwf47ZHy1C4bSmNBzHVdwuRSPjyFWgT1XfZy8Tv/wrQiGZc/IJ9BTcimkvqfKV1TpOfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=aBrIiDTROuopHz7nH5bdoX1zsU4DrXWaQeZRCAatXEg/l2OBQK5cgN9S8QOteya0aNOu1oHgzm+BvrQgOxZDd+fm0G6yGK/raaR6LkO5tWcsFe5D1iT4AFqdbi1Fu/P8dHG6h+bH86b80BVIToaczeJ+sfDwi/ltSx3R05vAIsUKYMS38EBJYDjsQsfSl80WJfoR2MkM5BtSkzoGymniD0CixUADxTySNc2uc3W7Oqr7Q9FCwqxpWY1ih3DuYH81jFXwOloaK1elrPeA9AN/dTEOZURMtV+Q25fKPHMtRE7pw77deyFHPlWYaUtlL9YjB15nkAapJIpK6IeUWOF8ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:55:21 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:55:21 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 5/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:54:46 +0800
Message-Id: <20240822065447.1333390-6-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065447.1333390-1-yujiaoliang@vivo.com>
References: <20240822065447.1333390-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 759214f7-6826-48d0-7111-08dcc27763a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nfylys71xeDDMKLJU2pCqUGaN0LccsaF+1W727/FEbmkstt4kRNQsWxkmWU8?=
 =?us-ascii?Q?EvtIAi5/D5qZ75Sd8TCVi9t2QxoqJ0bncDEdTuZfdVBBaZixDfS/riyrrhS/?=
 =?us-ascii?Q?jXt0TpwGlYj1g3YarpRVivceqa6M1v86uGMZPad7tMmJwrNpkwdxAN2EdRzW?=
 =?us-ascii?Q?rE+nwkQ0favH2VOoBvP8dRmQGcAcHc0M+4vfuJayzM0+YAFuPXD0HZOINr4b?=
 =?us-ascii?Q?wwJnXoInqIMUCYANWlhobKgy9YhV7N0TAHhnzRUkKz392STpOMe9Qy0Qp0Bl?=
 =?us-ascii?Q?XC914hMYZHyI8h/4ghqMsUK8sj6jOD6KyKd04Ws62Zffn4z7saKxtbhsZdog?=
 =?us-ascii?Q?w3ZAqGupZjyblcCZrLXaixDzLuM+qrU9P9Sop+pKkcj2zOxtzz/41OQO/9MM?=
 =?us-ascii?Q?T+cnJqlKFbjRy2KHduLSsFhhylOiGZ48bcJsyOCzPmS/2EQR5TYUH6DeSeVo?=
 =?us-ascii?Q?ntJ8hB9mkLRosi7+wgJck71gNRSg5Bl5h6ngPvQ0cneD86Uodtb3WDiOc+b7?=
 =?us-ascii?Q?NQ4DxVNBn3Jk7FMHYrfOvWIFoGPXbtERtyfofZG5sDVYEwJe4fxs0K1m+lFC?=
 =?us-ascii?Q?yUl97tzhcszHSssj7jaKyNhiKDDOu5BqUwmhwyWBz4lg97KHmX6BMWxmjE9Z?=
 =?us-ascii?Q?9rWTXRrbJ8oV2Etj9lAcdWZup1qWXEqt7iJqVKfx/W7f3nwwxsMnlEj4XJOn?=
 =?us-ascii?Q?boWc+DH9NDcAL6Teeb4qnuTTu8kVxg95bW3dv2h+qSMXrpeWkW2M4UZmLG5H?=
 =?us-ascii?Q?E9ddFfhbys3adRebPgfTWcYz4vgq0bKTl0oM5g5lNCeKf0Q3mua8Aw29BNHE?=
 =?us-ascii?Q?og+dA6fLgpUTJc1WzR56tu4C7Vd8n1IJyAgbPdMJDlP24vIuRVwJ0am+xxE6?=
 =?us-ascii?Q?9tOKWl0xAecGFyG3t3HbqHN/ROhnXS6nB7l5+uvWLXlu/HcYrct4KppOUGGr?=
 =?us-ascii?Q?SooR8enZU8gnbIBW8xStTMp+Vwr7gS9ezD6k3Cirmb8VZJN2d6v6uCFUKb6e?=
 =?us-ascii?Q?0zdsDHaDcwdMqGaKBp5SfpOUErBb5HbbAaC3wascxdeCVZXvsRbMoAFTsFug?=
 =?us-ascii?Q?oHGDS6l5/UIoPGo9Oogk2/erUu1elCZ/U3kuRsXI5jMgAB3NDCeDKNj/evMY?=
 =?us-ascii?Q?ROvRxFy+ufTL8FQpNZw0++1vfmjnR32MfY50+ewtZmGMRpeWjSM8WpibD7rx?=
 =?us-ascii?Q?35q2M7jLEmts0JHTzAxt4zDYo5Wyd1duMw6I4LP5QmnYgEzTuT5fxejCV1vG?=
 =?us-ascii?Q?rJsuvs0J8zQXIJPNP3Z7dP9kRGRFX3Ri66dXkiLPZAEWEBr4RH6jXDDh6gnd?=
 =?us-ascii?Q?8+bphdMrlFr2eu7e1oOYcj7UWL/QjflUtj1SFL78BIcklEKoWFDtUXPmwv8c?=
 =?us-ascii?Q?xw2EXxdYTAwwsfy7S5KKGSUhCrZEV21qfTsAI9mr+xP14X4ot+00F1rMdrNB?=
 =?us-ascii?Q?A55oDKfjQfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHbz82F4ucMGM1P4sa1al30tLktDc9Gs7Xxl0St/vZL95E78wPzrKFJ/zNUT?=
 =?us-ascii?Q?TD/hLUNt9zrXWoomYgaGAGhHET4siJdpYIh5TEVsJKXaqhWCf/NTR9uLSCwI?=
 =?us-ascii?Q?X1XrtZVoBuOFi8JpGWIDFO6YVvAqnlhF1vUT+SUQSnpwndhBoWlL/n96be5Z?=
 =?us-ascii?Q?9y9j7ZOIYE/gXbEZp6HzGaHMWd6S7W7GcNkBDwpipTpCsq3ZIJS8sqeSFcHw?=
 =?us-ascii?Q?uBasIwtZtlzYqcnLfDy4ZYwNXXtMggl6Ll3Bnm7buHhkk9bMeo+sNpEyQTuR?=
 =?us-ascii?Q?pQxorMpb83PJBqp9Ui0HIrrqpBZ5X7/lMlstsiLmhH0pcdNQXG+l7yuLtY2U?=
 =?us-ascii?Q?q7X64yVThztcYJoYogSsHNmxlf1BKb12neNgDOR/LWdNgcj2Ykee/R3gpEZ9?=
 =?us-ascii?Q?jRmwYxbozG9c5afHmjSPadzNzDLnGCQXPiUuqcT/OTTSVgE0/Z/n3bWJbYBn?=
 =?us-ascii?Q?hs1a+TjOXtcLvIy11NHOTeNjyYtElsQHA+R9Ualdctg1Xx5HKMG47Y4jfRbK?=
 =?us-ascii?Q?QF8mRHi2GzyDn86N9JS7dMCBrF76TAIzEv+VroBqu+I9kJeqQzLapks1llvD?=
 =?us-ascii?Q?zvd+ppHjkw+L/8pm5ycdwjeb+8vdqd+9GZXkr7d9ttiCduzZhrehbpRM3xs4?=
 =?us-ascii?Q?J57ulNVk4nQGYDUiWY6j+nLdCLzVazQ70G382EhWmGlXDsLybdSMF/AT7HBY?=
 =?us-ascii?Q?3HV4pRpMrtgW/8TH5h4wo7lpLSObEAF+3yWubVa2a9LjMUBNQ6bPz7pbKif8?=
 =?us-ascii?Q?THY64EAqK9IBYdmOpQTkn8x4iQOgZrvakUZcwCZuPdzaY1mgkjlq9c7yfQty?=
 =?us-ascii?Q?5+ApsxgpGRDnAs3EPD3FpnJe3iN8hdiDiTw/ykXxY3Ht/zgCJD/C/9ih7kDW?=
 =?us-ascii?Q?ssI4iPBsYS9RR64EpTdpiQYZh2/eDX1dD481Y7/AZZTslBRyD+4el5YEmr7P?=
 =?us-ascii?Q?RnOXJQ8LiXvhtV7EnluJvWPfb1gS4c08gdNkylCorgGpvOMKfQ3n7D3Hjt6i?=
 =?us-ascii?Q?ox0tNOO0/nRrEz4FKYc8rJYYYp4ghfNRcRPyGEdDXZS0QxyFhNwUgwZ1R7yA?=
 =?us-ascii?Q?cF2/7pHTmQvsGovnvDOnt+qQiIJkJDThpesjncWxSlMD64ohemU+Bfu76ymP?=
 =?us-ascii?Q?vHQA6NQwszHNiEeGtghLdMl5W+MXxVOmfr5qLDVqIIbj7OVplUuO/1IrLmDN?=
 =?us-ascii?Q?reXGOOdmDQod4r16sm1wfC/qEw1+wwHYVNeHc/sXixTLbs7bEDhuHLDlKMX5?=
 =?us-ascii?Q?99H9qBhmWqZfAT0HbNAiD1TRPWFBAewJOOubyXj3PKMg7N3yIffGjJWQZ5tL?=
 =?us-ascii?Q?IV5WQ6Cfg5oI2LCtXkOR89SXQ5XhXrOQIrjBV8EpTO1wPzxu1y/hXMGQTdUR?=
 =?us-ascii?Q?VLyuQWsHI00WtMLnU6BZN6Dhq284Ogxq8jb+Kbi16UQXDN0Pnkbx2pCI0Jox?=
 =?us-ascii?Q?hR99rJvvT0riD5LJ+K7p3HkzmpcVRrLc553R8iL45rWGzZU3LWcShjWVZZot?=
 =?us-ascii?Q?eQke1xN2rxGW2j+BapFrcXidbhG+wkcNsBAfUhm5nuXg4Adea2SZOIW7ZzsN?=
 =?us-ascii?Q?omcGMixd6LDMLbSvM0fiYdK6yv0P/OvODbTUNCzV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759214f7-6826-48d0-7111-08dcc27763a3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:55:21.0061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0Q73Zg8cltxChyx6D2DuYllgUILyQ/Ah6uOb2aiQP4jQM/6EZLTO4rKTD4c2LsZ97LHUrDH6V1r2win+UJsHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 9eccdb38bed4..d5fa6e79fdff 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -17,9 +17,9 @@ static struct spl_rect intersect_rec(const struct spl_rect *r0, const struct spl
 	int r0_y_end = r0->y + r0->height;
 	int r1_y_end = r1->y + r1->height;
 
-	rec.x = r0->x > r1->x ? r0->x : r1->x;
+	rec.x = max(r0->x, r1->x);
 	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
-	rec.y = r0->y > r1->y ? r0->y : r1->y;
+	rec.y = max(r0->y, r1->y);
 	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
 
 	/* in case that there is no intersection */
-- 
2.34.1

