Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAE59D159
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 08:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6DA2EBF;
	Tue, 23 Aug 2022 06:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2096.outbound.protection.outlook.com [40.107.255.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA999BA75;
 Tue, 23 Aug 2022 06:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSc2oSSLV+x1acIpNXCOopNk4H4+QES8Tte7/+HTtkilw9Of+TZZd3lPaKM7B9ZS37V7CE9ilwlPdTOOQujl98RPlXy8z+KkmZ5VSCLnV3qNdbnTC5DvBni7KkjDb2c/nbMZqGMYSpPQtgJUeQScBPgJrEVmRaqh7N2UGynYwLk7WnxVfPR8JZ17xlGSQjNT09oZAo9MjcRtWgXeQgmvcCxEs7MjuLOblIDDpwHuag694ax8L1CyPIfPqN8geuiyJB5rh2D2GzSSphU4eWYbrM9vdkPsKod6d/qq7k3In6CeojwRWhdp+KVHZahP3kqveWTl/9XokeBKKrjd7d0d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5LUovQccpJe0MFDSDQELkAf1XhNXuiKvAoB7LUXlS4=;
 b=FIvI1V9qsqPAQOsTuUwwfjWBruzVb+PmyOJhshfbTMQayxrtwOuqwZ/CBvizRFPBk/DaMifnk4yqSDIPHgMrpZWN7alhQkGeFYHZxb1jHWJBneLJ4H+gt55wpav2VCxnctfx00MUo53DQuY5u66bOcxwQgBDADzt5nTg/3jw0e9ZGlyDmuLn4Ttj/V+4YioQp3hiTD0L4Js/mkuMgplxqBbRUCS27xf/cgdx8RdklsxyU2+pXNnBuDPahouJ053q8KPdlAQ82/hfGOmp2VeGDDEWqPuPfGc5COrnZzxsOVsH5zqz8U6FtT3Bcnkid3/+uIsHSvhcODq1zyHhH4GyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5LUovQccpJe0MFDSDQELkAf1XhNXuiKvAoB7LUXlS4=;
 b=NmaR3Xr081TZEljpW+VJQwANjeIc3w2tKoJmAuplhD3UND7Gpvmc5pUvrv9mtyWYluZMjErqczpslzeOYzXwdBUBCfvd2gpiWehLFJoUaTWxO25U8qcnUC6ehhJ5XP33ymtht/p/QR2wmcyArqe1/cUwAqN7yvM+PDrp6gNgUA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by TYZPR06MB5027.apcprd06.prod.outlook.com (2603:1096:400:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 06:36:01 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 06:36:01 +0000
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
Date: Mon, 22 Aug 2022 23:35:24 -0700
Message-Id: <20220823063546.11499-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ecdd4f-083e-4df1-650f-08da84d1be89
X-MS-TrafficTypeDiagnostic: TYZPR06MB5027:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4vlntq/G7aNpcLMzSlbhivFP94u5TM/15YjE7kF9Hj12WxyNTcSnWNPS6NPSv/gOtygfe7ayGJgjYgJel1rRXvZ2JCM3J1Y/4+7NH1BZK1ruqu36BfbCzjzIaweihfGoh4mafgqK57WXn2SQeZa6Q/0XjQfvxoY4IrqxgTr1vEsPkHvqQE6c90CXDFuQ1l/kS9pxbvVTiiV4L/11l2KGGzkzzC1Vu3g0DE+n1d/jxeFgHujAhMAvSZ81a9RJ2Ggl1M+8Z0GjKEUfdm9jJEP48NpNxR8HgtAnu4+1mczHOacB+63kYDktGVhuw5v1QTw/17QvFPObrTHQzXBCIdk0La0yrdwoh1YcmWbMgEkqcDY1H9rvALPCpJ+SvxI+0Q+LJAnStlY2EhUA4BqPYtTh6U55M2RqtraKqFXq996y/lJSZ14dhRPDNSMgcF5e6FUbKDZYT0k1XmnOivvY27I85iHqYvG1rs5CC0JG4JSBBjltw2rrF98Mw2Ok+Yjhken3ZSl4qfm4ArO7hWVMl9wyQgjjER9o2k8k6AXmAAvZSNCJVLpM7yLok+lflkIiUpq8q+qoOtTX7KKywTfOU34fbqb9ysvkn8cJHTgZXIB3oiO/q8UtGwXFAhH1PULB0WaN+IG0Ya7d5iPslwXSQs6GKYfwmnpceq4Ql3592CRkh3K7dS+aTeB8fdTe483s2dvPUUqZn9+B8gP1wVj1/8g7JilpWeciGQf2wRE2g66WIoXYu+mdQwWsM2jXZ8mZNFIm0IGU45VUND8dg7TdUOvSbF2oNpN0cEVl381fIyIU8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(66476007)(8936002)(8676002)(66556008)(4326008)(86362001)(110136005)(66946007)(38100700002)(36756003)(38350700002)(921005)(1076003)(52116002)(83380400001)(186003)(26005)(6512007)(6666004)(41300700001)(478600001)(6486002)(107886003)(6506007)(7416002)(316002)(2906002)(2616005)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ECkGCgwNMvetFLaAxHm9ZHMLAFavJENmWq/f9hWTRCcUAii6fk6t6A+kypVm?=
 =?us-ascii?Q?/MsU1uTBr2CPIjb1KTBdfT3AiLPqPPuAg2O0w+HAbduuJew8KgRDucYa1Rgr?=
 =?us-ascii?Q?QgAq48sbd5hlzDskr4v/5PEoIh3jthjvoq4ijWS0G7L2udz/r/tG0I6GlUX0?=
 =?us-ascii?Q?cghWChlizflekW3LejfHFKmYfMefFvvtuZaTsYtDXXy+7tpVGfvaF1lDcu3k?=
 =?us-ascii?Q?xSk5hdZ3+VSvS9JweJXrf3MbCMcNDsx52XXr0YGgcEJLABl1Qjf2vI77BjCR?=
 =?us-ascii?Q?gs/9G5nD19sEcIYTmx88TtPkVmkVnujcr/w75dvfgmPsrdyKpaISur3hmT5R?=
 =?us-ascii?Q?guUYIgsfdbqSvD0zP+DKyi9Z/c0zDyJpT2u9xwZlQhr0hQvCdeoBhx/gHzas?=
 =?us-ascii?Q?1RGViZRwbenSqiuxw873OooolYOXYAy0lMY/WkL2EyYBRFCvN0Pkj6OgA/lX?=
 =?us-ascii?Q?1PWEqqZJJriUlfMNvo5keoqkEVDYCUlydr9vqn5jvqlhKiAzl7tV7LiG0vdO?=
 =?us-ascii?Q?NPNi3auvPze8tze+40Eni3POc6APZLApFHzlYQ/DlP9kRHPwpHJM6xBowhJO?=
 =?us-ascii?Q?EXGUJgDE3mcHtchyxyeTn+F1diTCNKi2UY/UYvXf/0RsKS+pzVCdZmdeyMHs?=
 =?us-ascii?Q?t0CdD5srVByDkvT+8gpvfcWPQ6J/Ffd+Ht9Iqlp4hOehrjHfS89eLbblnE+C?=
 =?us-ascii?Q?FPj6GnigUWbTnFeijsN1+2ScRn0k32Up+QIE7y4MCKZxdF/DqdZdhRUV7WTR?=
 =?us-ascii?Q?ZlhF3au3LpR9fDdwK94Iwrv5kiQ4TbKvAemyyYw1DmpSS7X622pxF4XjeWOm?=
 =?us-ascii?Q?gGApP2HHOLdu1I5YK6qi+wx4s5WXVqvyXTLgA9oqZ07rFDjqi7qDteSx+UX/?=
 =?us-ascii?Q?Yl+l1bpG3TfJ+UFHsEl+bk0QP20abrP1rFci2JB0KDFe69nOO3zuNRKoj9TR?=
 =?us-ascii?Q?MO7Tpdy59Y5DdXw37WOkzUKDn1k/TleM/jDaMdcvmm2Tu6K1cWhWojUPo1+F?=
 =?us-ascii?Q?ZxaFrcLCZ7E5GsL25emkx8S7R3NJ7NE7UXY66+fK2gTHpD9QSUXubtBPWqrL?=
 =?us-ascii?Q?kYI8fBv1nDvGLkz064F6Iiw1gHNXMXB9d19PKHHryxNWSuj8uO4iBcpIGChm?=
 =?us-ascii?Q?KPIHbwbspVz6SxyXbo9aEFfpx6/IWIXX5E8KydTGsMEVhA5QLaqGg+l/zPgr?=
 =?us-ascii?Q?T7zbMr3UYgyVPlvwjuy7tErA10DbAgZNGZts2nOwHhKyV2k7mTGIHxV8c6tC?=
 =?us-ascii?Q?fcYS4P2AgIPighUfRcQ3nV6ANutc7ai8wUv0CXZ2AGnvqQB5OazgxJotJ9xR?=
 =?us-ascii?Q?WqAA6Z2Cq3LQJfjHn+SdO45KoYmqqoMwRVrR/wxDWNOv9HL2wl/5MWrCKjye?=
 =?us-ascii?Q?mK0Q/0E8tBwNCpv2BGZRwRAeB2DuirjmI3HSWpGTvL7cQl8l8aKJJUoNZ5+I?=
 =?us-ascii?Q?M5rEK1RZrBPxw2URjXdvTmvp5mg7UiVYhpjybHTvJSgIp+yJXRc3GOMLS/7/?=
 =?us-ascii?Q?m6tB3CMH5X+BnT2y0gSLTmmnVGkTGcYZ4UHql1/pSnBzcz6Jr45C6di6rrYH?=
 =?us-ascii?Q?T3hN7MYG1Qo2NDMh5b8SqLTXn83Av9kfhWD75i4S?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ecdd4f-083e-4df1-650f-08da84d1be89
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:36:00.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MQvWH+2lviSWfbYCwOa1+Qr8vlBLrN04eZiniW5ylXAd2hxJHED6nsscMSLfMP9pTo/7XdsQEXYoHMckkn0yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5027
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
index 85f32206a766..c7bb76a2a8c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -1643,6 +1643,7 @@ static struct clock_source *dcn31_clock_source_create(
 	}
 
 	BREAK_TO_DEBUGGER();
+	kfree(clk_src);
 	return NULL;
 }
 
-- 
2.33.1

