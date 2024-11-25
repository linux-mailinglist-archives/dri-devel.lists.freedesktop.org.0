Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8C9D826A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9320D10E5EC;
	Mon, 25 Nov 2024 09:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YS3XNjsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A31710E5EC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+9GI3CvE8dx7RH7Vkeni6q9EmvHzlUyWUTwVJt9Gg23XXlBZ/rhzLdHFqijANckiv/E+ikq/1SYmbPXitDrJnrWZGDGBB96Iq9B82SVCaYb/3NHYohDlbtSzKSHSKLBeo8F+R+GOBC/8Z+1smXG2AJyNuEZbXarRMUYRU9ykSUMH8SO8V7yW13rkvSDrWzS6wtoneX2YkWXGbwp0Inl3UNKmZReN+h5j7OCBjzYAYSfpI3A00/3YjRKraXuQcq0lBsNl+hVqleL6lcOXoaBlhjHlBGKoNt/1KJh3L5ZQEe68vkMVnonBtT0atHfaciqkfcUHSNlawQ9tiEHMurQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U+VyueZbbIe7DHgibQ2VZ1ABe9yTPnjDJr8njEaX1k=;
 b=a/Z3eYhibO2R6ZXEW1Ed8UdP4jxYAFmznI5E5x01lzzSLA9bXTWnMG/AJDn+y8ZTRRs3ekH4Z7UQggYJYwG39QKUzy4HlXbkPquf9UR32uBEl1G+HDQyUdU86uCfJ36MnC3DpYaq2k7du/Fj/qCzBh9UnRUJ8cp79w7E9wg0IAYkzS3k/lQKupTSbrcmxydu3CNPHHyVXv0skL+xkRJeAww+a3ISFpD1NjZwpVVNKWkorBUkVm6ZIMK8aqk1m3Pef9nuc5POc7NhVjH58zH/2jSlpgxGi6rNjS8t7cvLxiUpJwcY8rAQtKTOthAiNxPGAj1MMTjP9uoZKMLgpcAALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U+VyueZbbIe7DHgibQ2VZ1ABe9yTPnjDJr8njEaX1k=;
 b=YS3XNjsJbeFy8/o8vOpuratIKeuCXCJLg/E/fO3aUeoTNsfrZZ+gQwFQgBSZGF78B9q2Fq3kTmY2O0xz/LQiFcnsltfjGlVh6gfiYgT/Xe1gRqQULWJATaoIQUC0T3nkTLgEts4T7gqKhPgWUFcagwDXnP1Hl3K4J30yL/rp50pd36XDbpb9fCCRFkyzFr2hGuROO68om1Vx/sAWsuWBzMQ5W2EI3irOaFOh1rtEVdUeGZXfr5mXYCHlnmAMI8puDVFRXmrZjQRmIqnJOvbrEz2O98yA/42kisOSN4ppQMrSgahbtB5tqemJb8Wu5P+zV8JF+Eq4np3AtZHD/vXM6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:34:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon, 25 Nov 2024 17:33:12 +0800
