Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B7B93F00
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8910E529;
	Tue, 23 Sep 2025 02:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CzGpKRvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9FB10E528
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGswu/YK4b357K7EzkqdUiFrdAjS9fve+POLfDx1E9ronWaLv52ecGwUBAgqdBKHY73Wy8nE8GJIbe8jkarNFPjmlWuNaQ+pYii1lhiSdNW4C4YE9nt4vjLG3ZJA70EMTM8ChE6cC5EqsdgGS9c7raqgcItazP9TYTCcHWQ/Dng5lCphgcKXcbY9uVjnVuAh2qwtElGCiZWnkG12rrLeGq3kuSyEXMbmPygMTs0nV1ybmjElWPUftVts39j4lpmt65ibm1r9ustfD1KOHt6YIvQ4SxnfHt59uduW15oCGTnGNwV3dUOJUz9jig8GfHNGTyZVj8JGB6pmwhTP8q7/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEqcFz3pm55Od+WgSFCf1CIR1Y52c6Z2BE627NIETTM=;
 b=DbWb+IKl7x/TmFBCHkUjHDrYfYTMFZMTeYzGyFnTubojzwEmng20AR1IFB0RiT0Tx5PySkOXe+qD1TGnKNQjMfO5vUJHHjL85ZJZZGYBMnTaHUe2YTDzLFfqLi37d72MSxgu99RxWsq6r1h3KqRmu3WOmjAPVz+f79kdlPSAd+l3nbvxhgwJTqqciZAPXij4iReZuiiVv72p+xy3yH2qhCxYRz+phISY0it6GXULN5UfHe42O0BqFwHxdxNvrv2KEmAvpmeyFkOWeTmAeCVfMpl7gOqcQ5fULMxEmrTAeSAv8PdK9zg82A6k0TBZM2uB7fkog1VpDNNICF8eM8Z6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEqcFz3pm55Od+WgSFCf1CIR1Y52c6Z2BE627NIETTM=;
 b=CzGpKRvy0vW1rjwZZldUnqIUz7jdCzQ7BUKtRTu2yMIwIKtG4g0fDHbJ3IEkHfZ49KNWDY8cZug6BjLV03RKR+MnMIyAFFsS7c+8JwQo4uYCzdDDNx5VPbc/DboW48HPsp3Y2Wuy5PxT6dwUU6RC3nFKF6BYcuzt4GxXLFUYffdhxlKB13ujgt22QQv+ryfGNfGL36Jm+Zgar/K2AJzbPQxuPlRyFbG/dOcGdFGjdwo0gv6tl9+Kqo+hL13SG10dJBkolNCjIsXBI4JwDD8Ekte/d1nnNJZU4iVvHX4sM21i6Or2YKQkApboMzhEssQPI11GuJULYuCBVnEXvI8nwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:26 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:57 +0800
