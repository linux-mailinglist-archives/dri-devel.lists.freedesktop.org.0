Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E4C0C667
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4490A10E398;
	Mon, 27 Oct 2025 08:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Kj9OTSW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013031.outbound.protection.outlook.com
 [52.101.83.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF6F10E399
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHWOpNRiryecfy7auhve3i/byCoQoRKAr3vcn4bnhp/Yn7QEjGmvoQTpYZvYdPJNgeIywjqH+hWoRVi8fFvqgGRMfSr6u/JpBcc1thD7KAT+NHeJeTpLWxt29KbbPgxw6mLxEcH0Tr0ho1jfPcKjLqFSG0J3xar2jRFqHZZ1vE2BsBlMfUh540vdecQvv85BRGA765gTZ9tTnKIsciV4hxwLLeSK62O94+LIQqzEvgaq1m3jefNEiFZCp2+4XiAJ8DbK82zKj6uBNJ+315i7YwDIcPFqEX9igBTdvd1N129FfkjnsjNTLAZDYZISr2wsyPgpHiCi0FMh405BJ3JBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+557MxakxFM/IOusLmHc/jdbZym36+z00gCGZqXXBEo=;
 b=kny3cQcgDK3FtzKN5foSbPwZxqS1JFbxfMl4DbQurScpzCZXdBg3jeCw0YDRA8mS/B2t+BmIE6pzh95MfPvQdwhgJXfVuzJKtkqGBH2P9TKRUPv7T1lmNJbz4cD6lj3RQmXiBEiK1kGcwdip3F/nenqOFt+iYwSKDMlQtp2lu0xMU8egOwnECewiBM/t+accsugAq2Y3UggYdf3DvM4/+9wt+Og8NgSV9wIXdHn+K//pEuhxR0+qOR2PXRiCHpqtlf3M1qSB7mbBDRkoY85QKHX9vSS8NEyWgE8j2BcPNGxtmY5TdnZ4Ds5TMNouXan0xKBqOYOzlohO6GvR5SopTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+557MxakxFM/IOusLmHc/jdbZym36+z00gCGZqXXBEo=;
 b=Kj9OTSW5ZsJFyLX0MqakXY+wGmclRFhaos0U0kzx7AfYD3b0FvagOm8Ga8NATU0smN1EEtX0ep0+5mVxPhTOfv6RHzoc0dTn/FFGmHBifUQ86icpS7kDSYbhoupqDBIvawWq82PDb7/qmExPuPk67kft+YFfjGMYC4/TEthemSN5KC0CpY9x3hpGhKbkI/I5CcpWQfYwBUBGSgI2a176ueGPk68Z0xVrdCi9MwWPlw+GO2D5Vsb1VT5fX5Wzpg8DQTRI8AOuHCahfuVwt/6MAMVTwkB0kwW/Am6+hYq7YJX5oPhGPmiQlfyVXYS3i6jrTRpWvJVH0YoCuRoR1+xLrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:46:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:46:55 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:51 +0800
Subject: [PATCH v5 01/13] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-1-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b47f6b-f387-402a-82ce-08de1535619d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0xGWFYrUzZuMXd6WlU5MlVsVFpYWjF3anptWkxtUXJONFNCKzdoNTBVejc0?=
 =?utf-8?B?RmtMWXlmVWhqcGp2MVN1cHhuZllEZjRxOEJFTlcvTCt0dGJYM0VCWkVqY3Rz?=
 =?utf-8?B?MEZsUE9vKys4bTBoWkR0empsaVN3UlpNVER6YkFPSFJCZmU1YjNqQSt2QVFJ?=
 =?utf-8?B?WjJNYUd4bzc5bUhzWmtrZ01kQkVONjR1ZDg1N1pBNWJzUjkzTyt0SU44M0tM?=
 =?utf-8?B?RmVmSjlLWGpsTmlvd002dytUdFN6OFMrdlZsQUtWdjVFamdTVnRUMUJtZXo3?=
 =?utf-8?B?Z0k2S2s3M0oydEUydGRidFVZelZRdWt3b3M2NWZMaEhNL3pVclpFb3JUYmo4?=
 =?utf-8?B?UXQ2eEhhVGlESk52dWh6bmpqQUt4VEUvRVNHdkxQSUFqb2pVQkNNKzBENmRR?=
 =?utf-8?B?VTNsWWVlVVA0RFdlTjZqcDk0bEdnNUJkOU5iaG9ZOFNWdzB1TitKL3MreWNi?=
 =?utf-8?B?d0U1R3JienNHR2dvbVJDaFRkV0lBL2xoWURmN1FOdHdabkE2dUVxWjgvd2RB?=
 =?utf-8?B?ZEJzNlhiOUd4RnRoVzNWK1IrQzJ2b2I2OHFObnl5T3ZaTnlkZktwSVlsd1lo?=
 =?utf-8?B?YWhGemgxV0d3RE9MN28wMmF0bHU0QXdsQk1mN1QzaHZKK3k3RkJSRGY0NnFw?=
 =?utf-8?B?ak1yVklZbVdpWE9ZT2IxRHdiWHZ4dXVLVVFJaEhyQ1NnNmV5b1NGYnY1dE9q?=
 =?utf-8?B?Ky9hajhoZE1iUS9ZSjFuNGJzRkRmMXN5Z3FqYXBWelhzMUo3M1pMOE1oQmVx?=
 =?utf-8?B?WnJhTktiUDZaazVIRXpGaGJ2Q2x5T0tDd1RiWkFEaHFMQ2pQYW9Oc0wvc0l5?=
 =?utf-8?B?SlFseHRXZ1JUd21peDVJVzZOYzlRdHdxTXhyMG5hMUZnMzlEeiszQWFwVEQ3?=
 =?utf-8?B?czhyR3p3bXBaT2grRDJSRmxISnlVdjhmcWVxR0FNL25BbUFVNlkreDBlZlBE?=
 =?utf-8?B?ZjBzSmIyeFRHQ2UxaW9pemJkM2NjTHk0Y2JhMnIxbld0NDl3cEI4Sk9nTC9E?=
 =?utf-8?B?R0FiVmt0VTZNK254QUM2VS8zQnovTWI4UXM5NXFUV2h3aG9Danc4ZHgwWHVD?=
 =?utf-8?B?Znh0ZVVDdFZUanVXb1JBUWRrbjNLWnZnRWZoWGRZT0ZMMW1HamIyWkg0Tkgv?=
 =?utf-8?B?TnF3dWJWWWE1MGhsZUF5dWtqaVdscEV5QTErcnkxYytOcW82bWk3SzFhSU9H?=
 =?utf-8?B?bGFwbUhIcUxwSmlGbU04WENrdytlNUtjVTYzSkFZQ2xBM3FtNkhwUWdTdEFR?=
 =?utf-8?B?Y1JBaVgrWmY1bkJPaTh2Rm40OFFrdEFrODdjN1NrTDhTZ3R4Ymk3S2JjbTk3?=
 =?utf-8?B?b3Y4Qnp3RXBUc1hVekpxMURmRDdlRUNBNVVTQ3B0Y1liSHFZRWJ5MUw0Mk9l?=
 =?utf-8?B?cGQ1dDVtM3ZoKzQ3WnRhOFBNNCtBdkliOEE1d3d2SS80dSt1Z1JZQ0JRR1E4?=
 =?utf-8?B?c2VRQjBrdysyRXlOeXE2SG5SamtoNTRhdWRub2JwbDFKeTR2ek52K2YxWFlB?=
 =?utf-8?B?b3BKcnNCRytWdjh1OUpUeXZPVFErb1ROSmJZUFpUc0tvbWYvNzhEMGt5bUhH?=
 =?utf-8?B?OEdGcmpaZHVGbG53ajRYUlY5MGFYSGx6MlVJL1A5VlIwRFRiQk5yNnRmNVlz?=
 =?utf-8?B?M2ZybWNET3FEZWdqamFqTkFmK0g5TVhaSS9WMWR3RW5ZL3ZFakpzaWg3ZFZ3?=
 =?utf-8?B?TVpxTzFOYURuTE82Mll4MFd3aDdLaXZ0NjN4UG9UbjZqSFErZDNESkdBYklV?=
 =?utf-8?B?RkJLUjhZMXRla2FISWtlNHAySkQ1NTRmK3ZsUE9uQTlNLzVVd3dsYzRTTTdn?=
 =?utf-8?B?SmlqVlJDYVZCc0pnZE5ERG8vZE53T3BramlFY0hhMWtLUmh4Vm9kbGhkY3Q2?=
 =?utf-8?B?ZjdRTHZnbGJ1ZDEzZW5QQ01XT3A1ZXFlZC9xMFdKWUtMb0cvOXR4TDgwanI5?=
 =?utf-8?B?QXdnTXpXQ1pJdmltRE5qSXYvSmdLUFd0TEZBb2k3ZXkwVnp2alExRkR0VUE4?=
 =?utf-8?Q?90dMt2PXKy7sTQvUrMco1VgJp+x2Hg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJmOU9Jd3BGTTVKZytXbjFrcTlxc2JWWEFhdjZ3VVF4WHRQVUlsUTNWQnJS?=
 =?utf-8?B?VFBvN0RabW1lU3VTb1E1aEJhQmN3bWc2L0x2ZkFkUXhxVUtKa0pXMUZESlRK?=
 =?utf-8?B?aGJkYWZVTUVzV3JFeUR0TTdQNlY1d3ZKbUo1WjE0QUMwNVJqNXFlQWV3V3FV?=
 =?utf-8?B?SU5tclJpSTJLRFFEdkZYbE4vY0M3dys5VmVwWGYzRktOejFNR3d2Y2ZMYXJt?=
 =?utf-8?B?cVNwMCtCUDJKai9OSWxvVjJrRFJNWm9kR1RwbTVsd3M3SCtuc3V1V01yQ0hM?=
 =?utf-8?B?bHM5VGoxenFtVURqZVlkTHRUTThQZDNLMU1sUm90YXAwdFZEeHcxaUgxQm94?=
 =?utf-8?B?dDYvaEFpMmtnbXY0a1d4Q2NKUHZUNFpKVGRlUlA5QmJvTkJEVHM1cnBGYXNL?=
 =?utf-8?B?citkbElCRkd6ODFMQTk2b0RVY0U4cFdScEc2Vis0dEZRa1UzREZDNFJmeExs?=
 =?utf-8?B?V0xWdUppZ1VUNEtRcjdZc1lJaTlsN0RHZit3TzRhSVFGclZ2bjh2Wkt6SzBJ?=
 =?utf-8?B?cUVIOGg4aEdtdWJhSDdPa0FXTklQWkNYNXF5Zm5oQTdxeFNHVzJ5enRNQ0VO?=
 =?utf-8?B?V25Gdis5cGEzUTRnSEUvZ3JobmQ0STAyRmZUeXZpZEhyKzJxbWlJcUdLVExi?=
 =?utf-8?B?NGlGNzhHMUhQUVRuVHV5MzRRQlpSSjdWZzJ2djhiSFl6N1ZKUWYzTC9iS1M3?=
 =?utf-8?B?Ym9xSE1RK3FrRUZoS2hSS3lJOTRnTklCU1Q4dHRBY2VYcjZta25GS0RXckRz?=
 =?utf-8?B?blZzdVA3OWJJbnhOczVhOVI5dW5hWlBVYWc3OHhld08rUkVLQTBpQUN6ZkNZ?=
 =?utf-8?B?RURZYjlqZUJnZko2cit2enpHTEFOKzI5NzNOcVFzL3Y0RXpJUlZPRWZ1RWwr?=
 =?utf-8?B?bHo1SFlJNit4SkJoWEM3dEphSEtXcS8zL0F1VFpJdUovMWlpUmRxVXVJOWpO?=
 =?utf-8?B?S1l1QS9zMTFVL2VqdDVCR29mUkJ5TFFLRHBHditPaGptUlpwVGozTHlUZVVE?=
 =?utf-8?B?MkVldmlYTkE3TFB1NlNOd2VyYmI2dW1nMEV1REx2Rlp6RjhZZldJMXJRK0NN?=
 =?utf-8?B?NWtPSWtZbzNEb3hsRDFOOXdPV3dZYTdBRFNqbTBMRVRZdGtXVk93UG92Y3M3?=
 =?utf-8?B?OStIQ3VoNDhZUllIeVRoeno0T0h3UDV2YXBTS2g2RnZjTjI0NlpYWWZIZ0Y2?=
 =?utf-8?B?bHRxUWEyVGV2c213K1YwTnNXazlqN0ZxYUtDZ1ZTVC9nR0FIYWZZSlB2TXVW?=
 =?utf-8?B?RFFTblRVejdpSHgyY3JEWktVWEN3UFlKK3BkSWYvcEovNklCNTVjU0h6TWl0?=
 =?utf-8?B?R29TYktpMEJuckVoWW1BK0JWVURmU0FYak5rWWtNbUxuMFE0Z1lkQnM0UzE4?=
 =?utf-8?B?WCttT0hYa1o1dEF6ZDlydERhaERpQzg1dEVoOHBWWmk4TUVucGRyM1lVclRT?=
 =?utf-8?B?VXV6WHZkVnM0ZTBjeWZka1M2MGt0dnlMMnMvd01jMnowcEl3QmtPZWlqYnQx?=
 =?utf-8?B?VGRad2JGdU9BSnlNUFVWdUNQcTFBcUd1TURtcDVsQUNSN21yNWE2bHNMUzNP?=
 =?utf-8?B?TjdLVWF1UkYrd0hnOCtKcEtRQ1hkQkpUd0Jtbm9mUndrM2h1RUNHZmlrUlV6?=
 =?utf-8?B?MU1rOGwrbnh0dkIvejdJaFg0bEsyTG5BdTJtOHRNT0tmVzdOdm4xQmxkWDVI?=
 =?utf-8?B?KytnV0VGbjhnVnpleFY2SDBPTElHWitLeVBYSnBYMUxvQUJxbjZhdmp3SDVV?=
 =?utf-8?B?QkcwSlZBNGp5aU9VdENrUnZDTmpCT1MxZlJPaWVUMnMyTkRPU2ljSVJ1azJD?=
 =?utf-8?B?WDgrWlFJY1pTYklwUTBFUU14WGxzeC9tOW5HOHAxd01STWtNaDROS1ZNS0th?=
 =?utf-8?B?M1U0SnJLTExUOEJZdW5NbG5aVFBXdC9yVTF2Y0ZGSldJc3cwQzZMVVhTVGF5?=
 =?utf-8?B?N053WldaWWFjdFpsSUZHcENNNm9EcVRqZGdLWit3VjFXa2lRQWRaWEIzUEJj?=
 =?utf-8?B?UDd6NG5YakVVeWREdEoyVnRUNytMZVF1T3hFNE5EazIra005cXBSdU1VYjFT?=
 =?utf-8?B?T1FKVUJ1aThwV0VmcmhJZVdzYjhxVldMSkswU3dCWkFkaHBFYXR4VExZNEh2?=
 =?utf-8?Q?q2XUzh4e55QPaN9Aqtskwaavq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b47f6b-f387-402a-82ce-08de1535619d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:46:55.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1boy874SgdQP56N84VGo1Ot1FjjiNOQgy3IdTVCyy4a3JTw8qLaJV9FJKWTzJFt6GB+jm1elEjgfUrIVGPPNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

v5:
- Add the DT binding file in MAINTAINERS.  (Krzysztof)
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 61 insertions(+)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index f9f985c7d74796938560148ffab7d3838dc02942..ba8201b99d0d45f8289462963a43c78b769e05a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8332,6 +8332,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 F:	drivers/gpu/drm/imx/dc/
 
 DRM DRIVERS FOR FREESCALE IMX BRIDGE

-- 
2.34.1

