Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4E9ABD98
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 07:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2061810E358;
	Wed, 23 Oct 2024 05:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hf/iSLTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013013.outbound.protection.outlook.com [52.101.67.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D514110E358
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 05:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y65KeIV8vyid0D0DaOil99SO76cPx6I8msrvIU8Ije5vvWCophFA4fDGD0htVO6vv9UuvMYSVOaea0a/ImfFvs7Q7nOchMopCqyswXI6FBhUPxDtO49z04gJD/FhrGtBp35IaM8R5Wt7rdnFujkdtRec9PI7Jn0BdXnxi00I1lUcsYv0oN1lw91vsKidx5navjVyha5NXkYodC0+SMCIrpoclRdIYJpA6cScRTOx3inQVDBWiTWC93/waJeZ2gGGWR7mEaIrxKX5L/JJ6YPjd+Ihflk9rSuB5dvyjLvTn0NEW4CO+vwd6PY+OYv56NVT19XuOXk/G9allM0SDhfTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wL+cALGW/OOqkzpzrQcXwZ1CGfPiGC+PLQ7c7RoSFeM=;
 b=FbpCqt9d89goCRM8LMP1NbfDQDwYGfBk4UXY6Bo+seOrV54yvPJSBNCsEU9ENJVTcvXH995cwjZx6bZqHmjVl2sgsKy/fYbSaysJeZs34nExf6asB+I/yE+dYqqtpKfUsDnLqQ3Cpdd/qflcztdNCrDG+4I8pJUTGDt2meyFS+8lQRKLfFhLTx67MtqbBcOvNTx4kh7f7aWPgHOwyV1whU89IByIpB3nPkBWp6GRjlNx20stT/1ArCBkU69z2NMTiiqGB2VSTIqIUdrC5jM1X3r3KNsSQIygWL44rsHquVaNCtsA51EqjojOImoX1ysTb+98ocKsRkJ3ZHbEWsYOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL+cALGW/OOqkzpzrQcXwZ1CGfPiGC+PLQ7c7RoSFeM=;
 b=hf/iSLTVy3PtLZRxDAHUR1IiWt+B8jV5Ln5NZoBVo5KYC87u5rwqA571cy4aeJqtEyM/aLdA1CUVLC2Ou1eNAYFAqzhwuvrLOEVJiXEqWcprEAPv+hcvBpZDAtxvKw5PUhqhcFQMLtRUdRsyGRjSLY+23PdhDSjB+awVSBmlc2rqxwpNR30StOjbs4Pk3iW9R6XC7wBazWpL8qUqQ8p6DR4++1BfU5tgfVvtFTILxalBF54Mc7NZenWPf/XFmGv2cqs/GpcoAzigFG+fJbmVDEXV3+/W78mIwzKIgI5ZBBTNgt833wHfY0FCJc7HCSji+HPbF6mJsHFQp/NmM/QYfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8356.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 05:02:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 05:02:42 +0000
Message-ID: <83273e79-7449-4e82-982e-979def490935@nxp.com>
Date: Wed, 23 Oct 2024 13:03:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
 <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
 <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
 <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
 <207b20ff-cc7b-40aa-8dde-bc5aabdfb414@denx.de>
 <6d7ec7de-4d48-4273-a707-c70e34996787@nxp.com>
 <e8f54ebf-9693-4cec-bbdd-ea2e6d9e85f8@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <e8f54ebf-9693-4cec-bbdd-ea2e6d9e85f8@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 687e3cfa-7c96-4b86-4c81-08dcf31fed14
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGZodFVITWZYL0IzeG5WeFJRb3QydHhONTUxbkFmTzh2ZXd2RVdFQzg2VmtZ?=
 =?utf-8?B?bGtzUmxPQzVGbG4rOVJxcG4yQkQyYUJBL0ZxcURvMlBGRGZ0V2FkZThpM2pX?=
 =?utf-8?B?cjdqVEt3Ym1nZkVZRkZSTy9ibFliYkpTSFc2emd0NGttWEQ0RVpPakNPbnRV?=
 =?utf-8?B?WWdnWTAzdFFCMG1RSUpqSWhndDRkU0JtV285OXBCcEVIQ3dFL1ZYQWM3Y1Yr?=
 =?utf-8?B?Y3lyNXRHcVhwOHd5eHNMbW1KSTgwRXZ5cFd3eVg1a1BqeGxCYUkrcmM0Z0pv?=
 =?utf-8?B?WWthbTd3Tzl5elRRWFM5UVBEelVTUWlzQTFJWEN5YVJLS2xTVnprNXh0bHJu?=
 =?utf-8?B?RGYyS3pJVWdhbEk1NW1rajRyZWVpOGFaRG1penBXNTN6cUxua25IOU5LOFZF?=
 =?utf-8?B?VU9EK29hOU1nMXJ5L1VCMVJHN29mZ28vd3EzNzBUcGYxTjVPenJVRVE0OGpZ?=
 =?utf-8?B?a2ZzUlZuK0JOZGVEd0JaMHU2NjVQRFBlQ0xmK1Q1ZkQvK2dTaXhUSzlPWXNq?=
 =?utf-8?B?SVpsSW82ekwyaC9LUGFDandoczMwTHJ0ODVMbzRrZ05PbFlGNmZvM1N2anFZ?=
 =?utf-8?B?Q3Fxd3JpRENwZUJHaEtLUnUzMzBKN0RDYXhjdjBtdTQ0dGxjaldjREMvMjFv?=
 =?utf-8?B?aXp3RkdyQTd6dWM1RnZlVVRMQmtHSTZ6Y0QrNXVmQmpDMENXSTVsaG5wc0h6?=
 =?utf-8?B?OWNpbzFPWm9Yck5PTk5INWRRV3FBZzMwV0x2L1NoeUxyYzNZcmVUUU9wc2dH?=
 =?utf-8?B?NURvbEhxT1VnZy9YUnptUnVWcjB4SnNNcmhtbnFJVWpIb3pZQ2JmZ3JtZGFI?=
 =?utf-8?B?QU9ZeWJJZTBXM1p6c2t5ZzUwb2JoUklkL2J4MjhWRTBNNFppRWlKWVRpb2lB?=
 =?utf-8?B?SzF4ejFSRUx5S2VvNkdqTkpHOWxDU0lIU1VxQTJDRHRoaXNTb2hCRHVudVdh?=
 =?utf-8?B?eTErVG04ZWIzWlFJYThTRjU2blZIWVZyM1ppYUpBVnNJbTEvbTRXMGdjWGRG?=
 =?utf-8?B?MUk2RnBOdkV4SjgvUEoyY3hRYUZERHRDdTJRZmpxM2pWQzhzcWMxSmhGK28w?=
 =?utf-8?B?L3diSWhzK0k1RENicWdtS2w4TWpjTGZJYzJRNko1Q3lFTUNFaWl0MWRIVlg2?=
 =?utf-8?B?TG9MUWowa2dGL0orV3NuckJOTDZMdlBvdjdJQS9HZ3hMdUFvU2tWNElkYVlZ?=
 =?utf-8?B?eUN6R2dYT0pzL0ZiRnlrZXZEZk9KN0hyU090dDFsMERMRDdvUS84VUpDU1g0?=
 =?utf-8?B?R3dPQ01Xam9LcXBIY3VLU2pqZC9rU0huK1RWL2pkWWV2RE55T1FYaGFGRlVm?=
 =?utf-8?B?OUVxQWk5cDVVMTYzblFNRlZ3cUVNb0syVk1JNVcwKzJzMmVOM2lTVFV2WnVz?=
 =?utf-8?B?aFo3ejlaSEgvdE96QXlZOTB2a3BISUZLa1VZNTlDWENxbElELzFYcU1GSFRV?=
 =?utf-8?B?THVwS25DRmFZNVVVRktwbjhIWEs3Q1RPK1RZeHF6Vkkxb1RYa2p1b1BBSzVr?=
 =?utf-8?B?bFhWL2dRTitUKzVPMkxhbUR6cTJSOEgxczJqNjUyZVlHdzZUdnQxUkRoRlBt?=
 =?utf-8?B?VkhqOS92N1lVUVVtR1pjdHEwVWRTVVdhdG5ZN284SlB3TGRBUS9PdmxHVEZC?=
 =?utf-8?B?N0Job1oybGU4UlRwRHNQTmJQaFNCSW9wR1BvaS9hWTQ5VHZEN3kxNExHZUxt?=
 =?utf-8?B?UmZ3WGl1RWczWkZXTzlYZE9hS05qV0E2VklLMGYzUVFhSlJKZG10eHR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDJreFU0YXkvZ2FMZFNlcTl5cEppb09qWmdKTWx0UkZDZVNXZjVUZHZuZWE3?=
 =?utf-8?B?UHZJbkdYdXdUY2J0Ryt3OGs1L0xDR0h1aXROQUlSVkw3UE12WG9BT1U0Y0lU?=
 =?utf-8?B?clkyZmdMdWpGWUQ0R3gyMnNtZ2x0eWtmeWZvZGFMQVZ5T1JOWDhCZkpydkVM?=
 =?utf-8?B?MzRObVF3STd4SEpQRW4xa2tPUFE4cGJBazNhUXcwTEh2T0JHWi9FeXhRNThM?=
 =?utf-8?B?SzYyWDV4SHAxMnNnbkhocHV1RXZiL2t1T29td2N5ZDJUT2JXZmRrSyszL2Fw?=
 =?utf-8?B?Y01mTk10TGlKWXNLQWRUNVh2U0p1K20xWVRUNmdKa0xyTE5LeENZUXYvYlRB?=
 =?utf-8?B?WTlrN2p6SlZ0Z1N5a3lIaVhkTGJ1S24vYWdaWjlWaExhQ2lTM2lKS1RMbmta?=
 =?utf-8?B?L010TnI2cmdtTE1XOGlTNW9SWlBsUXBLbW9HNnpFQzQxY2x5ZTE3UnNCS0sx?=
 =?utf-8?B?NUk4NU5sV2NWYlYyVWxzNTdBc3FHN1hHS0hnMW8vRFBRVDhNVHFrdjZ5OTJj?=
 =?utf-8?B?TDVUWWp6STRBUTRGQ3pIL2Ixc3BrRzNXQ1lIQURId2U5NXF2VmFvRHRNNVMv?=
 =?utf-8?B?dkE0T0M3SUdtZGVlL3E5ZEI5M0dhb1ZmTXJHRmJJcXdzVWhkT2pVbVlKTFJK?=
 =?utf-8?B?TUQ2WDhwNXc3aFU5cDdLUmFpNjZJMlRjVXpoU0cwNkMrclYwOEZCNGZPVGNr?=
 =?utf-8?B?UFBKQVNVM3R1Qmp6Zi9NYi9TY1AyWFM4Lzg0dUN2bkhITDZDREp5S0dMdWlm?=
 =?utf-8?B?OHE4cVYyLzdkYzgyMklIOGZTbERsOW1UL1AxR2xxUHNwVHhMck00SGZQRFJD?=
 =?utf-8?B?aytSMnFuVnFaMXhXRXJVUVA4dFBRK0xJUWxaYWtwRjJFbVI4OG5OMHVRVkJY?=
 =?utf-8?B?Yll2a3V1NkJpWFZUYlExTVR5ejRldksvSGIxU09TbERGL0wzdW9XbHBRelpG?=
 =?utf-8?B?ZXVmWXFtSmQ2dC82eE1HSktHRE4yS2hhZ1I4R3VFaE9nRjU2M0FCS04yNEpw?=
 =?utf-8?B?ekYzcm9Pdmg0bzhNZEFHaHo3T1IrbGxjOUZCLzQzV0I0SlRzSW9jUGoxSTlK?=
 =?utf-8?B?NkQvblRwc3Y2ZzJ3a0dCZDJSQXo4anlaSXJVOThDZGRjaFo2YnV2eVNmRGNr?=
 =?utf-8?B?UEhEdlFPcm5Cb2h3TVVLNm5GZGVuc0Y0UDhWSWZKZ0ZpYXdYOTVEWVNmblM0?=
 =?utf-8?B?TlJKSFUxU003eWROckpMVExGOGRvWE1tSy9wTDZkdjU4WmxhQllCbTVObWFm?=
 =?utf-8?B?Z1RWVDljU0M1dFFRZSthUFZvSTdQOGJOMlE1bXVEc0s5cHpzejVWaVZtdUhC?=
 =?utf-8?B?R08zSlk2L1pORFl0c1lyZHNjVGxhdWtZNm1oUkkzekJuSjd0UTBWUFJ3UmVq?=
 =?utf-8?B?a1FlT2JuUUxNNlhNMmZHRGxnUXV1OUc2NUJBZ21VMnEzeUNIWW5Wc2NITURj?=
 =?utf-8?B?dUJvTWNjRjQybW1nUnJqSjdvd0toSG1RRG1HY21KdzhtRldIRWVyVTc4ZlI3?=
 =?utf-8?B?OGdRaXphN3VWS1VYR0JrRngxNW1jM2tMdTdBbGYzOVBrK0xJZ3FEdDhWREJC?=
 =?utf-8?B?VUlnOHlQYVA2dDdDYVA4a1JLVXVvTTdmUXp6R2ZKMnczZjVrY0I5bmkwVTN1?=
 =?utf-8?B?ejhoZURiRUZBVmJ2eXVQQWNSK2dsenRKUThQMG5XYmdMc1ZzanFnYnlTQVJw?=
 =?utf-8?B?ZW1LZHd3MzFkaVBkTFU3ekY4UFc1WktFNFdiN3gyNmNUZ3Jpc2RWRG1JM0p5?=
 =?utf-8?B?SXYySmp1UlRQYkxTUm5ONGYxR1M3YllXWGpJK2ZPL2pkS2V1K2xhK09Jamli?=
 =?utf-8?B?ZDk0QnA2R2MvTm1DUE4ybVdkNmRPZXNuanhmekludmJuSTZUazBhNE44Rk42?=
 =?utf-8?B?TkNxeENkOEhUUHlKU1BZa0Q5QVA5Zk0vL2FXR01BQ2NnNXVsOHM5bkhKWlV3?=
 =?utf-8?B?aVhIRHRQbDVCK3FpM1llMExVdlQwT3dJenB4U2UyQ2Nvdnd6U2w0Ty9Qam9x?=
 =?utf-8?B?ejFZOEphczVmMGc1VjZnWnZZRU5LKzJGeUlyOU9HTEc3NU9sUGNjYTFFdVZQ?=
 =?utf-8?B?Tm51N2dTVUloNFZYUWc2cVlkeFMrZkdVZ2Mrc04vbk1CYzI2aXRNMDZHVThR?=
 =?utf-8?Q?v0KCeS4SCMmWu2nvXH4cXvr0T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687e3cfa-7c96-4b86-4c81-08dcf31fed14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:02:42.8085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qn3vx5OaNhN9fyh2tHFH+Q2+pEcHeyb9KWZO9Wlb/lWgSpIlZ0kR3tlTp3S0/z75TxJbm+DyQPJGVyCm+bRDSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8356
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

On 10/23/2024, Marek Vasut wrote:
> On 10/22/24 7:59 AM, Liu Ying wrote:
> 
> [...]
> 
>>>> Anyway, I don't think it is necessary to manage the clk_set_rate()
>>>> function calls between this driver and mxsfb_kms or lcdif_kms
>>>> because "video_pll1" clock rate is supposed to be assigned in DT...
>>>
>>> I disagree with this part. I believe the assignment of clock in DT is only a temporary workaround which should be removed. The drivers should be able to figure out and set the clock tree configuration.
>>
>> I think the clock rate assignment in DT is still needed.
>> A good reason is that again we need to share one video PLL
>> between MIPI DSI and LDB display pipelines for i.MX8MP.
> 
> You don't really need to share the Video PLL , you can free up e.g. PLL3 and use it for one video output pipeline, and use the Video PLL for the other video pipeline, and then you get accurate pixel clock in both pipelines.

I need to share the video PLL. PLL3 is used as audio AXI's parent
in NXP downstream kernel for i.MX8MP EVK(Nominal Drive Mode) and
derives a audio AXI clock running at 600MHz which is the nominal
audio AXI clock rate mentioned in i.MX8MP chip data sheet.

https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts#L19
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts#L25

Upstream kernel currently uses PLL1 800M as audio AXI's parent.
Although audio AXI clock is assigned to 600MHz, the actual rate
reported by clock summary is 400MHz(not the nominal rate). So,
audio AXI clock's parent is supposed to be changed to PLL3.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=v6.12-rc4#n815

    sys_pll1_ref_sel                 1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id         
       sys_pll1                      1       1        0        800000000   0          0     50000      Y         deviceless                      no_connection_id         
          sys_pll1_bypass            1       1        0        800000000   0          0     50000      Y            deviceless                      no_connection_id         
             sys_pll1_out            4       4        0        800000000   0          0     50000      Y               deviceless                      no_connection_id         
                sys_pll1_800m        5       6        0        800000000   0          0     50000      Y                  deviceless                      no_connection_id             
                   audio_axi         1       1        0        400000000   0          0     50000      Y                     power-domain@5                  no_connection_id         
                                                                                                                             deviceless                      no_connection_id         
                      audio_axi_root 0       0        0        400000000   0          0     50000      Y                        deviceless                      no_connection_id            

All other clocks in imx8mp_media_disp_pix_sels[] are not appropriate
to be used by display pipelines, except "video_pll1_out", at least
for i.MX8MP EVK.

> 
>>>>>> The idea is to assign a reasonable PLL clock rate in DT to make
>>>>>> display drivers' life easier, especially for i.MX8MP where LDB,
>>>>>> Samsung MIPI DSI may use a single PLL at the same time.
>>>>> I would really like to avoid setting arbitrary clock in DT, esp. if it can be avoided. And it surely can be avoided for this simple use case.
>>>>
>>>> ... just like I said in patch 1/2, "video_pll1" clock rate needs
>>>> to be x2 "media_ldb" clock rate for dual LVDS link mode. Without
>>>> an assigned "video_pll1" clock rate in DT, this driver cannot
>>>> achieve that.
>>>
>>> This is something the LDB driver can infer from DT and configure the clock tree accordingly.
>>
>> Well, the LDB driver only controls the "ldb" clock rate. It doesn't
>> magically set the parent "video_pll1" clock's rate to 2x it's rate,
>> unless the driver gets "video_pll1_out" clock by calling
>> clk_get_parent() and directly controls the PLL clock rate which
>> doesn't look neat.
> 
> It isn't nice, but it actually may solve this problem, no ?

Not nice, but it may actually call clk_set_rate() directly
for "video_pll1_out".

> 
>>>> And, the i.MX8MP LDB + Samsung MIPI DSI case is
>>>> not simple considering using one single PLL and display modes
>>>> read from EDID.
>>> You could use separate PLLs for each LCDIF scanout engine in such a deployment, I already ran into that, so I am aware of it. That is probably the best way out of such a problem, esp. if accurate pixel clock are the requirement.
>>
>> I cannot use separate PLLs for the i.MX8MP LDB and Samsung MIPI
>> DSI display pipelines on i.MX8MP EVK, because the PLLs are limited
>> resources and we are running out of it.  Because LDB needs the pixel
>> clock and LVDS serial clock to be derived from a same PLL, the only
>> valid PLLs(see imx8mp_media_disp_pix_sels[] and
>> imx8mp_media_ldb_sels[]) are "video_pll1_out", "audio_pll2_out",
>> "sys_pll2_1000m" and "sys_pll1_800m".  All are used as either audio
>> clock or system clocks on i.MX8MP EVK, except "video_pll1_out".
> 
> Could you use Video PLL for LDB and PLL3 for DSI then ?

No, I can't, as I explained above - PLL3 is supposed to be used as
audio AXI clock's parent to achieve the nominal 600MHz clock rate
for audio AXI clock.

> 
> I think this could still be configurable per board, it shouldn't be such that one board which attempts to showcase everything would prevent other boards with specific requirements from achieving those.

You probably may set "ldb" clock rate in this driver and
additionally/un-nicely set it's parent clock rate(the video PLL
rate for i.MX8MP) for dual-link LVDS use cases.  But, due to the
shared PLL, it doesn't look ok to set CLK_SET_RATE_PARENT flag
for "media_ldb" as patch 1 does.

> 
>> You probably may use separate PLLs for a particular i.MX8MP platform
>> with limited features, but not for i.MX8MP EVK which is supposed to
>> evaluate all SoC features.
> Right, that, exactly.
> 
> [...]
> 

-- 
Regards,
Liu Ying

