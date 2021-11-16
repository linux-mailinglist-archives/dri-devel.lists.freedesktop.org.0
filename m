Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189F452462
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 02:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CF26E0F0;
	Tue, 16 Nov 2021 01:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2110.outbound.protection.outlook.com [40.107.255.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34F6E0F0;
 Tue, 16 Nov 2021 01:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPjbCEDim/dxz2weDma404lVAmPyoe6QM4YLXVX0dEuMDY5qfNrAreu5+1z8eElyEChUT1Fhp87Zxiqu4P7p9r3VBi1dbI8XH9SENUbFNNuJo4vaLjPzba5s0Hn5ja8FurrJHvWT2pnRlzRVQqFABbLIDeq6Y69h+x8+uIAMtG/rZYEZ53lLMdsszhl6Wbi+lpHQL3WBMSGhBlG+v9Zv9Ru1BuV6v257wRQCVeF+Jm7Xf19O1SUV+k1UCwdiAJxJpbEWaMlSIMngVpWHsgqV6VIkjA0cRhNLBVUUH5K2ERm1F/5YmAAMBafRQzfdyjGIiQaDEaZ28fuRyL7hNjO2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7z59r4Z9n4Den1olwLxXtA55E96yIVR1m+NhzdO8Fg=;
 b=EmFpH5s6jXqbQkrmCXRISTp5mEDBkexO2l5Q4Shi7ZxcrMGx8sVgTjFGsKTKScjzWKuZGX4ESa8VXIYGVz6kjDxnAcpcCyZr9a9BeZL4i1mTSG8g2On5CZ3GeI74s6t7yudFFVnSGFJ32JOfNk3xr41FCpq5nyO53X9Gha024QXcy6q2xXOECnB8tfJw0s0Is63gfAT3n+8ZtRVCiFVMYlMxQ1VSOI9qGvtE7Pkl27M0FrcRLmQ8omYoVjAD3mcTilx8K4uCIvWZ+UcWHDPDJWQHhUk7peBFa3N374hl6KWxpI3ZzTwzAsC5QhlM0WMydlShiRn5eYNmHaK3ZZz37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7z59r4Z9n4Den1olwLxXtA55E96yIVR1m+NhzdO8Fg=;
 b=mhYmoUfeVinxS2edphD9QYBU48OXtbMidpK1RrD81myxhkDLOFNTLHFuryjwEWiaxNWhwksyuvAlAvPTGJ1ysHbgE4XO5tfn4fy2dUge7d24Lp6ihAnVqB5BvxuSxOtTLCLlA+19dkWTZ+bhU66FDJ15S020LDoXNfRNLMZGPfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4359.apcprd06.prod.outlook.com (2603:1096:301:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Tue, 16 Nov
 2021 01:34:55 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:34:55 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Bernard Zhao <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: cleanup the code a bit
Date: Mon, 15 Nov 2021 17:34:35 -0800
Message-Id: <20211116013438.26517-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR03CA0065.apcprd03.prod.outlook.com (2603:1096:202:17::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.15 via Frontend Transport; Tue, 16 Nov 2021 01:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e1d882-0446-411e-1e39-08d9a8a14aa4
X-MS-TrafficTypeDiagnostic: PSAPR06MB4359:
X-Microsoft-Antispam-PRVS: <PSAPR06MB4359008B00185742F0757F1CDF999@PSAPR06MB4359.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXqLOtbsPHc4GdUyuhTrwJXUEcU1JHrzIzcIzg1o50jx61UwnevzMn7Qc7KOUYcEenRBMGWJuFEJgL3pJ60xCgfwS7WaORwGGRYbNyHnJcracY07kHMol810KeoGJpVTZ/8Er1J7kAE/ZIRESkWSOk1SKzKWqYlVi0z2SlxILKkmhEjN5xGSMoH0zcI72Xh/jYdGQKxCWwu1nx0DZ1Bcg5JOhTkIgI5H2EoMpwdrBbojU4k/uw6UyJxkt81AjkCtn7rKwOJgRzd3Z65TMHuhi/+V0InOcwQV3AW4pGgT6s8JBH0xHrWv4159VRK39UOdCtrHU1XTC7xcblU38264WERwPBXUilN8infg76ozq0YwIQgm8r1dB/lp0WNR1hYxao/SXjDrIDyVcVHnVeffQyIY0c8gou16UDL4S61uDxD+OghcMOdPGBlFLhoodvPcIqZMflc/HCZwuc0BUv1lEhGaYqhpgprVf1U4v8qL1SXjifkakXCVjts+61I9agWH0FiQbMjhHb7Q+ZlFDjvuVwfxxUrVl8dspDUG9+B1HHEzYcjVYpIp1Owj6aQnlEuUgXDB6KJR4Ns+/zlCxV4B8oa5alg7ryGvB2r5Fa/hpXIskEfeqypyvx51f/VihfX5qeBV5JCmMdVXWsmwR/o5qWjFsFqi/rOtDjIx3Y0dHpyiExshFo9oJrkK40uwJBZU5E3kBfDxmwMNLmcsvBsBQfGhVMpErnl70ChZOyEkSuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(8676002)(7416002)(6666004)(8936002)(36756003)(110136005)(86362001)(921005)(38100700002)(38350700002)(52116002)(6506007)(508600001)(6486002)(5660300002)(2906002)(66556008)(26005)(186003)(83380400001)(6512007)(66946007)(66476007)(2616005)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1seUm3vgCIn3WXvX6rtdROGsRYglHCg1rq9wscj0+AEBxfOnp/tdXs+H3Mc?=
 =?us-ascii?Q?LqHL2RjkZm70Az6NsmGPUocKipsqL79UcnExjGceMazsV6tti8ELUlqqhveB?=
 =?us-ascii?Q?KwyB5vDH8Ysc9HtrEhZnHbsU15qi2Qj2jrbRAA9CWqu8bXE+sXCIftR25AQP?=
 =?us-ascii?Q?PrC4+YDHyhZ+eHcX83bqBl5afk8GYncke9UOaWKQ290bw1JLIXyyxv+l0Jl8?=
 =?us-ascii?Q?LiyAo8tZsEEBs++HHPq0CxRJrjjJpAi4hseVgiwAyUY7MLo+b1ZooXjYQXOI?=
 =?us-ascii?Q?mwoup9sFhI8926+lrw+YW+4fVgff4jgk8Qxf6Jwq0Yt4VIg6HYt/3o2yErSB?=
 =?us-ascii?Q?tD+kn0FXoxsogUBiZrnzy17spzqruUq+LGUvSA6H0iXVGkvpclYPGURm6Fa+?=
 =?us-ascii?Q?ThI7QfNTbQxux2m7VkfPqcmAub/ivrDJHxGyXgfFcp/qbCVuSGofK1sjUuOc?=
 =?us-ascii?Q?Yq0jycKW3lSV2jK0C6baH+3hogDydjk5BjPp2sJui2YtUviBCeUD0WlPrrhO?=
 =?us-ascii?Q?SyDKX2kI0PsJYEzenNHcVOFxDQIeEEfsYB3xZ2hrykjtwJdy2uGbVHhOnFUV?=
 =?us-ascii?Q?hIpPLgrsRUs+UA8WhUtNaJIlLogjydiEwzhWMA9dE2Rxi/KTzQ33eMIh4AI4?=
 =?us-ascii?Q?RuUnSHDqw+t63fmaXhgAl/Kw9UFpfgYMsFRTLuhxA1hhq9y7oJ1pOqaggKl9?=
 =?us-ascii?Q?hTVXg0DSKsZ01tOEUVNoF3Qnjh2w2rsylSnVnKWtLKvFTH/kd+YabgAwgx0g?=
 =?us-ascii?Q?9l/WDgQl+TDvcS++4v4R0H+tcKsz75k/CsIYTZoEFrlyclwVUF9pT4iRZhvw?=
 =?us-ascii?Q?NhF1QWDOds9COg5l9qlRv1pI02c8fbMqjlU6vJf8q0kVBq+cwGLAfCwSOsqB?=
 =?us-ascii?Q?1xJivcF2lprUH60aFR9K52HhiTuYk7NrehG3Lh5l4G1a4Z5QDLKbodOXC1mR?=
 =?us-ascii?Q?dhI0fqd9Jdxrid5cZMmody5SSrGFijT57qWOQY+aKXlp4jLGk6HUZFXt00f6?=
 =?us-ascii?Q?UbdDWM6kpL/7M5tLLjTDRQDNaWzxbYS1MV22QPl7xO8CdHMdNyt9ZokCkN7N?=
 =?us-ascii?Q?YhTUUdGAK+cJZos9GRpVDBAIE/BfBGUF6wm/mYM6b7YwSEpMZSVtUDp2SCJv?=
 =?us-ascii?Q?VzMgG513AgXHDotwyyS7QcWlM43ZEcAjxkiCYfBBCeODVg/7XHjmN05sXru6?=
 =?us-ascii?Q?tPN6RvyD2gB17FVvJCl0RQcevuA+vJwvROVKIbHC6x6rOWb3QewMxMYGiXTo?=
 =?us-ascii?Q?Ugorknn304eavuRsO3fvKDvGYeX7gv7KKMyLf+rYI9FwZ0O83CHegg5sRSWd?=
 =?us-ascii?Q?t/s3SQRM4xL/ulW68bL+Zu3JFpU6HWjSCtfk3lguRy22OaUDKNP+9cZeDtJH?=
 =?us-ascii?Q?COEEfqHT+IyIwbSF3j8bq+nkOeXo+HwVCNNHLH1H1R+ZeHH9dFqZZBjl75b1?=
 =?us-ascii?Q?tbSE5e+jRfaPc/XiOoigpIn6Mxqpmhl+4SNbXzTEFSFRN0ohVMV4QpiikDC+?=
 =?us-ascii?Q?kEQhgihVvGTD5rxHD1WbkDlYI/R/eG8zS9TDx0cCWLnHumlDo+Y/XtD5fAev?=
 =?us-ascii?Q?lmocBdkbKsMmrlv//Q40dCGXv7uKQ3MZQmPv6/OoCocBmNXvgMePLAFBU3Ny?=
 =?us-ascii?Q?/67LgVbkZP9A8dgCeUfzD1Y=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e1d882-0446-411e-1e39-08d9a8a14aa4
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 01:34:54.9925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYT0L9lJZmp2XDuJu1ZplHZ8fZd8mdbygU4XNEvyxO/afRbGOnidw0yyV2wsUWLMQ+S6IzDE/c1P5Z7DfcZm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4359
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

In function dc_sink_destruct, kfree will check pointer, no need
to check again.
This change is to cleanup the code a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
index a249a0e5edd0..4b5e4d8e7735 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
@@ -33,14 +33,6 @@
  * Private functions
  ******************************************************************************/
 
-static void dc_sink_destruct(struct dc_sink *sink)
-{
-	if (sink->dc_container_id) {
-		kfree(sink->dc_container_id);
-		sink->dc_container_id = NULL;
-	}
-}
-
 static bool dc_sink_construct(struct dc_sink *sink, const struct dc_sink_init_data *init_params)
 {
 
@@ -75,7 +67,7 @@ void dc_sink_retain(struct dc_sink *sink)
 static void dc_sink_free(struct kref *kref)
 {
 	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
-	dc_sink_destruct(sink);
+	kfree(sink->dc_container_id);
 	kfree(sink);
 }
 
-- 
2.33.1

