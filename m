Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E243AC640B8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066F10E399;
	Mon, 17 Nov 2025 12:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rAsXpUp0";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rAsXpUp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020121.outbound.protection.outlook.com
 [52.101.84.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5F10E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:52 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=COmCnpzDiKlBg2kDX48OOsc6vXvsw3uaXM6JmXBqapjcihIgreJDr3FbzP8mDve16S2MkGyC676sBkHmaxqGxEmgnVLiIkdC/lK5p5dPXkuYyda+6XBnL460kIKjZuZGtcvkPnQhkSyCLyvcht8usBdzunSrgQdArqrR4nGVwu84Bc3gwejHbCqjFTp4VDbP8PEeaVDqPunxdBpnmP9Y7z7TZVUL/+YujKjAir2obAGup5ExGhiMXkYmriDJ8UynXbwp1HbY/cl8hG2WSp2eYpiSZ9YuhmciW+yOvHEdAr5SaqJ05Cb6g7r8LJ9P3KgpuhfSFyYdZFjcX/nTaIMGNA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDuMENLqY7gZLb4Lw21/ksPVrDuiUgXt5/zUV8lH4UE=;
 b=c0MTBz/kOTISl+oSqurJowqSAsmgsY4kXnAekQ7pEv2+DWvYVs5PpOF3egydmBw9lcSrdQl4+lw6H+ipZeJkOuOUYIrlWSKB8ZHo3XaFKsBwEqkowKE5qdbcRLLR5WYjYmvhaekflstItrOcSZSzIfXwtgf4kH6Tk5mtJ0IYp/brCkj2d1TZUWL33bde/23mb1BGD3YkgKMs9smnxjruRww2/nrr6gPqfEDpUG4Jne6bB8p2gzJJU3VYbXl42usKas/pJ+1dH3x2/2iVGYz8QY2o3WfJ2HyXcaT70zw+8T8ddMFc89gScA7PpnLplAsFRkib3cq06L1+VcjEkDHykA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDuMENLqY7gZLb4Lw21/ksPVrDuiUgXt5/zUV8lH4UE=;
 b=rAsXpUp02SkbQi7v2yTzk4cXd5odrMCIlbDFw26QHLtH+fLpovPTkmyuSH5A7Sx4EokCnbNS3xDr1puG8gfoqeDTL5qdXo/tvLGz/L8MwR3010nRq9PvVU/D8Po6Xy3UuzaY1EQVkzB6bsuyVDp5lNoe7jK5aTm3IsUPzXJV0GQ=
Received: from DU2PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:10:232::28)
 by AS4PR04MB9689.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:49 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::d9) by DU2PR04CA0083.outlook.office365.com
 (2603:10a6:10:232::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:48 +0000
Received: from emails-5628556-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-219.eu-west-1.compute.internal [10.20.5.219])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 3157080123; Mon, 17 Nov 2025 12:29:48 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382588; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=BDuMENLqY7gZLb4Lw21/ksPVrDuiUgXt5/zUV8lH4UE=;
 b=DxkyddVUnW/X8/24L16cFY3GDIy+UJmzMGqmrX7h0coxbSdIcAHXWvleknEB4omf1Wuiq
 iGgXqeuQ2Lwn3cyzAeLa5/dCNsZQYNV+XD8PGFMDPfuUDZ+ltwot5YqMSqDzsa2EE+wG6Vy
 MkwdGAr0mwlfePYnlrlR9C8hL9rCWzs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382588;
 b=NNy+FeFFgYWYeI1RMxCwJ9Z3YwwhMoUah4Hsx6L1pQndh8Y1eNnB0NTvzjL77hDrscVpE
 MTpvNAelIzncgFVDmYGXv+xQl1VuPfsEh6qXDZysQatlJ6zKo7o+w/qSstMPGpQlqm5/EPp
 J8aVrPQf6wiwmzBXiD0qKj9vZIAGMxo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLwF2gYKTHJBUSMSNeLkR58CQVhiJUioImxV2zlEThQECcwoFIf2sRRYktDIiFFwI6RORVmtDndwkS8svrYZOFk4DX+8r0dHKdMUMHFJn4FG7C1qFGHmtt5gYkN6ox+s3Sr4glQYqWJbPer2wlqt7V20utfefY2RnOAKXkEcr5lnAJuai8wlxTIv38hWspxWrK4IVd7/F6d/fl9qz4eOu0j1Aqgs5HdW3UzzYx/6vEW9D7683vtI+kKZ8vuDNGVpx2PphCGoAqBhAMGrq4pCS5m3k3FHigmh15IqYEOC5TvNLXNAlCXY5XZ+ZtB7gj3ee0AXrKr2Wuj38R/H06/eeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDuMENLqY7gZLb4Lw21/ksPVrDuiUgXt5/zUV8lH4UE=;
 b=XM6zRAQAStzgdOnxocxQi3cRSa4R+Lg/Hozdc3trKAqN5fDN1IFg6+IH7XaqXyaMAwPGZI5C9BC6oF7BPPLDxA7UURVgEf6yd169XWXsNPyPiPf3V28jmuSd86ZdfR0ubaRHXZB7unWsGkhU4oaO/eq4huCGCHkj6Ax5QxAsZn+VMzRxxj5N74UZry0WHLW/jZXGfy2hc2KgOfUFSnXpU21pLDfaRuEu1Lldqo5SKbSC1EQte3nwI13+NgxV7vVzO8gfZuA8pL8NlyzlPLPl+sJYm1szs3/5lOFhW4v4k5vVFa9/LXkZIcDU3mJNyffL9cxceJp+2pXXUdnzagxRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDuMENLqY7gZLb4Lw21/ksPVrDuiUgXt5/zUV8lH4UE=;
 b=rAsXpUp02SkbQi7v2yTzk4cXd5odrMCIlbDFw26QHLtH+fLpovPTkmyuSH5A7Sx4EokCnbNS3xDr1puG8gfoqeDTL5qdXo/tvLGz/L8MwR3010nRq9PvVU/D8Po6Xy3UuzaY1EQVkzB6bsuyVDp5lNoe7jK5aTm3IsUPzXJV0GQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:24 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:24 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:46 +0100
