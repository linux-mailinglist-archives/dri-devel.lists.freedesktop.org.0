Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C782CAF8D54
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AFF10E9B6;
	Fri,  4 Jul 2025 09:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HfOVm4VF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CF410E9BB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDQJi1R+EZc6FXdYi/FVULJh/1D8g2HuqSpsGEbS6Ka9IMWGXJ8fSJcw4kB1jdbvPngq8fxgfKMJlo/ryWRTJVZj14gRbqsjSHOKFtCwjWvguCXPeGV5MC1LfR4uUH9tJDWEyl9M1yOibXqFV1Be/6jh5GgCe7VHbMqgDHvhRAVrfxQF/AZB5IkFwlywVB9SfvzI6V+YwRrC3pFBF1xdBFU6LUef0zyjYKV7Rt/jPs30yu8ymXt+IlUnxtlT8HtXvKCyCJWo4M1xNg3fNuaD/gPnNAldXlXtf4SBbi+A9nNlEovi9D746ytJnwEOXxD13mnqlC129itaC395GwQgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDVXkc5l7vN4xpmimSvaWDx+z70LSHrN8cT7EPl4Dwg=;
 b=NrJy/bib0w1ReOg8dKZz5SF7cbRQOBaOmqelgE8MsPd+FCvQqVJMOi8cKsnDeqvuC5SDzoXiLSJW5qFZd40MiC+iM8PtOHbzFRiAtBvbBuS8S7RjvXQXgs1J7G5cU/jsLMntAZAPelpzSbyPrE4bHdBaaFqOKtZX4ottUaUdCi6B1M0QquL/0LPgklwAHlcOv0oHz9v9yzs8P6zImvNu1bWLmKNVwhP2HOVvjhWQywRDqfLi2R374h5fYRQ6emElGI9MTcOpL4r/mNRgkRy5rHkDJuSsVmoP43GKIr6eKHcBoZlDRXLBDFrFqhuxbv8W+6aBhOR857WO7NkXb8jANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDVXkc5l7vN4xpmimSvaWDx+z70LSHrN8cT7EPl4Dwg=;
 b=HfOVm4VFrXLKLGh0kbn1tcClnWBt0ThH9AlQF56q0DxcYRSiEktWB44cpZwkWLR0skduoRJJUfNbqHHfcYf9vM1rkkXcoIwK8cP+VfHX9rOY7UO0YyGcEumxLgrjqYVflW3Byelte8ftbRxK00q2yA4gOifAm5OCr8dtvxHB14pMaedFANgZsGLckuoD3KrOyoldwWNfNhs32yqhYjowQDPr8aX6zn8hjwUxWPGHq0kbcDhjW2KEsQFT5cacKJdCOZGujC5GFpykuQcTiWpQl3mLxCdX2Bs5PSFmvFi2PTnEHRUREGhBZegxYabSwI4+QXhEXasoMtPcNv00zTZY3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:39 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:55 +0800
