Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43B74CA76
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1E10E13A;
	Mon, 10 Jul 2023 03:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::711])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5710E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+NzCP0bnE8n0PaBsz1q+DSQ69RF1eFQ97XTrrtY7G5yzTvJaPL9nfwH0NdR7BC7NsusDNQeA4ZqF6+YwVuWli7Or+GdVOSe1Oi13K5r1VAKvNdG2Xop8K8yWauIEzfLVxizz4vf0qDu/tDbKsmt/V1SWCkxP5ZjjOD+LE0QibpNsY21aZpPvkpez6Gv+3i/1tzjechiA6N2JEUTV/S8jswm3jsjpup1zErwpluHlbxz7rvDeYjlHpQtgFNLvsf0VZOnUZ+C85y/xgtgteeiV/s7E+hiE+I/DR2AQaV1ryCt5XtClKgPkpPw4t90b5hgWONqCoh/sPDwZYPmf+nXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S52aLvA9c+8fTPEUxbLQzNSXjy5oQ4nntTQZ5ZpRTG0=;
 b=gfZaRTJ1VX8MDGScO2nDaTS87842zALi3pXUK+7aTEtSPRLB5CNthZ4SyJVEe0M0SDU5L/NqSW3syEncmmNGLdpP7HIhjLWwmia+/yK2hlNXmQIyN3VKUIcnuM/PnJfIhVxU2P9rzpAxKeW5Q2Ht/LtRSd59PFdGldwZggKaPELR62r54kzOZlX2Hrv7Q1Za2z0AFynS55MeJU0jPCVJui0g4PV5+WQhf4hws5kXjLyCxcsoj/ibiKMa/l8aMjw4gj2l7PaOD/TZroSo6MOGQH+gs5nnVa0e7gXa841BpSmH55Us7/WFKT1VssgqajqvMoE06vVqI49Psk2AvHuUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S52aLvA9c+8fTPEUxbLQzNSXjy5oQ4nntTQZ5ZpRTG0=;
 b=YqJ9OJdbB6V0dRwuQzoPxXHMig10wKRxlDDxRV3k79GnkXyveeuZ+WUwKyFG/CNPtspNe//Hz6xHCsWVY5fTI5I9O0SGGAbXvuJPCToEVXwRngCzyfXuJ8uqaK4O/OtrBdRn5Y68SXGwWFl0imtINqydopfsHFuI5W46jWzJndjvMb1Mgup4E6GWhm+4au2Wnw/eFePwjbR7uDIbJmRcfj3+o6YgIgT8my2IYPANwhI/2QcFzOE7fUJJFwKltH2dkPL8tD9P8at82Atpqms0kTySyawrxfisncGPDng4ULfLUMctXhga2s2j4MKIgSudKO5YdhF9YVY2RtqKvDkULw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:49 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 17/19] drm/rockchip: vop: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:53 +0800
