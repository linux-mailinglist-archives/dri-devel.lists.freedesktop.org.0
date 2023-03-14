Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3946B925C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2202010E78B;
	Tue, 14 Mar 2023 11:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED26B10E753
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQdSyTGvxwN8i5PK9lRXMEw8Bz8Bfy+WEEhri2D4tWhOgrSRi5/9vXgEUcJdaEoEKuKYugJeCQRpxA+MUOraHaUN2N0KUeyAY4EVNzFaHfgUHAEwfHCiTacKd9RVipD9tU3yCWXxvzdAO7MnogTGDXN+OzvjxhPHPdElmyhHB2fjUD2LzCOqfZ0hepwCn7RIUU+bl5+30pVMTxD39KEFC/EntE7i8H8cguo8l6AsrTO0fpRiOsijjOcB0AusIxowJamavKMhm69TOcft4xKYc/jWuqVt7kyqs8jFCrrZIVH+s2OMHm2fK9ziSpF2VbubZyXBu7RlR/aW56PZqneJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAxoRUtaF2y+IcWMgc2RDDpmncVhRoDNlRith8a2w2s=;
 b=no3f/eUmC55h+pKb4lQKAGhbtj8T2s++eHN8NiAakbHpwIAH41a7qaE9UOEM/DFyRA6CHcocFuaqPArHuUWOFYEJtrJlFFfmGKB/eFKATA8EAZMQ/hB34t2k68+NvHTCcxkQoFvvJbpHOfHQ2LQLYJs2P6ZeYIS9AJan/YaXXdSymWLDrgvyry2j74RaKTiOkqKag/Xb4RlydXfV1nXcmplh1qgBBsqRuOa544L2xcSuDH94IImXVAUtB2kJ9QRM8sML8fahCAQJ0texHTU+kTcCq+pTOBlFo0DWP5fl/DGSdaLhCxF6LVbp1aRiXVLiGTm4GIOoLtsr9geobdL2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAxoRUtaF2y+IcWMgc2RDDpmncVhRoDNlRith8a2w2s=;
 b=YPbQeFVf/tJs+VezAlEFFNdik09gUPNsposbonyfsxkY+inH7it50K/PWTh/YNY6FCdDtvTFz6LL9arRNMALF0XXGbKzDUP8xCCGSQaX614T+OtYB1dzcXnkX35A63L4WRFGtbDSNop+JWpmqeZM+W0yUdaI5phS1tiv3GCIWMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:57:07 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:07 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drm/panel: sitronix-st7789v: add bus_flags to connector