Subject: [PATCH 08/14] drm/imx: dc: Use TCON operation mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-8-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fa1853-35a2-4aa1-23a5-08ddbad9aa8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHpnWnVMNjlsaWM5N1VVV1NkZW45WjRhNnBIU2M1Y3hoVFR6SVlUWlNKOVJm?=
 =?utf-8?B?S2phbXFnQW02WUxoRjZtcktkY0w0SWNrNzJabWUzbWpud0I2T2pKMlg5WFJE?=
 =?utf-8?B?a3JEZkZ6V0hmaFhnd3c2cmxYR0JiZVh5ZXgyQUxkNlpndm1jcFlheFl3aVJQ?=
 =?utf-8?B?UmNMWGpVdXpPT2J0bEJ2VzJ6VXc5ZlRWOUJ0YnhORVFvdGVSYjRHdUdPcDB6?=
 =?utf-8?B?WDAzNCtSckJ3U0xDSlJSWi9ocis1UXhFVVBaSDFkOHl4d3JHTzBEVnc2WDhI?=
 =?utf-8?B?R1BCRldQU1VhRGVYd3dacGZhOUR1RTJWWE1SdE9IK245THpLRDBhdWI5ME1I?=
 =?utf-8?B?Tm50YTFpelVlTXBOUFNrZUltTmV2RGQxUXduQm5tRFpZYkE3aG4zVWJvclpj?=
 =?utf-8?B?dTk0MWZZY1BtQVNMV3RScVE4QmwxeE5mVGJuZjc1b1BLQ0lvOG1TcjNrM1lP?=
 =?utf-8?B?cHo2RmRKUFlYaEZEMjRIRWVlWUZ4M04rVFFGSk0rYWNYZFBNQjB5VVRiTDdq?=
 =?utf-8?B?OGhEUytwNXNTL3VTMDl3bktlVExJS3dYMVU5V0JONDJuN0I5ckRobXE0cGhF?=
 =?utf-8?B?Z3FLZHl5VzlSYmFneE1NWUtTdUM5UXhiL0VxRDhPVE9ZaUszaWYvczhpVHVx?=
 =?utf-8?B?QXMxN1lEQjZEQWY3bE4zRWlnd21GLzljbUw2UGl3bmF6a2pYYldZRURJSUlp?=
 =?utf-8?B?djh0VEhPWkNWdDlFM2c5a2N4T21CY0w2N3NwOEQ0UUFTOWtZdjB4Z2pybGVU?=
 =?utf-8?B?cFF6Ym5UbVRGTWVKamx5bis2a2lhL1dhUWJQMTBpWmlEOWh3dWV5QnlRMy85?=
 =?utf-8?B?YzRZREl6Z1dIL0N1ZEYyMElBakFKWGw2Qkc1NllxMisrNUVMbWxtMW9RNHls?=
 =?utf-8?B?a3dKZzAwSHZYWnZ5aXk0bXQvS3QycVBYeEtXdVVIWGxFQWFtMVpzQ014R3Ba?=
 =?utf-8?B?T3YvTEduR0lIMytGMW9NNlpyWW4xUjJuVkhvdWRKbDhwSFMwMTMxWGtabWRm?=
 =?utf-8?B?TFl4clh3L1JTcE1xUVJWRHc5RENvZ2xPUWVRSlp3ZTR5aG9XYVNWeGpibTBm?=
 =?utf-8?B?NWwrU0JJZTY2NVNQdXFjR04wcW4wUE9pQ2NVWGpnZmlBRElITXczUzdic0tx?=
 =?utf-8?B?Z3IrZWN2N1JKdVV6Qko0TFYraWFVQ2ZXNzNRYVQ3ZUtCUitCM25LZWFhZ0la?=
 =?utf-8?B?ZlhZYUxoMU05VVRncWZBb3V2RWNLRk9QYXpLZ1RMMHZIM29HWTY1eDdJeml6?=
 =?utf-8?B?SWRqYmYxVC9WK1hLbXZNMC9SajNkc2FKWXFGeWNFS2VqV3RyZCtLdlJ5STZC?=
 =?utf-8?B?U210TXArUFdmcEIwVHNGRUpVd2hnb2tSN05JMHNQU25IM1FTSTR3ZFBPWkhX?=
 =?utf-8?B?VVVyNUdtdEorbDNIZXhTaTc4MkVNc2NsSjVJT3pyTmlOQ2ZzZmZHN2JKMEQ2?=
 =?utf-8?B?QnZTQk1Kb09TajNDaVZXZS9zRFY4bGVLeGIzTVdpZUJRaDRFdFpYc3lhbzNw?=
 =?utf-8?B?VXN0aFlGTEVtTjM1bFRVZ2dvYjNyQTV6VjNCa1hkRC9QRjh5S3QxU2xUdjV4?=
 =?utf-8?B?OVVJVGszeUNoQWYvUVZwcEpRYUVlQld1TllEemZOTFBVNkVETmZDSFQwWmFi?=
 =?utf-8?B?YzVoanJSL2FjYksvcmlmQ3puTzkrTzcxdlMwRHBlNGRpcHVPYldKNlFSMDcz?=
 =?utf-8?B?OCtrRWIwRTZWUy9nMHJacHpSZTgyb0ZOazdzamFVWmsvMTJrSDF6aHZ4Q1hj?=
 =?utf-8?B?NlJQd2l3ZjhoZW9oSjhhYjBxc0NIRXhUL3NmSU9zMjVjR2hDRXIwYWlVQUNj?=
 =?utf-8?B?cXY4VzJITys5TDBnT0wwRWVVdnlFTFRlQWZLZFZGRTRuZ3VzZ1FWcUx6Tk96?=
 =?utf-8?B?dnloa1hDZkJKVGppb01mL0RLMlRoNkU0d21LRkMxNmpMYTJHVWFtemlsTVlm?=
 =?utf-8?B?cnpldFp5aFVOWnEwbHlsTzZmdEYzbmhjSEVyYmw3VzFySGwzQkdMVFhMN2NL?=
 =?utf-8?Q?LiU+ybWP8KRZ0lZe49FUrZWD06Ax1Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBPbkZpZUNDZXY4YlhWNlJyS21BbmNFYWc4MkZNN0hOMkhna054SndWRWZs?=
 =?utf-8?B?bDlTMS94eDVWUURLNXpadHNRb2VEWXlLVGdDcnZvNG5ScU0xa2Z2NFBzSTN6?=
 =?utf-8?B?bVN1YWRsOXNBZWd2NE1CUWNGVnFpNlk4aXR5Mjc0YXkrNStpOVRLWi9GN1lz?=
 =?utf-8?B?SUlqMFRGY2FhTDE1WlZYSFZpWmpQZUkxVnhZa09QZ2gyVUFxeG16QkJKZkJw?=
 =?utf-8?B?TEpjcVBYT2FFVWJUcDdYeDhUV0dTR3g5aG9mcVV1Ym1CY3EySzVsTHRSaEtr?=
 =?utf-8?B?YlFwMFFucERpSnFIQ2N1RlRrbk5yOVRDUXJUWWJSKzZLLzV1a3NaQ1Uxd3NV?=
 =?utf-8?B?UjJhRklIcE9QWjltREx5Rm0rVkVWajdaWDUyWUxscHliakZNNFNqbjZYaE1N?=
 =?utf-8?B?SVpVcU9Xdzk4dUpTWUtMdWRvOWxzT2ZEUDdaa2ZCdXZEcjFCZXcxTW9CbmVM?=
 =?utf-8?B?enRPV3VzR1FpV0VKU291S2JDWUFlVWFMUTU2TStzeit2U2RLbm9oaW8vZk9Y?=
 =?utf-8?B?Ui9ESjEyazN4Y1VuRmhqRkYzMFZkWDlIT3AvVm9lODB6TGJhZmVhMTd5eVdi?=
 =?utf-8?B?b2k4QzFMYk5OYWc5NkFDak1wdEtNeXltZjNmbHVYVHZjQlF0MVo0V1FxTDkx?=
 =?utf-8?B?TjVMbWZJY1QwNzlmNjVSUU5ycWJhMmVSdDRoVldySlpSQ1J0WldEbVc2ek80?=
 =?utf-8?B?cVZQai9xYUZqYWY2bDVDMTZ0K3J2SXlGOHdKR3VqZXo5M2Y4dDZVYk52bGNL?=
 =?utf-8?B?OXFhM2UzTVkyMFhlRjdXNSt3bGZjZGprVXByekpHeXJEdTUwTGYxVEk5cW5Y?=
 =?utf-8?B?NVczMWhJZEpsNFNPMm53LzVNeVpTeTExd3VTM1dLUjZWbEUva0tEU1B3WEY4?=
 =?utf-8?B?SURSZkJKcGRkS2tHSEdmNHJoNGp0ZFR3aVdyTk1IYXZ4S0VoNWVTUnFKU3ZN?=
 =?utf-8?B?SEhjdFl4dXFjN2gvdEpldExBd1dWR3J4cEphN0p6Um42bE5uSFhJblBiUC92?=
 =?utf-8?B?S2VOa1RvWStmcEFickJCMVhPWmIybGZlRUowWkJXa2k1Vmd5UTZSM29LcUpS?=
 =?utf-8?B?OW42clBBR20yd1ZsZTZiOEpWa29jQW1wZGUzWHNGeE14bmpQSmhNZmV6d2lp?=
 =?utf-8?B?a3duSlIvYnJLak9XcmdVa3pYZkZ3c01QLzB1M09aQ0dhUWt1VlRyUWsvOTVV?=
 =?utf-8?B?ano2VkVCY1lYQ0NkcEVMRnhwSmIzWTZrZEd3VmVDcHRzZHMweW00bVlCYmw4?=
 =?utf-8?B?bUNNTS9CbU9BOVRReTRMamRwUTNqeG5MN1hMbFZyMkJXUE84dkJ3YVBGbElO?=
 =?utf-8?B?d3VqTFB5a2k5Y0VxRUFFUFNYOE02dFBwT0d1TkNFODRtclpJRFdKZmI0SitZ?=
 =?utf-8?B?TTRRZjNNaG9qSHVWbzQ5Y3RQNFdZSXJIS3RHaGowOFp1aVpNdjVJZm0vb1g0?=
 =?utf-8?B?SmN6WUFJY0pZQTlQcy9yMGJTaERhOUh6RXUzQnd3djZOTGNpV0FvVDRDQ014?=
 =?utf-8?B?Q25vdGdsSlVXRm53K0w4TC9jelVsWGRDL2JJSUNtRk5kaXptK2I1SS82MW1N?=
 =?utf-8?B?YTFocEErdWRqRkgrcm4xOW02aVRCNUhmY0JDL1pYQndrbmZNLzBqR2hCNnVF?=
 =?utf-8?B?SStqM1FJd1llNXFpMlBWeTRIWWpPcnBmMy9rZzhiUjJKNnRFM2JKK205bDBN?=
 =?utf-8?B?NGZscFlEemVXTVhuWk1QYktmSU9ibmN3SDM1MjRaaE9RSW8vVVFTTlBFcmNl?=
 =?utf-8?B?QTFpa3c3TUJ0dy9EYVBtbTdMSk04d0thOS9OOWFHSFpoUTR0VTJaRm1jZkw0?=
 =?utf-8?B?bFRoRU9vR0hsK0txTUk5YzltcXMyWEswTG9QQTJDYlpEN3h3NG5mWFNYUFNQ?=
 =?utf-8?B?eUQyWEZFUVNYTGlSak1JVHk0eFBJVjQ3MDVJdC93ZXVXN2wzLzB6THF3RWVy?=
 =?utf-8?B?MzhEMjYwb0h2WmFaSHArT1BWd1dSd1NCTktHeXpJL1ZrQ1p0NmY2RisvcGdM?=
 =?utf-8?B?bG5DZDVjSi85VktjR2g1VzEwVTJsbUhRc1ROUjUrbDJDbldmTEpiQkt4OTgz?=
 =?utf-8?B?Z3d5R0NhL1JhempEbzRmQWhMbjJib3p1ZXRTUE5QMk9NRWIrd1NObXcxa25S?=
 =?utf-8?Q?R2HMbAX59MFbMFWIlzHcZyrny?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa1853-35a2-4aa1-23a5-08ddbad9aa8a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:39.0071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcy81Ar3SFKKLMZHI3NHGt2fPrV3tCI3nrnY+uRqAzp8ZQeDk7RQDiw0fhQa06QpHzhnx6eviJMHClxUHwJhqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

