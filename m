Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399EC928469
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DA910E236;
	Fri,  5 Jul 2024 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="qk/8mGsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3247310E236
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsC+1szMCycAtXLji6XPHjqbV+wYRaU46GR3TjuL3vMeBNIvfkFAerjAcIgB6smIc5wt+fTmEDPRYHaRCQkvB/+ItcRBzOqJZhpTstXdCYsE7vjhEJnPBJGMPwtBd+Kj1tCSFm7KXEhUcj636TZhAWQJQ8JKsX/PTbDctHWD/qEsft3IHnrWEJBT3Vb8nWESVl2Bj03M/qJA0RvEHb0KBQEuC1Qnq9OZsWRZddqlZsOS71Rotv2Wr4KF89CvIYQ1lLoNqDeWlEl2QsVJAhmgm43n3Be+62mrk28/c4ShVkfpoFGmnnmTOHNQmHGXS7vjbK1e1D0ieoCdiTW6AtxWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0onEkYsCpb4TyXKESfp4UE6eeOBu6AQ2Fei7XQzRTeE=;
 b=Jh79UU15dXjTRu24NY9eqn6lgVcY9dwv6bS0wNPw/fwDsz7VGFD1JYp0TzXZxCqXsVOGR0fyWTL2YkREKYtyS7glV6IoMfzdGUirEUyMb5ypp9J7WqhSu0GmYPvNKPzk0lPrsSXFJ4W6kquHFsZq8GmnNYnIDV6TFcxuOIfgym5B5/HNJruT137VaKpgLuFHiN65JUTbbGXsyhpgzSyj436Ap+MyZ01rWJE4968VeS6TVZSl62hwovls6vObXz5zy9RqCfOYM1hHrY10S/GNSgbf65Zbl72fHEd1Rs68VcjPtlcc+Nnxk+Od+ze4x6wWyQzsKS3NI5NW9f8heoWYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0onEkYsCpb4TyXKESfp4UE6eeOBu6AQ2Fei7XQzRTeE=;
 b=qk/8mGsAb+0T2fEm1GkX7NAHfbGpqRLp0M+Uzu142pKUhSwoO+GgcpBSTIRRw5LXl9mItrsKGqW5YFfmJFFKDYFo6uHXGoaS1YqM6fkml0psG8IPpp7jrYs+eqEA3q8vVzoFXAfhLdL4o7QWZ0MtWcGkzAxPyGepq/CMzjzQnzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8038.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 10/10] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Fri,  5 Jul 2024 17:09:32 +0800
