Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794AB27D8E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 11:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31210E906;
	Fri, 15 Aug 2025 09:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="eO4u9Brv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013067.outbound.protection.outlook.com [52.101.127.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E70410E906;
 Fri, 15 Aug 2025 09:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=injkXeX4eCbEbQEeafvK0naID4UWTlsZQWk3oBj78ykQQVei5KjQ6UKoUpd7EWReLwLrhqKNCEzgwKuMc2vf+sYr0x/QQVtfQ5Pb0r45/CWDStOzJNPY2DUEkXgTy3Nh/nrkkN54NmC+rdAQzxnKrgl1ssWnGqQRswS4N9O7qLDGSOsOkU9R9XUyhQn557vwbaFXcPDLdx8sONc1WxddYJe20jPtBttJp77Ffblwhhf6VbR+6Dndf3tCXDuFrb36hlBSGymdvUB0Hn3TNoqzmmRokCV4QweP84vorMcCH6AaRIoKmY5NHI2RNh6ViI85Fk6Y49MZp8r4xTh/KcM+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e15o2zdRLYJMVuWuytAnMtAopxzq7oKAfU84iZLvY0Y=;
 b=cvbP014cbv5sPmYuQUfBGd89sEOgStQu3HbtryEPJjQbYEk0zhKf3nA20fiJLiQHpPjvXPdKVk2VrbQW6NlNQtHquzLyoZ2ZljJazEIUWFmAgglrmMK9RGs4xi+gf5JzmpOYNqUGsALyqIBWURoRZSsQ/by8UltdCJoUJpxzEIdAA85RD4+kJ19MiUgKNCPJrgr6YEKB67LBKfcFf4CnGjYGk6+xregaebhV+yQa4m9E/YilCgUWtYksz+azm6oyBEnrPMtCX1fpr+pdjmeKMig6dZIp5v9ducbrcZBygnxf1Tdgli1e5zi3ZD+InI9N3PI6UINyu+vcTcVNXFnj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e15o2zdRLYJMVuWuytAnMtAopxzq7oKAfU84iZLvY0Y=;
 b=eO4u9BrvM/yolmkVOj4uuaWfVCH53QnAh/R9AKDavLboOr1SHGmOKfmQOVFru5YR5taCni3t9sOQgzmX1PNq0IiqGLaOwlC6OquiEmMs9qFSaHw2Gs2H1ZMcOyONYt8LJsZ2j2Tm+2j0x3y+2p+2kgbTrWo+ms9oVp1UiEDMEIH+cyef+FCKQB0hbOOpyG9LuinmJtsjk5jHyNCOvUhN4gs6d/mf6KycrMvlVDWq9jm0TV/NQCHfokGk7b42QQvr5RW3pSUN7R4bkxy1xNuRECLH894md/wnEd+N8G76p4c0TQs6O9Rdqs1Dy2veYySn8HG/kLKBXXyMIMvr1txCSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TYZPR06MB6825.apcprd06.prod.outlook.com (2603:1096:405:1e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 09:53:56 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:53:55 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] drm/amdgpu: Simplify asic_type checks using switch