Subject: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|DU2PEPF00028D0D:EE_|AS4PR04MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 867032ae-c8bf-45d8-bae0-08de25d4ff80
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ekdBdDY2ajN2Q3FjUkx2UkhGaHBCVlVaYmRicmMvNU1rSjNId1llZm1SdmZt?=
 =?utf-8?B?MHhEMFZpQnBTdFVvMUdkKzJBdC9ycVRrbnVUZmxFczBXVEwycmhCbS9TQVRw?=
 =?utf-8?B?NFFkdElvWmY4Q0hENkVrRm9vTzF4bi9WMDFybG1hdlpmelM4N0ZoT1RZbkdQ?=
 =?utf-8?B?TFcybytBSFMzVUYyNHdwZTNnVkZ1T2Y3dDArNXVHMmJHOHR4cHdxUXNNR1BP?=
 =?utf-8?B?QUtNbTBQcFR0b2dseW5lSmFXdjhMOGZ3S1lCQ2tpMzRmT05XVFMzUXRydUFy?=
 =?utf-8?B?dUgzSkJzbXJob0xMK2NjdFFONGxoZWhWaXpDcDJYNGRTaVp4d0h4SWptUG90?=
 =?utf-8?B?RmlIVDB5aXU1c2N3OUZWMmZJczlGNmhlVkVjVmlOeDZTOWI5bjd4MzhBajZF?=
 =?utf-8?B?Qk9RSyttYUpQakZZUkVocExGTEF5ZUtjM1NSenNJY0ZWVlVaa2tVUjhWaS94?=
 =?utf-8?B?T1NSMDduaTFuWVhtQkd1WG04Y2kvdTdRVzNIVEJ3WTUrQ0ZKNGZ0ZFlCTGl6?=
 =?utf-8?B?MkpqOWE5OGE0SFk4blp5TzU4YlFxRnJXazlHdW01bzk5WFloaGRWODZuUGlk?=
 =?utf-8?B?ZEZMcW5ZMTFBeWlvNGo1ODlRUnJ2eEc2c1g1NGQwdDEwVVdhUnk3WEMwdWNP?=
 =?utf-8?B?ZlJUeHRBbUtDTWc0dkRSYVQyL2tNNGRhRklpL3NrUEZlSW9XYmY1dEZsZDFu?=
 =?utf-8?B?WHNJaHdGTzZpL21Ic0NablVUbzc1VjhydHdCYjYzd3pMQS9VNEwrY1BXR09a?=
 =?utf-8?B?Z1laQ2NVVXJZd1Q5MGtndGdpVUp4WUtKeXNVdWpzWWpTNjY4Mmtpdk1tbmoy?=
 =?utf-8?B?ZkxlQ0FrTnZlSFgxMDRKZFhPdkxpc0xXYndsc0JVVWtpTmwzZVpGRytraEZv?=
 =?utf-8?B?YlNqNkNIc0dnMDBwYm5URUtaZFVEOUtNMDZhT2V3VjE5VXBOWTY0MmpxYUI5?=
 =?utf-8?B?R0R1VnFvRXh3K1QveXFMTnJHZUcvblBwR1k3bVFjOUFZTHhPQzFiVjh6c0ls?=
 =?utf-8?B?eHB6R0pWTVZLcDFmTHVQd2xQZ2dpRUwzWHBsTHNiNzhLVWxTTU1uYVo0eDdT?=
 =?utf-8?B?c1JMam1IY3h4MzlqL2ozQTdibEExTVhCUlVOTUxQNVdERDFYUzlqMjFQdXJi?=
 =?utf-8?B?ek9xa1Uvb2UrWUN4K1FQNVF6Z2lMYVQxSlBTUFVpZmU3RlZKZGkxenZsWVhT?=
 =?utf-8?B?OTRoc3NHcTFWS3RYVjRYMGR2L29jOVUrdWhZb3VuUWxQbUcwR3loVkE3SnA5?=
 =?utf-8?B?dXZWcUFERkFJTlRkUGYvcmtVVktCNzBnNm03aHRwaHFGQ2M1VGt1UDBMaitQ?=
 =?utf-8?B?SjJnTGloVGhGV3M4RFhOVU43aHBpblZIRzRpd3BHOEdVZ2JPd0t1b2ZwTnlh?=
 =?utf-8?B?SmluTkt3VGk5cHFOcUl0NVNUM1ljaFZtSitQckVNNlpNVlZsckdMeDdmcXAr?=
 =?utf-8?B?bTVqODdKanJTMWowVms0KzZ5V0lJUWdHd3BCYUh2RGpnUnY0Q3lFNVBFZzJr?=
 =?utf-8?B?NjZ1THpYa1hqY3pEOUxoZmlqb2FuRG53czRKR3RySzZXMjRFa1N3VEhWRG9B?=
 =?utf-8?B?MnVuVS9ER1N2UVhMbzhWNWpBZGd4WTV2WXJ2dkpZSzg1NUNpajVCV1ZEbjdr?=
 =?utf-8?B?TlBTOVNJM0l1YWxzUFRERW15UDU2Vk1SaUdwanFRMFlKVHh6bFM3T0pwUHpD?=
 =?utf-8?B?SlBac3hETVVwbGxhWkJuZFUyZkpCb1Mrem5ERkkwN3RycE95S2dMOUtBQVFD?=
 =?utf-8?B?eTZQVnVYcnFiZHluU0VwQWh4UDJTRUU3T2gxOXBiZFVlSkVxbno1dk90aWxx?=
 =?utf-8?B?WHJldlVqVUxZbmJnSS83R0pKRzNpZXJGZUlzOG8yMkVTY1lwSHhJc1lPclZF?=
 =?utf-8?B?cUErUWhsQmRnR29VSzhsZC9ZNlpOZktNeXE2RmVvM3dNcEJVZWs0Yjl0OHNi?=
 =?utf-8?B?NlI5czBzZmhpUWlsUHJjVHBGNXFML2libmlQMFB0K2xmS0pYOWpxZHdsUHkv?=
 =?utf-8?B?TVNsa3NqSy9LV2dsMnNkMXl0dCtiS01uUkxuRXluZGJrZkg1N3Y5ZjJEelc0?=
 =?utf-8?B?R3ViemszNVJZb3NhMHFiQkhyOUVPNUYxZUpDUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 05a40e983fd14c49bfbf78dd6f1701ab:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c4a9c629-c3d9-461a-95a5-08de25d4f14a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0xLUCtkNHMwVGpvRlkzL3l0UXVBNkt0NVpQR2MvNmJ2eWxSWVR3dXRGdjBj?=
 =?utf-8?B?ck1RbUtDclg1OFFqTlJvN3BRZGNuMnFheXVIMzZDUndaU0NYeFVSWUwxUno4?=
 =?utf-8?B?R1MzNkJVMVlzYjRjby8zcFF2WEJUODJtMkZmYUlWbjVFWkkvVTJkb2oyb1k5?=
 =?utf-8?B?Si9RQUhjWll1ak5ZVDlYREpUZndaQm1uYm02eGNYVVoyZlBkNFc3aVRQajJa?=
 =?utf-8?B?RDZmMk1ZUGtFb0d6OUhtcmNsc1Y4NzNhZHNMN0loZEN0dGxmV1o3UzRSRkJT?=
 =?utf-8?B?RHhuaU1xczd3aEdaUWZCTTFISXI3TWU1YU5CWjdFdGpJZlE4OEhBeE5GZW9p?=
 =?utf-8?B?R1ZIelhTeGxsanJpTWw3cCt1L3ZEdU15b3RudmNka3FQYWIvaEl0TFpSQTQ5?=
 =?utf-8?B?aDJaem5TZW1Zak40bWxWZmZQdy94STNvQ01LQXR4THNSYUJTUVg3YVpFWHJr?=
 =?utf-8?B?TVdGbXpyaHd6OGdNR1FrV0FTQUNrMkduVmFvYmtCOC92OWEyS1Z4RXNENUxr?=
 =?utf-8?B?cGZIV1RLMHYrd1IwOW1TMXRvc1N2eWxvTEhoVDJqUW1QNXBqT1lRVkpNOU14?=
 =?utf-8?B?YlJWTGoydzhIWWEwV3BFbUM0b1ZuWmVMcVFuekR3SXhtalBsSzlaRW5IMFlK?=
 =?utf-8?B?OU9YTExrRUcyK0VvN09oYmgxYWNCaVcyMFJvNHNMeWhHbFhvNU55bmtWOEY3?=
 =?utf-8?B?Mk5NYTRLRk1ZUVlPZUdybEF2Z1E0cjFkbXpLK0d6M2lBc0gvQnpjL1JOTjk2?=
 =?utf-8?B?RnJQYW80bThsa05YbDJrcnZYWWZ3ZzZ1ZE5vN2hFeHB5UUdrZTRsTUsyYWdo?=
 =?utf-8?B?OGRyeEdRUnFpbVJKa1gwUE5rbUlLcGFsVzFXQzQ5eFJBcFR2b2dhRFIrK2Vh?=
 =?utf-8?B?WVZtbjhDUGQ0S25nRkROdmZuQzJFZEJBcW1xS1pXV2xRT1lmTk9FamJHcnBm?=
 =?utf-8?B?NXlHMHhJRmppL3V0TlZqQkUrMldXMzdYa2Q5a2FEMjVqdVBMSzFDQk5NQTNo?=
 =?utf-8?B?Yk04bkQ1ZUxuZWk0V2lRSnNUMVlEY01HTVduOTJubXBaYlEvN2RJc2lnQzBE?=
 =?utf-8?B?Z2NVemN3aVFEeGtrcFRQcUF1ZnZCZ0dTMTR4c2Z4elZxbW5Yc1JONnpFempi?=
 =?utf-8?B?R0VITjJEbWtadG9RTVhIVXVHUzBtSURKdXZQSjg0U2h2YXpxNVlYQm5qdlpi?=
 =?utf-8?B?Z3BwZjZjMUNTdFp4Q214djY5Q0pIMmlNTWhBM0hOY3lOTk5hMjl2U2R1ZzhY?=
 =?utf-8?B?TmpWZVpBS3VTRnQ3b0dwbG9CNmk4TkI2bG5FNGVDN0dBSkVmRi9aNkN1eDJD?=
 =?utf-8?B?UEhCSUh3WndONDRmUTRzV28raTlYOFh0TjVoU3phNFVlU3V6MCtlUkcrckRD?=
 =?utf-8?B?TG5sNUVzTzhqYnZqcEdIL0ZkV3hiRzZLREo2QWcyM1RmOUJibStLdmpiSEZO?=
 =?utf-8?B?di9pcmtlcWhtUndnREttWHNLM3pFM3R2V1dlcHNkQUVZTVVLNURzRStvT29q?=
 =?utf-8?B?Y0NPanoveTFHYVJ5ekFTbm5DVkRseHY0aWVlVzhLQmRmR0JJdkFSbXU4MnNo?=
 =?utf-8?B?SlJYUHFnWXhhSHNrR1B0bXpZOHM5WjdXWTQva1VhNTVrbEwwK0tRcnNZQXl3?=
 =?utf-8?B?OVZXd0ZIUGlwRzkydndRZGwrdUg5WG9YYlhKVXREMHpEanQvclRVWGdxOWNN?=
 =?utf-8?B?VGVyT0M1UlB1eGpxNi94ZGtIMlkxaWt4elhINmRKRndoUStkeC9yZWF2THNk?=
 =?utf-8?B?L2FlWVZtVHZGd1BRODJxSWRQMlg1UmNFM2o0QUt0RHRROUxLNWZvSmUxMGFq?=
 =?utf-8?B?RVRKQ1padHk2QllYTUdrUXQ2MTNnQ29aUnk1NDJzLzFLcVpGUVhEQUZQeVhm?=
 =?utf-8?B?K2tFWGkrd0tPcXJoTnVjblpxK0JndzFqZlBLeVlkM0dONTNjWUFLL0d6L2Z2?=
 =?utf-8?B?YlBsbWVDL0NiYTBjcnpIdGJKbGRSNGVWaGlFK0JKdmJ4WjhGUWc5N0pqMlpl?=
 =?utf-8?B?MXRDeDlrZGlnUlB1aWN2MkpKWG8zTUpMdVlNUDV1cFhISmZIVFh5b0ZxSVd1?=
 =?utf-8?B?c3krZFRDTzR2WXVFZzR3NWhWamhVVWVJUzhFRnhaY3BuS3pKYXN1Z2wrcTlj?=
 =?utf-8?Q?x4UnBvkXt3n6m6+V9yu6wb4NI?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:48.2672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867032ae-c8bf-45d8-bae0-08de25d4ff80
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9689
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

Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
support GPIO providers that may sleep, such as I2C GPIO expanders.

This fixes noisy complaints in kernel log for gpio providers that do
sleep.

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

