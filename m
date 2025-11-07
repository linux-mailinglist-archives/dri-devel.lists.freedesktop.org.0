Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFAC3FC79
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0FC10EA94;
	Fri,  7 Nov 2025 11:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mYCwNcxr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mYCwNcxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020130.outbound.protection.outlook.com [52.101.69.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF52210EA9B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:48 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xm9XQ30a5O668NwXU4GigTMyvjCqO1uD4Vi3BVXj32FxI+s+AlZ91IyHBWlu1QPQ1PXbiUdxQlVFfvXbLanipEPrFn46/OjAVoo26hPpSucflqPjJHHUdQYvSWEQ6V21N+YjkIEOdhdcbq2KmiCHYjyGE1ArmroNMRLWz8fOh/ln+GxCCf2acwo1kpycz6AwBz75Te5ult4enm2d3ukmJ+Qs0W4uBYP57VbIk5OJRtM0cX2Pk+oQXLVsGRWrrszYrxQsZMEmnlMK4fukU14K5pDeFezuQykHu4jE2dEuL1GhPkGYuZ/8p/gogwP3Xse2pVlK0DCA4XP4gBsisLZjnQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=u5ZV4XYdZyyAq9KN1xp5GCg8MLdRdKnFpXuAh9KnxSN+mq2+CdkZM9+guC/UHY93/FIr+8a5wiHFulH7ymyET3IpE5PxVNBLwIhr1iSUr1euEXzuo7fyJjmkSuJdzZY9pMZBpMXr4iXd6x+tNcUxU2BDQKrg7ZVx5oyOo7jbk2fTH/CP6DXC2iTuJgrver7P/uxtlUAw19sDbBfaPnq+HfRdBmZNDY28T8q+IDHUnwCOauHsgBCSLGtRr51G9j+0whFOqdMINAhSrjGrAVAQtLIYO9pDdvclr+1W3mSk7xjg7eNuocVmGKrKvWE0EfEQh5mZXi7MK5p5CwZZNk+OJg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=mYCwNcxr5S88MRfkSiORRbNgXz9N0SdZQVwlBkXJsuYQGfLm4sgQKcTxLMGhsAaPomHH2vd0Wjcf/DscqyjbrUisbr/DcLNbuuuu/+88g4AcRaCAwIkF9++tcKVzyKY4MswDKxjnTPaXWd/4QLbhnRY3CZX0//UHYbo/i4WIAwQ=
Received: from AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13)
 by DBBPR04MB7850.eurprd04.prod.outlook.com (2603:10a6:10:1e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 11:46:45 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::34) by AM8P191CA0008.outlook.office365.com
 (2603:10a6:20b:21a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:44 +0000
Received: from emails-6449419-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 9019C8065D; Fri,  7 Nov 2025 11:46:44 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516004; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=m4lh6bzAadV73l7NKhdmW5/t9SOnUKHGflTaHnbdC7D7SUeWT3ag7wL3QyfzryWJw+H5y
 vU6umoDiyhccOD7luQ0zxaI3HR0OIfH7eKBy8VQplURV96JbvIAQ1wK+Xsvi5BF1DI4Bufc
 DRPI5fH7JNVi0Ohq1WomKqXjrg+UvAA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516004;
 b=E+CXmJFkRB2/p3LaLeUSNG5qeDK1SNIS5HAX9nPGA/mKVpIsDAq4ZvUcAQRBIIOtsYtiQ
 HaBSBDATDpoq/B0Bs3bQNbU919URB9p3HxmQLGiN/cY1OK40JW5NCSTcgrz+m26Fn01kyLm
 OidsRzz3et2JbfqZbLZb4mWNYYs7RzQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYeatNKtilWE26sdgXJ1HIy0F4DL/NQqe9Mdy54QKIvaDmKC2i3kzRFdVrj9MH2Hr1F0WTMTyu4Qi67ohV63fLVwXroSff8UxUdW9BbTJDAOoj3bUj/WbBhl71HLQAQ5vimtMGtOScFi1WQoQcvPmbhDQ7U8scjShwvk9PEx6rLqtzsrsvwSBsnUrjXaH+VGYEIflV91BJ4hWj+4NYOXJEp6PnSfJA3Koq5R4y2lfJIX1RaQptcQBdd8hNBvAeY/Byx6CmCQhPebjHNnwbOXjuivtA2EQc+Yb7/W5Pe5rt4Azk/wkJVo+SKUsY5q3CMD10/9VMKFnXIrzfvEG+/66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=foIYr1F3uUDjlKBH90zxk9PWSJmCdBic4OSdft4dZlo81c1dxP5ufBIaEU9EIedS9ITSJkIFIiCG0a4IYG4lF1zuHzDkIXF96X8MKilF1D9v9Yc6Zh1wTDP6MjmnUsOcdVhFBYJjgCWct1qczeR//PZs0wqZP9B9lpjM5EgYroK3xEuUiu/Y85AERziw3Sh2FU6bPms7hC7kOxp5bv55dwKeJ2O1bOdvsuANAdRXYM6t6Y8Y1Yuv4sZTRynZUqzTRRdv3qBustUIeP49Wul9A+ittGDfp+Z2ng0+GqiZL3e/U3i1ijlpRn3EJ2r1E34XkEYS0btoR2I2VW4kUmoWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=mYCwNcxr5S88MRfkSiORRbNgXz9N0SdZQVwlBkXJsuYQGfLm4sgQKcTxLMGhsAaPomHH2vd0Wjcf/DscqyjbrUisbr/DcLNbuuuu/+88g4AcRaCAwIkF9++tcKVzyKY4MswDKxjnTPaXWd/4QLbhnRY3CZX0//UHYbo/i4WIAwQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:33 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:33 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:11 +0100
Subject: [PATCH v2 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-4-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AMS1EPF00000041:EE_|DBBPR04MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec9de2d-2901-4a81-802e-08de1df35393
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?QlVJZ3h2ejNLNzJVbjBtSlZCTEkwcHRVdDd2eUNXeWFYc0kwc25UZ0tPRGx4?=
 =?utf-8?B?MUkrM3FQemY1eHRWUTRqRWduSWREQlZtQThjMFBiTWIyQTV1S2w0WVJEaUNo?=
 =?utf-8?B?ZkRxYmRhMWFLbFVud1RnWTJIcFYyUStPSng2QlIycldDZHNROVAyNElHclFE?=
 =?utf-8?B?U01KdUV6eFVUU2VUQUxBQmR4NmJYZEd6cFFhRVhYLzdMLzdoQ1JUMzFmUWc4?=
 =?utf-8?B?ajluY2hETkN3SFBWaWM3NXUxN2lYTVFtenhlUU9JQ1pJbzdqVWJJVlcvMzNu?=
 =?utf-8?B?Q2RzdXJUWjNEcHRFMDNqZytESzdZM0djd2VVMVJtUVJBSzlSYUVJVzhrL2Jp?=
 =?utf-8?B?NzErR2tUUGcxRXJxd3dYdVhTSjVnaGwycFZsMzhnVWRNcWJ4M3RhaHNaaXl6?=
 =?utf-8?B?cUFjNDI0WS9acHBvSmswazJ2QjQ3YkRkUHd0ZytaTEVYL0FkQjczb3RRVUhi?=
 =?utf-8?B?L2FScnRPRVd5UVVFTnJCZUlXaXl5QUZwYzh2OTFhcCtRWndVWHJvZ2lrMjc1?=
 =?utf-8?B?U29lUVZBbG1TeXZJT3dXMng3UEEyVTNJeXdWbUNjekFaSDI0TVF4eWZrUkJM?=
 =?utf-8?B?TU1OVU5MOFBRT2U4S21IaWk0eDhrVCthSGVNbzFOV0dzUlVPUi9EMGVBS1ph?=
 =?utf-8?B?VVYzSXJ6SzVyY1VHR0ZKZ081UXpoV0p5L1gwbWdzcXlSQ1FQUTVFVHR6a2FT?=
 =?utf-8?B?WDllTGNsUGZkd3BIVEtWdHNoUEtyM0JuRTg4ZDAxa0Nmb1ZqM01vWUpxSHpp?=
 =?utf-8?B?L0oyQWxDV2tPTjZHOUl3aDBYcjRQcytocGU5Ykg2RjYxRFp1eFZoL0pDR2dH?=
 =?utf-8?B?SG5qZWJhUkZQb29DSUEzSkYrVTNWYW16ZGFTSC9obmpXcFRLcU9GRTFyc1I3?=
 =?utf-8?B?ZnJwRnlzVzVTd3lmR1FwTVJnc3RIZ0R3VGs0SE5qajlBWEhYZkZzeUdFK0xP?=
 =?utf-8?B?YXkxclRxNkZkV2E4dDZ6TnBjRUN4R0YrYitsMlJOMGVVTDFaY3VIOTNwV0I2?=
 =?utf-8?B?OTBsd0c3YlZmcFQ1NzNldEVnWE1nWlltVE51YzNYdyt5Yy9WWHpCK2MzUmFm?=
 =?utf-8?B?NUZBSU1mT2M4THlvajJNUmZncTBDQ0dOTkpsUWtCcTJ6MG8yaEJvRjVoTEEr?=
 =?utf-8?B?eDZKMlh1eDJzWHVQQW1BMmtTN0VrWXNJUTBndmRpblY2aHppejlKbHJqWVZO?=
 =?utf-8?B?S2sxbDE2UXJMa3Znd3J0YzhTcTNPb01TMTAwOEdPYVgwS1lGWWk5d2F5d2dX?=
 =?utf-8?B?QjEydlQwM05hTXBFbVRNNUFGSTVnQm0vRTVUK2tPV0x4OGNadTllRmlHanIx?=
 =?utf-8?B?Qm16cjNQaHVpQmQ2UHdxUDZSeGRBS3dEd20xd2VBdXBJZW14ZEwrZGpwQisr?=
 =?utf-8?B?cHgzWGh4b0lUVkxXUkVlMklLTi9nUDF1MjBKR1dJaGFVeDV1LzdycDRUcDF1?=
 =?utf-8?B?akFVUE1SR2lRbFBLdFB0anpUekRaNTlBNnMxSzhwOGIvNHdJNW51ZDBCVmVQ?=
 =?utf-8?B?MTZuWU8zRlQwcFFsd1lsWHdXUXR6RzY1bUF1SExDQVVEKzluQmRzcWJCVDVS?=
 =?utf-8?B?NE93OThYQkhQa0hQaVd5cjVmR0lBYUdwbUlRd1h4RXl6MWo3M2ZNakVCM21L?=
 =?utf-8?B?OHFjYzltdXlxOTJqOEVjMTM3MVNvNHd2NVJ0dDBJMDZQNDNpcnZWendTdmZG?=
 =?utf-8?B?NHlEbFhZN0UzZzVheDZaWlhkbVM2QytCQlBMVEoxSHdhL1h5RHV1QjhrTldh?=
 =?utf-8?B?WWRnM0NSaVNSemJldTRBTDRGNXRQaGRMUXNrK2dKNFp1SjkrNzB3a2FxSHhU?=
 =?utf-8?B?UjdKMVdTWE1QOEdwSDN6Z1E2TGVWMEVvZ1lWOUV2SzZZNG1pNC81ZTFIQlp6?=
 =?utf-8?B?WTJheUYvbFFPcjUrejVGQlBRTkFPdjR2SGExQjVGTmxHZzFmaER2aUFYZk1a?=
 =?utf-8?B?T1FJRVBpa1l4VGVJOEhJSVQyb2l6bjRveFUzSjg2bGduRE52NFNya21jbEd2?=
 =?utf-8?B?VG42WkR4djNoZUVDdlFnQUEybzBhNTFvbDl5N3laSnhBbWVUN0JRUUxyL0dv?=
 =?utf-8?B?TFRmSTRKRTlJK2RXVFRkYkhhVVk1MkgrRGI3Zz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 56cc2d0ffd934468a2931c51e975815a:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d8adbec-2ae0-4e3c-1d40-08de1df34c76
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|14060799003|35042699022|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVNHbmVBRkJ5em9xMkNEa2hJVDVjb3loRWtreWxIbGxnU3BzT05sdDA4Y2RR?=
 =?utf-8?B?ZSsrS3hLbDVqc2JiUVRFbFVERkd0cUovWXN5bkpnL0tQNy85OEtzWHlrTWc5?=
 =?utf-8?B?OGZCTjc2RXpxTEUyQjUzVkFWZTN5U0Qzd2lNdVVNTnlUVTZJNDlDNncreUxz?=
 =?utf-8?B?WTZnQisxeFFzNEZKYk93VGFFVkJkNHZTU3ZVZUFaZ2NwNkNIb0RwRU1GQWxn?=
 =?utf-8?B?MVdhV2hvVGt6WGRFdytFMmIxa0d3YXd3QW1scWVMeW5zN1ZOc3phQjRyMFor?=
 =?utf-8?B?V0NocitBTzdYVDREU082MlVXaHdMZHFURXlYQXNKTG92dHk1SENTeDh6Y1NC?=
 =?utf-8?B?UG1SMklCQWpDOHNlTDEzZ2svazgwMUxIOFluT3FtUWJKM25helZraUt2RlRj?=
 =?utf-8?B?REpNRFRFdmRJdnkrZ2JYZ09xRDh4bmNUbjhuSTNlbnFEcUFCTjlmMUludDZS?=
 =?utf-8?B?VURPaEFYMW9palBETW9ZSUFkS1g5R1liNnRRSkQzRlBEZFNKQ3U1WXVmMWM5?=
 =?utf-8?B?eStDM3N3NGZva2ZJTWdaWTIyTDEzZzFIMjAyNmtNWG5CalIrOHltcENPbGZi?=
 =?utf-8?B?U0laRWJPeFNsZ3NFSjVqNGRYNHkvWENMM1NFWENZcmM0ZE1aWGNWZ0Vod01u?=
 =?utf-8?B?SW1xSUhyclpGZC9sZFphZXlueklDOFN6Um0zTkRxSFdFY3A2QVlYTi9TNzZR?=
 =?utf-8?B?OHNDZFlPM09SeTBacmtuenJVeWNRQlQvb0oxNVRiRndPa0RBanp6MmNpZW1x?=
 =?utf-8?B?aW90MjYzL2ZPMEFQSGJONENJTkwzMFo5Tzk1blk2QlhaNmV3MVZVci8vOExN?=
 =?utf-8?B?cnY1REdWUWY3YTRML2NhUE9SUHJaMWtqVlJRRmZ2TThsQ2VsTTNNald2REZQ?=
 =?utf-8?B?NTlYQUorUlRuRkVXaHorZ1prbXhPNHpWam1NWTlmSzJTOHBqUlYwYkJjdlRo?=
 =?utf-8?B?VG94YzlwTHZzKzl2dmJaQlhGdTZnMDhXemhIVTVwcnZtTHhBd21xTFdYMXY3?=
 =?utf-8?B?UHYzdDkwVWJUTVlvZ3FmWkZaek5Yb0pYQnZGRndFMTMzN0V6TUVZdWllbnJG?=
 =?utf-8?B?V3o0SjlYektaaFhlSVM5b24yTFovR1NpUXZxR24ycFlJZXpzR1hvUkdsdlZv?=
 =?utf-8?B?amlCKzdpbzFKbDFkd3RRQjV3MnlBeklNYXplUmtUSE41aWtEREtVR0NjU2hF?=
 =?utf-8?B?Y29FNlNTQzgyM2dWUkNoNW9HMTNWOXFOUHZtM3dWcHdNWE40dFkxaUdwaUZQ?=
 =?utf-8?B?S1R3SUYzWmpUQlNYM09JeGliSFRxV05EYkVBakw0RVR0WDErbTJveXl2bGtF?=
 =?utf-8?B?UzdjWkErR3JVSHdTNzVkbmFzZGxjVUJPQkZsME5SWE1VdWtnSjdKMkhGU0d6?=
 =?utf-8?B?dnhhZW5MM2dXZnY3clV4K1N0aFpMeUlXNlFpQlUwdXZRQnVOcDFYemNSWTBq?=
 =?utf-8?B?R0ZqbktiK1M5VThNUFp1UXRDV2NyVngySTBFUVAzM2dVdkhCS2Z2blpNTm13?=
 =?utf-8?B?VW43ZlFuTXBoOU12T09NYTdaaXRqL01RNnBlKzFaSVBYMzkzTkZBUU1uNEJw?=
 =?utf-8?B?Y0FFVmNGUlhLQ0hHN25HQW1qYW1BYVkwOVlKZDJSMkk2M21QSGxPeHJ6SEg1?=
 =?utf-8?B?OEt6MFF5UGV6V3lCOTlIYmt1VkIydUpXckxRSDJBRGhnT1N4UHY5QmJJZHhl?=
 =?utf-8?B?aTdnWWZhU203WTlrWVJwWkFncGxYK05weTZqMDB1TitPSGc2ajVobEpsTG1m?=
 =?utf-8?B?aW5ycGZtUENEK2xkRG1BbjJwNmhJMHltazl0SCtEalF5QXZDZEFoRVAvcTRa?=
 =?utf-8?B?blRIRSswYnR2dWNlTTBtcy9HUk93VlZSSE16M0dwRFN3Ym5hT1VROGpnSm13?=
 =?utf-8?B?M0ZSMlYxandxVXNjSmUyQU91cXNiRzd5VnN5YlZEeHFXNzFPR3c5cHBaV3dh?=
 =?utf-8?B?TXRISUp6UngvdG9OdzhtOThETFhPTjNNZlhEbjMvZzJYdGtpOWQ3UXBlR2RL?=
 =?utf-8?B?OWRqakw0bzhsKzF2THZGemtXdG9nbm13WXcrV0RSeW9GNHdNU3cwdUdQNVhI?=
 =?utf-8?B?Y0N5ZTVEbUlXWlgraEZTWHNQZjN0Q3NyQ1FtTFpzQ3JvaFNBdVpZWFFEMEhq?=
 =?utf-8?Q?aXEPif9JPkKYtHDfEw8EPeQrR?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(14060799003)(35042699022)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:44.8726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec9de2d-2901-4a81-802e-08de1df35393
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7850
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

The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
function for reset.

When the connected gpio controller needs to sleep as is common for i2c
based expanders, this causes noisy complaints in kernel log.

Reset is not time-critical, switch to the gpiod_set_value_cansleep
variant.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 0dd632724a003..8c5a54b336816 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
 {
 	if (ts->reset_gpio) {
-		gpiod_set_value(ts->reset_gpio, 1);
+		gpiod_set_value_cansleep(ts->reset_gpio, 1);
 		mdelay(10);
-		gpiod_set_value(ts->reset_gpio, 0);
+		gpiod_set_value_cansleep(ts->reset_gpio, 0);
 		mdelay(delay);
 	}
 }

-- 
2.51.0