Date: Fri, 15 Aug 2025 17:53:44 +0800
Message-Id: <20250815095344.618848-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TYZPR06MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0521693f-f750-4360-8bb5-08dddbe1a615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kNlxunFR19QeplYrENVw4PsTBsoDIThXia6RVY81lv9OscBbtq2iN823O13Q?=
 =?us-ascii?Q?C6WD+BX0NnmJAdMWfm30vYzFsYiMOjK8Ak5/89Xl3WT12CCdRLcBsoLEZqJT?=
 =?us-ascii?Q?ORIttuEbGXioX5buKVSZ4ctOcyE30XHOIsXNBuZhTtLjd9AcEeE1x1i7vz7x?=
 =?us-ascii?Q?Sm/a2TU6ITFx4/x72Ip8T/U90VpVg9nsUuvdt+LSxT7SWry/YECLbUEgYR7c?=
 =?us-ascii?Q?BMDRUATvMneo1Gw+lHzd4ay7iCfzzEffOJDwwzLryrmpA2tbQ4WC9qgN0tT4?=
 =?us-ascii?Q?114cBiRbvCEz+/red7WndAJxU6i99HJ2nfCfAWGOEtrfm7A5my2zHiEJSd26?=
 =?us-ascii?Q?31xhuEAANAP+pPt3eYuCvmCqGQaxy1DHfbkb1GIKrf4LUY2o8fqtbMW+JYid?=
 =?us-ascii?Q?2NqXEBDyTjAMm4pQls+/Lo2YQQk63XT6wX+ZL9XAs2JhawNkxhqLwsozWJLs?=
 =?us-ascii?Q?eqMF/apZ6gwVAFMsSJEB1yy9fVKTmoZp8y5zkokBC9w1iZjCpb4V/+nqoFaX?=
 =?us-ascii?Q?s6KlVNFqWYlT2TVgYxjNS2s4gIYMV4d8DDxPIa15Lri1W+s2wfWWIM4nyaCj?=
 =?us-ascii?Q?/1g08qeDsT1l6AbNR/WxpUSW90ugjzGvA6k8HDhKhzfF2DO1b78NT+3ZIH1Y?=
 =?us-ascii?Q?++Yp/wfuPdy3x/06xVzXuMc1OskQ57LHrTQYRCTsqE4RgcBnpnpWHPvPcgJP?=
 =?us-ascii?Q?IXd07Sw/rT28QAALZhSJ9QdX//uVFSNkQy23qrSQmJEFui7YLGRzys5ci2gq?=
 =?us-ascii?Q?F8pf7tg3uMuhw8hjp0zXJZRxi9vNmwctJ+svLEZ1P/jopFGqhI+P93FUxX72?=
 =?us-ascii?Q?VeyAUCynzBC9XOkvX+/EfakcPLW0dPM67XVG/pSjGEj5bi9rcigCuUqUVE9m?=
 =?us-ascii?Q?kYN3jSWEYoypIz5JTyolJ3qqkhtKJUECYTeEAIQyAGL37J+4KcjoXxZH6Sja?=
 =?us-ascii?Q?sGxwy3O7t5nTzYq6e0lt0ZxIBIIs38sXDk0OXQq5RmNpI2XXOmrphmAUR/qG?=
 =?us-ascii?Q?91YCzAi117yBXFervwRBo+pJ3eOp3nsdX1TPUbGJ+DJGUrnnCboSt9flFQBi?=
 =?us-ascii?Q?zMq/36nu5MB4w/4hulLTl05dFYQ20d0WQZ9im9mA4FmDqhc8WTLv2mQ2gXay?=
 =?us-ascii?Q?Xlp2FiXWPpzkVBOqS5WeO8OnE048sayLxHI/oM8bdxPb6tSESrzlo+5ZtgFb?=
 =?us-ascii?Q?Jar05jdL+purrRhmWqoBHeXebH/pvXeymaierZUuajOnOSEaB+EwxE4bBZnF?=
 =?us-ascii?Q?S7W5yEybLsT+ZLb/jcVRloJWB6EADJFguHEjr7FxWs6YbEfKD8Rc35Iwk8hi?=
 =?us-ascii?Q?ULmLpMM+bdQeZYKaYnT2AP3rNZ5aqB+w4TN7giVgzTqNXFGUH80ay2ePacd6?=
 =?us-ascii?Q?N5kaNLVhRzdfDtWIL5uDEePVcQJd/PmEh/I3pIIbNtLoZ1iZ55hm9/RHyT2p?=
 =?us-ascii?Q?fiiCkXk2s0LIvpaluyvtEpYZvsBPGBdSWU/D9ZDysS9c9KU4UR6hnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6020.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+gNx8EIcOwSZyWnmSQOXI4JOcyAXI7JcRFbIcjhvoVypXR1apPNUFPYPoPhZ?=
 =?us-ascii?Q?sn+0payPR6Cc2P5BLxwJaew83YnAuGfKt8w2O2YdmlAUuSbjZpx+Zu+HSMy8?=
 =?us-ascii?Q?pt2in+OWdgiLc33NrbBIJ2o7PyIgWOhk6OcLYToTkMH90d6qmxahVJ7qJbht?=
 =?us-ascii?Q?lwACsPvhwgPEzJoYa48KG9c7YDt1TxpCA3DcNEMlpO8Gq01e9NoCGD/SKR3B?=
 =?us-ascii?Q?clW8fCipWxo7rZSSwp8jtfUmTcILNVrIvDCIyxsF2JNgukTrLVk3pVy5jG1x?=
 =?us-ascii?Q?gIjc6Qlcw/S9hKFsiPZ9lfOI2b8ncaIFbjvzSAnp0+hZ5/cxovJCypRunahd?=
 =?us-ascii?Q?XSuQFsL8h9jfRDhCWU0Rqf1+C+OAzXXKOb4UW6GV8Ort6RMne5kNFiS5WcDQ?=
 =?us-ascii?Q?kp6HoPAXrTn1qZRv5raH2FhX19pGmmJiF77uE+1KprxIQ9sUy+nH/ohrl8eH?=
 =?us-ascii?Q?rzaPhEZGHsUKP8H3iF0RBHBNrql1dlpIDQIjYuDt+dscERbovAmhDtloI6c/?=
 =?us-ascii?Q?83zuWJfW/K+rCeZGxyYt+xMHeAyXZZhL1VEoBMEpwfmZo98ODD2ZNib6eKxq?=
 =?us-ascii?Q?fUoVhsVRLZCjqTWN/S7+kZ3DIIzPsjv9/9HJ03zjWIF5Rz5r9KB3AfgNQwTX?=
 =?us-ascii?Q?+7QZlEFdAbvtmrLTzQ78b/O1jemUkXmGB5l21xqfzf5HeMWpnGec2FXPHrIi?=
 =?us-ascii?Q?YGNM1ofgWpuWIli1AxRtL2kdfmurrKn1v3e4TIdQHa+ewm3ZZRYVT9SqgYP0?=
 =?us-ascii?Q?RJ0j6Bt34dn4/3gG07HDNHTRoClx8S2rY2AGNvBOLk+yYyXTq9SD5forE8B1?=
 =?us-ascii?Q?EnJ2RsY1GtN4sNtBiqmET07l0v0RTAqWAiyg3bEPGI92O72x43iOTMuTy+tv?=
 =?us-ascii?Q?XcoqKnNx9pfSa6HRaYAl4CnAN0onqNlTYhZTtpGbGoF2RtfZ+/vs6v604DeU?=
 =?us-ascii?Q?myGsW7xi5PWQ23I9OjLzC3LLbxzir6VVUncQlb1tY6/vf1pTzw26m2a2xLYw?=
 =?us-ascii?Q?ovOL8yJVuN9cyeV5M7KnWCnL4h5LP6hLJc3oIcHr8k4WdkHcXUQKfWx4bmPe?=
 =?us-ascii?Q?uvaVcckSZ5BIH+eOf3dz+uYJyyhRufpZu2M7PLc0ukYYLlw+Nzy4D7JEKi5T?=
 =?us-ascii?Q?OYjVYUPjZmNHCRmMCRQjRr/80FvekIp2KvlvyO+zHE54szzWLOkAWkdSZYLF?=
 =?us-ascii?Q?0+DgLl6RSD4PhackJC0dHyDwKf/aL2hDf5ExuUdQTsQEFF6yirJJk1fRwkx9?=
 =?us-ascii?Q?HJbjlkQMFFVa9IMVVRxGtPwHHn1M74semC9yGX0BUizgUNuj5ddmuB5Z9UL8?=
 =?us-ascii?Q?PGtm3ECCpG12QdEYf1wKo3sz34TDgMHaLJMHE+cZ1hvC0jXp5lBnYEwl4iOv?=
 =?us-ascii?Q?fmuxQMwmAexD6GknP6nIlnNqKviZ/lwVxxrgmmqWhukdRuSy8j2jQMu8NGPw?=
 =?us-ascii?Q?iNCd8n99l1W//aZ6jWvWXd57G+kwev9GMg81cajfUIjfaLVxxJoc1voK5Ibr?=
 =?us-ascii?Q?jEJ6LyEw88qDHrUMx9lM7u7/w8v+qp68hZWxlxoFi9lh9J8Krxd/oa2fSZVq?=
 =?us-ascii?Q?avCzZjfnr//aKqg3mIsmuexYdFExI9ShPuUZ8O1z?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0521693f-f750-4360-8bb5-08dddbe1a615
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:53:55.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni3NnV4l5oUpjNeFaMdlBR8zDvpWGfoKLP+V4L6BqEoF9XU5nCUaM1aQqZ91R10H8nTiJehXjENtvkxDVVzAQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6825
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

Replace the original code with a switch statement to enhance
readability and unify code style.

No functional change.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index eb3c28669789..0edd92c513c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3771,11 +3771,16 @@ static bool amdgpu_ras_asic_supported(struct amdgpu_device *adev)
 		}
 	}
 
-	return adev->asic_type == CHIP_VEGA10 ||
-		adev->asic_type == CHIP_VEGA20 ||
-		adev->asic_type == CHIP_ARCTURUS ||
-		adev->asic_type == CHIP_ALDEBARAN ||
-		adev->asic_type == CHIP_SIENNA_CICHLID;
+	switch (adev->asic_type) {
+	case CHIP_VEGA10:
+	case CHIP_VEGA20:
+	case CHIP_ARCTURUS:
+	case CHIP_ALDEBARAN:
+	case CHIP_SIENNA_CICHLID:
+		return true;
+	default:
+		return false;
+	}
 }
 
 /*
-- 
2.34.1