Subject: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 026a9ee1-a258-40a2-b5a4-08ddfa45f152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTUwSW9odDNmMGhrNmlQOC92UUlmdHpVZmF1TFd1QkhpQ3NiWGVYaVp1NDlt?=
 =?utf-8?B?NS9USDgwY24wNGYzZlMrMEI5ZXJtVE5kMEx1Y1JPMnJPVWd4WmtRcE9OdytU?=
 =?utf-8?B?WVBwY0d1aXNMR3V1QjQxM2dyVjZxdld5S3BPYU40QzVMOE92RWVPa1Uzb1lu?=
 =?utf-8?B?dDdwOWg1dnVWWVl1aUI0UStJckhZdkNDYVZnWGpVenA1dUlXcmJESEk0VEJX?=
 =?utf-8?B?ckloTVdhbmJoSHJqcTFtcGNFNFhnMkpkVlpMdGF2ajlpNklYaHIrajJva3hU?=
 =?utf-8?B?NHpZQkxVYzFla3I0eDBsV2FncTNYTU9tZFoxNGFYQ1Q3K3hHcU9PYnVnWTRX?=
 =?utf-8?B?SDc4dkVxUVlEWUtZMFV6bzlVQ0FiS3ZSQldjVk1tWG81SEVaeHhJQ3FwenBs?=
 =?utf-8?B?SkIwOWwwYmtSbGlRVTNCTzN2eVc2V3U2UmNlL2R6bUdnUlJZemdMQnV4dCtl?=
 =?utf-8?B?d1NVWmt3bUk2Q1FmdGQ4NG5uTHo0VkZUSW9hSW5lK1c3cUk0TlpueUwyL3g2?=
 =?utf-8?B?dzVoQngyTGhNYWFuZHN1Zjl4WWlWc2VWQXhOZXpIZjZ3dnpJM0tkM2tQMUpP?=
 =?utf-8?B?YnVSem5abldnaXF6K0lyMkhWZzZHRzhRV0hCQ0FvNWRucTZwaXRmUEhYcGxX?=
 =?utf-8?B?bVpST20wRFFDYmw5bXFDS0JIdnExakwxdGdtcGh0SkMzOGxoaDVQVHNOaDNF?=
 =?utf-8?B?VENXOWlDWFkzMHNxblhtWkRKTDVpTlBTd2N0N0NGU3c0c3F6ZEt2WnZjSCtj?=
 =?utf-8?B?WUEwc3dIcUhxb05WZktRZkQ1eUpKWmJSWEo0ZklRNmowemxVckRIYU15aDNy?=
 =?utf-8?B?RDQ0S2ZML2ZKTlRjNzZoUXArNlJZQ1BNY2Q1cEJsS25yNk1CUlNjQUZyOTNo?=
 =?utf-8?B?YmFzakU3NHpWQzM1UGRidU5aYkxGbzVSS2tGek9GQkJHN2tzN2ZHZ212bjRN?=
 =?utf-8?B?MkR4YURSRllaRENkQlQ4S0dYOENEYzk4RU11V2ZCKzBVa3AxbEVMMVJNWkNi?=
 =?utf-8?B?MzNHYXhoUENwaGVyVW9OWE5Yd3NVNSs1Y2tTT0tGdnU2QlNjeU9JZ204dmgy?=
 =?utf-8?B?TnBJQTNaOVd0V0U2RHZXU3ZxaEhRbmJvcFBWc200V1Q2ZlAvYzRMVHZOYmY4?=
 =?utf-8?B?Y1puQkw0U3pGZDBLVzY2MHpNUkJKdFE1TklReUg1Ky9PRmE3TFRTUFNJdXEr?=
 =?utf-8?B?WmlnVEh3ZnlYZTBWa3hRcWdzWnRyMkZuZ2plVzMwbkcyVW1FaVVmcnkwMjhw?=
 =?utf-8?B?MlFocERkNEJsTHRMQ2dZMjIwT0xPYlJhOWZIV0x1WW9YT3NCL0lxMGJUSG1E?=
 =?utf-8?B?bUxCbTlOcjBnZmVQY3RmNEJDMDFZQm5ma21vVkIvTDA5WWdYR1hrNnp1dmJD?=
 =?utf-8?B?WGVFZWxJQTluYTRSUlgzSWduZ0orWTBlZnl4TG83KzlpbGlNeFJOZ3NEZFF4?=
 =?utf-8?B?dGZFZ1E2NG0wNmVqbng5c0lJdzVzVERTc1dxTmtqTzF2bThVbU5XNDUzbDRu?=
 =?utf-8?B?LzZmZGxqa25QUkNDQXFPblJ2UmNuOXV3UDJUNXlFcW5xb2VIZlozNmxmSDlS?=
 =?utf-8?B?S1BwemNnMUZkcmRTM0hEUktIVUUxRC9LbUFvRlpVOE9kL3hJRm5wUnFGbTVF?=
 =?utf-8?B?bHRuOWhIMU9PeWhvQlQ4OFpudndOa0pvVElXVVp6TTZUUWxMOG5nSGJacEhP?=
 =?utf-8?B?SGlRMm1qK0xKNWUvM0xDVUJTc28rZEcxUTZyZStYcFc1NktSc0Z6N1lsMzlI?=
 =?utf-8?B?RkpocGpZeCtTYks0cS9NaTRFV2QxLy93R0w3WUFwNHVUaVNWUlVmeXIweXlP?=
 =?utf-8?B?UVhCWTdnd2VkeE9xSGpVZFVsdnBiam5GbFRQZmdNU3o2Wnp2b3pWRTRac2cv?=
 =?utf-8?B?M2VsbDZrNzJNK2phV05BSE1OdXdUTjZyRGxuakNOcUc2aHh0cHcxeDd2N3Fa?=
 =?utf-8?B?ejZ4ZnMrMTJmais5c0NOK0xsV1FLMEtTeHRnK0JBaUl2Tlh6L2JySUl0MnBC?=
 =?utf-8?Q?2R1WhJjdRijQxk6joKbNCd33BqpiEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RaVGgxLzlhSFlUTG1aUDBjcituWkZBZnV6NTBzd28wckY0QXRXTE9YRVR1?=
 =?utf-8?B?UmZsNXNBTDdBdzRJVHFVRnZsWEdjZlBwcVF0N3pOUUJQR29jZnFnSmg3Z1Ro?=
 =?utf-8?B?c01mYlFlSGNWWk1KaGZET3Y4d3JQeitxL25EVlMyZ2hxS0Y2Mm4wUTlHQmlM?=
 =?utf-8?B?SE8wODdtblJEbXBHcll3dEFtSGFlNzV4Q01XZHoyZVc3S1lOa2tjT1NzUDUy?=
 =?utf-8?B?OFVCamhhaGs5ZWlYQ0RiL1puZzNwd3VMeFg5VzlyVGJEeERpeGV4UGF1Zi82?=
 =?utf-8?B?UmYzY0VKR000MWN6K1JJK093TmJkd1Q2b0t2dkZ1bmFpSzdKanA3Q000RXBS?=
 =?utf-8?B?SVdYQWJ3SkZROTVaL3RrbXhKRmlYdXlqRlBhUzBEdzlYZnRmS2t4bHFLdnE5?=
 =?utf-8?B?UjFORGJ1WUdmVVlVZ2tqUGdxc0p2NnVkeXo3M2xybSs3T1R6TWtEeFRaUmJp?=
 =?utf-8?B?VmQ3RlRjZW4vZjBnK3VmclRVblZsYm5CNmgwQVpRRGwvQ0l2OVJIL3FBOWxn?=
 =?utf-8?B?c2hmMVJMK1dMdkM2dnZyNHZ3c1pRMlIrM3pOM3QxQkUwZHhYTWNyUGtwYS9I?=
 =?utf-8?B?WTVSTkR1RG5vMWI2d3RlWFJiQmJUS21KRk5CMlpHZlN1Uk4rQ2JDUFU3Z3NR?=
 =?utf-8?B?MU5yWlErZnNlendaaHAwaWxjVTE5aTBDSDVMVHU4VnRFQUhTOUFYN2N5MnJM?=
 =?utf-8?B?RnJCTUM0S2pON2RSVWorOVhaZkt0dkx2d3VBampHcUtUVWFSVHRWU2xMc2Jk?=
 =?utf-8?B?ZW9QZlhzODlUNlcrSEZJNzloKzhIVTBxWDVKaW9RWmJTL3lFam9Vc2VRK1N5?=
 =?utf-8?B?WEJFUXJGWmZOSEN6RkNPOEh4Q1FsRnUzQjY1ZFhaNDRmMWU1YTJlSDNmVVRy?=
 =?utf-8?B?LzFIWExOUnZqMHd5RExiVmo2S2FTYlpoa1d6VERzNTZXOGhWUWJrV04zS0lJ?=
 =?utf-8?B?dERlc21uaXZxckdOQlRzcmRrblRReFN5NGFBcXloUzZwWGVhQjViSlRrRlQ3?=
 =?utf-8?B?Nk15aFI2TzVUb3A2dFVCeXhFamplOURYMU14aEFpall1MHJNV050Z2Z3c0ts?=
 =?utf-8?B?ZGo3MVNFbkJ1WlBvUHpVZnFOOE53TisrL0RYcDJoOVFmR3plR0FXSk9yK3g0?=
 =?utf-8?B?RElsRHlsSHBieVBGNHZJZVVJL0ZtYUdFd081TzFVTWZQbVg5eHRvQUhNQWsx?=
 =?utf-8?B?T3VlMWtDTFd4WkNldFdoSUhCVnJEZUNVcFQ5UWxZZ2VTbXpmSXRKUEh3NHl3?=
 =?utf-8?B?TGFVZkd5bVBLWUI1amIxOE5NbXNUNnFtRXArUTFkZlEwaEVKa1g2RWlveVN4?=
 =?utf-8?B?RFZwS0dLYUtYQmJJUW14WmRxRWlmb2w4SHFsM3FZSGJhcHBmOCtqbEpIcUkx?=
 =?utf-8?B?b3VhMkFqUGdRRWNDZE9sTE1EU2JkTTI5YlhSTWZSTjhQUkdRbVY0WXE2SjVz?=
 =?utf-8?B?NVdNY2xWUkowL25QU1d6RHNRMVp2YVpyMXYyZVZlOC9HdWRlb0pFbXk2Ky9P?=
 =?utf-8?B?S1k1eXRDUk5EMVMrZ1VBcks5MUJodjIwNll0U2ZtSys1dWhla2FjSjRuWENK?=
 =?utf-8?B?dVdTZkJsUDdmaldmeDlQL2J6dDgwMnp4Z2RmcTIrTlg4NGxFcXlJT25WNTFN?=
 =?utf-8?B?b3VlL3hrNTlqSnUxZnhQdkVHWkFUWU1JbkFNQVQrM0FkNTI0MGlOY3ZSZFF6?=
 =?utf-8?B?cDltT3BEaG1Jd09KZkdFSGR2Sm1sc25ieUpnaDBPTFRWRU5Hb2ZUcWZmMktP?=
 =?utf-8?B?S3BUeDJ6MHdhR1d2ZG1IZkxzc0dISVl1SEVVeThiS0NYMlc2RXJpdWFKMjVj?=
 =?utf-8?B?andROW1jQ1ZaYlVja04rMVNVR1RGSHF2cWE4Wm1kMS9HWDBQcjVwUVRGSlZr?=
 =?utf-8?B?d1VPd28rUlVvZkFTRlh6RE92MzAwL2pMWXZvREtRME1qamRHSTFSOGhLckVP?=
 =?utf-8?B?OXBnSzRkVC9wUWdDUEo2c3gvY0VKaUcyekt0T3RHYU9WN3pKMWhzTXZ4NVdy?=
 =?utf-8?B?akljOXN3K1ZkMHI0aE1ZVWxBZ3RMTTNxZUlybVFRaURGUTJRVEtmL0JtL3B2?=
 =?utf-8?B?cU9zeitCQ2l4WGlzM0dybVVKQ0FsZXN2RHI3UG5wTjJrM1QvTXB0dDE2VTZ3?=
 =?utf-8?Q?8U73lBnUjBjip4yA95c/4CQch?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026a9ee1-a258-40a2-b5a4-08ddfa45f152
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:26.6149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeWJokyZZypI14BVYiMYs/HjE3mxsUVNcR8cj+IkgRg6UAnM8i8tAUsYp3sZ5qitRnk0eyipnckA4jFGnd85mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
It fetches display data, transforms it to linear format and stores it
to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
a gasket between the RTRAM controller and a FetchUnit.  Add a platform
driver to support the DPRC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Manage clocks with bulk interfaces.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
---
 drivers/gpu/drm/imx/dc/Kconfig   |   1 +
 drivers/gpu/drm/imx/dc/Makefile  |   6 +-
 drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
 drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
 drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
 8 files changed, 522 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	depends on IMX_SCU
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf..fd5d62783971d575cf18d3e27d742d91dee7623e 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
-		    dc-plane.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-dprc.o dc-drv.o dc-ed.o \
+		    dc-fg.o dc-fl.o dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o \
+		    dc-pe.o dc-prg.o dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.c b/drivers/gpu/drm/imx/dc/dc-dprc.c
new file mode 100644
index 0000000000000000000000000000000000000000..c6dcc0f820ebd569542df51bb9088dd9e71d24c2
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dc-dprc.h"
+#include "dc-prg.h"
+
+#define SET					0x4
+#define CLR					0x8
+#define TOG					0xc
+
+#define SYSTEM_CTRL0				0x00
+#define  SW_SHADOW_LOAD_SEL			BIT(4)
+#define  SHADOW_LOAD_EN				BIT(3)
+#define  REPEAT_EN				BIT(2)
+#define  SOFT_RESET				BIT(1)
+#define  RUN_EN					BIT(0)	/* self-clearing */
+
+#define IRQ_MASK				0x20
+#define IRQ_MASK_STATUS				0x30
+#define IRQ_NONMASK_STATUS			0x40
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR	BIT(7)
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR	BIT(6)
+#define  DPR2RTR_UV_FIFO_OVFL			BIT(5)
+#define  DPR2RTR_YRGB_FIFO_OVFL			BIT(4)
+#define  IRQ_AXI_READ_ERROR			BIT(3)
+#define  IRQ_DPR_SHADOW_LOADED_MASK		BIT(2)
+#define  IRQ_DPR_RUN				BIT(1)
+#define  IRQ_DPR_CRTL_DONE			BIT(0)
+#define  IRQ_CTRL_MASK				GENMASK(2, 0)
+
+#define MODE_CTRL0				0x50
+#define  A_COMP_SEL(byte)			FIELD_PREP(GENMASK(17, 16), (byte))
+#define  R_COMP_SEL(byte)			FIELD_PREP(GENMASK(15, 14), (byte))
+#define  G_COMP_SEL(byte)			FIELD_PREP(GENMASK(13, 12), (byte))
+#define  B_COMP_SEL(byte)			FIELD_PREP(GENMASK(11, 10), (byte))
+#define  PIX_SIZE_32BIT				FIELD_PREP(GENMASK(7, 6), 0x2)
+#define  LINE4					BIT(1)
+#define  BUF2					0
+
+#define FRAME_CTRL0				0x70
+#define  PITCH(n)				FIELD_PREP(GENMASK(31, 16), (n))
+
+#define FRAME_1P_CTRL0				0x90
+#define FRAME_2P_CTRL0				0xe0
+#define  MAX_BYTES_PREQ_MASK			GENMASK(2, 0)
+#define  BYTE_1K				FIELD_PREP(MAX_BYTES_PREQ_MASK, 0x4)
+
+#define FRAME_1P_PIX_X_CTRL			0xa0
+#define  NUM_X_PIX_WIDE(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_PIX_Y_CTRL			0xb0
+#define  NUM_Y_PIX_HIGH(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_BASE_ADDR_CTRL0		0xc0
+
+#define FRAME_PIX_X_ULC_CTRL			0xf0
+#define  CROP_ULC_X(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_PIX_Y_ULC_CTRL			0x100
+#define  CROP_ULC_Y(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_2P_BASE_ADDR_CTRL0		0x110
+
+#define STATUS_CTRL0				0x130
+#define STATUS_CTRL1				0x140
+
+#define RTRAM_CTRL0				0x200
+#define  THRES_LOW(n)				FIELD_PREP(GENMASK(6, 4), (n))
+#define  THRES_HIGH(n)				FIELD_PREP(GENMASK(3, 1), (n))
+
+#define DPU_DRPC_MAX_STRIDE			0x10000
+#define DPU_DPRC_MAX_RTRAM_WIDTH		2880
+
+struct dc_dprc {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct imx_sc_ipc *ipc_handle;
+	spinlock_t lock;	/* protect IRQ registers */
+	u32 sc_resource;
+	struct dc_prg *prg;
+};
+
+static const struct regmap_range dc_dprc_regmap_write_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK + TOG),
+	regmap_reg_range(IRQ_NONMASK_STATUS, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL0 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_range dc_dprc_regmap_read_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK_STATUS + TOG),
+	regmap_reg_range(MODE_CTRL0, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL1 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_write_table = {
+	.yes_ranges = dc_dprc_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_read_table = {
+	.yes_ranges = dc_dprc_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_dprc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_dprc_regmap_write_table,
+	.rd_table = &dc_dprc_regmap_read_table,
+	.max_register = RTRAM_CTRL0 + TOG,
+};
+
+static void dc_dprc_set_stream_id(struct dc_dprc *dprc, unsigned int stream_id)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle, dprc->sc_resource,
+				      IMX_SC_C_KACHUNK_SEL, stream_id);
+	if (ret)
+		dev_err(dprc->dev, "failed to set KACHUNK_SEL: %d\n", ret);
+}
+
+static void dc_dprc_reset(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
+	fsleep(20);
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
+	fsleep(20);
+}
+
+static void dc_dprc_enable(struct dc_dprc *dprc)
+{
+	dc_prg_enable(dprc->prg);
+}
+
+static void dc_dprc_reg_update(struct dc_dprc *dprc)
+{
+	dc_prg_reg_update(dprc->prg);
+}
+
+static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
+{
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+}
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = format->cpp[0] * 8;
+	struct device *dev = dprc->dev;
+	unsigned int p1_w, p1_h;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+
+		dc_dprc_set_stream_id(dprc, stream_id);
+	}
+
+	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
+	p1_h = round_up(height, 4);
+
+	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
+	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
+	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
+	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
+	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
+	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
+	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
+
+	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
+
+	val = LINE4 | BUF2;
+	switch (format->format) {
+	case DRM_FORMAT_XRGB8888:
+		/*
+		 * It turns out pixel components are mapped directly
+		 * without position change via DPR processing with
+		 * the following color component configurations.
+		 * Leave the pixel format to be handled by the
+		 * display controllers.
+		 */
+		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
+		       G_COMP_SEL(1) | B_COMP_SEL(0);
+		val |= PIX_SIZE_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format 0x%08x\n", format->format);
+		return;
+	}
+	regmap_write(dprc->reg, MODE_CTRL0, val);
+
+	if (start) {
+		/* software shadow load for the first frame */
+		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+
+		/* and then, run... */
+		val |= RUN_EN | REPEAT_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+	}
+
+	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
+
+	dc_dprc_enable(dprc);
+
+	dc_dprc_reg_update(dprc);
+
+	if (start)
+		dc_dprc_enable_ctrl_done_irq(dprc);
+
+	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
+		width, height, stride, format->format);
+}
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
+	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
+}
+
+void dc_dprc_disable(struct dc_dprc *dprc)
+{
+	dc_prg_disable(dprc->prg);
+
+	pm_runtime_put(dprc->dev);
+
+	dev_dbg(dprc->dev, "disable\n");
+}
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
+{
+	dc_prg_disable_at_boot(dprc->prg);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	dev_dbg(dprc->dev, "disable at boot\n");
+}
+
+static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
+
+	dc_prg_shadow_enable(dprc->prg);
+
+	dev_dbg(dprc->dev, "CTRL done handle\n");
+}
+
+static irqreturn_t dc_dprc_wrap_irq_handler(int irq, void *data)
+{
+	struct dc_dprc *dprc = data;
+	struct device *dev = dprc->dev;
+	u32 mask, status;
+
+	scoped_guard(spinlock, &dprc->lock) {
+		/* cache valid IRQ status */
+		regmap_read(dprc->reg, IRQ_MASK, &mask);
+		regmap_read(dprc->reg, IRQ_MASK_STATUS, &status);
+		status &= ~mask;
+
+		/* mask the IRQ(s) being handled */
+		regmap_write(dprc->reg, IRQ_MASK + SET, status);
+
+		/* clear status register */
+		regmap_write(dprc->reg, IRQ_MASK_STATUS, status);
+	}
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load UV buffer ready error\n");
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load YRGB buffer ready error\n");
+
+	if (status & DPR2RTR_UV_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO UV FIFO overflow\n");
+
+	if (status & DPR2RTR_YRGB_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO YRGB FIFO overflow\n");
+
+	if (status & IRQ_AXI_READ_ERROR)
+		dev_err(dev, "AXI read error\n");
+
+	if (status & IRQ_DPR_CRTL_DONE)
+		dc_dprc_ctrl_done_handle(dprc);
+
+	return IRQ_HANDLED;
+}
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width)
+{
+	return width <= DPU_DPRC_MAX_RTRAM_WIDTH;
+}
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+
+	if (stride > DPU_DRPC_MAX_STRIDE)
+		return false;
+
+	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
+		return false;
+
+	return true;
+}
+
+static int dc_dprc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	struct dc_dprc *dprc;
+	void __iomem *base;
+	int ret, wrap_irq;
+
+	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
+	if (!dprc)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&dprc->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
+	if (IS_ERR(dprc->reg))
+		return PTR_ERR(dprc->reg);
+
+	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
+	if (wrap_irq < 0)
+		return -ENODEV;
+
+	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
+	if (dprc->num_clks < 0)
+		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
+	if (ret) {
+		dev_err(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
+	if (!dprc->prg)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	dc_prg_set_dprc(dprc->prg, dprc);
+
+	dprc->dev = dev;
+	spin_lock_init(&dprc->lock);
+
+	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
+			       IRQF_SHARED, dev_name(dev), dprc);
+	if (ret < 0) {
+		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
+			wrap_irq, ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, dprc);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	return 0;
+}
+
+static int dc_dprc_runtime_suspend(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	return 0;
+}
+
+static int dc_dprc_runtime_resume(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_dprc_reset(dprc);
+
+	/* disable all control IRQs and enable all error IRQs */
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_dprc_pm_ops = {
+	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_dprc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dpr-channel", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_dprc_driver = {
+	.probe = dc_dprc_probe,
+	.driver = {
+		.name = "imx8-dc-dpr-channel",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_dprc_dt_ids,
+		.pm = pm_ptr(&dc_dprc_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_DPRC_H__
+#define __DC_DPRC_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dc_dprc;
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start);
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
+
+void dc_dprc_disable(struct dc_dprc *dprc);
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_dprc_driver,
 	&dc_ed_driver,
 	&dc_fg_driver,
 	&dc_fl_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
 
 extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_dprc_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
index f37bff12674ae792dc35a1f27cf754df4c372f20..ff80ec73677ffe643962529dc4b7b2057196a467 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.c
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-dprc.h"
 #include "dc-prg.h"
 
 #define SET			0x4
@@ -63,6 +64,7 @@ struct dc_prg {
 	struct list_head list;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct dc_dprc *dprc;
 };
 
 static DEFINE_MUTEX(dc_prg_list_mutex);
@@ -216,6 +218,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
 	return NULL;
 }
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
+{
+	prg->dprc = dprc;
+}
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
+{
+	return prg->dprc;
+}
+
 static int dc_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.h
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
 struct dc_prg *
 dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
+
 #endif

-- 
2.34.1

