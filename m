Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094E647C81
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 04:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787310E00A;
	Fri,  9 Dec 2022 03:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC1C10E00A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 03:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TevqWHsU1BTKZCeAyNMej23PfrfhPNnRku4nx8BaqNA+IRgSbGlrj4NMpgVLt3vKqrH4jmPZF9d84nDP3smwsIq9rUD9n5jjNaP68TX390nSprLIfOmDTlon/4sVEAMNHVzPI2wWdYpbaHuHP18QzlaWNFmwaIyYbp3skozt+cXEdAa2aCAsRK3xSY2/a/AVg7zwLU2Ua1hDqYFXqCRZY049x5h+AzJFLoDqTFfEizjAvC9CT/fJulGZxqJUC2AlUY4qvYlSqMkaBNaDTHwxGrzPZu6FxDtLxozJ5VoLCJbhBlwycJuf2OtPxmE1FKOk15pquz/uFvADTCVgMAZVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqGyDSwzXRyLq7yK+EB7/leGdo8XpIQvgV5S3ZrWPHk=;
 b=i+CgOvvxsO48z9fZXPUb1q6SPaqvK3Uq6lGlUygrcr0tyc3RroKWW2Epjuu5xttBzMua10NkReHV9nLEWHKTAEcPcQsKDPwRqgkXQcPaa89uKbuKfaQIEeB9lPk19s0uz3HAzyy/CktMXTvfmUfr86sXq55j9I1HGKRH8uTbPrhUkxBVb3FkDXvj+glDW6Uewk8kQIx1qCOV+rX2pt02XKgcKI1i2uS3uB4ATWG+t9Y9GvzsWJzCvmQVBveT9Rz4vZiD+9X/Ln+ZNxXF3LdE62roUwJkp4+5pc8XN5/9sNK78gWxiCTAk1QFJsQlte/Y7BgsDbKTjjbd9+rKhLYeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqGyDSwzXRyLq7yK+EB7/leGdo8XpIQvgV5S3ZrWPHk=;
 b=Q1+Iwttfwo43IzudD314zgZxCuSqq4eGAgQn2vUHrJpen+zKrO55RU8f9oVulBKZZkVnm21P6eXe79M9xd4Q3cKObv3lXMLQkvcw+xur9dZxV+iBcq+2R6ZjIYXIfIuHK1JZTKRvK7etYxbXhqJiEhRsDX3tIhKVLNetnDvgS6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MWHPR0401MB3626.namprd04.prod.outlook.com (2603:10b6:301:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 03:05:16 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5ace:ac19:7a6a:1477]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5ace:ac19:7a6a:1477%3]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 03:05:16 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: keep last configure timing
