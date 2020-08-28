Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D688256663
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6A66EBB7;
	Sat, 29 Aug 2020 09:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE85E6E497
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmqbllgLIx+IBFTIQIdwxYdncMpaKaD6LNhzXWhwyOUsF8tqwF1wxDjTuyGhoPqAMhkJm8hzFrViNzhJUOctmlXJm/sTtUyiYm033CK/sET8vCmZZZB62oKRsTpMXGuKyxHjrfFcZgqZ9llpegGNXYhjv4XI97CULzrieod8Pof66o2kYjnE5LpyaBoRveZBqjC5ua8yKZ9yPtYEB2fEu7xL4htPAQXpiykTrlljUJGiriiC1cTrq9vJEdS4phXfpx1mkm+gZ2yhaF0uWCWVf/wTbi7JgZ+pS5+2JLsXojFXDZ9u1yn6kR2xPmnczDNPPClcjJ18c45Qr16GaTDf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVtTXZwuRqZIPJAMumzSocLdi/N3aOlm+7JESypc5U0=;
 b=ndOBWRmGBFFcqotANYq5Jklx4z5IyE5QmaWX/VcscNb7ARGpx50O424Z6BNL5dF7x4Xt5I13O9P7C9hFTTB40+0Go88UCFFgGsIHvU+vscO3Ke4ICQFc6NFNMIWJgZCS2nGouHd7B8PZdujKLEl8wc9Sqkn4Vg2RMRSefxUv5cTyHWZb0OORdVdDdCvq+kuqajlb1FERCx51tXO7r8kyGsjfuhLKGs1HPHuKXuFiQHfxfv9097nJDL0dvccuknS92T0h6KubFdXuQlVqJ0H275DD1ls4a4Lwndmyv0wOz7Sil6Fk8+NAlpPC45gWLkY5S/9GEYuaxDNUAPhfzAyBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVtTXZwuRqZIPJAMumzSocLdi/N3aOlm+7JESypc5U0=;
 b=SwCB2GJ9NtD2+fkxiGGMsceIqu0/uTjgLfAf16bevyBkJ7vLJ+sSC50Su9V+9CzxyvV7Ly/2olLGiz3qqgTcibLcdEHwMy5O4/zZcv+0NdLK/hFfk4FgDNdOt5RNUEXkLcdqyEDV6BUfXlD1VBMUr2K5eDFHFCoBPGY1AKIrAF4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 11:13:44 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:13:44 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Fabio Estevam <festevam@gmail.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 2/5] dt-bindings: display/bridge: nwl-dsi: Document video_pll
 clock
Date: Fri, 28 Aug 2020 14:13:29 +0300
Message-Id: <1598613212-1113-3-git-send-email-robert.chiras@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To DB6PR0401MB2598.eurprd04.prod.outlook.com
 (2603:10a6:4:39::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-120.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3348.7 via Frontend Transport; Fri, 28 Aug 2020 11:13:43 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1535fa8-c78e-4f09-f8fd-08d84b436d61
X-MS-TrafficTypeDiagnostic: DBAPR04MB7413:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7413CF7361A31CE3EAEDF63CA2520@DBAPR04MB7413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdYNWVQRXfrvxcnrpQPu8xviku6f+8Lwq8ibYi3zoCfO1NDzhf2JZPlE9I/DMCwJUtSU//8ZNOjeRyyZPVc8pwr9awXbpJdgo3SO90HID/h2ArMLZnrp5+ysbtHdEGIj257SEcVyN9WtJSuLF1LnAkRZc4uyZztR/46qbVHgSPj9wUebu2nAOlLms+KT8c1IYRf6mDv1uH14ak3ZxNEx1A1H+cgMkj899w+Xlqf3SKvw6Ixql2Mzb6unpuXtzgkXdPa0A0quzb06tiacZv1+5DoXi9PTPZ4SkNVT52ZE6GwRCnTEvdcxcyl3IgavWqBvTnwktk8s2b1npMTQbkSdNNW0/kM3RuhRqPmfdyf1A/qvNs5J3domsOWzLHeAr0Qz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(16526019)(52116002)(86362001)(26005)(316002)(8676002)(6486002)(66556008)(8936002)(2616005)(54906003)(66946007)(6512007)(6506007)(186003)(4744005)(478600001)(66476007)(7416002)(110136005)(2906002)(83380400001)(6666004)(5660300002)(956004)(4326008)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: S1hAtt23+456Vo6+GzKds5y7dcGIo4H2DCra7J5Tzz0xne4MUcd8xKZ6OzvUZTxuO33XPFxpsW54ATG58fYj+NMSv0guqSVVHUwqvdDG3VeWqtHlv5tfcsG/8AH609kWFECZjPcT49dnU4L2QKAhnHKI0yuFfK9ZWbSfIw6B/QGDg3NpRm9cKDSyDeoMo3IthXzrgnF9LbjjrzgiCXSbB0ODClEmAeKyLBXndznFXTd83K+MNA/HfnJLu3phOVTd4yB6BsoxNqstZ7TV883jdrKpZg5IZ4aYXF+a4EvCYwE9M4CHo3GDEJ+71pFBIF9Aj0VUsdVkNOmJ0KbhGegmEmA0yu0D3iDZ/NOotjg8+fWHxcR8Bs+lB7RsgUgLdIuNgtSqWh1mPQ38W4Dsu5h3Id9VoFRFFDNQNEOnQGtsfKKx+g5SusnqpPjr/AIq8SLBmxJ093qlEkQmYy/H9glR1ArIsvR93pPxAsSs91djGjv5HL/gCSPvfNfGhdPWSOUp1vY957a4Xn89zCnRXnchtjiCUx3F2fT2RIcOginoBDY+v4fOGGgdX3xpQEpfSRgu/ZSOB4HnmQq7foKH8ew2JF5gxKEToRWHPJbE2L5hmhyYbSMz2LqQ+URlCk51diko/M1Yxgd4kgWXtBefvUGZ/A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1535fa8-c78e-4f09-f8fd-08d84b436d61
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:13:44.6722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPZ6hh0gNwzbjRav4qh0kVtd64suxl4xv67MSoDNNJx7HmNkveOcVYwUf+BTuOsz3x/eDulSoV+QmXWEyO5zQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Chiras <robert.chiras@nxp.com>

Add documentation for a new clock 'video_pll'.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 04099f5..8b5741b 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -37,6 +37,8 @@ properties:
       - description: TX_ESC clock (used in escape mode)
       - description: PHY_REF clock
       - description: LCDIF clock
+      - description: VIDEO_PLL clock (used to set the the PLL clock feeding both
+                     phy_ref and DC pixel clock to a convenient rate)
 
   clock-names:
     items:
@@ -45,6 +47,7 @@ properties:
       - const: tx_esc
       - const: phy_ref
       - const: lcdif
+      - const: video_pll
 
   mux-controls:
     description:
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