In TCON operation mode, sync signals from FrameGen are ignored, but
a much more customized output timing can be generated by the TCON
module.  By using TCON operaton mode, generate KACHUNK signal along
with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
a synchronization signal inside the prefetch engine(DPRC + PRG(s),
attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
operation mode when CRTC is being enabled so that the prefetch engine
may evade the first dumb frame generated by the display controller.

Since TCON BYPASS bit is controlled by KMS driver when doing atomic
commits, drop the bit setting when initializing TCON.  This also
avoids accidentally initializing TCON BYPASS bit to 1 when driver
module removing and re-installing where an upcoming patch would
disable a CRTC at boot in TCON operation mode if needed.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
 drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
 drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 142 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7..9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -6,8 +6,10 @@
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/interrupt.h>
+#include <linux/irqflags.h>
 #include <linux/irqreturn.h>
 #include <linux/pm_runtime.h>
+#include <linux/preempt.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
@@ -68,6 +70,14 @@ do {									\
 							__func__);	\
 } while (0)
 
+#define DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(fg)		\
+do {									\
+	if (!dc_fg_wait_for_frame_index_moving(fg))			\
+		dc_crtc_err(crtc,					\
+			"%s: FrameGen frame index isn't moving\n",	\
+							__func__);	\
+} while (0)
+
 static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct dc_crtc, base);