Date: Tue, 14 Mar 2023 12:56:41 +0100
Message-Id: <20230314115644.3775169-5-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|DU0PR08MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 169e6965-f19e-4696-89c1-08db24833c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61gdgQGdWZo/rCTEz51X9gIOFwliM/KI/RhsKG7NjKXf6WaPrxNGtRcywBCYIH7rFN2Hm85S3bU6/3aqXkf6iE9/wN6XcZndyUvu/LdteYFy+BYz/UGPb83ulahFdw+KLB4Zcnm6qhLvxcP6wWfP8s0awi6p8zDaybQEW9EzFHghV8wWRS5661gmT7aCTAeAZPPgSPi1rJtWydmQalkH2Y7SfqJWl5o9K8dbYxjyTyxO4n3IVxUERlof8aT81X9xMLtdXd72ud7iB1c0GK1gPje3enF9c8ZsNplEwjCFA07hxqDuVS6QKbWaMIzwFsYAul0L69fCNnKSu1lSWTzP0ua8vhBvNZGVkyNptfNm7uEklchJAbmKDUIF4ecJoFaKYHldhCeWUkgCK529Yfu0NTSpl9QUMtlfypW1Vh8S3TgduYQ1YEx8+V9DvHeirkRGLueZwfqvq1DfRDm8tlQ/4nu8KQqKnh3VHU9EOTFgGPGK0Yp9MsqTOoiyTpPOjLy+4ktbJEA6qOiAQaY1ltC7gPU0BTeuHLSpIdkg8lzAHxghg3BYuP0JtXyqvY9GrdhsCER+6LGPPWPsrJo1o5P/lmbvVpIGWdGv3JR1EHBw/ONquKVWodAPSxEzZOxzaN7uKBXgymLIKd2exRsLCCJQogf0Fb3ZqzG9Se6A7k2m5oCYFMoc/Ld9iU99/xYL94Mcb9XcIebS1ve0msOAAisxjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199018)(4326008)(5660300002)(8936002)(186003)(2616005)(6512007)(26005)(41300700001)(7416002)(1076003)(6506007)(36756003)(86362001)(4744005)(44832011)(2906002)(83380400001)(107886003)(66476007)(66556008)(8676002)(6486002)(38350700002)(66946007)(52116002)(316002)(54906003)(478600001)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ldB39xdW7eKAix6EEuqc0Khose21pZjggrrYv6/c6zLX5WqjtkIyHNfbrEFa?=
 =?us-ascii?Q?fQyPu5+wPl8IeGWeZzeoIgNe2X74UFMXJdCGvLSGfNqtCJopPQRiYHBkdO6k?=
 =?us-ascii?Q?IZLf+40/N/4mzF5s39jLbOUG7DDA/WD1o68QxaeUwtFhxav/i3kAeEV9ARhp?=
 =?us-ascii?Q?B/XhRBNvGxy5L8o8/he1xOUyei8lm0dLZsv9rMso+3353AZ+e4VbsScEkeD/?=
 =?us-ascii?Q?E//Dkmu/bANKBP+tJchYTmd17i2XfKQIVXf81at5qIwZXHIOb8GhIS3lrOIw?=
 =?us-ascii?Q?WxwzUdQj/YpCdvbPaG1owKbJKLMERuyAtnS9gojyLBuG7ab65x+AJLdLXyQd?=
 =?us-ascii?Q?NJHQD5jBIfPoFyZvuSQ20Dwg2c1gfj0uxDiVCvBREUkUjME08NVEADG6oEGq?=
 =?us-ascii?Q?yskizOgjKuFxEX6ZQekuueIgo7TTSh7J+BTCxrrmHiOqAOl1JO+IKK2TvQ5a?=
 =?us-ascii?Q?/f+1IpjFBZ74HZQ3LVWs1i4K27gVbkuAuV5+M1oGgDMZZis+cELVuY2ZU+6y?=
 =?us-ascii?Q?Z1TSLvHqXbkHpq0knMRPJlWo9gIp9f7IiXV9pSSu5qg0AKtQ8mhiesKjfSQo?=
 =?us-ascii?Q?eXtHpnR1dPp5AGxgr1h8OmF6rnieamZIwY2nEoWcC9FzFFcLO+oDu4hHydc4?=
 =?us-ascii?Q?ONtm9dO5J3uFLoGxF/miM9vLt4wQXvdGrLsHCECTgj039TULbWtjL1YqR4ch?=
 =?us-ascii?Q?Zub8KcpwlFjKn7BWmhDk65qnNSqCY5amN/rS+uvqNJGLr6G+0FgCYazCQOaO?=
 =?us-ascii?Q?d+ujqh9cixY1wONTvwBaZz8Jk++8cC9bYR8HfCb8Pig9yq/BxukDvB2hsON6?=
 =?us-ascii?Q?YolLL7WpoCte9p24IQDiPxvcuFt6JxjV8B15eaaeoAtLTwtRJV190kaxnB7r?=
 =?us-ascii?Q?fmmMMsf2eB+oP6vT4dbArsYyDM7f4LV1p0wT15oBllj3EpcMGyMPSve006CZ?=
 =?us-ascii?Q?8M2Ziz9O7LFBVGyKuDPZ7i00eVBhqmv10maGGE6Wbq4Z0oUoM2DKaiTRD8mf?=
 =?us-ascii?Q?ctgA+R+JVfyy8iZ8sT4MLmI2+t1i/fAcAf0VIXCFjG/dV6k1v01EICsxNXLL?=
 =?us-ascii?Q?onkXIYH3eeqIfCHHRFCCRlhjr5MDA2V5NZ00PETEFflQNTtoHMhG1q9IwXuo?=
 =?us-ascii?Q?mOdDspA0gwuR3kpujnV/MFNOM+SeHjUuw0KJqfZLggaeEYnCu0NgWlLsJENM?=
 =?us-ascii?Q?SoAohWfg8Mp08nq2nHmc1I+W9iDT3NOjpZGz4bQ/awg+1/+OaYLvW4DbWYCo?=
 =?us-ascii?Q?tJxmB8+bQzkhmDtoEmbWrsWx5so9kPVJYKzGc4aymeeEejoX/ECQ3GgBwm0Q?=
 =?us-ascii?Q?0db4zxXD6ENrqAJ9RmN9ZYHyUN7Oex0flYm+qfWSVAXQww4cdoKFhPTegfug?=
 =?us-ascii?Q?gDNUVBpg0O9e4jMp2ht5pLymkNgvMaYH9IYKQTUcp7mIHHD9ndmQM744q9eG?=
 =?us-ascii?Q?fLZAeg9kKEC2KipyweU1tEW5/kac+72C50BTfSHPGzHXFVzVgD01WEnDO9mD?=
 =?us-ascii?Q?C6sJJ6i+RdSix8Y+tWNu2Plsy8afsksNVjg/IZPNPRqd6FlAxXprkUJQZMcu?=
 =?us-ascii?Q?idPmQo0X2wgyC1zVnFYFq0q78bhAQNUpvrX6+jyFkCm5xHD/Tqb6INTdc3ZQ?=
 =?us-ascii?Q?iaUcSVp82oWUiUxY9n8JC6A=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 169e6965-f19e-4696-89c1-08db24833c4b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:07.5206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV2K/7c7zaExjltB6TBf7HZQ2DQ3TZGu0LqAh+3ttB3g0nmQ9yRahyp+KsQK58C0wqkq+f9hVwehr6NqR7eDV+TDO+zpH46LOgs7g/OB1Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8811
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Propagate pixel clock sampling edge and data enable polarity. Both are
hardcoded.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 24636722c2ff..1ca04585aff2 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -195,6 +195,8 @@ static int st7789v_get_modes(struct drm_panel *panel,
 
 	drm_display_info_set_bus_formats(&connector->display_info, &bus_format,
 					 1);
+	connector->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+					    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
 
 	/*
 	 * TODO: Remove once all drm drivers call
-- 
2.37.2