Message-Id: <20230710032355.72914-17-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e345589-dd43-469f-8102-08db80f53771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaF0cTgydX/SxdovBwfb7iShSrsFD+YNm8NNRj5l2umwgO7fl85NSrzqTOF3R3TLSTl6SM3Uad2C06WpCfXCd0+wmEgqb1FLM+lYZhCFnB7BoAjXCxQ8ped2yOuj2ykMhGfPpjrtpq7avQkfCeMw0R3lFiKeQA7H2hIL0ltQQ7fohYra5uxSKCvhWVWoMMSuYhwIBMSBj5sGVZ6xcxpzEOYBw9xHKxV78cJor0uOyNkosnp/i8aunmh22Ive35yEQnJSsQuj7hw1lOC6tS1PjHMH3RrDc+85t0rO+KiRSFqf4bQJQ3p2rtub0CLSC7WLL0tbVFHSo/bCKF17iZWHFLYrXPs3DbMLt8SDiFNPoXvVlug7tWE0Wjy1UNYMsuFH5G6r/BoNSGAIuLt/qL9C/9mOdxNgPUmXpa4s+CZCZT1UEFNfTbnVBd8YpYK/afWx4nIAZLdkpHfhXojAoylROS6x4NYm6H+lDtD7CyjQMKyPy/fjATBA1Cq+N3eN0mCceKzRsP4LxX4sgR3GK0+0kmemQdVU7YOqVjdtC5w7hxoudpIi6wINpnvqJ14ZawvhdOqWcVObCyeALttBoUs96Kj2s5eILrIoNlyAintmjMB45K6TR+wAx7qTMUMjgcJj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(4744005)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NgDvtuJlcVvgFZLaSGK13v1UG7/7HyED7wPWQYSy+4qQ2TP1yyzQ8PM5WB+Q?=
 =?us-ascii?Q?W6g+VQz7/NQYOoivqhhTs2l4DIZqU3m6/gJzSDYjqYe8c7ZmRzi2YtSdCA5P?=
 =?us-ascii?Q?KmB2B1T340fljyIhEgroD0awWQYOoPxH4+n0u0WLbzjJadL1g3b/lAdnZN+z?=
 =?us-ascii?Q?vi8uDIFid6CDKDNlfumWOCUZ3JUIz+9NO+5m92Ymu/jhOCgcWJqf4qwZ+nfE?=
 =?us-ascii?Q?LhczC80XBacIzArFnkoDLj1ktUHBAKHYpWbGNFrXARIHzPBLBP7+yKcRYEWF?=
 =?us-ascii?Q?TSjoaKILz4n2weitqNCVgFT+QJKccTKqY2HQdIIt5pekKUVtGE31xTONM75P?=
 =?us-ascii?Q?ECm52ifUlLneP/+V2r5hQZD95ESF+Tb6lCbtHbbohBjtzoeReWxN6HGzCgRS?=
 =?us-ascii?Q?BaM5tK9nrJeqO6540T2chUSLSTwK9gqjeKb2K0/Y1uHEs+Bf3Za51slkv26K?=
 =?us-ascii?Q?43kr3MwZT1puJEnCTV3eUd/DuQfxtvuSaVa0eLYRn9WLK7zrdbVaH7SJqpMg?=
 =?us-ascii?Q?txjx8V1vloRoejmTzi8jhmviBq9ER1py2heACNH1Fhcd6M4atwSQsOxvskzA?=
 =?us-ascii?Q?mQavoqVxtGTs3TfWSANAEOYAW45tSKz91wwpqnty3ZzETuJKGwTvHahoy9D1?=
 =?us-ascii?Q?knJ5moIHj0BjXjBt55koD2fXTFaNjYWNAq+IVfMPCJSZ4QWJVaF8NNp7idHk?=
 =?us-ascii?Q?sdhEcDXkHKc5eqXOzNaExjvDgisY8mtC9imfD/ubvOcO/J0E+4NrR9yIYMrw?=
 =?us-ascii?Q?IVsiOmeRTC72Bn53pbg4ZLzxlnv02PHaisJ4PAVqVIJqpZGlFFgT91dGEMgX?=
 =?us-ascii?Q?FEogpXCOBQmp4u/zpdStT71NjV7zIBQlYbz9yWdUGiELbpHHZcZtQCGiutV7?=
 =?us-ascii?Q?TtdDCPUNLlN3xgCHIlopnW/DEtzVB4QHOIaqEVLIEUjM30LTZ4FVQcG0T5kL?=
 =?us-ascii?Q?98iZ0aqAF9ksRETTh8xJ3pfVi6HgHZxXPkhHlS9ewHJv9VyJgMLX7FieWRT1?=
 =?us-ascii?Q?Gis18XMktMOkFMlN9MHsLOSvt4OzhcvgnrWFS+gJiC7LTrS5QiMFTcyIeunu?=
 =?us-ascii?Q?9d0uJ9NWtp9dW4sRxBChCAWb5Jt8v8QaDu0Q0GO4w/CoM006CE46IHUIPvxg?=
 =?us-ascii?Q?Z5BY0BOfZSD8DWDKEiLhnsz/7S47CfufzMES68B0lyvJnOn8P/2LwoOyOkSE?=
 =?us-ascii?Q?83HDhEhEK87QDy1Fj9uqQwUGwCbnfv8iRTdM/O5MCsF3ErY+OYob/lHqePuy?=
 =?us-ascii?Q?bUz+ij0/G02W4YMMBWKc0PKC1Clenvbay7fFsB3+5BBhi+kThKwM1SuArl/x?=
 =?us-ascii?Q?S7Pprn9BHDTTM0H1JfoG+UYlqn88kTfPl6guYcIi6tqFgSBpBV+NSY1/K2k3?=
 =?us-ascii?Q?zSg7joGyN6rm2h6hXCGOzb+grdt0XWiNCWQhzY4o3uT2209LaXlN3rEU1Oaf?=
 =?us-ascii?Q?C4NIq8xyfd7Od2b2K4Mk7dxz3ZclxueqbC2E3djFgaajuNara2nn9Rr1qoBf?=
 =?us-ascii?Q?gJYUhFRzXKH5JrI5vmIYXjaNS18CqP9BU7qKiuR3kNXLE/p1zkIuSvDKg5Uz?=
 =?us-ascii?Q?rwWqFyOtLzLO8GePANvjrdtIElcPRB/fmNmKpNYI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e345589-dd43-469f-8102-08db80f53771
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:49.0627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI8Q0KDacdkxzw9V49j7dWzGtjVjGbGP8brWZEq0SwztNw9Rj2zUMMnL97HlEjcUEBDVQF13uGJroolBuLM78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..e95d94ce1869 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -2179,8 +2179,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 
 	vop_win_init(vop);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vop->regs = devm_ioremap_resource(dev, res);
+	vop->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(vop->regs))
 		return PTR_ERR(vop->regs);
 	vop->len = resource_size(res);
-- 
2.39.0