Date: Fri,  9 Dec 2022 11:04:18 +0800
Message-Id: <20221209030418.713935-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|MWHPR0401MB3626:EE_
X-MS-Office365-Filtering-Correlation-Id: 8003dbc1-03d6-4cb6-3023-08dad9923246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqRZ9SuXsOT7cfWUQYpqD1ykoPgf1nBCM6EAVDWanbMA1dBNwu0HdLFnHdSD20uLSYuX1DbaDr3J0KfiKkDtBxXNIsbmdbhvTlTwvdc8yXVgKdZYGlOmd8gN0yFdUF4zlwgYpGHTE5ZUtaWj8pRYZbk4PRDi4O2doCmkVRjMRxFaG1Ck7sYHC6WujzgSVfh7GS/Gv5YVIeFfiBVIGeTL0PvZb3jSA5y9yVf3IK3iXwvhF0pP8s4c+q8Uq1D0abePjbvjFD6TxthTICTImJil7P1w+XxqxYfDZBGFfxmrg2WRKo3gG78Y2XaSmwzwZOT8eTbawAKaYXy8NvbC1MgYPlxlIP//f/TvePE+PHXN1MdC6Xq0rfT33ur13GBUjQxQdsTNrykoyNIlx8mPjuQgaaMP2b9CH4BxhGTEUJ4nkTlbgTjzQoaX+zoxuawIGH5f8ooiIQVAExIL94XIq4nao/6Pu39ke42WjNJyIOs9jP2tJH8T67VL3h/+zlta7v4u/MzjysXDFMmV9t2mPFDDlQAe+6DZr9dBhqeA7mKyjWu5yEZ5TCecd6oM58ZHZ7/xMHfIPIcs+hWDhwIun5pOvOQLt9Ng2y62FlddxPTa85MmppiJSwj9FSu4yO8fAr2QmyisLH7vOulzc5zea3IbV4xuAEY4Jey79pCnQZv/ZC7wTpR1qg2QRLZg5y3+5Rk6kHEQDPJanv1z9eo1C8VeEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(39840400004)(366004)(376002)(451199015)(83380400001)(6506007)(41300700001)(26005)(2906002)(86362001)(6512007)(110136005)(186003)(7416002)(2616005)(316002)(1076003)(4744005)(52116002)(8936002)(5660300002)(36756003)(66946007)(66556008)(478600001)(66476007)(8676002)(38350700002)(6486002)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBAzVNP2d2tI87A6vnGCfxjNSFNcB/Am9GiLcPvkTm+QmhJ1YX9aIUJoBTpZ?=
 =?us-ascii?Q?4VDkfEAr4b+SA5Sl7sQtKG6YA+xjcATWJOkg0VDTjo3I5tY+vc2QjiBNDbiZ?=
 =?us-ascii?Q?2zASWpv60cHflqBlVTs5+4rf8UKPX/n2Eh+I9MeBGP/7tiuluikjPZIr1IvZ?=
 =?us-ascii?Q?Wt6juYlHYYalzAjGTWutY/0qQncFxGoUIEBnshJOWKjCgnq/mlPIegksL9FV?=
 =?us-ascii?Q?v9SWZIunlblvUFIkGm1TNFqZ/eKXo8nV+UcGqcU8NpfpSTAbr/23y9MGeoVK?=
 =?us-ascii?Q?pMWQZPdhbbWjyEzII3wbQ+a+H0L9AWc1XofpVM5OM/IsMpW1KohPxd4OmHkT?=
 =?us-ascii?Q?7XdcXDyRHhHfvpx6qMndYrpnJEz5ti977IMvZWhk5eK9RUQdeLyCT00KFgUP?=
 =?us-ascii?Q?ZxrodeiS960uyVDIXeDOV3G0EC+dqfIyyCdzN3tMjHbPonUlekL1nyrhxAl9?=
 =?us-ascii?Q?Tc4R9KPScCtOpcHPJoGLsC11QoDT2KiUUcuVCft5SvBVDap9hZvtVBrMFqLI?=
 =?us-ascii?Q?Pc+ztIWsgKf0jobKSxa+KmrWwGVT7+qvX+fCxGA7UjqIs7VFkdxieVGKMDdq?=
 =?us-ascii?Q?5pI1SFriItNdDxdH4ChdfCuSCIKIMbqX6G5XkGiFbQTWR5dKxNtgnos5qx5b?=
 =?us-ascii?Q?BXaNjB1RMvZMpK290qY9aBqDXhSuOEbsGPAthki6+ZEJzQ/mIUXHGNxPtBZk?=
 =?us-ascii?Q?fIoI8cGcCFRrc/1M1KjfkfkA0Yd9XkTgpnj5f/OSkiA9LHU2GePFIfarREQy?=
 =?us-ascii?Q?gFExeHDOOH1Ei5HEPXufgt3Y1C/JP5sivmSNDQG2bY3j3xidFr4YApK3sZEy?=
 =?us-ascii?Q?TshPg8OUxd5qQqvNg6+LkJhNfgJJH6yNtuPeb0MeyMXTyKgo6XBFU1jk2HfX?=
 =?us-ascii?Q?rP+tXa7+AST+dbkHsqg02blaX79l1SUjQGjcx8vcVIwCvXO6EcXwMlAZOyIt?=
 =?us-ascii?Q?Eujof0GFT7txD0s+NKhvKjnG8pMFA+Kt6YS1XgNt7sAHoJrHZxwcq9HYmxie?=
 =?us-ascii?Q?xZKIRlpABjJii0LkXdSuMMC3k4V8YPwZHsyUzxPR8wVeqSyGlOKuaf2CAcBN?=
 =?us-ascii?Q?XBr1Ic3Fh9ELn8hpIet83tkSNEZlWxeZcboDzBuMazhegu4Jvno3xNVNZj/N?=
 =?us-ascii?Q?W9Xdz8wjFrI+wHvX78HjpN4VgckGhQttSUIfLGNZ9SR5asBMiB384WcjwG6m?=
 =?us-ascii?Q?VdwIv2kLn5/dcB6txudFTP8f7jv3D2SaYP3u+BjVQBuM3202v0Y72UhEn2de?=
 =?us-ascii?Q?pQZMCiiY2BTo5lqmEJrE8o3o/03VAPt6W0T5U+a4MpB3kRqGvRiVChjdkz4M?=
 =?us-ascii?Q?cl5K3fYmsjN2IoI1UlRr4ddgce0I9nIBg3fivuoNmcFfmHRjyenO2KVp56Gt?=
 =?us-ascii?Q?SNlUgGWNvbj8CCbTVPQVVC2LSv6cQUXnnklc5XI75hY4Bezb+jeIi2a8BT0R?=
 =?us-ascii?Q?mid4pN5ac+pha11kynQ2lFLkIHBLXXRW6LskJBw9JsRq1kJ55zHzyu2jbxYc?=
 =?us-ascii?Q?zfkpddilfnGYvwXX/hseUHr4U2Tp6voGJrZM0ukY8YGgIlXORo9JnEYiL5Am?=
 =?us-ascii?Q?WfwFYU4lYMfiMBU4q/eZs7H1KmFXWX36PASzrNxD?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8003dbc1-03d6-4cb6-3023-08dad9923246
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 03:05:15.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3VDOa/7Lzo54/aP1Veg28GqiPaPA2lQ+5gKBr3ZSNNI1OFYrZJPu6SrBdprRjTK5sMLhBThXvoT2YWOV4VZ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3626
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
Cc: linux-kernel@vger.kernel.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes kernel may resume back quickly after suspend,
and DRM not call .mode_set() to re-config
display timing before calling .atomic_enable(), bridge
driver with this patch to keep last configure timing.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a5..eb9116503b63 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1403,7 +1403,6 @@ static void anx7625_stop_dp_work(struct anx7625_data *ctx)
 {
 	ctx->hpd_status = 0;
 	ctx->hpd_high_cnt = 0;
-	ctx->display_timing_valid = 0;
 }
 
 static void anx7625_start_dp_work(struct anx7625_data *ctx)
-- 
2.25.1

