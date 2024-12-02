Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70539DF936
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B942510E629;
	Mon,  2 Dec 2024 02:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P8M1Mfve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6226B10E417
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFCuZoHSw0qngSep594oSsVffwiKHudBr+UTbFcfnhqTd1Mm6iJTVBgwUnI1Zu+Wbg5Hba/zKajqj6sgV4etaExWD65BGJl2GVSx4xzTG9Ih59qPB/XshF3+IYtlJzhXqauFMWlM4qRGcXZXYcH7lFU6VQwA/+LBWRidFl4QNrZMhszKHJQz/5pAbtygyPyAdJEzEs/WhmSDnyU7t5ezuoM6VQVPrvagFKfXW83kxE6MpucCKWK7nlZ9Vj2a+mQ1w/OJvnZQ+lesKtTM/iDsfwkeSCmiI1rfFn5ku6WH/XQsLMvH8l/sAlxMB5F0xtCdGCw2BX1i7iseIU7IXWk+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pM5k0EJSLcN/apUz1KfqcXezVGjeb0AmhTr+1b7eXY=;
 b=XpWXnasfazV33/3W+v4Q/g/T0+0XWaNmzAAy/rP4cqCoDNkNOKX72cGZ1oc3CaruVjqLQThPZV3iXyzY8Z+BZgtwjonLbRlMHlqrs5WMVoSE1qlfq5V61zPaDru8ZJBtowyPcNy623q1Z8CC4hXq2ZR3IAKos2VXw1Y81EPnriQRHHH8A7k8fZSWr+wD6UalLLu8gKi6JdWw5cqWigbAnnr+jgZrpRz8sIl1HGdkwJELRN/1topl7181RZyhCQioW/Go1g5jGOLkHYwfkC3vSWsI8WUcwR/PtrYO10cpplAOsmKQSdOGP3fp3mMR13Jed0M59miNdjaIHPk2/kRvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pM5k0EJSLcN/apUz1KfqcXezVGjeb0AmhTr+1b7eXY=;
 b=P8M1Mfve+Zsrtc/xzUiLHkSM8cV9R/ELavhC8wsKkgUFuv8OKk9eaywygzclWnjlrTTuyNOXnt4B4Q93mk3QInWk5ruJJMdH3vzXInyLtnjcmMxd1PC5e/Cnbx+9IAKrwlBw+xXGpErx/Ouvp4eegzhmd9olZfdAqa7UahR1Pq66mGNWTVOPvfNaHxV7YTcLngk4jPxUYT/FybdUpKi3t+/EXGmWMHGofg7/3jRgnVo4VnyP2OpBaABr4VoLoGrXMifu1fKQsUnfqW2NBMtq/rp5GvqINYcQF0eB/g6VbEqlim4sEkBFKSPmvWd6x5lC8qTonzHj1MSalJZryGlAmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:58:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:07 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Mon,  2 Dec 2024 10:56:29 +0800
