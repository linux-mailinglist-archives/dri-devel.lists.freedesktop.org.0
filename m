Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77A256647
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8819E6EB84;
	Sat, 29 Aug 2020 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD0D6E497
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9I9UNnassdQhnGx0RNdj2pOtBwPlthPcAd0bfh+kX2u/OuPeQrCiyORsqQPDCLZMX0CW0PmzQqnFnqYBUFG8NT5Yzm+lZuZKwpv44fF6kYtN44cXwh5g8EsL1cEYtpOd9p5Jy5+GX0MqQALi2v9B/xtaQnTGVvoNnU5wt/kOHRFH0YiynDh2uauT+APuF9C/JQ7ckJL8cXIrmcCcxNf9xTZSBUUMhrMusE2/OPg9QLUUw9h+hx5HYJ7Md+6oIlOtHvxmqP+aAxiQhgfVXZLGYS7PJywv0XffPkjtA5xiU/zhmtVoaGxqmbQnQHGoJFC7qMxSD6xK7X4KRoUMDbffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+e5aRAvpgWgQElDdpYoNtSgTL96amHcSl7fXGejFiI=;
 b=J5Oknz0K0tswYVhX84oUS9cDPOTpT41Q5iCqvqDBS22uUJ1El8YJXFHoYQVmK+nsy7ipUg2aH/CWTV6t3mMvkDf5/GJG2HowjHysFt+VLmYyjGTZM0NrUmPaPy4e1QFy1aVS9Whb1L3mU3YqNPH45ZtS7c5addO6n9csSbb4BD0+w9xnLpKfUQCol9AyUhBWH6Wo6RZ0zAI5AGg4wf9V0tDVmFqgnIKqTpIroGNeQH+B8fDgtM8Vj0nMbi+o3/MJvgS4V2XTbMlaD7Y+0ZEFEZ7GhIVGqZtcNUWK1194DsqK8vUh/UukQ4nwYULSkPw/ZYUNUjL3JXsYLdpT3RyMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+e5aRAvpgWgQElDdpYoNtSgTL96amHcSl7fXGejFiI=;
 b=B+1QjTXkw+JLR9V1pghanY1oPfRHZ7HoSHTNiPLjaKK4+qxoHxM7UOOdDEJOG1KOBax9A9S05heqA0AWH4VHe0swDUi/iq6+XfbHnW40qIXefpDfxEIUuGTByIwxDSEuMsuV6ujDmfWPK+n8ZYWYIpjOi/CyMMdMFGuM4dZJ0lg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 11:13:47 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:13:47 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Fabio Estevam <festevam@gmail.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 4/5] dt-bindings: display/bridge: nwl-dsi: Document fsl,
 clock-drop-level property
Date: Fri, 28 Aug 2020 14:13:31 +0300
Message-Id: <1598613212-1113-5-git-send-email-robert.chiras@oss.nxp.com>
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
 15.20.3348.7 via Frontend Transport; Fri, 28 Aug 2020 11:13:46 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d0e3968-66e6-4504-bfa9-08d84b436f47
X-MS-TrafficTypeDiagnostic: DBAPR04MB7413:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7413AFFAEF33FA327DBA9D41A2520@DBAPR04MB7413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CYh85n/LQ/NC1bb8R616oAq8q/cn0G4kbOtvFO1q3xyDY9Cg6Vx9TB8jt6juxxswckg/xVIP6D0OvYJb1c5AJf2HagEweMFuw3n58VuPytqJqHD47Y//PAdJ2Bh48Spjp8rkDmESHI2Ds06GNRKMhep2gii5CRF3WlOqOAo0sI33CAbzHVtYWkwnKoQWujNw4kag0eLlHbuFA6AooKSpxY2bST5unYhIHBl+6cixJzLztZN0x4SoLQHQE8SLSik8m+TJD5gS9a0A5772Fzgxa2SM7W0+QGcUrWnjBUH6IFObAPd7G42lPStsb/YMCN65UuHTEws2kaJC0PnT/fGbtl2cZFn4GQXpl2WH36Gt+OaUP60zc0Owp9a7+viqhTixpSA45NvppHgC22PK/OY4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(16526019)(52116002)(86362001)(26005)(316002)(8676002)(6486002)(66556008)(8936002)(2616005)(54906003)(66946007)(6512007)(6506007)(186003)(4744005)(478600001)(66476007)(7416002)(110136005)(2906002)(83380400001)(6666004)(5660300002)(956004)(4326008)(142933001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9P0PZW4BKaZwkMVjTcRGci5fQ+Uz/pJTuuRDbcmeHFHUhQACpw7Fi8TdUXGjaUCSKezE1k6TQorlKOXDp6Y1uUMqbj23DrvREH2KqYwkHWV2noDJz+fxxItlTPG5TrPfNkDWv11udCrHmXtyd/iRJMwYq1oaeUClcbTxFq/K3945hDlIuC27ekYiKy8UELnJBxgAinsVl6syPHFK75gnnbNPfUHsIbqzrBPtoIdjuo1bBuhfbOs7RtSL9vlHTgj2AkpBkmsMVQfqfo2czBb5qmJFnuw9A/hPtAiktXNQeKE3NqrmyNS3ULRDS/+Z7qUEtqN2iJhOflVDpIPeAaI6aLSk6tVKAz5RqkQBLicCSOSH+knt66WFQEbb6isFMF6CkOsjgBOcwdG6Ny7uLvKDnnSjIIEFk3mZe+Im5Q9hGvQpOOq16406Sr1iCIDXSWmeGS9vXeWJcf3UQ51vAMfpVxD2oyX3z3pZ3Jw1H2VdlJKG7rGbhLfABq+PO5ep6Qj6DEOZtHooDUgbr0GRuDfdlcgtoM4il43rw8XC0tWHoNP9SKH9Q8+JTQ6ClVgQi/w499khXZoI3gVvBFaqumkfGJUZpGGrjCAxR7ow8sJQJ28bsT/T8E/hQ70quBDIDnFleYy+DAPbsPJWGq97rzS08w==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0e3968-66e6-4504-bfa9-08d84b436f47
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:13:47.7908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F33vtk15u+T1z7PoeUGnH+pPoDDa8Kfl19AwbHQfDjugVbBICDGCo9x4JmcClayOco/hG4+SDbGX+62NaMXG5w==
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

Add documentation for a new property: 'fsl,clock-drop-level'.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 8b5741b..b415f4e 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -143,6 +143,10 @@ properties:
 
     additionalProperties: false
 
+  clock-drop-level:
+    description:
+      Specifies the level at wich the crtc_clock should be dropped
+
 patternProperties:
   "^panel@[0-9]+$":
     type: object
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
