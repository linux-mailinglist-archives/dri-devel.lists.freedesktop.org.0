Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB126609D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637EE6EA55;
	Fri, 11 Sep 2020 13:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50B6EA55
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUuwFrAFt0BXxZpZ5sAB1JfS/BbWb7Qd4xwpGyXIeBi1nmUmb/2RP+2M1oVyCXhuA/A3dr3yc1MxqXdXs12to92mXMMRJWFG0O7ie0zok3qX4d5r4lACrYNphVSzftouoCxTJNE8dH0VPgEASlHZyamDu0a7EOfbc8clm2vNWxyHYV+xlsQ+k7dm+9dUp3XLmSrwaNC1pTwRrtZuN/d0uNh3XNbsDMYK2O3EOPsjJhzWc4mxmoctYhJqQtxDQYJV91L4ZVp9csuhBpiFSgrY2tmpEWLItoCSjcpVp/tXr+Tle0jZAm7jiJf+AFHa2Vdwqrw0j1CO+mC6KI3HAbR3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXQbotspShQWj9Yr1Q+K1incV2jns7FI486mHk60Ncs=;
 b=lGnyukz7IbcmbUSxOcsZLyxkeqSQ3Pqb6riGunMDcJaOklaIWv8jf1qAhW1ZHknGIoWHlEYGzp1lo5dumDYWuR/I189YWowzIdHktBmC+lrZMkIb0gQ2LgTxf5TZFgWJrHeTSgiGbq76A/2dmzHpTFcG4ypZQjPD/rR98r1vkLdiE9tk/izyMZO7XTkuFeo4UlDX3XnGa+5bFwRDR2pIVmbkXUhV6myxUuFURSpav28zSm9Gw9N1pwxG8TCsu7Yjk3kdefFzjxXAlHIuM/zJgR+ndduT/i6Dk5ypEQ8WbIOq9n0bALc3GKIHeNOwRc5SE1JX/Az9JNfpN1KXnPwJoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXQbotspShQWj9Yr1Q+K1incV2jns7FI486mHk60Ncs=;
 b=ZWVmLkT7gsA1TzFELP1r4XFb8yeLqWFhvqyD+uzog3IYJESdbNvmCYr2DN7y9O2gaW+AuYHZErv8rnWHhjkR/KHlUd88w7nczRy6ZcwYwFg3kkv1f1Ko3ruqe9i/OLdY8jZwtDTcsJwU9QBBbV7AWS3PZ7NmTYHf+XAL66m6QCg=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4271.eurprd04.prod.outlook.com
 (2603:10a6:803:3f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 13:49:13 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 13:49:13 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] drm/imx/dcss: fix 64-bit divisions
Date: Fri, 11 Sep 2020 16:48:27 +0300
Message-Id: <20200911134827.32142-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 11 Sep 2020 13:49:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c3318c1-bb20-48fe-da3e-08d85659777d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4271:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4271483E5056AAFEC36C77B3BE240@VI1PR04MB4271.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LjYTHCCte8KDtYR7OZV3i8CI+xK2fbe67knwtaAaqTlAe3VYiSdk9ApYxrGwp7eXZulHVz3Poq6CQ5lHarGVz3U/vE2FrOMJufbs85kmbSLnRNNzfVteSIy5Se+hFzq7VYKuqBBNNm1cVOHKjZm+Lahc8P/1DWDjmXLE1hCmYtYdMB7SarsIcoIUZwsTbYflMSDUjPXRMp0zSyF2mQsJlnaxB00kS7ldQJkZXgjCo4GRE4RMHIblbICDCq5DoBa4n6RPtG27LbNIKu4MuEV4TShbpknrzd2u4ANdzXTppgXlCKLR+fq0R/wu9zOPO2hC981SzOWiF+/7rfbpdiJh61Ec3VLL4MJAc6SkHtW2iY9wEkxCxBWaABvAHZGzTv4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(6512007)(186003)(16526019)(26005)(6666004)(2616005)(44832011)(956004)(316002)(6486002)(86362001)(4326008)(8676002)(6506007)(2906002)(478600001)(7416002)(4744005)(8936002)(110136005)(66556008)(1076003)(66946007)(66476007)(5660300002)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: AkNuUeJHTr+pPN1eJUfsII9So7qGNZKL2V/9kCv7/BiMPgaRxNY9f1vpC5A0Ff+nQsPxndtlYG2NrJ1tobpvpGwDf0gJht/aONcL9+fL55QSGenjts8vUt7FD5JuDmO+6NtYgQYKyxcKQNxjM8ZcDdUcN1d4MfbGyxDLzsf/r2G85GszJ98ykhCNGS0D4Q9DO/NxNCpRW8TqnRQpi4V9ETydJJvkAOjiD5U+bzM7uQYsE5IGlwNAW5TpxQkIKY1XMHI31cZSTdH00sIwGY0y4ewplkYBZXr+e6uH2DPJQbpSIC5apQFaUz8uItgF2hHDhhL2R6MgdYeNeepx6UDTI1Opq2ReC++BCEWBoscCfucFRGBObAx4uLcoSNYkLSrllA68tZposqGFZxUqAMQgN/u03z5dAkFDAPls7IERW3Qa/c2ZA+KXfQCUbVgVhbh3jZBNGrt4DEwl3/fRSIJesPT189VIgUgTyjMfNeF0ViZZYv+DF8Q7Bla9o7RcS2XZ4uLJsM/sCQeoR3bp/vgsw3jx7lTP1GXLqSNZtxcg/CttqHVyhqlPeLz32RRaJ9puIez/Esv/o10AeminQ9RdHyv5ibL3R4PAMZDVdeBe3MTD4AKGu/++1eTRD03n8ye2JFN3EEMUzqHpRVua1RAlIg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3318c1-bb20-48fe-da3e-08d85659777d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 13:49:13.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLf+AfJ0l3zRzoWm+sy3MjZmY8m5SLh6VG7ubsCXlwrQmE/2H8uB5eRwzKidGyHva6I0CD9lggdj1X6JLGZp6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4271
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use div_s64() for the 64-bit divisions. This would allow the driver to compile
on 32-bit architectures, if needed.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index cd21905de580..7c1e0e461244 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -134,7 +134,7 @@ static int div_q(int A, int B)
 	else
 		temp -= B / 2;
 
-	result = (int)(temp / B);
+	result = (int)(div_s64(temp, B));
 	return result;
 }
 
@@ -237,7 +237,7 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
 			ll_temp = coef[phase][i];
 			ll_temp <<= PSC_COEFF_PRECISION;
 			ll_temp += sum >> 1;
-			ll_temp /= sum;
+			ll_temp = div_s64(ll_temp, sum);
 			coef[phase][i] = (int)ll_temp;
 		}
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