Message-Id: <20241202025635.1274467-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed231cc-ce94-4454-6f24-08dd127d2592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yUD411R/fnZDyKivkXGRCx+nfCGEPkuMf3GsWYyjBnI4ZTbURVVbZfNWWTsO?=
 =?us-ascii?Q?UmyLK+T/v6wrSqvOTMcB4R63DGgOcHZs5JPuguyO7lgMXyNyRPEsr20Nr2tk?=
 =?us-ascii?Q?gSCS0ixbZKBKmahYCV4lINFs05CueetE6XY7Bjkdc7K/jAKcoE8cn9QjKdIF?=
 =?us-ascii?Q?Kavga8WnG5ON4IdH8l8IU40mWU8xlFtYVpuUvm9gcICz69oy48c4Td6/d4SP?=
 =?us-ascii?Q?lsInDFXcZ0z5HJij0WuQgjsQBicpzufRW3OMbwFnvlG+HGeaTcAk+8Obect1?=
 =?us-ascii?Q?EyOMvBA6H5vN8bQnw5yKYzioA6Fp+Ix0grQnMnkPqcSFRovAJ4BOiv3hw/Pv?=
 =?us-ascii?Q?4OzpI1yKp+ASrraAuEY/0r/6v6mz+hNvPUGuhXTNkWBGh7+mzIFrnFtVwmjY?=
 =?us-ascii?Q?YI6lRNEuHrJcBktsZ6rmR/xDTmI8KQZU1EtPxSqXAAdnnJRMKX8TH78akE+1?=
 =?us-ascii?Q?KvWTtfT77MYktTkdLU4Tc3Juapzvx16dH9fkNWrgCebINaYaY4bamDjPlOo4?=
 =?us-ascii?Q?CfX+6sKv5GoluFqzxJCeMsTKep7lsex9rxkLR8XTgZHko7N0ulWuDbd7ibWN?=
 =?us-ascii?Q?n5dissgU6s7MRLGwJu9pCr4YWBJWbOcFH14TTZgO7ByIAOzwiqXzB9/B+rE+?=
 =?us-ascii?Q?lDaAYzbL3WNyZzuBvHh1jbHGqxHB6ySs77saTKZBECp7wxfcpPArXZpG7ELM?=
 =?us-ascii?Q?99L3yWYsBqtkFIY9ETVT/Ijgtu84DfzTEiQ0jwfL7KRJCV0z7ek4ay6B/Odh?=
 =?us-ascii?Q?eWbxAwbE43FzctcVCT6Jtid9VYHTJzHeCiFpnUcuk1Fs7/X7sEGeyCguvVdQ?=
 =?us-ascii?Q?AoiW2Ky9la8Q3hFMYEWRNb68qpjO8Lb6FfjrKGSk1s5NpyU8aRSiCmoWlpWy?=
 =?us-ascii?Q?a6OOsYqh8Dgt1FRGMaropZf9WZ9FqerwO0I9EqWukN7ue1CXBiU3QVJhoN9t?=
 =?us-ascii?Q?cPMis4ln962g5ovaT6t4GJEkwd2lVA50NhcpZPID8ciQcr3R41mwCqiawlsw?=
 =?us-ascii?Q?sU1rNFxFZOhNadyeXkwBhXfmTwUZ2roUPsegrM5J5DaoOsohAzy1sgTsBL65?=
 =?us-ascii?Q?iA2dBsRXiBOVVYsVGp9VOc1EaQjJBeAVs08LhLsncD8a5vcmSXzCjIrAp2dX?=
 =?us-ascii?Q?DaE7PuRqvjwdjbnBXqjcDbm5ItmK+Pf76TUYR432RvbJBaz3XDbV/wPFNtg5?=
 =?us-ascii?Q?ISNl2dyKEzhemhLgkVyHfVJ7Dq/942DApOkMPJWuhxK0bxqypheNhEpjB5Cd?=
 =?us-ascii?Q?wlKUkp7ddh8rk6/E54SSnUwD7EmyR9ZXv6uaILxv2hcpXy+II0ifwOZJyimH?=
 =?us-ascii?Q?dpjjiPDhHn/zlV4nJinJhakAV59LWQyu/grCKtNIgWDwUH/wuyrmImQUerfP?=
 =?us-ascii?Q?Lv8hto0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ukc8ezZfIbXd1jSRHtCm15NqLvO4QsemAO+oLP09cDus6Azx2XIxYU2eeCvc?=
 =?us-ascii?Q?dQrR98YYpOH9n/vzTc9o9nQ1Fxt7+EUO9xQfNx1QaEi5HR7PxuCEYbCqyptP?=
 =?us-ascii?Q?+byDxpoEEPa+uvVmca8pSfWIkfAgHt1f1CGK4Wk/SGDkzWqBo6B9+U11SfJO?=
 =?us-ascii?Q?8f9BZJB/14gUIHTMfVfrglSaUX6CutxSPCqs2qM0KR5vKEjmLHQuZGuDeaYG?=
 =?us-ascii?Q?/896dGYDI2UAVrGWnEMVqLn2kh9xtCs77VuXUDgnAlEnCdl8DcmHu+K/TzLt?=
 =?us-ascii?Q?nv1IAmrq434NPApnFLDn6IFdtSNoluVne9lK/Uw581t3XR1/uHRfENzfqJ47?=
 =?us-ascii?Q?1tyCIg3SL7w6e/ubzdtuY4UrvfXXal5s48KPK0SWf1SV36dGBrg3bOyIfp4B?=
 =?us-ascii?Q?K1COvnkbRg9Iu1CT3LZ2weYH7ImGZBrNc+qeTL0bX14AZFD1m5tjhk+mzVoj?=
 =?us-ascii?Q?oeEA/I1RC2kpPa88Ybcvq3ixzu9pEZeS40+8s+gXzc6efiIxHojl4L5WzYzh?=
 =?us-ascii?Q?kO9A/b2jSKwyoATLlxm+6bKxUaWGbnlk05sF4ocvnqRNEJKkgP5/vRveUZp3?=
 =?us-ascii?Q?9Xv3h8ksiSa20vH08Wg1s8mSauoXwrRaWMdY5T+5TLWim8/oxB69xw7Lp+a4?=
 =?us-ascii?Q?wLiEN6+ISgdusRrRi6Ntglvfx+tXEJInFBc0EntFIJ7qGgPWCEDMHyQjfwM1?=
 =?us-ascii?Q?D830lSmoUCSXUY27GK/pLcTPBMMYrUeKUjCCe5nu3O3CweOJjf81jCjFmVYR?=
 =?us-ascii?Q?7vLDESnW6moXobAqqRvj4froRcNScZAfq51urLfXPGo3xYTNeVk7EetXxev3?=
 =?us-ascii?Q?4D7+oCnnAyowUYP3N2PTV1HIS7zOfzl7OICJj3K0bgf0DoHPjXGQEESPGWeQ?=
 =?us-ascii?Q?yP6qTIlHnpH7IR3RCvZOCHAQWZd8H/HGrvxNjgcvkgN59eFVErS5Mt/9yNYN?=
 =?us-ascii?Q?JnJNBnt+1KOt1CZbXqAO1RD71+B7R5aZ4aqK6hLrUN/Z1BaBez+gJCBjtv+v?=
 =?us-ascii?Q?DenqB1yVgnDWNlfdvs3gs9MJgWGg0s832tZxxM8pHrYsHDFYaBfQYgh9xqJT?=
 =?us-ascii?Q?0eu44ZriSLf065FQDtJR6KtDBXfPOFagjIx4XEUCF6BDLmA155ru53IN5nnI?=
 =?us-ascii?Q?Lw0GoaFIKWVPPWKBgGxcPDsD4dMgEwa7zzrujG/Sr6BV5QYZTE5zTF114wXc?=
 =?us-ascii?Q?HwBQWm/R/VIF3YjCFlTzmZCFfdFoBBS8gUzZsJpZxT40ZXsfJA44wAhKZPYp?=
 =?us-ascii?Q?qZ5MzlDCr6CPpq/rHZWaIbfWW4qgddXFmtjeXcz81iqY+N3CzW8B7uTBWAOh?=
 =?us-ascii?Q?+Uo3WMdUeWa0Kux6lEz07tE1ZudiKfxXMDD0qdcj+nZDWscjZJMsoe32gvpt?=
 =?us-ascii?Q?BYwOpDK/liMHzD/DY6wWAsqQgNEwneZ120lX9kKaEb+1Zm4EsLD3/cKBh8Eo?=
 =?us-ascii?Q?J0/Pi7R9EdP3xuq1YvyJaIv+a0gvyDu/UFmVz54euWeVeoo+Uc87QEG9n3RR?=
 =?us-ascii?Q?vDmTeiPmKlKKbE0AdEMx7ta8gBw5OHUFcq9mE4k6XuDDw29+SqgeXGB9SXt9?=
 =?us-ascii?Q?6G8bQPDZyR07SWVXpa3geAvub8/eWx1E0Z9EgZLI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed231cc-ce94-4454-6f24-08dd127d2592
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:07.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7Tzcq/n6W1wiBIC+nJ8nDwCYck7knJKkNHT1nml4fc7tv8cZrKajnf2JqBML48TnwKBfQrpe18lBHSlyzq/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1240e75ecf4b..f3f9655b2f00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7675,6 +7675,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

