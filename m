Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17ADB93ED9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE84210E51F;
	Tue, 23 Sep 2025 02:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WGNP821T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115F210E520
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQh60cCkA+oUSkEo4s4LySeeootyPt3sBCFL5zvUpuBmXrKoytjD4ydIR664hprPHpyW8MwhGrQty9/ocfG7yO2Cz+PX+Gu2xZrgkmQKFnVHprTwLWsBi1FI7eP0pY9LjsVYIJoFN1x+EP1sSAWH9ErfIxGvq+9Q3beQgQMwiCfbaSl0EfxViW304oStC/dbarkLomdGpDte3nO8Vg/C2s9qL6iePwdh9XiOMlsb9HRgRsJJUhvyPLvJgVr64lqhxCly6PFcDYgX2Yc/u45KLqnOJbnfOnR9DPPTT2gfQOEofWGRwwmhmWagAPLTNLaqdadZYNQWCesKzJkIIOjRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=mVAeJkgWFoSKGjBDLgTqNQoA1oVt8jAIhGYwNCc0hzz8dTmgn3b5cttFYwKKS/q8BBVPA1eBilOyPFD9LGfg9S84ljq2pTv1Fb/FXuVAUIqe+8FSGD0YQ7UapinXN9cxUw60SIidAK3/LFbJ5f27QJmtMuw28dauXTvb9Ga2UsXM3jOhY7bRruAv+18hk1QDtTPxVu69ewqz9UvjCTGioW+1zdlv96pYVUqGyJawk8zYzXv+YcfahG6Lesc4UdRw0qduqegKEBLjo32YjUSIY7zSufSB0V5ZG9EyhB23SJho4x4/f7gZ7Za4qYAc9P5Zwe2lMq5WOcIpewb5oc8yYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=WGNP821Ts5Ro3teF0rR4BoXoe4r62td7d3vtktqBBvFDuJmhN2l+z3JYiZoxBUqTs+WqAIYWmI9pq6NW7Gq9D0JJPxjg30rfhj62vt3gbLjZKIF9RLyZxAcre5F3gOTW2jogHZ2xwjOyrNaY8SqQq4pCUzyknw0/W568AwCmTC03z10xSSTLNh0ltqwfsJf/hosCl91Z/JDPc6RQMiR2eEKZAwOD1hbJ0KRDVVrQkzF7W1iHGnah6RpdYoDq/EVT460ZBOLEmNDui1VxGYGD1t+8g+yC8i7J62SxPTvsTtI2UPmr5NXfytOy8dDP6/b8JnzOO/Bf+idHiWKclKQnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:06:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:06:51 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:51 +0800
Subject: [PATCH v2 01/14] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-1-5d69dc9ac8b5@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb00b47-548d-43dc-5144-08ddfa45dc59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzNyc3F5TGxMQS80WTdKNFJ3Q29EQVVZUnZVekVzdndMZFEwRHJaL1pXellr?=
 =?utf-8?B?OGdRYTErZUdUamFuM1BOeDJKZmNwQ1ZlRW96c2JLOTNFWnVjQnV2YnZ4V25a?=
 =?utf-8?B?SEFqSmpPSHRJdkdKc3NDRU8xdHlrcWpNMmRwMHBRNzBkanIwWlFvUjBNc2Y4?=
 =?utf-8?B?SEl1VW1TRWhWV1Rzdlpxb3piRW1RN2U1S1hIbGE0YmpJK2NsU0Z5SEV1c3ZW?=
 =?utf-8?B?VmdOSjJFenZJMTVURDFlYVFMR2xqNUVxT3daejQrRVBTY21jVE5MdHN1VDk4?=
 =?utf-8?B?UlhBT3VaRHB3UGdwZnhIOTIrRjdnaURIOVkrOERqNzQrZzVUaXNoN3lPOVpO?=
 =?utf-8?B?N2k3RzFpSXE2L3FmbHdxLzEyNHZjUnpVR0tGNWI2eUk2VndHd05EUW1SeUpZ?=
 =?utf-8?B?RG83Ti9hQ0ZpbUtGekVXV2xZdU5HYm5jaDN3TWdmSFBRUTl4ajJaVFZTV1I5?=
 =?utf-8?B?V0NXU0hWT1ZuQ21vUEtpcSs3Slg4Z0FKb0lZOGdXbjBCVXRObGphN1R1TGQx?=
 =?utf-8?B?K0FoT0gzdDBMTzUvalUrRUpyL3RQbXFkTTI0WTVBR1VENHZKNThaOVpTL0pU?=
 =?utf-8?B?N1lxUldjdTEvRkpGOUtjT2ZzU2dPZmU5MHl0SzV3YUg2aTYvS2Q2NitmMnVk?=
 =?utf-8?B?ck9YcXY5VWd2OHV0Z3pZVVRiVjZHNlRCMU5KWjZlalVOQmhRbmJhYTh6QnF1?=
 =?utf-8?B?RzlBVXArVWprdktGeGFLVTFzdmxQMEtFdHcxRkltVldzZkErZzJ1RHExbHpB?=
 =?utf-8?B?UENMM2haS2NYNGg4TW56Q2J2cWdGamJVaEZIWi9uN3M3dEtjaGxQM0poaE1X?=
 =?utf-8?B?amxwcWRwWEtxUWwvUW5iVkI2cFVxRXlRVHlaZ2QxOE5kdWY5M041MzRGRjdE?=
 =?utf-8?B?ZGdhNVpOd0MyRm1OcnJWdWkxenJoZDNSYnNJYkpwcjNpOGlYMGVNcCtPMmc2?=
 =?utf-8?B?RE9SSTNnMnlqamdua2FIV3kwSVhJdG5WbUpJLzN4NVBGVFRndktxK3pUdlZ6?=
 =?utf-8?B?OGU2RW53cC9TVURQTFBUQzNlUEphT3R3Y1JESE1OL1JIUzlqOWNjdWVGVmZH?=
 =?utf-8?B?NkdocnhpRWI0V0h4NHA4Vi9ValRhL2l5R3V3dUwvems0RU5WREVxT0NjZmNW?=
 =?utf-8?B?UXhOK0RWemUxaHdWQXBiVzJkU0w1OFpnSUZ0NzV0eTYyOXpVRkZNS2x4dzBE?=
 =?utf-8?B?RWo4RWlkbWliK0NYcGZZeHc2ZmpaK1Urcjc1TGd0YmJTK093Tzg0am1HSmI0?=
 =?utf-8?B?M0FieTZld1IyYzJnM3VubnRJQzJTcGw5TkVsUFJxMkhYN0t2QzhKbUp1VEhZ?=
 =?utf-8?B?YjVINzRtQUl2QUhFKzFnR2E0QStNZlNpNFhnVjE2S0VqRlpNeERQMzRUVVd5?=
 =?utf-8?B?V3p6UTE0SHhTTXFBMWxheStmdVI2TjVTdDV0RUhHcUVhUzY2S0RUWFo1bWlR?=
 =?utf-8?B?UXRzSTgvaU9JZHZpUjN4K2pDOWRRTnN4R0VtZUgyVVlNTFlIM1FUdjhhTWhv?=
 =?utf-8?B?THhtSjRJdDlBVitFZ2NUT1BwS042T2tSS1UxZ1dDMlBESFJXR1h0RDk3MWti?=
 =?utf-8?B?b0lSamRlOG1iakduRjBvY3V1WW1VZE92cFVwRW5VZStPeTV5ZzgvR09IOWVa?=
 =?utf-8?B?SVRPRjZvNytxSzl3WkFYelp0QVpqdjkyWlB6RCswOGQwem5GNXg5Z2duMENH?=
 =?utf-8?B?NjliWGZYZlRqQTRWWFlUS21aamVDbndDaXZpVUZ1VDJzazQ2WStMT1NaUEIw?=
 =?utf-8?B?R3VpSGMvdUlNVFM1M3FFN3cvcFJWMVduT09Wa05Ca1d5dXQyM25vQkZpa3Ra?=
 =?utf-8?B?eUdTUWRLZjFFK2pzRjMybGM5Y3psY0hwcmpHcm95ajNpaXFtWEZFWHRURjFm?=
 =?utf-8?B?Z3ZDSHgvWVQ2UFlhYWRxK2c1Q0cvUTBkdnJCd3BzSnRtdGVhTEd6OXVpeWgz?=
 =?utf-8?Q?yEpHAekdAI4sehGVeR5UTXfnPjs33d2d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2cyY2VBL3FnSk9jTXJLQTYvMUl3akFYR0M5RlpRd0RLMVNnUThPR2JaK0Rx?=
 =?utf-8?B?dDdjeHc3ekVad3NTb3k2Yzd6eUduaDllbXEreUdtTjA3V0F1eWZ2cUJoOFg0?=
 =?utf-8?B?QmM1NmkrTUZrNjBneVlkWmlqRFBDNlFYSjREV1hLb2Y4OTRnK280UHRST0tX?=
 =?utf-8?B?cWdoVGdnd1RCb0F5MWRrZktsaXdPWVRtMmJ4T0tZTFNaQWtqSGlKeEQzMW5j?=
 =?utf-8?B?ZXcxNnJZYXBKa1NmMXczTHdJNVZ1ZmFDMlllQmdEbWlaZ1dMVHgrZU5NdTlC?=
 =?utf-8?B?b2pZc2o3NkhURW1nZitxNUhhRlFiR0ZsZVo2elB4NVV0Y1VtZCtCYURqaXBC?=
 =?utf-8?B?aDJWNjhlNmJRNEh6N0ZwV2N1cVYyVFZFWml0dkhQOUJvUUZ5c0h2dUlGWks4?=
 =?utf-8?B?eVNWQm9VUGFwRGovcVZHYjQzWGFEbXYzcit0dmxScUE2M1lqNmcwT0pMM21q?=
 =?utf-8?B?bVBERmhoTkxjY092UmNCL0xqWDNpWlFrbFJ5eGxVZGwrNk95K1F4RDVOeXBj?=
 =?utf-8?B?dkVzdStsMnhnbmQ2UW1MQ09YWStNSXdhRVpJUWluUVFSYlAyT0h6ZUtsbGNZ?=
 =?utf-8?B?MDdid2NlT0VMSnFML0hNekFVTXc1UDZ3a0NCaUlnNGM4SlZhWWZMcEwzSW1B?=
 =?utf-8?B?MXBYN2FGN1JPZEd4UXlqN0V2Ty9FRmpHUFAzTGg3Z2pYeW9PK2d6a2gzVTI0?=
 =?utf-8?B?K0pTYzRuVmpSVTlhbDhSWXBnZFdaczUxM3ZjcDV0aVFFYXFhVUIxMmF2MFRB?=
 =?utf-8?B?aGNhTnN2TFg0Uk1hcXhmNnA5WjNpbmhDYmJDQUxiaXF1eHNQb3dqMWNNY3RC?=
 =?utf-8?B?d010eWQ0VUdLd0VRa1BpNEhkT3RMS1FyYzYxM1oweGE0bDhsb0lKbVYrNks4?=
 =?utf-8?B?NlFLMGsvOHhaNTJUYUhrV2hyR0E3c0V6b0kvQ3I0UDYyNG1RYmVRQklSRWht?=
 =?utf-8?B?T3NIUjFyZU4ycVJRaXZhdkZvb2RUekVpMU5iRno2QzlGZFRmR0ZFcDBlSHox?=
 =?utf-8?B?V01nZ1FqbHVwT3l1cVhIU1pJUldNWVpmQlFFbEE1cklGTEhyaWhiRS9RZ3NB?=
 =?utf-8?B?aFBYMzFLOXViZkFyS29zNWFBZE1TaW41ZU9oQjZzTFg0RnR6cGJEU0ZhUXJH?=
 =?utf-8?B?RkNVUjN3a3Z3T0xHN3htVnBrcnZDWTRUeDFhUnd3ZWV0ZHRlMGp2ZjRzTlJ5?=
 =?utf-8?B?akNoY2RmZUFNSlA1VXhPVzJqbGFiVTY0Z3k1OFUvZE9FZHB3cHhGN3JqejlL?=
 =?utf-8?B?MmY0ZkFtMTQ4bzVHRnBrbnIzWnp5eXV6VlFwM1ptUnl0ZFBSWnRiWjU5TWdZ?=
 =?utf-8?B?NEt5bjBlR1E0VTM3Umk5UEZlTXhaK1FRY25jcHNSRlJGMHpCeUZkVklrdXpD?=
 =?utf-8?B?ckszaXpRejBQM2FEVURrRjVwUlBMVWF5UllKcmFCODBlMCtmNEh3WTIyNUMx?=
 =?utf-8?B?cGZnUjRDeDZmbTVHeHNYdXk0RC94WHY2aWJGanp2eWlPZFNHNGxBNG5nUzhO?=
 =?utf-8?B?akpWTUdxa0dtT29RQXRTQXBFWU5pNUhPMHVMVWVFbHJCVkFMSFJINGJiNkJQ?=
 =?utf-8?B?ZWh2SFdlTUg3aWhKZWtFdndJRkVuSHpmdWQrTlFsS2ZaSnNKR1hUNjYvMVk4?=
 =?utf-8?B?Rk8yUitCdmlmL0xYNSs5TXZVOXgwcm9yazB1SjdSdEYrMW5tTlV5Vkw5VWs2?=
 =?utf-8?B?SHcwajNndE56OVlscXFNbHVXOWxHaXJnS29aQmZFaHp5VW9vK0hyRStqcGwy?=
 =?utf-8?B?YzVQRlQ3UytoNExvRmVPdDZuRzc3bG9ML0lwcHZIUDNvYnhXQVBUWm5DL2U1?=
 =?utf-8?B?RG9JL0U2eGhaakVqNWk2c1lwOG8yS0hHRlkvbUJEYnQ0bm54RmVWZmkzMTJp?=
 =?utf-8?B?REN1ZmVsdXNpTitsbG5rOFo5YnhFVDdaR2ZXb3hhUXUzRVVMeTVwbXdZa0tY?=
 =?utf-8?B?YUgwY3lOU1YrY2ZCMWg2VXBCbFlMaHdyS0ZwMTlKd3pqRDRFd0tRMWcycWtu?=
 =?utf-8?B?Rk4rVEdhZC9LdDhPT1hUWGJwcEZtaW5tOEc1NU5yWmZlN2I0cDB3aU03ZnZE?=
 =?utf-8?B?YWlncGVTN01SY3A1Z1lubDI3NTJUQVBEVlRNZXNVdC8xNk5QT0k2R2hwSEFn?=
 =?utf-8?Q?30TPIepGbNR86wM2cahi1n//h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb00b47-548d-43dc-5144-08ddfa45dc59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:06:51.4233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdvhqXODXH/13ZcatEKLCglAhUxGb9cS17+kPe6wD9qAhZSunplksVo+Qcl16cSKL98JW0Nfl0CMVYgF9Ff5sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ff46e0d4e73488f8a3ed538830570b1ec71b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1

