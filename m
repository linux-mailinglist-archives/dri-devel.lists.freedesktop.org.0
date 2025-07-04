Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC9AF8D49
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA610E9A6;
	Fri,  4 Jul 2025 09:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MSgO4LHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011044.outbound.protection.outlook.com
 [40.107.130.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F2210E9B6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faNnqqwnzCH/ru7pKVzyTs51MlP+WaHPZpC50vLFmvcZ8twoFqXyalG5X7gdMVcrYdbAfqYDfIJQhNYPQS5b2dWJRyLWssr7Ifda2YG06znaICcoOV+o1WCa/UKiVBT0WZepjNC51gJ5z1fFf3wP3DGcBxZpy+PsHFXBZ0zVeIXOsYBFL6jbxtD7/lRvkUdthv9+BxGE4fm3u9ne3uPED1WIoqgnENKpcWOLYTN2pbL0WLVIN1IOtzZwpB4NadXnr3h0WKMasO0N9u2OWmf9sYTVCW95Ac0QuNHR+n+cOGc4+VzQ5SUrsiXh/a26atBbxbAY68ahgfvOVCIFtg1BHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WTaqf76v87IIjBFho62qTnrvpeIQ088HC67dha3BaE=;
 b=Z7uXMOhL2VpCUxxB4czH1pHSh9zIgdwpo9dLatlXhTv+4Th+qTq1CGfyRboBC78E6jLdhDfAmfvVsF4D16F0hrLvZZ17+dzeurnHxwbegaCSwRxTzspQVHt+aRY7buXxBj63cm4wZnv/IqyUmz5VH+VnAY6fw9Tmj/HFgWUEk53C+6penNq3hSgEKoNgRSO/o+fUrpuYqpy6FoCrj2E9Zf37oE6wpWtghgkpIkQBpES3lL6DGC/qBpzE8uY3dWxZYMRExC3OqMAXaF8WbofMXG83EUf/kgySV599nqe+kE2FacLrYNpBuFRWHfLVdqt9b6YZqrKq8tfERuTcVSe5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WTaqf76v87IIjBFho62qTnrvpeIQ088HC67dha3BaE=;
 b=MSgO4LHBaZYGrMyUBPn/RvmxLvuD0O77JMwDB4+k+FFFUXqobRS1zp4LJKXCyigNP6U+4QD40TJ2vQM0YCjT9etBxsbwMPgsN/yH9CvlR9SABlzFMKDucLXhmYZY732VTK1kOF7EQQyX5e+b0D00ScHGGQLQwWkh5aNIKIKCXe4LFRet/6DR7efn0oGREcd73tO0ABuP16YGJS5UVqESvaOp/ghn0bs6vPw/23ieWJt9yOtgc8YF6hX5+Bga4YeTz9kb7kHqxPuvSq+k24C03Dvo6wyafrsXrY2lx36QT9heQsiRp2PQ4lMbo5qVl3rMzpBUfCHgWhf41ZGrFavaUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9301.eurprd04.prod.outlook.com (2603:10a6:102:2b9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:15 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:51 +0800
Subject: [PATCH 04/14] drm/imx: dc-fu: Fix dimensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bee021-f277-40cd-f579-08ddbad99ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNzZmxrMXRqTUZUYjlGUmY1RXBiSmVlTmRCVnRvVzBCVTRUQ3JMeHhZME1W?=
 =?utf-8?B?S0FGOEcrVDRGcGIvT1Uwa3pTYWxuY1JGVnVoWmVBTW1VaXpCeEd2Rzh6MC82?=
 =?utf-8?B?QUk4emR0YlhFdlVZU1QzY3hWTlVnWTFWbXFOYU5jWDF5SHd2dEJrSms5a2Yx?=
 =?utf-8?B?MlViWk9XeDF3dzRFbXhaOU0zNjRkeE5Bc2dEL3BGRTVyMjdTVXpPMExSdXlm?=
 =?utf-8?B?dlRUMFZBZUdwdDdTQndDOHZ4UUVCcnoxZHNmZGtjeXN6azdkVVJjS3pkOFFz?=
 =?utf-8?B?NkRwNGQ5Zmx3OVRuSjErWnowbVVkRE5ob0tYUnNQZ1JlRU1ldjRYVFBUMzhP?=
 =?utf-8?B?dmc4ZU91NDlsSitwbFlEWjhJKzgxWlhqdUxac3N5WEcwQWpGZ0Z3cit2YnFz?=
 =?utf-8?B?NTdONGFnTnVQWDJxQlVJeXdBRGRkT1F4TW5icllKQ21KZ1ZZTzZpU2N2allr?=
 =?utf-8?B?ZUF4aE5KVlI0OEl6UmJwNFhzTDFIUmdOamcreVowMEZVV2hBQURibUhHQ2k3?=
 =?utf-8?B?azNQTDJYWkp4MnJZK0FkQ1lTTXhqNy84Wk4ySzVzeVF5eUNVdncrRnZsSWtu?=
 =?utf-8?B?Um50MXhlRFdQaGZSY05Ic0hjWFF0VkdFT0RjdlhlMGVmYm5YMHltVm9PeVdo?=
 =?utf-8?B?eUhFcEdORyt0YTV6ZzlkNDRXa1Y0NTUrU3BvU1RER3lrVDdDd1UxdzdLM2Jv?=
 =?utf-8?B?bytLdjd3QU1vNUF4eTZlVjNqbDlFekEyTjJyMlRZREVYTkRyQ24ya29Mb01y?=
 =?utf-8?B?and1a1pYR3R5OVRKNXVNdCtTbThPaitIMFNidXEyOHRXcTBwVXFJbjVIaGQ5?=
 =?utf-8?B?dytPc05IR1ovVFFBcTJ5bkVNRzdKMHB6dXB6aG44Rm1aR21UbmExdGpOaFd6?=
 =?utf-8?B?K2Q1Nm94cDdaQjdGekVhNFhSdXRpNlBGckR0cGdzdlZmcC9MTXVRUjZSYnkz?=
 =?utf-8?B?ZllwdEhrK3N4M202WkdiQzJVRTVTc3B1NUpYOEIvM0ZFdStuWG5PMzJROStT?=
 =?utf-8?B?blI4RW40ei90TXFGb3daN29qbmJicE0rTm5tME1uRE4zN0djcDlRWnRZZHho?=
 =?utf-8?B?OC9QdTBQdHdKZnJVcnlwTStTSGFzWDNmS2w0anNQck1GMHIxdVdrcjBaamt6?=
 =?utf-8?B?MnVvZVpaZkFpNlBCTk9Jb3U0WXNwa21nc295MnAzSHU3bm9hdllDTlA1ZE8y?=
 =?utf-8?B?RWNFaXZ1WDhrRk1KUzlUNUlkUldTcEVrd1BSWnp2U1VyRHowcDJ0QzZrNHhE?=
 =?utf-8?B?QlhncEN0S2FRelpkRVkyZnloU2dlVEN1K1Y1Rk52YkFWRDkwTkpmdmdTSmpp?=
 =?utf-8?B?WkxWZytIcFdmeWtadmRadnF4YUw2SnpYQUt3RlhFWk4rbGJzdUpCdCtBVkxY?=
 =?utf-8?B?VEVKYi84bm1uMkthQTc1Y2FKTnROVENFL1JZUTFYOGhOeTh1OW1ScDNxWDUw?=
 =?utf-8?B?aHNyYm1WRmovWmJBQnlsdjdWNlVhaTZNVmgySThCN2JFRWFMRGw1WkJKSFNy?=
 =?utf-8?B?YlVyRHFrSnlENUhzazZLZmRuR3ZadUZRZzc1dHBzS1RpUHNKNHpZNjl5eFgr?=
 =?utf-8?B?Ulh6cjJWc1ViV0krOU0wcHZiVzI5NWJNems1M3ZnaERnQk1OWndBMmxybVFK?=
 =?utf-8?B?UzlXMGlHZW5ONVlqRmkwYmw0L2xNRjZkenlVaFgrakZFOGt6OTNnRTdtbGN6?=
 =?utf-8?B?RlVObWxUTlpCMEtHTTMzOUVoY005THNmYWlkTDc3cHhQeVpuZUJBbkw3TlBR?=
 =?utf-8?B?NVMySnAxUExFV1NDTXdoaDFibEJtam93WGdheXV1ekJhTWs2N0ppdTlQSmlJ?=
 =?utf-8?B?b3pwb2VHRFdoZWlrOCtzSjFFZjVwanpGcXFIa21KZG8vdk0yWGdQcU5JRXBk?=
 =?utf-8?B?OFVOMDJXdzkxT0oyUGYrdTRLbVVsWWF4Yi9qenZZVThoZ29WYWdVV200U3F2?=
 =?utf-8?B?eGhsUVhrOTRxSUxrSGY0K1MxdU43ZGxNTFVKMFlISVUyNW1KaS9vU2JxM0Yw?=
 =?utf-8?Q?FhH1VqXUnE9Dt2P2aYg4kBL0WubUIU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkdadG5NSDdxZ2dObjNEY2svcmwzK05saVNBbzY3TDVtdVBkcUNWT3Q5QVNk?=
 =?utf-8?B?RW1ENCtaV0FKZHp4VXJ3M29KWHdQV1lmNlhkNUtrVXlWWkJ2ZXY5MVlQMEZB?=
 =?utf-8?B?RUxTTTMyTDdKbC9OVHRzaTVtTDFkTTRUbTVGS0hDQzQwbkZmNERGc2Z2RTRu?=
 =?utf-8?B?MUJCQnpWd3p5L0R5WGovb2gwYXpsYnJLQkJ1aEI5dDBLZDFValZuZFNVVEEz?=
 =?utf-8?B?M2FUZ0JLeUVzQjVGOWFXaUhsVHRybzNGS1o2TDVFRUlORGF1UXREU0FuQWRS?=
 =?utf-8?B?ZEtjNXNXZ3FuNmkzSWJreGlMOTZ3RkZaS3pNK25SUlhadFIyTmlJK3hTanZF?=
 =?utf-8?B?VjNhV3VNMVNLdSs1K2Fzc1kxc0dzY0p4QndMN1ZFb01ZaFZoSjgzZU4xWlQy?=
 =?utf-8?B?ck1SeURWbk5YMVB6dnhoUWVKeEo0YTFmSXZ5ZVh5UjFCc0dZaGNLWHZrNGdN?=
 =?utf-8?B?TjlvNDVLemYrTGVWQThrejhuM3dURHE4TnVodUp6SE9DbFhST1c2WWdodDdy?=
 =?utf-8?B?Tlg2WXZLNTRKcXF2MTJqZVlqd1VCUm82QkQ2UVREb0c2RjY0WWhNUDNkNkZM?=
 =?utf-8?B?WTJ0TkFmbHUrTkNrTVhpMTdmNjQ5MlRhcjFJOWwvWjVwci9jd0tDa2Znenhy?=
 =?utf-8?B?bWI3OVh1aVIxZTJuZC90UlJmZ3ZOMTR2NXp0T0tUaWkzWDhJUlpqMzNlcG95?=
 =?utf-8?B?R3dRaUZYN09leGF1Zm0xMHJZcXloc1RBZitqM1c3Z003aUtzT2NLWFFQcUtO?=
 =?utf-8?B?SkRqTWl6WHkxME5kUDNpcU5YUll2aTJIc2JOa0dkSXFaL1ZmaHZ0ekNmRUtr?=
 =?utf-8?B?dWIzM3pFSlk2N3ovQ1VlZGp2QVA3a21NSnB3NTJDWTBGeHVjeDI3WU9aamV4?=
 =?utf-8?B?MmcyV1dmOWMxeWtVUmxkMHJwOTRrWERlYTJna2drdGlEVmFPejBBN3RqdEdP?=
 =?utf-8?B?QmZwWE9QdXorclU1SEl6NzRrUUk4Q29NeXAxLzBnWERwZVBnd2EzSGNzOEIw?=
 =?utf-8?B?TWg0S3Vsbzd5eWY5cWMvZlFCZmhrc0h3RmVPVGl4L0xIWTJQanJrbjVVOGph?=
 =?utf-8?B?WTVrd0JvM1ZlUGpjdGFCR25PLzV6RUJJeUs2WTdwVUxLWHg2N1BGRkM5Wkds?=
 =?utf-8?B?N0Z2ekw1dDN5MVlWTXVYUENmV2I1bmNybGJUNFlpTXR2SkgxVFQzRmc0bVRY?=
 =?utf-8?B?NGVLYkJyTGplUXZuYUpYRW1JSzRDamZnK1REckw4blZodk1nRWtxemphUXdF?=
 =?utf-8?B?R0s2Y1gxY3Rta201VGlQQU96cTJpNG4yL1VWMWE4QmVPQ1JJcHlldGVFY3Zy?=
 =?utf-8?B?dUVxU3Z6REZ1OVZ0YXFnRmxSU2J4enlDNmVjazhDRnVhakI3U3pFYTlFcGsy?=
 =?utf-8?B?VjloMmZJYVNLRkt1OTRsUFRpRmN5V01NTGsyYWFPNzMxREN2clp4VENjUFZN?=
 =?utf-8?B?Y1AyTmU1dWNkbUFuYVhXUUFGbzhQUjR4OTJCakp4Q0lJQllMeTZUZFNvb05a?=
 =?utf-8?B?V25yUkFyUk1TdVorQ2lFM3diSWVCRWVJd0JwQWJyVkVvbCtzbFRNZTVwbVVk?=
 =?utf-8?B?NkRmck1SMTZ1T25yaW1ncVp2SFJyMFMzMWlNUmZYc2NnZUpCemVuTkQwN3d6?=
 =?utf-8?B?ZGJlaC9YQTFuUjdqMFdSbk11NHh3UzhXdjE4SmJsemk4R3ArRXJzbjJaMFVi?=
 =?utf-8?B?NjR0TTFxaStudVh3dlBocTA3cVBOajRoVVAxbk5Dc0k3Rnp3WVlWVmdmQnJD?=
 =?utf-8?B?c3k0bENuelc1K0FCWWtLTGhpZE1tWldKa0NPQWxnTUpEbGV6eExxQm9relBk?=
 =?utf-8?B?SnRvOS8vMU1MblJldXRUTEJkWmMzVHpUVHRhVWozVTIrRE9maWxWdHJkbEhU?=
 =?utf-8?B?dndVcjAyUjdZMVlZblBJSk5zTHk0WkFtTUhkeFdrMytjRGJLaWlsMDZGbmkz?=
 =?utf-8?B?VElkUnVGYXBXazhUbDNXQXVYZTd0MjgwRVpWb21QU21UbWJUOUxkcEIxOXhk?=
 =?utf-8?B?SExRQjBZZ3Nzazd1cllNSW40ZDJ0RW9VSUJaa1VFV1AydlRWczZGWWZsTS9G?=
 =?utf-8?B?eUJHYVA4bndZMXBsQ0dybDdXNEd3b2JxYTZtV3dUTDRjaC93WUpjV3hJKzFK?=
 =?utf-8?Q?aZXHgVds70SJPeSLXGb8A4u4Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bee021-f277-40cd-f579-08ddbad99ca0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:15.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Myfi7jwj22MOog3p1K43uuF2h1B0iNQiphvYkFrDzByNxZw8HgJm9Mdk0nT6NoT6ojLmBcF8r3wiNwAXRQBnEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9301
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

Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
macro definitions.  The first two macros are used to set a fetchunit's
source buffer dimension and the other two are used to set a fetchunit's
frame dimension.  It appears that display controller itself works ok
without this fix, however, it enters panic mode when prefetch engine(DPRC
and PRGs) attaches to it without this fix.

Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engine")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
 drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b65ebbb5c29f978c 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -31,8 +31,8 @@
 #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
 
 /* SOURCEBUFFERDIMENSION */
-#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
-#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
 
 /* LAYEROFFSET */
 #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c2e80abd7e962120 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -38,8 +38,8 @@
 #define SOURCEBUFFERENABLE		BIT(31)
 
 /* FRAMEDIMENSIONS */
-#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
-#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
 
 /* CONTROL */
 #define INPUTSELECT_MASK		GENMASK(4, 3)

-- 
2.34.1