@@ -229,6 +239,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum dc_link_id cf_link;
+	unsigned long flags;
 	int idx, ret;
 
 	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
@@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	enable_irq(dc_crtc->irq_ed_safe_shdload);
 
 	dc_fg_cfg_videomode(dc_crtc->fg, adj);
+	dc_tc_cfg_videomode(dc_crtc->tc, adj);
 
 	dc_cf_framedimensions(dc_crtc->cf_cont,
 			      adj->crtc_hdisplay, adj->crtc_vdisplay);
@@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
 	dc_fg_shdtokgen(dc_crtc->fg);
+
+	/* Don't relinquish CPU until TCON is set to operation mode. */
+	local_irq_save(flags);
+	preempt_disable();
+
 	dc_fg_enable(dc_crtc->fg);
+	/*
+	 * Turn TCON into operation mode as soon as the first dumb
+	 * frame is generated by DC(we don't relinquish CPU to ensure
+	 * this).  This makes DPR/PRG be able to evade the frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_tc_set_operation_mode(dc_crtc->tc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
@@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
 	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
 	dc_crtc->fg = de->fg;
+	dc_crtc->tc = de->tc;
 
 	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
 	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
 void dc_fg_init(struct dc_fg *fg);
 
 /* Timing Controller Unit */
+void dc_tc_set_operation_mode(struct dc_tc *tc);
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m);
 void dc_tc_init(struct dc_tc *tc);
 
 #endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index cd7860eff986a272f6983ad0f3cc87dbf40c2851..a25d47eebd28792e4b53b4ecc89907ce00430c2c 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -50,6 +50,8 @@ struct dc_crtc {
 	struct dc_ed *ed_safe;
 	/** @fg: framegen */
 	struct dc_fg *fg;
