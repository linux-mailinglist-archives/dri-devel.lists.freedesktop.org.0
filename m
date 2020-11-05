Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B542A8049
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972766ED7C;
	Thu,  5 Nov 2020 14:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156886ED7C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFIg0GUWLaLygJEKNo0QBDRZ7NiESa2AZOIfAB9f8IWl/vEFkyXk/oMlkrYAOP62sOMjH7E7OQ5b3WrMaRg7hsGrYVE9Pncsga17n2AhYw8mmiONqsGEJp9KN9kW09Vg8/YEIhwpiKLC21iwwh+tWDlt1AQN7XfnrvKPDFBn2BSAtSKdi3/L0lPzvzi2qfTNY1HmfwmPPMaO3wPY6GdCNo4taXiMKDre+fCKp6CCKHfVbdQBP5du3cDWR8DiFy4JcYbgubMIfzxZ5fNYu50HNQ4kPzXLlZEHac0i0HRIU486oXJ1iaogNK+JH29pImRZOvGt7cxALaXKEnyQBS/2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAmyNI4QT7uJstUZxrDUoJ7xltyM+XdeFVzSm0CHJSU=;
 b=f3az9R+UhK0dH4rMj+fkVofqG6avjIi3BaTS5PRboi9Z/Gcozhg+Qfc+GJZScCOaBYioYjNJpnbjGvEcThGi8btRyFAEdemrS1DyDZG1++67vWM0inP5v7zG8Tm2/ZR8Gq2tt6xrfn2t9tM8673tKfeD9grjvyxsa5GtQNm4zzYFMHg0SjGoTJ7u1cRNMNCVoge16Xd5AEz0Jy/eJhWL+gCaKyPw4zRjOg89NPXPrgp4oi0DKkp9xYMdVRXrGofzBCXvhUW3BMiBOjyUfCK8Ms8GjP2s5e8ygwZBMWD16ETpdr5fKUNaWq0igWA/0RDwiawGGV2qdNsqe4tnRxMCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAmyNI4QT7uJstUZxrDUoJ7xltyM+XdeFVzSm0CHJSU=;
 b=MH/mMdIHkXCND3GrMjjaav/oiJdPGdoO3BrLoX0K1ll46VomNV96Wrn2K7d2y/O8+C79AL+Bg6OI9XsOr1rQdlsLFxzPdTYSeWIRl0mHlyFzgnlpFZdqgf+z4rmtvRTgDXe3nKxhxigHqMkxB4WWlV6IJrd3YeVeiSTJ5oSPbic=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6783.eurprd04.prod.outlook.com
 (2603:10a6:803:130::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 14:02:17 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:02:17 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 2/2] drm/imx/dcss: fix coccinelle warning
Date: Thu,  5 Nov 2020 16:01:26 +0200
Message-Id: <20201105140127.25249-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105140127.25249-1-laurentiu.palcu@oss.nxp.com>
References: <20201105140127.25249-1-laurentiu.palcu@oss.nxp.com>
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR07CA0084.eurprd07.prod.outlook.com
 (2603:10a6:207:6::18) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0084.eurprd07.prod.outlook.com (2603:10a6:207:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.15 via Frontend Transport; Thu, 5 Nov 2020 14:02:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8617b05-f2ea-4bdf-560b-08d8819367c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6783:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB67832DD2D1E0E2D0FDF0F880BEEE0@VI1PR04MB6783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXwSLeSCHiwf/PmRSvj78Z9oF4d6IcOnvviwED0F7jR5jf0gjXA6QB8giUA+NjNXyfVPlQOGX7PfOw8TiqfJoIkqrfM4Zfnocp7QN8NO2HQgOLXzKnLZQ/Ufbsya3y5M2c6vJMvIEjhvT+aWIwcboL/fIuGRCIeOB0FQNt9XrZfal6/r4uwYTpaNDwpWBc1fbPlV/iR6rgnSls5pJnQeNZjNu8sCJtz0e7i0Rpo7cc9RW0Brfbin6SZDLuSy7VaazDu19Isi8To6sEFw82yG2bvP3L1iZNTgMd/BoKHf6ckYD8JcGXgMgjgQmQiNOgu4bgz0Bd7bLi2VEdFZSdg6zFJaDF+yaEh7D5bXSsPMVAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(8676002)(2616005)(956004)(6512007)(44832011)(83380400001)(6666004)(8936002)(66946007)(2906002)(6486002)(66476007)(66556008)(7416002)(316002)(4326008)(52116002)(86362001)(478600001)(5660300002)(1076003)(6506007)(186003)(26005)(16526019)(110136005)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xO8s8Sa3T9/kfwUGM2KBTzJu1q9ZWeQV5LIWCHlkg3gZ3JeaDyl495uqd6jqJW6+MRNEbhmLqHc+g8njeQoZtnQvlS/mv3PEUDQfS6a4OupLRVJJSFZF6FeVWvQtsqDFjLEJBJ0sZ+8u/hLQ4WvwzcSWaqTJRVeNDLkkFy+cpWdGuPvDS23XjPfdcto6SSf07UDnpDxG7t2hIaG1gV71n8iUaKPvumy+aRzMoM81rGHLt/vhbiVj2dIzOS/YTaXY4d335Ik7N/H++tckAFjMYDnXtbXJSrmvp3I7zd5Xif5URbCkXfD0CZZmz/ZLOZisYRtVW4MjoF5cgIghlZQ6CIzJnMw7crmK7yIzXBaxkeVRVkPUvCAJLqY0mlNkPZU2gLZxO8XgxeWkl7xtWXQcWWdB6BxaqgY1luX4i6amb6410GyxKh/gcBKmsdGA+vJBy3yLqYgBvjyuK8JYEM1fmPbVQI+eh+XauIKs5E/i7bLBQu8+rB+1Ewy63cFQyGHYK/K0cVu4sfNtf6i78Ye94PgdRT4l/VJvisCXrwuxy6iCbatfWxIrdv35w59vEKZH7FhDLZH3h/nRjA/VZsLkN6HVCT8YAPdlq8z20Nu2jpDyWIMEgPxDXy1RN+WDrJgbBEZGKLfByzhPQ+QqGKb+8g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8617b05-f2ea-4bdf-560b-08d8819367c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:02:17.8601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfGH1yZ0Zrp65aHDWCaubYSUhxTJoAKkfbQyV1l5hFq7MIbG0J22TggDt+E/v003ihULR66qpTa114quac80cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783
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
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This small patch fixes a warning that I got while running coccinelle:

  CHECK   drivers/gpu/drm/imx/dcss/dcss-plane.c
  drivers/gpu/drm/imx/dcss/dcss-plane.c:107:21-23: WARNING !A || A && B is equivalent to !A || B

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 46a188dd02ad..5db093aada2f 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -103,8 +103,7 @@ static bool dcss_plane_can_rotate(const struct drm_format_info *format,
 				  bool mod_present, u64 modifier,
 				  unsigned int rotation)
 {
-	bool linear_format = !mod_present ||
-			     (mod_present && modifier == DRM_FORMAT_MOD_LINEAR);
+	bool linear_format = !mod_present || modifier == DRM_FORMAT_MOD_LINEAR;
 	u32 supported_rotation = DRM_MODE_ROTATE_0;
 
 	if (!format->is_yuv && linear_format)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