Message-Id: <20241125093316.2357162-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3c834e-7058-4662-c29f-08dd0d346cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ps7q8cvhhT4DX2DSWhc3nvHjZcApMjLa09f9fwgQQDCDxyyz/zIxkg+enR1o?=
 =?us-ascii?Q?x4xTzplEsZJW99w8Qknh+XBKMO/y74+hLnLqJJS7wxpnccnwtWo1GirlmaFl?=
 =?us-ascii?Q?NkK+pNM9nZNSZUTvvR3aBk/NAy+mhv+LFLumPAwzj8CHlB9lyuKRyvBvkhQ/?=
 =?us-ascii?Q?u6aOpP6J5utDNdDP2UTCtROKiEIbYZnALvtbbCQbnKQK0PSHeT3qa7x9awXC?=
 =?us-ascii?Q?O5/HuPpWf2ZFRmIRN/re7Nh6a+eU3/uJvXvvZaLA55hLngj3pv+cpHkMTodY?=
 =?us-ascii?Q?pqgI8KsqHmXBk2ozox2CKlaF1rUzQzcT/Au4DyGQokix87C5scQPrvB6xb7D?=
 =?us-ascii?Q?kXmpmnpyWlPO76vibeWee8yU/okLkGLSQ98Nn0OzJ59MO7QRBIuwC3w1qAbo?=
 =?us-ascii?Q?EzFJGZFYQTO0jyZF2U0/nslcGNjl2BzXdOTa0SJoGAUHT7T1WiC1Oi/khftc?=
 =?us-ascii?Q?C/eexk3bKNwiV9zUHZS7eCWKzEmu2JL8YsqGqkDCFHPHQq5KDIAh4Oo6BL8C?=
 =?us-ascii?Q?wHuyifCwwiLko5TMx2GBr6L/G8vitBvuxDLnWViIviU87+nnVdAfzcf1nQl7?=
 =?us-ascii?Q?ZJUz4noZmy56iJTtI3RnM6UmaHdRGoC+Uxxeav8jPnL/e3V19xTk8Mx8wwsd?=
 =?us-ascii?Q?VqbTwP96VEIvLcdOHJlTOTS6/6yMbawDo169VClLZV2a5+bmNFxFUY90Wlr1?=
 =?us-ascii?Q?RMQOpXFVJeo+eqyf4YmS+0o+8IKXygWHLYvVwA4OPnqgau7pZcTUvQ2pmP58?=
 =?us-ascii?Q?1+hQVRlVKOJKbKwtEniuuJjbBAai7bGYXZ7+PrY6HEhTmJOFVb6rPRPXVqS7?=
 =?us-ascii?Q?vkKAxgOqNbm1Eg4fyZUmPb0pyJJHnpNUmSo8MrHg3HKVFra9vX561VPAK6pF?=
 =?us-ascii?Q?5bZiymRxquwcA2SPD/oqkBeSobM1Bk4Q1Yp7p+nplqavYA7v6nN41qhvAxpP?=
 =?us-ascii?Q?rMpmEBqfDkX1MDuU/ZGb85xH+1XEL8hI/FjVjFY3QTEm7n04NRE5c8QIVEfB?=
 =?us-ascii?Q?MpuxvIIhVVKFkew86Qwa3iA5yHx1tIZqYM40rOgyjraPyxB7+xNVtnto4EzC?=
 =?us-ascii?Q?2Kt/Hru9bL6X5RBThcHUT7RnyMCEvOLeumGXXx9FL7v/fFJzZ4j0KsnDuIGs?=
 =?us-ascii?Q?Ftbo/eRAi3gdxFe4tDcqaSvziFazCFcrcuS0M0TS5/Wd7vFBePm6CphPFgBm?=
 =?us-ascii?Q?a0jzz1HFG95eXGs8jZ0CB92WQDDCc/XvPg9ub/5fuT0XZX+a4iHc/gJJNzV8?=
 =?us-ascii?Q?3k8NgZGrK8nDc+iNMS+nQC5S7qQqxIOJR6VGzfGC7CEJw2PpiK+1WAEDS1nl?=
 =?us-ascii?Q?14a+A7W0F1KRK30dbbUrziRi/MCbW8dTwXkppvcNWDF/iW9ejWBV05+FZQJk?=
 =?us-ascii?Q?u81yothzjW+9y9DXlW0GijRLnxdI7TJzmzQZomEqNv0kAnJPdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xnx9iwmUTWrAOs9BJqnUp0yLtrelVc/BQRUtUoarWE+NfvrYBniIIPbfx+DN?=
 =?us-ascii?Q?R4il6BT39OMJerF2J8e4pG2VKZukrTIhNZnicK6m8K3ugaQuOmRKsYv6P1Xa?=
 =?us-ascii?Q?XcECUKcxz6Q7Wc8IhnvCKCyWRvW48+83tc4Ikm07tbM6F7aHOBgVOoRDCH6u?=
 =?us-ascii?Q?EMVWOrXw1M+ypaxTzRJy9PAaJWwgtI8aiexST3qmXCzjIhXgJm2k9VxJlVeF?=
 =?us-ascii?Q?+gPrJIG/W+h59Usy/+1hPn4iKOn9/k+hILp5UV+kHjLPmU7B2DA65m1CgWy3?=
 =?us-ascii?Q?ThOFMc24fJdbMXzxdk+EGNEteEpKaSSpvGyzJfrl597Pa2qhZDE7/YQ7Ux50?=
 =?us-ascii?Q?6zEj9zj/e7gYUszFMSJsna6TLuTrlSvro2boBlqpxoHHk0DjRWyQ/a1bxFXp?=
 =?us-ascii?Q?pRmPheKy9oZfOj0w7PqvK8uQRyZfp/WU1RUblkYrNx7ggVKhV9qFUrxC0Aeo?=
 =?us-ascii?Q?xVxvpCpSRa+oVFo02CNau35i1ZCNpp3eFvEtBbzP3uZj7i5rsjuJZjLwoyZO?=
 =?us-ascii?Q?SrBjtu/A+rG5QQ1hLLXnYyrtPbYHcuUra37chZjVya//1x7VsOPaWvIMqwyb?=
 =?us-ascii?Q?1ATctWaMpRtJAAqxXWju7bTMmJRtt5sKDbw7Mh7UzecmL+ZcmYmgJFmXhBT0?=
 =?us-ascii?Q?itptroQgTkxt5kSBuDtqdoo/h/MutIZK8oG8W0BH+MKTyTRaVk4YROrDXQa7?=
 =?us-ascii?Q?B2YeV0a2P3XXV3JDjWsowiUpCyFGvZ10on5c9Gj5W67oOktIcKrvGHzwRyof?=
 =?us-ascii?Q?mVV5J+xqkL04z0Gu+AAbMQsngZmH8IZfvuOWV2+8h5teEzkeBZPuR60/rydM?=
 =?us-ascii?Q?/aiizfPwZKmuVn/rEor+MbX2c9v8vtCwmWGqxdRhHqnHSJsbmrFwJkpnSaam?=
 =?us-ascii?Q?87d8r2F+X5cSeQhUhmGKkDTk+oN0qq6U5xOiHyJMYGAechDW+1VOCGM4nxcm?=
 =?us-ascii?Q?DQ/HkcUyIKnvmW7sen38bf+Wct2FGruFXrsnt+jUdLzkeGOt5uGihHjYGbe/?=
 =?us-ascii?Q?dinFnbnbHaveJfB+7rO2RHJkLIpM5zIhcGQQ5WyDmCHuZF/Io+ES7MTsGz8D?=
 =?us-ascii?Q?Amegzv/s5SLHaXBXvq1U8CB3+SwoPygj/6DUZ/WFleQoI3gqAbKfPHvppNBA?=
 =?us-ascii?Q?YVLI3qQoSdUxrxAvIGyRsiE+/yB71G/JGOPXB9gDdIy3xvbDBbbdILDIlPtF?=
 =?us-ascii?Q?WM8JPMuB0ibqKy6g8OKAxRRBlmhkgyC83XGM0C6qNmzsLyhE7jzIJnp9cEYS?=
 =?us-ascii?Q?w42YwFAvThxvtjzkOGeF77qV3csrPWTqt84eIu/MOlCzpzuoXze5yHREA4iq?=
 =?us-ascii?Q?pG7tePYNvvqgdaqQ+0Ep5RIOfmk+VocEgpRCV+vnelyOKZGv2yNI6wDybsR+?=
 =?us-ascii?Q?5e9jgPErin/UWRtZAqBlnobz7CNU5WOE61zlBNMWDwpWlFU/Wzeh18La7qw8?=
 =?us-ascii?Q?wCzVpZvScGkzqYkf0KodFhQH10fsUSa0/E/BSaavnD/zzeAkSIiqJdUVg87Q?=
 =?us-ascii?Q?31130L8+fZnGyla7+z0SVqUA4lqIT/Cf+Nob7PngLbZ2ZZpCw+IhfDuY3S1F?=
 =?us-ascii?Q?DQ19bHP1uyxZPL3vI1Txup+a6XWw9GZYUZBGcLZX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3c834e-7058-4662-c29f-08dd0d346cf0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:57.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCHExVPaBot/Qnwl2NZnJXOoBrVqoKOf/Bs8IT8cjMaYVrDZ3YaY5zaYsUkDovXx/udh21aHDL5vVHsyrxMu9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
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

Document SCU controlled display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by display controller subsystem device tree.

 .../devicetree/bindings/firmware/fsl,scu.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c2..1a920f013ad2 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs
-- 
2.34.1