+	/** @tc: tcon */
+	struct dc_tc *tc;
 	/**
 	 * @irq_dec_framecomplete:
 	 *
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea15444c399f3ad261e2d061ea1c9f..6f1dc71f1b40cb4d99ca177172bd0066f39e8314 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -9,11 +9,30 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_modes.h>
+
 #include "dc-drv.h"
 #include "dc-de.h"
 
 #define TCON_CTRL	0x410
-#define  CTRL_RST_VAL	0x01401408
+#define  SPLITPOSITION_MASK	GENMASK(29, 16)
+#define  SPLITPOSITION(n)	FIELD_PREP(SPLITPOSITION_MASK, (n))
+#define  DUAL_SWAP	BIT(15)
+#define  MINILVDS_OPCODE_MASK	GENMASK(14, 12)
+#define  MODE_4PAIRS	FIELD_PREP(MINILVDS_OPCODE_MASK, 0x1)
+#define  LVDS_CLOCK_INV	BIT(11)
+#define  LVDS_BALANCE	BIT(10)
+#define  LVDSMODE	BIT(9)
+#define  ENLVDS		BIT(8)
+#define  INV_CTRL_MASK	GENMASK(7, 4)
+#define  BYPASS		BIT(3)
+#define  TCON_SYNC	BIT(2)
+#define  CHANNELMODE_MASK	GENMASK(1, 0)
+#define  CTRL_RST_MASK	\
+		(SPLITPOSITION_MASK | DUAL_SWAP | MINILVDS_OPCODE_MASK | \
+		 LVDS_CLOCK_INV | LVDS_BALANCE | LVDSMODE | ENLVDS | \
+		 INV_CTRL_MASK | TCON_SYNC | CHANNELMODE_MASK)
+#define  CTRL_RST_VAL  (SPLITPOSITION(0x140) | MODE_4PAIRS | LVDS_BALANCE)
 
 /* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
 #define MAPBIT3_0	0x418
@@ -25,6 +44,16 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
+#define SPGPOSON(n)	(0x460 + (n) * 16)
+#define SPGMASKON(n)	(0x464 + (n) * 16)
+#define SPGPOSOFF(n)	(0x468 + (n) * 16)
+#define SPGMASKOFF(n)	(0x46c + (n) * 16)
+#define  X(n)		FIELD_PREP(GENMASK(30, 16), (n))
+#define  Y(n)		FIELD_PREP(GENMASK(14, 0), (n))
+
+#define SMXSIGS(n)	(0x520 + (n) * 8)
+#define SMXFCTTABLE(n)	(0x524 + (n) * 8)
+
 static const struct dc_subdev_info dc_tc_info[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
@@ -33,6 +62,8 @@ static const struct dc_subdev_info dc_tc_info[] = {
 static const struct regmap_range dc_tc_regmap_ranges[] = {
 	regmap_reg_range(TCON_CTRL, TCON_CTRL),
 	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+	regmap_reg_range(SPGPOSON(0), SPGMASKOFF(4)),
+	regmap_reg_range(SMXSIGS(0), SMXFCTTABLE(3)),
 };
 
 static const struct regmap_access_table dc_tc_regmap_access_table = {
@@ -47,7 +78,7 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
-	.max_register = MAPBIT31_28,
+	.max_register = SMXFCTTABLE(3),
 };
 
 /*
@@ -60,10 +91,85 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+void dc_tc_set_operation_mode(struct dc_tc *tc)
+{
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, 0);
+}
+
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m)
+{
+	int hdisplay, hsync_start, hsync_end;
+	int vdisplay, vsync_start, vsync_end;
+	int y;
+
+	hdisplay = m->hdisplay;
+	vdisplay = m->vdisplay;
+	hsync_start = m->hsync_start;
+	vsync_start = m->vsync_start;
+	hsync_end = m->hsync_end;
+	vsync_end = m->vsync_end;
+
+	/*
+	 * Turn TCON into operation mode later after the first dumb frame is
+	 * generated by DC.  This makes DPR/PRG be able to evade the frame.
+	 */
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, BYPASS);
+
+	/* dsp_control[0]: HSYNC */
+	regmap_write(tc->reg, SPGPOSON(0), X(hsync_start));
+	regmap_write(tc->reg, SPGMASKON(0), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(0), X(hsync_end));
+	regmap_write(tc->reg, SPGMASKOFF(0), 0xffff);
+
+	regmap_write(tc->reg, SMXSIGS(0), 0x2);
+	regmap_write(tc->reg, SMXFCTTABLE(0), 0x1);
+
+	/* dsp_control[1]: VSYNC */
+	regmap_write(tc->reg, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
+	regmap_write(tc->reg, SPGMASKON(1), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
+	regmap_write(tc->reg, SPGMASKOFF(1), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(1), 0x3);
+	regmap_write(tc->reg, SMXFCTTABLE(1), 0x1);
+
+	/* dsp_control[2]: data enable */
+	/* horizontal */
+	regmap_write(tc->reg, SPGPOSON(2), 0x0);
+	regmap_write(tc->reg, SPGMASKON(2), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(2), X(hdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(2), 0xffff);
+
+	/* vertical */
+	regmap_write(tc->reg, SPGPOSON(3), 0x0);
+	regmap_write(tc->reg, SPGMASKON(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SPGPOSOFF(3), Y(vdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SMXSIGS(2), 0x2c);
+	regmap_write(tc->reg, SMXFCTTABLE(2), 0x8);
+
+	/* dsp_control[3]: KACHUNK */
+	y = vdisplay + 1;
+
+	regmap_write(tc->reg, SPGPOSON(4), X(0x0) | Y(y));
+	regmap_write(tc->reg, SPGMASKON(4), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(4), X(0x20) | Y(y));
+	regmap_write(tc->reg, SPGMASKOFF(4), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(3), 0x6);
+	regmap_write(tc->reg, SMXFCTTABLE(3), 0x2);
+}
+
 void dc_tc_init(struct dc_tc *tc)
 {
-	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
-	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+	/* reset TCON_CTRL to POR default except for touching BYPASS bit */
+	regmap_write_bits(tc->reg, TCON_CTRL, CTRL_RST_MASK, CTRL_RST_VAL);
 
 	/* set format */
 	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,

-- 
2.34.1

