Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A718D5A02B2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2418C75C0;
	Wed, 24 Aug 2022 20:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD08AF695;
 Tue, 23 Aug 2022 06:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJE4wa6T7tAavbtzuQ84ZWk9ySJ3buLk1TMV5o27seRJnWvo49WxpkifRW6kza06EjrKxYsnNEBTKSu8IaLND7+k2/OdVeJHP81a/C27yVFOxanP3+jgQeDuzL4Q2WRXFzwKeHQjWu39TNyDR2fifC7sgHhVeBmvF1+cUga6ycBW4pi/RdYCwLA4oom1Tht31KF3153qgt/2sQRt4ilCPr4CjPpBxrOGFZ2leyuWpyvt/uhNYRa+QnHyijD9tJ1Y4Xli1BKDH43SL44fJ6j+SdfoI2Pb7/YwKxRHE3GIbjBSDwPh9p4bUdFuhnBW/AsoEFTsx48l/olm64+YO/X8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCzERmU4tZLX+SaLWDISqy1obxi2measjENwVuU3dnA=;
 b=SuB3zvoYdoH+8VZNnOIV4SsVlvyZUFfKX1wikw5/6cj5pcDmTucwy5I+ik9mzJcuQWen2GJoFZokrw9unSAyAM1cBcqcFqarOr1j03DsEl7/CERXo6qkI588ZH3XVUR22Ms0tQI+FBeZDSmlVZ6EFKeN88klDS0/laGQT5iAVJu5pxlkWsCbLsveii+L2ypraOzC5z/zHCZLYOLRqC8aOedBqEpA6JZAjdacx2D6LmWmdhI+WTAorRogUMFcAwPU6d6V/gHpEHlx4G7JVdwwiqcwAOfL2H05ac4qRnik8dPl2VM+0p4gO30PMIo6V2Kw+ma2P5hYrzepF04rVYMe4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCzERmU4tZLX+SaLWDISqy1obxi2measjENwVuU3dnA=;
 b=BYZ2m9cPkC/am8PE8ltGJ9D3f19fevwY6Dz6FveDHBq0+ygpmga8G0FH7Oud0pUJ5KDqiOOxjTYboGA11XPcpXR+zFc7TLFm7rzR0WarKFKN8p7wJGw+5mZNhgjwBkSu9PL3vWocs/HG3qGjCeaTSGZ6qauFx/N9MbXT2vScm+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by TYZPR06MB4269.apcprd06.prod.outlook.com (2603:1096:400:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 06:50:20 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 06:50:20 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Melissa Wen <mwen@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: fix potential memory leak
Date: Mon, 22 Aug 2022 23:49:56 -0700
Message-Id: <20220823065001.16872-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0284e37d-a9f4-4aef-c2de-08da84d3bf16
X-MS-TrafficTypeDiagnostic: TYZPR06MB4269:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGb+Gv9Wr3K5hoEwqM6zdlVAMdaAbzpztJzQIsptWfQhysh7kTCS7SOQltYUJua01JICHlKDPRrQ7z8yv7KdqyosYfvXpyw6rx9MjNTBd944OeDxapfU53S/5UGJl5y5K+4F8Y0tG521sjAKRBhfcdQWmCJxBaQBwFNLTYe4pl54VVzYSrLug2aGPpx09hfvuPmDsoXS7Nd5dFLh9zbES431rRlwjK6Gf4d0+WnHznsXeOTucFvf/9G9ju0SN8p+VAaKOpSPWUgeJnrimHvr0bwQ4L4suRGIwVNLYQsbxWBzjK59+WStVod/Fcm66QlG4NX2Fnz04+17dGBvruJqZ0nU6sLVJKjYgi9KQA/d38LR2gkINafKXywB2LLSD6kwrpomqdVDY161Ua2AJiko1Ft0LNWKlefnqEJ1krDFKSiHTpSf5Li7NW7uO8mlmF7qYydk1iLzvCQOOkBXpo9aKYhbonHOtOUUJhcmzmHI578jy7GULqZ+Sm+xB/HAlXz72cSIoeYbNWg7R2TWOimYEKTG/U/fvhkUPbNSQP5rf79NCmzIFLs8i1rVxebpBX6Hwpt7K50NvzhVYJ9iUoj+UmFtjHKqcTbCPtsOLCpBBw7Ii13ljQtPOn3KpIXEYvu56nYmQwpnBUQN8uYpsHkZaF98sKPrmIoyNEVzjYtlpIVS4cZHL/sfDl0aWifyUTAbW2ZzWi11PQ7UTVPmbNmuPBFXsZarEGadefvnJ/1SHJQsDMyDGLcJguvtHer5vYCMsl4w/UYQ3IsxwrbuQLl9ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(2616005)(1076003)(186003)(921005)(38100700002)(83380400001)(4326008)(38350700002)(8936002)(5660300002)(8676002)(66946007)(66556008)(66476007)(7416002)(4744005)(2906002)(107886003)(6666004)(6506007)(52116002)(41300700001)(6512007)(26005)(110136005)(316002)(6486002)(478600001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xtpYPKqDF5St+bbx0Z7y60WFycyVJOdRuDprDf4rt/wDY+FFmsI/LGBGggJV?=
 =?us-ascii?Q?XEjmfs1pyNlN3Pc8GEU/WIhmEkAYZP/COo4F3WIFgVUrmt+adMOH0JatSs2z?=
 =?us-ascii?Q?NmfuLMtL1hyDRZwyW2hkdlAztnRXMWZosmvKuzelGsbmlSjkJCmuPoP9y/rn?=
 =?us-ascii?Q?PvGcHrOE7Y0v61X5ipRtG8iEoC/UtplZercpNBwa3qNQ7fdb9LewtmMH14Yn?=
 =?us-ascii?Q?Bp67oD9dz/pE3ajg4i6JBAfJDyPTRXiJtnqPHPj7uUvxkFc4DP7AeMrgl0CD?=
 =?us-ascii?Q?nyEMej7HUiA1yiqtxV+5Tu6c1qO8sRxxYVWcNMxKYg6XiooZ6tnjEcCxH1Jh?=
 =?us-ascii?Q?EInzZ5Qjx+Az2yEkRT2hYgQUETMo9pdZzzxxRwgFDek/k9ZN5QpHmspnXxMh?=
 =?us-ascii?Q?1tHOfA4Nk2oJYvHDh+8F7i9AUWPRM2mTNiSCF7/A9s8+7ulyKifFilJF0BB3?=
 =?us-ascii?Q?i6TGlhCfIgnxfj9F/rGsiB9BmfgutS8NSyLutCyYnq5UWAtLUg0dRHOfD7oA?=
 =?us-ascii?Q?BNWrVkjkw6wKBPfbw232l1OKSd466aD3N92HaEsN4HAbxBVWxA43VZHm3fMT?=
 =?us-ascii?Q?Mipzc+YM7nhXNPZOFFCiHnavHqMKGgNxONZyt/UQzDnhlKyc7XHdtQxej08w?=
 =?us-ascii?Q?GNjFjvO5HjnyoS452cxj92ZYZ9b5E8qJSqIVUEdp4XVaiA2JvGRdfTABL+rF?=
 =?us-ascii?Q?NlE5+QyyAt6b7vwValfaHh/eXSmEPQAq4JIhVxqD3xyybkWCUPAyw6RTu/a3?=
 =?us-ascii?Q?nMZ7eUAipYmwdp8QSR8GXrSSJ55XysYIeC+Jqz1cQqjZ1zCjcjn2yqLoEAJN?=
 =?us-ascii?Q?mH+r6G13LZ/eSoISYoKsLw8mG2pC6g04C6yJZNbpcu8ZX66nDPgHwmx+H7wS?=
 =?us-ascii?Q?3bzC36Vo2CZ2knVeJ98hOFzi/rofyErBbnvMrRV0SYMr2s9qJySzeXc7DOvm?=
 =?us-ascii?Q?bo2XakkS2ojgH5Oz44uEB0TQX0mFDKTNvmFuj9edwcKG7bRP/hFRIXTm1FcK?=
 =?us-ascii?Q?QFIBkjn5pAJTeeXozynfqhKPtsHIFBqgmokxpCkS/Mk91dNqjCtmmgTH2dAP?=
 =?us-ascii?Q?FGFHfNRiXbs77lRFjl7IU+55+vqr7bdERiQGrju0b+p7zRSLdGbZ2zS0Dteu?=
 =?us-ascii?Q?YOYzzRmoSoXZ7t3elFsb89MSHNK8kG6p0mzYqstow23lWDpZkCD9yJ/ex54j?=
 =?us-ascii?Q?q6v+E+GLCc5mfOFZCT1EXqFlBPMzdn0S2FZCLRVlpHSLMfkeG5zANZ7kc5jt?=
 =?us-ascii?Q?Lh+D13gt6xuwtMFQqg3icDwuYseEpeUrBRcrKVgYRBV0oitQdrnKVchTUnvb?=
 =?us-ascii?Q?Ten64N0CVhCnOTrO2Hok8iGXD+bMSTCkQKWvDrYZqs1urjBGlFR7LxkbsoJP?=
 =?us-ascii?Q?l5VYIBmwtLmlEcTBrUd/tY3IIiq3aymzgELH1/1c2R82wphmkRp1DU69grF7?=
 =?us-ascii?Q?cdkls1egBcbh3Xa8XMzLYUIaYxAuu5g3SRB2spR9/z97K5bR8lLCF4AMQzpn?=
 =?us-ascii?Q?mPtgMakz52isR5IHDzIjp2JK2twOJklzJQblZ0iGlwP3rQdMpIusTiMvZA4p?=
 =?us-ascii?Q?iAZ2u3DvVMC+J+l/4svLAvxuRFD4NuAgBO3EwsGk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0284e37d-a9f4-4aef-c2de-08da84d3bf16
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:50:20.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbD12c8tRZxlAxD8jtRsfKKPwO0xI7DV6OIglPA8JGISdvfu0i9SZ3h7ItlHgHInvmUM2Mi+/UnS5m8bK0Fn3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4269
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
Cc: Bernard Zhao <bernard@vivo.com>, zhaojunkui2008@126.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fix potential memory leak (clk_src) when function run
into last return NULL.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 85f32206a766..76f263846c6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -1715,6 +1715,7 @@ static struct clock_source *dcn30_clock_source_create(
 	}
 
 	BREAK_TO_DEBUGGER();
+	free(clk_src);
 	return NULL;
 }
 
-- 
2.33.1