Message-Id: <20240705090932.1880496-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: bf337f2d-a8fa-44b8-56a1-08dc9cd11c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f7Dbn9jKnDoAnRXfGaQkuEkcMURxJ0pQEraa5576iuEVFL71mlmhXWSe/+3A?=
 =?us-ascii?Q?rn77l74bbLej5bh51IEHTodaz2MdDhrAgFnxuYNKmiZ36MHFW3Kvn3sLPa1X?=
 =?us-ascii?Q?P9AXU7GLtSVcwVNpAebozyRk2EdwNFVAxq0EsNI6hdMrKEzhyuZGvlACPJxa?=
 =?us-ascii?Q?x4G4I9YJieAxplZ4xU/6J/07wD0AFqQgLrzBxTVF4rjz6nBLLKrNpXYQnwnr?=
 =?us-ascii?Q?Ij7pNQMGMdYll7cJunrT2L/QC4qiE030FGKcWPKRKf9ClyTwQ5jYZWqWi8cT?=
 =?us-ascii?Q?47L8yszRVVQrx5Gn8ZH88fqz3ubOCfm6eHXgxmZDqWgcmDPMBbNbXXsUxk54?=
 =?us-ascii?Q?FQP7ledRZoA6XJektOFuALhukLvEU+hb8YpcHj/KUczaV5Q/LNXbQdopQQy2?=
 =?us-ascii?Q?Jg25yqICVDoh0i/gtC046Ywgx7OVlNuF7XYgDHJtGJQbhFGOI7sTbx5PrkVP?=
 =?us-ascii?Q?c1wEPtE4vl23YgC9fKZJaWAEOqEMpwg63BwWmswmLd+DaaTgWurF6wcl5s6Q?=
 =?us-ascii?Q?kX/i5do8VT1f4SdDhE5QWSnuge05BL8M/W7BVwLy8OwG73ZEYGTk6u4DLsvN?=
 =?us-ascii?Q?bbALZC8HrbP2KosNLpH9+mJN4UX/8FgyUVBUdkkLp7T9f74JM4nqhn1q884O?=
 =?us-ascii?Q?U7c0+NkIpt6QvgSWhZunwNK4EiG+lD0NG/1BYqZFK4n9urwKUZTM3Wl8qNTu?=
 =?us-ascii?Q?6XGikiDMm+DUrarmIzGOfBBMI0ImPvSmYVCK5rETS5IF2iF2C4XGZs7QsFiV?=
 =?us-ascii?Q?Il9nNmw3HeQ7HkvUzJdwBNS7f0sqWfHcNvPK6/jnPM73/dDY8AXp60wb2GhK?=
 =?us-ascii?Q?5yeGvqZ5M29QZ5K6wL2MGRtvcZ3VNKgo3+X0R+hoW+SrPLvUmDTXNoE1IVk6?=
 =?us-ascii?Q?fb+P4D1Fsx4PUEUIXRgul+VuTE4oE1jfr3z98OfZDB8TBb5uMqeUYXSYm0Nw?=
 =?us-ascii?Q?dQV5Iu4SXFWeNfX8ToZUI1/V8swXCL7Vssl6c5hT5wYpmaWrw1TcJ6BTqDb8?=
 =?us-ascii?Q?ibcyKxvt/dt6IK5nyrmrXbtmbfhWkIU/wCxOkI2OYgVsgnYklXJIODl8Eg+w?=
 =?us-ascii?Q?hJ/zogDWavSoyJVUvRsJNZjPp6c5kJKQx3SyEcQBKWelf3eoKCKdqqPUIgw6?=
 =?us-ascii?Q?CMbMs5eD69BZfpZMHcKiNAn59B3hEQneLSyoCXjP/ZrdFUwqQGN80PvSyQLb?=
 =?us-ascii?Q?d+D/2QYaf4CoRcRMGEcxaGs9ruitzyX0V2zAPMHP0+GAnquduAzZNEhukkWg?=
 =?us-ascii?Q?YfZKmuCbeO8MxZy1Z05z2v5CXqfVFL4YvzzkQoZAVEjLGm4tzOJ3M/meaBph?=
 =?us-ascii?Q?BrSg3Unv26f9c6Hm3TMHexqKj0v5iLLF8lAHC4hUZyYZKuZNg6FD4ZoES3ab?=
 =?us-ascii?Q?BoFVQEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71mU7FPIRCo8A2xe6X7CpslF49Dwr114suFQi5XBFZZ5GcHYE/ADlND2TdXj?=
 =?us-ascii?Q?1OTachMHxfzbdWf73PlS6RwOUhSrAJNJdmiGpd+8VvE3JuC4K8+LMs0jboPk?=
 =?us-ascii?Q?e9tpJsPU8djWeb4IM808ImkFen2NfcthRnOTjz2swuhUVdXiYX5l4PtUT0Dk?=
 =?us-ascii?Q?1bLZLqmX/YO97e3URZug567vR1CmbR4guYJj5xg4P5Q9i3lIRAAH0PQ21tzX?=
 =?us-ascii?Q?wzjhQmWZPbI7F/FHK8h3rMTpZtrOb10ipBxLXLxzssNF5N1Bs/8C9uSPYuPs?=
 =?us-ascii?Q?AEn4r22mfFgcLkhcUV/Z9uPljMc0MeVQvK6z/zIstc1pLNAq1bhA8QyiN9Ex?=
 =?us-ascii?Q?NFlAdlMKQnLmuJ8laN+29olhsbfe9tbYrBtXptKdCc03KFzDv4sll0Yw5/MD?=
 =?us-ascii?Q?Y/AWaeylUbrnUR4TR4+RBknInx7Axji2zhWsBAUadn8qOnR6BtoA05yBMWg1?=
 =?us-ascii?Q?mJUfyEs8/iqB1xqfZGD4JbFhGHK17r4CAe7OCTi5GyvrTDRpCkhYWan+8lNL?=
 =?us-ascii?Q?u9zN4grDCJN58vajOFL9KA1Y3fYp8+noRx48Ptyxv1DthLJD5F4xl9Y2Tuun?=
 =?us-ascii?Q?xTdh+26os5Xvs4yU+HRY9ZQ+n1KWAFvY/RvaAeHCLMvrGO2mjvje/GpDqGqC?=
 =?us-ascii?Q?Tfn3ScHF0VdWK15svEu7hiQneJiMXPuqfvUc5oOkR2OcYuaChL9nZIgkO9Nq?=
 =?us-ascii?Q?rqP+rMeqO1hXgSNcpaiZwzfXH+akPNfrPNaghk0id9T3XantCCw/Q0P+35sb?=
 =?us-ascii?Q?CLL7OGFutHL5ZrC67+AWVfhz6IjIHyJRpYupb82oID8vHvFZ54nAASJAhMNe?=
 =?us-ascii?Q?Jj69cCa9b1VGFPjTWACb8WrJuLZi3Sbn76fQJClvZ+tZauuxHEfdFKHe82TW?=
 =?us-ascii?Q?WN3L7kDPFRz1PfhaBEVuYiFrPVThAqNcI+YgGYXx2WPujYt5A1H+9Zjm3GBe?=
 =?us-ascii?Q?k/6I51M52DXoVnbiALGNTLG51tHY2wVP8FqKpTTWv2jWj48RFCNEuCtJWxdj?=
 =?us-ascii?Q?i87fUS6I/doky30+v4qtso6/+X0cimdCLtD1wC4ckrYggqg1aS/jaMude28X?=
 =?us-ascii?Q?EDJ5I+1ZNXZAfKgtsAAYqysb+FGK4QHZEEM/fyJ+m1kyWRkB52MoTf7ag8ZN?=
 =?us-ascii?Q?lUNknlHPkZvvwdlMne+3sUPVc0AsjaBk0h5yHfc6HJMfMLzYjylZlPmLUorQ?=
 =?us-ascii?Q?VJGoe6DZDeTHY1dXkcwTo4r6q3uVW2sJsHBinOmCQO2bsR3DU8J2btTEvzVp?=
 =?us-ascii?Q?tPrJZhD9E6Fl0R/0szTvSJLBIVgsPWRBKDxsCI+lzUZ2HrJQszwI5pHk5hqq?=
 =?us-ascii?Q?aWsKZRghu5Whx3HhgxeexdaJFcbQfF1xYbgSlL3gPCRdIwKjGQG0BTOxQVgb?=
 =?us-ascii?Q?oPmu2ulbHmFBo+La7X79x1G3LdaZ22TysOy7fWyMY/UKCR44V8ZT6dB7P/Mv?=
 =?us-ascii?Q?HLE+8vmJqAud44rUY2L0o8A7I8Rv6Vs9yvDyoT0Mh6gygyUEWNuVuRtQv4nJ?=
 =?us-ascii?Q?KPA5iQpqaidcXGWaNxi8CZYp1QYdNF+lsWl7Z0NOEHdbTqK64JdM60l3mBzG?=
 =?us-ascii?Q?bi8YgxdXHTtiCUQ5tvel4gzjA5DspSOrMS8gVuvv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf337f2d-a8fa-44b8-56a1-08dc9cd11c6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:52.0639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scHpJtnZw1ZdaTbQJ5UgWVvwUljD+vRhMIQOZozynMnXo5Vl/iHTIBMEwNwaVr3z4a3Z+oA0VcHafpm6pqWVAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8038
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35db18d26c11..29c9d52e74d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7379,6 +7379,25 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-intc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

